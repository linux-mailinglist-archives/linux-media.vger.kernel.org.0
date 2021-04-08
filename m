Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B12F358677
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 16:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhDHONa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 10:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbhDHON3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 10:13:29 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2C2C061760
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 07:13:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b4so4277279lfi.6
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=TTAheYFkvz4xaRUgxArJIxX9gF5vJl8p5ZSt40/QpZ0=;
        b=GVwhx8igUUZ/wt5WgHzBQequvJM6XesCG49OkkgcwJzk4dLkDYrYXweLegC7NO4ZLy
         9ziHpSrFFxImQ5Xmz3XR/Hg8LWH+UqDYmW24/FmIYLre5RPct8Y7O2ZVvPvZDREgFkcJ
         qyKRR0VmZJkj7Q6a7MCTt8EFc8Xf8J2iqJwlXCLBnCr7HRvYO1vV06KBwnOSOcuG/6iC
         a4kCLZNLba6HwAbd80fPmCQVPtHbQ5j9PsZhEA95fE190gx97OEAOC1lJOXdbqE9WTXU
         l5udsBOyBlBrUkkLgLM8LDHB5JpNYOL2CJTSHRfcl34JkzuRn83FT93WrXwU024VS0sA
         eV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=TTAheYFkvz4xaRUgxArJIxX9gF5vJl8p5ZSt40/QpZ0=;
        b=KNAN9C3sTsW1VzTOqDmFSarIbMGJtC9puDJZm1z6arkz8Ne7c5GL2Txj3RYAtIFvAV
         9hGipDO3WqKcna9rbBus7PoWHqnK+xSiQSJ1wLuvCu8jz2sOhpYBPQ+MvxvkHLyhA6YB
         ViuYuv09VrjGa2tL/LtZMAxEAmrS3ZPeh6ppiZB9gXuaJ9Pn/VhklsXhgQbObmFfJnqj
         X5cd9dJuF6cm1uR3jNPwlBCo1Fc00Krz2chm9LL9Kab3xjCWDp+9m7Rs/pQaEUQQwpsl
         fJqK4SOlFu/kPM2TgyaxHLgnQtyE7dbGX0asV6zN2HwC1rpfbbL0ba1FH0nD2SqbZx0d
         95TA==
X-Gm-Message-State: AOAM533uas7//rIZNhx0cvuR0TEXSG0msvLx72ZSlKf7j5fu7bF9vem1
        S70zyo0e4X516njvsp7Q0lU=
X-Google-Smtp-Source: ABdhPJwIaI6Yu4gSvrOV74h14X89tnY7tiKGx1w4insUvEDPhTa2XvRmh2nwlHA2+q8t4a8jrE+TZA==
X-Received: by 2002:a05:6512:3e17:: with SMTP id i23mr6687392lfv.26.1617891196904;
        Thu, 08 Apr 2021 07:13:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id m3sm2924641lfo.190.2021.04.08.07.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 07:13:15 -0700 (PDT)
Date:   Thu, 8 Apr 2021 17:13:11 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
        wayland-devel@lists.freedesktop.org, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org
Subject: Re: Call for an EDID parsing library
Message-ID: <20210408171311.61f433bd@eldfell>
In-Reply-To: <87r1jkj37y.fsf@intel.com>
References: <20210407114404.13b41822@eldfell>
        <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl>
        <87mtuajshc.fsf@intel.com>
        <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl>
        <87r1jkj37y.fsf@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=vWgvOjA1xlCScNen0Sc=DR"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/=vWgvOjA1xlCScNen0Sc=DR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Apr 2021 16:49:37 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> Anyway, this is only tangentially related to the library. I just think
> we need to take DisplayID better into account also in the *users* of the
> library, as they shouldn't really even look at the EDID if the plain
> DisplayID is there, per E-DDC 1.3 section 3.1.

That makes me wonder what the kernel DRM uAPI for getting a DisplayID
block into userspace would be. A new read-only KMS connector property?

Which means userspace (e.g. Weston) needs to know to read the new
property. If it does that, then it already knows that it should favour
DisplayID over EDID, and there is little the library could do to help
with that.

Unless you think the library should be making DRM ioctls, which doesn't
sound good to me.


Thanks,
pq

--Sig_/=vWgvOjA1xlCScNen0Sc=DR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBvD3cACgkQI1/ltBGq
qqd6Vw//WhzcNLTaOhUP/5Bujl/doTgEFKLDaFbcs9SXSYOhkBOfKxf7k64x/nLL
mGKj4dPGiymkR4Bh2JrZNa3m0VD/SSDCnI7EJXZMYSlzQpxx0WYCdaZDOhA6C8Oh
/MC63OwFa8jnwmCFwDQzgwQsOKaxGT2nOshSmVrDNy04hfeR1a75+A0iCCkrtgxc
2f0R87HC75+wELTy2/bWeTFaLj9KvhHrW2X7K3ZiTupY2b64uwRa7RuVbQlBqq0r
zQoh2NIVfz/gL+1nbXr8pwWic5a36txVOJA6YEN0C3v+JhkY9sPPpp7ScFvIOosB
hxuA5rAU7T6merF6ZPt7FcmnygPEWrP/zAH2P7+5/KnmtGac+fHQFbzldWn2pAsD
hLvaU6THzXJnDaJJs/ztlIIAs9vsBesPlx4lj3PJ2RYnrQJQ/8qKW3ff6gbtpRWq
Rpla9I6VJMagXiGpp0h/WuDBcOBCUP3479mDtb5RaSRpWLr1jfxA2YDdmS9IOjFF
qJC4n6gN5g6UQrMjOixSIt1M2WV94mftmzkm7kHA3pEAaBF/JqHlnHtXQidr9Rv4
ePgNwcam41750+hB8rv0ZPv2hrp57GPg92YMV/GPmZC76sHzd+5Sm7Jast7YLHe7
t1vHlamNe5u81Tf4U4vEqG+uN54tJGq0+AqTp2BUjB5whluhsLc=
=LkAa
-----END PGP SIGNATURE-----

--Sig_/=vWgvOjA1xlCScNen0Sc=DR--
