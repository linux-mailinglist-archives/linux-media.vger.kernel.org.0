Return-Path: <linux-media+bounces-12877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5E902691
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 18:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 987E9B2C564
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 16:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6226143742;
	Mon, 10 Jun 2024 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcUCHTx2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F043146;
	Mon, 10 Jun 2024 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718036390; cv=none; b=NquIehsDORvGBBgPKFjc9o87ZTp0+pMyViL+We8/V0mwgYUYlM2avI0T6srY2rfpfXt3AH0eKUifwaAEcd/YXHsnmkgGvzghdn3Io/XnHpWhXd0gC4nuP3us9mX09SjNgEo0ZSZGIC3EXhLJiL8em+gXe1vaz2Vka5PY9BnHgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718036390; c=relaxed/simple;
	bh=R6WzIULq9+fnQYcQS1bKOAdon3jwK1WH/CKRPxb9Dg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qj/hwgUyvSoonkv3miGfcWmZ4Zg7y1Q8mH5UcqcS+ZdCWveXrELnVEmuq7JFr0wCZ6ux3m+6lOOQAF05D7pxRId2E2VOkEDpaMRoxbroIF2uufUazXyLEKjO2ezZbrJ7fQPStSmhI8+M78LsJg4gITC63HmRWjSKuETizNNfHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcUCHTx2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7CBC2BBFC;
	Mon, 10 Jun 2024 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718036389;
	bh=R6WzIULq9+fnQYcQS1bKOAdon3jwK1WH/CKRPxb9Dg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcUCHTx2EYJ/GmvexbgWlXn/OfbnPQSqd7Ez4p3BHSxY17Zysbn59If0ApIbKoL8X
	 dfuMWERYIYCSIfs9Y+5D9NXh8Sa+ovgFSVd9ZWe4w/HdTpVWeyQoVkGuQvskYmi03w
	 jRS1wiQ9jpbd+YasQZ7/8IzhTbbgL7ycFng863AT5ChQnNdvVgh2USaFXEwAStnpQi
	 pEErYLW8kKB8/VnkteCKuf9zsk4OVBNTXYvcRLZV91t52Tf9jUbpww3YL4ojm82zD7
	 N7RLatbkOjGPMs/W4md3UjI8PPNu4xVmmMB4fOXqzamMy7L8+CTP029x76g2W8c2I2
	 ubSRFZdU3vO6A==
Date: Mon, 10 Jun 2024 17:19:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Louis Kuo <louis.kuo@mediatek.com>,
	Phi-Bang Nguyen <pnguyen@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Message-ID: <20240610-eligibly-gainfully-7b1caad07aaa@spud>
References: <20240110141443.364655-1-jstephan@baylibre.com>
 <20240110141443.364655-2-jstephan@baylibre.com>
 <e0bf8667-cbb8-49ba-bb44-3edf93b019b8@linaro.org>
 <CAEHHSvYt-aqFahi=B_si=duJH8xDgy_9nndgR-P0+U5THX69uw@mail.gmail.com>
 <20240607144154.GD18479@pendragon.ideasonboard.com>
 <cf49fbb3-9de6-4e57-bc38-d720f76118a7@linaro.org>
 <20240610085424.GH26663@pendragon.ideasonboard.com>
 <e9a44b0b-1930-42fa-ab5e-a7eac1470041@linaro.org>
 <20240610-roping-ninja-56074ad61f77@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="krd0kZavuSZAemTC"
Content-Disposition: inline
In-Reply-To: <20240610-roping-ninja-56074ad61f77@spud>


--krd0kZavuSZAemTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 05:10:51PM +0100, Conor Dooley wrote:
> On Mon, Jun 10, 2024 at 12:18:12PM +0200, Krzysztof Kozlowski wrote:
> > On 10/06/2024 10:54, Laurent Pinchart wrote:
> > >>
> > >>> There's also the camsv IP in the same series that needs a generic n=
ame.
> > >>> I really don't know what to propose for it. Could you recommend
> > >>> something that would make you happy ?
> > >>
> > >> Sorry,that's almost half year old thread. Not present in my inbox.
> > >=20
> > > I remember someone presenting a talk titled "Beginner Linux kernel
> > > maintainer's toolbox" in Prague last year. The talk mentioned a tool
> > > call b4. I highly recommend it ;-)
> >=20
> > Wouldn't solve it. I would need to download the thread and import to
> > mailbox (several clicks needed) or open in some other tool just to see
> > the email. Or find it on lore.kernel.org - anyway just not convenient.
>=20
> Apparently you can use b4 from within mutt to populate threads, but I am
> yet to figure out if it works with non-local maildirs:
> https://b4.docs.kernel.org/en/latest/maintainer/mbox.html#using-with-mutt

That should read "how to make it work", I know it doesn't work like
documented there with non-local mailboxes.



--krd0kZavuSZAemTC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmcnoAAKCRB4tDGHoIJi
0qtrAP9YPh0+sV/kjtNmXMwP7T5usLhhX5vZzAjPc0mwr5965wD/Wx7GB6CXgeXI
q3vmSBs2jnhda3KzpGbgmbxGrNjp0Qw=
=HyAB
-----END PGP SIGNATURE-----

--krd0kZavuSZAemTC--

