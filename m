Return-Path: <linux-media+bounces-64795-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V2hGIsW6LmrS2AQAu9opvQ
	(envelope-from <linux-media+bounces-64795-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:29:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8C1681473
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:29:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FmCDtxWy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64795-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64795-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5E62300D690
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 14:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4413C584B;
	Sun, 14 Jun 2026 14:29:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7548239D3C0
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 14:29:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781447355; cv=none; b=hTbVx32LvtFXlscgedNCq7et/DVGB462HNi15qIqk+2dfgI6eD4VD09qdQXTE431q/OIoODvzeuEzY2s8dZsk/7l+LG6daRMGTWZmSwAf5b6inZyR7h19ZgU2BOB486MPiYswNSw6qg0AuiVU1gHEotTE7/iRgv2Cq3pKqvbL0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781447355; c=relaxed/simple;
	bh=tEVx64nm/3zi6kSwBnsD3arA30V9yGMYCcBOwi8wblQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9wuXgBJAx81MCN+ZvLZ9HrZpwRooh76zMYZN7xAHdq9QIzaSZhzI18/U8FSIu6Rz0XgckXTNw1z+JSF+NGK3ZiklGYTIlrlH8HWeVCMjkaxcOOtYyMzt8cZcQdo8WcgOvIeN3Bfy6CnMHFdInZ3HdeAn+QC2lByS9mtno5VfwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmCDtxWy; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490be03d47bso25132345e9.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781447352; x=1782052152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HKdt1hpN3kONaCMNUBJ8wbaTh7eDMk+qZFrnfVPrZQ=;
        b=FmCDtxWyaoDSi/iGptV0B6M6NUMirLrpmbdz8BGfmnKkTNECKVnqDGm8SQvXZkC4hK
         8PRD4n7Sr/fDTCoaSZq3sWRVizejcRumy3BLXYHSU2dfbh4e76+Dn3rQVVmLDmWXI7bk
         tgpKojYAWi1PgVXTblEnnO4lEHIMtKFYG0oxfP57HwnCLEiwBhxcXLmOA/9UznoAmdQm
         ACQ6GTpCsqaZWQe06Y8sslrra6Sx/aolPoL8BbJwSU9tNkyehiKiIIQDJ1bRXNI78XK4
         pbnu5Ey6kYilsjxiyXT+h5kpRr8f695sCzx4h4OpzmOh8+4hH/WwLOBjNAjzzKqdjI1Z
         OTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781447352; x=1782052152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HKdt1hpN3kONaCMNUBJ8wbaTh7eDMk+qZFrnfVPrZQ=;
        b=Me7tZZd+R4aoPyW/9PCN0qVlYJfWq94lRrnmLX8UW1ZoLHHO8qHD8EMoY/YcCwGONu
         ZAez0VpOZNXnt+iuIEqL7D0kJVIa/fknvFMDkS1vezTVlrGEkz26Xf0aLg3TRFEj+6iN
         UpOOVBG9Zy/uNC+8PEopLBHPNErlpuDPoMmj8sYrSBCQ9vImX6IsV8+dJWqumQUaO0X+
         KwsXyBKyouIraC73RoSbk/2JMaUSPKN/udHW2BAOMUg4um132kWIJPLI3vOE077V9oOc
         sSZwWdPmH2HR5IjwDKxKLBuKOhNNpK5zs5+2rRwudjwm0nJwhCpcw9QWVH4hmbaeNJIi
         ZUGA==
X-Forwarded-Encrypted: i=1; AFNElJ98cElE2szNmwhubfJ7FTfd2NJ1/efMcI98asU/bHu7HZnVd/3YoAddcMj28JIU72/5MT5VAL9eRyPwIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhDgQY81wU1hRm1zI/ejlq7i38O44wR5qyuQX6WrRVeuWlD5E
	QsGwdPnd7HUPmWEbrmKl+lcgE3j80f2ZhOV/BAK6URwDOGApf1qqDZGS
X-Gm-Gg: Acq92OGy9sIkqchygX/uGTpeNhBBe3CRYOCWcRJ7YjVGrjLy0W64MgWYyy5CO7U9H2J
	1EWE5bqdMtyffWc2Lsxv/lFO6lvGzoA9X7qJn4FicEBEYeWMHfterzl4n/nuB6WRbb1BtH/K566
	ptfDLnUBmnDXrQdYc7y1unNIFcwPb1X07ws4fYuVwK4nwvsNKrSu1hrnisyKrBVPdziGkiGiBi6
	X8xm8RNqGNl6JAJvZLOcbCY32SB/A/JHj9QuPMBlFYV9dYquAz9exAdYzWHhapXtrIYSdp0Kxgb
	hK+MAdtJfai7Vqv/YI03D+29b+1iKHbO3YALLbLxWYyc/BQy3A0+wNNlhUJNxQM9TQRGvNdjBJf
	HxABoIsEgbabVTaR6xHMp6Ivy4q+pDCowSHcm3D99LAR+HlDoQql5t6IQQLi5BUK5NjMo4F8PmM
	sWQgG/4p/mewhrzCy0idvTO0K6pXBr962bvdA=
X-Received: by 2002:a05:600d:8489:20b0:490:b724:507d with SMTP id 5b1f17b1804b1-490ec4cec11mr96194135e9.11.1781447351472;
        Sun, 14 Jun 2026 07:29:11 -0700 (PDT)
Received: from [192.168.7.105] ([83.136.105.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922033dd3esm160728655e9.8.2026.06.14.07.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 07:29:10 -0700 (PDT)
Message-ID: <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
Date: Sun, 14 Jun 2026 16:29:09 +0200
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
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
Content-Language: it
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
In-Reply-To: <ai2NAS5EnLaLoN2W@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64795-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,vger.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[angiolisamuele@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mnencia@kcore.it,m:linux-media@vger.kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:sakari.ailus@linux.intel.com,m:israel.a.cepeda.lopez@intel.com,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angiolisamuele@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A8C1681473

Hi Marco,

Topology confirmed, and it's the "firmware mismatch" case. In short:

- The sensor (OVTI02C1:00) sits at \_SB.PC00.LNK1 and depends on DSC1,
   exactly as the _DEP decode showed. DSC0 is instead the link-0 PMIC,
   whose sensor is the Himax HM1092 IR camera (HIMX1092:00, Windows
   Hello).

- DSC0 = INT3472:0c, DSC1 = INT3472:01.

- The clincher is the regulator_summary: the only dvdd on the whole
   platform is INT3472:0c-dvdd (DSC0), and it's orphaned (use=0). DSC1,
   which the RGB sensor actually depends on, exposes no dvdd at all --
   only avdd/dovdd/reset.

regulator_summary (the only two top-level regulators; all
regulator-dummy children are SoundWire audio rails, elided for brevity):

    regulator                 use open bypass  opmode voltage ...
   ------------------------------------------------------------------
    regulator-dummy            19   27      0  unknown    0mV  ...
       [ ~30 sdw:* / cs42l43 / spi0.0 audio rails -- elided ]
    INT3472:0c-dvdd             0    0      0  unknown    0mV  ...

   No INT3472:01-* (DSC1) entry: DSC1 registers no dvdd.

Direct kernel confirmation, the "Sensor name" line from DSC0's probe:

   [    6.301445] int3472-discrete INT3472:0c: Sensor name HIMX1092:00

i.e. DSC0 keys its dvdd to the link-0 IR camera (HIMX1092:00), not to
the OV02C10. So there is exactly one dvdd handshake and it's on the
wrong side: it lives on DSC0/link-0, while the RGB sensor is on
link-1/DSC1, and nothing connects the two. DSC0's reverse-_DEP resolves
to HIMX1092:00, the dvdd supply_map is keyed there, and i2c-OVTI02C1:00
never matches -> dummy -> rail down -> 0x300a -EREMOTEIO.


Thanks,
Samuele

Il 13/06/26 19:01, Marco Nenciarini ha scritto:
> Hi Samuele,
> 
> No problem on the timing, and thanks. The regulator_summary plus the
> _DEP decode settle it, and they confirm the multi-instance hypothesis
> from my last mail rather than the missing-map one.
> 
> One correction on the code side first, because it matters for the fix.
> The handshake path is not missing the consumer-map step. HANDSHAKE
> (type 0x12) and POWER_ENABLE (0x0b) fall through to the same call site
> in skl_int3472_handle_gpio_resources(), so both go through
> skl_int3472_register_regulator(), which plants supply_map[] (dev_name +
> supply, lower- and upper-case) the same way for either type. That has
> been the case since v6.16 (c5d039327204, "int3472: Add handshake pin
> support"), so your 7.0.10 kernel has it. The dvdd map does get created.
> The problem is the dev_name it is keyed on.
> 
> That dev_name is int3472->sensor_name, and sensor_name is
> "i2c-" + acpi_dev_name(acpi_dev_get_next_consumer_dev(adev)), i.e. the
> first device that lists the registering INT3472 instance in its _DEP.
> Here that instance is INT3472:0c = DSC0 (the regulator name in your
> summary, "INT3472:0c-dvdd", is built from acpi_dev_name(adev), so the
> provider is unambiguously DSC0). But your _DEP decode shows the sensor
> (LNK1) depends on DSC1, never on DSC0: ARLP -> {CVSS, HS09.VIC1},
> non-ARLP -> {DSC1, HS09.VIC1}. So DSC0's reverse-_DEP walk does not
> return OVTI02C1. It returns whatever else declares a _DEP on DSC0
> (plausibly the IR-flood side, given func 3 sits on the same device),
> the dvdd map is keyed to that name, and the sensor's
> regulator_get("dvdd") for "i2c-OVTI02C1:00" never matches. -ENODEV,
> permanent dummy under full constraints (the legacy ACPI dev_name path
> has no "coming later" signal, so it is a dummy, not -EPROBE_DEFER),
> rail stays down, 0x300a reads -EREMOTEIO, no retry. That is exactly the
> regulator_summary you captured: INT3472:0c-dvdd registered, use=0.
> 
> Note this is specific to dvdd. DSC0's _DSM only exposes the dvdd
> handshake (func 2) and the IR-flood strobe (func 3); it does not
> provide avdd or dovdd. The sensor correctly _DEPs on DSC1 and is served
> by DSC1 for the rails and resets DSC1 owns, which is why it gets far
> enough to attempt the chip-ID read at all. dvdd is the one rail
> stranded on an instance the sensor does not depend on. (avdd and dovdd
> landing on dummies is most likely the always-on-rail case I mentioned
> before, benign, unless you can see a gating GPIO for them on either
> instance.)
> 
> Timing is not the mechanism either way. Your own timestamps already
> show the sensor's get at 6.468 well after DSC0 bound at 6.135, and even
> a perfectly ordered probe would still miss, because the map is keyed to
> the wrong device, not registered late.
> 
> So this is a firmware _DEP-topology issue: dvdd is gated by DSC0, but
> the sensor is pointed at DSC1, and nothing connects the two. Could you
> confirm the two halves of that, so we are not inferring DSC0's consumer:
> 
>    - with int3472 dynamic debug on
>      (dyndbg="module intel_skl_int3472_discrete +p"), the "Sensor name
>      %s" line from DSC0's probe shows which device its consumer walk
>      actually resolved to. If that is not OVTI02C1:00, it nails the
>      keying;
>    - the reverse _DEP, i.e. which device(s) list \_SB.PC00.DSC0 in their
>      own _DEP (a grep of the DSDT _DEP packages). DSC0 bound rather than
>      failing with "INT3472 seems to have no dependents", so something
>      does depend on it; identifying it tells us where dvdd actually went.
> 
> Hans, Sakari, once that "Sensor name" line confirms DSC0 is keying its
> dvdd to a non-sensor consumer, the open int3472 question becomes whether
> this is a firmware defect to push back on or something we work around
> in-tree (and if in-tree, a per-board quirk vs. generic cross-instance
> keying). Worth noting the EPROBE_DEFER idea from last time does not
> apply: the map is keyed to the wrong device, not merely registered late.
> Let's nail the topology first.
> 
> Thanks,
> Marco

