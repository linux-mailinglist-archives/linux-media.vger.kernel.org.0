Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B239237FB36
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 18:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhEMQIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 12:08:36 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:32896 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhEMQIf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 12:08:35 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AC3EC1C0B80; Thu, 13 May 2021 18:07:24 +0200 (CEST)
Date:   Thu, 13 May 2021 18:07:24 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     phone-devel@vger.kernel.org, martijn@brixit.nl,
        linux-media@vger.kernel.org, martin.kepplinger@puri.sm,
        dorota.czaplejewicz@puri.sm
Subject: Re: Recording videos on phones and camera on Librem 5 devboard
Message-ID: <20210513160724.GC19588@duo.ucw.cz>
References: <20210512214702.GB27652@duo.ucw.cz>
 <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline
In-Reply-To: <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Who is the right person to talk about Librem 5 cameras? Is there
> > mailing list I should use?
>=20
> I think most of the coordination is mostly happening via the gitlab issue=
s in
>=20
> https://source.puri.sm/Librem5/linux-next
>=20
> Maybe Martin and Dorota who are working on the camera drivers (put in cc:)
> have a more suggestions.

Thanks for pointers.

In the meantime I got silent video recording to work on Librem 5
devboard --

https://gitlab.com/tui/tui/-/tree/master/cam

-- but quality is awful, probably either hardware or kernel issue.

Is pulseaudio supposed to be running in Phosh? I have trouble
capturing any audio and am wondering if I should attempt to do full
reinstall.

> > AFAICS from bugzillas, it is still not compeletely working. I see
> > megapixels packaged in the repository, but without required config
> > files. Are there work-in-progress configurations somewhere? Would it
> > be useful if I tried to get it to work on the devboard?
>=20
> Megapixels work is mostly happening here atm:
>=20
> https://source.puri.sm/dorota.czaplejewicz/megapixels

Ok, so you seem to have that one under control.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYJ1OvAAKCRAw5/Bqldv6
8vRzAJ9S2NjEPY9TLbLF/9CzRcycjGaF2gCfW9hg1fQRBVwvt6gebdQsakz0XJ8=
=b15H
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
