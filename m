Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0B275B70D
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 20:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjGTSsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 14:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjGTSr7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 14:47:59 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DABE4C
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 11:47:59 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5576ad1b7e7so140102a12.1
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 11:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689878878; x=1690483678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh7OSXy74Boc+d9yjbLwI/FIXYgoheDooDaAsZ7vzXY=;
        b=faHK+gQHpgIjIWLgw4BO7aWtVaBbU5Wzi+C81ymcv2yJ69Ds92/YbxevXPxp8ySYTq
         iN416wl33xgnVkbo0zxNO/rCNyqeTgW+hd854GTZS81CsygrSeg1w8BeunC4g4+xjjQz
         1boulY3uk4tTeyxMTB5mekScjAsow4SUYg7eYisx3KlxyzN6VXFfYw8NaG9VdRstnPVX
         2lX8O0kwe5VvmZT2P7hGHXqL4ZzkHwZIqwii/bItGXhUWtIbtFCJQRQZEVkcWDoAXXTo
         s50IMV3P3Hx7EyVOEiZchI//OB04zQZEJY02r0UGhnh7Xj1+t8ya0XeRMf3xsQUZoOud
         ap2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689878878; x=1690483678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh7OSXy74Boc+d9yjbLwI/FIXYgoheDooDaAsZ7vzXY=;
        b=c1EftdZRjumHENAef/tedCR9OOc5o49DO5XgKs7oLHFhOaB5Hde13wVEPVGrNcMBTa
         My9M4sEvxBjfcuI7ClKpVySRHFHF5pK9Jiw91L43ojafdw+Z+lDUNvz3mxE2Kv0rAYbg
         BhJByeWHvH6P/eEsvJ37djHdnzPpNhdiDF1gCeRvjJycr/mj+RTv1mQzOim9gypy2HKW
         Onh6XhT/Q22Z8EagScLLe6pQBmHV5L3reSPpNA9lywNaFHlPursDO6GALtF054tHuSnz
         zQspR1V57T8EAAHg2zdaYVYTk4nr/TjeVaPsv+/xDZeusGSsbNB2QBKzlGlB+wOd33vO
         k5DQ==
X-Gm-Message-State: ABy/qLYd9bi0ne2p7i9gCDyPwPr/FlYFhQfFCWlVDkv3M/RLLoItliDm
        /uLCLCM7rZkhZRl7bLeuOjL/EmyzDd184Z3eSlc=
X-Google-Smtp-Source: APBJJlHzTyXylmh83eCRlcFgaFmP1UwlAmEqKDXKJSoK8eVeZ9ZXhCYUoGTUSvhB4uFA6V/VqYb7GoNOAzKnzul6e9k=
X-Received: by 2002:a17:90a:6a8f:b0:267:a5db:4834 with SMTP id
 u15-20020a17090a6a8f00b00267a5db4834mr2885098pjj.1.1689878878369; Thu, 20 Jul
 2023 11:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
 <2290635.ElGaqSPkdT@steina-w> <CAJ+vNU0_LwY+4_9LT7-Cin4Otv3ne20N72TdsfzV4odEMQrLOg@mail.gmail.com>
 <844922189.0ifERbkFSE@steina-w> <CAJ+vNU21HytYLDojnPqLu8a9BRGRbMNgmGzdqbm67_5TYZT2tg@mail.gmail.com>
In-Reply-To: <CAJ+vNU21HytYLDojnPqLu8a9BRGRbMNgmGzdqbm67_5TYZT2tg@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 20 Jul 2023 15:47:46 -0300
Message-ID: <CAOMZO5CWLRq+_Cg0hd42G0XA-NASDp3PDezg9sE18CZ-uNrVDQ@mail.gmail.com>
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

On Thu, Jul 20, 2023 at 12:12=E2=80=AFPM Tim Harvey <tharvey@gateworks.com>=
 wrote:

> clamp_roundup is static in v4l2-common.c so it would have to be
> something like the following:
>
>         pixfmt->width =3D round_up(clamp(pixfmt->width, (unsigned int)1,
> (unsigned int)0xffff), walign);
>         pixfmt->height =3D round_up(clamp(pixfmt->height, (unsigned
> int)1, (unsigned int)0xffff), walign);
>
> the above works. I'm not sure how to keep the compiler from
> complaining about types other than typecasting the min/max values as
> above.

Does it work if we do like this?

--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1108,6 +1108,17 @@ static int imx7_csi_video_g_fmt_vid_cap(struct
file *file, void *fh,
        return 0;
 }

+/* borrowed from drivers/media/v4l2-core/v4l2-common.c */
+static unsigned int clamp_roundup(unsigned int x, unsigned int min,
+                                 unsigned int max, unsigned int alignment)
+{
+       x =3D clamp(x, min, max);
+       if (alignment)
+               x =3D round_up(x, alignment);
+
+       return x;
+}
+
 static const struct imx7_csi_pixfmt *
 __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
                         struct v4l2_rect *compose)
@@ -1137,8 +1148,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixf=
mt,
         * TODO: Implement configurable stride support.
         */
        walign =3D 8 * 8 / cc->bpp;
-       v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
-                             &pixfmt->height, 1, 0xffff, 1, 0);
+       pixfmt->width =3D clamp_roundup(pixfmt->width, 1, 0xffff, walign);
+       pixfmt->height =3D clamp_roundup(pixfmt->height, 1, 0xffff, walign)=
;

        pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;
        pixfmt->sizeimage =3D pixfmt->bytesperline * pixfmt->height;
