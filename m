Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2420469231B
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 17:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjBJQR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 11:17:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbjBJQR0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 11:17:26 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228EE6A7D
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 08:17:26 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id c2so6307600qtw.5
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 08:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ljkZKrFHFRYLKh4I/ps9hC1nFLlJkJ8B3rbSxUPKJw0=;
        b=aA4SwBRm+7a9CgUx9XZ7axJQOXX4Wi7yjyeL186RjVgTTyEjwSsH0aeVzUvsqLk3I5
         TmlbCLD8Kf8lEFEwvZx/D2tjgo4Bqmw7nqayzhOpFVb0FFVQx/+ypSTnZj/n6U0oBU8X
         zkZtxQEOfoGHFS9bomYj2fGnM8/gtpd9k0GuNQOEbWbxZFQqUfdccaq/7Q5si3wHB0zD
         dwno+6Odo/T1S4S5u9IFZo34qKCAj1+L8I9OCDr7BuOOKKMom1lmZBwTnXJnAYglk2rn
         qFeNVgpJV/mUxBL7FOEG25TIT8HhjqrfUuvG7edQEJ0L6BZlS2xxPKBPqOh7QqrwfG/B
         tsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljkZKrFHFRYLKh4I/ps9hC1nFLlJkJ8B3rbSxUPKJw0=;
        b=6cfGuQmE2jDm6xXnjrlcPmXtEx9G+b/JZfMtMuPjQprBvLDKD9VLH3vsr7gu9eARGq
         nCsEcgmLLUtK3znczHoj9gpUdR7wpK1GW42i1ibdSwoPT9zjP9muGXoEriTL5fUkXR+1
         R5UGlRMfLrjBNk0gI13PBZlao1CZPNEiNftamg5Ndjqrgv4LZTM09otYhvOiMYCXm47n
         tx1nLqLLpNc/xVoTWXY7jNHZsom1R5NtKzxOKmFPH/ca+fW6mmZ8vj1Ui4jr2F/KRreE
         81d8Tk59+Wo8Y5TGSBr3Lhz0dKkCtwB5WBEav/Jj/nZp6nA/uGiqUWq28hPPFgtUIxxG
         wBZw==
X-Gm-Message-State: AO0yUKV+cra4CKk6FNNkEGtnWV5JSJ390Qs4RAJcGIhLmjogMr6Eg33y
        rnFMbZVK0VZNvjtB/RbkZtgpmIIPOc3uCWGeK0c=
X-Google-Smtp-Source: AK7set8d5QX9lklyAWz/sM8+0xgT0nY/10pX9fD00ocoNZjIeOVwoSWUUTyEO4l0iOtobAMWvlZp3w==
X-Received: by 2002:a05:622a:1b8e:b0:3b9:b5c5:ebb1 with SMTP id bp14-20020a05622a1b8e00b003b9b5c5ebb1mr28066042qtb.9.1676045845288;
        Fri, 10 Feb 2023 08:17:25 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id i6-20020ac84f46000000b003b80fdaa14dsm3598880qtw.73.2023.02.10.08.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 08:17:24 -0800 (PST)
Message-ID: <04dd55039d1c66d382dc9086500e5b8037ed6598.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: v4l: Add Broadcom sand formats to videodev2.h
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Date:   Fri, 10 Feb 2023 11:17:23 -0500
In-Reply-To: <1ogauh5ro652so8vtc2fsgor5g3pj6ns3e@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
         <20230127153415.83126-2-jc@kynesim.co.uk>
         <4c9eef106e893b633ab83a792d97cc5e36f408fe.camel@ndufresne.ca>
         <1ogauh5ro652so8vtc2fsgor5g3pj6ns3e@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 09 f=C3=A9vrier 2023 =C3=A0 19:06 +0000, John Cox a =C3=A9crit=C2=
=A0:
> Hi
>=20
> > Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =C3=A9crit=
=C2=A0:
> > > Add fourccs for Broadcom 8 and 10-bit packed 128 byte column formats =
to
> > > videodev2.h
> > >=20
> > > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > > ---
> > >  include/uapi/linux/videodev2.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index 1befd181a4cc..a836322ae5d8 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -656,6 +656,8 @@ struct v4l2_pix_format {
> > >  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12 =
 Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
> > >  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', '2'=
) /* Y/CbCr 4:2:0 8x128 tiles */
> > >  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '1', =
'2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > > +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1', '2'=
) /* Y/CbCr 4:2:0 128 byte columns */
> > > +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3', '0'=
) /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
> > > =20
> > >  /* Tiled YUV formats, non contiguous planes */
> > >  #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  =
Y/CbCr 4:2:0 64x32 tiles */
> >=20
> > I would expect updates to v4l2-common.c and v4l2-ioctl.c to be in the s=
ame
> > patch. And then the driver should be using the helpers there whenever p=
ossible.
>=20
> Fair point - I'll fix that.
>=20
> What is the correct .bpp for 3 10-bit pixels packed into 4 bytes in the
> v4l2_format_info?

Good question, maybe this can be done with the fractional bpp support. I mu=
st
admit, I didn't think about padded cases, I was handling 10bit fully packed=
 over
5 bytes.

https://lore.kernel.org/linux-arm-kernel/20230103170058.810597-3-benjamin.g=
aignard@collabora.com/
My case ended working with:

 { .format =3D V4L2_PIX_FMT_NV12_10LE40_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp_=
div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },

Question is what do we do about comp_planes, if we kind of fake it to be 2,=
 then maybe this would work.

 { .format =3D V4L2_PIX_FMT_P030_C128, .pixel_enc =3D V4L2_PIXEL_ENC_YUV, .=
mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 4, 8, 0, 0 }, .bpp_div =3D=
 { 3, 3, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },

For weird format, this is a bit of hacky, all we want is to get the right
stride, and the offset part is not used for mem_planes =3D 1 formats.

let me know,
Nicolas

>=20
> Regards
>=20
> John Cox

