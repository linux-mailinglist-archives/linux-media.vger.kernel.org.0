Return-Path: <linux-media+bounces-64710-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lyrxCGYvLGqgNAQAu9opvQ
	(envelope-from <linux-media+bounces-64710-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:10:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 714BC67ABD7
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 18:10:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HqH19ZWE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64710-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64710-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E01B93136BA5
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391AE38D3EC;
	Fri, 12 Jun 2026 16:09:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402D13815D0
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 16:09:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781280558; cv=none; b=W3VZL0C/PIHFn0xFuovJSydF5w36aBanHhFhjnVKRBOEAY2WrYe4DGk/H1GVwMODMv7JEQiwY1Ul5bhDVX3ZsQ8azRwpZGBQYj8a3vVydM3fCFvjGj7euj8M9Kbp8GFTof3NDRxf4/ecDVNK3xQq0PPhkGlSLro8q0RxL6Yui8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781280558; c=relaxed/simple;
	bh=RbBeA3Jn7niNgOpWtB7+9g3+8zYlm1NeSY1IFU1kOnY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=TCWEQuSzllYjcQiECJW2FNcCro2NciunpKvb5xwqqe5qgeC+UkhGGvrPnB8n3OT45j5J7SW7EmT2xfIOK8lEbrOtKMq13qo3PTQhrGdrWDjvsXaCdM+emSxb8R8ULAkSIBQCz9Br4dix1w4asL84d1OuT2IJCpVEBRCZvCUE75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqH19ZWE; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490be03d47bso12182875e9.0
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781280555; x=1781885355; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErGVOteyohubHRmnUMFA8FzkNIZDVINuasMCH11Kpt0=;
        b=HqH19ZWEsLqiS6z67490+sl9jAYV8EHvf+dovRi4xhm8eGajd4FXJohv5sTPDKHDGw
         33ax/IuWDKcOh069mi4qRvfBEKshK43JRfG5bU4k6Q6su1e0JFaXUVyb29H2eBMTHhKy
         sAAVcbK9CaFJneykGwRjLljRWRidxxHp/Vq1BQgFnGv+mNkWYwazdun8wDYMHlajc/YF
         IMSbd5ie+HrSpm/ASbYd4Os4nA8HgZKEPbAw7wbTTk88omYxULKCP5wfM/Dnwr08KMST
         c9UpFm96CcbWkzAZfAWXMZiJgk2QjoaSoW71UaIbVI5xYbsxfO/Lc7YPjvjrWipJR02w
         SKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781280555; x=1781885355;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ErGVOteyohubHRmnUMFA8FzkNIZDVINuasMCH11Kpt0=;
        b=fxnYIF8kMMvyrluevaT9mXnbh9dCWokt/HBSPCwJ+rDyd/1jxBTOVMLiIMD0cyoRHF
         vhvVjkl8KMOH/J3SOycVRm/V1vkU6dLnfVXIh1/Lvo4kXIO+IKD0V+egcjCDQ6Z+AltH
         miO/U5+m8OPGq1rbhmLWEM4Detjczugu93Wj+AeSHKWzcPGZ07XNCBy4/Z6LI8whd+xJ
         8BgTpCGoivjAErb6YaQO3vCF+huhSbAmQuPP5p2T3bv+zxAnRczj9ExEBqQRyRfRYTVd
         DoFDPW5DfpdQBf9avNZLhDpq6t4uBOOPGIDgXhSYuwlm7Imp78XR4Ezow2cuH2a1Cbnc
         /hdA==
X-Forwarded-Encrypted: i=1; AFNElJ+XKAIglvmC/J6rodhZkhTHCS08rEJPiBNe3Prp/ORW25v4hWN47YPaE2gy58KWYtygusOAxPM9/DwLsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2MRGjW9HpPHnuTOksbDsgPQB8Xv4UFQxlR1KCV4tYauHoqmt
	ZOvHprqkFibOil/u+mG5mHU0fxB3fizsD5ZuALQi7JtUP0G+liqVgZD2
X-Gm-Gg: Acq92OHroQ3t5YghcugefafO8RnOGfiKiMMEsN9yidgRHn9QN05zbYO+tWFPOX9NMor
	eo/P8xPlxgaFFL+Uyxm2ZlUL3sbF3Chy+7lBiYb3IBFvWXwOqLleOR+ySfUcZwauAPwe3W9QdFm
	1Ijkq36djkzBxM+/fkPCR8fM6IsUASaYj9/4u0TjyCCunFa6R2BLqwFYUpqurAT00kW6JmA2bw8
	t0woXxRoxcUyXEzPn+bYv8KAr6f8Pl3WJguDM4UWMLPFwsBaKRV0TQMrXI3EhBDAHvCRZP1zGar
	Z/vSmM7cf/Lk26sDfO6BzPG5p1sv2EoprCoC/6jNIsIy4xXjVPUnEi0DsDyP8BYoAp5//8Z0IhA
	Bo0wannaVRcM6PlgVO/gE/eWFVBNljD05HYcM9e68pinXesULk+8W+vCwVP6gJZTxBEGUW2w6WM
	Y6x0YFB+MqiW10j4tnRRAyx6NGsrcEtflni0kCwzIjFgUT
X-Received: by 2002:a05:600c:214e:b0:490:e180:2ed with SMTP id 5b1f17b1804b1-490ec4bfe4cmr28794465e9.4.1781280554325;
        Fri, 12 Jun 2026 09:09:14 -0700 (PDT)
Received: from [192.168.8.19] ([83.136.105.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c51dsm56895895e9.1.2026.06.12.09.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 09:09:13 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------e6cq9Sj0wcvRScxoILT6o4I4"
Message-ID: <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
Date: Fri, 12 Jun 2026 18:09:11 +0200
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
Content-Language: it
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
In-Reply-To: <ah_XLEAkqjV9HkSE@spark.kcore.it>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.06 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-dsl];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64710-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mnencia@kcore.it,m:linux-media@vger.kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:sakari.ailus@linux.intel.com,m:israel.a.cepeda.lopez@intel.com,m:linux-kernel@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[angiolisamuele@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+,5:+];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ATTACHMENT(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angiolisamuele@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 714BC67ABD7

This is a multi-part message in MIME format.
--------------e6cq9Sj0wcvRScxoILT6o4I4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

Sorry for the slow reply - I was away from the office until the 10th.

regulator_summary settles it - this is a missing consumer map, not an
ordering race.

INT3472:0c = \_SB.PC00.DSC0. Its _DEP is only the bridge gpiochip:

   Name (_DEP, Package (){ ^XHCI.RHUB.HS09.VGPO })

so it defers ~28 times (t=5.816..6.127) until INTC10B2:00 appears
(t=6.135), then binds. Its _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f),
decoded with TYPE=[7:0], PIN=[15:8], SENSOR_ON=[31:24]:

   func 2 -> 0x01000112  type 0x12 (handshake), pin 1, on=1  -> dvdd
   func 3 -> 0x01000002  type 0x02 (strobe),    pin 0, on=1  -> IR flood

The dvdd GPIO (func 2) is handled before the strobe (func 3), so it is
already processed by the time the "GPIO type 0x02 unknown" warning
fires at t=6.143.

regulator_summary shows the result:

   INT3472:0c-dvdd    0   0   0   unknown   0mV ...   (use=0 open=0)

The dvdd regulator IS registered, but with zero consumers - no supply
map to i2c-OVTI02C1:00 was ever created. So when ov02c10 probes at
t=6.468 (0.32s AFTER INT3472:0c bound and after the dvdd GPIO was
handled), regulator_get(dvdd) returns -ENODEV regardless of timing:

   [6.468] ov02c10 i2c-OVTI02C1:00: supply dvdd not found, using dummy 
regulator
   [6.471] ov02c10 i2c-OVTI02C1:00: Error reading reg 0x300a: -121
   [6.471] ov02c10 ... probe with driver ov02c10 failed with error -121

The dummy enable is a no-op, the rail stays down, the 0x300a read
fails -EREMOTEIO, and that hard error is never retried.

This means the handshake-derived regulator path registers the provider
without planting the consumer supply map the way the GPIO power-enable
path does in skl_int3472_register_regulator(). Adding that map
(dev_name "i2c-OVTI02C1:00", supply "dvdd") for the handshake type
should be enough; an -EPROBE_DEFER "supply coming later" signal would
not help here since the map is never created at all.

For completeness on the ordering side: LNK1's _DEP never references
DSC0 in any branch (ARLP -> {CVSS, HS09.VIC1}; non-ARLP -> {DSC1,
HS09.VIC1}), so there is also no serialization between DSC0 and the
sensor - but that is moot given the map is absent.

Tested on 7.0.10-1-MANJARO. Attached: decompiled
LNK1/DSC0 blocks, timestamped dmesg, and regulator_summary. Full 
acpidump available on request (zip 1Mb).

Thanks,
Samuele

Il 03/06/26 09:26, Marco Nenciarini ha scritto:
> Hi Samuele,
> 
> Thanks for the thorough report, the dmesg and the detail you included
> made this easy to trace.
> 
> Both of your hypotheses turn out not to be the mechanism. The naming is
> fine and the fwnode path is not shadowing anything. The dummy dvdd in
> your log is real and is the key clue, but the interesting question is
> how the sensor reached a regulator_get for dvdd at all.
> 
>> (a) fwnode/of-based supply matching in the regulator core now takes
>> precedence over the legacy dev_name-based supply_map lookups
> 
> It does not shadow it. regulator_dev_lookup() tries the DT/fwnode path
> first, but regulator_dt_lookup() only does anything when
> dev_of_node(dev) is non-NULL. On ACPI there is no of_node, so it
> returns NULL and the function falls through to the legacy
> regulator_map_list walk. A software_node sensor with no regulator
> phandle is therefore fine, provided the map entry exists at lookup
> time.
> 
>> (b) The sensor i2c_client created via ipu-bridge has a slightly
>> different dev_name
> 
> It does not. int3472->sensor_name is built as "i2c-" +
> acpi_dev_name(sensor), i.e. "i2c-OVTI02C1:00", and that exact string
> is planted into supply_map[].dev_name in
> skl_int3472_register_regulator(). ACPI-enumerated i2c clients are named
> the same way (dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev))),
> so the consumer dev_name is byte-identical. No mismatch.
> 
> What the log actually tells us. The line
> 
>    ov02c10 i2c-OVTI02C1:00: supply dvdd not found, using dummy regulator
> 
> is emitted from a single site in _regulator_get_common(), on the
> have_full_constraints() == true, NORMAL_GET path, and only after the
> dummy_regulator_rdev existence check. So it means precisely this: at
> the instant ov02c10 called devm_regulator_bulk_get(), the lookup for
> "i2c-OVTI02C1:00"/dvdd returned -ENODEV, i.e. no INT3472:0c-dvdd
> consumer map entry existed yet. int3472 publishes that map while
> registering the regulator, during its own probe, and its whole probe
> defers (the ~30 retries in your log) until the USB-IO bridge gpiochip
> appears, because the dvdd HANDSHAKE GPIO lives on that chip. So
> ov02c10 took a dummy dvdd before int3472 had registered the real one.
> Under NORMAL_GET with full constraints that dummy is permanent, the
> no-op enable leaves the rail unpowered, and the 0x300a read fails
> with -EREMOTEIO, a hard error that is not placed on the deferred-probe
> list and so is never retried when the real regulator appears later. It
> is also consistent with regulator_summary showing INT3472:0c-dvdd with
> no children after the fact.
> 
> (avdd and dovdd also fall back to dummies. If those rails are
> always-on in hardware that is probably benign. dvdd is the one
> INT3472:0c is meant to gate through the handshake pin, so that is the
> one that matters here.)
> 
> Here is the part that needs your input, because it should not be
> possible. INT3472 is in acpi_honor_dep_ids, so a sensor whose _DEP
> references the INT3472 device is held out of enumeration entirely
> (acpi_dev_ready_for_enumeration() returns false, the i2c client is not
> even created) until int3472 clears the dependency. int3472-discrete
> clears it with acpi_dev_clear_dependencies() as the last step of its
> probe, after int3472_discrete_parse_crs() has registered every
> regulator including dvdd. So in the normal flow, by the time OVTI02C1
> can be enumerated at all, the dvdd map is already published and the
> sensor binds the real rail. The fact that you got a dummy means that
> gate did not serialize them on this board.
> 
> The most likely explanation is that OVTI02C1's _DEP does not carry an
> honored dependency on the INT3472:0c instance that registers dvdd (or
> there is more than one INT3472 instance and the depended-on one is not
> the dvdd provider). To confirm, could you send:
> 
>    - the OVTI02C1 _DEP (an acpidump or DSDT extract), so we can see
>      whether INT3472:0c is actually listed;
>    - a dmesg with timestamps showing the order of the int3472-discrete
>      bind, the i2c-OVTI02C1:00 device creation, and the dummy-regulator
>      warning;
>    - the INT3472:0c _CRS plus the _DSM result for the GPIO at
>      \_SB.PC00.XHCI.RHUB.HS09.VGPO pin 1, as you offered.
> 
> Hans, Sakari, this is where I would like your read. If the _DEP on
> this board is indeed missing the INT3472:0c instance, is the right fix
> a board quirk, or is it worth giving the ACPI consumer path a "supply
> coming later" signal the way the DT path has one?
> of_regulator_dev_lookup() returns -EPROBE_DEFER when the phandle
> target is not registered yet; the legacy consumer_supplies/dev_name
> map has no equivalent, so once the _DEP gate is out of the picture
> there is nothing left to make the sensor wait.
> 
> Thanks,
> Marco
--------------e6cq9Sj0wcvRScxoILT6o4I4
Content-Type: text/plain; charset=UTF-8; name="02_dmesg-filtered.txt"
Content-Disposition: attachment; filename="02_dmesg-filtered.txt"
Content-Transfer-Encoding: base64

