Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0808F1BB165
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 00:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgD0WMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 18:12:53 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:18099 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgD0WMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 18:12:52 -0400
Date:   Mon, 27 Apr 2020 22:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1588025566;
        bh=DYCuiuKPBBkEr3iJsKakDERZQBlOgZSxnVMeB5WxUYI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=UPw4k7kt7irmUwsOK7H6HcWWyJU095QTGSCxXmPbmgm/vJZtDQ4x9IXo551MZFviN
         wNmwOFyFa7+dIWRwgZDINQ3KJf/RMtlGWXOYyOoQBjWsyVKq/kqRrFr4wjwVyV8SBU
         EEPXfK8B063GsvdXoI09U7wwbqTzga4DZDh/1+AA=
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
Message-ID: <20200427221212.ito2n77c2uwulek2@ArchWay.local>
In-Reply-To: <64a28b0a-f4fc-2623-ac42-d7ebec52ceba@collabora.com>
References: <20200326214730.2449707-1-nfraprado@protonmail.com>
 <20200326214730.2449707-4-nfraprado@protonmail.com>
 <b5bc6ab8-274a-adc7-9d86-a91a1efb8805@linuxfoundation.org>
 <ae9fdf85-7129-e1ad-a377-bda0808545c1@collabora.com>
 <20200420210135.bmca5qw5ilaavuo6@ArchWay.local>
 <64a28b0a-f4fc-2623-ac42-d7ebec52ceba@collabora.com>
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

