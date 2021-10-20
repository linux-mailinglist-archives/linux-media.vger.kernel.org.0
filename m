Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A578434F03
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 17:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhJTP3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 11:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhJTP3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 11:29:35 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7502CC06161C
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 08:27:20 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id a25so27281353edx.8
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 08:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FULRWRoy+gFirZw/mkbBQ8q4cmksOwfrZ4guTg9Tl+U=;
        b=nex+L4XOCZL4tbASApL9Xuh4hwhhgN1r2dNtvKsccumvMfzlzHnB2ya0gT4hvAjmJw
         827pqm61slx4Acel7pjiOYQkc0mxObWKMnil/93jtkCedlJqgTVxNTzG0WHAzbSOonSV
         7BF4MCRJ/Dhap6Lr3BFTVT+PmXLV4HSgBvffAWLtkf+rUI3EFJF3jeyDyXgBpnEXeCVu
         Je1YBGxaTJRDbeTsBbVOun+xNeH1HMeqinOjh0PIL5+IqSkV1H8d6y/8G3g64ARjkhOc
         P01A37usngGKNmDkVoWSerl3pLBKsR9C7A7rmfrC9t6dGnsI0b9DLkx0lnFZXhwlSZlX
         FzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FULRWRoy+gFirZw/mkbBQ8q4cmksOwfrZ4guTg9Tl+U=;
        b=cuuSwCL/M06Aro4gvE0xZNzmAc9xQjjmdlXJ3NQfVZs9ZHhD6CfIobh0mOJnSxKoZF
         KXtSTrrKIqmHwwXK2hoEdA6anQaGkDHmLQugfs2kIJ0mgekrD1lTX+v1z7+3diabOMN7
         0BnzaTDmk1RidqGdWQ+5bigK3lHU7bsRHhDt63YW+yR/xatXYqCJeldPe94V7/sM18Zc
         XX9nq7jU1q3z+pBkejnwA0ezdPFT+x/8ln8PkL+lMWkkSZ2cuRbsa5hCIaw6icRyOYja
         HiRpvp1hfzKu6IHa7fJJ6hqoEHTL+BynfZhEpXfFDi1zLsnO5viOjY+lxX+QG2beU1Ij
         +9VA==
X-Gm-Message-State: AOAM532SfQpQs91tv+/iBHBsEvzVHrAg0oFKpQvFwQX512mBp7KG/FBV
        zgIAVnk03dOKWDdak2BvaeYv8bv1m/Bw9ywq/aoHXg==
X-Google-Smtp-Source: ABdhPJynf5WOUxsBGg41X8Q4IxKp7op0CxQNUvHHG1TjyFF9SWSPhrPl3auMquoy9cL8gXK7A2UEISMfsGVCy9cAOqw=
X-Received: by 2002:a17:906:e011:: with SMTP id cu17mr21963ejb.244.1634743552270;
 Wed, 20 Oct 2021 08:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210929160439.6601-1-andrzej.p@collabora.com>
 <11847752.O9o76ZdvQC@kista> <CAAEAJfBYwbUrjUFvs70u8YkuBgrCK6LuYdT9Y2Om7OLo6_cV1g@mail.gmail.com>
 <4350097.LvFx2qVVIh@kista>
In-Reply-To: <4350097.LvFx2qVVIh@kista>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 20 Oct 2021 12:25:40 -0300
Message-ID: <CAAEAJfDkOUp_kzrR-eAUiwO4EGHcuQVpCxBJwJr5_pZZqr-xwg@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v7 11/11] media: hantro: Support NV12 on the G2 core
To:     =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 20 Oct 2021 at 12:04, Jernej =C5=A0krabec <jernej.skrabec@gmail.com=
> wrote:
>
> Dne sreda, 20. oktober 2021 ob 13:06:59 CEST je Ezequiel Garcia napisal(a=
):
> > Hi Jernej,
> >
> > On Tue, 19 Oct 2021 at 13:38, Jernej =C5=A0krabec <jernej.skrabec@gmail=
.com>
> wrote:
> > >
> > > Hi Andrzej!
> > >
> > > Dne petek, 15. oktober 2021 ob 19:19:47 CEST je Andrzej Pietrasiewicz
> > > napisal(a):
> > > > Hi Jernej,
> > > >
> > > > W dniu 14.10.2021 o 19:42, Jernej =C5=A0krabec pisze:
> > > > > Hi Andrzej!
> > > > >
> > > > > Dne sreda, 29. september 2021 ob 18:04:39 CEST je Andrzej
> Pietrasiewicz
> > > > > napisal(a):
> > > > >> The G2 decoder block produces NV12 4x4 tiled format (NV12_4L4).
> > > > >> Enable the G2 post-processor block, in order to produce regular =
NV12.
> > > > >>
> > > > >> The logic in hantro_postproc.c is leveraged to take care of
> allocating
> > > > >> the extra buffers and configure the post-processor, which is
> > > > >> significantly simpler than the one on the G1.
> > > > >
> > > > > Quick summary of discussion on LibreELEC Slack:
> > > > > When using NV12 format on Allwinner H6 variant of G2 (needs some
> driver
> > > > > changes), I get frames out of order. If I use native NV12 tiled
> format,
> > > frames
> > > > > are ordered correctly.
> > > > >
> > > > > Currently I'm not sure if this is issue with my changes or is thi=
s
> general
> > > > > issue.
> > > > >
> > > > > I would be grateful if anyone can test frame order with and witho=
ut
> > > > > postprocessing enabled on imx8. Take some dynamic video with a lo=
t of
> > > short
> > > > > scenes. It's pretty obvious when frames are out of order.
> > > > >
> > > >
> > > > I checked on imx8 and cannot observe any such artifacts.
> > >
> > > I finally found the issue. As you mentioned on Slack, register write =
order
> once
> > > already affected decoding. Well, it's the case again. I made hacky te=
st and
> > > moved postproc enable call after output buffers are set and it worked=
. So,
> this
> > > is actually core quirk which is obviously fixed in newer variants.
> > >
> >
> > Ugh, good catch.
> >
> > What happens if you move all the calls to HANTRO_PP_REG_WRITE_S
> > (HANTRO_PP_REG_WRITE does a relaxed write)?
> >
> > Or what happens if the HANTRO_PP_REG_WRITE(vpu, out_luma_base, dst_dma)
> > is moved to be done after all the other registers?
>
> Those two macros aren't used on G2. Andrzej introduced new postproc helpe=
rs
> for G2.
>

Ah, so the issue is specific on the G2 post-processor.

> This commit solves issue for H6:
> https://github.com/jernejsk/linux-1/commit/
> a783a977c0843bb4b555dc9d0b5d64915cd219e7
>

Right, but see this comment:

    /* Turn on pipeline mode. Must be done first. */
    HANTRO_PP_REG_WRITE_S(vpu, pipeline_en, 0x1);

I have vague recollection of why we have that comment,
but I'm reluctant to move post-proc enable to the end.
(or at least not do it on G1?).

> >
> > > This makes this series with minor adaptations completely working on H=
6. I
> see
> > > no reason not to merge whole series.
> > >
> >
> > Do you have plans to submit your H6 work on top of this?
>
> Of course, why would I work on this otherwise? :) But before I do that, I=
 have
> to clean up and split one commit, which adapts VP9 G2 code for H6 variant=
.
>

OK, sounds good.

> If you're interested in changes, take a look here:
> https://github.com/jernejsk/linux-1/commits/vp9
>

Will take a look.

Thanks,
Ezequiel
