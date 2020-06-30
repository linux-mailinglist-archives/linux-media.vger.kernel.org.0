Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576A720F593
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 15:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732177AbgF3NZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 09:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732048AbgF3NZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 09:25:30 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A42C03E979
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 06:25:19 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o22so4416395pjw.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MmFNTuNWNlYfkTfO+ouHFDRjeScQ1LCv+3zOBuFyLqA=;
        b=IZ8/gMQFBFzxA8yIkp3t5c2Z1hLpsOxlivLjEl5Cb0CP+pirIYATprgrCvOavb0gmy
         NKO72ffLy+6ndpYrX9bDazWm6L2oUO+iw/dPC2bbYJ2ss8f1RtnVA36qi9L+GUVOAZUT
         t8U9JM/eV1n9G/Mopq7TffVfWxQT7CyyuuYxjadGRfchZogW3w56UfjCmWYRlFStEMYM
         9c0HI5WhBfFeKTN4z0AOilHlwzsS2l8oBXTpC4VpiB1/pOcGqS+3ZG9CNhLCaYgajVX0
         GzN9FD28ykoLPi0ipdRdDlWpoiCLaH2+rmnHTIIWB1lU3GlXu+stQzBiM4D9Mgl9RJjU
         QpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MmFNTuNWNlYfkTfO+ouHFDRjeScQ1LCv+3zOBuFyLqA=;
        b=JAZp0m/ipyYE3SvpOuMcEGk08eHX06m1rnBWpR3L/CJwxdLasLeiuQYncyOntEvNAh
         6R4ACFmD+MYhNs2vbIM2esEsu6CU7uNIxFbjK7oJ3Q03yWlQZ3G2Vidqf7EG5Hz1X/vq
         FuFMc7g/jzZr6ZEEHYQwUpMRoY+M2erlVqNuZtjoGQSIAsKrnfmPkqw2RdX27wMQqxne
         Zn0ea6+0Tu/rcqrlylK/tVmrk/gqAFVtB4Vud9Dm4MyyARjoVBeHn1/PJ0TLjaFic1xp
         rjewUDqi8JQG4Bv4/p0KSxkcMk+aq5qvFpEg7ztIG3sGTdZCycH0CfNZ3VPO8V0JMB0Y
         DATw==
X-Gm-Message-State: AOAM532SMoya+hzv7xU4BnEqHTKvzD6Zr8abmK8Zag9aQ5UJIOfjHipM
        V7DThcWUqDR1dZfYRmzkCY8mwQ==
X-Google-Smtp-Source: ABdhPJyTPWfqGF/9M9BHdiuXexlfoZ9DxobRQG6fP5tq4sndT5Gh9qYkYDiX3JWuVlGJmMnzknmw4w==
X-Received: by 2002:a17:902:fe90:: with SMTP id x16mr17019230plm.307.1593523518802;
        Tue, 30 Jun 2020 06:25:18 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id f20sm2819148pfn.51.2020.06.30.06.25.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 06:25:18 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Tue, 30 Jun 2020 18:55:10 +0530
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v7 3/3] media: vimc: Add a control to display info on
 test image
Message-ID: <20200630132510.GA12353@kaaira-HP-Pavilion-Notebook>
References: <20200626130700.2453-1-kgupta@es.iitr.ac.in>
 <20200626130700.2453-4-kgupta@es.iitr.ac.in>
 <1409b37e-f03d-cca8-c4a7-e1454f1da910@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1409b37e-f03d-cca8-c4a7-e1454f1da910@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 26, 2020 at 01:01:03PM -0300, Helen Koike wrote:
> Hi Kaaira,
> 
> On 6/26/20 10:07 AM, Kaaira Gupta wrote:
> > Add a control in VIMC to display information such as the correct order of
> > colors for a given test pattern, brightness, hue, saturation, contrast,
> > width and height at sensor over test image.
> > 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >  drivers/media/test-drivers/vimc/Kconfig       |  2 +
> >  drivers/media/test-drivers/vimc/vimc-common.h |  1 +
> >  drivers/media/test-drivers/vimc/vimc-core.c   | 10 +++
> >  drivers/media/test-drivers/vimc/vimc-sensor.c | 70 +++++++++++++++++++
> >  4 files changed, 83 insertions(+)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/Kconfig b/drivers/media/test-drivers/vimc/Kconfig
> > index 4068a67585f9..da4b2ad6e40c 100644
> > --- a/drivers/media/test-drivers/vimc/Kconfig
> > +++ b/drivers/media/test-drivers/vimc/Kconfig
> > @@ -2,6 +2,8 @@
> >  config VIDEO_VIMC
> >  	tristate "Virtual Media Controller Driver (VIMC)"
> >  	depends on VIDEO_DEV && VIDEO_V4L2
> > +	select FONT_SUPPORT
> > +	select FONT_8x16
> >  	select MEDIA_CONTROLLER
> >  	select VIDEO_V4L2_SUBDEV_API
> >  	select VIDEOBUF2_VMALLOC
> > diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> > index ae163dec2459..a289434e75ba 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-common.h
> > +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> > @@ -20,6 +20,7 @@
> >  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
> >  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
> >  #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
> > +#define VIMC_CID_OSD_TEXT_MODE		(VIMC_CID_VIMC_BASE + 2)
> >  
> >  #define VIMC_FRAME_MAX_WIDTH 4096
> >  #define VIMC_FRAME_MAX_HEIGHT 2160
> > diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> > index 11210aaa2551..4b0ae6f51d76 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-core.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> > @@ -5,10 +5,12 @@
> >   * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
> >   */
> >  
> > +#include <linux/font.h>
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <media/media-device.h>
> > +#include <media/tpg/v4l2-tpg.h>
> >  #include <media/v4l2-device.h>
> >  
> >  #include "vimc-common.h"
> > @@ -263,11 +265,19 @@ static int vimc_register_devices(struct vimc_device *vimc)
> >  
> >  static int vimc_probe(struct platform_device *pdev)
> >  {
> > +	const struct font_desc *font = find_font("VGA8x16");
> >  	struct vimc_device *vimc;
> >  	int ret;
> >  
> >  	dev_dbg(&pdev->dev, "probe");
> >  
> > +	if (!font) {
> > +		dev_err(&pdev->dev, "could not find font\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	tpg_set_font(font->data);
> > +
> >  	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
> >  	if (!vimc)
> >  		return -ENOMEM;
> > diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> > index a2f09ac9a360..9e4fb3f4d60d 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> > @@ -19,6 +19,8 @@ struct vimc_sen_device {
> >  	struct v4l2_subdev sd;
> >  	struct tpg_data tpg;
> >  	u8 *frame;
> > +	unsigned int osd_mode;
> 
> If you declare the enum outside the below function, this could be type osd_mode instead of unsigned int, what do you think?
> 
> > +	u64 start_stream_ts;
> >  	/* The active format */
> >  	struct v4l2_mbus_framefmt mbus_format;
> >  	struct v4l2_ctrl_handler hdl;
> > @@ -187,8 +189,54 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
> >  {
> >  	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
> >  						    ved);
> > +	enum osd_mode {OSD_SHOW_ALL = 0, OSD_SHOW_COUNTERS = 1, OSD_SHOW_NONE = 2};
> > +	const unsigned int line_height = 16;
> > +	u8 *basep[TPG_MAX_PLANES][2];
> > +	unsigned int line = 1;
> > +	char str[100];
> >  
> >  	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
> > +	tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
> > +	switch (vsen->osd_mode) {
> > +	case OSD_SHOW_ALL:
> > +		{
> 
> Usually we don't use this curly braces in a case statement, please, check other examples in the code,

I have declared variables inside the cases,hence they are not just
statements, so I need to use them I think

> 
> > +			const char *order = tpg_g_color_order(&vsen->tpg);
> 
> You also don't need this level of identation.

I used it because of the braces

> 
> > +
> > +			tpg_gen_text(&vsen->tpg, basep,
> > +				     line++ * line_height, 16, order);
> > +			snprintf(str, sizeof(str),
> > +				 "brightness %3d, contrast %3d, saturation %3d, hue %d ",
> > +				 vsen->tpg.brightness,
> > +				 vsen->tpg.contrast,
> > +				 vsen->tpg.saturation,
> > +				 vsen->tpg.hue);
> > +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
> > +				     16, str);
> > +			snprintf(str, sizeof(str), "sensor size: %dx%d",
> > +				 vsen->mbus_format.width,
> > +				 vsen->mbus_format.height);
> > +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
> > +				     16, str);
> > +		}
> > +	case OSD_SHOW_COUNTERS:
> 
> Checkpatch gives this error:
> 
> WARNING: Possible switch case/default not preceded by break or fallthrough comment
> 
> You need to add a fallthrough comment (grep for fallthrough to find other examples)

Okay, I will add that

> 
> > +		{
> > +			unsigned int ms;
> > +
> > +			ms = (ktime_get_ns() - vsen->start_stream_ts) / 1000000;
> > +			snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
> > +				 (ms / (60 * 60 * 1000)) % 24,
> > +				 (ms / (60 * 1000)) % 60,
> > +				 (ms / 1000) % 60,
> > +				 ms % 1000);
> > +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
> > +				     16, str);
> > +			break;
> > +		}
> > +	case OSD_SHOW_NONE:
> 
> No need this case statement if you have the default below.

I added it to make it clearer what default does, should I remove it?

> 
> Regards,
> Helen
> 
> > +	default:
> > +		break;
> > +	}
> > +
> >  	return vsen->frame;
> >  }
> >  
> > @@ -201,6 +249,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
> >  		const struct vimc_pix_map *vpix;
> >  		unsigned int frame_size;
> >  
> > +		vsen->start_stream_ts = ktime_get_ns();
> > +
> >  		/* Calculate the frame size */
> >  		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
> >  		frame_size = vsen->mbus_format.width * vpix->bpp *
> > @@ -269,6 +319,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_SATURATION:
> >  		tpg_s_saturation(&vsen->tpg, ctrl->val);
> >  		break;
> > +	case VIMC_CID_OSD_TEXT_MODE:
> > +		vsen->osd_mode = ctrl->val;
> > +		break;
> >  	default:
> >  		return -EINVAL;
> >  	}
> > @@ -307,6 +360,22 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
> >  	.qmenu = tpg_pattern_strings,
> >  };
> >  
> > +static const char * const vimc_ctrl_osd_mode_strings[] = {
> > +	"All",
> > +	"Counters Only",
> > +	"None",
> > +	NULL,
> > +};
> > +
> > +static const struct v4l2_ctrl_config vimc_sen_ctrl_osd_mode = {
> > +	.ops = &vimc_sen_ctrl_ops,
> > +	.id = VIMC_CID_OSD_TEXT_MODE,
> > +	.name = "Show Information",
> > +	.type = V4L2_CTRL_TYPE_MENU,
> > +	.max = ARRAY_SIZE(vimc_ctrl_osd_mode_strings) - 2,
> > +	.qmenu = vimc_ctrl_osd_mode_strings,
> > +};
> > +
> >  static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> >  					    const char *vcfg_name)
> >  {
> > @@ -323,6 +392,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> >  
> >  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
> >  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
> > +	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_osd_mode, NULL);
> >  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
> >  			  V4L2_CID_VFLIP, 0, 1, 1, 0);
> >  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
> > 
