Return-Path: <linux-media+bounces-65153-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3s5eNuucM2oXEQYAu9opvQ
	(envelope-from <linux-media+bounces-65153-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:23:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3198469E0DC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:23:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kcore.it header.s=spark header.b=CubKutVD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65153-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65153-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8145030166E8
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 07:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4190F3C76AF;
	Thu, 18 Jun 2026 07:23:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AC73A8736;
	Thu, 18 Jun 2026 07:23:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767391; cv=none; b=pD3THzp8SoShYsy3XEfjge37g0o+Claxn5g895tP5S2WSKFgq938JhFdi3PSrgdv6ZVoldQmE4aD+mHIMPZ9JK5+QIfF9PdR52kImG8VuBlxlOkg0PqXVHbyaCgB88+vkpgaZbpJ9koIhV7xNyQxPy1ubBJBfyMl1BbYKtT5RAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767391; c=relaxed/simple;
	bh=tOkZG3ENBt1mSFpxNo3zSuAXJ3AO7p4AnGKQKj7x/0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=k0sb+CiUTTwHcBF8gDLDvVmW+le8iMOLkeKdhwiX39lrBj8IfBR6YCl0nnLnoZlAMsPSyxxO+zbMp1uyQmzepZdVlPXce39HmTaDug+lXn3dIeJZKnQ5jXd7sVmsho60dmtgeQ0Xfv2D1MSMZgUrdMjcAPkLTr1RCNuxEfZ7904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=CubKutVD; arc=none smtp.client-ip=49.13.27.68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date;
	bh=tOkZG3ENBt1mSFpxNo3zSuAXJ3AO7p4AnGKQKj7x/0U=; b=CubKutVDJ1K0Npue8hxubg/fhO
	segPbUqDLj/FWvd3/5Dwr8+X54P37jnyWlLaNBLomOyqOQUySoFQzDX1/HJWCrV1j2CNRo3Vxjt26
	hsZtAMnqk0a7QcbmBTs/bIiML3MS+oXNCF6pqMwF8VO8mj5AcIy2Wq9+c3pHCEZgJoKI=;
Received: from mnencia by spark.kcore.it with local (Exim 4.99.4)
	(envelope-from <mnencia@kcore.it>)
	id 1wa75U-00000000O69-18ke;
	Thu, 18 Jun 2026 09:22:56 +0200
Date: Thu, 18 Jun 2026 09:22:56 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: angioli.samuele@gmail.com, linux-media@vger.kernel.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	sakari.ailus@linux.intel.com, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] OV02C10 on Dell 16 Premium DA16250 (ARL): INT3472
 handshake-derived "dvdd" regulator registered but never linked to sensor,
 sensor probe fails with -EREMOTEIO
Message-ID: <ajOc0H8Pvvr4exL5@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dee36707-3fc9-486e-b18b-d6a246edb67c@gmail.com>
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
 <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
 <ai8NwzoU08AvD7Ve@spark.kcore.it>
 <396e4b0d-7a2c-4ba4-9569-0428ccd63267@gmail.com>
 <ai_TEj-_ije1XgYF@spark.kcore.it>
 <dee36707-3fc9-486e-b18b-d6a246edb67c@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[kcore.it:s=spark];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65153-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:angioli.samuele@gmail.com,m:linux-media@vger.kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:angiolisamuele@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[kcore.it];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kcore.it:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3198469E0DC

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Samuele,

The _STA dump settles it, thanks for running it down. With DSC1/LTH1/CLP1 all
_STA=0 and only DSC0 (INT3472:0c) live, the OV02C10 has no live PMIC instance on
the DA16250, and the gate is a BIOS/NVS config (CL01/C1TP read but never
assigned, no _OSI branch), so acpi_osi spoofing can't reach it. avdd/dovdd/reset/
clock have no live provider to key to.

That closes the kernel angle: there is nothing for int3472 to fix here, and the
dvdd re-key, though correct, can't bring the sensor up. This is a Dell firmware
matter (the RGB-side PMIC topology left disabled in NVS), worth reporting to them
if you have a channel.

On the standalone dvdd second_sensor quirk: I'd hold off. The second_sensor
mechanism already exists; a dvdd_second_sensor field with no enabled board behind
it would be unused code, and the kernel doesn't carry a quirk that has no
consumer. If a board turns up that actually benefits, the field and its DMI entry
can land together in that series, with the consumer that justifies them. Until
then there is nothing to upstream.

Thanks again for the thorough work on this one.

Marco
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEfCO4BD5l0pgKIbbiWJ8D8BulUDgFAmoznMEACgkQWJ8D8Bul
UDhpbQ//dT58F+M5aB3CZ6PCvL4SpGMkDD9LQKKMOH/xr4fZGGoDLu0cyrjbDAIk
/+4/rOi0UgjLoA1WkEZnitqxYQX88X+gVFs6Nedj/ajDV4lJO1CNDMmoQhYVkevy
feUvvPRTnM2rSWTxDdVIIy4/SmBSbGqruVfI8yWgPj3ifNBjbIRPudqWG2iBMgyH
2CsId6CabIAATEsG5sptxemYIKyQqu1svc2c/rvAWJfVDtsYYMYpZq6nrIydoNKU
zL91JiXuyLgS17nSYREC0lmXnRYraTL63nYR8eZGHV1oT7PMcWCizCoL/dHImuH/
dH/K6aiX7VC8aWmpd7JQ4Y9OGLRTikx49q2pmlnYCOjSzOs5M/oT6SH7wTx/pmby
0U3kczdXQ6xzooS9obcL/ufUMAEygHwZ2qZA0dbR92zm0XvN6LDSrMjdm7ZBmT8L
3equQOTlfm4sHEmOzYZGVK+f69d6tVeaZhJfubMHHCxfaOITnmr5Z61D8TzoOKuI
Pz+MokXBZ5KLJMVz3NvdLnVBqGK5DW5dszUqIJzITtbHIrQjBmV9GzeXGej3Dmrc
a03X9jwvcnPfgoxQNQPt++hEzXn2ANqf8Zda45KVILW9aQUrT+NYAEMpCEHUytt6
F4KWtNPNt19JZKHFdTbCd9ra3U/oKZQa0s34VY+NDY8SKkTnvwk=
=jGY+
-----END PGP SIGNATURE-----