On Mon, Apr 20, 2020 at 06:04:25PM -0300, Helen Koike wrote:
>=20
>=20
>=20
> On 4/20/20 6:01 PM, N=C3=ADcolas F. R. A. Prado wrote:
> > Hi Helen,
> >
> > thanks for the review.
> >
> > Some comments below.
> >
> > On Mon, Mar 30, 2020 at 04:43:53PM -0300, Helen Koike wrote:
> >>
> >> Hello,
> >>
> >> On 3/26/20 7:06 PM, Shuah Khan wrote:
> >>> On 3/26/20 3:47 PM, N=C3=ADcolas F. R. A. Prado wrote:
> >>>> Add support for RGB888_*, BGR888_* and GBR888_* media bus formats on
> >>>> the source pad of debayer subdevices.
> >>>>
> >>>> Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> >>>> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> >>>> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com=
>
> >>>> ---
> >>>>
> >>>> Changes in v2:
> >>>> - Change commit message to reflect v2 changes
> >>>> - Rename variables
> >>>> - Fix array formatting
> >>>> - Add vimc_deb_is_src_code_valid function
> >>>> - Add other BGR888 and RGB888 formats to debayer source pad supporte=
d
> >>>> =C2=A0=C2=A0 formats
> >>>>
> >>>> =C2=A0 drivers/media/platform/vimc/vimc-debayer.c | 61 +++++++++++++=
++++-----
> >>>> =C2=A0 1 file changed, 49 insertions(+), 12 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/me=
dia/platform/vimc/vimc-debayer.c
> >>>> index baf6bf9f65b5..33a9bea770bc 100644
> >>>> --- a/drivers/media/platform/vimc/vimc-debayer.c
> >>>> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> >>>> @@ -51,6 +51,19 @@ static const struct v4l2_mbus_framefmt sink_fmt_d=
efault =3D {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .colorspace =3D V4L2_COLORSPACE_DEFAU=
LT,
> >>>> =C2=A0 };
> >>>> =C2=A0 +static const u32 vimc_deb_src_mbus_codes[] =3D {
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_GBR888_1X24,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_BGR888_1X24,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_BGR888_3X8,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_1X24,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_2X12_BE,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_2X12_LE,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_3X8,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> >>>> +=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_RGB888_1X32_PADHI,
> >>>> +};
> >>>> +
> >>>> =C2=A0 static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] =
=3D {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .code =3D MED=
IA_BUS_FMT_SBGGR8_1X8,
> >>>> @@ -125,6 +138,17 @@ static const struct vimc_deb_pix_map *vimc_deb_=
pix_map_by_code(u32 code)
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> >>>> =C2=A0 }
> >>>> =C2=A0 +static int vimc_deb_is_src_code_invalid(u32 code)
> >>>> +{
> >>>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(vimc_deb_src_mbus_c=
odes); i++)
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vimc_deb_src_mbus_co=
des[i] =3D=3D code)
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return 0;
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0 return -EINVAL;
> >>>> +}
> >>
> >> The naming is a bit confusing, since it checks if it is invalid, but r=
eturns a negative number if so.
> >>
> >> How about renaming to vimc_deb_src_code_is_valid ?
> >
> > I also don't like that the function is called 'is_invalid', but I gave =
it that
> > name because I think it actually is less confusing when calling.
> > For example, later in this patch I do:
> >
> > =C2=A0=C2=A0=C2=A0 } else if (vimc_deb_is_src_code_invalid(fse->code)) =
{
> >         return -EINVAL;
> >
> > Which to me becomes very clear.
> >
> > Since the error values evaluate to True, the other alternative that I
> > see is to call it 'is_valid', but return 0 when invalid and 1 when vali=
d.
> > But then we no longer return the -EINVAL value, which I think makes the=
 function
> > less clear.
> >
> > What do you think?
>=20
> How about make the function to return bool instead of int?

Oh that's better, I didn't realize there was a bool type.
I'll send a v3 using bool then.

Thank you,
N=C3=ADcolas

>=20
> Regards,
> Helen
>=20
> >
> > Thank you,
> > N=C3=ADcolas
> >
> >>
> >>>> +
> >>>> =C2=A0 static int vimc_deb_init_cfg(struct v4l2_subdev *sd,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_pad_config=
 *cfg)
> >>>> =C2=A0 {
> >>>> @@ -148,14 +172,11 @@ static int vimc_deb_enum_mbus_code(struct v4l2=
_subdev *sd,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subde=
v_pad_config *cfg,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subde=
v_mbus_code_enum *code)
> >>>> =C2=A0 {
> >>>> -=C2=A0=C2=A0=C2=A0 /* We only support one format for source pads */
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (VIMC_IS_SRC(code->pad)) {
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vimc_deb_device *=
vdeb =3D v4l2_get_subdevdata(sd);
> >>>> -
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (code->index)
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (code->index >=3D ARR=
AY_SIZE(vimc_deb_src_mbus_codes))
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -EINVAL;
> >>>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 code->code =3D vd=
eb->src_code;
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 code->code =3D vimc_deb_=
src_mbus_codes[code->index];
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (code->ind=
ex >=3D ARRAY_SIZE(vimc_deb_pix_map_list))
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -EINVAL;
> >>>> @@ -170,8 +191,6 @@ static int vimc_deb_enum_frame_size(struct v4l2_=
subdev *sd,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2=
_subdev_pad_config *cfg,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2=
_subdev_frame_size_enum *fse)
> >>>> =C2=A0 {
> >>>> -=C2=A0=C2=A0=C2=A0 struct vimc_deb_device *vdeb =3D v4l2_get_subdev=
data(sd);
> >>>> -
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fse->index)
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVA=
L;
> >>>> =C2=A0 @@ -181,7 +200,7 @@ static int vimc_deb_enum_frame_size(struc=
t v4l2_subdev *sd,
> >>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!v=
pix)
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -EINVAL;
> >>>> -=C2=A0=C2=A0=C2=A0 } else if (fse->code !=3D vdeb->src_code) {
> >>>> +=C2=A0=C2=A0=C2=A0 } else if (vimc_deb_is_src_code_invalid(fse->cod=
e)) {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVA=
L;
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>> =C2=A0 @@ -237,6 +256,7 @@ static int vimc_deb_set_fmt(struct v4l2_s=
ubdev *sd,
> >>>> =C2=A0 {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vimc_deb_device *vdeb =3D v4l2=
_get_subdevdata(sd);
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_mbus_framefmt *sink_fmt;
> >>>> +=C2=A0=C2=A0=C2=A0 u32 *src_code;
> >>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fmt->which =3D=3D V4L2_SUB=
DEV_FORMAT_ACTIVE) {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Do not cha=
nge the format while stream is on */
> >>>> @@ -244,8 +264,10 @@ static int vimc_deb_set_fmt(struct v4l2_subdev =
*sd,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return -EBUSY;
> >>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sink_f=
mt =3D &vdeb->sink_fmt;
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_code =3D &vdeb->src_=
code;
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sink_fmt =3D =
v4l2_subdev_get_try_format(sd, cfg, 0);
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src_code =3D &v4l2_subde=
v_get_try_format(sd, cfg, 1)->code;
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >>>> @@ -253,9 +275,14 @@ static int vimc_deb_set_fmt(struct v4l2_subdev =
*sd,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it is propagated from the sin=
k
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (VIMC_IS_SRC(fmt->pad)) {
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 code =3D fmt->format=
.code;
> >>>> +
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->format =
=3D *sink_fmt;
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* TODO: Add support for=
 other formats */
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->format.code =3D vde=
b->src_code;
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!vimc_deb_is_src_cod=
e_invalid(code))
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *src_code =3D code;
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fmt->format.code =3D *sr=
c_code;
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Set the ne=
w format in the sink pad */
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vimc_deb_adju=
st_sink_fmt(&fmt->format);
> >>>> @@ -291,11 +318,21 @@ static void vimc_deb_set_rgb_mbus_fmt_rgb888_1=
x24(struct vimc_deb_device *vdeb,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int col,
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int rgb[3])
> >>>
> >>> Change this to pass a pointer and size.
> >>
> >> Hi Shuah,
> >>
> >> Modifying vimc_deb_set_rgb_mbus_fmt_rgb888_1x24() is not part of this =
patch, or do you mean another part of the code?
> >>
> >> Thanks for reviewing
> >> Helen
> >>
> >>>
> >>>> =C2=A0 {
> >>>> +=C2=A0=C2=A0=C2=A0 const struct vimc_pix_map *vpix;
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int i, index;
> >>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 vpix =3D vimc_pix_map_by_code(vdeb->src_c=
ode);
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index =3D VIMC_FRAME_INDEX(lin, col, =
vdeb->sink_fmt.width, 3);
> >>>> -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < 3; i++)
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vdeb->src_frame[index + =
i] =3D rgb[i];
> >>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < 3; i++) {
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (vpix->pixelforma=
t) {
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_RGB24:
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 vdeb->src_frame[index + i] =3D rgb[i];
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case V4L2_PIX_FMT_BGR24:
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 vdeb->src_frame[index + i] =3D rgb[2-i];
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 break;
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>> +=C2=A0=C2=A0=C2=A0 }
> >>>> =C2=A0 }
> >>>> =C2=A0 =C2=A0 static int vimc_deb_s_stream(struct v4l2_subdev *sd, i=
nt enable)
> >>>>
> >>>
> >>> thanks,
> >>> -- Shuah
> >

