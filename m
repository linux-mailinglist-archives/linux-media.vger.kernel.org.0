Return-Path: <linux-media+bounces-64901-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id su7dCx3TL2pLHgUAu9opvQ
	(envelope-from <linux-media+bounces-64901-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 12:25:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A868554F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 12:25:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kcore.it header.s=spark header.b=i3qf1Aal;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64901-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64901-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D105F301D96B
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7DD3DD84D;
	Mon, 15 Jun 2026 10:25:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA7F79CD;
	Mon, 15 Jun 2026 10:25:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781519129; cv=none; b=n/jsFSc2FlcyOugNS8BOCqrD5ECwqk8xSLmbeNGoJLLkS4ugEW2mGTN0lSpKBeH2Zrsb/CQkBY/fQ4ef6N8NCyKYZuE0oNWnh93QY8uxkWNK0BwyY0vjMA+q8xjMGFHJJxjdiiha4t3Jr4EpUHj9uae3I1K/DWDOB2rNDHvA4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781519129; c=relaxed/simple;
	bh=y6lEzR+MHF2IeVkWkuFPQb/r3xBY1JzX0TKhEUrHMvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=ZYqJ9qba7rJ+vYfHEwt1IY4WJ7lfli9ikGgj+zSCfdSjF19qwtrwwa40GK8izgZucVk76ZXG0OwthGWkTSOBkerXm+PeSgGtBuASStBJ2HV3nJqva8TOt94EntanOEPh1lWCwMLydmc9J29HBJf1QarxKtZzfsHY4SKzk/f3wW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=i3qf1Aal; arc=none smtp.client-ip=49.13.27.68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date;
	bh=aYLDC+pjKn+nDxAEnWpp1SMsFMGxmgZP1gqYcOK/vGM=; b=i3qf1Aaly9e/eV6e0gaQRKV4j4
	n3qmG8mCa0Hcq2wWmk/g4qim+wYVITJbG7nCf0pOpIMVr3s8lCOsEigjgTgY/3Sx60t+ZEmYx7PZh
	FYnY8pwwEQBXpuI0IhUDMz5IByD6AKuoDvrgptB/1Lsgf4V4sY/caj04IO5h8MOF5Q9E=;
Received: from mnencia by spark.kcore.it with local (Exim 4.99.4)
	(envelope-from <mnencia@kcore.it>)
	id 1wZ4VO-00000000EdW-3wNr;
	Mon, 15 Jun 2026 12:25:22 +0200
Date: Mon, 15 Jun 2026 12:25:22 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Angioli Samuele <angioli.samuele@gmail.com>,
	linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] OV02C10 on Dell 16 Premium DA16250 (ARL): INT3472
 handshake-derived "dvdd" regulator registered but never linked to sensor,
 sensor probe fails with -EREMOTEIO
Message-ID: <ai_TEj-_ije1XgYF@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <396e4b0d-7a2c-4ba4-9569-0428ccd63267@gmail.com>
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
 <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
 <ai8NwzoU08AvD7Ve@spark.kcore.it>
 <396e4b0d-7a2c-4ba4-9569-0428ccd63267@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kcore.it:s=spark];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:angioli.samuele@gmail.com,m:linux-media@vger.kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:angiolisamuele@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[kcore.it];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64901-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kcore.it:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[spark.kcore.it:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E2A868554F

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Samuele,

Thanks. The dvdd re-key worked (post-patch ov02c10 only logs "not
found" for dovdd/avdd, not dvdd, so it did attach to DSC0's dvdd), but
as you found it can't bring the sensor up: the rails it still needs
(avdd, dovdd, its reset GPIO and clock) would have come from DSC1, and
DSC1 is _STA=0, so nothing live provides them.

So before any kernel change is worth considering, the question is
whether DSC1 is off by firmware design. _STA=0 is what you get from a
device that is BIOS-disabled, OS-gated, or simply not fitted on this
SKU, and the asymmetry fits: DSC0 (the IR camera) is live, only DSC1
(the RGB sensor) is dead. If DSC1 is meant to be off here, there is
nothing for int3472 to fix and no quirk worth writing, so I'd rather
confirm that than build around it.

The way to tell is to read DSC1's _STA from the firmware tables.
acpidump's multi-table dump won't feed iasl -d directly, so read the
raw tables from sysfs:

    cp /sys/firmware/acpi/tables/DSDT dsdt.dat
    cp /sys/firmware/acpi/tables/SSDT* .
    iasl -d dsdt.dat SSDT*

then grep the *.dsl for DSC1 (the DSC blocks often live in an SSDT, not
the DSDT) and read its _STA. If it returns a flat zero, or gates on
_OSI("Windows ..."), or reads a manufacturing/setup variable, the
sensor is disabled by firmware and that is the end of the kernel angle.
If instead it depends on something a live instance could satisfy, then
there's a kernel path worth pursuing and we look again.

If you still have the factory Windows install, whether the RGB camera
works there is a useful cross-check (works in Windows means gated, not
absent), but the _STA read is the real signal.

Thanks,
Marco
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEfCO4BD5l0pgKIbbiWJ8D8BulUDgFAmov0xIACgkQWJ8D8Bul
UDjY4g/+Peo5MtFvrRKiqQiEMOoojYE3vty9L2dt9dJNGnkbQxAmOVO1QDHSUWMB
cY2mbbxN8XEdAshYT0zwJPqOddbmb1Z7UZ6P+bQGr4L7CO4qnB7Sf8M2XiHWT649
UnFiTqPjW8oj07gGR43LgnpCadbU3OuRXkc50P6ivyoijcYI1XmXwzj8/DWb4r99
VBaU0ZPgT1DwYfb2l4QBtBN/VOivEzChDdNC/YknM+UVc7YqmgItMErV5AMbwO4e
wnBVPlabtQ3HEOtEKWUw/KithA2k+Tg/i9nCIY/7tRdModXE3VzrkZuxGL9C2Max
qvwFCmxJF+k0wOY67Ud0m0gq3S2++VNsCRD86ZhtAM6pSwoK/RX6VUuwg4wZGkyT
6sVH5mRQoNrUIvA38AK7wQp0KoTDG353mtyODLSU2900AoxVtAhvUncQjCi41fTf
lurYql64UQUcPc9P9fOUezC38biaSsjklRwyzrVV0+mkruSNdEhn/OQP73UUbC39
RDycGnpBV7BpUtJ/4WulcqNpMPIuT/bfyzxIaeHDcHw3Ujx3xEW2ZfYDGstQ6f7t
MC8YVGg+1gH8Ds1v/TCXIhOGqLVWM1FXBjAuGNeBWju6c4JyvYYFf6TGSOpppbIP
H18oJWKm236l6ZS9fL205zJ8n+Q8oMz65VcBuAl6nDdXRjM5jKA=
=50Kd
-----END PGP SIGNATURE-----

