Return-Path: <linux-media+bounces-65155-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ir11AYClM2qXEgYAu9opvQ
	(envelope-from <linux-media+bounces-65155-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:00:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0167869E4B0
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:59:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PbDVTE62;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65155-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65155-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06ED73020E28
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 07:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483893D7D83;
	Thu, 18 Jun 2026 07:58:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61897361DBC
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 07:58:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769504; cv=none; b=LwlC4OQQcPj489YWrccGOxgEHaaCN9ucCUrf+XJH0hmWf4QWffdmPsyRe2pKRozp5L2ka926fyAkZO5UwrIT9TAZwXSAciUU4KDI/C6HX3aMC4liMWSr3vy6AgRl+o2lWpxchY/lBAGcR86OEbHmcyDno7vk/KN5iLmF4jAHDXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769504; c=relaxed/simple;
	bh=aPLytLZbXb/kFJqEbfieuDgd6shZ/WDHUIfcjvAi/VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gnl1ncvvleOulzHNmER1NHWDwmTOly0fUsWfjPEGJr0j0TnmOS55FLKnqHfPvMJEK0HSi3nqCCJXBFtA0SwZjdb1bziy+aMdJY+x8/i9VKz5THV/4Qx+aJtliFohk+6ra1nvmurU59GDweEPe8fSzFnQJ4NRaxTXOQ0UKQmnUnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbDVTE62; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso16855415e9.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781769502; x=1782374302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxP5lF2tMLYlezjZbuDxBAYkmeQ7b1wHJx/dctbQth0=;
        b=PbDVTE62zqb5wqN1P9ZLo5WQmyTpzVLkA5Sx+VCInEHKMTTkuggzuSd49BTM/9/euW
         c2P8fuUFe64KLvOmlkkT0BwqiizMyVcSQJxu9kTvCVPoDXvzXsw33qUyCKU2o1EHef1T
         PmEZwAmuLdVl+KONT8A9BQ0PgLiB9xT5Sy248EGHy3d12b6KXDSMUaBgzNOtxxEM8/Hs
         8+inLqEOACGaqNoTDe0kuK+Kicpjos83QYBv6rfhWYOYhzTFmo5wdcK07DTs0EyyFbYH
         ukZG+psO41OyKuPgsvR4jpHtHSjkr6fG4yC1YMOSZFCk3LCfOA3R05e4EELwKX+C0j4e
         aWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781769502; x=1782374302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxP5lF2tMLYlezjZbuDxBAYkmeQ7b1wHJx/dctbQth0=;
        b=Wd7soMfDajlIrHMoagGwEeMrpM4khzU8pu5+uiUbMtes4VbxrpVTt55yn5W1N6/WM8
         M2nzMoAJVoAkWXM6h5ivsD/d9Ay/MTaRcIlObtCwwRKpipVNjw5UM9cnUPixbhnc/Ms9
         NGhyGBqNjUgjhxI1kYxKCAaBL1g0/rHOdA2GeG6IFhb6jufxwkORmpNmju50CZbcVBmK
         c+5xntgP/5kUHX78mNEEf+JOHFLCN6+pGNhADBz/2jnymJixJTY4kvyDL7mpLAfKaagl
         5r/Cz4LpmnfIHlgfY4Cme/ULRHoy9YCjsDl9gQb2o4s6NvM5A6wvnSF3c/pEGBG+Kfbn
         aVbw==
X-Forwarded-Encrypted: i=1; AFNElJ9jV2nwEkosmM3L7Utp3/rWwl30P6JZmE6bAk9wZMMZ7Hf4cLTgtRmPDSNIIOF36us47NHsOJ7eq8tXWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdOrPYVwW5hSEEgaevGvMf8Il44Lq4kK2N81F/p5GzuB3NL1j
	GmHChMYXRMCX35oY4FkUBRq/7PsCHhxtddn1DJjpZSeWqnEJ+w7tFDESmenmsFiS
X-Gm-Gg: Acq92OF76AOdgLCW88EygwPf4p4jDbEkCCDs+ogYSpubnd7ei4W0f6b5+CSKu6Q6Xe0
	j4kydvfy7Z/g1uAhOHfBF8HtTorh6bcpmsXSDgSfHqEF12+pZxD7bWe7+L5we2IOYspyPJJlMj1
	izH34KAN1EEM8q0r301+F3SxXOecPuQy9zjjzqlCFE9Wg6zA4BRfd2358XMSxMKr/rAmaBWcS86
	dQ7iYWPbMxJG81dvx6wbWCTUlDx1i+aON3vjy2rYdVO0YgO4lXP94ROICQqtTS7dluWBYBDz0fU
	zhR8Uqowc3g2GJ/x8nrX57dl+e9pTRtsDI9nzde4g8de+Ywr5gfRAgSdDQ9zrubfvPuz38PKl2o
	wrlft5OLR7NFCQcJMAtYiG3R03u5FgeS6tpOIB/7HgTvRkPahEQgHfVa8kOm45dqGLZwo0RfA+O
	tqAhZCAJVhmOOiwooI260jtQnTvAlQE4uI5E4Y4XYOXLVjYRedxdH4A/9NBdAa+MMT+5Z79NROY
	w==
X-Received: by 2002:a05:600c:3e0e:b0:492:3767:6973 with SMTP id 5b1f17b1804b1-4923817448dmr33517915e9.9.1781769501545;
        Thu, 18 Jun 2026 00:58:21 -0700 (PDT)
Received: from [192.168.8.19] (host-79-10-200-194.business.telecomitalia.it. [79.10.200.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9b45bsm193927105e9.15.2026.06.18.00.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 00:58:21 -0700 (PDT)
Message-ID: <c240369f-13e3-41ac-a5a6-761a5afafbbd@gmail.com>
Date: Thu, 18 Jun 2026 09:58:19 +0200
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
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 sakari.ailus@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
 <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
 <ai8NwzoU08AvD7Ve@spark.kcore.it>
 <396e4b0d-7a2c-4ba4-9569-0428ccd63267@gmail.com>
 <ai_TEj-_ije1XgYF@spark.kcore.it>
 <dee36707-3fc9-486e-b18b-d6a246edb67c@gmail.com>
 <ajOc0H8Pvvr4exL5@spark.kcore.it>
Content-Language: it
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
In-Reply-To: <ajOc0H8Pvvr4exL5@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65155-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0167869E4B0

Marco,

Agreed on all counts, and thanks for closing the loop on it.

I won't push the standalone dvdd_second_sensor quirk: a field with no 
enabled board behind it is dead code, and the second_sensor mechanism is 
already there for whenever a board that actually needs it shows up. The 
validation stands on its own as a data point if that day comes.

I'll take the NVS topology issue to Dell through what channel I have -- 
the RGB-side PMIC (DSC1/LTH1/CLP1) being _STA=0 while only the IR-side 
DSC0 is live looks like a factory-config decision on the Linux SKU, not 
a hardware limit, since the Windows image drives the sensor fine. If 
they flip the gate (or expose the rails on a live instance), the 
existing int3472 paths should pick it up with no kernel change.

Thanks again to you, Hans and Sakari for the time on this one.

Samuele

Il 18/06/26 09:22, Marco Nenciarini ha scritto:
> Samuele,
> 
> The _STA dump settles it, thanks for running it down. With DSC1/LTH1/CLP1 all
> _STA=0 and only DSC0 (INT3472:0c) live, the OV02C10 has no live PMIC instance on
> the DA16250, and the gate is a BIOS/NVS config (CL01/C1TP read but never
> assigned, no _OSI branch), so acpi_osi spoofing can't reach it. avdd/dovdd/reset/
> clock have no live provider to key to.
> 
> That closes the kernel angle: there is nothing for int3472 to fix here, and the
> dvdd re-key, though correct, can't bring the sensor up. This is a Dell firmware
> matter (the RGB-side PMIC topology left disabled in NVS), worth reporting to them
> if you have a channel.
> 
> On the standalone dvdd second_sensor quirk: I'd hold off. The second_sensor
> mechanism already exists; a dvdd_second_sensor field with no enabled board behind
> it would be unused code, and the kernel doesn't carry a quirk that has no
> consumer. If a board turns up that actually benefits, the field and its DMI entry
> can land together in that series, with the consumer that justifies them. Until
> then there is nothing to upstream.
> 
> Thanks again for the thorough work on this one.
> 
> Marco

