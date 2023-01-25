Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2556567B46C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 15:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235388AbjAYO2N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 09:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235086AbjAYO2K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 09:28:10 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CC718B12;
        Wed, 25 Jan 2023 06:28:03 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1CC8B6602E00;
        Wed, 25 Jan 2023 14:28:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1674656882;
        bh=rJyQR0v8iKrJWtNCwmnLS2MPNx/i9JuopJQn6g7HfHo=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=e4kCLdzLbodn4ePgll8WwdPnbAuQkmut++zrt+qx8TBYx9Mjr3g977GWWM6coPMwr
         yY7hLiYQwcoytxDP5p08n83DzKzpY3BjjexkZ6BJHaIVIDkNtIkghykFjvBPzJ/9kZ
         D5b/A8rheAUNY8osRPtr1MWvD29fuahDTr2TujuqsdjdaDeS7bvSO61E82Q7C4iNJj
         S8553kwdOEQ7lMgWa0jsGfnvgN2Z1HbyT8z19VHMqDjlJEOt2lHfFW6wLETAaceoF5
         lcxKkTgygJpptXNsndEAyaV7J2z77FD3kk1zz31dl3vNLHz22D0DrKNriyZCt4wK/d
         MU4CC2zvyHzrQ==
Message-ID: <dc550ea69488a53e108a31bd0574e63e18704a0b.camel@collabora.com>
Subject: Re: [PATCH] hantro: Fix JPEG encoder ENUM_FRAMESIZE on RK3399
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel@collabora.com,
        Robert Mader <robert.mader@collabora.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Wed, 25 Jan 2023 09:27:50 -0500
In-Reply-To: <20230124223855.GD7611@pengutronix.de>
References: <20221223141644.703088-1-nicolas.dufresne@collabora.com>
         <CAAEAJfATk+jOq3qt-m2CZEbCVumHHWDFfuEXKA7k0NZQXajCRg@mail.gmail.com>
         <6449640fcfbbfd4b72e619f03704b7e9031a8a17.camel@collabora.com>
         <20230124223855.GD7611@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 24 janvier 2023 =C3=A0 23:38 +0100, Michael Grzeschik a =C3=A9crit=
=C2=A0:
> On Fri, Dec 23, 2022 at 12:05:21PM -0500, Nicolas Dufresne wrote:
> > Le vendredi 23 d=C3=A9cembre 2022 =C3=A0 13:28 -0300, Ezequiel Garcia a=
 =C3=A9crit=C2=A0:
> > > Hi everyone,
> > >=20
> > > On Fri, Dec 23, 2022 at 11:17 AM Nicolas Dufresne
> > > <nicolas.dufresne@collabora.com> wrote:
> > > >=20
> > > > The frmsize structure was left initialize to 0, as side effect, the=
 driver was
> > > > reporting an invalid frmsize.
> > > >=20
> > > >   Size: Stepwise 0x0 - 0x0 with step 0/0
> > > >=20
> > > > Fix this by replicating the constraints in the raw formats too. Thi=
s fixes
> > > > taking picture in Gnome Cheese Software, or any software using GSte=
amer
> > > > encodebin feature.
> > > >=20
> > > > Fixes: 775fec69008d30 ("media: add Rockchip VPU JPEG encoder driver=
")
> > >=20
> > > The frmsize is only for bitstream formats (see comment in struct hant=
ro_fmt).
> > > If I can read code correctly, this was broken by this commit:
> > >=20
> > > commit 79c987de8b35421a2a975982929f150dd415f8f7
> > > Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > Date:   Mon Apr 4 18:06:40 2022 +0200
> > >=20
> > >     media: hantro: Use post processor scaling capacities
> > >=20
> > > Before that commit we used to return EINVAL for enum_framesizes
> > > in RAW formats. I guess we missed that :-)
> >=20
> > I see, and gstreamer had a quirk for such a bogus response. Let me expl=
ain why
> > its bogus, for the general knowlege. A driver that supports ENUM_FRAMES=
IZE but
> > does not return any sizes, is in theory a driver that does not support =
anything.
> > Fortunaly, GStreamer considered not having a single framesize bogus, an=
d would
> > fallback to the old school try_fmt() dance to find the supported sizes.
> >=20
> > So yes, it used to work in gstreamer, and its indeed
> > 79c987de8b35421a2a975982929f150dd415f8f7 that broke it. I'll correct hi=
s in V2.
> >=20
> > >=20
> > > To be completely honest, I'm not sure if we used to support encodebin=
,
> > > and I'm not too sure how to approach this issue, but I would really
> > > love to start with something super simple like:
> > >=20
> > > diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > index 2c7a805289e7..0b28f86b7463 100644
> > > --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > > @@ -161,8 +161,11 @@ static int vidioc_enum_framesizes(struct file
> > > *file, void *priv,
> > >         }
> > >=20
> > >         /* For non-coded formats check if postprocessing scaling is p=
ossible */
> > > -       if (fmt->codec_mode =3D=3D HANTRO_MODE_NONE &&
> > > hantro_needs_postproc(ctx, fmt)) {
> > > -               return hanto_postproc_enum_framesizes(ctx, fsize);
> > > +       if (fmt->codec_mode =3D=3D HANTRO_MODE_NONE)
> > > +        if (hantro_needs_postproc(ctx, fmt))
> > > +            return hanto_postproc_enum_framesizes(ctx, fsize);
> > > +        else
> > > +            return -ENOTTY;
> > >         } else if (fsize->index !=3D 0) {
> > >                 vpu_debug(0, "invalid frame size index (expected 0, g=
ot %d)\n",
> > >                           fsize->index);
> > >=20
> > > (ENOTTY was suggested by Nicolas on IRC)
> > >=20
> > > Nicolas also pointed out that our current handling of frmsize is not =
correct,
> > > as we cannot express different constraints on combinations of RAW
> > > and bitstream formats.
> > >=20
> > > This seems to call for a rework of enum_framesizes, so frmsize
> > > is not static but somehow obtained per-codec.
> >=20
> > So I'll respin along these line to we more or less "revert back" to wor=
king
> > state. Though having a framesize enumeration on encoder raw (OUTPUT que=
ue) is
> > what makes most sense so that will have to be revisited with a correcte=
d
> > mechanism, as whenever we add VP8 and H.264 encoding, we'll need differ=
ent range
> > per codec. I'll check in January with my colleague, we might do that in=
side the
> > VP8 encoder branch (that is nearly ready and will be sent after the hol=
idays),
> > or could be an intermediate set.
>=20
> I just came across this discussion and found my very similar and somehow
> forgotten patch the other day.
>=20
> https://lore.kernel.org/linux-media/66839e0c4b19eb4faba5fbed5cd0a4ec0c841=
5f8.camel@ndufresne.ca/
>=20
> Should I just send a v2 with the ENOTTY for now?

I was forgetting about this, sorry, ok if you have bandwidth, just update y=
our
patch with ENOTTY, can you extend your comment with what was wrong with the=
 ENUM
(like I did in my patch) ? Also don't forget to add a Fixes tag, this needs
backporting.

>=20
> Thanks,
> Michael
>=20
> > > > Reported-by: Robert Mader <robert.mader@collabora.com>
> > > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > >=20
> > > And thanks a lot for the report and the patch!
> > >=20
> >=20
> >=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20

