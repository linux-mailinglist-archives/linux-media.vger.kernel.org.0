Return-Path: <linux-media+bounces-5109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB544853E92
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 23:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7744429294F
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 22:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B0662169;
	Tue, 13 Feb 2024 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCcNl0AQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E580362161;
	Tue, 13 Feb 2024 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707863246; cv=none; b=TLS+tOs3YjUNvGIymY9OIiHVFz++jqrZCLozFDYpvv1wuJjHR5CZNffyTUKjkKR0wslSOvZcd6U6gB6/HqkT3AzeXDmzxZrwjNlhL5SHVC2XXvFr0/0ToFKxhloIGQil/0FAHn4mbx8sT2Ch3ILYNWpEnzNNBhEsxoqy/17hMxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707863246; c=relaxed/simple;
	bh=XVVR0h5pqRDtjynuiWpzyI9epLSxU2JHIC160y74Zpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUqsXl3RvqLOWIFRWWLMJ+nCNOkOM1h6cJX66wDcjacR7psj04g1Paeh+njfsFvfewBzUf5GcwILUUMEv/xgSWwHbQSlu84vvC34BTUGy9CRqSwzPpXKSv9z+MqT6dhjWvSEuWygAZbcVTvbsJZqChpX/tABqg4HHTj4uFTtnWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCcNl0AQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F171EC433F1;
	Tue, 13 Feb 2024 22:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707863245;
	bh=XVVR0h5pqRDtjynuiWpzyI9epLSxU2JHIC160y74Zpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCcNl0AQXFU4DszyjmU6POcrMaNeR6jGcruVbRd5Q3T3Nm+E3EInSZnYtkt+RcCtJ
	 BwtnqhCX5b0CwbiDvnDZzGmlKZhfoqfLHUS2JnBQ/27ziHaYT5gtSwD96shEFenkbG
	 8cFSG02Q9pgwVzMUXBi6tU0cm2QxcGnmKjJv4jn+goW8lrrhXwATMQ4IYQsX5iu7lW
	 gBhq/qqEaOrDwjjZjNEqt+f76DklMygu7alGRi70VEMP+Ely4f6fNBTCNk3v9Zh86b
	 cHEEejxjoTEYiquD1V+IfUqf8GRvHvCIwzLtdH0Yv7RUR8UheB0QNVQ2DIoN/7GMQ9
	 X1bUq9CxLr/4w==
Date: Tue, 13 Feb 2024 23:27:21 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Message-ID: <ZcvsyRfVwC0aJ5fb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dPkmKSbhRyVvwOrP"
Content-Disposition: inline
In-Reply-To: <20240213140240.159057-2-biju.das.jz@bp.renesas.com>


--dPkmKSbhRyVvwOrP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

I couldn't find a datasheet for the OV5645 but the one for OV5642 looked
pretty similar when it comes to the issues mentioned here.

> Testing OV5645 with i2c bus frequency @400kHz on RZ/G2L SMARC EVL platform
> shows issues like the captured image is either greenish or it is not
> capturing the image at all. However, It is working ok when the i2c
> frequency is 100kHz. From this, it is clear that we have a timing issue
> at high speed. The testing also shows that if we add a delay >=3D 1 msec

That could match the "VDD stable to sensor stable" delay in the
datasheet.

> after register write {0x3008, 0x82}, then the captured image is always
> good. So, move the register 0x3008 and 0x3103 from ov5645_*_init_setting
> to a new table ov5645_global_init_setting.
>=20
> Drop the unnecessary entry { 0x3008, 0x42 } from ov5645_*init_setting
> table at the start.

It seems this is not needed to fix your issue? Then, this would be a
seperate change with a dedicated reason, I'd think. There is another
pair of activating power-down mode and immediately disabling it again.
Either we simplify it, too, or we leave both in place. Or at least make
sure there wasn't a reason for them. I'd just leave them.

Rest looks good to me.

Happy hacking,

   Wolfram


--dPkmKSbhRyVvwOrP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXL7MUACgkQFA3kzBSg
KbafRhAAmN/4qrKvTKl6bbzln5xYIb7rpnYRGZ7uPO3oFsUaWa5rDI/b7lCbijwN
RPSccIkiZdk8zUaqM1TjeYjmX5+KgxTsmtaKOZzYv8jC2c0tET9MrigX0NqD7tVe
3r+c0jENwSW3iMezstWz3EhZoqOpBCNGOCQ/sruh2OklC54TZayTxET/53APLGJH
Ieb0vuyOt0wAnEZ50zhCvwZEcSjxZ+OS0spS/XLCmGWcQE0oNLSF5Q8IPP9SI5gT
r5MU0c2psv/SdAFV/KoiGEe6PNxAzFGLatrXwRKq6/dkiaCuHN4fUGRgTEISFf5R
DEGSPvaWjEIz5NoM98Ic3oT5A0ZxbTOT4Ii9kZLsGxzemRyeEN4Wou1IgK1E2k5Q
nEAF0LZu6xXbOPUI4/z7/Bgho4mLXJjcce4D7HkmxjFVpsHk2SvgFSwWIdGvOv4Q
a7Yd96yuT5RS2DMrNVE4o0qnx026uWZ9xg/mfo334ruYv3z6WAM4BSlavPBngjZm
oQ+rcS5qF760FyEnx8Zk154/fQfK7MAPUgDxPKtp8nk0VpOKRTha6HFP8GPLhioj
4Wbn69rS0XM4rsBT9Hsbx5c3eKBtg8gjhPAJfv/Y0VuOal4Jx0K7nDFg8SnZDYZ/
8fa56A1qh/pNQu3FXZLqoVhifY04FfAUNUxPUBhGXLJAxvZXvx4=
=9PjP
-----END PGP SIGNATURE-----

--dPkmKSbhRyVvwOrP--

