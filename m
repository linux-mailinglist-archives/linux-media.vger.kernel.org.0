Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50836557239
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 06:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbiFWEqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 00:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238333AbiFWDus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 23:50:48 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8643D3DA6B
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 20:50:46 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g25so38292310ejh.9
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 20:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EkKyTWCu629nMEHdFNbptooutbfUA4/TnE+Ay2cBeTk=;
        b=MZ+ZBJ+075YeJab2Z38SqspmTsuzV22kvWs0oDrbgCpPUCy0S5cZmqdbVpkFCG4VMY
         q2FvSp0oYLhLsR8UIJ3x5vc2rF1i0Rg4zuz4c9+BfxNiK0RT/jA/Thflg8GpMM59m9Fg
         g6Zv0MzH2tHEFaNqF789CSRMggNM4NKdS0I4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EkKyTWCu629nMEHdFNbptooutbfUA4/TnE+Ay2cBeTk=;
        b=K+YgYP5/bTL7PYWettp3ou74vaCuWRYkVPAd74bcjgjumMLEkdn36xLA3EOTFbnfot
         2Cg3mS/S3b2P/nqXPFOI3OgnuocmjXkoexua/zmMTNMXE5KnEz1KzeNb8NN1hxq2YcJ+
         8ZvyHGbKMSYCjkvWHHyLRJ6rQE1ub0BUBUcPSgRgqKoeM1sxNywrOTLNAWElkR2igoz3
         uPPEJQJcboOqdKsND2gHmUYLlub8PH2/Vdy/tZG7Z9GKfNKeRwScy+GUirsqwEJ6UBRN
         AYBagtada/304uSw1EzYs/iRz3T98X6c5Sf0INyMrrlhYE1Vr7Fmtb5UaN6Q3XDM3AUi
         hudA==
X-Gm-Message-State: AJIora+pAMmTiwdsvgWpIKyioUQqyN68rjS0AySj25xGlhRhIZu8XGWY
        dhGS22CMNBAz1Mvr0ceNIQDURa3xuVtGgQZnzsjAj+cByOc=
X-Google-Smtp-Source: AGRyM1sVSORghjjCvJa3JKdWdVzFkzY/RKVDx3S+DYXKStNi3Lz7s6kMPfvJvxThk3ktXC824PuqCbj4rwwrimxPZ8o=
X-Received: by 2002:a17:906:f84:b0:711:eda5:db31 with SMTP id
 q4-20020a1709060f8400b00711eda5db31mr5751742ejj.397.1655956245142; Wed, 22
 Jun 2022 20:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220622083624.3204916-1-hiroh@chromium.org>
In-Reply-To: <20220622083624.3204916-1-hiroh@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 23 Jun 2022 11:50:34 +0800
Message-ID: <CAGXv+5EEzvtBdeV2pU4cYbrnRNok=Pm-ioc66Og4=sOEuNrStA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Report supported bitrate modes
To:     Hirokazu Honda <hiroh@chromium.org>
Cc:     linux-media@vger.kernel.org, Irui.Wang@mediatek.com,
        stevecho@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 22, 2022 at 4:37 PM Hirokazu Honda <hiroh@chromium.org> wrote:
>
> The media driver supports constant bitrate mode only.
> The supported rate control mode is reported through querymenu() and
> s_ctrl() fails if non constant bitrate mode (e.g. VBR) is requested.
>
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> ---
>  .../media/platform/mediatek/vcodec/mtk_vcodec_enc.c   | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index c21367038c34..98d451ce2545 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -50,6 +50,14 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
>         int ret = 0;
>
>         switch (ctrl->id) {
> +       case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
> +               mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE_MODE val= %d",
> +                              ctrl->val);
> +               if (ctrl->val != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
> +                       mtk_v4l2_err("Unsupported bitrate mode =%d", ctrl->val);
> +                       ret = -EINVAL;

I wonder if this code will ever actually be hit. This driver uses
v4l2_ctrl_handler, and IIUC all controls are prevalidated by the core
before this callback is called.


ChenYu

> +               }
> +               break;
>         case V4L2_CID_MPEG_VIDEO_BITRATE:
>                 mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE val = %d",
>                                ctrl->val);
> @@ -1373,6 +1381,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>                                0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
>         v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
>                                V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
> +       v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
> +                              V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +                              0, V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
>
>
>         if (handler->error) {
> --
> 2.37.0.rc0.104.g0611611a94-goog
>
