Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1146694C9B
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 17:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjBMQZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 11:25:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjBMQZe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 11:25:34 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99FD1CF77
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 08:25:11 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id f10so14337652qtv.1
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RzCZ7Gz8dNg2wwMEAhcGBRHW0pAcl0AMRnHCGIOP8gM=;
        b=8B47NgTrT9a8ALWWpWuJlPNLWReTysKXWa7izy9352B/PQ3rU0ThDNRZXJMwCqKUjI
         AVfd+PUreh9kbwyGSEnqaQdb0wDEv8J7fXYzEuOoBweQbRgkvBidIIx0wISqXDOcFMK+
         CHUPPSEImq/quctxIEMqCiwtg9oUE0ScJcDhcgwgTaQKgzI4oM+bdABK+Cdk/OAx0c4o
         RCcyGpi8iPOSgV3jn2LVCVnE4RKOeBDiMQbNhDrdvHprxuE1zoeE5+W0efL2Dg8+Ab8Q
         R3JbZK2E7wGAbMkDUHx66oZJv+opE17ypalXcxA12G3c7V7TjpC8KWsKemRCVa1Gt/r3
         w+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzCZ7Gz8dNg2wwMEAhcGBRHW0pAcl0AMRnHCGIOP8gM=;
        b=lK9QFK1j5Ylmuc0vXlXsXulXsNYWJg2Lvrk3tG1uaCNF6YoGuAXhCOyhfTM8DKqDXh
         8OdKZssCb2RIZiG8EQeCjo6cYEshNgbfkml0bzwO7hKd71UAZk/5+TyOdyPM5ajd+/ts
         EB4i8VbuAd4yED4fd9JtR3hdylnTrMtt7eKM44JHmpB6TdL2qU7vbipm1hXYywJLS9P+
         xfZy+YugRTf5KlDAc/Wi2SAyEXxuOLi3fC36dsErd+Bi+N0Jpso/ZAlQMCb0n1P3FeMC
         oJEM00u5VyiHgw1WohPNhifGPVRqoPvStVALHnoXQ9QtD+TemHYSV62v0l76xnHTJ2nA
         USQQ==
X-Gm-Message-State: AO0yUKX3bvH/Z+HF8M2fm0D4XU2KrQg87FNznaRMlLBl9u+Gi1L73QSW
        847ZaWOjF4Bp/pBKmSX9eLhAxw==
X-Google-Smtp-Source: AK7set8Qn5QamWVNmff1ixzoznHYQT4xPDfMO+hD4rmH2tU1JcccuqfGYZnMHeB7n0QTLFYwuNFWFQ==
X-Received: by 2002:a05:622a:1704:b0:3a8:1677:bc39 with SMTP id h4-20020a05622a170400b003a81677bc39mr46995125qtk.52.1676305509391;
        Mon, 13 Feb 2023 08:25:09 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id x16-20020ac87ed0000000b003b82489d8acsm9486416qtj.21.2023.02.13.08.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 08:25:08 -0800 (PST)
Message-ID: <c49047ac613970d29618e6367214daa43064485f.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: v4l: Add Broadcom sand formats to videodev2.h
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Date:   Mon, 13 Feb 2023 11:25:06 -0500
In-Reply-To: <olciuh9k2f6qsirql2oh450tiashbo62im@4ax.com>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
         <20230127153415.83126-2-jc@kynesim.co.uk>
         <4c9eef106e893b633ab83a792d97cc5e36f408fe.camel@ndufresne.ca>
         <1ogauh5ro652so8vtc2fsgor5g3pj6ns3e@4ax.com>
         <04dd55039d1c66d382dc9086500e5b8037ed6598.camel@ndufresne.ca>
         <olciuh9k2f6qsirql2oh450tiashbo62im@4ax.com>
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

