Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A48558A07
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 22:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiFWU2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 16:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiFWU2E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 16:28:04 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE1062C8
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 13:28:03 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id z191so655083iof.6
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 13:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7HArHHllGAytZpHwXqruPvoaXqhMKpeFbO8aG3kN4c4=;
        b=dt5M+nZVmfYSJsJ125DQp+WhK9wQ7BT+0gVU4K0J2eBHJuSCOik1VTUq8ECjHWdAey
         vRFh2SGSTFZKyI5k2UByXvKDFwkCOYRvJjIq5FaQ1jNDwyK9+QC+UUAY70ZKQqEUG/bP
         E8lPQWjqPuAVf2P+fb4nIhCBjdH31DOw2z+zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7HArHHllGAytZpHwXqruPvoaXqhMKpeFbO8aG3kN4c4=;
        b=ubf2nhZWC5TI5iUwz7xwVnPwkPkVw7iI8FEGGaudis6XwrHC+yQcsfrbKZyG4xuwVH
         EGPq20yLWDLtCsD48qbuPq32SebqF2KCFu9QnYSDrZezjqeN6zrD8fEZJB2UErjDl/ks
         hSRYp/fIkGvaK8RUF5RAzjDoCxZWfTKyrqcqKL/mjRfA6OrmXuHjZOwidKRs25/bAZDs
         c+GeGOrnmDWdX9bgl/I5qeY1sPXBcREs8+lnZOPtZzswJiQmRakf9Qn3saxMQuY0JfQ3
         nqbYC0HTdJWVCc1KOTspjQOlvNU/M1X3zC6drE4njUY+K3ePpTec8SkQz4goZQzeujQR
         jGTw==
X-Gm-Message-State: AJIora8+cSYQyNLNOof0Yjh/m/s3zuZcV/dCMMuQqSktKoz2PRjxS6/J
        UsqJZtvdquWXFAxaFv3FE9wNinqVHQVsGUmvUVs/fA==
X-Google-Smtp-Source: AGRyM1ua0Qg5IvLAMzPLTIv4UxM2wxTNanygMqFv7NRMPuCLDUp8O3YwPgu2toJ84cvPBI3+qw2c237HCXI251DcM24=
X-Received: by 2002:a05:6602:2c8d:b0:669:dca6:da58 with SMTP id
 i13-20020a0566022c8d00b00669dca6da58mr5607532iow.5.1656016083188; Thu, 23 Jun
 2022 13:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220623191422.1157518-1-greenjustin@chromium.org>
 <1e1e8934915380ebcf0a1d2af11ef8f54bc2c28a.camel@collabora.com>
 <CAHC42RcYS99N3=R4SK2+=U+23H6Xggu6JRR4Y=4ora+Ye0AViQ@mail.gmail.com> <cec075f5fd477bd45ddae4247fe4e40dc1d8ccf8.camel@collabora.com>
In-Reply-To: <cec075f5fd477bd45ddae4247fe4e40dc1d8ccf8.camel@collabora.com>
From:   Justin Green <greenjustin@chromium.org>
Date:   Thu, 23 Jun 2022 16:27:52 -0400
Message-ID: <CAHC42RdzUUF9BUJ7Qwtg0U7+GY50deJtXjd_eX6PwDwkuEHXHQ@mail.gmail.com>
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

On Thu, Jun 23, 2022 at 3:48 PM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le jeudi 23 juin 2022 =C3=A0 15:42 -0400, Justin Green a =C3=A9crit :
> > On Thu, Jun 23, 2022 at 3:31 PM Nicolas Dufresne
> > <nicolas.dufresne@collabora.com> wrote:
> > >
> > > Le jeudi 23 juin 2022 =C3=A0 15:14 -0400, Justin Green a =C3=A9crit :
> > > > Validate V4L2 plane data_offset values. We need to make sure the si=
ze of
> > > > the image we're encoding does not exceed the size of the buffer min=
us
> > > > its offset.
> > > >
> > > > Signed-off-by: Justin Green <greenjustin@google.com>
> > > > ---
> > > >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b=
/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > > index bc5b0a0168ec..8f5c1b9937bc 100644
> > > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > > @@ -687,6 +687,10 @@ static int mtk_jpeg_buf_prepare(struct vb2_buf=
fer *vb)
> > > >
> > > >       for (i =3D 0; i < q_data->fmt->colplanes; i++) {
> > > >               plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> > > > +                if (vb->planes[i].data_offset > vb2_plane_size(vb,=
 i) ||
> > > > +                    vb2_plane_size(vb, i) - vb->planes[i].data_off=
set
> > > > +                    < plane_fmt.sizeimage)
> > > > +                    return -EINVAL;
> > >
> > > Just double checking, but has data_offset been verified already to pr=
event the
> > > underflow ?
> >
> > I believe the "vb->planes[i].data_offset > vb2_plane_size(vb, i)"
> > check should do that, right?
>
> Perfect, with that said:
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> If no new version required, would it be possible to add:
>
> Fixes: 45f13a57d8134 ("media: platform: Add jpeg enc feature")
>
> regards,
> Nicolas
> >
> > >
> > > >               if (ctx->enable_exif &&
> > > >                   q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > >                       vb2_set_plane_payload(vb, i, plane_fmt.sizeim=
age +
> > >
>

Sure thing!

Fixes: 45f13a57d8134 ("media: platform: Add jpeg enc feature")
