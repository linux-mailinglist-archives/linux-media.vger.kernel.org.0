Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCCC681FBF
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 00:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjA3Xfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 18:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjA3Xfb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 18:35:31 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27763A9
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 15:35:29 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id p141so16083074ybg.12
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 15:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=op0VSI0Qhd4DgxXYIP2eK1se5ailuV2V++dezzM8xfE=;
        b=mqu4GX7vraMXfaTeJRv6DS5V4pfM28ExdRiNlIEK5l9Nil5EYTnYeL+GG1CjJngp9Q
         W9ZdDia/7jdAFM/0HIvZ1HNX+XZkDkGCOvePNS+aCQYY5D5R+r7crrZrz0Che/xAlFCa
         RcVoXLNILsAoFrFqXkw225pu0utaiqkIqyN0zwtKtBWgqy48Sw+/AcT7Sm8KLUyHvVp1
         kUN0mHK4st2ILyoilLzy2sDSDBbBNyys6VIfT29yRZYq/T2n/zXzCn+lIGQEyi2d+pPh
         hS0+RUw1SPnTJpUHxfItZBm/cFnJIOJUfJbzO90iA1CghT31Hf4JSBpvi8mvze5P28iz
         zD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=op0VSI0Qhd4DgxXYIP2eK1se5ailuV2V++dezzM8xfE=;
        b=vF5DPVfl8VIIEjA2Ogss3KX0o/qHr1fhvqTs84e91SeKJBzNNMW57rWhiAWG6IDNyt
         DSnwhwGNHBdwt17kiLg69uQHLUsc8eunHZZVoxnbp8/2JHaE02K+8crQcTkHAoSJjFhb
         8qzTmf7+QFPOP8P9mpTVhmwwqxNXr4X1E1LBJk5st6+z7u3o5iYsZgm8AmMnrGa1hw/i
         uCRivrG6LKI/uOVutWxXBDV4dElA/fxhdMr/6YBU5JqYHHbasPd4ZmS9cdjIRtWFzHFi
         Y6IyvrLXbZ9vW5aLb2MXKuYMz7Avrqu2u3WqxrYTkkm1bc/U7vsBnuXH/Y7pS6TCnXqg
         9uzA==
X-Gm-Message-State: AFqh2kopKXLxExd975UDKQ7zuslT7wS+T1IRpo5TSRlb2mqC02DJW71B
        dMICi17LXxlhBPFxeb/HemG7II90uRqUcnPsEvMmSYzLmOncMg==
X-Google-Smtp-Source: AMrXdXvbVZsYR5p3dOesoz/Q2DhchP1QgnGuFIp/wPmxqZi2mcWc6FhC2NbMT4pI1jpDRqsmFF3mV6eRVq14i0zRKBk=
X-Received: by 2002:a25:9291:0:b0:7c9:4b7e:79b3 with SMTP id
 y17-20020a259291000000b007c94b7e79b3mr6515038ybl.535.1675121728412; Mon, 30
 Jan 2023 15:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl> <20230126150657.367921-13-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230126150657.367921-13-hverkuil-cisco@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 30 Jan 2023 23:35:02 +0000
Message-ID: <CA+V-a8u6LqrsCH9v11R-VJw7VJp1kWMa9nOe5QFovzXhP_Sm9A@mail.gmail.com>
Subject: Re: [PATCH 12/17] media: ti: davinci: vpbe_display.c: return 0
 instead of 'ret'.
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Jan 26, 2023 at 3:07 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Since 'ret' is known to be 0, just return '0'. This fixes a smatch warning:
>
> vpbe_display.c:1152 vpbe_display_open() warn: missing error code? 'err'
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> ---
>  drivers/media/platform/ti/davinci/vpbe_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/davinci/vpbe_display.c b/drivers/media/platform/ti/davinci/vpbe_display.c
> index 9ea70817538e..ea2d0795d1e2 100644
> --- a/drivers/media/platform/ti/davinci/vpbe_display.c
> +++ b/drivers/media/platform/ti/davinci/vpbe_display.c
> @@ -1149,7 +1149,7 @@ static int vpbe_display_open(struct file *file)
>
>         /* leaving if layer is already initialized */
>         if (!v4l2_fh_is_singular_file(file))
> -               return err;
> +               return 0;
>
>         if (!layer->usrs) {
>                 if (mutex_lock_interruptible(&layer->opslock))
> --
> 2.39.0
>
