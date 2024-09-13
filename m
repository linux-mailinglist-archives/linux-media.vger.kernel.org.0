Return-Path: <linux-media+bounces-18267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7D9787BC
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 20:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF02E1C228FD
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 18:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A582C12E1E9;
	Fri, 13 Sep 2024 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NezOInz7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783BBA2D;
	Fri, 13 Sep 2024 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726251820; cv=none; b=g0Ho/sNAwu2gXa11x+UI/H9mkTWbGf9HtOILpFunfS0w1ARioeHyLmn1aTdQ4R0cEOZWJkcPmT0GtG49JxtbqKkrgC9T6frX4qLgkmdxjqBlPVATgmQvgT24r4ok243mD7kNUTOgDXyafXJreNsnrma78rdY+UnPjkw+95QEZ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726251820; c=relaxed/simple;
	bh=jwmatwnPJlZVUwHNTnWsiaicspZRmQYAIdIScvWNoFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErMKPa/8opFer1U14i1pNvz7AV6bmc6eErIsugeswCOmWcYH7T4g0iGHA/R4/G3yFIjEMtH2G0TFg8zZCg6o7XeXDp/opz8Tva8CmNWoqARy/kRT8hcCKKtzx6TS4AO5FPLBNFeL+lGxG+j/vZA8blR+ANT4akPKgcqQAcuoYsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NezOInz7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2E8C4CEC7;
	Fri, 13 Sep 2024 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726251819;
	bh=jwmatwnPJlZVUwHNTnWsiaicspZRmQYAIdIScvWNoFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NezOInz7vB/cKu7LjKDdF8QWpO2uoXjcaQhWpUz2iNpovlP0v2OrgMOSPxHCiJYQ+
	 QeyyS1hS0KUpAy5MjPz6A8ZBcMf63k/WCoOwUUHKjjndOJxw2bt9Tsiz/XA66lvDvF
	 HchFaCC0QmCmKmwSLnSkWwoO3gNgsMnQk3qdl423TrAIboZ7IYGCnZWqWC4iGKPEy1
	 VxE/6zWuF5vkAMRLhqHqeeiVzN5mebyR37ll4SxsO+9EOy7TuMdAaYSnLIN4+xeljy
	 9AxQdy62r3TMqvQWZ5ayp/gfqhBVarz9GNUsEZDgXqiggMylqW+La50S5zz8HDc1uv
	 hg6kHhYnlKmEA==
Date: Fri, 13 Sep 2024 19:23:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Jai Luthra <j-luthra@ti.com>
Cc: Jai Luthra <jai.luthra@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 2/2] dt-bindings: media: ti,j721e-csi2rx-shim: Update
 maintainer email
Message-ID: <20240913-frostbite-reminder-46df0ae07c0e@spud>
References: <20240913-maintainer_email-v1-0-10c574bc1e7f@ti.com>
 <20240913-maintainer_email-v1-2-10c574bc1e7f@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xjV4XvatyTBXrHuf"
Content-Disposition: inline
In-Reply-To: <20240913-maintainer_email-v1-2-10c574bc1e7f@ti.com>


--xjV4XvatyTBXrHuf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:15:01AM +0530, Jai Luthra wrote:
> I will no longer be an employee of TI, so update my email in maintainer
> list.
>=20
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

Unnecessary, but
Acked-by: Conor Dooley <conor.dooley@microchip.com>



--xjV4XvatyTBXrHuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuSDJgAKCRB4tDGHoIJi
0hHWAP45nYRhqkMBbHzoNp0IMe7w59wp4y0TbccTh+XJCB2DtgD9FG/YopIbNdk2
yvY/4VftYy5fSdXg36bwafkxGwU67Qg=
=t1oJ
-----END PGP SIGNATURE-----

--xjV4XvatyTBXrHuf--

