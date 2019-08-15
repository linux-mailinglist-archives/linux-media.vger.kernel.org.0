Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B378E63A
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 10:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbfHOIZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 04:25:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:48394 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729838AbfHOIZd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 04:25:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 01:25:33 -0700
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; 
   d="scan'208";a="184561788"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 01:25:28 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 7CD1B20BCA; Thu, 15 Aug 2019 11:24:22 +0300 (EEST)
Date:   Thu, 15 Aug 2019 11:24:22 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com,
        zyc@rock-chips.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>
Subject: Re: [PATCH v8 05/14] media: rkisp1: add Rockchip ISP1 subdev driver
Message-ID: <20190815082422.GM6133@paasikivi.fi.intel.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-6-helen.koike@collabora.com>
 <20190808091406.GQ21370@paasikivi.fi.intel.com>
 <da6c1d01-e3f6-ad73-db55-145d7832a665@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da6c1d01-e3f6-ad73-db55-145d7832a665@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On Wed, Aug 14, 2019 at 09:58:05PM -0300, Helen Koike wrote:

...

> >> +static int rkisp1_isp_sd_set_fmt(struct v4l2_subdev *sd,
> >> +				 struct v4l2_subdev_pad_config *cfg,
> >> +				 struct v4l2_subdev_format *fmt)
> >> +{
> >> +	struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> >> +	struct rkisp1_isp_subdev *isp_sd = &isp_dev->isp_sdev;
> >> +	struct v4l2_mbus_framefmt *mf = &fmt->format;
> >> +
> > 
> > Note that for sub-device nodes, the driver is itself responsible for
> > serialising the access to its data structures.
> 
> But looking at subdev_do_ioctl_lock(), it seems that it serializes the
> ioctl calls for subdevs, no? Or I'm misunderstanding something (which is
> most probably) ?

Good question. I had missed this change --- subdev_do_ioctl_lock() is
relatively new. But setting that lock is still not possible as the struct
is allocated in the framework and the device is registered before the
driver gets hold of it. It's a good idea to provide the same serialisation
for subdevs as well.

I'll get back to this later.

...

> >> +static int rkisp1_isp_sd_s_power(struct v4l2_subdev *sd, int on)
> > 
> > If you support runtime PM, you shouldn't implement the s_power op.
> 
> Is is ok to completly remove the usage of runtime PM then?
> Like this http://ix.io/1RJb ?

Please use runtime PM instead. In the long run we should get rid of the
s_power op. Drivers themselves know better when the hardware they control
should be powered on or off.

> 
> tbh I'm not that familar with runtime PM and I'm not sure what is the
> difference of it and using s_power op (and Documentation/power/runtime_pm.rst
> is not being that helpful tbh).

You can find a simple example e.g. in
drivers/media/platform/atmel/atmel-isi.c .

> 
> > 
> > You'll still need to call s_power on external subdevs though.
> > 
> >> +{
> >> +	struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> >> +	int ret;
> >> +
> >> +	v4l2_dbg(1, rkisp1_debug, &isp_dev->v4l2_dev, "s_power: %d\n", on);
> >> +
> >> +	if (on) {
> >> +		ret = pm_runtime_get_sync(isp_dev->dev);
> 
> If this is not ok to remove suport for runtime PM, then where should I put
> the call to pm_runtime_get_sync() if not in this s_power op ?

Basically the runtime_resume and runtime_suspend callbacks are where the
device power state changes are implemented, and pm_runtime_get_sync and
pm_runtime_put are how the driver controls the power state.

So you no longer need the s_power() op at all. The op needs to be called on
the pipeline however, as there are drivers that still use it.

> 
> >> +		if (ret < 0)
> >> +			return ret;
> >> +
> >> +		rkisp1_config_clk(isp_dev);
> >> +	} else {
> >> +		ret = pm_runtime_put(isp_dev->dev);
> >> +		if (ret < 0)
> >> +			return ret;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int rkisp1_subdev_link_validate(struct media_link *link)
> >> +{
> >> +	if (link->source->index == RKISP1_ISP_PAD_SINK_PARAMS)
> > 
> > Is this test correct? The source is the source end of the link, i.e. the
> > video node.
> 
> Ah yes, it should be link->sink->index (and not source), thanks for spotting this.
> 
> > 
> > How about the links that end in a video node?
> 
> I thought that the only possibilities were sensor->isp1 and params->isp1 (where params
> is an output video node that should be catched by the corrected version of the if
> statement above.
> 
> Or do you mean another thing?

The link_validate of the sink entity will be called only, for the knowledge
what is possible is generally in that end.

So you'll need this for all the sink pads this driver is in control of.
I suppose this means the sub-devices as well as capture video nodes in
practice.

> 
> > 
> >> +		return 0;
> >> +
> >> +	return v4l2_subdev_link_validate(link);
> >> +}
> >> +
> >> +static int rkisp1_subdev_fmt_link_validate(struct v4l2_subdev *sd,
> >> +					struct media_link *link,
> >> +					struct v4l2_subdev_format *source_fmt,
> >> +					struct v4l2_subdev_format *sink_fmt)
> >> +{
> >> +	if (source_fmt->format.code != sink_fmt->format.code)
> >> +		return -EINVAL;
> 
> ops, should be -EPIPE
> 
> >> +
> >> +	/* Crop is available */
> >> +	if (source_fmt->format.width < sink_fmt->format.width ||
> >> +	    source_fmt->format.height < sink_fmt->format.height)
> >> +		return -EINVAL;
> 
> -EPIPE
> 
> >> +
> > 
> > Could you use v4l2_subdev_link_validate_default()?
> 
> v4l2_subdev_link_validate_default() only allows for an exact width/height match,
> but here we allow the sink to be smaller then the source for cropping, no?

The width and height generally must match over a link. But cropping takes
place inside a sub-device, it is not a concern in link validation as such.

> 
> Thanks again for your review!

You're welcome!

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
