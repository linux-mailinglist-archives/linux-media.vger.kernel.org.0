Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260EB1B173C
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgDTUhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 16:37:12 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:47257 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgDTUhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 16:37:12 -0400
Date:   Mon, 20 Apr 2020 20:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1587415026;
        bh=pi0I3jcM77UFq2VH8uClbT6LRC4hcRh2g4zpQTZot1Q=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Jx83XqhdE0MRgdP/xldvW0lmgJGF54kC/N/fXjYlrO2SOt2Jdn/kLuO7UCqUvHvaA
         5KbSGK1TupNkR1H36vWPlzc3r8VG29xGXySLswL0AqcvLzLgRh2SsAlD5+QMgRSUpC
         ua+Ok19dH6hpJ2rOEhb47trd36PH9jmQMkDymuhA=
To:     Helen Koike <helen.koike@collabora.com>
From:   =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Reply-To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [PATCH v2 1/3] media: vimc: Support multiple media bus codes for each pixelformat
Message-ID: <20200420203646.6hhbsb57ybwh6u76@ArchWay.local>
In-Reply-To: <e41520f6-1d2e-9d36-3693-1e6d950ecf2f@collabora.com>
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
 <20200326214730.2449707-2-nfraprado@protonmail.com>
 <e41520f6-1d2e-9d36-3693-1e6d950ecf2f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

thanks for the review.

Some comments below.

