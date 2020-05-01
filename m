Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9321C125D
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 14:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgEAMps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 08:45:48 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:28335 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728443AbgEAMpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 08:45:47 -0400
Date:   Fri, 01 May 2020 12:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1588337141;
        bh=ISx5BmR3vZGoKhJj7Hq5Oyt/vvFDUjNxUpcAaTJTGMU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=lDrSe4WH5vrkE9vxngTiXBo9jvGpBBF6iK5PlHrHopzzqZ0iv+CwYLnEBzspBYZqz
         62LNFZWK9Tq/wh8w4E8hYQv47U7Ilx34n6tc1PreGfqHDHWB55u82Qqs5vLobniAtC
         2UBd+5LwzoZ8i2HGk3mw83+P9YQb+cb3hs6x5dCg=
To:     Helen Koike <helen@koikeco.de>
From:   =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        lkcamp@lists.libreplanetbr.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Reply-To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [Lkcamp] [PATCH v3 3/3] media: vimc: deb: Add support for {RGB, BGR, GBR}888 bus formats on source pad
Message-ID: <20200501124513.pruy45zh6wezs32g@ArchWay.local>
In-Reply-To: <cd585b72-067f-88d6-7ec6-30044101db38@koikeco.de>
References: <20200427230234.3114565-4-nfraprado@protonmail.com>
 <1fcbe67e-db71-7841-6165-e62b74d82994@collabora.com>
 <cd585b72-067f-88d6-7ec6-30044101db38@koikeco.de>
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

