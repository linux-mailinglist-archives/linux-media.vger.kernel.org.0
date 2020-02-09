Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D8C156AC8
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2020 15:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgBIOAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Feb 2020 09:00:30 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:18738 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbgBIOAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Feb 2020 09:00:30 -0500
Date:   Sun, 09 Feb 2020 14:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1581256828;
        bh=P1f0GsyJAGBCodCs/GHs0Wv26MFXutx6qdGNmr5va6c=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=lAQDfwK63VDgjhM7RIXtdHYmftRCZOjeTt1XCL3Syrfav3ZZxXYVMRIgPSUUtYPX0
         cM72pWRHijnmDczi0ixgEH7HU3BS7VevDI4BOuyBHIBsHGJel0Hk8gY6j4Xv3p3MOR
         Mud+ShGOh5yPDdYxJUno6rbL0EKf9EKeIITKbTDI=
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
Subject: Re: [PATCH 2/3] media: vimc: Add GBR media bus code
Message-ID: <20200209140007.l5fmugkwoxdshu33@ArchWay.local>
In-Reply-To: <c88d21cb-29e0-9fac-c584-d010fd9a4aa3@collabora.com>
References: <20200202155019.1029993-1-nfraprado@protonmail.com>
 <20200202155019.1029993-3-nfraprado@protonmail.com>
 <c88d21cb-29e0-9fac-c584-d010fd9a4aa3@collabora.com>
Feedback-ID: cwTKJQq-dqva77NrgNeIaWzOvcDQqfI9VSy7DoyJdvgY6-nEE7fD-E-3GiKFHexW4OBWbzutmMZN6q4SflMDRw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

thank you for the review.

Please see my comment below.

On Wed, Feb 05, 2020 at 11:17:35AM -0300, Helen Koike wrote:
>=20
> Hi N=C3=ADcolas,
>=20
> Thank you for the patch.
>=20
> On 2/2/20 1:50 PM, N=C3=ADcolas F. R. A. Prado wrote:
> > Add missing GBR888_1X24 media bus code in the vimc_pix_map_list. Since
> > there is no pixel format for it, use the pixelformat for RGB.
> >
> > Co-developed-by: Vitor Massaru Iha <vitor@massaru.org>
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>
> > ---
> >  drivers/media/platform/vimc/vimc-common.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/=
platform/vimc/vimc-common.c
> > index 55797e5ab2b1..591a50f63766 100644
> > --- a/drivers/media/platform/vimc/vimc-common.c
> > +++ b/drivers/media/platform/vimc/vimc-common.c
> > @@ -25,7 +25,7 @@ static const struct vimc_pix_map vimc_pix_map_list[] =
=3D {
> >  =09=09.bayer =3D false,
> >  =09},
> >  =09{
> > -=09=09.code =3D {MEDIA_BUS_FMT_RGB888_1X24},
> > +=09=09.code =3D {MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_GBR888_1X24}=
,
>=20
> Could you add spaces around the curly brackets here too?
>=20
> I was also thinking that all the MEDIA_BUS_FMT_RGB888_* and MEDIA_BUS_FMT=
_GBR888_* variants
> could be added here (to be verified).

Now that you said it, it does seem that this could be done.

From the pixelformat definitions on [1], there is a single format definitio=
n for
RGB-8-8-8 and for BGR-8-8-8:

#define V4L2_PIX_FMT_BGR24   v4l2_fourcc('B', 'G', 'R', '3') /* 24  BGR-8-8=
-8     */
#define V4L2_PIX_FMT_RGB24   v4l2_fourcc('R', 'G', 'B', '3') /* 24  RGB-8-8=
-8     */

This probably means that all media bus code variants of RGB888 should map t=
o the
same RGB888 pixelformat. Same for BGR888.

So, should I go on and send a v2 adding these other formats or should we wa=
it
for others to comment on this first?

Thanks,
N=C3=ADcolas

[1] https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/video=
dev2.h#L549

>=20
> Thanks
> Helen
>=20
> >  =09=09.pixelformat =3D V4L2_PIX_FMT_RGB24,
> >  =09=09.bpp =3D 3,
> >  =09=09.bayer =3D false,
> >

