Return-Path: <linux-media+bounces-64842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yyJfC9INL2pK7gQAu9opvQ
	(envelope-from <linux-media+bounces-64842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:23:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530568225D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:23:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kcore.it header.s=spark header.b="cI/RAvbQ";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64842-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64842-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A6C73008294
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D696315D23;
	Sun, 14 Jun 2026 20:23:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC412EB10;
	Sun, 14 Jun 2026 20:23:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468622; cv=none; b=TofpnENBcWIwItO12PBsP//HnE1Xy7IpsPBcwKl848fTN1QRT2TIc7ZC8NDhwjRZ9a+HP0O8X/ThHQX+5+8y4ph+9/jCtQ7kAYLvKig71Inmw0L6ngKg2GHwTzxaIwLFoJgQb9W4JtVwox4+O6AObY+pSwgPNDNOC05h7m6v4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468622; c=relaxed/simple;
	bh=25uKeH7Fkecda/5XIoD51LBNn5t/N1LZJRe8WfR3Rf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=RtHaCEdrnlYv57sLrvhBlbbdaWWMKU9ssInWgxLfrmVAZcVdJF6AhEcjexmZPXvMJwaa81ml4olwnAq+l4zzHhugy1DyLG9toev6ggJRa7Pylkn2cuDwmzYScQGEDf5rwp8vfdLpLLtLUFAOFnanPcSVYthZ6CNzWg9Go2UwvR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=cI/RAvbQ; arc=none smtp.client-ip=49.13.27.68
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date;
	bh=RCXBJFk+xLJcVhsvIX35+b0OywAN5DYAzp6zkG4q6uQ=; b=cI/RAvbQUaeKLOsOAGUKXd9MUY
	dEOuHYiQcBcd4eEiNl43elYgjSpb8TiHggw7Cac/yk9OvLgBdw0uojsmrfeFJhX9+be7xP0+pUJeY
	dvAXaKcQszYAMdk6atPP4AW2Ta15n7wjfX0EJIJGXK/IGFjVFKArMdy4oXvqhFaq3nEs=;
Received: from mnencia by spark.kcore.it with local (Exim 4.99.4)
	(envelope-from <mnencia@kcore.it>)
	id 1wYrMh-00000000CW6-0ClE;
	Sun, 14 Jun 2026 22:23:31 +0200
Date: Sun, 14 Jun 2026 22:23:31 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Angioli Samuele <angioli.samuele@gmail.com>,
	linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] OV02C10 on Dell 16 Premium DA16250 (ARL): INT3472
 handshake-derived "dvdd" regulator registered but never linked to sensor,
 sensor probe fails with -EREMOTEIO
Message-ID: <ai8NwzoU08AvD7Ve@spark.kcore.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
 <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kcore.it:s=spark];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:angioli.samuele@gmail.com,m:linux-media@vger.kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:angiolisamuele@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64842-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[kcore.it];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kcore.it:dkim,kcore.it:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8530568225D

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hans, Sakari,

Samuele's data is in and it confirms both halves of the wrong-instance
keying.

DSC0 = INT3472:0c, DSC1 = INT3472:01. The decisive line from DSC0's
probe, with int3472 dyndbg on:

  int3472-discrete INT3472:0c: Sensor name HIMX1092:00

So DSC0's reverse-_DEP walk resolves to the first consumer that _DEPs
it, the Himax IR camera (HIMX1092:00, Windows Hello), and that is the
dev_name DSC0's dvdd supply_map is keyed on. The OV02C10 (OVTI02C1:00)
never appears in it. regulator_summary corroborates from the other
side: the only dvdd on
the whole platform is INT3472:0c-dvdd (DSC0), orphaned at use=0, and
DSC1 (which the RGB sensor actually _DEPs) exposes no dvdd at all, only
avdd/dovdd/reset.

So the topology is settled: there is exactly one dvdd handshake on the
platform, gated by DSC0, keyed to the IR sensor DSC0 serves, while the
RGB sensor that appears to want it _DEPs DSC1 instead, and nothing
connects the two. The remaining inference is the rail-to-failure link
itself: dvdd falls to a dummy under full constraints, and the chip-ID
read at 0x300a returns -EREMOTEIO with no retry. That chain is
consistent with the data but I have not proven dvdd is the cause as
opposed to a coincident orphan (see the test ask to Samuele below),
so I would not call the failure mechanism closed yet, only the keying.