OTM4OlsgICAgNS43OTk4MThdIGludGVsLWlwdTYgMDAwMDowMDowNS4wOiBlbmFibGluZyBk
ZXZpY2UgKDAwMDAgLT4gMDAwMikKOTQyOlsgICAgNS44MTYyOTJdIGludDM0NzItZGlzY3Jl
dGUgSU5UMzQ3MjowYzogY2Fubm90IGZpbmQgR1BJTyBjaGlwIElOVEMxMEIyOjAwLCBkZWZl
cnJpbmcKOTQzOlsgICAgNS44MTY2NDZdIGludGVsLWlwdTYgMDAwMDowMDowNS4wOiBGb3Vu
ZCBzdXBwb3J0ZWQgc2Vuc29yIE9WVEkwMkMxOjAwCjk0NDpbICAgIDUuODE2NzE3XSBpbnRl
bC1pcHU2IDAwMDA6MDA6MDUuMDogQ29ubmVjdGVkIDEgY2FtZXJhcwo5NDY6WyAgICA1Ljgy
MTY1M10gaW50ZWwtaXB1NiAwMDAwOjAwOjA1LjA6IFNlbmRpbmcgQk9PVF9MT0FEIHRvIENT
RQo5NDg6WyAgICA1LjgzMTIyMl0gaW50MzQ3Mi1kaXNjcmV0ZSBJTlQzNDcyOjBjOiBjYW5u
b3QgZmluZCBHUElPIGNoaXAgSU5UQzEwQjI6MDAsIGRlZmVycmluZwo5NTE6WyAgICA1Ljgz
OTY2OV0gaW50MzQ3Mi1kaXNjcmV0ZSBJTlQzNDcyOjBjOiBjYW5ub3QgZmluZCBHUElPIGNo
aXAgSU5UQzEwQjI6MDAsIGRlZmVycmluZwo5NTY6WyAgICA1Ljg0ODcwNF0gaW50MzQ3Mi1k
aXNjcmV0ZSBJTlQzNDcyOjBjOiBjYW5ub3QgZmluZCBHUElPIGNoaXAgSU5UQzEwQjI6MDAs
IGRlZmVycmluZwo5NTg6WyAgICA1Ljg1NDU2OV0gaW50MzQ3Mi1kaXNjcmV0ZSBJTlQzNDcy
OjBjOiBjYW5ub3QgZmluZCBHUElPIGNoaXAgSU5UQzEwQjI6MDAsIGRlZmVycmluZwo5NTk6
WyAgICA1Ljg1ODA1N10gaW50ZWwtaXB1NiAwMDAwOjAwOjA1LjA6IFNlbmRpbmcgQVVUSEVO
VElDQVRFX1JVTiB0byBDU0UKOTYxOlsgICAgNS44Njc3MTFdIGludDM0NzItZGlzY3JldGUg
SU5UMzQ3MjowYzogY2Fubm90IGZpbmQgR1BJTyBjaGlwIElOVEMxMEIyOjAwLCBkZWZlcnJp
bmcKOTYyOlsgICAgNS44NjkzNTZdIGludDM0NzItZGlzY3JldGUgSU5UMzQ3MjowYzogY2Fu
bm90IGZpbmQgR1BJTyBjaGlwIElOVEMxMEIyOjAwLCBkZWZlcnJpbmcKOTYzOlsgICAgNS44
NzIzOTFdIGludDM0NzItZGlzY3JldGUgSU5UMzQ3MjowYzogY2Fubm90IGZpbmQgR1BJTyBj
aGlwIElOVEMxMEIyOjAwLCBkZWZlcnJpbmcKOTY0OlsgICAgNS44NzQ3NTNdIGludDM0NzIt
ZGlzY3JldGUgSU5UMzQ3MjowYzogY2Fubm90IGZpbmQgR1BJTyBjaGlwIElOVEMxMEIyOjAw
LCBkZWZlcnJpbmcKOTcyOlsgICAgNS44ODA5NzJdIGludDM0NzItZGlzY3JldGUgSU5UMzQ3
MjowYzogY2Fubm90IGZpbmQgR1BJTyBjaGlwIElOVEMxMEIyOjAwLCBkZWZlcnJpbmcKOTcz
OlsgICAgNS44ODE4NjRdIGludDM0NzItZGlzY3JldGUgSU5UMzQ3MjowYzogY2Fubm90IGZp
bmQgR1BJTyBjaGlwIElOVEMxMEIyOjAwLCBkZWZlcnJpbmcKOTc2OlsgICAgNS44ODU1MzZd
IGludDM0NzItZGlzY3JldGUgSU5UMzQ3MjowYzogY2Fubm90IGZpbmQgR1BJTyBjaGlwIElO
VEMxMEIyOjAwLCBkZWZlcnJpbmcKOTc4OlsgICAgNS45MDczOTNdIGludGVsLWlwdTYgMDAw
MDowMDowNS4wOiBDU0UgYXV0aGVudGljYXRlX3J1biBkb25lCjk3OTpbICAgIDUuOTA3NDAx
XSBpbnRlbC1pcHU2IDAwMDA6MDA6MDUuMDogSVBVNi12NFs3ZDE5XSBoYXJkd2FyZSB2ZXJz
aW9uIDYKOTgwOlsgICAgNS45MDgzOTldIGludDM0NzItZGlzY3JldGUgSU5UMzQ3MjowYzog
Y2Fubm90IGZpbmQgR1BJTyBjaGlwIElOVEMxMEIyOjAwLCBkZWZlcnJpbmcKOTk1OlsgICAg
NS45ODE3NjhdIGludDM0NzItZGlzY3JldGUgSU5UMzQ3MjowYzogY2Fubm90IGZpbmQgR1BJ
TyBjaGlwIElOVEMxMEIyOjAwLCBkZWZlcnJpbmcKOTk5OlsgICAgNi4wMTM2NDNdIGludDM0
NzItZGlzY3JldGUgSU5UMzQ3MjowYzogY2Fubm90IGZpbmQgR1BJTyBjaGlwIElOVEMxMEIy
OjAwLCBkZWZlcnJpbmcKMTAwMjpbICAgIDYuMDI4NDk0XSBpbnQzNDcyLWRpc2NyZXRlIElO
VDM0NzI6MGM6IGNhbm5vdCBmaW5kIEdQSU8gY2hpcCBJTlRDMTBCMjowMCwgZGVmZXJyaW5n
CjEwMDY6WyAgICA2LjAzMzcyNV0gaW50MzQ3Mi1kaXNjcmV0ZSBJTlQzNDcyOjBjOiBjYW5u
b3QgZmluZCBHUElPIGNoaXAgSU5UQzEwQjI6MDAsIGRlZmVycmluZwoxMDA4OlsgICAgNi4w
MzQxMTJdIHNwaS1ub3Igc3BpMC4wOiBzdXBwbHkgdmNjIG5vdCBmb3VuZCwgdXNpbmcgZHVt
bXkgcmVndWxhdG9yCjEwMTU6WyAgICA2LjA1NDIwOF0gaW50MzQ3Mi1kaXNjcmV0ZSBJTlQz
NDcyOjBjOiBjYW5ub3QgZmluZCBHUElPIGNoaXAgSU5UQzEwQjI6MDAsIGRlZmVycmluZwox
MDE5OlsgICAgNi4wNjA4NThdIGludDM0NzItZGlzY3JldGUgSU5UMzQ3MjowYzogY2Fubm90
IGZpbmQgR1BJTyBjaGlwIElOVEMxMEIyOjAwLCBkZWZlcnJpbmcKMTAyNDpbICAgIDYuMDY0
ODMxXSBpbnQzNDcyLWRpc2NyZXRlIElOVDM0NzI6MGM6IGNhbm5vdCBmaW5kIEdQSU8gY2hp
cCBJTlRDMTBCMjowMCwgZGVmZXJyaW5nCjEwNDA6WyAgICA2LjEyNzAyM10gaW50MzQ3Mi1k
aXNjcmV0ZSBJTlQzNDcyOjBjOiBjYW5ub3QgZmluZCBHUElPIGNoaXAgSU5UQzEwQjI6MDAs
IGRlZmVycmluZwoxMDQzOlsgICAgNi4xNDM2MjhdIGludDM0NzItZGlzY3JldGUgSU5UMzQ3
MjowYzogR1BJTyB0eXBlIDB4MDIgdW5rbm93bjsgdGhlIHNlbnNvciBtYXkgbm90IHdvcmsK
MTA2MzpbICAgIDYuNDY4NzY2XSBvdjAyYzEwIGkyYy1PVlRJMDJDMTowMDogc3VwcGx5IGRv
dmRkIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9yCjEwNjQ6WyAgICA2LjQ2OTI5
OV0gb3YwMmMxMCBpMmMtT1ZUSTAyQzE6MDA6IHN1cHBseSBhdmRkIG5vdCBmb3VuZCwgdXNp
bmcgZHVtbXkgcmVndWxhdG9yCjEwNjU6WyAgICA2LjQ2OTM5NF0gb3YwMmMxMCBpMmMtT1ZU
STAyQzE6MDA6IHN1cHBseSBkdmRkIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9y
CjEwNzE6WyAgICA2LjQ3MTIxNV0gb3YwMmMxMCBpMmMtT1ZUSTAyQzE6MDA6IEVycm9yIHJl
YWRpbmcgcmVnIDB4MzAwYTogLTEyMQoxMDcyOlsgICAgNi40NzEyMTddIG92MDJjMTAgaTJj
LU9WVEkwMkMxOjAwOiBmYWlsZWQgdG8gZmluZCBzZW5zb3I6IC0xMjEKMTA3MzpbICAgIDYu
NDcxMjkyXSBvdjAyYzEwIGkyYy1PVlRJMDJDMTowMDogcHJvYmUgd2l0aCBkcml2ZXIgb3Yw
MmMxMCBmYWlsZWQgd2l0aCBlcnJvciAtMTIxCjExMzM6WyAgICA2LjYyNzM4OV0gY3M0Mmw0
MyBzZHc6MDowOjAxZmE6NDI0MzowMTogc3VwcGx5IHZkZC1wIG5vdCBmb3VuZCwgdXNpbmcg
ZHVtbXkgcmVndWxhdG9yCjExMzQ6WyAgICA2LjYyNzQxNV0gY3M0Mmw0MyBzZHc6MDowOjAx
ZmE6NDI0MzowMTogc3VwcGx5IHZkZC1kIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxh
dG9yCjExMzU6WyAgICA2LjYyNzQxOV0gY3M0Mmw0MyBzZHc6MDowOjAxZmE6NDI0MzowMTog
c3VwcGx5IHZkZC1hIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9yCjExMzY6WyAg
ICA2LjYyNzQyMl0gY3M0Mmw0MyBzZHc6MDowOjAxZmE6NDI0MzowMTogc3VwcGx5IHZkZC1p
byBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgoxMTM3OlsgICAgNi42Mjc0MzFd
IGNzNDJsNDMgc2R3OjA6MDowMWZhOjQyNDM6MDE6IHN1cHBseSB2ZGQtY3Agbm90IGZvdW5k
LCB1c2luZyBkdW1teSByZWd1bGF0b3IKMTEzODpbICAgIDYuNjM4NDYwXSBjczM1bDU2IHNk
dzowOjI6MDFmYTozNTU2OjAxOjI6IHN1cHBseSBWRERfUCBub3QgZm91bmQsIHVzaW5nIGR1
bW15IHJlZ3VsYXRvcgoxMTM5OlsgICAgNi42Mzg0OTNdIGNzMzVsNTYgc2R3OjA6MjowMWZh
OjM1NTY6MDE6Mjogc3VwcGx5IFZERF9JTyBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3Vs
YXRvcgoxMTQwOlsgICAgNi42Mzg0OTldIGNzMzVsNTYgc2R3OjA6MjowMWZhOjM1NTY6MDE6
Mjogc3VwcGx5IFZERF9BIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9yCjExNDE6
WyAgICA2LjYzODkyNV0gY3MzNWw1NiBzZHc6MDoyOjAxZmE6MzU1NjowMTozOiBzdXBwbHkg
VkREX1Agbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IKMTE0MjpbICAgIDYuNjM4
OTQ2XSBjczM1bDU2IHNkdzowOjI6MDFmYTozNTU2OjAxOjM6IHN1cHBseSBWRERfSU8gbm90
IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IKMTE0MzpbICAgIDYuNjM4OTU0XSBjczM1
bDU2IHNkdzowOjI6MDFmYTozNTU2OjAxOjM6IHN1cHBseSBWRERfQSBub3QgZm91bmQsIHVz
aW5nIGR1bW15IHJlZ3VsYXRvcgoxMTQ0OlsgICAgNi42MzkyODRdIGNzMzVsNTYgc2R3OjA6
MzowMWZhOjM1NTY6MDE6MDogc3VwcGx5IFZERF9QIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkg
cmVndWxhdG9yCjExNDU6WyAgICA2LjYzOTMxN10gY3MzNWw1NiBzZHc6MDozOjAxZmE6MzU1
NjowMTowOiBzdXBwbHkgVkREX0lPIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9y
CjExNDY6WyAgICA2LjYzOTMyN10gY3MzNWw1NiBzZHc6MDozOjAxZmE6MzU1NjowMTowOiBz
dXBwbHkgVkREX0Egbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IKMTE0NzpbICAg
IDYuNjM5NjE3XSBjczM1bDU2IHNkdzowOjM6MDFmYTozNTU2OjAxOjE6IHN1cHBseSBWRERf
UCBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgoxMTQ4OlsgICAgNi42Mzk2Mzdd
IGNzMzVsNTYgc2R3OjA6MzowMWZhOjM1NTY6MDE6MTogc3VwcGx5IFZERF9JTyBub3QgZm91
bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgoxMTQ5OlsgICAgNi42Mzk2NDldIGNzMzVsNTYg
c2R3OjA6MzowMWZhOjM1NTY6MDE6MTogc3VwcGx5IFZERF9BIG5vdCBmb3VuZCwgdXNpbmcg
ZHVtbXkgcmVndWxhdG9yCjExNTc6WyAgICA2LjgxOTk5NV0gY3M0Mmw0My1jb2RlYyBjczQy
bDQzLWNvZGVjOiBzdXBwbHkgdmRkLWFtcCBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3Vs
YXRvcgoxMTYwOlsgICAgNi44MjE0ODFdIHNvZl9zZHcgc29mX3NkdzogQVNvQzogUGFyZW50
IGNhcmQgbm90IHlldCBhdmFpbGFibGUsIHdpZGdldCBjYXJkIGJpbmRpbmcgZGVmZXJyZWQK
MTE2MTpbICAgIDYuODIxNTM4XSBjczM1bDU2IHNkdzowOjI6MDFmYTozNTU2OjAxOjI6IHN1
cHBseSBWRERfQiBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgoxMTYyOlsgICAg
Ni44MjE1NDVdIGNzMzVsNTYgc2R3OjA6MjowMWZhOjM1NTY6MDE6Mjogc3VwcGx5IFZERF9B
TVAgbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IKMTE2MzpbICAgIDYuODIyMTg0
XSBjczM1bDU2IHNkdzowOjI6MDFmYTozNTU2OjAxOjM6IHN1cHBseSBWRERfQiBub3QgZm91
bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgoxMTY0OlsgICAgNi44MjIxOTJdIGNzMzVsNTYg
c2R3OjA6MjowMWZhOjM1NTY6MDE6Mzogc3VwcGx5IFZERF9BTVAgbm90IGZvdW5kLCB1c2lu
ZyBkdW1teSByZWd1bGF0b3IKMTE2NTpbICAgIDYuODIzMDY5XSBjczM1bDU2IHNkdzowOjM6
MDFmYTozNTU2OjAxOjA6IHN1cHBseSBWRERfQiBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJl
Z3VsYXRvcgoxMTY2OlsgICAgNi44MjMwNzZdIGNzMzVsNTYgc2R3OjA6MzowMWZhOjM1NTY6
MDE6MDogc3VwcGx5IFZERF9BTVAgbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IK
MTE2NzpbICAgIDYuODIzNzAwXSBjczM1bDU2IHNkdzowOjM6MDFmYTozNTU2OjAxOjE6IHN1
cHBseSBWRERfQiBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgoxMTY4OlsgICAg
Ni44MjM3MDhdIGNzMzVsNTYgc2R3OjA6MzowMWZhOjM1NTY6MDE6MTogc3VwcGx5IFZERF9B
TVAgbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IK
--------------e6cq9Sj0wcvRScxoILT6o4I4
Content-Type: text/plain; charset=UTF-8; name="03_regulator_summary.txt"
Content-Disposition: attachment; filename="03_regulator_summary.txt"
Content-Transfer-Encoding: base64

