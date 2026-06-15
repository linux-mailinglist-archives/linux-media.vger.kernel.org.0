Return-Path: <linux-media+bounces-64909-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y2rSNoP3L2rWKQUAu9opvQ
	(envelope-from <linux-media+bounces-64909-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:00:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A39C6867B5
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:00:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=g9fkk10N;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64909-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64909-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C94B7300BBB4
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 13:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E493F39E7;
	Mon, 15 Jun 2026 13:00:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64813F1ADE
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 13:00:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528444; cv=none; b=HK03Tcu+gE91IKxnHAWHtIT//D1OSc8IxI7e6qUQDyLAHuCJpzEuDnzEiSvH9k3pHuIS20JyZ/hXLv7HmM9ETOtrmEVOQ+WomLohRgVviJAnOzSv4Lx4sp/Nezv6f3RTPojHXRNgRjctLUXLOH2okd27wM8HswLsoHuQXfHlyds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528444; c=relaxed/simple;
	bh=qs5C18/+H9AyHtb/11GGHII5EWG39bujftbaDo2RJy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1ypHFSBbR+ELxSM4TuqHA6C7iYUZKZ+Yw8+yLMJaZ7qrrfCzX7MXjU4XbIxkU/6OMs1Ni1EcbgeW6tdq5Y+hqfvcmUNO3eJWTq9KBddVfWQrUO9OKgs4ll7r/3flK/io++26kmD1ob9yua0iNdd6dgMnn+3eKFSSU6uakaF6xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9fkk10N; arc=none smtp.client-ip=209.85.208.43
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so6635789a12.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781528441; x=1782133241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gv18xf2jcQ1AQAQKKfrWvkQrEUmUuEzoWqcmaBrax9A=;
        b=g9fkk10NkzZmWNlxcwpA+gB+mfxWAYAaYawpzpunmqb2qrN3HZ59HKFrQE3j0mW/IM
         4u7T6koeLnqi32YpQyAjKhHcedIRqW86Tumj1ivBMWaRQ+ofnzfJpWW3Kesuw08Cjuh1
         nSvGStgfgshJC2hprjELrggLWdGkBAdsn8sqT10Zi5XdfUvt5AoB9snlSt+Xf3b6/18D
         2rkTpX9cVys3E9r1hOmmDRpVYvcBoiidR0K0P+1fmfAfsvT4oTV96u0Tvvivm4IHvSoc
         gV5x5YAu2CWreF/V9o8l0QuY/QRTyzIjj7U+0ft7TB6HHSdkUA16efDTHYF6qk083Nog
         zLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528441; x=1782133241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv18xf2jcQ1AQAQKKfrWvkQrEUmUuEzoWqcmaBrax9A=;
        b=lgDJFNZZeLJFilNbTg4jrZqI1Cj3N2xF0zKwJWrj1z/dm+xnCxO+x5R0D5yHzLiHOb
         Nn8NawB21uRDtZPheSkK+2B7yoQThodS1KDT0hZJbbEoYcG03HSFAY42UMnW59Zx4lpG
         MXI1uQhAxD1+4sqVCecVbeLnoPDIpf2I1H69q5iclD+c2M88IX+R/vCVynn17+FV4+QR
         Ysz9CF5IneD0+jjrp8lXgu6P4tAYvVGBpVX7G0CHEFT9Dd2OwtKajDM+q6Kw2cH00lzr
         MzNSVg7vnFEEzYzc+9A+UoKZH/XOrX5bgu3hIpQPzoI3+UeSJR5QWkQwhC8kp0aOaTB+
         AB+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8LwsWyXKfyG4vK2oTGIRssDhKmuCf7pKO92sMfUwOJWelXHLpKoGU3ZJd9xZT0Aaqys1Ttz5Pm3rQjkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/zYnr+9ybcApLIpBFEFenaGsn1UP1l8keUVJjUAC9FmJFzkxT
	kipsAvqNyuLs66bf6HcIfijBC1JH1x1vHnD6jJDNiAPfkG0eI3anLvaY
X-Gm-Gg: Acq92OHtjVidzJ516cOqUnyhghL33ZMklzumX3FD2k2sN1dcxtran/UFJ8+Y3AhoaSz
	uYr2MfwBPecBr8d6KbTB6mhg+MJ5gtSLnvCKFjxnHmHR61F6rV5NeE8I371KVcl0uj7YCPtpf28
	nEq9wSVvBZVIjpRpKvcSEa6bSwPB28M7Jxr6cgX6r4/zLAs/0cnWmnq7ssRrq3U9voRFFO31RNn
	IdDhb6nu963cJ3/HjVmWPUvbwMppmMPvCBzYiT13Xk1BbDQwxNgZBp5qInKQp/3PmL2F9NDkjGp
	+9WMqiMa3x9iJ3HYAgcIl1f6gnY0Z1Fb5g1wra0NW6r21c78Ffgnk8ubH3+H6qaVybauvCdg49j
	2LomnelWYJSUiI2LuVgVbztzn1mvttva17ekwOwXFgdFd47yKOgr3Vh1I7+dflWDaQOCzacW07r
	NZ7/bsrxTgOLL4FINcHFaw68LCxm16FMPs7Q==
X-Received: by 2002:a17:907:e101:b0:bfe:f92a:cb3c with SMTP id a640c23a62f3a-bfef92ad4camr310572866b.14.1781528440825;
        Mon, 15 Jun 2026 06:00:40 -0700 (PDT)
Received: from [192.168.8.19] ([83.136.105.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb9113103sm473479466b.63.2026.06.15.06.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 06:00:40 -0700 (PDT)
Message-ID: <dee36707-3fc9-486e-b18b-d6a246edb67c@gmail.com>
Date: Mon, 15 Jun 2026 15:00:38 +0200
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
 <396e4b0d-7a2c-4ba4-9569-0428ccd63267@gmail.com>
 <ai_TEj-_ije1XgYF@spark.kcore.it>
Content-Language: it
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
In-Reply-To: <ai_TEj-_ije1XgYF@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64909-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A39C6867B5

Marco,

The _STA read settles it, and not in our favour. Full int3472 _STA dump:

   INT3472:0c  \_SB.PC00.DSC0   status=15
   everything else (DSC1-5, LTH0-5, CLP0-5, and INT3472:00 = the I2C2
   TPS68470) status=0

So DSC0 is the only live INT3472 on the platform. DSC1's _STA is

   Method (_STA) { If (CL01) { If (C1TP == 1) Return(0x0F) }  Return(0) }

identical in shape to DSC0's (CL00 / C0TP==1, which is why DSC0 is 
live).CL01 and C1TP are NVS OperationRegion fields (8-bit, defined in 
the DSDT NVS block) that are only ever *read* in the ASL -- never 
assigned, and not inside any _OSI branch. The only _OSI use in the 
tables is the standard OS-version detection; it does not feed the camera 
gating. So this is a BIOS/NVS camera-config gate, not OS-gated: acpi_osi 
spoofing can't flip it.

C1TP is also the field CDEP keys on (==1 -> DSCn, ==5 -> LTHn, >1 -> 
CLPn), and with DSC1/LTH1/CLP1 all _STA=0, camera 1 (the OV02C10) has no 
live PMIC instance at all. And even if DSC1 were on, its _DSM only 
exposes func 0x12 (dvdd handshake) + func 0x0D (privacy LED) -- no 
avdd/dovdd/reset/clock.
DSC0's is the same shape (dvdd + 0x02 strobe). So none of the discrete
instances ever carried the sensor's avdd/dovdd/reset/clock; those come 
from a path that is entirely _STA=0 here.

The factory Windows install runs the RGB camera fine, so the hardware is
present -- Windows just powers it through its IPU6/PMIC stack, 
independent of these _STA-gated INT3472 devices. Linux's int3472/ov02c10 
path depends on them, and the DA16250 firmware leaves the whole RGB-side 
PMIC topology _STA=0 in NVS.

Conclusion: the second_sensor dvdd quirk is correct and worth landing 
for boards where the relevant DSC is enabled, but it cannot bring this 
camera up. The OV02C10's avdd/dovdd/reset/clock have no live provider to 
re-key to, and the disable is a firmware NVS config, not something the 
kernel can satisfy. Short of Dell enabling the RGB PMIC instances in 
firmware, the only in-tree path would be a full DA16250-specific quirk 
that hardcodes fixed regulators for avdd/dovdd and sources reset/clock 
directly -- which needs the board schematic and only works if those 
rails are actually software-controllable. I suspect that's not worth it 
for one SKU; this looks like a Dell firmware bug to report upstream to them.

Thanks for walking through it -- happy to file the dvdd second_sensor
quirk on its own if you still want it in for the general case.

Thanks,
Samuele

Il 15/06/26 12:25, Marco Nenciarini ha scritto:
> Samuele,
> 
> Thanks. The dvdd re-key worked (post-patch ov02c10 only logs "not
> found" for dovdd/avdd, not dvdd, so it did attach to DSC0's dvdd), but
> as you found it can't bring the sensor up: the rails it still needs
> (avdd, dovdd, its reset GPIO and clock) would have come from DSC1, and
> DSC1 is _STA=0, so nothing live provides them.
> 
> So before any kernel change is worth considering, the question is
> whether DSC1 is off by firmware design. _STA=0 is what you get from a
> device that is BIOS-disabled, OS-gated, or simply not fitted on this
> SKU, and the asymmetry fits: DSC0 (the IR camera) is live, only DSC1
> (the RGB sensor) is dead. If DSC1 is meant to be off here, there is
> nothing for int3472 to fix and no quirk worth writing, so I'd rather
> confirm that than build around it.
> 
> The way to tell is to read DSC1's _STA from the firmware tables.
> acpidump's multi-table dump won't feed iasl -d directly, so read the
> raw tables from sysfs:
> 
>      cp /sys/firmware/acpi/tables/DSDT dsdt.dat
>      cp /sys/firmware/acpi/tables/SSDT* .
>      iasl -d dsdt.dat SSDT*
> 
> then grep the *.dsl for DSC1 (the DSC blocks often live in an SSDT, not
> the DSDT) and read its _STA. If it returns a flat zero, or gates on
> _OSI("Windows ..."), or reads a manufacturing/setup variable, the
> sensor is disabled by firmware and that is the end of the kernel angle.
> If instead it depends on something a live instance could satisfy, then
> there's a kernel path worth pursuing and we look again.
> 
> If you still have the factory Windows install, whether the RGB camera
> works there is a useful cross-check (works in Windows means gated, not
> absent), but the _STA read is the real signal.
> 
> Thanks,
> Marco

