Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D52EBB710
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 16:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439851AbfIWOrp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 10:47:45 -0400
Received: from mail-qt1-f177.google.com ([209.85.160.177]:36940 "EHLO
        mail-qt1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438206AbfIWOro (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 10:47:44 -0400
Received: by mail-qt1-f177.google.com with SMTP id d2so17477166qtr.4
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2019 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version;
        bh=uA2eC32ka8B4Nc+iq9JyTWyNbhuUqmkOBA/KlNuJPhs=;
        b=I0fKLBESnD0No0YlnSy4VPnFce/Ep9f7CpBf2ltoJUPeIelcqiLz2UJTV5xO8CC9iA
         y3yeFJqsdvCeZ0SfaD/KGEY3PW57OEuDHIHSAMrppHmPULdyjIoMG9wi/gR2QKjxIbaH
         bUC75GXGYXf2qIAt/5JOq+46ndviXgPzO70CNanZaeZzGgDlaFFUTqydSZsJAGRQmsRD
         +O6qaKiYrnwnxWzXndW3JC/RUKJLv7lNZ+HTEfPcy4TFDWeUywYHxCfJBHZrUhKIhx6s
         OQpjPBzBMvzSCFvuxco+FzhujP491pKe1dtP8VWmONpqvhrjOpgn7PutdHSnxszwDFw3
         NRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version;
        bh=uA2eC32ka8B4Nc+iq9JyTWyNbhuUqmkOBA/KlNuJPhs=;
        b=P2V2q9iM264eK0me9ALrBrgxTYGc24rPulLnuCmL2Gccm7lagETxKc75rNMoM6WrHx
         3BfPJotUWS0EtdXr9tXBpjR4hUKZbmZhKBkPkN/9h5OGr0xGEhjWQbklFDfMv4RrW1IA
         QJvdKUiWwLBOzsSFyiwgatuWQzXAYPqr8rNsW+GNBIgZOrs8vntF7SmK6/CwgY8lsNgv
         9iTH+3ODOvCHskkpVoXXl08CqqC8SkSgQX7AibMCZ68BbGnzhnQmhrdkMBSOwvnqbUAd
         x6xN/3ge5no+vWjY+cO8vDRHm8ccHYRZd7J1Rm8kgxggjRkHaNV3t+m/4fMode2G2lJJ
         dkzQ==
X-Gm-Message-State: APjAAAVguj0+8aMq/LIQQvDJW/1U37k/vhnlERooYNLeXBTDaQVI7IiE
        8t2m8HENnHQI1zHdn5RI5CJ7cA==
X-Google-Smtp-Source: APXvYqxf5tLvjrg4eHiM++5OLuCP0DE+1MC+jky1WRXL0tHVkDO0cOVfaY23/C+g2ViwqxUPyfjTSQ==
X-Received: by 2002:a0c:edb4:: with SMTP id h20mr24298462qvr.178.1569250063919;
        Mon, 23 Sep 2019 07:47:43 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id e5sm6445291qtk.35.2019.09.23.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 07:47:42 -0700 (PDT)
Message-ID: <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Date:   Mon, 23 Sep 2019 10:47:40 -0400
In-Reply-To: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-9lBVBlnkImQWuS7uHUer"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-9lBVBlnkImQWuS7uHUer
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 septembre 2019 =C3=A0 16:21 +0200, Hans Verkuil a =C3=A9crit :
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
> The second session deals with libcamera and is on Wednesday morning
> from 9:00 to 13:00.
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

I would like to join this one to, as after ELCE I should have some time
to spend on this. I understand thought hat this would make use reach
the limit, let me know if there is any issues, I can spare my seat if
needed.

Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Attendees: it is probably useful if you let us know whether you have to
> join this meeting because you plan to use libcamera, or if you are 'just
> interested'. After the libcamera presentation on Tuesday afternoon we
> should know how many of the 'just interested' list can join.
>=20
> Agenda:
>=20
> Laurent, can you fill this in?
>=20
> Regards,
>=20
> 	Hans

--=-9lBVBlnkImQWuS7uHUer
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXYjbDAAKCRBxUwItrAao
HMOVAKDWp4mg2s115qHhL2aANd5yDA0zLACgnmeqvrAc0qJuA1rFzEPyad8G0FE=
=avFj
-----END PGP SIGNATURE-----

--=-9lBVBlnkImQWuS7uHUer--

