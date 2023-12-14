Return-Path: <linux-media+bounces-2402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE51812C62
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 10:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7F2A1C21572
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E04381D6;
	Thu, 14 Dec 2023 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpE6ooNF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B267E128
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 01:59:13 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3364ab04eb8so138645f8f.2
        for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 01:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702547952; x=1703152752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=630PHWG1iMD0NI149aUbI/mMUuPDkBmVHcbFKQft9yo=;
        b=WpE6ooNFqhYjMJY6PFY46LXNz//JMLZDle0483pd9Dmzjy2CUANE3yWx5+sBefpeaO
         dl5EuK5+jYkyw+9zNPTo1mGGd1R0XQpWUAAasyk4UEhdb4QIRcuo0PCQ4enI+zCieORO
         qUmrZUk1ITun2MSD4kiU+m5zStnz9yLkitW1tMsDZgoiBJBQ/4Z9WRQQeRonZUglBr+u
         t4z/jIYiUJt0fTL2sRJIaaxHJ4cP5T9tccacQ3OJbggDDqRiCBMQvdZxy4kN5VyTtrSd
         BNAcoZ2mwBcd4vEukG6CzWczCtjIGcV6YT2uLxSHZwC1tdHtwk9UbqWVxF/d8tP+dUYa
         xOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702547952; x=1703152752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=630PHWG1iMD0NI149aUbI/mMUuPDkBmVHcbFKQft9yo=;
        b=a+sNLpZwaUnyxHi5Wft2d5biP5lSZmTNEw43iNsEQgW5hycMkVnFnh3E7l4tuwrq+f
         IAIH2XzkAgPg6J5O4Kyf06Y9Ihlz9kgvxabEWyytTNlixSbhznkvWKwhUsuysQCB6tBW
         vAUv8Vqm4wBX09QqFA0JH3kv5a+qELESPwDmA0825yhxQZ+WbNvsuTV6djJYKq5NH2NT
         AaI71xGW7Ro6lWvvA4g8dlCje0u0si8JJEBp1JqA/+hI8pSuOjDWcBJhhgW/R40KgVNj
         dRzQUE/H2iP/KAHIR6kDvzRKb0qvlvDnZiXxQjPd7d2AGJi8kfBB+zr8WjeDfG8S5CcO
         dDyw==
X-Gm-Message-State: AOJu0Yx/E2ribCpOMeLopPb1rhk6Mg0u2BoEINIRNyM98Iw7Ey/LVvCL
	4tk0GjrH4NfBnJOuXLhPGYk=
X-Google-Smtp-Source: AGHT+IGtQbseKWxtWyKbgYg581u7WqobsjFP/Y6RoRCt6MhmHxZRyrLkHRyQryUHuhr7OnqfMAwkKw==
X-Received: by 2002:a5d:528d:0:b0:332:e6ec:8306 with SMTP id c13-20020a5d528d000000b00332e6ec8306mr3495154wrv.25.1702547951863;
        Thu, 14 Dec 2023 01:59:11 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-229.cust.vodafonedsl.it. [188.217.59.229])
        by smtp.gmail.com with ESMTPSA id q10-20020adf9dca000000b0033636a04ee8sm4758857wre.32.2023.12.14.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:59:11 -0800 (PST)
Date: Thu, 14 Dec 2023 10:59:09 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v6 2/8] media: v4l2-subdev: Turn .[gs]_frame_interval
 into pad operations
Message-ID: <ZXrR7W4BlHCJWNX9@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
 <20231213150010.25593-3-laurent.pinchart@ideasonboard.com>
 <ZXq7a4nm03xrWYHF@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20231214091710.GA15238@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214091710.GA15238@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Dec 14, 2023 at 11:17:10AM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Thu, Dec 14, 2023 at 09:23:07AM +0100, Tommaso Merciai wrote:
> > On Wed, Dec 13, 2023 at 05:00:04PM +0200, Laurent Pinchart wrote:
> > > The subdev .[gs]_frame_interval are video operations, but they operate
> > > on pads (and even on streams). Not only is this confusing, it causes
> > > practical issues for drivers as the operations don't receive a subdev
> > > state pointer, requiring manual state handling.
> > > 
> > > To improve the situation, turn the operations into pad operations, and
> > > extend them to receive a state pointer like other pad operations.
> > > 
> > > While at it, rename the operations to .[gs]et_frame_interval at the same
> > > time to match the naming scheme of other pad operations. This isn't
> > > strictly necessary, but given that all drivers using those operations
> > > need to be modified, handling the rename separately would generate more
> > > churn for very little gain (if at all).
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # for tegra-video
> > > ---
> > > Changes since v5:
> > > 
> > > - Address the alvium-csi2 driver
> > > 
> > > Changes since v3:
> > > 
> > > - Address the thp7312 driver
> > > ---
> > >  drivers/media/i2c/adv7180.c                   |  7 ++-
> > >  drivers/media/i2c/alvium-csi2.c               | 11 ++--
> > >  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  6 +-
> > >  drivers/media/i2c/imx214.c                    |  9 +--
> > >  drivers/media/i2c/imx274.c                    | 48 +++++---------
> > >  drivers/media/i2c/max9286.c                   | 14 +++--
> > >  drivers/media/i2c/mt9m111.c                   | 14 +++--
> > >  drivers/media/i2c/mt9m114.c                   | 14 +++--
> > >  drivers/media/i2c/mt9v011.c                   | 18 +++---
> > >  drivers/media/i2c/mt9v111.c                   | 16 ++---
> > >  drivers/media/i2c/ov2680.c                    |  7 ++-
> > >  drivers/media/i2c/ov5640.c                    | 16 ++---
> > >  drivers/media/i2c/ov5648.c                    | 59 ++++++++---------
> > >  drivers/media/i2c/ov5693.c                    |  7 ++-
> > >  drivers/media/i2c/ov6650.c                    | 16 ++---
> > >  drivers/media/i2c/ov7251.c                    |  6 +-
> > >  drivers/media/i2c/ov7670.c                    | 18 +++---
> > >  drivers/media/i2c/ov772x.c                    | 14 +++--
> > >  drivers/media/i2c/ov7740.c                    | 40 +++++-------
> > >  drivers/media/i2c/ov8865.c                    | 51 +++++++--------
> > >  drivers/media/i2c/ov9650.c                    | 14 +++--
> > >  drivers/media/i2c/s5c73m3/s5c73m3-core.c      | 14 +++--
> > >  drivers/media/i2c/s5k5baf.c                   | 20 +++---
> > >  drivers/media/i2c/thp7312.c                   | 22 +++----
> > >  drivers/media/i2c/tvp514x.c                   | 29 +++------
> > >  drivers/media/usb/em28xx/em28xx-video.c       |  6 +-
> > >  drivers/media/v4l2-core/v4l2-common.c         |  8 +--
> > >  drivers/media/v4l2-core/v4l2-subdev.c         | 63 +++++++++++--------
> > >  .../media/atomisp/i2c/atomisp-gc0310.c        |  7 ++-
> > >  .../media/atomisp/i2c/atomisp-gc2235.c        |  7 ++-
> > >  .../media/atomisp/i2c/atomisp-mt9m114.c       |  7 ++-
> > >  .../media/atomisp/i2c/atomisp-ov2722.c        |  7 ++-
> > >  .../staging/media/atomisp/pci/atomisp_cmd.c   |  4 +-
> > >  .../staging/media/atomisp/pci/atomisp_ioctl.c |  4 +-
> > >  drivers/staging/media/imx/imx-ic-prp.c        | 14 +++--
> > >  drivers/staging/media/imx/imx-ic-prpencvf.c   | 14 +++--
> > >  drivers/staging/media/imx/imx-media-capture.c |  6 +-
> > >  drivers/staging/media/imx/imx-media-csi.c     | 14 +++--
> > >  drivers/staging/media/imx/imx-media-vdic.c    | 14 +++--
> > >  drivers/staging/media/tegra-video/csi.c       |  9 +--
> > >  include/media/v4l2-common.h                   |  4 +-
> > >  include/media/v4l2-subdev.h                   | 22 ++++---
> > >  42 files changed, 352 insertions(+), 348 deletions(-)
> 
> [snip]
> 
> > > diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> > > index c8827603eb23..a173abb0509f 100644
> > > --- a/drivers/media/i2c/alvium-csi2.c
> > > +++ b/drivers/media/i2c/alvium-csi2.c
> > > @@ -1649,6 +1649,7 @@ static int alvium_hw_init(struct alvium_dev *alvium)
> > >  /* --------------- Subdev Operations --------------- */
> > >  
> > >  static int alvium_g_frame_interval(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_state *sd_state,
> > >  				   struct v4l2_subdev_frame_interval *fi)
> > >  {
> > >  	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > @@ -1696,23 +1697,19 @@ static int alvium_set_frame_interval(struct alvium_dev *alvium,
> > >  }
> > >  
> > >  static int alvium_s_frame_interval(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_state *sd_state,
> > >  				   struct v4l2_subdev_frame_interval *fi)
> > >  {
> > >  	struct alvium_dev *alvium = sd_to_alvium(sd);
> > > -	struct v4l2_subdev_state *state;
> > >  	int ret;
> > >  
> > >  	if (alvium->streaming)
> > >  		return -EBUSY;
> > >  
> > > -	state = v4l2_subdev_lock_and_get_active_state(sd);
> > > -
> > >  	ret = alvium_set_frame_interval(alvium, fi);
> > >  	if (!ret)
> > >  		ret = alvium_set_frame_rate(alvium);
> > >  
> > > -	v4l2_subdev_unlock_state(state);
> > > -
> > >  	return ret;
> > >  }
> > >  
> > > @@ -2238,8 +2235,6 @@ static const struct v4l2_subdev_core_ops alvium_core_ops = {
> > >  };
> > >  
> > >  static const struct v4l2_subdev_video_ops alvium_video_ops = {
> > > -	.g_frame_interval	= alvium_g_frame_interval,
> > > -	.s_frame_interval	= alvium_s_frame_interval,
> > >  	.s_stream		= alvium_s_stream,
> > >  };
> > >  
> > > @@ -2249,6 +2244,8 @@ static const struct v4l2_subdev_pad_ops alvium_pad_ops = {
> > >  	.set_fmt = alvium_set_fmt,
> > >  	.get_selection = alvium_get_selection,
> > >  	.set_selection = alvium_set_selection,
> > > +	.get_frame_interval = alvium_g_frame_interval,
> > > +	.set_frame_interval = alvium_s_frame_interval,
> > >  };
> > >  
> > >  static const struct v4l2_subdev_internal_ops alvium_internal_ops = {
> > 
> > Applied and tested on my side. From functional perspective
> > all is working properly on my hw. Hope this help.
> > 
> > Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> 
> Would you be able to send a patch on top of the media_stage master
> branch to support the TRY frame intervals in the alvium driver ?

Can I use ov5640_try_frame_interval as reference?

Thanks & Regards,
Tommaso

> 
> [snip]
> 
> -- 
> Regards,
> 
> Laurent Pinchart