On whose defect this is: either the firmware under-specifies the
dependency (the OV02C10's dvdd is physically gated by DSC0 but its _DEP
points only at DSC1), or the kernel's reverse-_DEP consumer model
cannot express a rail that lives on a sibling INT3472 instance. Either
way this is shipping DA16250 firmware that will not change, so the
camera needs an in-tree path regardless of where we assign blame.

That makes this the same class of problem int3472 already handles with
the second_sensor quirk. avdd_second_sensor (the Lenovo Miix 510 entry
in discrete_quirks.c) already plants a second supply_map entry, keyed
to a hardcoded device name in addition to the reverse-_DEP sensor_name,
and skl_int3472_register_regulator() takes second_sensor for exactly
that. The DA16250 is the same shape, just on dvdd/HANDSHAKE rather than
avdd/POWER_ENABLE, and the HANDSHAKE branch currently always passes
second_sensor = NULL. So the contained fix is: extend second_sensor to
cover the dvdd/HANDSHAKE arm too. The struct has a single second_sensor
field today (avdd_second_sensor), so generalising that one field reads
cleaner to me than adding a per-con_id dvdd_second_sensor, but either
works; then add a DA16250 DMI entry pointing dvdd's second consumer at
i2c-OVTI02C1:00. This adds OVTI02C1 as a second consumer of DSC0's
dvdd, it does not move the rail off HIMX1092:00, so the IR camera's own
supply is untouched.

The alternative is to make that second-consumer resolution automatic
rather than DMI-gated, i.e. teach int3472 to discover that a sensor may
draw a rail from an instance it does not _DEP on. More correct in
principle, but ACPI gives no signal to key it on here (that is the
firmware gap), so it would need a heuristic and I would not want it
silently re-homing rails on boards where the current keying is right.

My instinct is the DMI quirk, extending the mechanism you already use
for avdd. DMI is the right key rather than the int3472_gpio_map[] HID
table, because the OV02C10 part is not the problem, the DA16250 _DEP
topology is. I would leave the fully-automatic resolution open in case
more ARL boards turn up the same split. Tell me which way you want it
and I will prototype the quirk against the DA16250.

Samuele, here is a concrete test that closes the last gap. It is the
proposed fix in miniature, so a positive result validates both at once.
Two ways to run it, pick whichever suits your setup. In both, the
signal is the same: does the 0x300a chip-ID read in dmesg succeed, or
still return -EREMOTEIO?

Option A, the patch (preferred, it exercises the real consumer path).
In skl_int3472_handle_gpio_resources(), in
drivers/platform/x86/intel/int3472/discrete.c, add the two marked lines
to the regulator arm of the switch:

	case INT3472_GPIO_TYPE_POWER_ENABLE:
		second_sensor = int3472->quirks.avdd_second_sensor;
		fallthrough;
	case INT3472_GPIO_TYPE_DOVDD:
	case INT3472_GPIO_TYPE_HANDSHAKE:
+		if (type == INT3472_GPIO_TYPE_HANDSHAKE)
+			second_sensor = "i2c-OVTI02C1:00";	/* test */
		ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
						     con_id, second_sensor);

This adds OVTI02C1:00 as a second consumer of DSC0's dvdd alongside the
existing HIMX1092:00 mapping; it does not move the rail off the IR
camera. The hardcoded string makes this test-only (it would mis-key on
any other handshake board); the shipped form is the DMI-gated quirk
above. The hunk applies to a recent mainline discrete.c, where the
HANDSHAKE case shares the register_regulator call via the POWER_ENABLE
fallthrough, so build from a source tree matching your running kernel.
First confirm int3472 is a module, not built in:

	modinfo intel_skl_int3472_discrete
	# or check CONFIG_INTEL_SKL_INT3472 in your kernel config

If it is =y you need a full kernel build instead. If =m, build and
install just this module, then reboot for a clean re-probe:

	make -C /lib/modules/$(uname -r)/build \
	     M=$PWD/drivers/platform/x86/intel/int3472 modules
	sudo make -C /lib/modules/$(uname -r)/build \
	     M=$PWD/drivers/platform/x86/intel/int3472 modules_install
	sudo depmod -a
	sudo reboot

(Build against the configured source for your running kernel, or the
new .ko may refuse to load on a modversions/CRC mismatch.) After
reboot, in /sys/kernel/debug/regulator/regulator_summary the
INT3472:0c-dvdd line should now list the i2c-OVTI02C1:00 device as a
consumer (use count > 0), and dmesg shows whether 0x300a now succeeds.

