Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 390BF17F44F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 11:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgCJKFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 06:05:30 -0400
Received: from mga17.intel.com ([192.55.52.151]:30521 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgCJKFa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 06:05:30 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 03:05:30 -0700
X-IronPort-AV: E=Sophos;i="5.70,536,1574150400"; 
   d="scan'208";a="242269786"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 03:05:25 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6BF08209DF; Tue, 10 Mar 2020 12:05:23 +0200 (EET)
Date:   Tue, 10 Mar 2020 12:05:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20200310100523.GC5379@paasikivi.fi.intel.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com>
 <1583834419.5781.33.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583834419.5781.33.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Tue, Mar 10, 2020 at 06:00:19PM +0800, Dongchun Zhu wrote:
> Hi Sakari, Rob, Andy, Tomasz,
> 
> On Fri, 2020-02-28 at 23:59 +0800, Dongchun Zhu wrote:
...
> > +static int dw9768_init(struct dw9768 *dw9768)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > +	int ret, val;
> > +
> > +	/* Reset DW9768_RING_PD_CONTROL_REG to default status 0x00 */
> > +	ret = i2c_smbus_write_byte_data(client, DW9768_RING_PD_CONTROL_REG,
> > +					DW9768_PD_MODE_OFF);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * DW9769 requires waiting delay time of t_OPR
> > +	 * after PD reset takes place.
> > +	 */
> > +	usleep_range(DW9768_T_OPR_US, DW9768_T_OPR_US + 100);
> > +
> > +	ret = dw9768_write_array(dw9768, dw9768_init_regs,
> > +				 ARRAY_SIZE(dw9768_init_regs));
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (val = dw9768->focus->val % DW9768_MOVE_STEPS;
> > +	     val <= dw9768->focus->val;
> > +	     val += DW9768_MOVE_STEPS) {
> > +		ret = dw9768_set_dac(dw9768, val);
> > +		if (ret) {
> > +			dev_err(&client->dev, "%s I2C failure: %d",
> > +				__func__, ret);
> > +			return ret;
> > +		}
> > +		usleep_range(DW9768_MOVE_DELAY_US,
> > +			     DW9768_MOVE_DELAY_US + 1000);
> > +	}
> > +
> 
> What do you think about the approach taken by this patch?
> From the view of VCM hardware, the collision sound of lens should only
> happen when moving position back to zero.
> When opening camera, one should be able to move lens to the position
> directly.
> I tried to replace this code to a single dw9768_set_dac(dw9768,
> dw9768->focus->val),
> there is no collision sound when open camera and it could reduce several
> hundred ms when open lens driver fd.
> Are we okay with this?

I think so. Usually on VCMs with ringing compensation the only problematic
case is when the power is cut. :-)

-- 
Sakari Ailus
