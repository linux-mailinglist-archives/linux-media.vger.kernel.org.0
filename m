Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3550E6C68E8
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 13:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbjCWMzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 08:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjCWMzO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 08:55:14 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33611B2FA
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 05:55:11 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7B2AF1BF207;
        Thu, 23 Mar 2023 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1679576110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1Xu5G7WmAXfstavo6YSNPn9wQakQvbtqI2Xg/0IpTpc=;
        b=C2i7X9iIn350ZHDv1RjWwgiG99WPF/fuXULPSrOuU1EZRKbV1hc1L4Xke+BCfX8iZEGIhT
        i3MQ3uNpbeRoSdX2copr1Ew/BaFxV1X/g76K+IRBK+vvw8lXlo2jrW4OXI7zcg7+0LITkw
        ML+e51DQlt/f1kkpRhj7D5h6aZvadepjJcUIFA4qcj1ieF4XWiVNOV0jn3mdn8x/HeUfI9
        87BcXqq0oR61C127H6FxTngi6hUCvFa7+Dy8DGWL+oXmlhdMh610LfRIiAMclvyblzm3dS
        9C6j7x35Qi51m4xQhx6IRaVfVbwC5QdmeXq7mG/PZZlDF/yakzPrns5SfXkufA==
Date:   Thu, 23 Mar 2023 13:55:09 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Adam Pigg <adam@piggz.co.uk>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, yong.deng@magewell.com,
        mchehab@kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] media: sun6i-csi: merge sun6i_csi_formats and
 sun6i_csi_formats_match
Message-ID: <ZBxMLU+PJgPqlU4j@aptenodytes>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-2-adam@piggz.co.uk>
 <Y7ivZC2e0TZtbASV@pendragon.ideasonboard.com>
 <5905587.lOV4Wx5bFT@192-168-1-215>
 <Y7sm4ZbAoBhuhmP/@pendragon.ideasonboard.com>
 <Y+/FUICC58w10rNJ@pendragon.ideasonboard.com>
 <Y/Xw7lsKOYFqaZEw@aptenodytes>
 <CANFkB1xNRMJyA3MKgwtPXc7B2BiGKhQPDan9NXw+QtCMD7cEJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="KOKAUefQFL8klRs8"
Content-Disposition: inline
In-Reply-To: <CANFkB1xNRMJyA3MKgwtPXc7B2BiGKhQPDan9NXw+QtCMD7cEJQ@mail.gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--KOKAUefQFL8klRs8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On Tue 21 Mar 23, 17:50, Adam Pigg wrote:
> On Wed, 22 Feb 2023 at 10:39, Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> >
> > Hi Adam, Laurent,
> >
> > On Fri 17 Feb 23, 20:20, Laurent Pinchart wrote:
> > > Could you share your opinion on the question below ?
> >
> > Yeah sorry for the long delay here. It's taken me a while to dive back =
into
> > this topic.
> >
> > My first impression is that I would rather be in favor of keeping a dyn=
amic
> > approach like what's already in sun6i_csi_capture_link_validate and ext=
ract
> > the mbus/pixfmt matching logic from there.
> >
> > I would be happy to craft a patch in that direction, but maybe you'd li=
ke
> > to have a try at it (since it's your series). Just let me know, I think=
 I can
> > do it pretty quickly now that I have everything back in mind. I could a=
lso
> > add some comment about the general hardware mechanism/limitations.
> >
>=20
> Hi Paul
>=20
> Apologies for missing this email!
>=20
> As you seem to know the hardware much better, and I was only getting
> it working together with
> help from others, im more than happy for you to work up the changes,
> and it will likely result in
> a much shorter change cycle!

Glad to hear! I have some patches working already :)

> Would that be for this patch only in the series, or the other 2 also?

That would be for the enum_fmt mbus_code support as well as enum_framesizes.
For the latter, I've made little change to your code so I will add your
Co-authored-by and Signed-off-by lines.

