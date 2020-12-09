Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E5F2D49E7
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 20:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387577AbgLITNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 14:13:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732757AbgLITNv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 14:13:51 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23A1C0613CF
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 11:13:10 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id v14so2511739wml.1
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 11:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QGsNCoFyuXYlWc+RPgiCYoYd99VmiPtmS4GDMy0qrO0=;
        b=JofIVOagIWas3YcijaSw42IPCrj+ur815zgh0C9+Sr7Gu2cmNPwAAP4LaRQD7BMs1+
         h8TTYyuoOys+8zvJHgr+zh13TxvGf07PJ8nWpPtkJN4VwlvM/jbHl/Ziw5yovt1Gexef
         6XyA4FegR9VUCCWDeuEW3bwRVWhDUYFGIFkM8OZ9LVDvy85ypJ7vX+uUH4OX/siOHP+g
         VxqroOjBvogVISIzZrnO7DCoa8IFu4IpLfq21qbCmRp7IKW2LzVpoxcBGe9Cw6446j5M
         lVeIEdISib9TWcDmwvcrd6wIm9n3Ozf7oBnvDSjC/lAWXBi49eatxmBvOoj3bJtkmwp9
         QUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QGsNCoFyuXYlWc+RPgiCYoYd99VmiPtmS4GDMy0qrO0=;
        b=UkXZm/MKl2GcM6B237O/1XMcjBaEhR6ZoHwKKlpE0xgNxFpzuqEAuxvYrLQzeIQKgJ
         uIgAOHjQTJTZQs9UGKH4lp86IQjpwdt2nUjuxI+9MtMq5/pFVrZldcxd7YRx/rBRFxCa
         0HUBOjqo+5Q8oHmLsDPDP6bWmHZjSCpSVTpbCapdp2m3DXdJlx3Tg8+uwMU2AGiloU6t
         ak2hyhE29MhWLW7JKPtlCG80QqvKTWY2y1U8bCEJ+TjhSBeZlx5GiOJAL/3AkRU+DKvs
         TGAItXnjR3bIPNpXdUeCLGVtnk2kzFOUH1iOW4Y4cDwoDoIQ52pfgX3fir8SWEtRMU3K
         pOqQ==
X-Gm-Message-State: AOAM5333QLKUSIETyrmWghNwrzGub3S7ZuAyTLsBfp8206s/hBXxuTic
        baNFsgjF6Y2fzdBSSxk1TMU=
X-Google-Smtp-Source: ABdhPJyYSU7HkwSz2JP0LWF+J7I6cZyVaBUFHcgx/kyIFI/ezHt9cub7pVPGD3EZqfehuZIRP09xIQ==
X-Received: by 2002:a1c:bc57:: with SMTP id m84mr4304369wmf.163.1607541189699;
        Wed, 09 Dec 2020 11:13:09 -0800 (PST)
Received: from localhost (p200300d1ff007700bf13caf5dd9666bd.dip0.t-ipconnect.de. [2003:d1:ff00:7700:bf13:caf5:dd96:66bd])
        by smtp.gmail.com with ESMTPSA id j7sm4763614wmb.40.2020.12.09.11.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 11:13:09 -0800 (PST)
Date:   Wed, 9 Dec 2020 20:13:07 +0100
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: Re: [PATCH] media: rkisp1: rsz: crash fix when setting src format
Message-ID: <20201209191307.smr27xutbizjp56w@basti.Speedport_W_724V_Typ_A_05011603_06_001>
Reply-To: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
References: <20201209161510.31399-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20201209161510.31399-1-dafna.hirschfeld@collabora.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Dafna,

Thanks for the patch, I quickly tested it and did some proofreading.

I was able to recreate the crash with following commands:

"media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_mainpath":1 [fmt:YUYV8_1_5X8/900x800]'
"media-ctl" "-d" "platform:rkisp1" "--set-v4l2" '"rkisp1_resizer_mainpath":1 [fmt:YUYV8_2X8/900x800]'

# This causes the crash:
"Unable to handle kernel NULL pointer dereference at virtual address 0000000000000004"

This patch fixed the problem.

On 09.12.2020 17:15, Dafna Hirschfeld wrote:
>When setting the source media bus code in the resizer,
>we first check that the current media bus code in the
>source is yuv encoded format. This is done by

s/is/is a/

>retrieving the data from the formats list of the isp
>entity. This cause a crash when the media bus code on the

s/cause/causes/

>source is YUYV8_1_5X8 which is not supported by the isp
>entity. Instead we should test the sink format of the resizer
>which is guaranteed to be supported by the isp entity.
>
>Fixes: 251b6eebb6c49 ("media: staging: rkisp1: rsz: Add support to more YUV encoded mbus codes on src pad")
>Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Tested-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>

>---
> drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>index 813670ed9577..79deed8adcea 100644
>--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
>@@ -520,14 +520,15 @@ static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
> 				   struct v4l2_mbus_framefmt *format,
> 				   unsigned int which)
> {
>-	const struct rkisp1_isp_mbus_info *mbus_info;
>-	struct v4l2_mbus_framefmt *src_fmt;
>+	const struct rkisp1_isp_mbus_info *sink_mbus_info;
>+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
>
>+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
> 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
>-	mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
>+	sink_mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
>
> 	/* for YUV formats, userspace can change the mbus code on the src pad if it is supported */
>-	if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
>+	if (sink_mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV &&
> 	    rkisp1_rsz_get_yuv_mbus_info(format->code))
> 		src_fmt->code = format->code;
>
>-- 
>2.17.1
>
