Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7DF6BEF92
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 18:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjCQRXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 13:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjCQRXe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 13:23:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41684D43A
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 10:23:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r18so5128705wrx.1
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 10:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679073811;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cD4duTKtxPjB04x09d+p9kcjB4mylat5Nf6rGmQI1U0=;
        b=WRlD8gXGdGyMhrAT0Y6VG4bSklmwgvYAyP+TlixxX2aUoQsv3u3SmP6bi96fFoWezO
         YKcSvofKxEj6sVIK9Zw0PrPUpD5BjwVU47e+cdXbuKn17Ksrj6NSgvDLc8Ehxf1ka0qo
         MEC48d3h6VknqE+ZRO12jgYoXl/IDEpblPoBqXGZln0t/Kj/G9C9wngCvbTvdDqPK0Pf
         3wtTVWsSrzvzHUE9K1g3D7Ii5gHUVm4fAEvm3JHyXuurCK2+XX3Sqz5aE5thR21vc8sc
         h9AgyM03vZZfpTq/NYFmLdWprL3j6pXIo5pnUgPZLAja4TGwnU/DUlb67IfRwRZ7Dgpq
         DCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679073811;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cD4duTKtxPjB04x09d+p9kcjB4mylat5Nf6rGmQI1U0=;
        b=6MShdVhLbvDRQZF2ffBnnjKqlYrVOo4oid5n5qIN76VFpmChiPl37TtjKj5vgQ5zxV
         hUhMMti6FIDSOVXZ8X6WUVkUND6JXaFavsmkBMKdGLc0PR+FVM/zztXUqa0OjmNSHyuD
         CmbU1t8xcQ2hHqm6N8uxWd88MQsPzd3k3iI02QWN3XIbNQKUhRkPRDt5RGAlYR+4BB/f
         XZpZb6iMZbN6cmx8NbZnD1j6bfSyJOzFSuB5TvvQtHa7YUD8Y4NqvpMeUGZzA0SGq4Q+
         A+xe3TlSbr39eJc6yv7YLfuYYZLJxt79Yu4CN7RMkGjJpGbze6Npc4uM+bWctjdpCZWb
         NEOQ==
X-Gm-Message-State: AO0yUKVl8ctMKvD/4PDrSTV67PjKHwYApR6KjSh93llZY5H86AhB4wNH
        3lv+hFrBOYUXdEaTpXZdDbI=
X-Google-Smtp-Source: AK7set+khR7sfHbrOB23qGhEm1L0AJjHdpqzNDSucKBpt+gO9poP++QCURdmSqc4ddOWKeh9uyUynw==
X-Received: by 2002:adf:db46:0:b0:2ce:aad8:9bee with SMTP id f6-20020adfdb46000000b002ceaad89beemr6639020wrj.46.1679073811449;
        Fri, 17 Mar 2023 10:23:31 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id h6-20020adffa86000000b002c573cff730sm2422376wrr.68.2023.03.17.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 10:23:30 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: imx: imx7-media-csi: Fail for non
 video-capture formats
In-Reply-To: <20230316143829.499039-4-alexander.stein@ew.tq-group.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
 <20230316143829.499039-4-alexander.stein@ew.tq-group.com>
Date:   Fri, 17 Mar 2023 17:23:29 +0000
Message-ID: <m3o7or47hq.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,
thanks for the patch.

Alexander Stein <alexander.stein@ew.tq-group.com> writes:

> This driver only support V4L2_BUF_TYPE_VIDEO_CAPTURE, so fail for other
> passed types.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index 389d7d88b341..e470b0505d3b 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1186,6 +1186,11 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>  static int imx7_csi_video_try_fmt_vid_cap(struct file *file, void *fh,
>  					  struct v4l2_format *f)
>  {
> +	struct imx7_csi *csi = video_drvdata(file);

Maybe copy/paste problem csi is never used.

> +
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;

Is this function ever called if f->type is not TYPE_VIDEO_CAPTURE?

> +
>  	__imx7_csi_video_try_fmt(&f->fmt.pix, NULL);
>  	return 0;
>  }
> @@ -1196,6 +1201,9 @@ static int imx7_csi_video_s_fmt_vid_cap(struct file *file, void *fh,
>  	struct imx7_csi *csi = video_drvdata(file);
>  	const struct imx7_csi_pixfmt *cc;
>  
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		return -EINVAL;

Ditto?

Cheers,
   Rui
> +
>  	if (vb2_is_busy(&csi->q)) {
>  		dev_err(csi->dev, "%s queue busy\n", __func__);
>  		return -EBUSY;
> -- 
> 2.34.1
