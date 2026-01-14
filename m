Return-Path: <linux-media+bounces-50699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFDBD1EF8C
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 14:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0557D304A999
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCDE39A7F1;
	Wed, 14 Jan 2026 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Rlc3DZ/U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94139349B0A;
	Wed, 14 Jan 2026 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395946; cv=none; b=Alx7BsE8hWwOH4ECzXkYpg8v/zsDAB7nbV0ebsXoQm+exXSjoaHWxyqFFj/TV0+3q3cTOSNW1F+JqaG8HdxF48akGekpoPFv/ASJc3F45nqdXdTfJ47EPh+rKZe6tXoIrFkqHHcOy8ktxheX5NyEhpZtc/91JFdnm4lbxDLMCmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395946; c=relaxed/simple;
	bh=i3RH7L2uHjZ/w8tEFpWSf9NTwKqge+YifEIZgvJKAg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aW7qelGHpU62uoGnEpc9V0wak/PTa1H8zdNRSP/X6zRNEWfQqW1ntzKml5YtroiuCglUo9QP2tESrQF5Vqi2utejWTIJ175bUaYF8YJFzgLUXgldTlzAFETJpfE0Fmg1yB9xMdYF+Bh7MZ+pN1092a2A5ww/p1BneysH6UI8oAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Rlc3DZ/U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CFB6C316;
	Wed, 14 Jan 2026 14:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768395916;
	bh=i3RH7L2uHjZ/w8tEFpWSf9NTwKqge+YifEIZgvJKAg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rlc3DZ/UXjhZ3u38ULXegknYnna4iTsUrfFX7u+hmbT3K4S7GKgKAtsvdMHSxfNDt
	 blX+fTfPurCkE+3N+8OZruNu/rJ3MxIIgJ8kpwjdNGIn/ovDth7+cirPREnV4bha1+
	 8DWolyIaw3Sdw/9/bqoA3DlChj8f33Fjwasg/vsQ=
Date: Wed, 14 Jan 2026 15:05:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
	sjoerd@collabora.com, dan.carpenter@linaro.org,
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 08/19] media: staging: starfive: Move to
 enabel-disable streams in starfive drivers
Message-ID: <20260114130522.GE25101@pendragon.ideasonboard.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-9-r-donadkar@ti.com>
 <176839508123.9154.16324392708272572564@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176839508123.9154.16324392708272572564@freya>

On Wed, Jan 14, 2026 at 06:21:21PM +0530, Jai Luthra wrote:
> Hi Rishikesh,
> 
> Thanks for the patch.

We should actually drop the driver. Starfive has confirmed they don't
plan to develop it further, so it shouldn't stay in staging.

