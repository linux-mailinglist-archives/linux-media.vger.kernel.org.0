Return-Path: <linux-media+bounces-64775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iGsCFsqNLWrKhQQAu9opvQ
	(envelope-from <linux-media+bounces-64775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 19:05:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D91CF67F1DA
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 19:05:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kcore.it header.s=spark header.b=ySCshCFD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64775-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64775-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 285DA3003602
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 17:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA543FF881;
	Sat, 13 Jun 2026 17:05:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC7836EA8E;
	Sat, 13 Jun 2026 17:05:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781370305; cv=none; b=cURcNRoY3nOGphCpXYTQZeOqMbjFs8YCZh1B7lXlMfoBouyDF5uAV+fv359zvmQFSGAW9TwBU6DLO/K9p8aoPc3km5U7PO8S0ctaA9+n8MZ7WoaJH8hBj8la/KHZ9ekZb03exj9sVomVziH3o3A4Y9poozKZ7KFEAahTarQy4VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781370305; c=relaxed/simple;
	bh=NMEbEB2WYAzIuxBAlXfWzlKjaH6UKvvZM3UU1nx3WmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=mG+QMdf58zEJQVaSSfEI0/YWKZYoj03D6YNwcxZIRlpWgWyXp04QK4dVi2Thh17zJ2Lmn3nfilbBmwKirUzKz37T3ixsKbwzDmFzokEB0MbpjL8JXdIvetRzCkGSyvmulzNOtPcgq5Cz7uoQ3dsLjmYhyNa8abMCPj46j6fe9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=ySCshCFD; arc=none smtp.client-ip=49.13.27.68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date;
	bh=9BlTDcRtXsQuHx/sdddpqbglks88zcI582fnI/HcjnU=; b=ySCshCFDi0gsh12KKQzGXNZHiP
	u+UhOLG9jm1Bfsivxa57TbC/Y1RPirUGwqRQtE02/GSpZm/0GMecD2tWsrVVKQ9JWrpNxGs0N33bU
	4sFsdD6OoH6eAnEqQQF6vMCVz3kDd/6r+s2ONqwpngRSLiyAozBpOLCgyovOJ7cfJlWE=;
Received: from mnencia by spark.kcore.it with local (Exim 4.99.3)
	(envelope-from <mnencia@kcore.it>)
	id 1wYRk1-000000008VC-1qTe;
	Sat, 13 Jun 2026 19:01:53 +0200
Date: Sat, 13 Jun 2026 19:01:53 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Angioli Samuele <angioli.samuele@gmail.com>,
	linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] OV02C10 on Dell 16 Premium DA16250 (ARL): INT3472
 handshake-derived "dvdd" regulator registered but never linked to sensor,
 sensor probe fails with -EREMOTEIO
Message-ID: <ai2NAS5EnLaLoN2W@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kcore.it:s=spark];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:angioli.samuele@gmail.com,m:linux-media@vger.kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:sakari.ailus@linux.intel.com,m:israel.a.cepeda.lopez@intel.com,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:angiolisamuele@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64775-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[kcore.it];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kcore.it:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D91CF67F1DA

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Samuele,

No problem on the timing, and thanks. The regulator_summary plus the
_DEP decode settle it, and they confirm the multi-instance hypothesis
from my last mail rather than the missing-map one.

