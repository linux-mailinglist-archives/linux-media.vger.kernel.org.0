Return-Path: <linux-media+bounces-63520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Cf9QBjvbH2rqrAAAu9opvQ
	(envelope-from <linux-media+bounces-63520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:43:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61765635559
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:43:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=kcore.it header.s=spark header.b=VWI28U66;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63520-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63520-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B447E322913D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EAD407569;
	Wed,  3 Jun 2026 07:31:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24507388885;
	Wed,  3 Jun 2026 07:31:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471900; cv=none; b=Mrh2dLlYhyFnKlGR64zQ+m7HCUUrS0iG+URRdW/VRio+qN8ZU6pXnQ8h8/r6Sg4ukHmRmpp5atS2yoVOqQ08IihB5BKJPElEb+uZ+WT/+Dta/GP/EU1nfGpQvK60tkaLvw07d3xPqIEWjdXIBye4YIiY4iE1cIUgMDmpK3vnXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471900; c=relaxed/simple;
	bh=xl/ZL+LeNQ/HTL6YIqdsWIM82xmbUsNRR2IZA2aRTHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=r1YIwy3E/oCfY0qE2cwNHSfAR8N9HXO7kMWTIlFRLrOhXnFxxuLbCD0v9I9HnUox3Vet9xxRS0Rb9+upYukn4Q+hVMhDSCJFsjBiKsvKiSEG5UwzymcsfYUzBlolOfN+vdr1ubdBxBEOnPXKY8Cwmmc1WbyjBi/1NrC0GDWQ4K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=VWI28U66; arc=none smtp.client-ip=49.13.27.68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=a4Wy9+o9dxmFYGHL+31TQ2z0lah9y8fKNCooOaR+Ews=; b=VWI28U66X4UW8Fo/AACRtUlDHz
	mnJKSDMHWxO8mD8wp9PHL+uo1Pfd8lCojT2ngatNPc1VZ6IjPSSG4mL2+CD/S37ArGDtm6ImMePU1
	GBFPbucOwN6eS13R8Tz18QqaTryu6rN6ehjI9Wa3zPTTdyf/Kx3EAa7b0JCUzvyiPlps=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1wUfzo-000gP1-2Z;
	Wed, 03 Jun 2026 09:26:36 +0200
Date: Wed, 3 Jun 2026 09:26:36 +0200
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
Message-ID: <ah_XLEAkqjV9HkSE@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[kcore.it:s=spark];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63520-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	DMARC_NA(0.00)[kcore.it];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:angioli.samuele@gmail.com,m:linux-media@vger.kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:sakari.ailus@linux.intel.com,m:israel.a.cepeda.lopez@intel.com,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:angiolisamuele@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mnencia@kcore.it,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kcore.it:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,spark.kcore.it:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61765635559

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Samuele,

Thanks for the thorough report, the dmesg and the detail you included
made this easy to trace.

Both of your hypotheses turn out not to be the mechanism. The naming is
fine and the fwnode path is not shadowing anything. The dummy dvdd in
your log is real and is the key clue, but the interesting question is
how the sensor reached a regulator_get for dvdd at all.

> (a) fwnode/of-based supply matching in the regulator core now takes
> precedence over the legacy dev_name-based supply_map lookups

It does not shadow it. regulator_dev_lookup() tries the DT/fwnode path
first, but regulator_dt_lookup() only does anything when
dev_of_node(dev) is non-NULL. On ACPI there is no of_node, so it
returns NULL and the function falls through to the legacy
regulator_map_list walk. A software_node sensor with no regulator
phandle is therefore fine, provided the map entry exists at lookup
time.

> (b) The sensor i2c_client created via ipu-bridge has a slightly
> different dev_name

It does not. int3472->sensor_name is built as "i2c-" +
acpi_dev_name(sensor), i.e. "i2c-OVTI02C1:00", and that exact string
is planted into supply_map[].dev_name in
skl_int3472_register_regulator(). ACPI-enumerated i2c clients are named
the same way (dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev))),
so the consumer dev_name is byte-identical. No mismatch.

What the log actually tells us. The line

  ov02c10 i2c-OVTI02C1:00: supply dvdd not found, using dummy regulator

