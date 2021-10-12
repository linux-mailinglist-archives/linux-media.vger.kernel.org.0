Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE7A42A91A
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 18:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhJLQKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 12:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhJLQKx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 12:10:53 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DEAC061570;
        Tue, 12 Oct 2021 09:08:51 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e3so34819282wrc.11;
        Tue, 12 Oct 2021 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8iTn6JCetRXd4IT612o9kFxWnkw0z7CnatM7cjVZeCw=;
        b=VWmxe1rkc0SyCEnv6WESlmQl4KwCG/9Ve7fPdhu0kMByCPv7NAVfpPamI9IdcNWGMT
         ipqW8UYh6yzkpwjgWmFIya7VXL40v0YXl/CVJTtXq25v5eL8NskoVzx8n3zI1mBrNgkD
         CqXrB4oTKkvdg015w7SMxcYVe+XWQsrsiB4e9BEIiSJRyHVHE50BeTMjE9CoF9MnT5lS
         3npz7WEyxAoh9Zj7CXKMfE7OBfFH+gGK0uzMMfZJ+LmFBZKZ1WMk2jR76EuP/NwtGsAO
         7BCoyBjbvjdP42PjEkXl3GM20zpH/sJ0RaPwh87anEucKurtIuoE2RwquwoYKRVbh8WC
         nKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8iTn6JCetRXd4IT612o9kFxWnkw0z7CnatM7cjVZeCw=;
        b=JX+c7E+Oq8393Svsp4WBwzCKosGjfm4R4atN+/DlHSjbHx2ctyihGZvU1iEdCcAJP5
         DQe+QXWMVTLDDeijudESh/YjGQyqWFhG08b6RRNOsctUlWPmzFfvkM2f5fC7+HpxOXpt
         agzaEbBaUetVlkCZ3WCmV4T2iQhh54ddvlOul77MIyhixnnhNx5D0IR9eR0j1hviny0i
         /CsnirpQBK3DUQJHhAeRCHye0Ad/udLJySzB0r+HmtjeKLGLkrzxgBvAWiJPbzBMG2zQ
         2lvh9pEIarCUyhnALiSz03wx/P1SNSf1q6+KJ+35d7eIu6BGcifI0FhOQg2+TAJ5MeQN
         6r0w==
X-Gm-Message-State: AOAM530XyUYXLOtwi9NZ6uDXgp5rL3qzGluLuH2amwkgNN8+WldOj2iQ
        gg2EgV+uL3avK7xvq+LVArs=
X-Google-Smtp-Source: ABdhPJyCW/aSSXgGlpCvgSSH1yQrJXNiVnC7SeluZxb7rKiMZjvpzOnH5ye7V3mz1ZiHn4cmsLywnw==
X-Received: by 2002:adf:979a:: with SMTP id s26mr33782239wrb.2.1634054930069;
        Tue, 12 Oct 2021 09:08:50 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id s186sm3172217wme.14.2021.10.12.09.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 09:08:49 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        hverkuil-cisco@xs4all.nl, jc@kynesim.co.uk,
        ezequiel@vanguardiasur.com.ar,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH v2 0/4] media: HEVC: RPS clean up
Date:   Tue, 12 Oct 2021 18:08:48 +0200
Message-ID: <1705005.VLH7GnMWUR@kista>
In-Reply-To: <3c5851ac-3b8a-decc-93c1-01a65b1f8611@collabora.com>
References: <20211012143552.661751-1-benjamin.gaignard@collabora.com> <21222555.EfDdHjke4D@kista> <3c5851ac-3b8a-decc-93c1-01a65b1f8611@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CC: Alex Bee

Alex, please take a look to these patches too.

Dne torek, 12. oktober 2021 ob 17:57:50 CEST je Benjamin Gaignard napisal(a=
):
>=20
> Le 12/10/2021 =C3=A0 17:34, Jernej =C5=A0krabec a =C3=A9crit :
> > Hi Benjamin!
> >
> > Dne torek, 12. oktober 2021 ob 16:35:48 CEST je Benjamin Gaignard=20
napisal(a):
> >> This series aims to clean up Reference Picture Set usage and flags.
> >>
> >> Long term flag was named with RPS prefix while it is not used for RPS
> >> but for mark long term references in DBP. Remane it and remove the two
> >> other useless RPS flags.
> >>
> >> Clarify documentation about RPS lists content and make sure that Hantro
> >> driver use them correctly (i.e without look up in DBP).
> >>
> >> These patches are the last in my backlog impacting HEVC uAPI.
> >>  From my point of view, once they get merged, you could start talking
> >> about how move HEVC uAPI to stable.
> > With your changes, HEVC uAPI controls still won't be complete. Cedrus=20
needs
> > entry point control, which in turn needs dynamic array support. I'm a b=
it=20
lazy
> > implementing that control, but I guess I can take a look in a month or =
so.
> > rkvdec also needs more fields for HEVC. With patches collected here:
> > https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockchip/
> > patches/linux/default/linux-2001-v4l-wip-rkvdec-hevc.patch
> > fluster HEVC test score is reportedly 121/135 (8-bit tests only).
>=20
> Hi Jernej,
>=20
> Thanks for your feedback, getting a list of missing items in HEVC uAPI
> will definitively help to fill the hope.
> The patch you mention for rkvdec are already merged in mainline kernel (at
> least for uAPI part).

Are they? What about:
video_parameter_set_id
seq_parameter_set_id
pic_parameter_set_id
short_term_ref_pic_set_size
long_term_ref_pic_set_size

At least I don't see them in linux-next. Maybe that information can be=20
obtained in some other way?

> Cedrus needs are about num_entry_point_offsets, offset_len_minus1 and=20
entry_point_offset_minus1[ i ]
> in HEVC specifications ?

Yes, Cedrus needs to know whole list of entry points. I don't think we need=
 to=20
worry about offset_len_minus1, list could be pre-processed - just number of=
=20
entry points and their values.

Best regards,
Jernej

>=20
> Regards,
> Benjamin
>=20
> >
> > I would certainly wait with moving HEVC uAPI to stable.
> >
> > Best regards,
> > Jernej
> >
> >> version 2:
> >> - change DPB field name from rps to flags
> >>
> >> Please note that the only purpose of commits 3 and 4 is to allow to te=
st
> >> G2 hardware block for IMX8MQ until a proper solution isuing power doma=
in
> >> can be found. Do not merge them.
> >>
> >> GStreamer HEVC plugin merge request can be found here:
> >> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/10=
79
> >>
> >> With those piece of code fluster score is 77/147.
> >>
> >> Benjamin
> >>
> >> Benjamin Gaignard (4):
> >>    media: hevc: Remove RPS named flags
> >>    media: hevc: Embedded indexes in RPS
> >>    media: hantro: Use syscon instead of 'ctrl' register
> >>    arm64: dts: imx8mq: Add node to G2 hardware
> >>
> >>   .../media/v4l/ext-ctrls-codec.rst             | 14 +++---
> >>   arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 43 +++++++++++++----
> >>   drivers/staging/media/hantro/hantro.h         |  5 +-
> >>   .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++--------
> >>   drivers/staging/media/hantro/imx8m_vpu_hw.c   | 48 ++++++++++++-----=
=2D-
> >>   .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
> >>   include/media/hevc-ctrls.h                    |  6 +--
> >>   7 files changed, 84 insertions(+), 61 deletions(-)
> >>
> >> --=20
> >> 2.30.2
> >>
> >>
> >
>=20