On Tue, Apr 28, 2020 at 09:25:25AM -0300, Helen Koike wrote:
>=20
> Hello,
>=20
> On 4/28/20 4:46 AM, Dafna Hirschfeld wrote:
> > hi,
> > Thanks for the patches!
> >
> > On 28.04.20 01:03, N=C3=ADcolas F. R. A. Prado wrote:
> >> Add support for RGB888_*, BGR888_* and GBR888_* media bus formats on
> >> the source pad of debayer subdevices.
> >>
> >> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> >> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> >> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
> >> ---
> >>
> >> Changes in v3:
> >> - Rename vimc_deb_is_src_code_invalid() to vimc_deb_src_code_is_valid(=
)
> >> - Change vimc_deb_src_code_is_valid() to return bool
> >>
> >> Changes in v2:
> >> - Change commit message to reflect v2 changes
> >> - Rename variables
> >> - Fix array formatting
> >> - Add vimc_deb_is_src_code_valid function
> >> - Add other BGR888 and RGB888 formats to debayer source pad supported
> >> =C2=A0=C2=A0 formats
> >>
> >> =C2=A0 .../media/test-drivers/vimc/vimc-debayer.c=C2=A0=C2=A0=C2=A0 | =
61 +++++++++++++++----
> >> =C2=A0 1 file changed, 49 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/=
media/test-drivers/vimc/vimc-debayer.c
> >> index d10aee9f84c4..7e87706d417e 100644
> >> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> >> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> >> @@ -51,6 +51,19 @@ static const struct v4l2_mbus_framefmt sink_fmt_def=
ault =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .colorspace =3D V4L2_COLORSPACE_DEFAULT=
,
> >> =C2=A0 };
> >> =C2=A0 +static const u32 vimc_deb_src_mbus_codes[] =3D {
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_GBR888_1X24,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_BGR888_1X24,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_BGR888_3X8,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_1X24,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_2X12_BE,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_2X12_LE,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_3X8,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> >> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_1X32_PADHI,
> >> +};
> >> +
> >> =C2=A0 static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] =
=3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .code =3D MEDIA=
_BUS_FMT_SBGGR8_1X8,
> >> @@ -125,6 +138,17 @@ static const struct vimc_deb_pix_map *vimc_deb_pi=
x_map_by_code(u32 code)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> >> =C2=A0 }
> >> =C2=A0 +static bool vimc_deb_src_code_is_valid(u32 code)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 unsigned int i;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(vimc_deb_src_mbus_cod=
es); i++)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vimc_deb_src_mbus_code=
s[i] =3D=3D code)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn true;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 return false;
> >> +}
> >> +
> >> =C2=A0 static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_pad_config *c=
fg)
> >> =C2=A0 {
> >> @@ -148,14 +172,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2_s=
ubdev *sd,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_p=
ad_config *cfg,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_m=
bus_code_enum *code)
> >> =C2=A0 {
> >> -=C2=A0=C2=A0=C2=A0 /* We only support one format for source pads */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (VIMC_IS_SRC(code->pad)) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vimc_deb_device *vd=
eb =3D v4l2_get_subdevdata(sd);
> >> -
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (code->index)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (code->index >=3D ARRAY=
_SIZE(vimc_deb_src_mbus_codes))
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -EINVAL;
> >> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 code->code =3D vdeb=
->src_code;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 code->code =3D vimc_deb_sr=
c_mbus_codes[code->index];
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (code->index=
 >=3D ARRAY_SIZE(vimc_deb_pix_map_list))
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -EINVAL;
> >> @@ -170,8 +191,6 @@ static int vimc_deb_enum_frame_size(struct v4l2_su=
bdev *sd,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_su=
bdev_pad_config *cfg,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_su=
bdev_frame_size_enum *fse)
> >> =C2=A0 {
> >> -=C2=A0=C2=A0=C2=A0 struct vimc_deb_device *vdeb =3D v4l2_get_subdevda=
ta(sd);
> >> -
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fse->index)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> >> =C2=A0 @@ -181,7 +200,7 @@ static int vimc_deb_enum_frame_size(struct =
v4l2_subdev *sd,
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!vpi=
x)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -EINVAL;
> >> -=C2=A0=C2=A0=C2=A0 } else if (fse->code !=3D vdeb->src_code) {
> >> +=C2=A0=C2=A0=C2=A0 } else if (!vimc_deb_src_code_is_valid(fse->code))=
 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 @@ -237,6 +256,7 @@ static int vimc_deb_set_fmt(struct v4l2_sub=
dev *sd,
> >> =C2=A0 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vimc_deb_device *vdeb =3D v4l2_g=
et_subdevdata(sd);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_mbus_framefmt *sink_fmt;
> >> +=C2=A0=C2=A0=C2=A0 u32 *src_code;
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fmt->which =3D=3D V4L2_SUBDE=
V_FORMAT_ACTIVE) {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Do not chang=
e the format while stream is on */
> >> @@ -244,8 +264,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *s=
d,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 return -EBUSY;
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sink_fmt=
 =3D &vdeb->sink_fmt;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_code =3D &vdeb->src_co=
de;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sink_fmt =3D v4=
l2_subdev_get_try_format(sd, cfg, 0);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_code =3D &v4l2_subdev_=
get_try_format(sd, cfg, 1)->code;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >> @@ -253,9 +275,14 @@ static int vimc_deb_set_fmt(struct v4l2_subdev *s=
d,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it is propagated from the sink
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (VIMC_IS_SRC(fmt->pad)) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 code =3D fmt->format.c=
ode;
> >> +
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->format =3D=
 *sink_fmt;
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* TODO: Add support for o=
ther formats */
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->format.code =3D vdeb-=
>src_code;
> >> +
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vimc_deb_src_code_is_v=
alid(code))
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *s=
rc_code =3D code;
> >> +
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->format.code =3D *src_=
code;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Set the new =
format in the sink pad */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vimc_deb_adjust=
_sink_fmt(&fmt->format);
> >> @@ -291,11 +318,21 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1x2=
4(struct vimc_deb_device *vdeb,
> > I guess the name of the function should now change to vimc_deb_set_rgb_=
mbus_fmt ?
> > Or better vimc_deb_process_rgb_frame.
> > Also, it seems that it is a assigned as a callback so that each src_fmt=
 have a different callback
> > but you already did it with a switch case. So maybe you can add a patch=
 to call it directly
>=20
> Agreed that it should be renamed. Removing the callback could be done lat=
er (up to you N=C3=ADcolas).
>=20
> With the rename, and with or without the callback removal:
> Acked-by: Helen Koike <helen.koike@collabora.com>

Okay, I'd rather do that later as a separate patch.
I'll send the v4 with the rename, then.

Thank you both for the review.

N=C3=ADcolas

>=20
> >
> > Thanks,
> > Dafna
> >
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int col,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int rgb[3])
> >> =C2=A0 {
> >> +=C2=A0=C2=A0=C2=A0 const struct vimc_pix_map *vpix;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, index;
> >> =C2=A0 +=C2=A0=C2=A0=C2=A0 vpix =3D vimc_pix_map_by_code(vdeb->src_cod=
e);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index =3D VIMC_FRAME_INDEX(lin, col, vd=
eb->sink_fmt.width, 3);
> >> -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < 3; i++)
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdeb->src_frame[index + i]=
 =3D rgb[i];
> >> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < 3; i++) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (vpix->pixelformat)=
 {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_RGB24:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vd=
eb->src_frame[index + i] =3D rgb[i];
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_BGR24:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vd=
eb->src_frame[index + i] =3D rgb[2-i];
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0 }
> >> =C2=A0 }
> >> =C2=A0 =C2=A0 static int vimc_deb_s_stream(struct v4l2_subdev *sd, int=
 enable)
> >>
> >
> > _______________________________________________
> > Lkcamp mailing list
> > Lkcamp@lists.libreplanetbr.org
> > https://lists.libreplanetbr.org/mailman/listinfo/lkcamp

