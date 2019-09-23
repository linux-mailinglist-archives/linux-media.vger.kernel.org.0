Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0E8BB712
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 16:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438368AbfIWOsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 10:48:16 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]:39381 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438125AbfIWOsQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 10:48:16 -0400
Received: by mail-qt1-f170.google.com with SMTP id n7so17462786qtb.6
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=Kylj60szb3/RZwvHy7gX9osGVi8dC2HrIGXRepi31F8=;
        b=qBKRdnot9kH0qDhDfP/q0VhTVNzjRBamz7OSWW1JPiPN6mhfE1bSM9OOMB7yefaVJ9
         Vq5urxHH3gRObwuu8p/38FebrIYTF00fCqo+gKNRKumxjGAMRG+AB/VIqqL6AkEKTZIJ
         HBfo8rPWBELJbwPHoY+UzGUfFdUTydJcb9aCdWRqiI43w80OrII5wcKKep/tAthunhvj
         MheD0TttPO8VYP6Walco+PlTobPSPBYdJpAWYoxoX8dehR7VVfC1To+dPW8A/0ezncwg
         Gy/pxMFOjL8kUkfurGBNEV5nKgXoDX0THjNLtfAgXobf8zY5M2DpcZLoiBS24YSsiCgc
         2CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=Kylj60szb3/RZwvHy7gX9osGVi8dC2HrIGXRepi31F8=;
        b=kYDkvbqlKwsY/xzhkHR0T1/gxSgqsGCTdlXae4cFSPv+euXX7TSWCRLmpVuWfOWtR3
         7vIXBFp6sB9Gdy0FpxhSZjWHHI4U+Y1MPHMU2AuIZi42LKisZv6ioobTl8J/2ziVuh8u
         OLM0cpVtEzXtwmAwl+Kld1puGT75U0DHq9ep55SrsJI/hpTAeyMOUg6UpdN09f3GzK3l
         FR8M/6zSYY5DNOFlnkjijUWcNT+5Q8WX/EM9o0OCmoGvdwYu3ikHLFhqgqC8uFK1/k5o
         UuAoe1DTPsywK3VzE8ssU00JXN06i9uyySMovsB5fGir3tHxUET3k5JNbjKtRv97eCJ6
         7QTA==
X-Gm-Message-State: APjAAAV0vTQPZcztbw+9z+L0UVKiNXpiefhD6749hCsV7NbS67e6Lr4b
        RFS8Ivc5Figai4MDbDGcydQdAA==
X-Google-Smtp-Source: APXvYqw78bPXANU6MRJd2+X/EF0e3owLX3c71kFE1CVQrH1CDz+evDHhj/qGJQzRIAAiBPWToM5wbQ==
X-Received: by 2002:ac8:2e31:: with SMTP id r46mr252098qta.293.1569250095618;
        Mon, 23 Sep 2019 07:48:15 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id c201sm5286587qke.128.2019.09.23.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 07:48:14 -0700 (PDT)
Message-ID: <04f448f9f1b566d9fcc07490bcaf20c78153e84d.camel@ndufresne.ca>
Subject: Re: [ANN] Media sessions in Lyon in October: future V4L2 work
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Date:   Mon, 23 Sep 2019 10:48:12 -0400
In-Reply-To: <bfeb78df-aaa5-a756-16d4-c874a7dd4645@xs4all.nl>
References: <bfeb78df-aaa5-a756-16d4-c874a7dd4645@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-pt1W2lARLxqI7i9411dX"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-pt1W2lARLxqI7i9411dX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 septembre 2019 =C3=A0 16:27 +0200, Hans Verkuil a =C3=A9crit :
> Hi all,
>=20
> Since we have three separate half-day sessions for different topics I dec=
ided
> to split the announcement for this in three emails as well, so these thin=
gs
> can be discussed in separate threads.
>=20
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
>=20
> The third session deals with future V4L2 API work and is on Wednesday aft=
ernoon
> from 14:00 to 18:00.
>=20
> Attendees for this session:
>=20
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Shuah Khan <skhan@linuxfoundation.org>
> Helen Koike <helen.koike@collabora.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se>
> Hans Verkuil <hverkuil@xs4all.nl>
>=20
> If I missed someone, or you are on the list but won't attend after all, t=
hen
> please let me know.

Same, let me know.

>=20
> As with the previous session: if you are 'just interested', then let me k=
now.
> If others want to join this session who actually need to be there, then I
> may have to drop some of the 'just interested' people. At this moment we'=
re
> at 14 devs, so that fits.
>=20
> Agenda:
>=20
> TBD
>=20
> We will at minimum discuss Boris' RFCv2 patch series:
>=20
> https://www.spinics.net/lists/linux-media/msg149221.html
>=20
> (I've asked if he can rebase this and post a v3)
>=20
> I will expand the agenda further in a week or so.
>=20
> Regards,
>=20
> 	Hans

--=-pt1W2lARLxqI7i9411dX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXYjbLQAKCRBxUwItrAao
HFuKAJ9aSZD+EYS/i0kbqLxCVrYeqxgkNgCeLQoeDOleqdbbQo1NsBd2Q/ZOa3o=
=qgb0
-----END PGP SIGNATURE-----

--=-pt1W2lARLxqI7i9411dX--