The same changes also apply to the sun6i-isp driver, which I try to keep
in sync with sun6i-csi.

Will send the patches soon (probably tomorrow).

Cheers!

Paul

> Thanks
>=20
> > The hardware is a bit odd in a few ways and I found that the explicit
> > combinatory approach wasn't a very good fit (but obviously that's an op=
en topic
> > for discussions).
> >
> > The general idea is that the SUN6I_CSI_INPUT_FMT_YUV420/422 can only be=
 used
> > to produce outputs on 2 or 3 planes, but not packed YUV. There's also no
> > explicit hardware reordering of the chroma components, so we need to li=
e about
> > the input order (input_yuv_seq_invert) to achieve inverted chroma compo=
nents
> > on the output format.
> >
> > In order to produce packed data, we can only rely on SUN6I_CSI_INPUT_FM=
T_RAW
> > which provides no reordering mechanism. This is why it made good sense =
to me
> > to only have an explicit matching table for this case and rely on more =
general
> > logic that reflects the hardware capabilities otherwise.
> >
> > > On Sun, Jan 08, 2023 at 10:26:09PM +0200, Laurent Pinchart wrote:
> > > > On Sun, Jan 08, 2023 at 06:23:56PM +0000, Adam Pigg wrote:
> > > > > On Friday, 6 January 2023 23:31:48 GMT Laurent Pinchart wrote:
> > > > > > On Fri, Jan 06, 2023 at 07:40:36PM +0000, adam@piggz.co.uk wrot=
e:
> >
> > [...]
> >
> > > > > > > +#define SUN6I_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
> >
> > Cosmetic suggestion to stay consistent with the rest:
> > #define SUN6I_CSI_CAPTURE_MBUS_CODES(mbus_codes...) \
> >         (const u32[]) { mbus_codes, 0 }
> >
> > Also it would look better in sun6i_csi_capture.h.
> >
> > But really I would be happier with a dynamic approach.
> >
> > [...]
> >
> > > > > > >       /* YUV422 */
> > > > > > >       {
> > > > > > >
> > > > > > > @@ -123,6 +139,8 @@ static const struct sun6i_csi_capture_for=
mat
> > > > > > > sun6i_csi_capture_formats[] =3D {>
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_RAW_8,
> > > > > > >               .input_format_raw       =3D true,
> > > > > > >               .hsize_len_factor       =3D 2,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D  SUN6I_BUS_FMTS(MED=
IA_BUS_FMT_YUYV8_2X8,
> > > > > > > +                                                       MEDIA=
_BUS_FMT_YUYV8_1X16),
> > > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_YVYU,
> > > > > > >
> > > > > > > @@ -130,6 +148,8 @@ static const struct sun6i_csi_capture_for=
mat
> > > > > > > sun6i_csi_capture_formats[] =3D {>
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_RAW_8,
> > > > > > >               .input_format_raw       =3D true,
> > > > > > >               .hsize_len_factor       =3D 2,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D  SUN6I_BUS_FMTS(MED=
IA_BUS_FMT_YVYU8_2X8,
> > > > > > > +                                                       MEDIA=
_BUS_FMT_YVYU8_1X16),
> > > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_UYVY,
> > > > > > >
> > > > > > > @@ -137,6 +157,8 @@ static const struct sun6i_csi_capture_for=
mat
> > > > > > > sun6i_csi_capture_formats[] =3D {
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_RAW_8,
> > > > > > >               .input_format_raw       =3D true,
> > > > > > >               .hsize_len_factor       =3D 2,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D  SUN6I_BUS_FMTS(MED=
IA_BUS_FMT_UYVY8_2X8,
> > > > > > > +                                                       MEDIA=
_BUS_FMT_UYVY8_1X16),
> > > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_VYUY,
> > > > > > >
> > > > > > > @@ -144,57 +166,68 @@ static const struct sun6i_csi_capture_f=
ormat
> > > > > > > sun6i_csi_capture_formats[] =3D {>
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_RAW_8,
> > > > > > >               .input_format_raw       =3D true,
> > > > > > >               .hsize_len_factor       =3D 2,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D  SUN6I_BUS_FMTS(MED=
IA_BUS_FMT_VYUY8_2X8,
> > > > > > > +                                                       MEDIA=
_BUS_FMT_VYUY8_1X16),
> > > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_NV16,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_YUV422SP,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_YUV422SP,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D 0,
> > > > > >
> > > > > > I don't think this is correct. To produce semi-planar or multi-=
planar
> > > > > > YUV formats, I believe the CSI needs YUV input. This should thu=
s be
> > > > > > (unless I'm mistaken)
> >
> > You are correct.
> >
> > > > > >
> > > > > >                 .mbus_codes             =3D  SUN6I_BUS_FMTS(MED=
IA_BUS_FMT_UYVY8_2X8,
> > > > > >                                                           MEDIA=
_BUS_FMT_UYVY8_1X16,
> > > > > >                                                           MEDIA=
_BUS_FMT_VYUY8_2X8,
> > > > > >                                                           MEDIA=
_BUS_FMT_VYUY8_1X16,
> > > > > >                                                           MEDIA=
_BUS_FMT_YUYV8_2X8,
> > > > > >                                                           MEDIA=
_BUS_FMT_YUYV8_1X16,
> > > > > >                                                           MEDIA=
_BUS_FMT_YVYU8_2X8,
> > > > > >                                                           MEDIA=
_BUS_FMT_YVYU8_1X16),
> > > > > >
> > > > > > and same below.
> >
> > All of the YUV420/422 pixel formats on 2 or 3 planes can take all of the
> > supports packed 16-bit YUV bus formats, which is why it doesn't seem ve=
ry
> > graceful to have an explicit list.
> >
> > > > > >
> > > > > Hi Laurent
> > > > >
> > > > > Thanks for the help and tips.  Ive made all the other changes, wh=
ich can be
> > > > > viewed here until i resubmit them https://github.com/sailfish-on-=
dontbeevil/
> > > > > kernel-megi/commits/pinephone-libcamera
> > > > >
> > > > > Im just not quite sure on this one.  I think my implementation of=
 merging the
> > > > > arrays keeps the previous mapping right?  In sun6i_csi_capture_fo=
rmat_matches
> > > > > there is no mapping for the *NV formats, and the remaining ones i=
ve set to 0?
> > > >
> > > > The current implementation allows writing multi-planar formats (e.g.
> > > > NV12) to memory when the input of the CSI is a YUV media bus format
> > > > (e.g. YUYV8_1X16). This patch doesn't change that, but it will prev=
ent
> > > > NV12 from being enumerated when using media bus-based enumeration of
> > > > pixel formats, so userspace won't see NV12 as being available.
> > > >
> > > > It would be fine fixing that issue in a separate patch on top of th=
is
> > > > one, but I though you could as well do both in one go.
> > >
> > > Adam, you mentioned that NV12 and NV16 "don't work". Could you elabor=
ate
> > > and explain what you've tried exactly ?
> >
> > We definitely need to keep the ability to produce NV12, NV16 and friend=
s from
> > YUV bus formats.
> >
> > > > > > Paul, could you confirm this ?
> > > > > >
> > > > > > I'm a bit surprised that the CSI can't shuffle the YUV componen=
ts for
> > > > > > packed YUYV formats, but so be it if that's a hardware limitati=
on.
> >
> > Yep that is correct, it's a hardware limitation.
> >
> > Cheers,
> >
> > Paul
> >
> > > > > > I'm also thinking that a subsequent patch could drop the raw ch=
eck from
> > > > > > sun6i_csi_capture_link_validate():
> > > > > >
> > > > > > -       /* With raw input mode, we need a 1:1 match between inp=
ut and  output. */
> > > > > > -       if (bridge_format->input_format =3D=3D SUN6I_CSI_INPUT_=
FMT_RAW ||
> > > > > > -           capture_format->input_format_raw) {
> > > > > > -               match =3D sun6i_csi_capture_format_match(pixelf=
ormat,
> > > > > > -                                                       fmt.for=
mat.code);
> > > > > > -               if (!match)
> > > > > > -                       goto invalid;
> > > > > > -       }
> > > > > > +       /* Make sure the media bus code and pixel format are co=
mpatible. */
> > > > > > +       match =3D sun6i_csi_capture_format_match(pixelformat,  =
fmt.format.code);
> > > > > > +       if (!match)
> > > > > > +               goto invalid;
> > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_NV61,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_YUV422SP,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_YUV422SP,
> > > > > > >               .input_yuv_seq_invert   =3D true,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D 0,
> > > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_YUV422=
P,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_YUV422P,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_YUV422P,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D 0,
> > > > > > >
> > > > > > >       },
> > > > > > >       /* YUV420 */
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_NV12_1=
6L16,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_YUV420MB,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_YUV420MB,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D 0,
> > > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_NV12,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_YUV420SP,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_YUV420SP,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D 0,
> > > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_NV21,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_YUV420SP,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_YUV420SP,
> > > > > > >               .input_yuv_seq_invert   =3D true,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D 0,
> > > > > > >
> > > > > > >       },
> > > > > > >
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_YUV420,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_YUV420P,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_YUV420P,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D 0,
> > > > > > >
> > > > > > >       },
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_YVU420,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_YUV420P,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_YUV420P,
> > > > > > >               .input_yuv_seq_invert   =3D true,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D 0,
> > > > > > >
> > > > > > >       },
> > > > > > >       /* Compressed */
> > > > > > >       {
> > > > > > >
> > > > > > >               .pixelformat            =3D V4L2_PIX_FMT_JPEG,
> > > > > > >               .output_format_frame    =3D  SUN6I_CSI_OUTPUT_F=
MT_FRAME_RAW_8,
> > > > > > >               .output_format_field    =3D  SUN6I_CSI_OUTPUT_F=
MT_FIELD_RAW_8,
> > > > > > >
> > > > > > > +             .mbus_codes             =3D  SUN6I_BUS_FMTS(MED=
IA_BUS_FMT_JPEG_1X8),
> > > > > > >
> > > > > > >       },
> > > > > > >
> > > > > > >  };
> > > > > > >
> > > > > > > @@ -210,118 +243,20 @@ struct sun6i_csi_capture_format
> > > > > > > *sun6i_csi_capture_format_find(u32 pixelformat)>
> > > > > > >       return NULL;
> > > > > > >
> > > > > > >  }
> > > > > > >
> > > > > > > -/* RAW formats need an exact match between pixel and mbus fo=
rmats. */
> > > > > > > -static const
> > > > > > > -struct sun6i_csi_capture_format_match sun6i_csi_capture_form=
at_matches[]
> > > > > > > =3D { - /* YUV420 */
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_YUYV,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_YUYV,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_YVYU,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_YVYU8_2X8,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_YVYU,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_YVYU8_1X16,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_UYVY,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_UYVY8_2X8,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_UYVY,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_VYUY,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_VYUY8_2X8,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_VYUY,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_VYUY8_1X16,
> > > > > > > -     },
> > > > > > > -     /* RGB */
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_RGB565,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_RGB565_2X8_LE,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_RGB565X,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_RGB565_2X8_BE,
> > > > > > > -     },
> > > > > > > -     /* Bayer */
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SBGGR8,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SGBRG8,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SGRBG8,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SRGGB8,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SBGGR10,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SGBRG10,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SGRBG10,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SRGGB10,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SBGGR12,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SGBRG12,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SGRBG12,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> > > > > > > -     },
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_SRGGB12,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> > > > > > > -     },
> > > > > > > -     /* Compressed */
> > > > > > > -     {
> > > > > > > -             .pixelformat    =3D V4L2_PIX_FMT_JPEG,
> > > > > > > -             .mbus_code      =3D MEDIA_BUS_FMT_JPEG_1X8,
> > > > > > > -     },
> > > > > > > -};
> > > > > > > -
> > > > > > >
> > > > > > >  static bool sun6i_csi_capture_format_match(u32 pixelformat, =
u32
> > > > > > >  mbus_code)
> > > > > > >  {
> > > > > > >
> > > > > > > -     unsigned int i;
> > > > > > > -
> > > > > > > -     for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_format_m=
atches); i++)  {
> > > > > > > -             const struct sun6i_csi_capture_format_match *ma=
tch =3D
> > > > > > > -                     &sun6i_csi_capture_format_matches[i];
> > > > > > > -
> > > > > > > -             if (match->pixelformat =3D=3D pixelformat &&
> > > > > > > -                 match->mbus_code =3D=3D mbus_code)
> > > > > > > -                     return true;
> > > > > > > +     unsigned int i, j;
> > > > > > > +
> > > > > > > +     for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats)=
; i++) {
> > > > > > > +             const struct sun6i_csi_capture_format *format =
=3D
> > > > > > > +                     &sun6i_csi_capture_formats[i];
> > > > > > > +
> > > > > > > +             if (format->pixelformat =3D=3D pixelformat) {
> > > > > > > +                     for (j =3D 0; format->mbus_codes[j]; j+=
+) {
> > > > > > > +                             if (mbus_code =3D=3D format->mb=
us_codes[j])
> > > > > > > +                                     return true;
> > > > > > > +                     }
> > > > > > > +             }
> > > > > > >
> > > > > > >       }
> > > > > > >
> > > > > > >       return false;
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi=
_capture.h
> > > > > > > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h =
index
> > > > > > > 3ee5ccefbd10..0484942834e3 100644
> > > > > > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_captur=
e.h
> > > > > > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_captur=
e.h
> > > > > > > @@ -27,11 +27,7 @@ struct sun6i_csi_capture_format {
> > > > > > >
> > > > > > >       bool    input_yuv_seq_invert;
> > > > > > >       bool    input_format_raw;
> > > > > > >       u32     hsize_len_factor;
> > > > > > >
> > > > > > > -};
> > > > > > > -
> > > > > > > -struct sun6i_csi_capture_format_match {
> > > > > > > -     u32     pixelformat;
> > > > > > > -     u32     mbus_code;
> > > > > > > +     const u32 *mbus_codes;
> > > > > > >
> > > > > > >  };
> > > > > > >
> > > > > > >  #undef current
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
> >
> > --
> > Paul Kocialkowski, Bootlin
> > Embedded Linux and kernel engineering
> > https://bootlin.com

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--KOKAUefQFL8klRs8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmQcTCwACgkQ3cLmz3+f
v9HXBwf/TEJkfHIvbVX/VWK8INedkVMw3Xe069lj1Vu+0rL1YyW339G0EHq5wy6E
oD1dXG15quVthGK9rF6nbOIoQiEAKH23t2fteRCmTsNnGdodL7MkznmdIZ2htE4Z
ahGvALgv9tdpj/7j9kQttcjSv2xuH7u5XOqZdjBGqtT8+sPYhicChamMqeb72yGG
IywTOGuRFv0IdjCwmV3fLoMLqAyGc8vO8GMxFs2jqiuskupvyqMbg7aThtQzmFZS
HU9Ws7nLUn2XMr1DO4UpSeLLsRK2o2pceTxEwbCGvXs6DJ7Ihe5PCf5nBzh2rh26
91Q1Vpx9XbCjP/Sh1RRkuWnRKIoW4w==
=8JIu
-----END PGP SIGNATURE-----

--KOKAUefQFL8klRs8--