is emitted from a single site in _regulator_get_common(), on the
have_full_constraints() == true, NORMAL_GET path, and only after the
dummy_regulator_rdev existence check. So it means precisely this: at
the instant ov02c10 called devm_regulator_bulk_get(), the lookup for
"i2c-OVTI02C1:00"/dvdd returned -ENODEV, i.e. no INT3472:0c-dvdd
consumer map entry existed yet. int3472 publishes that map while
registering the regulator, during its own probe, and its whole probe
defers (the ~30 retries in your log) until the USB-IO bridge gpiochip
appears, because the dvdd HANDSHAKE GPIO lives on that chip. So
ov02c10 took a dummy dvdd before int3472 had registered the real one.
Under NORMAL_GET with full constraints that dummy is permanent, the
no-op enable leaves the rail unpowered, and the 0x300a read fails
with -EREMOTEIO, a hard error that is not placed on the deferred-probe
list and so is never retried when the real regulator appears later. It
is also consistent with regulator_summary showing INT3472:0c-dvdd with
no children after the fact.

(avdd and dovdd also fall back to dummies. If those rails are
always-on in hardware that is probably benign. dvdd is the one
INT3472:0c is meant to gate through the handshake pin, so that is the
one that matters here.)

Here is the part that needs your input, because it should not be
possible. INT3472 is in acpi_honor_dep_ids, so a sensor whose _DEP
references the INT3472 device is held out of enumeration entirely
(acpi_dev_ready_for_enumeration() returns false, the i2c client is not
even created) until int3472 clears the dependency. int3472-discrete
clears it with acpi_dev_clear_dependencies() as the last step of its
probe, after int3472_discrete_parse_crs() has registered every
regulator including dvdd. So in the normal flow, by the time OVTI02C1
can be enumerated at all, the dvdd map is already published and the
sensor binds the real rail. The fact that you got a dummy means that
gate did not serialize them on this board.

The most likely explanation is that OVTI02C1's _DEP does not carry an
honored dependency on the INT3472:0c instance that registers dvdd (or
there is more than one INT3472 instance and the depended-on one is not
the dvdd provider). To confirm, could you send:

  - the OVTI02C1 _DEP (an acpidump or DSDT extract), so we can see
    whether INT3472:0c is actually listed;
  - a dmesg with timestamps showing the order of the int3472-discrete
    bind, the i2c-OVTI02C1:00 device creation, and the dummy-regulator
    warning;
  - the INT3472:0c _CRS plus the _DSM result for the GPIO at
    \_SB.PC00.XHCI.RHUB.HS09.VGPO pin 1, as you offered.

Hans, Sakari, this is where I would like your read. If the _DEP on
this board is indeed missing the INT3472:0c instance, is the right fix
a board quirk, or is it worth giving the ACPI consumer path a "supply
coming later" signal the way the DT path has one?
of_regulator_dev_lookup() returns -EPROBE_DEFER when the phandle
target is not registered yet; the legacy consumer_supplies/dev_name
map has no equivalent, so once the _DEP gate is out of the picture
there is nothing left to make the sensor wait.

Thanks,
Marco
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEfCO4BD5l0pgKIbbiWJ8D8BulUDgFAmof1vIACgkQWJ8D8Bul
UDhKsxAAhvXDzdrZLmLC+7kV5ORVVl0oEZxv/ylThq8xzkiPdkkkdCYcf0cF/Xgp
rH2LvTr/lqJjCL8P8S7ytzJ+8DCX7UpjnFy5AsyTJZGBa312eG9Ksrf9GMOJ5slL
r4KqKu8feyuQNgkaYKsxO342OSlPas5aAKVUIQeEUB+1Q2eQ4ffe5MR+Rdub9a5q
1SKIfmuAzs7DJc86gBYmA6wz7FEpmXNH3ugu3QLFLB7NlEQEHQIl8Jo3w5yt5GCi
Gs+0JgmydKkTmNpUJ4c13tXk+G3G8Um2fg6sgwIX/pOhjbPrrzpgZgwVGI/eZdfM
MKQ2qWYiMuDFsd3ZnXMyHrffIVMj2q/UB+ye2bAP3a9QsxubuvCaCGk+ksBRvtUk
4GE1MQ+yFVakru93ADfTJ+ASuyaVI6fVG9H4zt46up5z04DzGYSYhXAJSOfBCz6A
CRAkKBkTga8bHeqdt289kzgES+OIkX2XeE7eOl8JX+LoDIfQiLD7cbGynHNjR4mf
fjfBVwTmwRES+KC5+KLbsgrdCfpX0RCb8iBmQto7jxTUImKI3xMgmHYf51PYyqmA
/uSpYW1G4YwBGn8/9aI2P9FiQyQXdt6LTqBz+Ld9CxGiKUNvfj078lcZoa7Dq22n
5S14yapsNfoJbEyYhIshu2exu9rcW30DGSnloS1gTuIvz+e72hc=
=egB7
-----END PGP SIGNATURE-----

