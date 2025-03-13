Return-Path: <linux-media+bounces-28114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D67ECA5ED25
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 08:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA4A7189A478
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 07:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F4525FA0D;
	Thu, 13 Mar 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GOaYa2qK"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6213BC3F;
	Thu, 13 Mar 2025 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741851687; cv=none; b=XJlbVwDvEobZDyJOwqRtfhTb9I4nThDS5DPP0N6spM252LfZgvYTabOghnxqvStp1r00cvn6c6UeHT2p8fc99reynSzN14nsQFFC8JDXdUZ5/DwLgiAAHRgReo+XZO2CAzaFtLl3SXseQhCrMa8QjAV/hFYPfuTW3XA44e6J490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741851687; c=relaxed/simple;
	bh=WxJC9sFGtBukAdCwx4FyqGzQs/LHKhYniGF4OMC4Qyw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X7yxJaxeU1+63cimIfGBm+nWugBKgF5E/GBoeCu/IrsU3eciLsQ1sYTNDGjk0BJn0zpQOAL0fjL4AMw1y/5De8b4bYTViCY0jpY17yIc+rZTsEI4iw3ShJ04JdcKY5nby8DxwX96Hu+JZjr0QdXOTnpLNOS9KppycpnjtV2wYDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GOaYa2qK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741851682;
	bh=WxJC9sFGtBukAdCwx4FyqGzQs/LHKhYniGF4OMC4Qyw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GOaYa2qK3OUNeUyEfl2EDTJGvjwW3ZVD7UEpt80eKN4TZKvoVna91tfFv1WaYs0RU
	 24/72p+jp3N4ll1p10wGXmSs5lxyvgqgiEHlJb1T4UfE7PHXm2oDbW1o3+LFy6eaEr
	 5JBGUN6D5sFDf0zIpvK1qYOuqUQ8BLESM+D9h1C5zYbWNlmPb2GWhIstyc0oMZRVyO
	 ByQsSQSVWB7MOSUWu4ExI0P+Vk/3ZopMNKSa2bkGzh2fGeatvPwUacmNJANSF86AMi
	 qFSaxcLbq5/AQRQpLiX7Ul43MPdXLQD312K3u6X+ab2nRGjg9xJ146s8Z47YuL/lgb
	 aO8R2zFP9X2rg==
Received: from apertis-1.home (2a01cb0892f2D600c8f85CF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 46A7117E09AA;
	Thu, 13 Mar 2025 08:41:22 +0100 (CET)
Message-ID: <5b253a9e13397304d3ca556ebf770b65b1dcb534.camel@collabora.com>
Subject: Re: [PATCH 3/5] dt-bindings: i2c: maxim,max96717: add new properties
From: Julien Massot <julien.massot@collabora.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-media@vger.kernel.org
Date: Thu, 13 Mar 2025 08:41:21 +0100
In-Reply-To: <o7em5dmk6mu3uyd7eqmvshdaj233aacog734gd4wdhk43kuubg@2z726bmyvfcq>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
	 <20250207112958.2571600-4-laurentiu.palcu@oss.nxp.com>
	 <094bfb612d8895d2316d01704d37c853f8f86ae6.camel@collabora.com>
	 <o7em5dmk6mu3uyd7eqmvshdaj233aacog734gd4wdhk43kuubg@2z726bmyvfcq>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Laurentiu,

> > > =C2=A0
> > > +=C2=A0 maxim,override-mode:
> > > +=C2=A0=C2=A0=C2=A0 description: Toggle the operation mode from the p=
in configured one.
> > > +=C2=A0=C2=A0=C2=A0 type: boolean
> > I understand that this property is intended to flip the GMSL link mode =
between
> > pixel and tunnel mode.
> > What about adding a property 'maxim,tunnel-mode' to the GMSL 'port@1'.
> > Here the MAX96717 only have one GMSL port but other devices, such as MA=
X96724 can
> > have 2 GMSL link and may have each link in different mode.
>=20
> I'm OK with moving the property inside "port@1". But I have some
> concerns about the logic. So. 'maxim,tunnel-mode' presence would
> indicate that we want to force the functioning mode to "tunnel". But
> what if it's absent? Do we use the pin configuration? What if the pin
> configuration is "tunnel" and the user wants to override the mode to
> "pixel"? In this case 'maxim,tunnel-mode' doesn't really work...
> Am I missing something here?
>=20
>=20
> What about maxim,gmsl2-mode that could be either TUNNEL or PIXEL, if the
property is missing then just run with the pin configured mode.

Regards,
--=20
Julien

