Return-Path: <linux-media+bounces-18301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBC2979872
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 21:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85F6D2828DE
	for <lists+linux-media@lfdr.de>; Sun, 15 Sep 2024 19:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FA11C9EC8;
	Sun, 15 Sep 2024 19:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="CLP8cmpp"
X-Original-To: linux-media@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A841B85D9
	for <linux-media@vger.kernel.org>; Sun, 15 Sep 2024 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726428816; cv=none; b=LgqLDH8u1Z5e/2d69v5i91y9/mQxwGN3e4DDNfYAjNf4Ilof+qAocAFFHFxCc49ZUhzraddkhHecaFZdXsQu0/6uw/XGvKJ8TlTRIbIUGf2EB5EDc8XwxSsg2bzpsYRK4bGqZIO/NcWhd1UtM13GzVEFO5FGnG4xo3UPrvPwx48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726428816; c=relaxed/simple;
	bh=lALraOZx/xE47Ge5+jm3IRp3yyg9orwfCFcJyjSymfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utuKiya5vIrKm5WVpZpm/WBywkh/LP5+tV1dj0abqD7WCXoiWUVSQzAdRhMddtgNKUKoU4MdUFbbDRgXbVjaHFjXB/PLlXGj5E9DzgBuf3TzjG/g3DZEBlHK/jD+I9uX4Xw+Pld2oyeFOEitok6jUS1kVcVjWaBW23Bn6s8jYjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=CLP8cmpp; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A0BC31C009E; Sun, 15 Sep 2024 21:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1726428803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AIegrtLasYm6bXHMKIJbfPbHTEL5jEYrfkgpw6IqPGk=;
	b=CLP8cmppVZvj1eGxY0zM3KAwDWcoI0oaAaTrmJlRAfQGWIuIkKqbMh6A3jfUyFNiiq7eRk
	9r3x+tOt5dtxzvy28xzO9n+n4GCTnA0y7sRllGaUNbZvJPcqiu6y5H6+t3rNqNyQys7zuI
	PlKY/sja0WKaudTgjCOt2bA6v60Jc9g=
Date: Sun, 15 Sep 2024 21:33:21 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: libcamera workshop in Vienna - September 17th - Agenda
Message-ID: <Zuc2gZHxWK5TZd8U@duo.ucw.cz>
References: <20240914234300.GA28657@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IAh9iVPk8xZLmgzG"
Content-Disposition: inline
In-Reply-To: <20240914234300.GA28657@pendragon.ideasonboard.com>


--IAh9iVPk8xZLmgzG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Here's the agenda for the workshop on Tuesday. As all workshop agendas,
> it's tentative and we will adjust the exact timing depending on how the
> discussions progress.
>=20
> 09:00 - 09:15  Welcome and agenda bashing
> 09:15 - 10:00  Non-image data streams (Naush Patuck)
> 10:00 - 10:45  Per-stream controls (Naush Patuck)
> 10:45 - 11:15  Break
> 11:15 - 12:00  What and how we would like to achieve with software ISP
>                in the foreseeable future (Milan Zamazal)
> 12:00 - 12:45  Post processing with pipeline handler (Jerry W Hu)
> 12:45 - 13:45  Lunch
> 13:45 - 14:30  libcamera and Khronos Kamaros (Suresh Vankadara)
> 14:30 - 15:15  Raw reprocessing API (Naush Patuck)
> 15:15 - 15:45  Break
> 15:45 - 16:30  Specify tuning file at camera open/acquire time (Naush
>                Patuck)
> 16:30 - 17:15  Cache handling (Robert Mader)
> 17:15 - 18:00  TBD
>=20
> Each agenda item is listed with the name of the person who proposed it.
> We expect those persons to introduce the topic (orally or with slides,
> at your discretion) and drive the discussion. We will take care of
> topics proposed by people who unfortunately won't be able to attend.
>=20
> We will use Jitsi Meet for remote access. The event will be accessible
> at https://meet.jit.si/libcamera-workshop-vienna-2024. We can however
> not guarantee the quality of the network connection on site.

So I'm in Vienna and some topics (cache, software ISP) look
interesting to me. Would it be ok to join? If so, what is the place?

I guess I could jump on jitsi if it is full.

Thanks and best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--IAh9iVPk8xZLmgzG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZuc2gQAKCRAw5/Bqldv6
8vCeAJ43r58281sXAnUhON89VVcB/YvjmQCfZhhIoXRkmE+4VkrXhjeTBZTO/Z0=
=boQQ
-----END PGP SIGNATURE-----

--IAh9iVPk8xZLmgzG--

