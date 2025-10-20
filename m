Return-Path: <linux-media+bounces-45094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77252BF39EB
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 23:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64F6B3A4208
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F7B33374E;
	Mon, 20 Oct 2025 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="duFjPyBH"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D0333737;
	Mon, 20 Oct 2025 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993817; cv=none; b=tuzEaq86M0n529LTpd534IK+lLVzrWKahFAdTBZIbzGCXPC6rFPmR+hL3JiVrosFAnHirldMJRUhiAcosLOIpJ45z254dB/iQ1m+CNrX96nnCxtjew3d6wys9w7qtsX9M/q3cxS9UwDM/XUmC+BjFmuq4Bijuc4Blx12dFi0zi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993817; c=relaxed/simple;
	bh=McGfNh7ciF5ksFu2NwbJt5zEbKC5VtUeVzsub6mNoyU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gXMC0IAwoeVHCCS5IxInCcPMrRqjTZrQA6VS750WH6AVBoovJDFHTKSefm1ryiBicfVnW/78jg/GF6GARLGaNQvMx8W6PeNo0OiiFM2McPHXvRGkvKzBlmlGFplBCoUdnX6JuHlh8LUWhRkiRj2bwgXpUVsUj65cwqPvycAJ2uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=duFjPyBH; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=McGfNh7ciF5ksFu2NwbJt5zEbKC5VtUeVzsub6mNoyU=; b=duFjPyBHVlXnmjSb8UEBUN7+2l
	bkrdtG+JT+oOjh8Xzk25DYAspxQv78pdrBh1Gkl2gkaIhBhJ+iK31Bk7il7KE9kG/O7BfGjjOkzl+
	8NuF5z+l+/ByATShiQb9q6Yo1XmGuNrQa+wkfWjN+9mmqCzPhz10pUXWEkFyT81L1WQSqsLEgoRmy
	CBjre/IRiEXvBuTG9FbbwRokxeWZVYenV6c3NcZnvvsqBgRPx0+QGZg9qShsL4gi1o/7bjhtnPFgi
	N8gjzLWl6oNx0VOYxGWeb9Z76g/H+ODQyvS9gfI+TLF+cQBYP60sTs3Lab7Ro3f/YTZob2Zm66a6h
	+ZYGoVRA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1vAwgZ-0008mw-0b;
	Mon, 20 Oct 2025 22:40:55 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1vAwgY-00021J-2E;
	Mon, 20 Oct 2025 22:40:54 +0200
Message-ID: <790fd7d05fa03f788f0a628a99b2e127db824207.camel@apitzsch.eu>
Subject: Re: [PATCH v2 0/8] media: i2c: dw9719: add DT compatible and
 DW9718S support
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, 	devicetree@vger.kernel.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Daniel Scally <djrscally@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Val Packett
	 <val@packett.cool>
Date: Mon, 20 Oct 2025 22:40:53 +0200
In-Reply-To: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
References: <20250920-dw9719-v2-0-028cdaa156e5@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.0.9/27798/Mon Oct 20 11:37:28 2025)

Hi,

Am Samstag, dem 20.09.2025 um 14:03 +0200 schrieb Andr=C3=A9 Apitzsch via B=
4
Relay:
> The DW9718S voice coil motor is found on various smartphones like
> motorola-nora that are currently being worked on in the postmarketOS
> community. Since the way it operates is very similar to DW9719, this
> patch series adds support for it to the existing dw9719 driver.
> Because
> that driver did not yet support DT, we also add DT bindings and the
> dongwoon,dw9719 ofw compatible. With DW9718S, the driver was
> tested fully, including runtime PM.
>=20
> This is a follow-up of [1] and [2].
>=20
> Changes compared to previous submission:
> * Deprecate dongwoon,vcm-freq in favor of dongwoon,vcm-prescale
> * Instead of per-device config struct use model ID to handle cases
>=20
> [1]
> https://lore.kernel.org/linux-media/20250210082035.8670-1-val@packett.coo=
l/
> [2]
> https://lore.kernel.org/linux-media/20250209-dw9761dts-v3-0-14d3f00f0585@=
apitzsch.eu/
>=20
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
> Changes in v2:
> - Add patch (3) which removes i2c device table
> - Restructure patches because of that
> =C2=A0 - keep patches 1 and 2
> =C2=A0 - add patch 3
> =C2=A0 - patch 6 becomes patch 4
> =C2=A0 - patch 3 becomes patch 5
> =C2=A0 - patch 4 becomes patch 6
> =C2=A0 - patch 5 becomes patch 7
> =C2=A0 - patch 7 becomes patch 8
> - Patch 1 (bindings)
> =C2=A0 - Remove unneeded 'minimum: 0'
> =C2=A0 - Remove if/then that handles 'default' to reduce complexity
> =C2=A0 - Add myself as maintainer
> - Patch 5
> =C2=A0 - Fix void-pointer-to-enum-cast warning
> - Patch 7
> =C2=A0 - Drop pm_runtime_mark_last_busy(); it is already called by
> =C2=A0=C2=A0=C2=A0 pm_runtime_put_autosuspend()
> - Patch 8
> =C2=A0 - Remove extra parentheses
> =C2=A0 - Print error if writing to power register fails
> =C2=A0 - Add reason for doubled waiting time during power up to comment
> =C2=A0 - Pass NULL instead of unused 'ret' to cci_write()
> - Link to v1:
> https://lore.kernel.org/r/20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu
>=20
> ---
> Andr=C3=A9 Apitzsch (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: media: i2c: Add DW9718S, DW97=
19 and DW9761 VCM
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: dw9719: Deprecate dongwoon,vcm=
-freq
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: dw9719: Remove unused i2c devi=
ce id table
>=20
> Val Packett (5):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: dw9719: Add an of_match_table
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: dw9719: Add driver_data matchi=
ng
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: dw9719: Add DW9718S support
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: dw9719: Update PM last busy ti=
me upon close
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 media: i2c: dw9719: Fix power on/off seque=
nce
>=20
> =C2=A0.../bindings/media/i2c/dongwoon,dw9719.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 88
> +++++++++++++++++
> =C2=A0drivers/media/i2c/dw9719.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 110
> +++++++++++++++++----
> =C2=A02 files changed, 178 insertions(+), 20 deletions(-)
> ---
> base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> change-id: 20250709-dw9719-8a8822efc1b1
>=20

Gentle ping.

Best regards,
Andr=C3=A9