c3VkbyBncmVwIC1pRSAncmVndWxhdG9yfElOVDM0NzJ8ZHZkZHxvdjAyYzEwJyAvc3lzL2tl
cm5lbC9kZWJ1Zy9yZWd1bGF0b3IvcmVndWxhdG9yX3N1bW1hcnkgfCBncmVwIC1pQTMgLUIx
IGR2ZGQKCgogcmVndWxhdG9yLWR1bW15ICAgICAgICAgICAgICAgICAxOSAgIDI3ICAgICAg
MCB1bmtub3duICAgICAwbVYgICAgIDBtQSAgICAgMG1WICAgICAwbVYgCiBJTlQzNDcyOjBj
LWR2ZGQgICAgICAgICAgICAgICAgICAwICAgIDAgICAgICAwIHVua25vd24gICAgIDBtViAg
ICAgMG1BICAgICAwbVYgICAgIDBtVgo=
--------------e6cq9Sj0wcvRScxoILT6o4I4
Content-Type: text/x-dsl; charset=UTF-8; name="04_lnk1.dsl"
Content-Disposition: attachment; filename="04_lnk1.dsl"
Content-Transfer-Encoding: base64

ICAgICAgICBEZXZpY2UgKExOSzEpCiAgICAgICAgewogICAgICAgICAgICBOYW1lIChDVlNC
LCBQYWNrYWdlICgweDAyKQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAiXFxfU0Iu
UEMwMC5DVlNTIiwgCiAgICAgICAgICAgICAgICAiXFxfU0IuUEMwMC5YSENJLlJIVUIuSFMw
OS5WSUMxIgogICAgICAgICAgICB9KQogICAgICAgICAgICBOYW1lIChQVVNCLCBQYWNrYWdl
ICgweDAyKQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAiXFxfU0IuUEMwMC5EU0Mx
IiwgCiAgICAgICAgICAgICAgICAiXFxfU0IuUEMwMC5YSENJLlJIVUIuSFMwOS5WSUMxIgog
ICAgICAgICAgICB9KQogICAgICAgICAgICBNZXRob2QgKF9TVEEsIDAsIE5vdFNlcmlhbGl6
ZWQpICAvLyBfU1RBOiBTdGF0dXMKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgSWYg
KEwxRU4pCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0dXJuICgw
eDBGKQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgRWxzZQogICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgIFJldHVybiAoWmVybykKICAgICAgICAgICAg
ICAgIH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChfU1VCLCAwLCBOb3RT
ZXJpYWxpemVkKSAgLy8gX1NVQjogU3Vic3lzdGVtIElECiAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgIFJldHVybiAoVG9TdHJpbmcgKENFUkQsIE9uZXMpKQogICAgICAgICAgICB9
CgogICAgICAgICAgICBNZXRob2QgKF9ERVAsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfREVQ
OiBEZXBlbmRlbmNpZXMKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgSWYgKEwxRU4p
CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgSWYgKEFSTFApCiAgICAg
ICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKENWU0Ip
IC8qIFxfU0JfLlBDMDAuTE5LMS5DVlNCICovCiAgICAgICAgICAgICAgICAgICAgfQogICAg
ICAgICAgICAgICAgICAgIEVsc2UKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgICAgIFJldHVybiAoUFVTQikgLyogXF9TQl8uUEMwMC5MTksxLlBVU0IgKi8K
ICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAg
ICBFbHNlCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0dXJuIChQ
YWNrYWdlICgweDAxKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICAgICAgUEMwMAogICAgICAgICAgICAgICAgICAgIH0pCiAgICAgICAgICAgICAgICB9CiAg
ICAgICAgICAgIH0KCiAgICAgICAgICAgIE5hbWUgKF9VSUQsIE9uZSkgIC8vIF9VSUQ6IFVu
aXF1ZSBJRAogICAgICAgICAgICBNZXRob2QgKF9ISUQsIDAsIE5vdFNlcmlhbGl6ZWQpICAv
LyBfSElEOiBIYXJkd2FyZSBJRAogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBSZXR1
cm4gKEhDSUQgKE9uZSkpCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX0NJ
RCwgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9DSUQ6IENvbXBhdGlibGUgSUQKICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgUmV0dXJuIChIQ0lEIChPbmUpKQogICAgICAgICAgICB9
CgogICAgICAgICAgICBNZXRob2QgKF9ERE4sIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfRERO
OiBET1MgRGV2aWNlIE5hbWUKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTmFtZSAo
QlVGLCBCdWZmZXIgKDB4MTApe30pCiAgICAgICAgICAgICAgICBCVUYgW1plcm9dID0gTDFN
MCAvKiBcTDFNMCAqLwogICAgICAgICAgICAgICAgQlVGIFtPbmVdID0gTDFNMSAvKiBcTDFN
MSAqLwogICAgICAgICAgICAgICAgQlVGIFsweDAyXSA9IEwxTTIgLyogXEwxTTIgKi8KICAg
ICAgICAgICAgICAgIEJVRiBbMHgwM10gPSBMMU0zIC8qIFxMMU0zICovCiAgICAgICAgICAg
ICAgICBCVUYgWzB4MDRdID0gTDFNNCAvKiBcTDFNNCAqLwogICAgICAgICAgICAgICAgQlVG
IFsweDA1XSA9IEwxTTUgLyogXEwxTTUgKi8KICAgICAgICAgICAgICAgIEJVRiBbMHgwNl0g
PSBMMU02IC8qIFxMMU02ICovCiAgICAgICAgICAgICAgICBCVUYgWzB4MDddID0gTDFNNyAv
KiBcTDFNNyAqLwogICAgICAgICAgICAgICAgQlVGIFsweDA4XSA9IEwxTTggLyogXEwxTTgg
Ki8KICAgICAgICAgICAgICAgIEJVRiBbMHgwOV0gPSBMMU05IC8qIFxMMU05ICovCiAgICAg
ICAgICAgICAgICBCVUYgWzB4MEFdID0gTDFNQSAvKiBcTDFNQSAqLwogICAgICAgICAgICAg
ICAgQlVGIFsweDBCXSA9IEwxTUIgLyogXEwxTUIgKi8KICAgICAgICAgICAgICAgIEJVRiBb
MHgwQ10gPSBMMU1DIC8qIFxMMU1DICovCiAgICAgICAgICAgICAgICBCVUYgWzB4MERdID0g
TDFNRCAvKiBcTDFNRCAqLwogICAgICAgICAgICAgICAgQlVGIFsweDBFXSA9IEwxTUUgLyog
XEwxTUUgKi8KICAgICAgICAgICAgICAgIEJVRiBbMHgwRl0gPSBMMU1GIC8qIFxMMU1GICov
CiAgICAgICAgICAgICAgICBSZXR1cm4gKFRvU3RyaW5nIChCVUYsIE9uZXMpKQogICAgICAg
ICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9QTEQsIDAsIFNlcmlhbGl6ZWQpICAvLyBf
UExEOiBQaHlzaWNhbCBMb2NhdGlvbiBvZiBEZXZpY2UKICAgICAgICAgICAgewogICAgICAg
ICAgICAgICAgTmFtZSAoUExEQiwgUGFja2FnZSAoMHgwMSkKICAgICAgICAgICAgICAgIHsK
ICAgICAgICAgICAgICAgICAgICBCdWZmZXIgKDB4MTQpCiAgICAgICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgICAgICAvKiAwMDAwICovICAweDgyLCAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAgLy8gLi4uLi4uLi4KICAgICAgICAg
ICAgICAgICAgICAgICAgLyogMDAwOCAqLyAgMHg2OSwgMHgwRSwgMHgwMCwgMHgwMCwgMHgw
MywgMHgwMCwgMHgwMCwgMHgwMCwgIC8vIGkuLi4uLi4uCiAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIDAwMTAgKi8gIDB4RkYsIDB4RkYsIDB4RkYsIDB4RkYgICAgICAgICAgICAgICAg
ICAgICAgICAgICAvLyAuLi4uCiAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAg
ICAgfSkKICAgICAgICAgICAgICAgIENyZWF0ZUJ5dGVGaWVsZCAoRGVyZWZPZiAoUExEQiBb
WmVyb10pLCAweDA4LCBCUE9TKQogICAgICAgICAgICAgICAgQ3JlYXRlRmllbGQgKERlcmVm
T2YgKFBMREIgW1plcm9dKSwgMHg3MywgMHgwNCwgUlBPUykKICAgICAgICAgICAgICAgIEJQ
T1MgPSBMMVBMIC8qIFxMMVBMICovCiAgICAgICAgICAgICAgICBSUE9TID0gTDFERyAvKiBc
TDFERyAqLwogICAgICAgICAgICAgICAgUmV0dXJuIChQTERCKSAvKiBcX1NCXy5QQzAwLkxO
SzEuX1BMRC5QTERCICovCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX0NS
UywgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9DUlM6IEN1cnJlbnQgUmVzb3VyY2UgU2V0dGlu
Z3MKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTG9jYWwwID0gVklJQyAoTDFBMCwg
T25lKQogICAgICAgICAgICAgICAgSWYgKChMMURJID4gT25lKSkKICAgICAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgICAgICBMb2NhbDEgPSBWSUlDIChMMUExLCBPbmUpCiAgICAg
ICAgICAgICAgICAgICAgQ29uY2F0ZW5hdGVSZXNUZW1wbGF0ZSAoTG9jYWwwLCBMb2NhbDEs
IExvY2FsMikKICAgICAgICAgICAgICAgICAgICBMb2NhbDAgPSBMb2NhbDIKICAgICAgICAg
ICAgICAgIH0KCiAgICAgICAgICAgICAgICBJZiAoKEwxREkgPiAweDAyKSkKICAgICAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBMb2NhbDEgPSBWSUlDIChMMUEyLCBPbmUp
CiAgICAgICAgICAgICAgICAgICAgQ29uY2F0ZW5hdGVSZXNUZW1wbGF0ZSAoTG9jYWwwLCBM
b2NhbDEsIExvY2FsMikKICAgICAgICAgICAgICAgICAgICBMb2NhbDAgPSBMb2NhbDIKICAg
ICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBSZXR1cm4gKExvY2FsMCkKICAgICAg
ICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChTU0RCLCAwLCBOb3RTZXJpYWxpemVkKQog
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBOYW1lIChQQVIsIEJ1ZmZlciAoMHg2QykK
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAvKiAwMDAwICovICAweDAw
LCAweDAwLCAweDY5LCAweDU2LCAweDM5LCAweDhBLCAweEY3LCAweDExLCAgLy8gLi5pVjku
Li4KICAgICAgICAgICAgICAgICAgICAvKiAwMDA4ICovICAweEE5LCAweDRFLCAweDlDLCAw
eDdELCAweDIwLCAweEVFLCAweDBBLCAweEI1LCAgLy8gLk4ufSAuLi4KICAgICAgICAgICAg
ICAgICAgICAvKiAwMDEwICovICAweENBLCAweDQwLCAweEEzLCAweDAwLCAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAgLy8gLkAuLi4uLi4KICAgICAgICAgICAgICAgICAgICAvKiAwMDE4
ICovICAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAg
Ly8gLi4uLi4uLi4KICAgICAgICAgICAgICAgICAgICAvKiAwMDIwICovICAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAgLy8gLi4uLi4uLi4KICAg
ICAgICAgICAgICAgICAgICAvKiAwMDI4ICovICAweDAwLCAweDAwLCAweDAwLCAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAweDAwLCAgLy8gLi4uLi4uLi4KICAgICAgICAgICAgICAgICAg
ICAvKiAwMDMwICovICAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAw
LCAweDAwLCAgLy8gLi4uLi4uLi4KICAgICAgICAgICAgICAgICAgICAvKiAwMDM4ICovICAw
eDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAgLy8gLi4u
Li4uLi4KICAgICAgICAgICAgICAgICAgICAvKiAwMDQwICovICAweDAwLCAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAgLy8gLi4uLi4uLi4KICAgICAgICAg
ICAgICAgICAgICAvKiAwMDQ4ICovICAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAgLy8gLi4uLi4uLi4KICAgICAgICAgICAgICAgICAgICAvKiAw
MDUwICovICAweDEwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAxLCAweDAwLCAweDAw
LCAgLy8gLi4uLi4uLi4KICAgICAgICAgICAgICAgICAgICAvKiAwMDU4ICovICAweDAwLCAw
eDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAgLy8gLi4uLi4uLi4K
ICAgICAgICAgICAgICAgICAgICAvKiAwMDYwICovICAweDAwLCAweDAwLCAweDAwLCAweDAx
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAgLy8gLi4uLi4uLi4KICAgICAgICAgICAgICAg
ICAgICAvKiAwMDY4ICovICAweDAwLCAweDAwLCAweDAwLCAweDAwICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLy8gLi4uLgogICAgICAgICAgICAgICAgfSkKICAgICAgICAgICAgICAg
IFBBUiBbWmVyb10gPSBMMURWIC8qIFxMMURWICovCiAgICAgICAgICAgICAgICBQQVIgW09u
ZV0gPSBMMUNWIC8qIFxMMUNWICovCiAgICAgICAgICAgICAgICBQQVIgWzB4MThdID0gTDFM
QyAvKiBcTDFMQyAqLwogICAgICAgICAgICAgICAgUEFSIFsweDFDXSA9IEwxTFUgLyogXEwx
TFUgKi8KICAgICAgICAgICAgICAgIFBBUiBbMHgxRF0gPSBMMU5MIC8qIFxMMU5MICovCiAg
ICAgICAgICAgICAgICBQQVIgWzB4NEVdID0gTDFFRSAvKiBcTDFFRSAqLwogICAgICAgICAg
ICAgICAgUEFSIFsweDRGXSA9IEwxVkMgLyogXEwxVkMgKi8KICAgICAgICAgICAgICAgIFBB
UiBbMHg1Ml0gPSBMMUZTIC8qIFxMMUZTICovCiAgICAgICAgICAgICAgICBQQVIgWzB4NTNd
ID0gTDFMRSAvKiBcTDFMRSAqLwogICAgICAgICAgICAgICAgUEFSIFsweDU0XSA9IENERUcg
KEwxREcpCg==
--------------e6cq9Sj0wcvRScxoILT6o4I4
Content-Type: text/x-dsl; charset=UTF-8; name="05_dsc0.dsl"
Content-Disposition: attachment; filename="05_dsc0.dsl"
Content-Transfer-Encoding: base64

