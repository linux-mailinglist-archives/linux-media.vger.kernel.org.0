Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC3C1B17E0
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 23:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgDTVB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 17:01:56 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:20674 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbgDTVBz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 17:01:55 -0400
Date:   Mon, 20 Apr 2020 21:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1587416511;
        bh=h5rHihTOFeQtD4RPOI4YxrjlRdUOPIAKLWaqt3OXEzM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=C6UhlHRmrVDRz3HgN4sLKBnLGwqi8jzQHLHcDjryS3M2WPo32XyJWUnzVU3yBSOtv
         5w/oS2DfhdblPYV9ypW/Wr3JvHkRgtHte1rxj22CnL40X9+ZrGhUMf4PbjLtF99Nq+
         rqWOXMXuRZQ2pjJciGoA+kTFPmx1CvSTE5lDbEBg=
To:     Helen Koike <helen.koike@collabora.com>
From:   =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Reply-To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: Re: [PATCH v2 3/3] media: vimc: deb: Add support for {RGB,BGR,GBR}888 bus formats on source pad
Message-ID: <20200420210135.bmca5qw5ilaavuo6@ArchWay.local>
In-Reply-To: <ae9fdf85-7129-e1ad-a377-bda0808545c1@collabora.com>
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
 <20200326214730.2449707-4-nfraprado@protonmail.com>
 <b5bc6ab8-274a-adc7-9d86-a91a1efb8805@linuxfoundation.org>
 <ae9fdf85-7129-e1ad-a377-bda0808545c1@collabora.com>
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

On Mon, Mar 30, 2020 at 04:43:53PM -0300, Helen Koike wrote:
>=20
> Hello,
>=20
> On 3/26/20 7:06 PM, Shuah Khan wrote:
> > On 3/26/20 3:47 PM, N=C3=ADcolas F. R. A. Prado wrote:
> >> Add support for RGB888_*, BGR888_* and GBR888_* media bus formats on
> >> the source pad of debayer subdevices.
> >>
> >> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> >> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> >> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
> >> ---
> >>
> >> Changes in v2:
> >> - Change commit message to reflect v2 changes
> >> - Rename variables
> >> - Fix array formatting
> >> - Add vimc_deb_is_src_code_valid function
> >> - Add other BGR888 and RGB888 formats to debayer source pad supported
> >> =C2=A0=C2=A0 formats
> >>
> >> =C2=A0 drivers/media/platform/vimc/vimc-debayer.c | 61 +++++++++++++++=
++-----
> >> =C2=A0 1 file changed, 49 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/medi=
a/platform/vimc/vimc-debayer.c
> >> index baf6bf9f65b5..33a9bea770bc 100644
> >> --- a/drivers/media/platform/vimc/vimc-debayer.c
> >> +++ b/drivers/media/platform/vimc/vimc-debayer.c
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
> >> =C2=A0 +static int vimc_deb_is_src_code_invalid(u32 code)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 unsigned int i;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(vimc_deb_src_mbus_cod=
es); i++)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vimc_deb_src_mbus_code=
s[i] =3D=3D code)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn 0;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 return -EINVAL;
> >> +}
>=20
> The naming is a bit confusing, since it checks if it is invalid, but retu=
rns a negative number if so.
>=20
> How about renaming to vimc_deb_src_code_is_valid ?

I also don't like that the function is called 'is_invalid', but I gave it t=
hat
name because I think it actually is less confusing when calling.
For example, later in this patch I do:

=C2=A0=C2=A0=C2=A0 } else if (vimc_deb_is_src_code_invalid(fse->code)) {
        return -EINVAL;

Which to me becomes very clear.

Since the error values evaluate to True, the other alternative that I
see is to call it 'is_valid', but return 0 when invalid and 1 when valid.
But then we no longer return the -EINVAL value, which I think makes the fun=
ction
less clear.

What do you think?

Thank you,
N=C3=ADcolas

>=20
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
> >> +=C2=A0=C2=A0=C2=A0 } else if (vimc_deb_is_src_code_invalid(fse->code)=
) {
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
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!vimc_deb_is_src_code_=
invalid(code))
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
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int col,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int rgb[3])
> >
> > Change this to pass a pointer and size.
>=20
> Hi Shuah,
>=20
> Modifying vimc_deb_set_rgb_mbus_fmt_rgb888_1x24() is not part of this pat=
ch, or do you mean another part of the code?
>=20
> Thanks for reviewing
> Helen
>=20
> >
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
> > thanks,
> > -- Shuah

