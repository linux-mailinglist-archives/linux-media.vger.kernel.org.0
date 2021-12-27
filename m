Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7081847FAC2
	for <lists+linux-media@lfdr.de>; Mon, 27 Dec 2021 08:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235472AbhL0HeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Dec 2021 02:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235468AbhL0HeC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Dec 2021 02:34:02 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C15DC06173E
        for <linux-media@vger.kernel.org>; Sun, 26 Dec 2021 23:34:02 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp20so33105412lfb.6
        for <linux-media@vger.kernel.org>; Sun, 26 Dec 2021 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IphlBiJuwkvTWlaGouUePkoncfLLkrJz0XZEERgcR1A=;
        b=dh8+DTclQmyh7s+EcvCf2hb6WKEugyNKN35hHVMS7W2IhaMMhBDE2eTNN7ljhCdqWl
         nVlqa/HZb8mFP+hbkB6K+htLaYpA4H08Hq6SNx43HLVAmXp4Duz3aov7sRt1jqK8fplL
         Yhl4sZsFZbRbE4QD7FOSbDeIBbUdzm2KLRfv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IphlBiJuwkvTWlaGouUePkoncfLLkrJz0XZEERgcR1A=;
        b=Rl0L76mKrOIu0J0lhtMrKExtqM0S1/3rTumOpsb/kwAm8uvxOv6bDRHgKsDiBP/UnP
         pYquFF8MpO5i7mHzExO081kDgec3rvHrOdHJIcjhjaACFGDXqzWsMER63J8UC1cCKkMt
         9P8TMjKdW2h5lPRswiJyO6/ezYAR/+zHJUjcGB4g0Z76VPmAcPhYJb0m8NVv/anYXZa7
         ot8I0LLduIgCQIKLtRFuND0u1GhAm6VxXo405+gDW8w0kUXqsIAK2mKhCvgAW134S7i6
         pt143pyKyQo2gtNzNgYwmlcNQgqbGBRtpx+jNEFuK9A223I0UPeYBecPBbAZchVDqiVa
         yt4A==
X-Gm-Message-State: AOAM530ZXXgua09YG05E/rrtDTeVnGsCLtnoHuaxwjNgdxshaOgE1Wfr
        DeWjzjUVRfJP3+ueNDXVV/00jEFYEsqTYioNlNhT+A==
X-Google-Smtp-Source: ABdhPJwPi8ZEN4x6LJlIvtEv1S+Z2YOWAU1DTIc3KIzqBQAYjs6CY0YqUD8gntWVlxa80Y2Z49i7iuku7gad5jNfulE=
X-Received: by 2002:a05:6512:202f:: with SMTP id s15mr15224264lfs.501.1640590439292;
 Sun, 26 Dec 2021 23:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20211224084248.3070568-1-wenst@chromium.org> <20211224084248.3070568-6-wenst@chromium.org>
 <YciZZ2hA4uMveN2l@eze-laptop>
In-Reply-To: <YciZZ2hA4uMveN2l@eze-laptop>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 27 Dec 2021 15:33:48 +0800
Message-ID: <CAGXv+5GJzZE1xDxxOqzV3Bq2XfuG2-aFuu-6hNxJ9S2YXFM_og@mail.gmail.com>
Subject: Re: [PATCH RFT 5/7] media: hantro: jpeg: Add COM segment to JPEG
 header to align image scan
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 27, 2021 at 12:33 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi,
>
> On Fri, Dec 24, 2021 at 04:42:46PM +0800, Chen-Yu Tsai wrote:
> > The JPEG header size is not 64-bit aligned. This makes the driver
> > require a bounce buffer for the encoded JPEG image scan output.
> >
> > Add a COM (comment) segment to the JPEG header so that the header size
> > is a multiple of 64 bits. This will then allow dropping the use of the
> > bounce buffer, and instead have the hardware write out to the capture
> > buffer directly.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/staging/media/hantro/hantro_jpeg.c | 3 +++
> >  drivers/staging/media/hantro/hantro_jpeg.h | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_jpeg.c b/drivers/staging/media/hantro/hantro_jpeg.c
> > index 7d4018bd6876..51e67e5cf86f 100644
> > --- a/drivers/staging/media/hantro/hantro_jpeg.c
> > +++ b/drivers/staging/media/hantro/hantro_jpeg.c
> > @@ -247,6 +247,9 @@ static const unsigned char hantro_jpeg_header[JPEG_HEADER_SIZE] = {
> >       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> >       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> >
> > +     /* COM */
> > +     0xff, 0xfe, 0x00, 0x03, 0x00,
> > +
> >       /* SOS */
> >       0xff, 0xda, 0x00, 0x0c, 0x03, 0x01, 0x00, 0x02,
> >       0x11, 0x03, 0x11, 0x00, 0x3f, 0x00,
> > diff --git a/drivers/staging/media/hantro/hantro_jpeg.h b/drivers/staging/media/hantro/hantro_jpeg.h
> > index f33c492134e4..0b49d0b82caa 100644
> > --- a/drivers/staging/media/hantro/hantro_jpeg.h
> > +++ b/drivers/staging/media/hantro/hantro_jpeg.h
> > @@ -1,6 +1,6 @@
> >  /* SPDX-License-Identifier: GPL-2.0+ */
> >
> > -#define JPEG_HEADER_SIZE     619
> > +#define JPEG_HEADER_SIZE     624
>
> Can we add some compile-time check for the 8-byte alignment,
> so this is always enforced?

Ack.

> Perhaps getting rid of the JPEG_HEADER_SIZE macro,
> something like this....

I don't think that's doable. The other parts of the driver need to know
how large the header is, and we can't use "sizeof(hantro_jpeg_header)"
in those places unless the size is predetermined in the header declaration,
or we move the definition into the header file. Otherwise we need to
keep the macro and have another static assertion to check that
JPEG_HEADER_SIZE == sizeof(hantro_jpeg_header).

> @@ -140,7 +140,7 @@ static const unsigned char chroma_ac_table[] = {
>   * and we'll use fixed offsets to change the width, height
>   * quantization tables, etc.
>   */
> -static const unsigned char hantro_jpeg_header[JPEG_HEADER_SIZE] = {
> +static const unsigned char hantro_jpeg_header[] = {
>         /* SOI */
>         0xff, 0xd8,
>
> @@ -304,8 +304,13 @@ void hantro_jpeg_header_assemble(struct hantro_jpeg_ctx *ctx)
>  {
>         char *buf = ctx->buffer;
>
> -       memcpy(buf, hantro_jpeg_header,
> -              sizeof(hantro_jpeg_header));
> +       /*
> +        * THE JPEG buffer is prepended with the JPEG header,
> +        * so 64-bit alignment is needed for DMA.
> +        */
> +       BUILD_BUG_ON(!IS_ALIGNED(sizeof(hantro_jpeg_header), 8));

Probably bikeshedding, but I was thinking more of a static assert just
beneath hantro_jpeg_header[], along with some comments.


ChenYu

> +
> +       memcpy(buf, hantro_jpeg_header, sizeof(hantro_jpeg_header));
>
> Thanks,
> Ezequiel
