Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB4B1F99E6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 16:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730434AbgFOORg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 10:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730082AbgFOORf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 10:17:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E396C05BD43
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 07:17:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h22so3828510pjf.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZG1ZhoZ17C2Xkrj8ry7x1G0fc2bFn4R+IS3sxHvNHdM=;
        b=T5oSEbiHg7+qBkm9MxKxZPfcrW/HJ66KCZEGJmkfuEeQafEv6QI7MLg41el99wdJbM
         yoj4IQ14/FoUXS2dkMaTKN5tzmDLrMtymZpgMB26xQWWu1bxbcSXvWfpPXeBQXoTjG1L
         /yQDhsvgXRGvAV8lMq+sOyK5Nvlm+c27izY1AFwcaUvDXpfPHP0yOpxvMDJ1Xj0/kIX0
         qc6NREkuGXCZ3lCHdy33phUxM7xuVrf06P/vIwYo/bJZJaPKQVC93mQrF5NZhCcyrloR
         m13gqsqRlH8qBN/A9BYF58QilZTnAzrjuH6wVxhbTcEbKGjwTg7FaC9hhnaYyGD77v/W
         kVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZG1ZhoZ17C2Xkrj8ry7x1G0fc2bFn4R+IS3sxHvNHdM=;
        b=B5G5j2Ttd4NvTDXuq5A+zMt1lPHbgZU/r1S5DlUw+HZZI5xFqx+31m9SJNU86DHSOU
         QXgeYh/cBtMV2P2DsV9S1uSeM7Pg/A6AZYBFeWzpQnljxT03KwL09NJvArB3t1ZoVuVj
         2d1pwDzpydbkEEayi+P29xksVQf/FeGTm6+DXTC96e8g6e/aT/vXFfmc8qn04MXMXjQQ
         eebqNK3tg6B4mjjPA9mu/aN/rs+A9eub1by2jUbzon027ZGCkMSDYhSMYRENCUtw1H36
         htWBMehdR8qyh4Q+qDMPqlJhrXR9vy8VJ7aTxpDTgw92RDsFTnsEe3VhTpFilvdAbzAj
         tDBQ==
X-Gm-Message-State: AOAM530WOH5ZoUeMAkhQnGKcMfik2BPtBSjHStp5SOjb3wgUD8RmgGcp
        RikrZbZg9nlUMKGX1cOT34RwlqzXmdqyBA==
X-Google-Smtp-Source: ABdhPJzuN4qzmubTRkvgksLWBpvEN0ZxwPpfZuiIQ/9U0BeX7jNBDyMO9SHSGvt0mdnKsiDAQ84Z0g==
X-Received: by 2002:a17:90a:744f:: with SMTP id o15mr12778051pjk.54.1592230654484;
        Mon, 15 Jun 2020 07:17:34 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([2401:4900:4175:6d71:a599:7e9c:28e:a9a7])
        by smtp.gmail.com with ESMTPSA id e78sm14122102pfh.50.2020.06.15.07.17.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 07:17:33 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Mon, 15 Jun 2020 19:47:21 +0530
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v2 2/2] media: vimc: Add a control to show test pattern
 colors' order
Message-ID: <20200615141721.GA16952@kaaira-HP-Pavilion-Notebook>
References: <20200614200239.18453-1-kgupta@es.iitr.ac.in>
 <20200614200239.18453-3-kgupta@es.iitr.ac.in>
 <0ec47745-dcb4-4b40-1c53-093491856597@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec47745-dcb4-4b40-1c53-093491856597@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 15, 2020 at 12:48:20PM +0100, Kieran Bingham wrote:
> Hi Kaaira,
> 
> On 14/06/2020 21:02, Kaaira Gupta wrote:
> > Add a control in VIMC to show the correct order of the colors for a
> > given test pattern.
> > The control can be accessed by using show_colors_order in v4l2-ctl
> > 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >  drivers/media/test-drivers/vimc/Kconfig       |  2 ++
> >  drivers/media/test-drivers/vimc/vimc-common.h |  1 +
> >  drivers/media/test-drivers/vimc/vimc-sensor.c | 34 +++++++++++++++++++
> >  3 files changed, 37 insertions(+)
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
> > index ae163dec2459..52376ba6146b 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-common.h
> > +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> > @@ -20,6 +20,7 @@
> >  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
> >  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
> >  #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
> > +#define VIMC_TEST_PATTERN_ORDER		(VIMC_CID_VIMC_BASE + 2)
> 
> This should have the prefix CID like the others. I believe that stands
> for "Control ID"
> 
> As below, I think it might warrant being a more generic name for the OSD
> overlay, as it could display more than just the colour sequence.