Option B, no rebuild, force the rail on by hand. On this board DSC0's
_DSM exposes only func 2 (the dvdd handshake) and func 3 (the IR-flood
strobe), so unbinding it drops exactly those two and nothing the
OV02C10 needs. dvdd is a GPIO-gated regulator, so as root:

	# 1. BEFORE unbinding, capture the dvdd enable line: int3472
	#    requests it with consumer label "dvdd", so in gpioinfo find
	#    the line whose consumer is "dvdd" and note its gpiochip (the
	#    block header) and offset. The label disappears once you
	#    unbind, so record chip+offset now. Your int3472 dyndbg log
	#    cross-checks it:
	#      "INT3472:0c: dvdd <acpi-gpio-path> pin <N> active-<high|low>"
	#    (that line gives the ACPI controller path and pin, not the
	#    gpiochip number, so map it through gpioinfo). Note the
	#    active- sense too, you need it in step 3:
	gpioinfo

	# 2. release the line by unbinding the PMIC (drops only DSC0's
	#    dvdd regulator and IR strobe, not the sensor, which _DEPs
	#    DSC1):
	echo INT3472:0c > /sys/bus/platform/drivers/int3472-discrete/unbind

	# 3. drive the line to its ON level and HOLD it (own shell, leave
	#    running). ON is =1 if step 1 showed active-high, =0 if
	#    active-low. Using the gpiochip and offset from step 1:
	#    libgpiod v1:  gpioset --mode=signal gpiochipN <offset>=<on>
	#    libgpiod v2:  gpioset -c gpiochipN <offset>=<on>  (holds until Ctrl-C)
	gpioset --mode=signal gpiochipN <offset>=<on>

	# 4. in another shell, re-probe the sensor and read the log:
	echo i2c-OVTI02C1:00 > /sys/bus/i2c/drivers/ov02c10/bind
	dmesg | tail

	# 5. when done, Ctrl-C the gpioset and reboot to restore normal
	#    driver state.

(If step 4 says the device is already bound, unbind it first via the
same path, then bind.) regulator_get("dvdd") lands on a dummy here,
since there is no provider once DSC0 is unbound, but that is a no-op
enable and the rail is physically on because you are holding the GPIO
at its ON level, so the chip-ID read is still the signal.

Either way: if 0x300a succeeds, that pins powering dvdd as what
unblocks the chip-ID read, and the fix is exactly Option A folded into
a DA16250 DMI quirk. If it still fails, dvdd is not the (only) problem
and the -EREMOTEIO is coming from reset, clock, or the NX33 bridge, and
we look there instead. Option A is the better single test, since it
keeps DSC0 bound and exercises the real enable path with the right
polarity and timing; Option B trades that for no rebuild, so if the two
disagree, trust A.

Thanks,
Marco
-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEfCO4BD5l0pgKIbbiWJ8D8BulUDgFAmovDcIACgkQWJ8D8Bul
UDjAng/48+VJljU31kWvg6tTrofMNHBwjXYlCAepNnQqVr8FyKxeM+fgzucIjqU/
dq2OJP2TgDej13gGFLSrsduel4FNrcTqc3KYM+uYSnRCGX4Pqi7r4uT5M4tvY2Pt
mrDGBvi4ZK6RgYfrCMQus1mNtVaJcBw/mKPdxdQK84KmI6ohKh9yFsDgizVF2WHP
LFvJ2YQWEHf1jeisa5h+y1c4+RRPUIzmz8qW12jFLr7Dba7U+pNP+OaZZwZin6Dh
uPNa8rrkv+WFWKR7kJfK6woaJpR0VVHWIg0s/4AOID/3I5LIBBd1ruTZwJNnBMkz
TApKmqU9hXANXxZ+oGLfCW7OoqLvNfcuo0kE35dqzKLxrpkGYHgFnX7N7mD4+Rgp
B57rUUSIBrOs1dn2qgSussZoEr0dNp24r6K+YH1r/thMw4kdQxgovD4se8momCij
tGPP0hi/8hB2uXBSRJSH/wI03qrU/JVOqVgmc8W19tPemZdQuNxvSrwnEgUaAFx/
9uZZJoMBX3HM373eVd1/M4Bv3j4fGesjKI8JeYkGkzQioZOATV0PIfTv+K04Ytyb
QGCwanp3I0FFUVBqMpiwuRIm/xOxl1NEtrpLU/AtbfBF6D17RobMidTvPy3URFRg
fkSASULsYSvlKZLZpZoNquUZmcoqBwcLawewWza8T9DeJMlkfw==
=8fhX
-----END PGP SIGNATURE-----

