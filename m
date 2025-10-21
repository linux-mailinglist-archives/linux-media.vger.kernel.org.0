Return-Path: <linux-media+bounces-45158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B69BF865B
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 21:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416EC18C5537
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 19:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4488C274FF5;
	Tue, 21 Oct 2025 19:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="cbgE6ZIp"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5FF274652;
	Tue, 21 Oct 2025 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761076615; cv=none; b=mRbPqu+9FoT//3huVgzfXXORQ/hPmZoAQ7UC4UVEXeZ7cmwiwKOl0PfA64XddDbZhE3rSJxVsWbAGb/MTl6dK7JcIpYXZfFvOWITtpXjpprklB7St90m3pjR6bdDxf175Owx5cAAtlcP+qt8mWCtyDsds+5nDnHuKJVngE8gfNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761076615; c=relaxed/simple;
	bh=uyJ4+ZYdJDSiyU7gttduHt1TnkKidYtyKbIBzHJ8G9w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vf6WAmTi9qoWZ5mQATdYbW7s+ti9RUIBbI4rXVHt9AeXAu/ilhABAwMVFvZexZHMRtvlwn80U5XRJpaXZ2/EhDcRDNVnYU9A+gKbs07l2eNUp8CDiJFm5tB9CLzoOR8GeZ9X593BcVr+jQpHQuYaoMFcTIE9qqb2w53NKx+EYrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=cbgE6ZIp; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uyJ4+ZYdJDSiyU7gttduHt1TnkKidYtyKbIBzHJ8G9w=; b=cbgE6ZIp/E9bDXLrB81/nrYiGK
	H94siNBqttYGGgOX01Tcv4+5wSe9MvCNnwqxGUkR2sg830i4fJqzg3OW60IaHIRhJ2wTz4ScBatSy
	hnJsqbizC5hVpNKecJ5z34EpCWH99dmD08Bizv43I5jXIGRxiCnZviUIHFJ7jb6JAAP7CVyY1inzd
	E+srhcOaFBsMAy/CzXmCLgUMISxNnGL2Rfot6WwKBZHVsWOhOHkyEZ6S0Hoo5L6jKnUBhhSy1wQPz
	vyBgS+qQhSyQq4afJ73SVy26oMR6ScIJejVqfHlMu3EgWu8H32qDRee4S8BEfXmh8wNVC9SAh2prd
	BPFpDfFQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1vBITQ-000IMp-3A;
	Tue, 21 Oct 2025 21:56:49 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1vBITQ-000I1x-1D;
	Tue, 21 Oct 2025 21:56:48 +0200
Message-ID: <e7086b14b7585ffe1215afbd85c15599e6c51714.camel@apitzsch.eu>
Subject: Re: [PATCH v2 0/8] media: i2c: dw9719: add DT compatible and
 DW9718S support
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Val Packett
	 <val@packett.cool>
Date: Tue, 21 Oct 2025 21:56:46 +0200
In-Reply-To: <750398e8-1781-47be-bccd-e2679a58d449@kernel.org>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
	 <790fd7d05fa03f788f0a628a99b2e127db824207.camel@apitzsch.eu>
	 <750398e8-1781-47be-bccd-e2679a58d449@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.9/27799/Tue Oct 21 11:30:25 2025)

Hi Krzysztof,

Am Montag, dem 20.10.2025 um 22:45 +0200 schrieb Krzysztof Kozlowski:
> On 20/10/2025 22:40, Andr=C3=A9 Apitzsch wrote:
> > > =C2=A0.../bindings/media/i2c/dongwoon,dw9719.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 88
> > > +++++++++++++++++
> > > =C2=A0drivers/media/i2c/dw9719.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 110
> > > +++++++++++++++++----
> > > =C2=A02 files changed, 178 insertions(+), 20 deletions(-)
> > > ---
> > > base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> > > change-id: 20250709-dw9719-8a8822efc1b1
> > >=20
> >=20
> > Gentle ping.
>=20
> Please apply the patch and run checkpatch. Probably you received
> checkpatch warnings from media patchwork, no?
>=20
> Best regards,
> Krzysztof

I run "b4 prep --check" before submitting the series and it didn't
complain about the wrong separator, that you have spotted in patch 1.
There was also no email from media patchwork. Should it send one if
checks fail?

Best regards,
Andr=C3=A9