One correction on the code side first, because it matters for the fix.
The handshake path is not missing the consumer-map step. HANDSHAKE
(type 0x12) and POWER_ENABLE (0x0b) fall through to the same call site
in skl_int3472_handle_gpio_resources(), so both go through
skl_int3472_register_regulator(), which plants supply_map[] (dev_name +
supply, lower- and upper-case) the same way for either type. That has
been the case since v6.16 (c5d039327204, "int3472: Add handshake pin
support"), so your 7.0.10 kernel has it. The dvdd map does get created.
The problem is the dev_name it is keyed on.

That dev_name is int3472->sensor_name, and sensor_name is
"i2c-" + acpi_dev_name(acpi_dev_get_next_consumer_dev(adev)), i.e. the
first device that lists the registering INT3472 instance in its _DEP.
Here that instance is INT3472:0c = DSC0 (the regulator name in your
summary, "INT3472:0c-dvdd", is built from acpi_dev_name(adev), so the
provider is unambiguously DSC0). But your _DEP decode shows the sensor
(LNK1) depends on DSC1, never on DSC0: ARLP -> {CVSS, HS09.VIC1},
non-ARLP -> {DSC1, HS09.VIC1}. So DSC0's reverse-_DEP walk does not
return OVTI02C1. It returns whatever else declares a _DEP on DSC0
(plausibly the IR-flood side, given func 3 sits on the same device),
the dvdd map is keyed to that name, and the sensor's
regulator_get("dvdd") for "i2c-OVTI02C1:00" never matches. -ENODEV,
permanent dummy under full constraints (the legacy ACPI dev_name path
has no "coming later" signal, so it is a dummy, not -EPROBE_DEFER),
rail stays down, 0x300a reads -EREMOTEIO, no retry. That is exactly the
regulator_summary you captured: INT3472:0c-dvdd registered, use=0.

Note this is specific to dvdd. DSC0's _DSM only exposes the dvdd
handshake (func 2) and the IR-flood strobe (func 3); it does not
provide avdd or dovdd. The sensor correctly _DEPs on DSC1 and is served
by DSC1 for the rails and resets DSC1 owns, which is why it gets far
enough to attempt the chip-ID read at all. dvdd is the one rail
stranded on an instance the sensor does not depend on. (avdd and dovdd
landing on dummies is most likely the always-on-rail case I mentioned
before, benign, unless you can see a gating GPIO for them on either
instance.)

Timing is not the mechanism either way. Your own timestamps already
show the sensor's get at 6.468 well after DSC0 bound at 6.135, and even
a perfectly ordered probe would still miss, because the map is keyed to
the wrong device, not registered late.

So this is a firmware _DEP-topology issue: dvdd is gated by DSC0, but
the sensor is pointed at DSC1, and nothing connects the two. Could you
confirm the two halves of that, so we are not inferring DSC0's consumer:

  - with int3472 dynamic debug on
    (dyndbg="module intel_skl_int3472_discrete +p"), the "Sensor name
    %s" line from DSC0's probe shows which device its consumer walk
    actually resolved to. If that is not OVTI02C1:00, it nails the
    keying;
  - the reverse _DEP, i.e. which device(s) list \_SB.PC00.DSC0 in their
    own _DEP (a grep of the DSDT _DEP packages). DSC0 bound rather than
    failing with "INT3472 seems to have no dependents", so something
    does depend on it; identifying it tells us where dvdd actually went.

Hans, Sakari, once that "Sensor name" line confirms DSC0 is keying its
dvdd to a non-sensor consumer, the open int3472 question becomes whether
this is a firmware defect to push back on or something we work around
in-tree (and if in-tree, a per-board quirk vs. generic cross-instance
keying). Worth noting the EPROBE_DEFER idea from last time does not
apply: the map is keyed to the wrong device, not merely registered late.
Let's nail the topology first.

Thanks,
Marco
-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEEfCO4BD5l0pgKIbbiWJ8D8BulUDgFAmotjMwRHG1uZW5jaWFA
a2NvcmUuaXQACgkQWJ8D8BulUDhOWhAAm0dWTRnXeg419gpHSz3/fWxNgS/rHgy9
oJmYV4/6kftjSbR3i5zORj1eUAOKhdh4lYmjYN0+7OPu45MAlFHTEB943OCSBx5M
HZQGvIWlKfYiLewUnzYBpuMCk1tHJpjmSvkiU5KIrto47yM1uGW8hff+dmo+QIKI
ir6LaIIAsEhjLfjlK4mQa7EoImMmLfT9tmMpZeJjnsulXAsRgz8GGaLSca+J8/wR
pESrwvcDpQocFdVlBCIBSP6vnrJmGEOzivtb7uDWp3X8yXlPzwtCEE+WEyXghtXN
TSAtIAbezj1LaBSQ24uh6deOZkhVsqZ4t8ms1BWl8/E+XTw4GERMcTxLJJaRxO2T
Btzl95AEnGmxieWcZirrHlWIPTYRdJ8zlMhvKEuzjxbt/kFq8hm1mtvbcSdxOA7L
0Q2cvaTtlFlWRG8QCJTMNhFXKbaioaVLc/wkGiQ4vhrAT1mLX1voiTvaXnfRlk/s
eun0k5XN2+90DVqni0vx3vcZlF5/nnb5OmMJefv7qK89LwrA70ugbbNn2UL9Gxnf
IZqlPs50oyeBe7g7K5gglYgZfu2awMTx9eFcftiv8itH0yUVKXPawVgCXe1gSfrp
Eh4Q7oZEk1UYNk3bCz2RmspfbfwWy1z7Kn5/mWpSWUy/8PCFl1otui/C4snRNgIs
42ajMSg0om4=
=0BwD
-----END PGP SIGNATURE-----