Yes, Okay..I think I'll make a separate patch for adding all the text
that VIMC can show including the color order, and let the 1st patch of
this series be a separate patch?

Should the colors' order text be added to VIVID as well?

> 
> 
> >  
> >  #define VIMC_FRAME_MAX_WIDTH 4096
> >  #define VIMC_FRAME_MAX_HEIGHT 2160
> > diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> > index a2f09ac9a360..da625f6accce 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
> >   */
> >  
> > +#include <linux/font.h>
> >  #include <linux/v4l2-mediabus.h>
> >  #include <linux/vmalloc.h>
> >  #include <media/v4l2-ctrls.h>
> > @@ -19,6 +20,7 @@ struct vimc_sen_device {
> >  	struct v4l2_subdev sd;
> >  	struct tpg_data tpg;
> >  	u8 *frame;
> > +	bool show_colors_order;
> 
> I would say it's the 'sequence' 'show_color_sequence' but it's still a
> bit long ... but maybe that doesn't really matter.

If its generic for all the information maybe it should be
show_info?

> 
> 
> >  	/* The active format */
> >  	struct v4l2_mbus_framefmt mbus_format;
> >  	struct v4l2_ctrl_handler hdl;
> > @@ -185,10 +187,18 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
> >  static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
> >  				    const void *sink_frame)
> >  {
> > +	u8 *basep[TPG_MAX_PLANES][2];
> > +	char *str;
> >  	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
> >  						    ved);
> >  
> >  	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
> > +	if (vsen->show_colors_order) {
> > +		tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
> > +		str = tpg_g_color_order(&vsen->tpg);
> > +		tpg_gen_text(&vsen->tpg, basep, 1, 1, str);
> > +	}
> > +
> >  	return vsen->frame;
> >  }
> >  
> > @@ -200,6 +210,14 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
> >  	if (enable) {
> >  		const struct vimc_pix_map *vpix;
> >  		unsigned int frame_size;
> > +		const struct font_desc *font = find_font("VGA8x16");
> > +
> > +		if (font == NULL) {
> > +			pr_err("vimc: could not find font\n");
> > +			return -ENODEV;
> 
> I wonder if this should instead just disable text rendering instead?

Shouldn't the user know why he can't see the text?

> 
> It might be reasonable to compile the kernel without the font-library ?

I have added the support in its Kconfig, isn't that okay?

> 
> > +		}
> > +
> > +		tpg_set_font(font->data);
> >  
> >  		/* Calculate the frame size */
> >  		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
> > @@ -269,6 +287,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
> >  	case V4L2_CID_SATURATION:
> >  		tpg_s_saturation(&vsen->tpg, ctrl->val);
> >  		break;
> > +	case VIMC_TEST_PATTERN_ORDER:
> > +		vsen->show_colors_order = ctrl->val;
> > +		break;
> >  	default:
> >  		return -EINVAL;
> >  	}
> > @@ -307,6 +328,17 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
> >  	.qmenu = tpg_pattern_strings,
> >  };
> >  
> > +static const struct v4l2_ctrl_config vimc_sen_ctrl_order = {
> > +	.ops = &vimc_sen_ctrl_ops,
> > +	.id = VIMC_TEST_PATTERN_ORDER,
> 
> Now that you've brought in support for rendering text on the frame, I
> wonder if more information should be displayed just like VIVID does.
> 
> In that case, it would probably be better to have a more generic control
> that enables all of the text OSD with a more generic name.

Yes, I will change that

> 
> 
> > +	.name = "Show Colors Order",
> > +	.type = V4L2_CTRL_TYPE_BOOLEAN,
> > +	.min = 0,
> > +	.max = 1,
> > +	.step = 1,
> > +	.def = 1,
> > +};
> > +
> >  static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> >  					    const char *vcfg_name)
> >  {
> > @@ -323,6 +355,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> >  
> >  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
> >  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
> > +	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_order, NULL);
> >  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
> >  			  V4L2_CID_VFLIP, 0, 1, 1, 0);
> >  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
> > @@ -362,6 +395,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
> >  
> >  	/* Initialize the frame format */
> >  	vsen->mbus_format = fmt_default;
> > +	vsen->show_colors_order = vimc_sen_ctrl_order.def;
> >  
> >  	return &vsen->ved;
> >  
> > 

Thanks for your time :D

> 
> -- 
> Regards
> --
> Kieran
