Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056A77414AA
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 17:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjF1PNm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 11:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjF1PNk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 11:13:40 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532A02682
        for <linux-media@vger.kernel.org>; Wed, 28 Jun 2023 08:13:35 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-47dcb8a5e89so786318e0c.0
        for <linux-media@vger.kernel.org>; Wed, 28 Jun 2023 08:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687965213; x=1690557213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAqBDel36UtyC93AQGUxY3WIqcnDnwpdxhq+9skbAEY=;
        b=aO3E1RckbJtGlyqgqECmya4wwyfLTWQtVCXyMbW3No0n0HAXZvIA1IfvkvoKQ09579
         PuOszq0niqkMeI8fAsu2VFD4YWXFez7Y4za5tiBqKX1qiD9Xpu4/lkL65noHpe9wEDga
         fu9ROeYX4WiO+1IjuyKd8obvcfutZ4Y54M9yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687965213; x=1690557213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAqBDel36UtyC93AQGUxY3WIqcnDnwpdxhq+9skbAEY=;
        b=V3z2WEIQU8bTIKQaXDojPleVI4YBNXUoF4soXiZH7bOYLPCDel7OJTy03P0MP5v4uE
         tGgIYhjcYV1NZvD+eelvYnZrKZ3+1FILjiilIlRkw7exM9Bkqv9OXjmjw9HFMomKNT3T
         hG6OcLRcUWb/vixmGpe5t236a3/6xs3JwPafPAtA25ojUdhiLIdMOlBprt+iaCjCbGZG
         HXIGiM29tz6zPY/Up/6yvaz7FY+w2AKp7XVVhec2+OjMS+mvDcYl+sEn0GuoG6dGYKGC
         hRDj9TLw7excitnsE8FMdU26rt30CU0GN0ZCqARCdFQbirh6O4B7Lw+zxZXYnuNCuugi
         Gd6g==
X-Gm-Message-State: AC+VfDwgL7QR69vTfPwQJVuhylQNBjmntUBlPtm44Zml1xoaj6cx6goT
        fRv2rIQ7JQGWk3rgIOc+eDf1As32K9kxnSt5WAitBg==
X-Google-Smtp-Source: ACHHUZ5mfBvnkLt2XEjYwZMLrJnfmPDvIEKt2VTsaqJFS/HCQhReZM8gwfbAuFny8jkvvno8JnRdXCohfAO3ax/J5ZI=
X-Received: by 2002:a05:6102:3f94:b0:439:3e26:990e with SMTP id
 o20-20020a0561023f9400b004393e26990emr671023vsv.6.1687965213350; Wed, 28 Jun
 2023 08:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230627082731.1769620-1-yqsun1997@gmail.com> <20230627140640.GA3605278@gnbcxd0016.gnb.st.com>
 <CAA0BgY_Lj+hQdevrgK8y=wLztddnh+npP-hWz_XaPbi-5mzwnQ@mail.gmail.com>
 <20230628063353.GA3625616@gnbcxd0016.gnb.st.com> <CAA0BgY_1Rn4LJ4NM7ZMNgG1K-V9Uy0HTi6bMg_o3cPDWj7NfKQ@mail.gmail.com>
In-Reply-To: <CAA0BgY_1Rn4LJ4NM7ZMNgG1K-V9Uy0HTi6bMg_o3cPDWj7NfKQ@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 28 Jun 2023 17:13:19 +0200
Message-ID: <CAGXv+5FZYjsMUOb71ZCnYif3FZZ14LDzsGV86myLsUwSAtETpA@mail.gmail.com>
Subject: Re: [PATCH] OOB read and write in mdp_prepare_buffer
To:     sun yq <yqsun1997@gmail.com>
Cc:     mchehab@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, 499671216@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 28, 2023 at 12:09=E2=80=AFPM sun yq <yqsun1997@gmail.com> wrote=
:
>
> Hi Alain,
>
> May I ask if you are the person involved in the code?We should  listen
> to the opinions of the code owner.

Please don't top post.

Alain has a valid point. Please describe in detail how you are running
into or detecting this problem. Are you running into this for real? Or
is this from a static analyzer? Or are you simply eyeballing the issue?


ChenYu

> On Wed, Jun 28, 2023 at 2:34=E2=80=AFPM Alain Volmat <alain.volmat@foss.s=
t.com> wrote:
> >
> > Hi,
> >
> > On Wed, Jun 28, 2023 at 07:28:54AM +0800, sun yq wrote:
> > > Hi,
> > > Because there are many functions using the plane, increasing the max
> > > number of the plane is to maximize the solution to all possible oob
> > > places.
> >
> > I don't think it is the right approach then.  If the HW is only handlin=
g
> > 3 planes, there should be no reason to have to allocate for 8 planes.  =
I
> > suspect that this 8 value is coming from the maximum allowed plane
> > number in V4L2 right ?
> > INHO driver should simply be fixed to ensure that num_plane won't go
> > higher than the real number of plane allocated in the structures.
> > It should be possible to get the num_plane value from the format
> > selected.
> >
> > Alain
> >
> > >
> > > On Tue, Jun 27, 2023 at 10:06=E2=80=AFPM Alain Volmat <alain.volmat@f=
oss.st.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Jun 27, 2023 at 04:27:31PM +0800, yqsun1997@gmail.com wrote=
:
> > > > > From: yqsun1997 <yqsun1997@gmail.com>
> > > > >
> > > > > Because format in struct img_image_buffer max index is IMG_MAX_PL=
ANES =3D=3D3,
> > > > > The num_planes max index is 8.so will be OOB like in mdp_prepare_=
buffer.
> > > >
> > > > Similarly as your other patch, could you describe why you need to
> > > > increase the IMG_MAX_PLANES while I suspect your driver only needs =
to
> > > > deal with 3 planes.  While the maximum num_planes value that can be
> > > > given by the user is 8, this has to be first compared to the config=
ured
> > > > format prior to reaching this function.
> > > >
> > > > >
> > > > > static void mdp_prepare_buffer(struct img_image_buffer *b,
> > > > >                                struct mdp_frame *frame, struct vb=
2_buffer *vb)
> > > > > {
> > > > >         struct v4l2_pix_format_mplane *pix_mp =3D &frame->format.=
fmt.pix_mp;
> > > > >         unsigned int i;
> > > > >
> > > > >         b->format.colorformat =3D frame->mdp_fmt->mdp_color;
> > > > >         b->format.ycbcr_prof =3D frame->ycbcr_prof;
> > > > >         for (i =3D 0; i < pix_mp->num_planes; ++i) {
> > > > >                 u32 stride =3D mdp_fmt_get_stride(frame->mdp_fmt,
> > > > >                         pix_mp->plane_fmt[i].bytesperline, i);
> > > > >
> > > > >                 b->format.plane_fmt[i].stride =3D stride;  //oob
> > > > >                 ......
> > > > >
> > > > > Signed-off-by: yqsun1997 <yqsun1997@gmail.com>
> > > > > ---
> > > > >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h=
 b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > > index ae0396806..e2e991a34 100644
> > > > > --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
> > > > > @@ -11,7 +11,7 @@
> > > > >
> > > > >  #define IMG_MAX_HW_INPUTS    3
> > > > >  #define IMG_MAX_HW_OUTPUTS   4
> > > > > -#define IMG_MAX_PLANES               3
> > > > > +#define IMG_MAX_PLANES               8
> > > > >  #define IMG_MAX_COMPONENTS   20
> > > > >
> > > > >  struct img_crop {
> > > > > --
> > > > > 2.39.2
> > > > >
> > > >
> > > > Regards,
> > > > Alain
>
