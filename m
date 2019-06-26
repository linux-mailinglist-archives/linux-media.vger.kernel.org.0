Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2A856603
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 11:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfFZJ6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 05:58:36 -0400
Received: from retiisi.org.uk ([95.216.213.190]:38802 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726247AbfFZJ6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 05:58:35 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 0C3C6634C7F;
        Wed, 26 Jun 2019 12:58:27 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hg4h8-0000Pw-9f; Wed, 26 Jun 2019 12:58:26 +0300
Date:   Wed, 26 Jun 2019 12:58:26 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, menghui.lin@mediatek.com,
        shengnan.wang@mediatek.com, tfiga@google.com
Subject: Re: [PATCH 1/3] media: i2c: ov02a10: Add ov02a10 camera sensor driver
Message-ID: <20190626095826.3w4lj4vmfnfgxv53@valkosipuli.retiisi.org.uk>
References: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
 <20190523102204.24112-2-dongchun.zhu@mediatek.com>
 <20190531170307.tv652oech6vh4rye@valkosipuli.retiisi.org.uk>
 <1560262189.9392.42.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560262189.9392.42.camel@mhfsdcap03>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Tue, Jun 11, 2019 at 10:09:49PM +0800, Dongchun Zhu wrote:
...
> > > +		return -EINVAL;
> > > +
> > > +	fse->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > 
> > Instead you need check the caller set this. The frame sizes could be
> > different for different media bus formats.
> > 
> 
> For one sensor mode, there should be one Bayer sequence.
> In next version, this para could be changed when mirror/flip enabled.
> 

You should change the check based on the configuration.

...

> > > +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> > > +static int ov02a10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > +{
> > > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +	struct v4l2_mbus_framefmt *try_fmt;
> > > +
> > > +	mutex_lock(&ov02a10->mutex);
> > > +
> > > +	try_fmt = v4l2_subdev_get_try_format(sd, fh->pad, 0);
> > > +	/* Initialize try_fmt */
> > > +	ov02a10_fill_fmt(&supported_modes[0], try_fmt);
> > 
> > If this is all you need, you should implement the init_cfg pad op.
> > 
> 
> It seems that other sensors (for instance, OV8856, OV13858 etc.)
> initialize try_fmt in the same way.

Yes; these drivers should be changed as well.

...

> > > +					  ov02a10_test_pattern_val[ctrl->val]);
> > > +		break;
> > > +	case V4L2_CID_HFLIP:
> > > +		if (ov02a10->streaming)
> > > +			return -EBUSY;
> > 
> > You could instead use v4l2_ctrl_grab() (or the unlocked variant) when
> > streaming starts. Same below.
> > 
> 
> It seems that other sensors (for instance, OV2680 etc.)
> call V4L2_CID_HFLIP/V4L2_CID_VFLIP in the same way.

That's ok.

-- 
Regards,

Sakari Ailus
