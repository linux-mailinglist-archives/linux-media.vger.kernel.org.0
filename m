Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8FA3D9F70
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 10:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234928AbhG2IYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 04:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbhG2IYO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 04:24:14 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3C6C0613C1;
        Thu, 29 Jul 2021 01:24:11 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id r17so9481918lfe.2;
        Thu, 29 Jul 2021 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=G+Xz0QEq5wz3RNVVo8FtNDcy65lKifkkcvU9k8GjVG8=;
        b=XdBbKBZqGy0FNSyHcp2Kg1khC3/H0yjS2T7iFC6ayZsW2nRlpIalCvFyocQmrmZO3t
         vSGsJbjPgC1f82y/m10k/Az93WquoJqxx3vg1Dj+15xw/5KKoUMCnpjtMI7HOSjv6yZa
         xeZescss1HHCxuM8lzVpuLD6TYnt/fxcT674IDVuURJTdEtEJuAyod56+cqZdrVVSK9O
         S8OKiAyUpgW3umuo5N+RGL9tWnLbeVtwgriUfZ7gwcmyyTzLyHCpCO5Wv0Azz1timtg+
         i3h5KDslFMfADob7YU1FAbcjQd9uQmvLBKsHXkYLDQ/+Xh38fz6mtcBQ2wt7EWUlwu/P
         GgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=G+Xz0QEq5wz3RNVVo8FtNDcy65lKifkkcvU9k8GjVG8=;
        b=oklE5xUM9oxTtrg1TYN26kK6vyWwhsVTGHxTw9sOGNJORGjAUYEMuIoHFCILW7ArUv
         rmKXiNnYJBafm0kEBO+V6MjFB9vDFWyO9wfdx/ZVDJ5GlcLqCfNLsa87SQXqyWfFkl2F
         n3RDpPKN8N5LtpxbSGdppbh4nKtJ+GUpmYguBF3z+MbnLJGmR/HfGUwGDzYroZlgXqcv
         OQdyz9HhtYUFSgy8iHPYPXTyjpeiPk2v0YYKxPJz2ot4YkI0svOaI4ZJz9PJHp/Sf8N0
         FswrDQbKeba5FEQftRw5Rh59VXgL2MInBrhBQas/Qq9hu4xV2h49ooH8LsWFNzEAnEge
         eaCA==
X-Gm-Message-State: AOAM530ikoT1lWJ2piU5Iw+BnSmzYD/DosZ94OoRAEDWy/2NkFMTnzkO
        l1s9Zwgl/jjVUvKcONom+dI=
X-Google-Smtp-Source: ABdhPJx3zQbUfVolfZXuorgwsMKZOlsC0XNccvgtZrhv2E6/ERdQqfPhXntVtLalwdv4tEmmeQr6Aw==
X-Received: by 2002:a19:fc13:: with SMTP id a19mr2996482lfi.581.1627547049434;
        Thu, 29 Jul 2021 01:24:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id h12sm108258ljq.41.2021.07.29.01.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 01:24:09 -0700 (PDT)
Date:   Thu, 29 Jul 2021 11:23:58 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
        Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Matthew Brost <matthew.brost@intel.com>,
        Jack Zhang <Jack.Zhang1@amd.com>,
        Gustavo Padovan <gustavo@padovan.org>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
Message-ID: <20210729112358.237651ff@eldfell>
In-Reply-To: <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
        <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
        <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
        <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
        <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
        <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
        <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
        <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
        <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
        <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
        <20210728165700.38c39cf8@eldfell>
        <74e310fa-e544-889f-2389-5abe06f80eb8@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XsIW6p7OIJaoYdmP1AsQtia";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/XsIW6p7OIJaoYdmP1AsQtia
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Jul 2021 16:30:13 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 28.07.21 um 15:57 schrieb Pekka Paalanen:
> > On Wed, 28 Jul 2021 15:31:41 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> > =20
> >> Am 28.07.21 um 15:24 schrieb Michel D=C3=A4nzer: =20
> >>> On 2021-07-28 3:13 p.m., Christian K=C3=B6nig wrote: =20
> >>>> Am 28.07.21 um 15:08 schrieb Michel D=C3=A4nzer: =20
> >>>>> On 2021-07-28 1:36 p.m., Christian K=C3=B6nig wrote: =20
> >>>>>> At least AMD hardware is already capable of flipping frames on GPU=
 events like finishing rendering (or uploading etc).
