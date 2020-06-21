Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E45F202CB8
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 22:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbgFUUdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jun 2020 16:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730288AbgFUUdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jun 2020 16:33:08 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91295C061794
        for <linux-media@vger.kernel.org>; Sun, 21 Jun 2020 13:33:07 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e18so7168921pgn.7
        for <linux-media@vger.kernel.org>; Sun, 21 Jun 2020 13:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D0LvEfnjJPlFAFfj6uN2NPV3CR5JS7m2fdpH7HdJDLw=;
        b=dbADO755IcFuzorin86JTFnADEE/cVtilk341t2dirV7kiDu+kDJ4KbR+cEGCmuKoM
         vn0ZcT9SUn8WvqfPzN10sJH/MDtYhvvkBpg0mTyfA3uBBxnZ8WFT5bUV8UYQkqDd8zJO
         IZWFkcMQQkZTwriuLmr5redXCL17jdj4sFNL3SWw2a00W5qcJl/kwoaU81DuYz+2pWQw
         A5m351axfM3+LWmz0PPnOUtgW5vHVtbw9nJg5c8sHQ1b8QlCh4sPMQMgmBpdb1V5rNCx
         YsYsv5a4A+oNsdrActHikLcfDaQO2lfmyXHLeXVf3fepOUpq85eX0fdEleBu+tTEEZlj
         PaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D0LvEfnjJPlFAFfj6uN2NPV3CR5JS7m2fdpH7HdJDLw=;
        b=LJj0I/OpsxGEn6ZdjcbaZptr48YuPhqmVoK+0QolXGNuA6IdAl3i8QfUw61f3Khruc
         D3A3y//iGvJjtbZoP34qJF+LTZYdQRFasgE7la2xPX2Lsi1XVVtpqVJUHe9j2hpu6vIb
         h0UnmfVGQz2/fhyrZDYsN4pMgNhmVN3gqMo1yReEEFqTw3AiNugOVd7Yk1Yv75FHwGQ7
         HbpN1/0NAOvHzJF3QrPeITYs+5Bd7r+ADn1PMmf5gIaUhfGQEn9hLtNL0V/LWWHisBt+
         Dj7VFSc9zRirTpXjEZxhxCRILkI6NKVSR0jNROp6oZFfNdCsGOCaWsCoaQ7AfGRQdYVa
         g1zQ==
X-Gm-Message-State: AOAM532iZxYfqrUQL9rw7adlJoCe8Q0wsQaUJ0rgJZRTZwPAZ3T72M+e
        m2dpnbxYqeiGr3eL/Cxj6Z6CLg==
X-Google-Smtp-Source: ABdhPJyHTU3VBkCYyFvvHRm3RLYYjHHl0mXO18imv1R7bnLHl27ABQzrzWoKitlODY2TPavZ6EXp2A==
X-Received: by 2002:a63:d652:: with SMTP id d18mr10583742pgj.164.1592771586834;
        Sun, 21 Jun 2020 13:33:06 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id e143sm11853933pfh.42.2020.06.21.13.33.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 13:33:05 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Mon, 22 Jun 2020 02:02:56 +0530
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v3 2/2] media: vimc: Add a control to display info on
 test image
Message-ID: <20200621203256.GA13040@kaaira-HP-Pavilion-Notebook>
References: <20200618190506.11892-1-kgupta@es.iitr.ac.in>
 <20200618190506.11892-3-kgupta@es.iitr.ac.in>
 <d62583ab-7dd3-9a37-c94d-99fae0f29357@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d62583ab-7dd3-9a37-c94d-99fae0f29357@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 20, 2020 at 12:05:28PM +0200, Dafna Hirschfeld wrote:
> Hi, thanks for the patch
> 
> On 18.06.20 21:05, Kaaira Gupta wrote:
> > Add a control in VIMC to display information such as the correct oder of
> > colors for a given test pattern, brightness, hue, saturation, contrast
> > and, width and height at sensor over test image; and display that
> > information.
> > 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >   drivers/media/test-drivers/vimc/Kconfig       |  2 +
> >   drivers/media/test-drivers/vimc/vimc-common.h |  1 +
> >   drivers/media/test-drivers/vimc/vimc-sensor.c | 47 ++++++++++++++++++-
> >   3 files changed, 49 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/Kconfig b/drivers/media/test-drivers/vimc/Kconfig
> > index 4068a67585f9..da4b2ad6e40c 100644
> > --- a/drivers/media/test-drivers/vimc/Kconfig
> > +++ b/drivers/media/test-drivers/vimc/Kconfig
> > @@ -2,6 +2,8 @@
> >   config VIDEO_VIMC
> >   	tristate "Virtual Media Controller Driver (VIMC)"
> >   	depends on VIDEO_DEV && VIDEO_V4L2
> > +	select FONT_SUPPORT
> > +	select FONT_8x16
> >   	select MEDIA_CONTROLLER
> >   	select VIDEO_V4L2_SUBDEV_API
> >   	select VIDEOBUF2_VMALLOC
> > diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> > index ae163dec2459..afda52253402 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-common.h
> > +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> > @@ -20,6 +20,7 @@
> >   #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
> >   #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
> >   #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
> > +#define VIMC_CID_SHOW_INFO		(VIMC_CID_VIMC_BASE + 2)
> >   #define VIMC_FRAME_MAX_WIDTH 4096
> >   #define VIMC_FRAME_MAX_HEIGHT 2160
> > diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> > index a2f09ac9a360..f5352b115aac 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> > @@ -5,6 +5,7 @@
> >    * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
> >    */
> > +#include <linux/font.h>
> >   #include <linux/v4l2-mediabus.h>
> >   #include <linux/vmalloc.h>
> >   #include <media/v4l2-ctrls.h>
> > @@ -19,6 +20,7 @@ struct vimc_sen_device {
> >   	struct v4l2_subdev sd;
> >   	struct tpg_data tpg;
> >   	u8 *frame;
> > +	bool show_info;
> 
> I see that vivid saves the 'v4l2_ctrl*' of the controls,
> maybe you should also do that instead of saving a boolean,

Hi, I don't understand..isn't boolean the control?

> 
> >   	/* The active format */
> >   	struct v4l2_mbus_framefmt mbus_format;
> >   	struct v4l2_ctrl_handler hdl;
> > @@ -185,10 +187,29 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
> >   static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
> >   				    const void *sink_frame)
> >   {
> > +	u8 *basep[TPG_MAX_PLANES][2];
> > +	char *order;
> > +	char str[100];
> > +	int line = 1;
> 
> Those vars declarations can be inside the 'if (vsen->show_info)'

I declared it outside because I felt all declarations should be
together?

> 
> >   	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
> >   						    ved);
> > -
> >   	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
> > +	if (vsen->show_info) {
> > +		tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
> > +		order = tpg_g_color_order(&vsen->tpg);
> > +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, order);
> > +		snprintf(str, sizeof(str), " brightness %3d, contrast %3d, saturation %3d, hue %d ",
> > +			 vsen->tpg.brightness,
> > +			 vsen->tpg.contrast,
> > +			 vsen->tpg.saturation,
> > +			 vsen->tpg.hue);
> > +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, str);
> > +
> > +		snprintf(str, sizeof(str), " sensor size: %dx%d",
> > +			 vsen->mbus_format.width, vsen->mbus_format.height);
> > +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, str);
> > +	}
> > +
> >   	return vsen->frame;
> >   }
> > @@ -200,6 +221,14 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
> >   	if (enable) {
> >   		const struct vimc_pix_map *vpix;
> >   		unsigned int frame_size;
> > +		const struct font_desc *font = find_font("VGA8x16");
> > +
> > +		if (font == NULL) {
> Using 'if (!font)' is the way to check null pointer, instead of compering to null. Running checkpatch.pl with '--strict'
> will catch that.

I didn't do that to be consistent with vivid's style of code. Plus I
thought it makes it more clear to read. Should i change this?

> > +			pr_err("vimc: could not find font\n");
> 'dev_err' should be used instead of 'pr_err'.

yes sorry, i didn't now the difference.

> 
> Also, maybe checking the font here is a bit late, since the user already
> wants to stream and expect the info to be shown.
> Maybe it is better to check the font on 'vimc_sen_s_ctrl'.

Like show the control only of font is available?

I think showing the error is enough maybe?

> 
> Thanks,
> Dafna
> 
> > +			vsen->show_info = 0;
> > +		} else {
> > +			tpg_set_font(font->data);
> > +		}
> >   		/* Calculate the frame size */
> >   		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
> > @@ -269,6 +298,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
> >   	case V4L2_CID_SATURATION:
> >   		tpg_s_saturation(&vsen->tpg, ctrl->val);
> >   		break;
> > +	case VIMC_CID_SHOW_INFO:
> > +		vsen->show_info = ctrl->val;
> > +		break;
> >   	default:
> >   		return -EINVAL;
> >   	}
> > @@ -307,6 +339,17 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
> >   	.qmenu = tpg_pattern_strings,
> >   };
> > +static const struct v4l2_ctrl_config vimc_sen_ctrl_show_info = {
> > +	.ops = &vimc_sen_ctrl_ops,
> > +	.id = VIMC_CID_SHOW_INFO,
> > +	.name = "Show Information",
> > +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> > +	.min = 0,
> > +	.max = 1,
> > +	.step = 1,
> > +	.def = 1,
> > +};
> > +
> >   static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> >   					    const char *vcfg_name)
> >   {
> > @@ -323,6 +366,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> >   	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
> >   	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
> > +	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_show_info, NULL);
> >   	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
> >   			  V4L2_CID_VFLIP, 0, 1, 1, 0);
> >   	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
> > @@ -362,6 +406,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> >   	/* Initialize the frame format */
> >   	vsen->mbus_format = fmt_default;
> > +	vsen->show_info = vimc_sen_ctrl_show_info.def;
> >   	return &vsen->ved;
> > 
