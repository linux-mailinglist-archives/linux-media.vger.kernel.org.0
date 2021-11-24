Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D575845B68E
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 09:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239950AbhKXIed (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 03:34:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbhKXIed (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 03:34:33 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F420BC061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 00:31:23 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d11so3767812ljg.8
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 00:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=9QzHPaMf6KRbXd4c4t+AUDzNgI46GuaQ0qVzcfg+5ak=;
        b=cfNoIAgdjr2vuzJy8dzIduVLUI9dJ/3A+l5rtJuEmnugIh8sVvIx5c5SsHz+7FzwmK
         j0yF6XmIUI3gZ1BwCOOSQ/F7q2N+jFhC5btuUX7S58GnRIaayKM3O0q0CFh+4fkG/y9r
         cdIZdvmeHbaiMfXCOH/QrGNmbdkVllBcGAFfDdKxkjqg6G3DOQXrhtWCs4knuCQqpD2D
         jTYjYA374KGb45KmFf1B/TrAuj2ouyyaYK/dZK6S1yoeFcYz8fEVHKLm/bHrssUrgaV0
         6SB9CH80vw4vYoU6FBfWbsiYfVNbwt52McsxE3SxTb/kff2sjYUpxE4aD4asi2kKW+u2
         B4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=9QzHPaMf6KRbXd4c4t+AUDzNgI46GuaQ0qVzcfg+5ak=;
        b=ZOi5iZ6QxjPRIm5LST7AtV/yhBfYdZI8xfUQYwosILozJ1j79DbMTedKCbPTYa5sU8
         FxgIV/yvgA5JEvypGzyGWX6DP3uS6Kx3pn60lVU39T6ERy4dGxASabMVmo96Xu/tZQ5V
         P7NpwKlbFLlYWz+voeNzLRvg5ZfcAbu45W5B6dANttyn9g0wlldM0voHb0cbnS+Gq+lE
         5T49XGwNzdqevdZZdLnjYz5QsoogQ8ZV6ccM0ybtb78FrDIDToATDt8EHXW3j/YwMdXv
         ++1ChpRYLoU1Yeb+vqeH83px0NwRwlK+78Te0jr+i+ddGDlGBy8fgaorYIkY61CSddRX
         SLfA==
X-Gm-Message-State: AOAM533pi4kwBz7WUD5BHJbZP+E9PRxQZkyAQcrsZl2JT448tIyQGT/X
        gnofC3QeJIpc8eqvDeJ5Vh4=
X-Google-Smtp-Source: ABdhPJzsbO9NE/psN99YQpJyAjFRLxK170wOebG+qscF4lV2V/VYDhaYpcE4koPHwUuAX0tl8DwncQ==
X-Received: by 2002:a2e:b01a:: with SMTP id y26mr12707319ljk.317.1637742682147;
        Wed, 24 Nov 2021 00:31:22 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id bq39sm1542589lfb.262.2021.11.24.00.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:31:21 -0800 (PST)
Date:   Wed, 24 Nov 2021 10:31:11 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc:     sumit.semwal@linaro.org, daniel@ffwll.ch,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Subject: Re: completely rework the dma_resv semantic
Message-ID: <20211124103111.17b08d79@eldfell>
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DfNwimGh+=2lwPx.jwlLdcA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/DfNwimGh+=2lwPx.jwlLdcA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Nov 2021 15:20:45 +0100
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> Hi guys,
>=20
> as discussed before this set of patches completely rework the dma_resv se=
mantic
> and spreads the new handling over all the existing drivers and users.
>=20
> First of all this drops the DAG approach because it requires that every s=
ingle
> driver implements those relatively complicated rules correctly and any
> violation of that immediately leads to either corruption of freed memory =
or
> even more severe security problems.
>=20
> Instead we just keep all fences around all the time until they are signal=
ed.
> Only fences with the same context are assumed to be signaled in the corre=
ct
> order since this is exercised elsewhere as well. Replacing fences is now =
only
> supported for hardware mechanism like VM page table updates where the har=
dware
> can guarantee that the resource can't be accessed any more.
>=20
> Then the concept of a single exclusive fence and multiple shared fences is
> dropped as well.
>=20
> Instead the dma_resv object is now just a container for dma_fence objects=
 where
> each fence has associated usage flags. Those use flags describe how the
> operation represented by the dma_fence object is using the resource prote=
cted
> by the dma_resv object. This allows us to add multiple fences for each us=
age
> type.
>=20
> Additionally to the existing WRITE/READ usages this patch set also adds t=
he new
> KERNEL and OTHER usages. The KERNEL usages is used in cases where the ker=
nel
> needs to do some operation with the resource protected by the dma_resv ob=
ject,
> like copies or clears. Those are mandatory to wait for when dynamic memory
> management is used.
>=20
> The OTHER usage is for cases where we don't want that the operation repre=
sented
> by the dma_fence object participate in any implicit sync but needs to be
> respected by the kernel memory management. Examples for those are VM page=
 table
> updates and preemption fences.

Hi,

reading just the cover letter I wonder if KERNEL and OTHER could have
better names based on what you describe how they are used. WRITE and
READ immediately give an idea of semantics, KERNEL and OTHER not so
much.

Some suggestions coming to my mind:

KERNEL -> PREPARE or INITIALIZE or SANITIZE
OTHER -> BOOKKEEP


Thanks,
pq

> While doing this the new implementation cleans up existing workarounds al=
l over
> the place, but especially amdgpu and TTM. Surprisingly I also found two u=
se
> cases for the KERNEL/OTHER usage in i915 and Nouveau, those might need mo=
re
> thoughts.
>=20
> In general the existing functionality should been preserved, the only dow=
nside
> is that we now always need to reserve a slot before adding a fence. The n=
ewly
> added call to the reservation function can probably use some more cleanup.
>=20
> TODOs: Testing, testing, testing, doublechecking the newly added
> kerneldoc for any typos.
>=20
> Please review and/or comment,
> Christian.
>=20
>=20


--Sig_/DfNwimGh+=2lwPx.jwlLdcA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGd+E8ACgkQI1/ltBGq
qqd7pw/8CgOq2ENKfC/ISZ8VHDti6Qp+DlYeGrcP6oXRHnjLi9hTbKCh9AsYb6QB
kj4PdiR0eE50ArXYYoQcd30jbHkNAitnZH4sv9i4r7b+bxlXivaEL3aha43FFh7b
UrI68GIqc1JhY+w4cNaml9yBx3rlsjihc51xU2t4rcDTaflKPAJ4HU0MriIJOfeh
fW/OKP7D5dvnL5m6G3H9YIb5tTIRMjbYhYSASijXdAsHjhvMYnjzBQoMwDrk5x39
3ry1tw1domo4tMsTTrPrbKk4IrsqHqnIeefdRYdMQxqaVwmj8SBVc74KEHtawxIn
o+w52KBsB1S+17PDA2s19q7cjqAd7aF9mehza2PrTZ2EI7WOrrlACQAqKOx3JUkU
s/tlhds9woDzJrc6DEoart8Zqc7vHSPPZZQT9BN3gq3mQneIP3XzydOFrmgSUGsX
EeN89o3VU0ykvyV+1jCtsLyF295G65GtdahjUlF00iiOTBW7g5pSD3AcAFqk5MgC
gbZDQTcXC1nxtZzg5O5I4EDP7VwklVYjZaAfs3lxEFOwU02k2n+fCYeFuoVBh3vR
NcrgN60mqTzkBHlMRZ4WirssrBood9F6Ond5ZQ9xnxoq/fu9YS3cR8SJNUwKG4n3
c+XO0i7elp/TpW/b5+J4tobIq3z7SqGVp/aYlsH8JGwhSXULsXI=
=oYTH
-----END PGP SIGNATURE-----

--Sig_/DfNwimGh+=2lwPx.jwlLdcA--
