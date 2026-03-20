Return-Path: <linux-media+bounces-56546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N2bE31zvWmt9wIAu9opvQ
	(envelope-from <linux-media+bounces-56546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:19:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C12192DD320
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1505B30911FE
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 16:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936703CEB95;
	Fri, 20 Mar 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="LlY7kJRM"
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4983AC0E9;
	Fri, 20 Mar 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023179; cv=none; b=Dud35kmLpiDogBNImtCHQJyqUkLrZJ8BeZkEnoBgHWoBonrzI9I3qHud2FEU9JSSm8WnNx8x+rQL+eNx7nIcr3BlMkbfo2UmJOH6S6KY6xx+tJtCy1ALgpZTnahWQ9HKRWQhywltSnqWkIc2jcYIQM6HFZ7frsW92BV2wmhU4Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023179; c=relaxed/simple;
	bh=PkT+bIKBjXkAzaubT7U5xFo3VlBUP97D2rfYQ1OPonk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSiAkQ8MNSAzqrRu/iPXzaYGNrfLxx9ouxvsPToAahiGgQCZ8g2/S2F2QAPAEMTsliIsIQM3WpBzgwBoo51txg6RLgRra1neEVf1OLUgVjbz2jFtRokYQltgnz4ZeuHIH3rAgQJEAtgiDmuIa+X1LDQEdut2K1RK8Rn+J1hoHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=LlY7kJRM; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Q0ya/bosvsEwmY58LRjtxtnJ4zY15YuMA/nb0oy8bGE=; b=LlY7kJRMZShbu0bD5WgxpwBqlC
	D+JhBaTqYkgDRs9rvHBmDpxRoDila+QH7H4BAq6wtJmUTu+bBsI4Iu1MewtjC5GHta7Cx2Np6HP16
	kCQNv7YCXuzYpoANR8h/HdBH2a2mceUDUwYZ+YyjXzX5Kx2cI1XPx9unRzotkuXuJt1I=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w3cSw-005aaD-1M;
	Fri, 20 Mar 2026 17:12:50 +0100
Date: Fri, 20 Mar 2026 17:12:50 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: johannes.goede@oss.qualcomm.com
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	hao.yao@intel.com, sakari.ailus@linux.intel.com, andy@kernel.org
Subject: Re: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe)
 mapping
Message-ID: <ab1yAseDOwTj3tft@spark.kcore.it>
References: <ab0UvRdDpvZBiNsC@spark.kcore.it>
 <dc1a1031-ab02-49b6-865c-a8cd3a86ed7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EFSwvzu9Dksr84lD"
Content-Disposition: inline
In-Reply-To: <dc1a1031-ab02-49b6-865c-a8cd3a86ed7b@oss.qualcomm.com>
X-Spamd-Result: default: False [-2.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_DKIM_REJECT(1.00)[kcore.it:s=spark];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56546-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kcore.it:-];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[kcore.it];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.338];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kcore.it:email,spark.kcore.it:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C12192DD320
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--EFSwvzu9Dksr84lD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Thank you for the detailed review.

You are absolutely right. I dug into the ACPI tables on my Dell Pro
Max 16 Premium (Arrow Lake-H) and found the following:

There are 19 INT3472 template devices in the DSDT, but only one is
active: DSC0 (\_SB_.PC00.DSC0, uid=3D0, status=3D15). DSC0 has two GPIO
entries:
  - GPIO entry 1: type 0x12 (HANDSHAKE), pin 1
  - GPIO entry 2: type 0x02 (STROBE), pin 48

DSC0 is paired with LNK0 (sensor slot 0), which has no active sensor
on this machine. The OV08F4 color sensor is on LNK1, which on Arrow
Lake depends on CVSS (INTC10E0, Intel CVS Device), not on any INT3472.

Three sensors are defined in ACPI:
  - OVTI08F4 on LNK1 (status=3D15, active) =E2=80=94 the front-facing color=
 camera
  - OVTI13B1 on LNK2 (status=3D0, disabled)
  - OVTI01AS on LNK3 (status=3D0, disabled) =E2=80=94 likely the IR sensor

So the GPIO type 0x02 warning comes from an INT3472 that controls a
non-existent IR sensor slot. The warning is harmless noise in this
case and the patch is not actually needed for the OV08F4 to work.

That said, the patch (or your suggested refactoring with a proper
"ir_flood_led" name) would still clean up the warning for any system
where an IR sensor slot's INT3472 is enabled without the sensor
being present. Would it be worth pursuing as a cleanup, or is it
better to just leave the warning as-is since it correctly flags an
unconfigured GPIO?

Thanks,
Marco

--=20
Marco Nenciarini - mnencia@kcore.it
7C23 B804 3E65 D298 0A21  B6E2 589F 03F0 1BA5 5038

--EFSwvzu9Dksr84lD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEfCO4BD5l0pgKIbbiWJ8D8BulUDgFAmm9cgEACgkQWJ8D8Bul
UDgusA//T+cxB+fG2nQtQXdneh/hfSRKpVCTMJ/C1wWiZDRkjEAIv5xYNF/XtFes
rxnYvgh8AUT3fbedP4nuOZ2pWwl7G4PXScqbKB7cpZi8dHQDQEyw3NNrPh9827tG
Rg2dEF1xDfhJAVCZsv4c1kju5wexufm6KhI7U2ATVLQgLa3l56fF/zqEelHa3pPo
Sj+6ulkxc2hXekMxh0IamG4/TBgZna14miREJrzmlSTUmZgiAcF3BLDjcD5Eq7DX
tybkQJdS5ctIwDHX9dfb8rn5va764cTd2I0y4H9aFS/vhL7UsD2bu+DOXT2gZcuY
i04oK3i+FW+9nvWyDJWNwMipKtlRC5CWDT24z3Zkyhng+n6qTixpd+F5YaejDEhF
/zjeB3ghzv5fyTFHHhcPqOVEHoYnIHc3CQHq9v0d6xnqA9ejg3TY677vy1VOfGgT
2GCSVzdTAAEqb2HhmMbtjF8+IFPFE6QnwLA7mMk/WJD2YB+9fG4tfqA2wDS6UIMq
qq5qI7ekl2C6ktXbL0Tt4HjIP/bM3inKRAWbpiimpcEV/WSsMNBsZm12uskVOk+Q
sSTXQQNTIaa2yzXrb6KNrCxNCERxjNzNlJo+9qSDNIxc1F6cAVzx5adl9haK9QMQ
D0CEHnUrLT0+N+vguZFs9QvhbEUPMRN5QG+bm2/4gpObiwAZlD4=
=qU87
-----END PGP SIGNATURE-----

--EFSwvzu9Dksr84lD--

