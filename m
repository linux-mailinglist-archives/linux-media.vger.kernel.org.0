Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B48657D0BB
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 18:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiGUQI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 12:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiGUQIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 12:08:55 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CD361DA9
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 09:08:55 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id sz17so3963431ejc.9
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LCSMqVg6V7FGxMrLZq7q03bgacJ/LY1rvlQcx+C4n/Y=;
        b=pUUzX1Yig0FnRUr3J6hYSWKTRR45Xzxxz92DrkOtyOPj7dsEyMZGUuUk+riQGOKcZB
         6tOeGKdw3wYVMLTOvKTjcwQJb7XINu1V/UI8FZI3+LP7fa1ggH3S972ohln8Mty0Ji+v
         EaPhp6hPAzC6zYxb8MMF46MS4qYZ89wo/SaRHDz9b6ZD7llllBrWG3ZWmnsiDLxj5ctO
         MT868qQ5tYd3BFofQsXtHxFw90O8QelrgHS/tjLsZgJuhDi6em6BSjrIpAGcpOvhcMil
         oyuZSYw9auBEvOcoGtZzea9rTBr+uWgfLZIFUvZcPmPdL+KREc9QUZeLJFarHar8wdye
         MI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LCSMqVg6V7FGxMrLZq7q03bgacJ/LY1rvlQcx+C4n/Y=;
        b=ivM2OtwhZs6ZfcYHkUaSiwGmN8YI7x0ubUtjBQji48cp2ReOLFrX1cdEmOfgGwTdBZ
         pss+qTMb4toFJDAb8Ickm3TmwoH5b7baK29wYBOQwRVjvkO44DxZ2BJo8TvzlsL6+jcQ
         gBcyscS566IaJxxCHNjJwwOqAxV9y/LOatLy67T+bN2Qg9bqB90QCVoA7YwjGNavgdHu
         GJkeBKk12tfZdlQIPHsnXbeucW/oIBPRS4CBBcc9yLgLS5i0kcXI8knRTL1uGXL6xTvT
         8QI4qmshqEbiwnMDLJwTNOHx9SGpLkvGFbJDr/rlzmCpUr73y3S2hJUnP05dUPzBb1+G
         SY3A==
X-Gm-Message-State: AJIora8zNGrKFYZtrFxdXt8GDmeC5OvQ5EoSUY7JDMdoPxzSspbnd9gx
        Opt7tODAtXahSynyrLYps3YmYo2gWyLqqzPr1pmehA==
X-Google-Smtp-Source: AGRyM1vscIQo/+xy7dBKtp9I1PdKXkKNEmiDsuRfeqfoF7J0CwLtjsndJwIaUzD3F8yOiqpZDYicVMy69fqs15Wg6hM=
X-Received: by 2002:a17:906:4fd5:b0:72e:ce13:2438 with SMTP id
 i21-20020a1709064fd500b0072ece132438mr39359955ejw.175.1658419733482; Thu, 21
 Jul 2022 09:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-13-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220721083540.1525-13-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 21 Jul 2022 17:08:37 +0100
Message-ID: <CAPY8ntAibtuRKnA7+YJKugMNNAz=kiKkFmCN1z9hFitPgsZM=g@mail.gmail.com>
Subject: Re: [PATCH 12/19] media: i2c: imx290: Fix max gain value
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 21 Jul 2022 at 09:36, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The gain is expressed in multiple of 0.3dB, as a value between 0.0dB
> and 72.0dB. The maximum value is thus 240, not 72.

At this point in the series I'll agree with you as it is for V4L2_CID_GAIN.
However later in the series you convert to V4L2_CID_ANALOGUE_GAIN, and
there I disagree.

The register is for a combined 0-30dB of analogue gain, and 0-42dB of
digital gain, both in 0.3dB steps.
V4L2_CID_GAIN can have a range of 0-240.
V4L2_CID_ANALOGUE_GAIN has a range of 0-100.

Minor additional point: IMX327 is the previous version of this and
only goes up to 1080p60 instead of 1080p120 (10bit only). That
supports 0-29.4dB of analogue gain, and 42dB of digital gain, for a
max value of 238. If using the definition for analogue gain only, then
you may end up with 0.6dB of digital gain instead, but it will work.
IMX462 is the newer version and supports 1080p120 in 10 or 12bit. I
don't have a full datasheet for it, but the product brief lists
0-29.4dB of analogue, and 42dB of digital gain, same as IMX327.
Seeing as the 120fps modes are not implemented in this driver, it
currently supports all 3 models.

  Dave

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 3cb024b73ee7..1bd464932432 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1020,7 +1020,7 @@ static int imx290_probe(struct i2c_client *client)
>         imx290->ctrls.lock = &imx290->lock;
>
>         v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -                         V4L2_CID_GAIN, 0, 72, 1, 0);
> +                         V4L2_CID_GAIN, 0, 240, 1, 0);
>
>         v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>                           V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 1,
> --
> Regards,
>
> Laurent Pinchart
>