Le dimanche 12 f=C3=A9vrier 2023 =C3=A0 18:49 +0000, John Cox a =C3=A9crit=
=C2=A0:
> Hi
>=20
> > Le jeudi 09 f=C3=A9vrier 2023 =C3=A0 19:06 +0000, John Cox a =C3=A9crit=
=C2=A0:
> > > Hi
> > >=20
> > > > Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =C3=A9cr=
it=C2=A0:
> > > > > Add fourccs for Broadcom 8 and 10-bit packed 128 byte column form=
ats to
> > > > > videodev2.h
> > > > >=20
> > > > > Signed-off-by: John Cox <jc@kynesim.co.uk>
> > > > > ---
> > > > >  include/uapi/linux/videodev2.h | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >=20
> > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/=
videodev2.h
> > > > > index 1befd181a4cc..a836322ae5d8 100644
> > > > > --- a/include/uapi/linux/videodev2.h
> > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > @@ -656,6 +656,8 @@ struct v4l2_pix_format {
> > > > >  #define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /*=
 12  Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
> > > > >  #define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1',=
 '2') /* Y/CbCr 4:2:0 8x128 tiles */
> > > > >  #define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '=
1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > > > > +#define V4L2_PIX_FMT_NV12_C128        v4l2_fourcc('C', 'N', '1',=
 '2') /* Y/CbCr 4:2:0 128 byte columns */
> > > > > +#define V4L2_PIX_FMT_P030_C128        v4l2_fourcc('C', 'N', '3',=
 '0') /* Y/CbCr 4:2:0 10-bit packed 128 byte columns */
> > > > > =20
> > > > >  /* Tiled YUV formats, non contiguous planes */
> > > > >  #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* =
12  Y/CbCr 4:2:0 64x32 tiles */
> > > >=20
> > > > I would expect updates to v4l2-common.c and v4l2-ioctl.c to be in t=
he same
> > > > patch. And then the driver should be using the helpers there whenev=
er possible.
> > >=20
> > > Fair point - I'll fix that.
> > >=20
> > > What is the correct .bpp for 3 10-bit pixels packed into 4 bytes in t=
he
> > > v4l2_format_info?
> >=20
> > Good question, maybe this can be done with the fractional bpp support. =
I must
> > admit, I didn't think about padded cases, I was handling 10bit fully pa=
cked over
> > 5 bytes.
> >=20
> > https://lore.kernel.org/linux-arm-kernel/20230103170058.810597-3-benjam=
in.gaignard@collabora.com/
> > My case ended working with:
> >=20
> > { .format =3D V4L2_PIX_FMT_NV12_10LE40_4L4, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .b=
pp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> >=20
> > Question is what do we do about comp_planes, if we kind of fake it to b=
e 2, then maybe this would work.
> >=20
> > { .format =3D V4L2_PIX_FMT_P030_C128, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 4, 8, 0, 0 }, .bpp_div =
=3D { 3, 3, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> >=20
> > For weird format, this is a bit of hacky, all we want is to get the rig=
ht
> > stride, and the offset part is not used for mem_planes =3D 1 formats.
>=20
> I'm happy with whatever the consensus says is "right".
>=20
> What tree/branch should I be patching against? Code to support the above
> doesn't seem to be in git://linuxtv.org/media_tree:master which is what
> I was using.

Not yet, this patch is part of "[PATCH v3 00/13] AV1 stateless decoder for
RK3588" serie from Benjamin, which now needs to be rebased on V5 of the API=
.

I see two options, you simply pick it as part of your patchset, worst case =
the
other serie get merge and we skip it or I split it out of AV1 so we can get=
 it
merged sooner. I can probably make it on its own, as  it is used to enable =
the
native (reference frame) format Hantro produces, including VP9, which is wr=
ongly
mapped to P010_4L4 at the moment (not even sure this format exist).

Nicolas

>=20
> Thanks
>=20
> John Cox
>=20
> > let me know,
> > Nicolas
> >=20
> > >=20
> > > Regards
> > >=20
> > > John Cox

