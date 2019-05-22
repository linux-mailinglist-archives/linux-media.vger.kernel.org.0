Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D81269F7
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 20:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfEVSiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 14:38:01 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:35747 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbfEVSiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 14:38:01 -0400
Received: by mail-qt1-f182.google.com with SMTP id a39so3652916qtk.2
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 11:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=NO5n07S5gWTzQQmMCm0q2dmz/QMidMic1tFNoB6hbzY=;
        b=HJmfr+XOFMk0bNzbYwogfjew/VRkZqTFr3UVH4ujbtl1u5e9UT9ww1LBZRa2LZ7pNn
         sU+WRJidc7xOsfUcLDG3G9J+wF4U6+JKcfuXvX96/f3RsFzU0yDWLImqaJiNVpKP7Vc0
         A8C8uDAa+wXwwNldUsqKSKLx36rSVS3jWW+/sxxP4zLl648Hln+HNPejSIoUyScXqUuy
         rijBykmV3oFoWIL56L1VMHo1BQCsTX/4SgDPbepk2ns3QNHO2Oxsqnuusra20bQcnfkX
         e2re89jLkMkdNDpj9eaglvyMpDPwExXVcRdT7IoMl31+uu40SxMsv7i3JOrWiG0Ti9Cz
         MbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=NO5n07S5gWTzQQmMCm0q2dmz/QMidMic1tFNoB6hbzY=;
        b=ao79hmyR4IJmap1+JEPtwnAYaTLRSIZO4JfmRindvxPpNhrXBkHWo7GLsyvV+ubfHU
         xjcVFY9FhNCIoHGCWbw/79fFLi8C1X9NNRjMWNGaEfaMYZ4/YyEp10XpfksNIHRXa0wF
         KVjKOXNaejnwXrMyskPW+wWaAoN4A015IkHI9eCPP4Ui8OL2civf19upEPKMmPFWjLvo
         jHW77yiz4qJ7jMuzqWAMJhv32gCVTCqvM0YSx7rowDuXBNk1KVdKUTJ9ft95ontFG7jo
         lt32Di72ubT3b8k22RX5pNjpO1058cOKhXtLV114poq0E9cWSXzK5QdKi9SdBT82jvUp
         1hiw==
X-Gm-Message-State: APjAAAW9gBr8tqMU8n329d2KHet96pcRblgiy6/543CR7BAfcUSm29fr
        u8nT/KRumVyBlRcB9fO59CU7pw==
X-Google-Smtp-Source: APXvYqwG4TS47sKGWMRDx6n9TUsWDZvzv/cLxJf51mwvSWU4HE4ZPZy0ieQkCVL6HB9Gw4RO3OHUPQ==
X-Received: by 2002:a0c:b89a:: with SMTP id y26mr28461256qvf.47.1558550280583;
        Wed, 22 May 2019 11:38:00 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id d127sm12865011qkf.8.2019.05.22.11.37.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 11:37:59 -0700 (PDT)
Message-ID: <a72bb969d2a7dc423d603c95744212df2714b1df.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Wed, 22 May 2019 14:37:57 -0400
In-Reply-To: <20190522100825.GC30938@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <20190521154358.GC7098@ulmo>
         <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
         <20190522100825.GC30938@ulmo>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-b7mtqJZwW0vyVQ9iFnMm"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-b7mtqJZwW0vyVQ9iFnMm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 mai 2019 =C3=A0 12:08 +0200, Thierry Reding a =C3=A9crit :
> >   3. Does the HW do support single interrupt per frame (RK3288 as an ex=
ample does not, but RK3399 do)
>=20
> Yeah, we definitely do get a single interrupt at the end of a frame, or
> when an error occurs. Looking a bit at the register documentation it
> looks like this can be more fine-grained. We can for example get an
> interrupt at the end of a slice or a row of macro blocks.

This last one is really fancy. I've been working on some HW where they
do synchronization between decoder and encoder so they process data
with one macro-block distance. I know chips&media have similar feature,
and now Tegra, would be nice to find some convergence on this in the
future.

--=-b7mtqJZwW0vyVQ9iFnMm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXOWXBQAKCRBxUwItrAao
HHNaAJ99qzfoO7Zstd7WIpcehDN1p3dC3QCfQBxGWa7W0y1dcRcgT5qld1QivxM=
=l2hk
-----END PGP SIGNATURE-----

--=-b7mtqJZwW0vyVQ9iFnMm--