ICAgICAgICBEZXZpY2UgKERTQzApCiAgICAgICAgewogICAgICAgICAgICBOYW1lIChfSElE
LCAiSU5UMzQ3MiIpICAvLyBfSElEOiBIYXJkd2FyZSBJRAogICAgICAgICAgICBOYW1lIChf
Q0lELCAiSU5UMzQ3MiIpICAvLyBfQ0lEOiBDb21wYXRpYmxlIElECiAgICAgICAgICAgIE5h
bWUgKF9ERE4sICJQTUlDLUNSREciKSAgLy8gX0RETjogRE9TIERldmljZSBOYW1lCiAgICAg
ICAgICAgIE5hbWUgKF9VSUQsIFplcm8pICAvLyBfVUlEOiBVbmlxdWUgSUQKICAgICAgICAg
ICAgTmFtZSAoX0RFUCwgUGFja2FnZSAoMHgwMSkgIC8vIF9ERVA6IERlcGVuZGVuY2llcwog
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBeWEhDSS5SSFVCLkhTMDkuVkdQTwogICAg
ICAgICAgICB9KQogICAgICAgICAgICBNZXRob2QgKF9TVUIsIDAsIE5vdFNlcmlhbGl6ZWQp
ICAvLyBfU1VCOiBTdWJzeXN0ZW0gSUQKICAgICAgICAgICAgewogICAgICAgICAgICAgICAg
UmV0dXJuIChUb1N0cmluZyAoQ0VSRCwgT25lcykpCiAgICAgICAgICAgIH0KCiAgICAgICAg
ICAgIE1ldGhvZCAoX0NSUywgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9DUlM6IEN1cnJlbnQg
UmVzb3VyY2UgU2V0dGluZ3MKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTG9jYWww
ID0gVlBJTiAoT25lKQogICAgICAgICAgICAgICAgSWYgKChDMEdQID4gWmVybykpCiAgICAg
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgTG9jYWwxID0gUElOUiAoQzBQMCwg
QzBDMCwgQzBHMCkKICAgICAgICAgICAgICAgICAgICBDb25jYXRlbmF0ZVJlc1RlbXBsYXRl
IChMb2NhbDAsIExvY2FsMSwgTG9jYWwyKQogICAgICAgICAgICAgICAgICAgIExvY2FsMCA9
IExvY2FsMgogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIElmICgoQzBHUCA+
IE9uZSkpCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgTG9jYWwxID0g
UElOUiAoQzBQMSwgQzBDMSwgQzBHMSkKICAgICAgICAgICAgICAgICAgICBDb25jYXRlbmF0
ZVJlc1RlbXBsYXRlIChMb2NhbDAsIExvY2FsMSwgTG9jYWwyKQogICAgICAgICAgICAgICAg
ICAgIExvY2FsMCA9IExvY2FsMgogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAg
IElmICgoQzBHUCA+IDB4MDIpKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAg
ICAgIExvY2FsMSA9IFBJTlIgKEMwUDIsIEMwQzIsIEMwRzIpCiAgICAgICAgICAgICAgICAg
ICAgQ29uY2F0ZW5hdGVSZXNUZW1wbGF0ZSAoTG9jYWwwLCBMb2NhbDEsIExvY2FsMikKICAg
ICAgICAgICAgICAgICAgICBMb2NhbDAgPSBMb2NhbDIKICAgICAgICAgICAgICAgIH0KCiAg
ICAgICAgICAgICAgICBJZiAoKEMwR1AgPiAweDAzKSkKICAgICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICAgICBMb2NhbDEgPSBQSU5SIChDMFAzLCBDMEMzLCBDMEczKQogICAg
ICAgICAgICAgICAgICAgIENvbmNhdGVuYXRlUmVzVGVtcGxhdGUgKExvY2FsMCwgTG9jYWwx
LCBMb2NhbDIpCiAgICAgICAgICAgICAgICAgICAgTG9jYWwwID0gTG9jYWwyCiAgICAgICAg
ICAgICAgICB9CgogICAgICAgICAgICAgICAgSWYgKChDMEdQID4gMHgwNCkpCiAgICAgICAg
ICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgTG9jYWwxID0gUElOUiAoQzBQNCwgQzBD
NCwgQzBHNCkKICAgICAgICAgICAgICAgICAgICBDb25jYXRlbmF0ZVJlc1RlbXBsYXRlIChM
b2NhbDAsIExvY2FsMSwgTG9jYWwyKQogICAgICAgICAgICAgICAgICAgIExvY2FsMCA9IExv
Y2FsMgogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIElmICgoQzBHUCA+IDB4
MDUpKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIExvY2FsMSA9IFBJ
TlIgKEMwUDUsIEMwQzUsIEMwRzUpCiAgICAgICAgICAgICAgICAgICAgQ29uY2F0ZW5hdGVS
ZXNUZW1wbGF0ZSAoTG9jYWwwLCBMb2NhbDEsIExvY2FsMikKICAgICAgICAgICAgICAgICAg
ICBMb2NhbDAgPSBMb2NhbDIKICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBS
ZXR1cm4gKExvY2FsMCkKICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChfU1RB
LCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1NUQTogU3RhdHVzCiAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgIElmIChDTDAwKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAg
ICAgICAgIElmICgoQzBUUCA9PSBPbmUpKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICAgICAgUmV0dXJuICgweDBGKQogICAgICAgICAgICAgICAgICAgIH0K
ICAgICAgICAgICAgICAgIH0KCiAgICAgICAgICAgICAgICBSZXR1cm4gKFplcm8pCiAgICAg
ICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoQ0xEQiwgMCwgTm90U2VyaWFsaXplZCkK
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTmFtZSAoUEFSLCBCdWZmZXIgKDB4MjAp
CiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgLyogMDAwMCAqLyAgMHgw
MCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwQywgMHgwMCwgMHgwMCwgIC8vIC4uLi4u
Li4uCiAgICAgICAgICAgICAgICAgICAgLyogMDAwOCAqLyAgMHgwMCwgMHgwMCwgMHgwMCwg
MHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgIC8vIC4uLi4uLi4uCiAgICAgICAgICAg
ICAgICAgICAgLyogMDAxMCAqLyAgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgw
MCwgMHgwMCwgMHgwMCwgIC8vIC4uLi4uLi4uCiAgICAgICAgICAgICAgICAgICAgLyogMDAx
OCAqLyAgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCAg
IC8vIC4uLi4uLi4uCiAgICAgICAgICAgICAgICB9KQogICAgICAgICAgICAgICAgUEFSIFta
ZXJvXSA9IEMwVkUgLyogXEMwVkUgKi8KICAgICAgICAgICAgICAgIFBBUiBbT25lXSA9IEMw
VFAgLyogXEMwVFAgKi8KICAgICAgICAgICAgICAgIFBBUiBbMHgwM10gPSBDMENWIC8qIFxD
MENWICovCiAgICAgICAgICAgICAgICBQQVIgWzB4MDRdID0gQzBJQyAvKiBcQzBJQyAqLwog
ICAgICAgICAgICAgICAgUEFSIFsweDA2XSA9IEMwU1AgLyogXEMwU1AgKi8KICAgICAgICAg
ICAgICAgIFBBUiBbMHgwOF0gPSBDMFcwIC8qIFxDMFcwICovCiAgICAgICAgICAgICAgICBQ
QVIgWzB4MDldID0gQzBXMSAvKiBcQzBXMSAqLwogICAgICAgICAgICAgICAgUEFSIFsweDBB
XSA9IEMwVzIgLyogXEMwVzIgKi8KICAgICAgICAgICAgICAgIFBBUiBbMHgwQl0gPSBDMFcz
IC8qIFxDMFczICovCiAgICAgICAgICAgICAgICBQQVIgWzB4MENdID0gQzBXNCAvKiBcQzBX
NCAqLwogICAgICAgICAgICAgICAgUEFSIFsweDBEXSA9IEMwVzUgLyogXEMwVzUgKi8KICAg
ICAgICAgICAgICAgIFBBUiBbMHgwRV0gPSBDMENTIC8qIFxDMENTICovCiAgICAgICAgICAg
ICAgICBSZXR1cm4gKFBBUikgLyogXF9TQl8uUEMwMC5EU0MwLkNMREIuUEFSXyAqLwogICAg
ICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9EU00sIDQsIE5vdFNlcmlhbGl6ZWQp
ICAvLyBfRFNNOiBEZXZpY2UtU3BlY2lmaWMgTWV0aG9kCiAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgIElmICgoQXJnMCA9PSBUb1VVSUQgKCI3OTIzNDY0MC05ZTEwLTRmZWEtYTVj
MS1iNWFhOGIxOTc1NmYiKSAvKiBVbmtub3duIFVVSUQgKi8pKQogICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgIElmICgoQXJnMiA9PSBaZXJvKSkKICAgICAgICAgICAg
ICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgIFJldHVybiAoQnVmZmVyIChPbmUp
CiAgICAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAweDNGICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLy8g
PwogICAgICAgICAgICAgICAgICAgICAgICB9KQogICAgICAgICAgICAgICAgICAgIH0KCiAg
ICAgICAgICAgICAgICAgICAgSWYgKChBcmcyID09IE9uZSkpCiAgICAgICAgICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKChPbmUgKyBDMEdQKSkKICAg
ICAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgICAgIElmICgoQXJnMiA9PSAw
eDAyKSkKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgIFJl
dHVybiAoMHgwMTAwMDExMikKICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAg
ICAgICAgIElmICgoQXJnMiA9PSAweDAzKSkKICAgICAgICAgICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICAgICAgICAgIFJldHVybiAoMHgwMTAwMDAwMikKICAgICAgICAgICAgICAg
ICAgICB9CgogICAgICAgICAgICAgICAgICAgIElmICgoQXJnMiA9PSAweDA0KSkKICAgICAg
ICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgIFJldHVybiAoWmVybykK
ICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgICAgIElmICgoQXJnMiA9
PSAweDA1KSkKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAg
IFJldHVybiAoWmVybykKICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAg
ICAgIElmICgoQXJnMiA9PSAweDA2KSkKICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgICAgICAgIFJldHVybiAoWmVybykKICAgICAgICAgICAgICAgICAgICB9Cgog
ICAgICAgICAgICAgICAgICAgIElmICgoQXJnMiA9PSAweDA3KSkKICAgICAgICAgICAgICAg
ICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgIFJldHVybiAoWmVybykKICAgICAgICAg
ICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgICAgIFJldHVybiAoQnVmZmVyIChPbmUp
CiAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICAgMHgwMCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIC4KICAgICAg
ICAgICAgICAgICAgICB9KQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIElm
ICgoUENIUyAhPSAweDA0KSl7fQogICAgICAgICAgICAgICAgUmV0dXJuIChCdWZmZXIgKE9u
ZSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgMHgwMCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIC4KICAgICAgICAgICAg
ICAgIH0pCiAgICAgICAgICAgIH0KICAgICAgICB9CgogICAgICAgIERldmljZSAoRFNDMSkK
ICAgICAgICB7CiAgICAgICAgICAgIE5hbWUgKF9ISUQsICJJTlQzNDcyIikgIC8vIF9ISUQ6
IEhhcmR3YXJlIElECiAgICAgICAgICAgIE5hbWUgKF9DSUQsICJJTlQzNDcyIikgIC8vIF9D
SUQ6IENvbXBhdGlibGUgSUQKICAgICAgICAgICAgTmFtZSAoX0RETiwgIlBNSUMtQ1JERyIp
ICAvLyBfREROOiBET1MgRGV2aWNlIE5hbWUKICAgICAgICAgICAgTmFtZSAoX1VJRCwgT25l
KSAgLy8gX1VJRDogVW5pcXVlIElECiAgICAgICAgICAgIE1ldGhvZCAoX1NVQiwgMCwgTm90
U2VyaWFsaXplZCkgIC8vIF9TVUI6IFN1YnN5c3RlbSBJRAogICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICBSZXR1cm4gKFRvU3RyaW5nIChDRVJELCBPbmVzKSkKICAgICAgICAgICAg
fQoKICAgICAgICAgICAgSWYgKChDMUdQICE9IFplcm8pKQogICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICBNZXRob2QgKF9DUlMsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfQ1JTOiBD
dXJyZW50IFJlc291cmNlIFNldHRpbmdzCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgTG9jYWwwID0gVlBJTiAoWmVybykKICAgICAgICAgICAgICAgICAgICBMb2Nh
bDEgPSBWUElOICgweDAyKQogICAgICAgICAgICAgICAgICAgIENvbmNhdGVuYXRlUmVzVGVt
cGxhdGUgKExvY2FsMCwgTG9jYWwxLCBMb2NhbDIpCiAgICAgICAgICAgICAgICAgICAgTG9j
YWwwID0gTG9jYWwyCiAgICAgICAgICAgICAgICAgICAgSWYgKChDMUdQID4gWmVybykpCiAg
ICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbDEgPSBQ
SU5SIChDMVAxLCBDMUMxLCBDMUcxKQogICAgICAgICAgICAgICAgICAgICAgICBDb25jYXRl
bmF0ZVJlc1RlbXBsYXRlIChMb2NhbDAsIExvY2FsMSwgTG9jYWwyKQogICAgICAgICAgICAg
ICAgICAgICAgICBMb2NhbDAgPSBMb2NhbDIKICAgICAgICAgICAgICAgICAgICB9CgogICAg
ICAgICAgICAgICAgICAgIElmICgoQzFHUCA+IE9uZSkpCiAgICAgICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbDEgPSBQSU5SIChDMVAxLCBDMUMxLCBD
MUcxKQogICAgICAgICAgICAgICAgICAgICAgICBDb25jYXRlbmF0ZVJlc1RlbXBsYXRlIChM
b2NhbDAsIExvY2FsMSwgTG9jYWwyKQogICAgICAgICAgICAgICAgICAgICAgICBMb2NhbDAg
PSBMb2NhbDIKICAgICAgICAgICAgICAgICAgICB9CgogICAgICAgICAgICAgICAgICAgIElm
ICgoQzFHUCA+IDB4MDIpKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICAgICAgTG9jYWwxID0gUElOUiAoQzFQMiwgQzFDMiwgQzFHMikKICAgICAgICAgICAg
ICAgICAgICAgICAgQ29uY2F0ZW5hdGVSZXNUZW1wbGF0ZSAoTG9jYWwwLCBMb2NhbDEsIExv
Y2FsMikKICAgICAgICAgICAgICAgICAgICAgICAgTG9jYWwwID0gTG9jYWwyCiAgICAgICAg
ICAgICAgICAgICAgfQoK

--------------e6cq9Sj0wcvRScxoILT6o4I4--

