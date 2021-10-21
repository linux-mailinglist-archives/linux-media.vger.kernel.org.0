Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A068436664
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 17:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhJUPi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 11:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbhJUPi6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 11:38:58 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C310C061764;
        Thu, 21 Oct 2021 08:36:42 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w14so2802924edv.11;
        Thu, 21 Oct 2021 08:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cXxB1iqeAcia/gUr/dCX991+dsHriT2zpUDepICfnMw=;
        b=ilqBUlu0nHsH2mJKeHnFm9R/+2dL/GcNH1oH3XXSrLuQtlTD7sMsGVDD+HthV9fExs
         zvWN+mA7kNwbu992dhKwAndrhbpxgHEO6QwrCNH+yPi/JwveiUa7A2IzLAjVaRG4BPf4
         BGvb7DB4FSIHxpeYNobH/9TYEEVcxHulW4+z74IuDPlzugeG57U9K4vqxL4SDV5WY7kh
         U8y+YK3YnFhTPrwZisaohpr7o9km561eDBKNYMvs7aQH0bYFMHoK2UquLmHHv8Vwgq6i
         //gZRmvNvLIip7S4INHC0LG7GMo6luqAQU9uHMsNMul4vBHtNUcMWZlok029DlbyWVcq
         LL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cXxB1iqeAcia/gUr/dCX991+dsHriT2zpUDepICfnMw=;
        b=MagIz2Jwf1L1MdkHDxfJjbQfAjYp1UjlG+XMOSF/qIoMelK9sjJjOeBONQ3JNsdvaP
         uaFoxIsAsUK1AJ0SJ6rIDdLcSIheQIKJslNL94gHmO1AitvOi7PZQM4+WytWPT0DTjXA
         cae7RuOskdnelMPB/MXZUyI7yZEn/nIQcy0pmeD3MOrNxqzUzHSgtZMWWwMbOaPw7XCn
         jAF4ZFFtJilZKbzmGH7K2/GxxCf6n2LG98qtNDxRsOARLL9yP7UwvknWqwMGIKz4cN2I
         TTXDPMiGmMVob9U1braP+2f0O6h4s4APlUX9O7qr4kUEipw3HVcLwwEpO8Csmqwnr6Mo
         cuQw==
X-Gm-Message-State: AOAM532jYGoDdNeOekbDBP1emzHsSHIKO6BGL+OrcX56qtQ6BeLG1g5G
        jwuZ7bMi7cuDHmQiFYdQp+0=
X-Google-Smtp-Source: ABdhPJww6dt0MM2DwFmRnm4LIiY9YxS6m8v7GdOWHB5AFB2dvHF3j1128hCBXPqAygosULIIVGWOTg==
X-Received: by 2002:a05:6402:1d49:: with SMTP id dz9mr8794246edb.17.1634830600987;
        Thu, 21 Oct 2021 08:36:40 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id v28sm3031349edx.21.2021.10.21.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:36:40 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media <linux-media@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: Re: Re: Re: [PATCH v7 11/11] media: hantro: Support NV12 on the G2 core
