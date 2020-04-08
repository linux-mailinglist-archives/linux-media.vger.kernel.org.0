Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1CE91A21A8
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 14:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgDHMUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 08:20:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:46344 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728530AbgDHMUn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Apr 2020 08:20:43 -0400
IronPort-SDR: 6RbGmhF8ppYBneAvGVWyZ5RJXzu+0ZSw35k1bGyqLUL/R2yBwXnYQ6Z3DVNUf1WvMEr7p5s3sx
 NxenPNdHvnnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 05:20:43 -0700
IronPort-SDR: EsGpVrBICzA9yNIzcqsXym6EkBtvPGS4UmV6Eypp1AhLxdwvFieP3v3RbENjyQF/kaPW5r+tIe
 4ict1+hzKhdg==
X-IronPort-AV: E=Sophos;i="5.72,358,1580803200"; 
   d="scan'208";a="425120463"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 05:20:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 45DDC20364; Wed,  8 Apr 2020 15:20:37 +0300 (EEST)
Date:   Wed, 8 Apr 2020 15:20:37 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     andriy.shevchenko@linux.intel.com, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V6, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20200408122037.GG5206@paasikivi.fi.intel.com>
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
 <20191211112849.16705-3-dongchun.zhu@mediatek.com>
 <20191211143640.GU32742@smile.fi.intel.com>
 <faf3482d4127464195d04a17cae446b7@mtkmbs05n1.mediatek.inc>
 <1586346824.8804.12.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586346824.8804.12.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Wed, Apr 08, 2020 at 07:53:44PM +0800, Dongchun Zhu wrote:
