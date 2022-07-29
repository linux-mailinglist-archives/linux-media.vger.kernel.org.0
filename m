Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37CD584DF3
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 11:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235582AbiG2JQ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 05:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiG2JQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 05:16:26 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEADF60693
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 02:16:25 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id e127so6458528yba.12
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 02:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getcruise.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=S0cf0vCvwAMiskjsDal3L//FidW8slHdGXI3PTm80O4=;
        b=Mckgi1I6fEPgCTabTmR5qUsXGoOQvWpVQc19JE7GsxpCV8P7qAVSDddk8jjecQEaHF
         WU+uUw2siOTtTtG3vgL8NeCgibGg8D5trqD5bGu9Z6bqBNtN/eghGRzfqe8DJ1izcNfH
         1R5bdN8DUbvLYEmGcydY7CilTS/qbhtCo7YCOoak/DhfLowq9vX3Svzdvgfz5ivMHMNo
         FLywQm14RD32LuSYY5IGBMnKohTrFxXBKmFmT6nMLoaX/Jc596IyIuOsJxt8k4aBPMDs
         xgTgXudMUozAoVQxDiMOyX4LbJn6vo77oh3dmUje+Um/ePZSiHGPUtRl7sbG10tHRT9d
         zS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=S0cf0vCvwAMiskjsDal3L//FidW8slHdGXI3PTm80O4=;
        b=NGPBRB63v+BgN0qYXAz8bha1LfpI9vVMH3QAcQsHzGQXBH0v/xy0GeIrF1D+zDZh61
         mpRz2dtudpmrsjZib6k2MOWdlGf16fzfPMkDwiihGis2aUUAK9lcSGvc3eotY4dYCk4N
         p/WUC+Ek5WERRbSBnZ011py3BvpGEu13Cyi+KV09L4qzMk68dscb0FQuyIcFdvhIplGZ
         0iHrA5gboNnNkv1/vVUu4dA2Lepy8Whvt9lZY0MmvguHKK9x3Y9TsownvtZxsPYAzGht
         1r6X7OrroYCROVkkjfI5ipB7EP6BlYwMSpelV3vrEpeDMWDSbVvgmtODrqpmRKSCD/dO
         r4vw==
X-Gm-Message-State: ACgBeo3h+LMbLeOHNN6QjVuURWQfAixR5ZIVQ9sQYulE88S6Yi60o448
        /tCWojXLlZhZvLe4pcd3w+V2vKfw3W4SL0MMicBRzA==
X-Google-Smtp-Source: AA6agR59XVNXfZGqctXz5G5fSgilpzaN2ny2BlXiTyXNwUY/UR2AKL7dARs8sJZPO0bixlrA1RgHK6vaXbwvkuliqug=
X-Received: by 2002:a25:4d83:0:b0:676:b6cf:ed23 with SMTP id
 a125-20020a254d83000000b00676b6cfed23mr686985ybb.254.1659086184727; Fri, 29
 Jul 2022 02:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com> <20220727103639.581567-21-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220727103639.581567-21-tomi.valkeinen@ideasonboard.com>
From:   Satish Nagireddy <satish.nagireddy@getcruise.com>
Date:   Fri, 29 Jul 2022 02:16:14 -0700
Message-ID: <CAG0LG94pP4=ifCqt_swta2Av6hx9uMGizmOpwq_g7zKFtt2G=A@mail.gmail.com>
Subject: Re: [EXT] [PATCH v12 20/30] media: subdev: add streams to
 v4l2_subdev_get_fmt() helper function
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thanks for the patch.

On Wed, Jul 27, 2022 at 3:37 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Add streams support to v4l2_subdev_get_fmt() helper function. Subdev
> drivers that do not need to do anything special in their get_fmt op can
> use this helper directly for v4l2_subdev_pad_ops.get_fmt.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 0dd612f09f35..95fd2e07d69f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1455,10 +1455,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  {
>         struct v4l2_mbus_framefmt *fmt;
>
> -       if (format->pad >= sd->entity.num_pads)
> -               return -EINVAL;
> +       if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> +               fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> +                                                         format->stream);
> +       else if (format->pad < sd->entity.num_pads && format->stream == 0)
> +               fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
> +       else
> +               fmt = NULL;

fmt can be initialized to NULL at the declaration, so that the above 2
lines can be removed.

Regards,
Satish

>
> -       fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
>         if (!fmt)
>                 return -EINVAL;
>
> --
> 2.34.1
>