> >>>>>>
> >>>>>> By waiting in userspace on the CPU before send the frame to the ha=
rdware you are completely killing of such features.
> >>>>>>
> >>>>>> For composing use cases that makes sense, but certainly not for fu=
ll screen applications as far as I can see. =20
> >>>>> Even for fullscreen, the current KMS API only allows queuing a sing=
le page flip per CRTC, with no way to cancel or otherwise modify it. Theref=
ore, a Wayland compositor has to set a deadline for the next refresh cycle,=
 and when the deadline passes, it has to select the best buffer available f=
or the fullscreen surface. To make sure the flip will not miss the next ref=
resh cycle, the compositor has to pick an idle buffer. If it picks a non-id=
le buffer, and the pending rendering does not finish in time for vertical b=
lank, the flip will be delayed by at least one refresh cycle, which results=
 in visible stuttering.
> >>>>>
> >>>>> (Until the deadline passes, the Wayland compositor can't even know =
if a previously fullscreen surface will still be fullscreen for the next re=
fresh cycle) =20
> >>>> Well then let's extend the KMS API instead of hacking together worka=
rounds in userspace. =20
> >>> That's indeed a possible solution for the fullscreen / direct scanout=
 case.
> >>>
> >>> Not for the general compositing case though, since a compositor does =
not want to composite multiple output frames per display refresh cycle, so =
it has to make sure the one frame hits the target. =20
> >> Yeah, that's true as well.
> >>
> >> At least as long as nobody invents a mechanism to do this decision on
> >> the GPU instead. =20
> > That would mean putting the whole window manager into the GPU. =20
>=20
> Not really. You only need to decide if you want to use the new backing=20
> store or the old one based on if the new surface is ready or not.

Except that a window content update in Wayland must be synchronised with
all the possible and arbitrary other window system state changes, that
will affect how and where other windows will get drawn *this frame*,
how input events are routed, and more.

But, if the window manager made sure that *only* window contents are
about to change and *all* other state remains as it was, then it would
be possible to let the GPU decide which frame it uses. As long as it
also tells back which one it actually did, so that presentation
feedback etc. can trigger the right Wayland events.

Wayland has "atomic commits" to windows, and arbitrary protocol
extensions can add arbitrary state to be tracked with it. A bit like KMS
properties. Even atomic commits affecting multiple windows together are
a thing, and they must be latched either all or none.

So it's quite a lot of work to determine if one can allow the GPU to
choose the buffer it will texture from, or not.


Thanks,
pq

--Sig_/XsIW6p7OIJaoYdmP1AsQtia
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmECZZ4ACgkQI1/ltBGq
qqcYAg/+I51pd08BkpzGZ3k1g+HCC0qRSxehPuUveE/WiCkVFRrOpVC3zOCw5G4j
c9BNZrbq+DptCDFizpnWcGCCycIcRKU7T9DEbTHOBD4NWCBrvbyGxcmT9SrrVzJy
+T7B302KWoGFMlnRTGWfPgQveHTLKwJCPIwVp1hq0hNKIBGJpY38aULKFlYVSC3c
ucgjtrWlgAI6uCzjbasSER4zMHUlE4XYfALX1xC+eBl7ZVVueThqS0u9VjghCGCT
1xqp/Id8932CoXyHs7fXSWXL2zgA6uVcK1yhw+jFOZtSEM7qmMbQAWiExYvv1A6V
WHx2JUJGLkNdVBRu2ZLmqtRDzj0PMCkXxwYtQ6y2T8xgwwSYET+wGFp9P4r48P4p
4ApoJ5ZZlTZmsdUcnME2aCEf7tlGE79B/jRqahBYDjlrL9KO8velYga7baODmnXy
bSfO1MQZ/sdY1jQFj8Dhnj23bX2OIlbphG2Dn1ZZfbmp3Ccq7w9OvcZDDBbA09SO
t5McCGkFF4qUGgitDp/T97knMUdB78INcDYwgdf54Zb2IKhVHKSfmrcDL+qtZnlK
W3yVGJf/ON+Eik1PppyZuUChTP8b6iyebEWjr7W4AIurRVRoHT8gE44b7IO80J05
VBgRew3Zpcy5em1zCmpOcfyo0Qi2ggmRvK3l4tRgNPnSg3RB4TY=
=dE6O
-----END PGP SIGNATURE-----

--Sig_/XsIW6p7OIJaoYdmP1AsQtia--
