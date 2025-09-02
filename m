Return-Path: <linux-media+bounces-41554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE4B3FC9F
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 357DE1888BC1
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDB92EACE9;
	Tue,  2 Sep 2025 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5I3F6lb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D3E27D780;
	Tue,  2 Sep 2025 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809310; cv=none; b=sFnW72plMA9QDF8TtbzoqMsm7OJVOj87uBUdQ9tXFYSfVRPRNmeKJUis22tnBy46UbEAXlP9CC8zi47eDLBclxH4E57PUozYNOecJS628IGOWCU0RZMWloKg27ewIrCxE/GTBLSMRTJL6plD9zg0lQJAiySlOlWQA17e7C1b9L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809310; c=relaxed/simple;
	bh=DDNg75XzFiRCA+fFUXhfW7TmY1wvXsCiU9pRxv3eTbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnzMwXiKCvVGx6vJ0ERDCvM/JcSnOPzBy4KYkkLzFAprWiE/7QymfEQbJO1UcO8GXayvZlbmnauSsnm0NtOvjZHqCt3trPmy/NzmHn5bGAjo0UKQrUeHYBQBSRCkT7G3c0KtF7V2pKv00t+1kgfhZiqvkIuVFXDbJKWl+dwXVp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5I3F6lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13A0C4CEED;
	Tue,  2 Sep 2025 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756809309;
	bh=DDNg75XzFiRCA+fFUXhfW7TmY1wvXsCiU9pRxv3eTbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5I3F6lbDmikS6NnYJYi6InNMUkYNVg4+t7biC99gkxnMDNohCGMpSPcaDk0sk8iH
	 I75RyPbmySg6wSOC00K/Ktp+vcUE5bX+yz2bwWYeOGVTUw1bbLpng7V6kapukEdCMT
	 zPkn7AvSFfKLPaIBxbi9j2+kSyyRGZI+fXRcu1AxdkucPI8V0BTpypSOGpzdr3j6rG
	 CmzHBQEa/jgsdd5DiB9DVOtaSqA1HwAXU0Kp0tkpKTpPg0I7uTsNX9zHr1jPe9Dccu
	 5rqWSscPP9t53uEpou+JPB3A418Allk3Y0mpZ8s2vs+62bhteZurgX+7VgFfQjGI9+
	 SJ9DV7HXke3kA==
Date: Tue, 2 Sep 2025 11:35:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux@treblig.org,
	arnd@arndb.de, mchehab@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <0f43acdc-6b23-4e59-8a80-7f7743689bd0@sirena.org.uk>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250808154903.GB23187@pendragon.ideasonboard.com>
 <20250902103249.GG2163762@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P3POwEmxCwFVDH1z"
Content-Disposition: inline
In-Reply-To: <20250902103249.GG2163762@google.com>
X-Cookie: Vote anarchist.


--P3POwEmxCwFVDH1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 02, 2025 at 11:32:49AM +0100, Lee Jones wrote:
> On Fri, 08 Aug 2025, Laurent Pinchart wrote:

> > Mark, Lee, how would you like this to be merged ? I have a large patch
> > series targetting v6.18 that depends on 1/4, and I would like to merge
> > it in the media tree as soon as possible after -rc1 gets released.
> > Patches 1/4, 2/4 and 3/4 are independent of each other, but patch 4/4
> > depends on the first three. Can we merge 1/4 in the media tree and
> > provide a stable branch right on top of -rc1 ?

> I'm also set-up pretty well to provide this.  Happy either way.

> If you decide to take it:

>   Acked-by: Lee Jones <lee@kernel.org>

Yeah, me too - I acked already and I was expecting someone else to take
the series, whoever it is that's fine.

--P3POwEmxCwFVDH1z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi2yFgACgkQJNaLcl1U
h9BC4gf+JFvnZvhqnbvreICPfkHhDYV1e0Oe9b/gjR3DIlleFid0uS2MRHU9l1Dt
xWLFmXcojsUmktf3G5INFGnvHZ5gUufkPL0DhePic9H9g3WFfGFcidFlweJRwvM4
FfPHaT+84C2jFY0QpLGNFeysvWy+ZqKY16oejgKZvYXnTXuhztckQLQlA7jit2ng
fX5gMyGKE5gsBLNWnrDw+40DruQhBCIJlqgxVe2/mv+aVJ9WATgwIiSqMharWJfi
KOtKisvdu7iDTgmVNUYtdJiDZUiWgf6d7gkKXfS3BE8cmraLoqtPpaXFtLMdvIMk
3XOh2ToYKYQa2dr1TgGR0rpNtiB6og==
=t7X7
-----END PGP SIGNATURE-----

--P3POwEmxCwFVDH1z--

