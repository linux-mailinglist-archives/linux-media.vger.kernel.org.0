Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514BC588695
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 06:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbiHCEiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 00:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiHCEiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 00:38:00 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481F04E602
        for <linux-media@vger.kernel.org>; Tue,  2 Aug 2022 21:37:59 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z22so20006698edd.6
        for <linux-media@vger.kernel.org>; Tue, 02 Aug 2022 21:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=B9R2VTIXzChIlzLU9ikhte7sHljOJrxbFAO9pAo4SlM=;
        b=MXOaU1R00oVlmDam7W4wEq5nfevTD9kI6MrtaVonOLOk0BBV8cSUtPtrdVY7Jj5Cia
         DRSPRPo4NVFABux7dgZ1Opvwjdm7+VHxTNd/pSl3fUQfxzmS1HliVd/nuglUg0c4uvec
         yT97yZQlxMD8Zgi5uEeCFOmHnQ321AiXBN3Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=B9R2VTIXzChIlzLU9ikhte7sHljOJrxbFAO9pAo4SlM=;
        b=tCIH5JJ3UV1rpgpDG/MnvL7gZ76Q60QVDOMLDn8EkQkfo7pTMwD1mPHMGgkcfhzysx
         Cwj3Cra7yc0nRVYx68NXTIi8Vu7moJzeHd/zBChbbTzq7ChRtBbwXFrKBSCTpHjNvUQw
         +gLx8ADqrJB6LnE+Nb79C9+1y4oZi+/h6bujQfRCFmuDocj/q+AzzmC/RgSlK8pgrSOQ
         dtv6pTTCETGGEFjMrHWQWToWK/06n9kQNhu6GRcA0y+m0zGIt91cua+ED7s4zGhUI9zF
         uR08ebkEw4gdlTGkgPW4WMmqdxul7zPQQrIGGCsJz+eijQ56JiuQmTPFQfRxjkihCiLT
         Kucg==
X-Gm-Message-State: AJIora+NMZLvktNLBzZvole0+8T373iPuUUgQQ4kCkbtSn7w9VCQEvkB
        LU1/nCHdEZacofCZBuug0nxslUiEhR8YB3cGsYtlCOkMd67gtA==
X-Google-Smtp-Source: AGRyM1u8N5Su+QgF9SUR7sKfAX22H1GvTvOUq/uiGKCAdyTGONHT/uk7yjmflkfK6WQuUqQq+2c7DCm2j5Y5jd6Wp6Q=
X-Received: by 2002:a05:6402:5513:b0:43a:b866:b9ab with SMTP id
 fi19-20020a056402551300b0043ab866b9abmr24446935edb.290.1659501477879; Tue, 02
 Aug 2022 21:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220802044242.1465815-1-hiroh@chromium.org>
In-Reply-To: <20220802044242.1465815-1-hiroh@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 3 Aug 2022 12:37:46 +0800
Message-ID: <CAGXv+5E+gpS-bJyuagRBbNvCJsZqGRb+tuTGzDbR7UPfD5n3ig@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Skip non CBR bitrate mode
To:     Hirokazu Honda <hiroh@chromium.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 2, 2022 at 12:42 PM Hirokazu Honda <hiroh@chromium.org> wrote:
>
> V4L2_MPEG_VIDEO_BITRATE_MODE_CBR is the only bitrate mode supported
> by the mediatek driver. The other bitrates must be skipped in
> QUERY_MENU.
>
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>

This should have a fixes tag:

Fixes: d8e8aa866ed8 ("media: mediatek: vcodec: Report supported bitrate modes")

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I believe this also makes the check in mtk_vcodec_enc.c:vidioc_venc_s_ctrl()
redundant.

> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index 25e816863597..ca7c4058f6b8 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -1403,7 +1403,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
>                                V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
>         v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
>                                V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> -                              0, V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
> +                               ~(1 << V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
> +                              V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
>
>
>         if (handler->error) {
> --
> 2.37.1.455.g008518b4e5-goog
>
