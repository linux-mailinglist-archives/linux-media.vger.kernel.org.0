Return-Path: <linux-media+bounces-9135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC88A27AE
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 09:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7042F281AF7
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 07:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBF9482DA;
	Fri, 12 Apr 2024 07:08:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E569246444
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 07:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712905708; cv=none; b=BSv9GquX67u/MGPh2qayEEzrpgiLvozSufNSorJVzYGN/bQ762SFOOcRSTFfsjs5DoSxjlI/dzmgtRQICY6tP+IZ2XTOhnyIFfY0yQ43LS2CuCWNfP2ZZWJwkjrVp/eKVKIwaLQnE7uQqOeWOcBGFoz4Q7/pXlJPnfmEvDgq6tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712905708; c=relaxed/simple;
	bh=ClQ0BLQzOQg2jtR+VeDBEbmCd/vsAKEPEvUZhKMxUMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrIp+WsBddKnRKmQlTmJ/IgOACf4pgEboMLdtzC7u/QjUB7MxE7Mntcf30Lh5z4f1SMtLLKyoakuWEFh4NQmsA8QG7lowoegWHP998mQJ/Y90rF8PS4MbNUPrfiZfsTA9SOTA84a7/VUJSWdRGP9VbHOZ55qD3fkri3xqrgRNE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvB1G-0003QT-0D; Fri, 12 Apr 2024 09:08:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvB1F-00BplX-0P; Fri, 12 Apr 2024 09:08:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvB1E-0011mH-2z;
	Fri, 12 Apr 2024 09:08:16 +0200
Date: Fri, 12 Apr 2024 09:08:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjJdIG1lZGlhOiBzdGFnaW5nOiBt?=
 =?utf-8?Q?edia=3A_starfive?= =?utf-8?Q?=3A?= camss: Convert to platform
 remove callback returning void
Message-ID: <e5h2nqe6umpbzw3a7hhpdttmqr2w6kprwe7mavb4lj3cbmg2hk@k7xk6wgh5veh>
References: <20240411072836.221625-2-u.kleine-koenig@pengutronix.de>
 <SH0PR01MB066755DE4798EB2BD5EE04A9F204A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="haervp5rsxmwwzfe"
Content-Disposition: inline
In-Reply-To: <SH0PR01MB066755DE4798EB2BD5EE04A9F204A@SH0PR01MB0667.CHNPR01.prod.partner.outlook.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org


--haervp5rsxmwwzfe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Apr 12, 2024 at 07:00:22AM +0000, Changhuang Liang wrote:
> > media: staging: media: starfive: camss: Convert to platform
> > remove callback returning void
> >=20
> > The .remove() callback for a platform driver returns an int which makes=
 many
> > driver authors wrongly assume it's possible to do error handling by ret=
urning
> > an error code. However the value returned is ignored (apart from emitti=
ng a
> > warning) and this typically results in resource leaks.
> >=20
> > To improve here there is a quest to make the remove callback return voi=
d. In
> > the first step of this quest all drivers are converted to .remove_new()=
, which
> > already returns void. Eventually after all drivers are converted, .remo=
ve_new()
> > will be renamed to .remove().
> >=20
> > Trivially convert this driver from always returning zero in the remove =
callback
> > to the void returning variant.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>=20
> But it seems that v1 is already merge.

Hmm, it's not in next though. IMHO it would be a good idea to add the
tree that has my patch staged to next.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--haervp5rsxmwwzfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYY3d8ACgkQj4D7WH0S
/k4PwAf/W7PAMu0Iy0Z9HVJy9V3tNJnkK+aI84vVoqMNsBLj4D7V4nz/GAVWZZnW
jeGRxG6Opuqahx1CCh2ILM/eoDgOkTKvS5f682NOmiB+JvtbSr4c77yFcOEgJUsZ
Iyo6d+TG0VgN4YypgWYIKq4uddMgkF28ROcRalunX0C7EA7frsx9riqimETroNn4
xIlkOOIybb/reIWwU1lUtC1sEqnvVdC6+XfEqpa8Su+BgE7wCNArq97LsEGJt+OS
hoz4HLWX2CyJddA1Go79oZeX7jYvg0GshiPLt8345Iox3vOOdfWNcCrwncPVGmDN
cHi0Qtzs/b4INNkgUuEWdsH+BHTAkw==
=SAif
-----END PGP SIGNATURE-----

--haervp5rsxmwwzfe--