> > Subject: [PATCH v9 08/19] media: staging: starfive: Move to enabel-disable streams in starfive drivers
> 
> s/enabel/enable
> 
> Quoting Rishikesh Donadkar (2025-12-30 14:02:09)
> > The enable_streams() API in v4l2 supports passing a bitmask to enable
> > each pad/stream combination individually on any media subdev. Use this
> > API instead of  s_stream() API in the starfive drivers
> 
> nit: I think the description can be explicit that this driver does not
> support "multiple streams" (at least right now), but just switching to the
> new API while ignoring the passed streams mask.
> 
> > 
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> > ---
> >  .../staging/media/starfive/camss/stf-isp.c    | 43 ++++++++++++-------
> >  .../staging/media/starfive/camss/stf-video.c  |  4 +-
> >  2 files changed, 30 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
> > index df7a903fbb1b0..4930ffb0e07a6 100644
> > --- a/drivers/staging/media/starfive/camss/stf-isp.c
> > +++ b/drivers/staging/media/starfive/camss/stf-isp.c
> > @@ -55,27 +55,43 @@ int stf_isp_init(struct stfcamss *stfcamss)
> >         return 0;
> >  }
> >  
> > -static int isp_set_stream(struct v4l2_subdev *sd, int enable)
> > +static int isp_sd_enable_stream(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *state,
> > +                               u32 pad, u64 streams_mask)
> >  {
> >         struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
> >         struct v4l2_subdev_state *sd_state;
> >         struct v4l2_mbus_framefmt *fmt;
> >         struct v4l2_rect *crop;
> > +       int ret;
> >  
> > -       sd_state = v4l2_subdev_lock_and_get_active_state(sd);
> > +       sd_state = v4l2_subdev_get_locked_active_state(sd);
> >         fmt = v4l2_subdev_state_get_format(sd_state, STF_ISP_PAD_SINK);
> >         crop = v4l2_subdev_state_get_crop(sd_state, STF_ISP_PAD_SRC);
> >  
> > -       if (enable) {
> > -               stf_isp_reset(isp_dev);
> > -               stf_isp_init_cfg(isp_dev);
> > -               stf_isp_settings(isp_dev, crop, fmt->code);
> > -               stf_isp_stream_set(isp_dev);
> > -       }
> > +       stf_isp_reset(isp_dev);
> > +       stf_isp_init_cfg(isp_dev);
> > +       stf_isp_settings(isp_dev, crop, fmt->code);
> > +       stf_isp_stream_set(isp_dev);
> > +
> > +       ret = v4l2_subdev_enable_streams(isp_dev->source_subdev, 1, BIT(0));
> 
> Given you have a streams_mask argument in this function now, it might be
> cleaner to use it here (and let stf-video populate it with BIT(0)).
> 
> > +       if (ret)
> > +               return ret;
> > +
> > +       return 0;
> > +}
> >  
> > -       v4l2_subdev_call(isp_dev->source_subdev, video, s_stream, enable);
> > +static int isp_sd_disable_stream(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *state,
> > +                                u32 pad, u64 streams_mask)
> > +{
> > +       struct stf_isp_dev *isp_dev = v4l2_get_subdevdata(sd);
> > +       int ret;
> > +
> > +       ret = v4l2_subdev_disable_streams(isp_dev->source_subdev, 1, BIT(0));
> 
> Same here.
> 
> > +       if (ret)
> > +               return ret;
> >  
> > -       v4l2_subdev_unlock_state(sd_state);
> >         return 0;
> >  }
> >  
> > @@ -300,20 +316,17 @@ static int isp_init_formats(struct v4l2_subdev *sd,
> >         return isp_set_format(sd, sd_state, &format);
> >  }
> >  
> > -static const struct v4l2_subdev_video_ops isp_video_ops = {
> > -       .s_stream = isp_set_stream,
> > -};
> > -
> >  static const struct v4l2_subdev_pad_ops isp_pad_ops = {
> >         .enum_mbus_code = isp_enum_mbus_code,
> >         .get_fmt = v4l2_subdev_get_fmt,
> >         .set_fmt = isp_set_format,
> >         .get_selection = isp_get_selection,
> >         .set_selection = isp_set_selection,
> > +       .enable_streams = isp_sd_enable_stream,
> > +       .disable_streams = isp_sd_disable_stream,
> >  };
> >  
> >  static const struct v4l2_subdev_ops isp_v4l2_ops = {
> > -       .video = &isp_video_ops,
> >         .pad = &isp_pad_ops,
> >  };
> >  
> > diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
> > index a0420eb6a0aa0..2db29bf8bdef8 100644
> > --- a/drivers/staging/media/starfive/camss/stf-video.c
> > +++ b/drivers/staging/media/starfive/camss/stf-video.c
> > @@ -287,7 +287,7 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
> >  
> >         video->ops->start_streaming(video);
> >  
> > -       ret = v4l2_subdev_call(video->source_subdev, video, s_stream, true);
> > +       ret = v4l2_subdev_enable_streams(video->source_subdev, 1, BIT(0));
> 
> Now that I think of it, it was not necessary to implement enable / disable
> API for the ISP subdev driver given v4l2_subdev_*_streams falls back on
> s_stream. But it's anyway good to move drivers, so I guess it's alright.
> 
> >         if (ret) {
> >                 dev_err(video->stfcamss->dev, "stream on failed\n");
> >                 goto err_pm_put;
> > @@ -311,7 +311,7 @@ static void video_stop_streaming(struct vb2_queue *q)
> >  
> >         video->ops->stop_streaming(video);
> >  
> > -       v4l2_subdev_call(video->source_subdev, video, s_stream, false);
> > +       v4l2_subdev_disable_streams(video->source_subdev, 1, BIT(0));
> >  
> >         pm_runtime_put(video->stfcamss->dev);
> >  

-- 
Regards,

Laurent Pinchart