> Hello Andy,
> 
> Thanks for the review. Sorry for the late reply.
> 
> On Mon, 2019-12-11 at 16:36 +0200, Andy Shevchenko wrote:
> > On Wed, Dec 11, 2019 at 07:28:49PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor. The OV02A10 is
> > > a 1/5" CMOS sensor from Omnivision, asupporting output format: 10-bit Raw.
> > >
> > > This chip has a single MIPI lane interface and use the I2C bus for
> > > control and the CSI-2 bus for data.
> > 
> > ...
> > 
> > > +#define OV02A10_MASK_8_BITS                            0xff
> > 
> > Besides GENMASK() why do you need a definition here? What's the point?
> > 
> 
> Fixed in next release.
> 
> > ...
> > 
> > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > +   struct v4l2_subdev_pad_config *cfg) {
> > > +struct v4l2_subdev_format fmt = {
> > > +.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
> > > +     : V4L2_SUBDEV_FORMAT_ACTIVE,
> > > +.format = {
> > > +.width = 1600,
> > 
> > > +.height = 1200
> > 
> > Leave comma here.
> > 
> 
> Fixed in next release.
> 
> > > +}
> > > +};
> > > +
> > > +ov02a10_set_fmt(sd, cfg, &fmt);
> > > +
> > > +return 0;
> > > +}
> > 
> > ...
> > 
> > > +ret = i2c_smbus_write_byte_data(client, OV02A10_REG_GAIN,
> > > +(val & OV02A10_MASK_8_BITS));
> > 
> > Too many parentheses.
> > 
> 
> Fixed in next release.
> 
> > > +if (ret < 0)
> > > +return ret;
> > 
> > ...
> > 
> > > +static int ov02a10_set_vblank(struct ov02a10 *ov02a10, int val) {
> > > +struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > 
> > if you do
> > 
> > int vts = val + ov02a10->cur_mode->height - OV02A10_BASIC_LINE;
> > 
> > you may increase readability below...
> > 
> 
> Thanks for the suggestion.
> It seems better now.
> 
> > > +int ret;
> > > +
> > > +ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > +if (ret < 0)
> > > +return ret;
> > > +
> > > +ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > > +(((val + ov02a10->cur_mode->height -
> > > +OV02A10_BASIC_LINE) >>
> > > +OV02A10_VTS_SHIFT) &
> > > +OV02A10_MASK_8_BITS));
> > 
> > ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > (vts >> OV02A10_VTS_SHIFT) &
> > OV02A10_MASK_8_BITS));
> > 
> > And actually why do you need this mask here? Isn't enough to call
> > 
> > ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > vts >> OV02A10_VTS_SHIFT);
> > 
> > here...
> > 
> > 
> 
> Yes. Now we code like this.
> 
> > > +if (ret < 0)
> > > +return ret;
> > > +
> > > +ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L,
> > > +((val + ov02a10->cur_mode->height -
> > > +OV02A10_BASIC_LINE) &
> > > +OV02A10_MASK_8_BITS));
> > 
> > ...and
> > 
> > ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L, vts);
> > 
> > here?
> > 
> 
> Yes. Fixed in next release.
> 
> > > +if (ret < 0)
> > > +return ret;
> > > +
> > > +return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > + REG_ENABLE);
> > > +}
> > 
> > ...
> > 
> > > +static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10
> > > +*ov02a10) {
> > > +struct fwnode_handle *ep;
> > > +struct fwnode_handle *fwnode = dev_fwnode(dev);
> > > +struct v4l2_fwnode_endpoint bus_cfg = {
> > 
> > > +.bus_type = V4L2_MBUS_CSI2_DPHY
> > 
> > Leave comma here.
> > 
> 
> Fixed in next release.
> 
> > > +};
> > > +unsigned int i, j;
> > > +int ret;
> > 
> > > +if (!fwnode)
> > > +return -ENXIO;
> > 
> > A bit strange error code here.
> > 
> 
> This should be reported as -EINVAL.
> Fixed in next release.
> 
> > > +
> > > +ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > > +if (!ep)
> > > +return -ENXIO;
> > > +
> > > +ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > > +fwnode_handle_put(ep);
> > > +if (ret)
> > > +return ret;
> > 
> > > +if (!bus_cfg.nr_of_link_frequencies) {
> > > +dev_err(dev, "no link frequencies defined");
> > > +ret = -EINVAL;
> > > +goto check_hwcfg_error;
> > > +}
> > 
> > I still think it's redundant check, though it's up to maintainers.
> > 
> 
> We still wanna keep this check.
> Keep same as ov2659 and ov8856.
> 
> > > +
> > > +for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> > > +for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> > > +if (link_freq_menu_items[i] ==
> > > +bus_cfg.link_frequencies[j])
> > > +break;
> > > +}
> > > +
> > > +if (j == bus_cfg.nr_of_link_frequencies) {
> > > +dev_err(dev, "no link frequency %lld supported",
> > > +link_freq_menu_items[i]);
> > > +ret = -EINVAL;
> > > +goto check_hwcfg_error;
> > > +}
> > > +}
> > > +
> > > +check_hwcfg_error:
> > > +v4l2_fwnode_endpoint_free(&bus_cfg);
> > > +
> > > +return ret;
> > > +}
> > 
> > ...
> > 
> > > +static int ov02a10_probe(struct i2c_client *client) {
> > 
> > > +/* Optional indication of physical rotation of sensor */
> > > +ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation",
> > > +&rotation);
> > 
> > > +if (!ret) {
> > 
> > Why not positive conditional?
> > 
> 
> Okay. Fixed in next release.
> 
> > > +ov02a10->upside_down = rotation == 180;
> > > +if (rotation == 180) {
> > > +ov02a10->upside_down = true;
> > > +ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > > +}
> > > +} else {
> > > +dev_warn(dev, "failed to get rotation\n");
> > > +}
> > > +
> > > +/* Optional indication of mipi TX speed */
> > > +ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> > > +       &clock_lane_tx_speed);
> > > +
> > 
> > > +if (!ret)
> > 
> > Ditto.
> > 
> 
> As Sakari mentioned earlier, the property "ovti,mipi-tx-speed" is
> optional that shouldn't warn it's missing when ret is 0.
> So we would keep the condition like that, just removing else case.

I don't remember discussing this, but could be because it was quite some
time ago.

It doesn't seem to be documented. What is it for?

> > *********************MEDIATEK Confidential/Internal Use*********************

Is this intentional?

-- 
Regards,

Sakari Ailus