Date:   Thu, 21 Oct 2021 17:36:39 +0200
Message-ID: <5507278.DvuYhMxLoT@kista>
In-Reply-To: <CAAEAJfDkOUp_kzrR-eAUiwO4EGHcuQVpCxBJwJr5_pZZqr-xwg@mail.gmail.com>
References: <20210929160439.6601-1-andrzej.p@collabora.com> <4350097.LvFx2qVVIh@kista> <CAAEAJfDkOUp_kzrR-eAUiwO4EGHcuQVpCxBJwJr5_pZZqr-xwg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne sreda, 20. oktober 2021 ob 17:25:40 CEST je Ezequiel Garcia napisal(a):
> On Wed, 20 Oct 2021 at 12:04, Jernej =C5=A0krabec <jernej.skrabec@gmail.c=
om>=20
wrote:
> >
> > Dne sreda, 20. oktober 2021 ob 13:06:59 CEST je Ezequiel Garcia=20
napisal(a):
> > > Hi Jernej,
> > >
> > > On Tue, 19 Oct 2021 at 13:38, Jernej =C5=A0krabec <jernej.skrabec@gma=
il.com>
> > wrote:
> > > >
> > > > Hi Andrzej!
> > > >
> > > > Dne petek, 15. oktober 2021 ob 19:19:47 CEST je Andrzej Pietrasiewi=
cz
> > > > napisal(a):
> > > > > Hi Jernej,
> > > > >
> > > > > W dniu 14.10.2021 o 19:42, Jernej =C5=A0krabec pisze:
> > > > > > Hi Andrzej!
> > > > > >
> > > > > > Dne sreda, 29. september 2021 ob 18:04:39 CEST je Andrzej
> > Pietrasiewicz
> > > > > > napisal(a):
> > > > > >> The G2 decoder block produces NV12 4x4 tiled format (NV12_4L4).
> > > > > >> Enable the G2 post-processor block, in order to produce regula=
r=20
NV12.
> > > > > >>
> > > > > >> The logic in hantro_postproc.c is leveraged to take care of
> > allocating
> > > > > >> the extra buffers and configure the post-processor, which is
> > > > > >> significantly simpler than the one on the G1.
> > > > > >
> > > > > > Quick summary of discussion on LibreELEC Slack:
> > > > > > When using NV12 format on Allwinner H6 variant of G2 (needs some
> > driver
> > > > > > changes), I get frames out of order. If I use native NV12 tiled
> > format,
> > > > frames
> > > > > > are ordered correctly.
> > > > > >
> > > > > > Currently I'm not sure if this is issue with my changes or is t=
his
> > general
> > > > > > issue.
> > > > > >
> > > > > > I would be grateful if anyone can test frame order with and=20
without
> > > > > > postprocessing enabled on imx8. Take some dynamic video with a =
lot=20
of
> > > > short
> > > > > > scenes. It's pretty obvious when frames are out of order.
> > > > > >
> > > > >
> > > > > I checked on imx8 and cannot observe any such artifacts.
> > > >
> > > > I finally found the issue. As you mentioned on Slack, register writ=
e=20
order
> > once
> > > > already affected decoding. Well, it's the case again. I made hacky =
test=20
and
> > > > moved postproc enable call after output buffers are set and it work=
ed.=20
So,
> > this
> > > > is actually core quirk which is obviously fixed in newer variants.
> > > >
> > >
> > > Ugh, good catch.
> > >
> > > What happens if you move all the calls to HANTRO_PP_REG_WRITE_S
> > > (HANTRO_PP_REG_WRITE does a relaxed write)?
> > >
> > > Or what happens if the HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dm=
a)
> > > is moved to be done after all the other registers?
> >
> > Those two macros aren't used on G2. Andrzej introduced new postproc=20
helpers
> > for G2.
> >
>=20
> Ah, so the issue is specific on the G2 post-processor.

To be more precise, issue is specific only to old G2 post-processor, found =
in=20
Allwinner H6. Andrzej tested code with newer G2 core and both locations wor=
ked=20
fine.

>=20
> > This commit solves issue for H6:
> > https://github.com/jernejsk/linux-1/commit/
> > a783a977c0843bb4b555dc9d0b5d64915cd219e7
> >
>=20
> Right, but see this comment:
>=20
>     /* Turn on pipeline mode. Must be done first. */
>     HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);
>=20
> I have vague recollection of why we have that comment,
> but I'm reluctant to move post-proc enable to the end.
> (or at least not do it on G1?).

I missed that. Any idea what would be the cleanest way to move code for G2=
=20
only? I can only think of quirk flag in platform specific structure.

Best regards,
Jernej

>=20
> > >
> > > > This makes this series with minor adaptations completely working on=
=20
H6. I
> > see
> > > > no reason not to merge whole series.
> > > >
> > >
> > > Do you have plans to submit your H6 work on top of this?
> >
> > Of course, why would I work on this otherwise? :) But before I do that,=
 I=20
have
> > to clean up and split one commit, which adapts VP9 G2 code for H6 varia=
nt.
> >
>=20
> OK, sounds good.
>=20
> > If you're interested in changes, take a look here:
> > https://github.com/jernejsk/linux-1/commits/vp9
> >
>=20
> Will take a look.
>=20
> Thanks,
> Ezequiel
>=20


