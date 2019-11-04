Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95425EE3AB
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 16:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfKDPXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 10:23:52 -0500
Received: from mga11.intel.com ([192.55.52.93]:47386 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbfKDPXv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 10:23:51 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 07:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="191781340"
Received: from hbriegel-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.55.106])
  by orsmga007.jf.intel.com with ESMTP; 04 Nov 2019 07:23:49 -0800
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 59FA921FAF; Mon,  4 Nov 2019 17:20:17 +0200 (EET)
Date:   Mon, 4 Nov 2019 17:20:17 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] media: i2c: IMX296 camera sensor driver
Message-ID: <20191104152016.GG11844@kekkonen.localdomain>
References: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
 <20191031142522.GK10211@paasikivi.fi.intel.com>
 <20191104133351.GB4913@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104133351.GB4913@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Nov 04, 2019 at 03:33:51PM +0200, Laurent Pinchart wrote:

...

> > > +static int imx296_read(struct imx296 *imx, u32 addr)
> > > +{
> > > +	u8 data[3] = { 0, 0, 0 };
> > > +	int ret;
> > > +
> > > +	ret = regmap_raw_read(imx->regmap, addr & IMX296_REG_ADDR_MASK, data,
> > > +			      (addr >> IMX296_REG_SIZE_SHIFT) & 3);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return (data[2] << 16) | (data[1] << 8) | data[0];
> > 
> > Hmm. Don't you need to cast this to a wider type to avoid limiting this to
> > an 8-bit number?
> 
> The C99 standard states in section 6.5.7 "Bitwise shift operators"
> 
> "The integer promotions are performed on each of the operands. The type
> of the result is that of the promoted left operand."
> 
> Section 6.3.1.1 "Boolean, characters, and integers" then states
> 
> "If an int can represent all values of the original type, the value is
> converted to an int; otherwise, it is converted to an unsigned int.
> These are called the integer promotions. All other types are unchanged
> by the integer promotions."
> 
> No cast is thus needed.

Ack. Thanks for the explanation.

...

> > > +	/*
> > > +	 * HMAX and VMAX configure horizontal and vertical blanking by
> > > +	 * specifying the total line time and frame time respectively. The line
> > > +	 * time is specified in operational clock units (which appears to be the
> > > +	 * output of an internal PLL, fixed at 74.25 MHz regardless of the
> > > +	 * exernal clock frequency), while the frame time is specified as a
> > > +	 * number of lines.
> > > +	 *
> > > +	 * In the vertical direction the sensor outputs the following:
> > > +	 *
> > > +	 * - one line for the FS packet
> > > +	 * - two lines of embedded data (DT 0x12)
> > > +	 * - six null lines (DT 0x10)
> > > +	 * - four lines of vertical effective optical black (DT 0x37)
> > > +	 * - 8 to 1088 lines of active image data (RAW10, DT 0x2b)
> > > +	 * - one line for the FE packet
> > > +	 * - 16 or more lines of vertical blanking
> > > +	 */
> > > +	imx296_write(imx, IMX296_HMAX, 1100, &ret);
> > > +	imx296_write(imx, IMX296_VMAX, format->height + imx->vblank->cur.val,
> > > +		     &ret);
> > > +
> > > +	for (i = 0; i < 4; ++i)
> > 
> > It'd be nice to have e.g. NR_IMX296_INCKSEL or something instead of 4.
> 
> How about ARRAY_SIZE(imx->clk_params->incksel) ?

Yes, please.

...

> > > +static int imx296_init_cfg(struct v4l2_subdev *sd,
> > > +			   struct v4l2_subdev_pad_config *cfg)
> > > +{
> > > +	struct v4l2_subdev_selection sel = { 0 };
> > > +	struct v4l2_subdev_format format = { 0 };
> > > +
> > > +	sel.target = V4L2_SEL_TGT_CROP;
> > > +	sel.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
> > > +	sel.r.width = IMX296_PIXEL_ARRAY_WIDTH;
> > > +	sel.r.height = IMX296_PIXEL_ARRAY_HEIGHT;
> > 
> > It'd be nicer to set these in variable declaration. Same below.
> 
> It's partly a matter of style, but as this is a new driver and you
> maintain sensor drivers, I'll switch to your preferred style here.

It could be argued whether this is a (plain) style issue or not. Thanks in
any case.

...

> > > +			const struct i2c_device_id *did)
> > > +{
> > > +	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
> > > +	unsigned long clk_rate;
> > > +	struct imx296 *imx;
> > > +	unsigned int i;
> > > +	int ret;
> > > +
> > > +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
> > > +		dev_warn(&adapter->dev,
> > > +			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_BYTE\n");
> > > +		return -EIO;
> > > +	}
> > > +
> > > +	imx = devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);
> > > +	if (!imx)
> > > +		return -ENOMEM;
> > > +
> > > +	imx->dev = &client->dev;
> > 
> > You can use &v4l2_get_subdevdata(sd)->dev to get the device, so no need for
> > the dev field.
> 
> I could, but only after registering the subdev, and thus not in
> imx296_identify_model() for instance. I could pass the device pointer to
> that function, but I'd prefer accessing dev through a single method
> everywhere in the driver to make it less error-prone.

Fair enough.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