On Mon, Mar 30, 2020 at 04:36:45PM -0300, Helen Koike wrote:
>=20
> Hi N=C3=ADcolas,
>=20
> thank you for the patch.
>=20
> The series looks good in general, just minor comments below.
>=20
> On 3/26/20 6:47 PM, N=C3=ADcolas F. R. A. Prado wrote:
> > Change vimc_pix_map_list to allow multiple media bus codes to map to th=
e
> > same pixelformat, making it possible to add media bus codes for which
> > there are no pixelformat.
> >
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
> > ---
> >
> > Changes in v2:
> > - Fix vimc_mbus_code_by_index not checking code array bounds
> > - Fix array formatting
> > - Rename variables
> > - Change code array size
> > - Add comment about vimc_mbus_code_by_index return value
> >
> >  drivers/media/platform/vimc/vimc-common.c | 70 ++++++++++++++---------
> >  drivers/media/platform/vimc/vimc-common.h | 11 +++-
> >  drivers/media/platform/vimc/vimc-scaler.c | 10 +++-
> >  drivers/media/platform/vimc/vimc-sensor.c |  6 +-
> >  4 files changed, 65 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/=
platform/vimc/vimc-common.c
> > index c95c17c048f2..119846f3eaa5 100644
> > --- a/drivers/media/platform/vimc/vimc-common.c
> > +++ b/drivers/media/platform/vimc/vimc-common.c
> > @@ -19,19 +19,19 @@ static const struct vimc_pix_map vimc_pix_map_list[=
] =3D {
> >
> >  =09/* RGB formats */
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_BGR888_1X24,
> > +=09=09.code =3D { MEDIA_BUS_FMT_BGR888_1X24 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_BGR24,
> >  =09=09.bpp =3D 3,
> >  =09=09.bayer =3D false,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_RGB888_1X24,
> > +=09=09.code =3D { MEDIA_BUS_FMT_RGB888_1X24 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_RGB24,
> >  =09=09.bpp =3D 3,
> >  =09=09.bayer =3D false,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_ARGB8888_1X32,
> > +=09=09.code =3D { MEDIA_BUS_FMT_ARGB8888_1X32 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_ARGB32,
> >  =09=09.bpp =3D 4,
> >  =09=09.bayer =3D false,
> > @@ -39,49 +39,49 @@ static const struct vimc_pix_map vimc_pix_map_list[=
] =3D {
> >
> >  =09/* Bayer formats */
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SBGGR8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGBRG8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGRBG8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SRGGB8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SBGGR10_1X10 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10,
> >  =09=09.bpp =3D 2,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGBRG10_1X10 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10,
> >  =09=09.bpp =3D 2,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGRBG10_1X10 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10,
> >  =09=09.bpp =3D 2,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SRGGB10_1X10 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10,
> >  =09=09.bpp =3D 2,
> >  =09=09.bayer =3D true,
> > @@ -89,25 +89,25 @@ static const struct vimc_pix_map vimc_pix_map_list[=
] =3D {
> >
> >  =09/* 10bit raw bayer a-law compressed to 8 bits */
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10ALAW8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10ALAW8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10ALAW8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10ALAW8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> > @@ -115,49 +115,49 @@ static const struct vimc_pix_map vimc_pix_map_lis=
t[] =3D {
> >
> >  =09/* 10bit raw bayer DPCM compressed to 8 bits */
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR10DPCM8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG10DPCM8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG10DPCM8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB10DPCM8,
> >  =09=09.bpp =3D 1,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SBGGR12_1X12 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SBGGR12,
> >  =09=09.bpp =3D 2,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGBRG12_1X12 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGBRG12,
> >  =09=09.bpp =3D 2,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SGRBG12_1X12 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SGRBG12,
> >  =09=09.bpp =3D 2,
> >  =09=09.bayer =3D true,
> >  =09},
> >  =09{
> > -=09=09.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> > +=09=09.code =3D { MEDIA_BUS_FMT_SRGGB12_1X12 },
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_SRGGB12,
> >  =09=09.bpp =3D 2,
> >  =09=09.bayer =3D true,
> > @@ -182,13 +182,31 @@ const struct vimc_pix_map *vimc_pix_map_by_index(=
unsigned int i)
> >  =09return &vimc_pix_map_list[i];
> >  }
> >
> > +const u32 vimc_mbus_code_by_index(unsigned int index)
> > +{
> > +=09unsigned int i, j;
> > +
> > +=09for (i =3D 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
> > +=09=09for (j =3D 0; j < ARRAY_SIZE(vimc_pix_map_list[i].code); j++) {
> > +=09=09=09if (vimc_pix_map_list[i].code[j]) {
>=20
> Can this be false?

Actually it can, but after you asked I realized this code could be way clea=
rer.

When vimc_pix_map_list[i].code[j] is 0, it means that this is an unused val=
ue of
the array, so we should skip to the next pixelformat.
I think writing it this way instead would be better, what do you think?

        for (i =3D 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
                for (j =3D 0; j < ARRAY_SIZE(vimc_pix_map_list[i].code); j+=
+) {
                        if (!vimc_pix_map_list[i].code[j])
                                break;
=20
                        if (!index)
                                return vimc_pix_map_list[i].code[j];
                        index--;

>=20
> > +=09=09=09=09if (!index)
> > +=09=09=09=09=09return vimc_pix_map_list[i].code[j];
> > +=09=09=09=09index--;
> > +=09=09=09}
> > +=09=09}
> > +=09}
> > +=09return 0;
> > +}
> > +
> >  const struct vimc_pix_map *vimc_pix_map_by_code(u32 code)
> >  {
> > -=09unsigned int i;
> > +=09unsigned int i, j;
> >
> >  =09for (i =3D 0; i < ARRAY_SIZE(vimc_pix_map_list); i++) {
> > -=09=09if (vimc_pix_map_list[i].code =3D=3D code)
> > -=09=09=09return &vimc_pix_map_list[i];
> > +=09=09for (j =3D 0; j < ARRAY_SIZE(vimc_pix_map_list[i].code); j++) {
> > +=09=09=09if (vimc_pix_map_list[i].code[j] =3D=3D code)
> > +=09=09=09=09return &vimc_pix_map_list[i];
> > +=09=09}
> >  =09}
> >  =09return NULL;
> >  }
> > diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/=
platform/vimc/vimc-common.h
> > index 616d5a6b0754..585441694c86 100644
> > --- a/drivers/media/platform/vimc/vimc-common.h
> > +++ b/drivers/media/platform/vimc/vimc-common.h
> > @@ -69,7 +69,7 @@ do {=09=09=09=09=09=09=09=09=09\
> >   * V4L2_PIX_FMT_* fourcc pixelformat and its bytes per pixel (bpp)
> >   */
> >  struct vimc_pix_map {
> > -=09unsigned int code;
> > +=09unsigned int code[1];
> >  =09unsigned int bpp;
> >  =09u32 pixelformat;
> >  =09bool bayer;
> > @@ -172,6 +172,15 @@ void vimc_sen_release(struct vimc_ent_device *ved)=
;
> >   */
> >  const struct vimc_pix_map *vimc_pix_map_by_index(unsigned int i);
> >
> > +/**
> > + * vimc_mbus_code_by_index - get mbus code by its index
> > + *
> > + * @index:=09=09index of the mbus code in vimc_pix_map_list
> > + *
> > + * Returns 0 if no mbus code is found for the given index.
> > + */
> > +const u32 vimc_mbus_code_by_index(unsigned int index);
> > +
> >  /**
> >   * vimc_pix_map_by_code - get vimc_pix_map struct by media bus code
> >   *
> > diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/=
platform/vimc/vimc-scaler.c
> > index 7521439747c5..6bac1fa65a6f 100644
> > --- a/drivers/media/platform/vimc/vimc-scaler.c
> > +++ b/drivers/media/platform/vimc/vimc-scaler.c
> > @@ -110,13 +110,19 @@ static int vimc_sca_enum_mbus_code(struct v4l2_su=
bdev *sd,
> >  =09=09=09=09   struct v4l2_subdev_pad_config *cfg,
> >  =09=09=09=09   struct v4l2_subdev_mbus_code_enum *code)
> >  {
> > -=09const struct vimc_pix_map *vpix =3D vimc_pix_map_by_index(code->ind=
ex);
> > +=09const u32 mbus_code =3D vimc_mbus_code_by_index(code->index);
> > +=09const struct vimc_pix_map *vpix;
> > +
> > +=09if (!mbus_code)
> > +=09=09return -EINVAL;
> > +
> > +=09vpix =3D vimc_pix_map_by_code(mbus_code);
> >
> >  =09/* We don't support bayer format */
> >  =09if (!vpix || vpix->bayer)
> >  =09=09return -EINVAL;
> >
> > -=09code->code =3D vpix->code;
> > +=09code->code =3D mbus_code;
>=20
> no need to change this.

This change is actually needed, because after this patch, the code property=
 of
vimc_pix_map_list is an array, so there isn't a 1 to 1 relation between mbu=
s
code and pixmap format anymore.
Since we already got the mbus code by index through
vimc_mbus_code_by_index(code->index), we just use it.

>=20
> >
> >  =09return 0;
> >  }
> > diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/=
platform/vimc/vimc-sensor.c
> > index 92daee58209e..b8bd430809c1 100644
> > --- a/drivers/media/platform/vimc/vimc-sensor.c
> > +++ b/drivers/media/platform/vimc/vimc-sensor.c
> > @@ -52,12 +52,12 @@ static int vimc_sen_enum_mbus_code(struct v4l2_subd=
ev *sd,
> >  =09=09=09=09   struct v4l2_subdev_pad_config *cfg,
> >  =09=09=09=09   struct v4l2_subdev_mbus_code_enum *code)
> >  {
> > -=09const struct vimc_pix_map *vpix =3D vimc_pix_map_by_index(code->ind=
ex);
> > +=09const u32 mbus_code =3D vimc_mbus_code_by_index(code->index);
> >
> > -=09if (!vpix)
> > +=09if (!mbus_code)
> >  =09=09return -EINVAL;
> >
> > -=09code->code =3D vpix->code;
> > +=09code->code =3D mbus_code;
> >
> >  =09return 0;
> >  }
> >
>=20
> With these changes
>=20
> Acked-by: Helen Koike <helen.koike@collabora.com>
>=20
> Regards,
> Helen

Thank you,
N=C3=ADcolas

