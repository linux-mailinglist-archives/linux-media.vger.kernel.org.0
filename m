Return-Path: <linux-media+bounces-1092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8967F9EE9
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 12:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD140B21058
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 11:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE5C1A720;
	Mon, 27 Nov 2023 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLe/Xzsi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103D9186
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 03:48:06 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so2799772f8f.0
        for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 03:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701085684; x=1701690484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9TbTz3Fgla0IqlHyXbROK4NrLAUTXgjUGWQOD0LWoIM=;
        b=mLe/XzsikjKy7eus74IvWL1INg7h1qQIuhx576FR1jmW1pn4UmP0d8sjNucQmOqcYj
         yS/bZ0jjxA67d36qvgXQBLbXsD6Qso2OGMdzQjtoRvtaMyYC+6UHlObtJtTrN//F7Plw
         fvl3yFwHEMCkZ7UFP+qsPphNO7NAhNGuAR3qA6KHCn4MmstXgxmh7CrAhSXRVTdXRJwL
         nOjCFCWU2kB/zDpTibuXipIFixCD4srX/+N0Bz70/DqWv/9waMQIakRTUHlZWxD5vGYG
         BHQYWemp9cA8HWvzPSgtol9qYOkvetCazQxIWM3ynAApHZybbbSAf/G/KN6MkcwGLGiV
         VEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701085684; x=1701690484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TbTz3Fgla0IqlHyXbROK4NrLAUTXgjUGWQOD0LWoIM=;
        b=KUpS43UtMAOh1foWb3CpjBUccxwhbfahjRUO4+PQsF9f2X1HXtnXsTV4wejAzQNegO
         6naCrm2WRx7evYEBKdxXPm8APzRcFLOw0DoSDmzLL1DAKQbuYtueTubfw3qawSmyuBD7
         5tjt38LLSabA0Ag9O70hXx5vW0q+Zt5AimLRFrwKXFQteMtpM5PLbqv4z65xrnVBBGxN
         tgGWpWc3lMaRs5nAxviL8R+ILYQr4LLigQtws7RmmR8AZrADt4mEP+td/OcrKJADdA5p
         Cbjy19NsKo5eGakKYhT97la3nL5hxqkottM3iOPntBmRxEi0aft3DMQ8Y3kMHegcAaCN
         jF3w==
X-Gm-Message-State: AOJu0Yws1g9zLzh6B+mSlij3US0JpjRa1SD5EGw+uSURkAO20prJsuwc
	3g9Z8dxywVC/iK/1QeEPgYQ=
X-Google-Smtp-Source: AGHT+IH1s3OvvY8rrwWseHgR7MfJyR22hlaHrBFOKCuM5kzmyFVWWk5nN//7w6MlZUhrODoxmI128w==
X-Received: by 2002:a5d:650c:0:b0:32d:9d3a:d8c0 with SMTP id x12-20020a5d650c000000b0032d9d3ad8c0mr7925514wru.60.1701085684194;
        Mon, 27 Nov 2023 03:48:04 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-143-167.cust.vodafonedsl.it. [2.39.143.167])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000050a00b0032ddf2804ccsm11623430wrf.83.2023.11.27.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 03:48:03 -0800 (PST)
Date: Mon, 27 Nov 2023 12:48:00 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jacopo Mondi <jacopo@jmondi.org>, Bingbu Cao <bingbu.cao@intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Maxime Ripard <mripard@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 1/1] media: v4l2-subdev: Rename .init_cfg() operation
 to .init_state()
Message-ID: <ZWSB8N/MBHnZdJVj@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231127090744.30012-1-laurent.pinchart@ideasonboard.com>
 <20231127090744.30012-2-laurent.pinchart@ideasonboard.com>
 <ZWR9KXiCW0dxukYW@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20231127113314.GB16848@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127113314.GB16848@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Nov 27, 2023 at 01:33:14PM +0200, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Mon, Nov 27, 2023 at 12:27:37PM +0100, Tommaso Merciai wrote:
