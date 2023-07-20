Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E903A75B789
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 21:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjGTTJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 15:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjGTTJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 15:09:25 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC6F2711
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 12:09:23 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-267711d2b43so207753a91.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 12:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689880162; x=1690484962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSoXuGhX+8yQXzcITg+GBvfy1BNzP6Nm9GarxZehFAI=;
        b=NBQChcbR+3EsDO+bEL/FzOVux3FFDHCpdoZ0LN/l+hsxLtMZEYBjGRtjtkawFVPkew
         lblgC66GlIWXV9a6sd6L812zEdTSPwIZdIyHEyLgeXHC0EvnixyH7MtLCb0aWgIHWbus
         mTPVa+wLz09ianC/OI7fKuJYYlPtrw8ule9RCC7F9ny4rqRDRhFLu2VkxH59CCNnxfUt
         fEpwymyunNUhlH55dOXOniflRjyRTkHIxm7HHDC4+xCCPS0ugoIsSUjHs7TDppMekouC
         HZyNNBHJAKGsKCW2LZCldfiah3CFTEVvuFFOKklxkIO00999sySPw4df8Vpa+uKLCEOK
         1QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689880162; x=1690484962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSoXuGhX+8yQXzcITg+GBvfy1BNzP6Nm9GarxZehFAI=;
        b=P66tRdKLy/XTAkRsDnAKy11tX5hpZhbxz51T/qY7nygpjjLDbc1zwj8ezBZoyQkPFq
         mUY9q892N6rM5bURy8iX87VkHEGfkKcrYLRm9mKFJzoElDfgwLfd2zKAgW2kGrkd7Qal
         brvQZpV7w4PHbISLOdDUxe6G2DvmSQGJbX2bmjG0zHTH1Nm5g5BVLvXzKVI+2YHOzKyS
         gcTKg6l6Ze+mJWlAVJY6/vwWy5c06NffRysJDYhIeU+ZjH7gARTssRJ9y5DPWaEVO2im
         BHRAdl9xDa52vQnRNVbINZ43skLlR5U3N0nD/+azv3Q5ukB0QqzuvMGc+TVR7K8T9QXa
         /icA==
X-Gm-Message-State: ABy/qLbN6vsa5lfOyCu9LKBqMQ7e6pmIQC6bFGDYxCKq0DCZKs25YJ6+
        nVB46hHU3M1/8++A8URVMXqXs1M9OwK9uxQUOig=
X-Google-Smtp-Source: APBJJlGpVDhpXYcYil3PJhbK+lG6U1dR+wOxxDh2/dj/GXYsBiIPvSrpgoFFXiGkXnzSNODAdkB8q7TlQgN4Cd5JoaQ=
X-Received: by 2002:a17:90a:3e05:b0:25b:88bc:bb6b with SMTP id
 j5-20020a17090a3e0500b0025b88bcbb6bmr3058001pjc.2.1689880162531; Thu, 20 Jul
 2023 12:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
 <2290635.ElGaqSPkdT@steina-w> <CAJ+vNU0_LwY+4_9LT7-Cin4Otv3ne20N72TdsfzV4odEMQrLOg@mail.gmail.com>
 <844922189.0ifERbkFSE@steina-w> <CAJ+vNU21HytYLDojnPqLu8a9BRGRbMNgmGzdqbm67_5TYZT2tg@mail.gmail.com>
 <CAOMZO5CWLRq+_Cg0hd42G0XA-NASDp3PDezg9sE18CZ-uNrVDQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CWLRq+_Cg0hd42G0XA-NASDp3PDezg9sE18CZ-uNrVDQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 20 Jul 2023 16:09:10 -0300
Message-ID: <CAOMZO5AoWRr+PdE9_+31b187XgCKTYKBcNq5F++UDrhqQQ1F4A@mail.gmail.com>
Subject: Re: media: imx: imx7-media-csi: Get rid of superfluous call to
 imx7_csi_mbus_fm t_to_pix_fmt
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 20, 2023 at 3:47=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> Does it work if we do like this?
>
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1108,6 +1108,17 @@ static int imx7_csi_video_g_fmt_vid_cap(struct
> file *file, void *fh,
>         return 0;
>  }
>
> +/* borrowed from drivers/media/v4l2-core/v4l2-common.c */
> +static unsigned int clamp_roundup(unsigned int x, unsigned int min,
> +                                 unsigned int max, unsigned int alignmen=
t)
> +{
> +       x =3D clamp(x, min, max);
> +       if (alignment)
> +               x =3D round_up(x, alignment);
> +
> +       return x;
> +}
> +
>  static const struct imx7_csi_pixfmt *
>  __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
>                          struct v4l2_rect *compose)
> @@ -1137,8 +1148,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pi=
xfmt,
>          * TODO: Implement configurable stride support.
>          */
>         walign =3D 8 * 8 / cc->bpp;
> -       v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
> -                             &pixfmt->height, 1, 0xffff, 1, 0);
> +       pixfmt->width =3D clamp_roundup(pixfmt->width, 1, 0xffff, walign)=
;
> +       pixfmt->height =3D clamp_roundup(pixfmt->height, 1, 0xffff, walig=
n);

Actually the height should be:

pixfmt->height =3D clamp_roundup(pixfmt->height, 1, 0xffff, 1);
