Return-Path: <linux-media+bounces-64887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id myj1KTG2L2rkEwUAu9opvQ
	(envelope-from <linux-media+bounces-64887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:22:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EA6847DA
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 10:22:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=W4OjgACD;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64887-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64887-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD6C63015871
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 08:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595B31A4F2F;
	Mon, 15 Jun 2026 08:21:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8B3C279B
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 08:21:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511698; cv=none; b=U/L+nMlf4rVven09uX/vTQjoXhCP54LPg0bZBY51WJxkgLVaf1urWsb43cpKCNaPEpXWHqo66dmfgZPfQDWUui2DfAQtV/o/FtZkMAOjl85W3Jelj5hsCiJCxYczZFLWdpAKv5H/XwisltC2RLLklBG37FSrXvNgSXcB79d/sw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511698; c=relaxed/simple;
	bh=wFHV0BbH+YZuzvkMRzMJOlvnvBzetXBCAw5PosJf+kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hn1k/IBdpdECtpJFi9L/o9FDSvETUvPZaTrNBFLFSYPuMsGUhqpGgt45ZlPW+gwUiX/DyoFlG0QqQP9PMigTE7sAdZu8JnSHBXR5P2nabbrFrRNx6Z7HRnexcEJr10FvnY5bbglspJS+hZY/4fyEiCwhMZD8KQGkCAGHVjdGCv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4OjgACD; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2210805f8f.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 01:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781511695; x=1782116495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7OXKTPZ69qxs+f0U2E9H0frS9si1j9AEtDPP4sfAq4=;
        b=W4OjgACDIYYRlLTgU639Xzf6Ifd4QwOJk/f4wANi7AbHyxr12F8kdu7S+UgQfS87TL
         MfwI4lSJAfFdYc0sB9HHu+MBnDMmcXnNoodNO3EChhIcYs2eGOssCFD38NkIFYWboKTZ
         hXOKPonl1vV8OYv1abQcjyOzHnx9odt9BS6CCxo4FL0jVU6yPw95cfKNKlD3MYcwcmsI
         lUUNOq1SoKFKWd2sRMK1AlXJRyWVW6/qOqihGMn2TuvKCNP+TCktgXDSdhBdH5H8ynIX
         k03oGfhqfVu/ysoA4qQAYwM4trYf0468h4NdI4n5b/ycE3+07mbjjim53O0oBtbB479s
         sfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511695; x=1782116495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7OXKTPZ69qxs+f0U2E9H0frS9si1j9AEtDPP4sfAq4=;
        b=kEDsCXO4FoIbmJnLzqZ+IExugzwxLT2IanTaHhW6j1t3j8Xm7YWs/S1c3dVX3a2Qh7
         yyjJ0MF4gTRzjSbtQIvMXgp8nmU4XYavEdPnuhiMAdYCq1tVIiZkXPMW/3Ry34KQmBuL
         91QvRHmsoU60VplWS3xTbXKuK1bZD9zzk1onYO7myxymvGdp2WCdUOSD95oQrTI0gnK4
         8w19e9Z9tW5PQsBZDM7znCeUoltm8FS11s/UchBPIhSHkK9mfQo96Ypa7N1rbsDamoKT
         jmmeTA7l9yROY3aUNKh4AcNvQD43hu1fQwBfQay/DAbeKhqoXrWu4dzfSmf8v+hS9t3f
         VoNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yPPLWkmwyRMxc1dx7NjgchOmi2RxoGzo6mQ9avJEw932M8kLVaEJiCg8yo3dk8f0wTbLR3c+3CsW05A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDz5s1vJapGxo+8S1JYqXbVvggXlJSqii5OK3YCP/BLC2spWgh
	WN3kqfw/0C1NsH09EjQRHD1Jn6V/NrZfrtvWBgNIeYiiJKndyfpDFM+U
X-Gm-Gg: Acq92OFYzr2a+BKTb+Q3cZ47zuZNw2lOdbLicn6J7QOtCDCm0epfVRtNXr3WN9sFywJ
	NM7bCrM9ZNyg9vJgvKfYldVT7idD7opHxZKIWR4XP9G+muGQHGIWdeAwuYaq/K0+GP7gLu1EazL
	YPmgsZa5EKUIUSBGlxZnSfYs1n+Z57Bhi7wwh1WAik0C1ngHGsE6NjC8UFqPwCZ4JDFRyVbTuDo
	b9T9wV+Kk7CVwPGfX7XJWldykEiDYWmPe6ANpNSNIFe/vjt+b3U62l2pCXBNulMazJzGP5lHsEn
	zk6oHO3ohdGS/DezaU6EyaQPQdEm62LMxwm/Nuy7QCxj1UKDSllDiSjxyryUWzlSSbY0okULDwt
	yGoGgYV4mQ/Ueo5CJ4RFb1WePSPBmLbn14ZIKiD5U05kPWOs03j66WAgwFzJdukUsuTA1sRuyPU
	6xgrZZ5IPy3lxkUTJpnn6E3lfJ7aLyBOTohVwOG/b9kVdMdw==
X-Received: by 2002:a05:600c:c3dc:20b0:490:adb6:793d with SMTP id 5b1f17b1804b1-490ec4fbd85mr123685505e9.26.1781511694969;
        Mon, 15 Jun 2026 01:21:34 -0700 (PDT)
Received: from [192.168.7.105] ([83.136.105.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f726sm30143179f8f.15.2026.06.15.01.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:21:34 -0700 (PDT)
Message-ID: <396e4b0d-7a2c-4ba4-9569-0428ccd63267@gmail.com>
Date: Mon, 15 Jun 2026 10:21:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] OV02C10 on Dell 16 Premium DA16250 (ARL): INT3472
 handshake-derived "dvdd" regulator registered but never linked to sensor,
 sensor probe fails with -EREMOTEIO
To: Marco Nenciarini <mnencia@kcore.it>, linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
 <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
 <ai8NwzoU08AvD7Ve@spark.kcore.it>
Content-Language: it
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
In-Reply-To: <ai8NwzoU08AvD7Ve@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64887-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mnencia@kcore.it,m:linux-media@vger.kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[angiolisamuele@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angiolisamuele@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B1EA6847DA

Marco,

Option A is in. Applied cleanly to v7.0 (the HANDSHAKE arm already 
shares register_regulator via the POWER_ENABLE fallthrough; 
second_sensor and avdd_second_sensor present), built as a single module, 
loaded.
The keying works: post-patch ov02c10 (which bulk-gets dovdd/avdd/dvdd) 
only logs "not found" for dovdd and avdd, no longer for dvdd, so
second_sensor="i2c-OVTI02C1:00" did attach the OV02C10 to DSC0's dvdd.
(regulator_summary still shows INT3472:0c-dvdd use=0 -- devm releasing 
the handle on the -121 probe failure, not the get failing.) So the
second_sensor mechanism is validated for dvdd.

But it does not bring the sensor up, and the reason closes the case in a
way the quirk cannot help. Two facts:

1. DSC1 is firmware-disabled:
      /sys/bus/acpi/devices/INT3472:01/status = 0   (\_SB.PC00.DSC1)
      /sys/bus/acpi/devices/INT3472:0c/status = 15  (\_SB.PC00.DSC0)
      /sys/bus/platform/devices/ : only INT3472:0c
    INT3472:01 has _STA=0, gets no platform device, never probes (with
    dyndbg on, only INT3472:0c appears). The OV02C10 _DEPs DSC1
    (DLK1 = {DSC1, HS09.VIC1}), but that instance is off.
    DSC0 is the only live INT3472.

2. DSC0 carries only dvdd + the IR-flood strobe -- nothing else:
      gpioinfo: a single int3472-held line, consumer="dvdd"
      int3472 enumeration (dyndbg): dvdd (HS09.VGPO) + GPIO type 0x02 
(the strobe), no reset/powerdown/clk/avdd/dovdd
    So DSC0 has no reset, clock, avdd or dovdd to offer anyone.

Put together: the OV02C10 needs dvdd/avdd/dovdd plus reset and clock. 
The only one any live instance provides is dvdd, on DSC0, which the 
quirk re-keys correctly. avdd/dovdd fall to dummies, and reset/clock 
would have been DSC1's -- but DSC1 is _STA=0. There is nothing on a live 
instance to re-key those to, so the second_sensor approach cannot 
synthesise them.

So the dvdd quirk is right and worth keeping for boards where DSC1 is
enabled, but it is not sufficient for the DA16250 as shipped: the 
sensor's remaining rails/reset/clock have no provider while DSC1 is 
disabled. That makes this a firmware defect that needs a firmware fix 
(enable DSC1, or expose the rails on a live instance), unless we go to a 
board-specific quirk that hardcodes fixed always-on regulators for 
avdd/dovdd and sources reset/clock directly -- which needs the DA16250 
schematic and only works if those rails are actually controllable.

Earlier revision: my previous "DSC1 owns avdd/dovdd/reset" was wrong --
DSC1 owns nothing, it is _STA=0.

Happy to test a board quirk if you want to prototype one, but I suspect
this one is on Dell's firmware.

Thanks,
Samuele

Il 14/06/26 22:23, Marco Nenciarini ha scritto:
> Hans, Sakari,
> 
> Samuele's data is in and it confirms both halves of the wrong-instance
> keying.
> 
> DSC0 = INT3472:0c, DSC1 = INT3472:01. The decisive line from DSC0's
> probe, with int3472 dyndbg on:
> 
>    int3472-discrete INT3472:0c: Sensor name HIMX1092:00
> 
> So DSC0's reverse-_DEP walk resolves to the first consumer that _DEPs
> it, the Himax IR camera (HIMX1092:00, Windows Hello), and that is the
> dev_name DSC0's dvdd supply_map is keyed on. The OV02C10 (OVTI02C1:00)
> never appears in it. regulator_summary corroborates from the other
> side: the only dvdd on
> the whole platform is INT3472:0c-dvdd (DSC0), orphaned at use=0, and
> DSC1 (which the RGB sensor actually _DEPs) exposes no dvdd at all, only
> avdd/dovdd/reset.
> 
> So the topology is settled: there is exactly one dvdd handshake on the
> platform, gated by DSC0, keyed to the IR sensor DSC0 serves, while the
> RGB sensor that appears to want it _DEPs DSC1 instead, and nothing
> connects the two. The remaining inference is the rail-to-failure link
> itself: dvdd falls to a dummy under full constraints, and the chip-ID
> read at 0x300a returns -EREMOTEIO with no retry. That chain is
> consistent with the data but I have not proven dvdd is the cause as
> opposed to a coincident orphan (see the test ask to Samuele below),
> so I would not call the failure mechanism closed yet, only the keying.
> 
> On whose defect this is: either the firmware under-specifies the
> dependency (the OV02C10's dvdd is physically gated by DSC0 but its _DEP
> points only at DSC1), or the kernel's reverse-_DEP consumer model
> cannot express a rail that lives on a sibling INT3472 instance. Either
> way this is shipping DA16250 firmware that will not change, so the
> camera needs an in-tree path regardless of where we assign blame.
> 
> That makes this the same class of problem int3472 already handles with
> the second_sensor quirk. avdd_second_sensor (the Lenovo Miix 510 entry
> in discrete_quirks.c) already plants a second supply_map entry, keyed
> to a hardcoded device name in addition to the reverse-_DEP sensor_name,
> and skl_int3472_register_regulator() takes second_sensor for exactly
> that. The DA16250 is the same shape, just on dvdd/HANDSHAKE rather than
> avdd/POWER_ENABLE, and the HANDSHAKE branch currently always passes
> second_sensor = NULL. So the contained fix is: extend second_sensor to
> cover the dvdd/HANDSHAKE arm too. The struct has a single second_sensor
> field today (avdd_second_sensor), so generalising that one field reads
> cleaner to me than adding a per-con_id dvdd_second_sensor, but either
> works; then add a DA16250 DMI entry pointing dvdd's second consumer at
> i2c-OVTI02C1:00. This adds OVTI02C1 as a second consumer of DSC0's
> dvdd, it does not move the rail off HIMX1092:00, so the IR camera's own
> supply is untouched.
> 
> The alternative is to make that second-consumer resolution automatic
> rather than DMI-gated, i.e. teach int3472 to discover that a sensor may
> draw a rail from an instance it does not _DEP on. More correct in
> principle, but ACPI gives no signal to key it on here (that is the
> firmware gap), so it would need a heuristic and I would not want it
> silently re-homing rails on boards where the current keying is right.
> 
> My instinct is the DMI quirk, extending the mechanism you already use
> for avdd. DMI is the right key rather than the int3472_gpio_map[] HID
> table, because the OV02C10 part is not the problem, the DA16250 _DEP
> topology is. I would leave the fully-automatic resolution open in case
> more ARL boards turn up the same split. Tell me which way you want it
> and I will prototype the quirk against the DA16250.
> 
> Samuele, here is a concrete test that closes the last gap. It is the
> proposed fix in miniature, so a positive result validates both at once.
> Two ways to run it, pick whichever suits your setup. In both, the
> signal is the same: does the 0x300a chip-ID read in dmesg succeed, or
> still return -EREMOTEIO?
> 
> Option A, the patch (preferred, it exercises the real consumer path).
> In skl_int3472_handle_gpio_resources(), in
> drivers/platform/x86/intel/int3472/discrete.c, add the two marked lines
> to the regulator arm of the switch:
> 
> 	case INT3472_GPIO_TYPE_POWER_ENABLE:
> 		second_sensor = int3472->quirks.avdd_second_sensor;
> 		fallthrough;
> 	case INT3472_GPIO_TYPE_DOVDD:
> 	case INT3472_GPIO_TYPE_HANDSHAKE:
> +		if (type == INT3472_GPIO_TYPE_HANDSHAKE)
> +			second_sensor = "i2c-OVTI02C1:00";	/* test */
> 		ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
> 						     con_id, second_sensor);
> 
> This adds OVTI02C1:00 as a second consumer of DSC0's dvdd alongside the
> existing HIMX1092:00 mapping; it does not move the rail off the IR
> camera. The hardcoded string makes this test-only (it would mis-key on
> any other handshake board); the shipped form is the DMI-gated quirk
> above. The hunk applies to a recent mainline discrete.c, where the
> HANDSHAKE case shares the register_regulator call via the POWER_ENABLE
> fallthrough, so build from a source tree matching your running kernel.
> First confirm int3472 is a module, not built in:
> 
> 	modinfo intel_skl_int3472_discrete
> 	# or check CONFIG_INTEL_SKL_INT3472 in your kernel config
> 
> If it is =y you need a full kernel build instead. If =m, build and
> install just this module, then reboot for a clean re-probe:
> 
> 	make -C /lib/modules/$(uname -r)/build \
> 	     M=$PWD/drivers/platform/x86/intel/int3472 modules
> 	sudo make -C /lib/modules/$(uname -r)/build \
> 	     M=$PWD/drivers/platform/x86/intel/int3472 modules_install
> 	sudo depmod -a
> 	sudo reboot
> 
> (Build against the configured source for your running kernel, or the
> new .ko may refuse to load on a modversions/CRC mismatch.) After
> reboot, in /sys/kernel/debug/regulator/regulator_summary the
> INT3472:0c-dvdd line should now list the i2c-OVTI02C1:00 device as a
> consumer (use count > 0), and dmesg shows whether 0x300a now succeeds.
> 
> Option B, no rebuild, force the rail on by hand. On this board DSC0's
> _DSM exposes only func 2 (the dvdd handshake) and func 3 (the IR-flood
> strobe), so unbinding it drops exactly those two and nothing the
> OV02C10 needs. dvdd is a GPIO-gated regulator, so as root:
> 
> 	# 1. BEFORE unbinding, capture the dvdd enable line: int3472
> 	#    requests it with consumer label "dvdd", so in gpioinfo find
> 	#    the line whose consumer is "dvdd" and note its gpiochip (the
> 	#    block header) and offset. The label disappears once you
> 	#    unbind, so record chip+offset now. Your int3472 dyndbg log
> 	#    cross-checks it:
> 	#      "INT3472:0c: dvdd <acpi-gpio-path> pin <N> active-<high|low>"
> 	#    (that line gives the ACPI controller path and pin, not the
> 	#    gpiochip number, so map it through gpioinfo). Note the
> 	#    active- sense too, you need it in step 3:
> 	gpioinfo
> 
> 	# 2. release the line by unbinding the PMIC (drops only DSC0's
> 	#    dvdd regulator and IR strobe, not the sensor, which _DEPs
> 	#    DSC1):
> 	echo INT3472:0c > /sys/bus/platform/drivers/int3472-discrete/unbind
> 
> 	# 3. drive the line to its ON level and HOLD it (own shell, leave
> 	#    running). ON is =1 if step 1 showed active-high, =0 if
> 	#    active-low. Using the gpiochip and offset from step 1:
> 	#    libgpiod v1:  gpioset --mode=signal gpiochipN <offset>=<on>
> 	#    libgpiod v2:  gpioset -c gpiochipN <offset>=<on>  (holds until Ctrl-C)
> 	gpioset --mode=signal gpiochipN <offset>=<on>
> 
> 	# 4. in another shell, re-probe the sensor and read the log:
> 	echo i2c-OVTI02C1:00 > /sys/bus/i2c/drivers/ov02c10/bind
> 	dmesg | tail
> 
> 	# 5. when done, Ctrl-C the gpioset and reboot to restore normal
> 	#    driver state.
> 
> (If step 4 says the device is already bound, unbind it first via the
> same path, then bind.) regulator_get("dvdd") lands on a dummy here,
> since there is no provider once DSC0 is unbound, but that is a no-op
> enable and the rail is physically on because you are holding the GPIO
> at its ON level, so the chip-ID read is still the signal.
> 
> Either way: if 0x300a succeeds, that pins powering dvdd as what
> unblocks the chip-ID read, and the fix is exactly Option A folded into
> a DA16250 DMI quirk. If it still fails, dvdd is not the (only) problem
> and the -EREMOTEIO is coming from reset, clock, or the NX33 bridge, and
> we look there instead. Option A is the better single test, since it
> keeps DSC0 bound and exercises the real enable path with the right
> polarity and timing; Option B trades that for no rebuild, so if the two
> disagree, trust A.
> 
> Thanks,
> Marco