> > Hi Laurent,
> > Patch looks good to me.
> > 
> > Some clarification:
> > 
> > I'm working as you know on alvium driver actually v14 sent.
> > Need to wait for a feedback on this or I can send v15 with the following
> > missing stuff:
> > 
> > diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
> > index 1c6450c9b994..3f4104ab3094 100644
> > --- a/drivers/media/i2c/alvium-csi2.c
> > +++ b/drivers/media/i2c/alvium-csi2.c
> > @@ -1850,8 +1850,8 @@ static int alvium_s_stream(struct v4l2_subdev *sd, int enable)
> >         return ret;
> >  }
> > 
> > -static int alvium_init_cfg(struct v4l2_subdev *sd,
> > -                          struct v4l2_subdev_state *state)
> > +static int alvium_init_state(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state)
> >  {
> >         struct alvium_dev *alvium = sd_to_alvium(sd);
> >         struct alvium_mode *mode = &alvium->mode;
> > @@ -2233,7 +2233,6 @@ static const struct v4l2_subdev_video_ops alvium_video_ops = {
> >  };
> > 
> >  static const struct v4l2_subdev_pad_ops alvium_pad_ops = {
> > -       .init_cfg = alvium_init_cfg,
> >         .enum_mbus_code = alvium_enum_mbus_code,
> >         .get_fmt = v4l2_subdev_get_fmt,
> >         .set_fmt = alvium_set_fmt,
> > @@ -2241,6 +2240,10 @@ static const struct v4l2_subdev_pad_ops alvium_pad_ops = {
> >         .set_selection = alvium_set_selection,
> >  };
> > 
> > +static const struct v4l2_subdev_internal_ops alvium_internal_ops = {
> > +       .init_state = alvium_init_state,
> > +};
> > +
> >  static const struct v4l2_subdev_ops alvium_subdev_ops = {
> >         .core   = &alvium_core_ops,
> >         .pad    = &alvium_pad_ops,
> > @@ -2271,6 +2274,7 @@ static int alvium_subdev_init(struct alvium_dev *alvium)
> >         /* init alvium sd */
> >         v4l2_i2c_subdev_init(sd, client, &alvium_subdev_ops);
> > 
> > +       sd->internal_ops = &alvium_internal_ops;
> >         sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
> >         alvium->pad.flags = MEDIA_PAD_FL_SOURCE;
> >         sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > 
> > Rebased this morning on top of Sakari master branch :)
> 
> As far as I understand, Sakari will send a pull request that will
> include this patch in a few days. I think you can already base the next
> version of the Alvium driver on top of his master branch. 

Done: https://github.com/avs-sas/linux/blob/tm/media_stage/v6.7.0-rc2/alvium_drv/v15/drivers/media/i2c/alvium-csi2.c

> Sakari, please let us know if this is not correct.
> 
> By the way, I forgot to CC you, but I have posted the next version of
> the .[gs]_frame_interval rework ([1]). I don't mind rebasing on top of
> your driver in case it gets merged first.
> 
> [1] https://lore.kernel.org/linux-media/20231127111359.30315-1-laurent.pinchart@ideasonboard.com/T/#t

No problem.
Thanks for sharing.

Regards,
Tommaso
 
> > On Mon, Nov 27, 2023 at 11:07:44AM +0200, Laurent Pinchart wrote:
> > > The subdev .init_cfg() operation is affected by two issues:
> > > 
> > > - It has long been extended to initialize a whole v4l2_subdev_state
> > >   instead of just a v4l2_subdev_pad_config, but its name has stuck
> > >   around.
> > > 
> > > - Despite operating on a whole subdev state and not being directly
> > >   exposed to the subdev users (either in-kernel or through the userspace
> > >   API), .init_cfg() is categorized as a subdev pad operation.
> > > 
> > > This participates in making the subdev API confusing for new developers.
> > > Fix it by renaming the operation to .init_state(), and make it a subdev
> > > internal operation.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Acked-by: Michael Riesch <michael.riesch@wolfvision.net> # for imx415
> > > Acked-by: Shuah Khan <skhan@linuxfoundation.org> # for vimc
> > > ---
> > > Changes since v3:
> > > 
> > > - Rebase on top of the new stm32-dcmipp driver
> > > - Fix uninitialized variable in __v4l2_subdev_state_alloc() due to bad
> > >   rebase
> > > 
> > > Changes since v2:
> > > 
> > > - Rebase on top of the latest media tree
> > > 
> > > Changes since v1:
> > > 
> > > - Fix compilation of the vsp1 driver
> > > ---
> > >  drivers/media/i2c/adv7180.c                   | 10 ++--
> > >  drivers/media/i2c/ccs/ccs-core.c              |  6 +--
> > >  drivers/media/i2c/ds90ub913.c                 | 10 ++--
> > >  drivers/media/i2c/ds90ub953.c                 | 10 ++--
> > >  drivers/media/i2c/ds90ub960.c                 | 11 ++--
> > >  drivers/media/i2c/gc2145.c                    | 10 ++--
> > >  drivers/media/i2c/hi846.c                     | 10 ++--
> > >  drivers/media/i2c/imx214.c                    | 12 +++--
> > >  drivers/media/i2c/imx219.c                    |  9 ++--
> > >  drivers/media/i2c/imx290.c                    | 10 ++--
> > >  drivers/media/i2c/imx296.c                    | 10 ++--
> > >  drivers/media/i2c/imx334.c                    | 12 +++--
> > >  drivers/media/i2c/imx335.c                    | 12 +++--
> > >  drivers/media/i2c/imx412.c                    | 12 +++--
> > >  drivers/media/i2c/imx415.c                    | 10 ++--
> > >  drivers/media/i2c/mt9m001.c                   | 10 ++--
> > >  drivers/media/i2c/mt9m111.c                   | 10 ++--
> > >  drivers/media/i2c/mt9m114.c                   | 16 +++---
> > >  drivers/media/i2c/mt9p031.c                   |  8 +--
> > >  drivers/media/i2c/mt9v111.c                   | 10 ++--
> > >  drivers/media/i2c/ov01a10.c                   | 10 ++--
> > >  drivers/media/i2c/ov02a10.c                   | 10 ++--
> > >  drivers/media/i2c/ov2640.c                    | 10 ++--
> > >  drivers/media/i2c/ov2680.c                    | 10 ++--
> > >  drivers/media/i2c/ov2740.c                    | 10 ++--
> > >  drivers/media/i2c/ov5640.c                    | 10 ++--
> > >  drivers/media/i2c/ov5645.c                    | 12 +++--
> > >  drivers/media/i2c/ov5670.c                    | 10 ++--
> > >  drivers/media/i2c/ov7251.c                    | 12 +++--
> > >  drivers/media/i2c/ov8858.c                    | 10 ++--
> > >  drivers/media/i2c/ov9282.c                    | 12 +++--
> > >  drivers/media/i2c/st-vgxy61.c                 | 10 ++--
> > >  drivers/media/i2c/tc358746.c                  | 10 ++--
> > >  drivers/media/i2c/tda1997x.c                  | 10 ++--
> > >  drivers/media/i2c/thp7312.c                   | 10 ++--
> > >  drivers/media/i2c/tvp5150.c                   |  6 +--
> > >  drivers/media/pci/intel/ivsc/mei_csi.c        | 10 ++--
> > >  drivers/media/platform/cadence/cdns-csi2rx.c  | 10 ++--
> > >  .../platform/microchip/microchip-csi2dc.c     | 10 ++--
> > >  .../platform/microchip/microchip-isc-scaler.c | 10 ++--
> > >  drivers/media/platform/nxp/imx-mipi-csis.c    | 10 ++--
> > >  drivers/media/platform/nxp/imx7-media-csi.c   |  6 +--
> > >  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 10 ++--
> > >  .../platform/nxp/imx8-isi/imx8-isi-pipe.c     | 10 ++--
> > >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 10 ++--
> > >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 10 ++--
> > >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 10 ++--
> > >  .../media/platform/renesas/vsp1/vsp1_brx.c    |  1 -
> > >  .../media/platform/renesas/vsp1/vsp1_clu.c    |  1 -
> > >  .../media/platform/renesas/vsp1/vsp1_entity.c | 53 +++++++++----------
> > >  .../media/platform/renesas/vsp1/vsp1_entity.h |  2 -
> > >  .../media/platform/renesas/vsp1/vsp1_hsit.c   |  1 -
> > >  .../media/platform/renesas/vsp1/vsp1_lif.c    |  1 -
> > >  .../media/platform/renesas/vsp1/vsp1_lut.c    |  1 -
> > >  .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  1 -
> > >  .../media/platform/renesas/vsp1/vsp1_sru.c    |  1 -
> > >  .../media/platform/renesas/vsp1/vsp1_uds.c    |  1 -
> > >  .../media/platform/renesas/vsp1/vsp1_uif.c    |  1 -
> > >  .../platform/rockchip/rkisp1/rkisp1-csi.c     | 10 ++--
> > >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 10 ++--
> > >  .../platform/rockchip/rkisp1/rkisp1-resizer.c | 10 ++--
> > >  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   |  6 +--
> > >  .../st/stm32/stm32-dcmipp/dcmipp-parallel.c   |  6 +--
> > >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  1 +
> > >  .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
> > >  .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  9 ++--
> > >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 10 ++--
> > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 10 ++--
> > >  .../sun8i_a83t_mipi_csi2.c                    | 10 ++--
> > >  drivers/media/platform/ti/cal/cal-camerarx.c  | 10 ++--
> > >  drivers/media/platform/video-mux.c            | 10 ++--
> > >  .../media/platform/xilinx/xilinx-csi2rxss.c   | 10 ++--
> > >  .../media/test-drivers/vimc/vimc-debayer.c    | 11 ++--
> > >  drivers/media/test-drivers/vimc/vimc-scaler.c | 11 ++--
> > >  drivers/media/test-drivers/vimc/vimc-sensor.c | 11 ++--
> > >  drivers/media/v4l2-core/v4l2-subdev.c         | 20 +++----
> > >  drivers/staging/media/imx/imx-ic-prp.c        |  2 +-
> > >  drivers/staging/media/imx/imx-ic-prpencvf.c   |  2 +-
> > >  drivers/staging/media/imx/imx-media-csi.c     |  2 +-
> > >  drivers/staging/media/imx/imx-media-utils.c   |  8 +--
> > >  drivers/staging/media/imx/imx-media-vdic.c    |  2 +-
> > >  drivers/staging/media/imx/imx-media.h         |  4 +-
> > >  drivers/staging/media/imx/imx6-mipi-csi2.c    |  2 +-
> > >  .../staging/media/starfive/camss/stf-isp.c    |  6 ++-
> > >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 10 ++--
> > >  include/media/v4l2-subdev.h                   |  7 +--
> > >  86 files changed, 487 insertions(+), 264 deletions(-)
> 
> [snip]
> 
> -- 
> Regards,
> 
> Laurent Pinchart

