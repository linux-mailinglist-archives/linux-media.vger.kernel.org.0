Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A536A558986
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 21:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiFWTry (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 15:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbiFWTrY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 15:47:24 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2384D1E3E7
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 12:43:06 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id h85so540877iof.4
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 12:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mPHomQCnxVNAHDHxUTL94TfNqPa+7fPeiybff6xNkXI=;
        b=jOH17OJCNpSXy/5wIYl8r0+Y52rkzZCKJ8CBZkzL1dDeVOUtqlYiAiNavg8wxgZGjH
         NMsj2CrUSavAa5coYnGz0jSsKB851WLVmPzReoDM4roMhpvU/nV74ezc/vmziq9xWOMS
         oUYHpfDxI4KY8jI03YNZMDcz5ojDlpT459KQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mPHomQCnxVNAHDHxUTL94TfNqPa+7fPeiybff6xNkXI=;
        b=VdCEXG7KMECKu8x3ZHrlLLOedvYdBgXXrLWmb9XADmk7PcgGQyXItz5sZXyKD/uZXy
         rtMrnzf7OPwtwVTpmGpL74JkjRPnitQzZ5AEi9BcSlckoi9OBrn9S/JvqVlrQ0nCZ2Mx
         ovuRve+pco2KbKx30tU4y5RmSNgxJD0n/W8qkFNaXjUQDHE/t76MoY9tpxMs1s9DSyw2
         s/MyGw5MYUWzpLas+DjMQPZMRU1EUpufdJswqci4CtBxwNXiokP35unzo6QT2fNOg+Hr
         NGj+YEiKTxsEmsJ2J3kx6mWP0UHCRL3t/cJfVlZRpSV2bsR3JAYz4SxvEpFWMKvZ6p3b
         vlBQ==
X-Gm-Message-State: AJIora/xi17CR7FlvLII4DG7j8tOJkTfpigUaQgOqzq6QCQykc11iphI
        IOIr9KcxGTDCddCnfmP4h2FvWEkqNzMoZGVfhLF6FBd+KT3tNQ==
X-Google-Smtp-Source: AGRyM1sEoQlhe6z6ymU1NhbULVsl3SC5O3rWqjmtRdqON5z+pleoOQVeSpuyD8G4NXJ4DIUFnCcnFJWoj+IKb9ZeGOw=
X-Received: by 2002:a05:6638:3721:b0:332:f1:3f76 with SMTP id
 k33-20020a056638372100b0033200f13f76mr6185142jav.283.1656013385517; Thu, 23
 Jun 2022 12:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220623191422.1157518-1-greenjustin@chromium.org> <1e1e8934915380ebcf0a1d2af11ef8f54bc2c28a.camel@collabora.com>
In-Reply-To: <1e1e8934915380ebcf0a1d2af11ef8f54bc2c28a.camel@collabora.com>
From:   Justin Green <greenjustin@chromium.org>
Date:   Thu, 23 Jun 2022 15:42:54 -0400
Message-ID: <CAHC42RcYS99N3=R4SK2+=U+23H6Xggu6JRR4Y=4ora+Ye0AViQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek/jpeg: validate data_offsets for v4l2 planes
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     linux-media@vger.kernel.org, tiffany.lin@mediatek.com,
        andrew-ct.chen@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com, andrescj@chromium.org,
        yunfei.dong@mediatek.com, Justin Green <greenjustin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 23, 2022 at 3:31 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le jeudi 23 juin 2022 =C3=A0 15:14 -0400, Justin Green a =C3=A9crit :
> > Validate V4L2 plane data_offset values. We need to make sure the size o=
f
> > the image we're encoding does not exceed the size of the buffer minus
> > its offset.
> >
> > Signed-off-by: Justin Green <greenjustin@google.com>
> > ---
> >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > index bc5b0a0168ec..8f5c1b9937bc 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > @@ -687,6 +687,10 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer =
*vb)
> >
> >       for (i =3D 0; i < q_data->fmt->colplanes; i++) {
> >               plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> > +                if (vb->planes[i].data_offset > vb2_plane_size(vb, i) =
||
> > +                    vb2_plane_size(vb, i) - vb->planes[i].data_offset
> > +                    < plane_fmt.sizeimage)
> > +                    return -EINVAL;
>
> Just double checking, but has data_offset been verified already to preven=
t the
> underflow ?

I believe the "vb->planes[i].data_offset > vb2_plane_size(vb, i)"
check should do that, right?

>
> >               if (ctx->enable_exif &&
> >                   q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> >                       vb2_set_plane_payload(vb, i, plane_fmt.sizeimage =
+
>
