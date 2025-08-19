Return-Path: <linux-media+bounces-40316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 617D4B2CB41
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 19:45:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098161BC45AF
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 17:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399A930DECE;
	Tue, 19 Aug 2025 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUvwplA0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F3530DD0E;
	Tue, 19 Aug 2025 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755625528; cv=none; b=RjypAGWKxby95MLAbpHHZBbK5ZNjvtBKuxpV3Knoey3Rk3jVqure7wdsOfwW3z9lbVoortykiva+p1mz7uK5AmMbdiE7ZC4UsoOEq4iGN+EgLu2CedJllXaHig02uUPi9yG81Y5CXH3fD3gn8PVBc2pI0ISCvV8pe3SctSshbdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755625528; c=relaxed/simple;
	bh=GhoFcWSAfEWXe+zmBVWlWzG+be0qGZvHWZmBDx2NPmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3o1o26qTM7wRUou3rNKZg1TdB7sSWmJ+ovum9U+aCwTr7coz07+1MfLv7BidwW3wrprBKwqwkMcOHWBfytvZAYNrTUuu9xV1WuFjA49kAi81EZiaZ6Sa1yAxekj8gqZpUjngAI746OXFHLscwMzGuEM4tStdlraylTLDXgXyCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUvwplA0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BD2C4CEF4;
	Tue, 19 Aug 2025 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755625528;
	bh=GhoFcWSAfEWXe+zmBVWlWzG+be0qGZvHWZmBDx2NPmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jUvwplA003ggxcV26cp57WubG6Sb2qbAbUn0W6w4yPXXxyOJ2JhJ/4p7lTnrkuCbt
	 erWlxgGT4oiJ+cERpacd6oerDZ22az2mBqtTOyhA7+c2MSEhflsCxp3ZFiLjI4rIA4
	 iF70rwxtVFQtP9JqfQM+p7j+LIJEz4aFolH32nHy9h9jwXDfuZc7s3rF16Xch3fBkc
	 1gbl79x1mWfU9onbK0ho1BWhm2vg0ZjirO7vyBmQ6ItBbomjaupafZ51iI0XmSMNcX
	 w8wGVHDBapMpu64sAMjMMMnI7WkOjE/aHNPaq6fepdDCgVVYAlQkukC/Ct7oijhONZ
	 Uzr/Mh75Kjhow==
Date: Tue, 19 Aug 2025 18:45:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: vd55g1: Add vd65g4 compatible
Message-ID: <20250819-dimmed-contempt-83594845dbd9@spud>
References: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
 <20250819-vd55g1_add_vd65g4-v2-1-500547ac4051@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="slx1kuYihoEwwV1O"
Content-Disposition: inline
In-Reply-To: <20250819-vd55g1_add_vd65g4-v2-1-500547ac4051@foss.st.com>


--slx1kuYihoEwwV1O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--slx1kuYihoEwwV1O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKS4MwAKCRB4tDGHoIJi
0oVKAQCiMvF0vjIxCf2CqOWrzV14eYZ4dNvsAyDkInuEoQBRkgEAn1SG8rVhXaSv
Bu+KdPltKVgv7d6MQtiDi15NqPLODwQ=
=pqDv
-----END PGP SIGNATURE-----

--slx1kuYihoEwwV1O--

