Return-Path: <linux-media+bounces-51578-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC61E8CCd2m9hgEAu9opvQ
	(envelope-from <linux-media+bounces-51578-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 16:05:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A32E389E8A
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 16:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0289B303D734
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 15:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1034733A038;
	Mon, 26 Jan 2026 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYolDgiO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E79155757;
	Mon, 26 Jan 2026 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439857; cv=none; b=dOb1yaEVqToSvaFp3T2z0MN+YP51LBMtLEPvlsIMDsH2cOy4eogEHuiGadaYwwbyUb/yRVpZpsozpRGxxoAc+A5SstbMNoj6MNzDpmZt1b17Lh/h/Y6D8XSLOWrVif6xwz2RWPxrJC2EfthT7Gle5ycFtYp2JsEZah5kxCnj9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439857; c=relaxed/simple;
	bh=90wXXQLghKcVYE4mkja/yflNq8gl5ZORNyekyzBhurA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAQfgDI4Ig76WgzB7bN0jF77UG25DsEyj7ZtuTXHNRDlm2YH3rPXznoOpK/rzeGKNtbdEOrUw4ie1EWmrywtprmsnj4VEi5dg2ZC+PuY7/rWqB07/MC3TCneem0zplod67hS41tspzS77dr2mySNIAzZvFuTisDBHhgKFt8G3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYolDgiO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E27BC116C6;
	Mon, 26 Jan 2026 15:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769439856;
	bh=90wXXQLghKcVYE4mkja/yflNq8gl5ZORNyekyzBhurA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NYolDgiOir0gLmB1iXukU+T5Yx8o9+UfkV9lJp9m2+/PAg7D5a6oJEh7p1H8mtRfe
	 z42HzPqTBvYF2zHGcq4nbZI0ihdqiPnBfJ+nMNr0oaJhlBgO7PbElnEWf8XsjNV74O
	 jf0oBfve2VEX82AsXj8qrRyMP24XMDa0f1PuL9KKqWsEQdaL73fEbZOtAil4vzccyX
	 kVq4jAfNw7MaZe4Pl3X94NvIaK5+OQ6cDbbmCVaAZPYZeaMByVWZX5nh+QHoFusaeo
	 C5fW+NidaJuaYZNqWUJz+aZhPqaHU8m4xcJrW+lXBRot7le5e+GVaNhcgl+WA5ZlU2
	 N3P8jhtvPnGJw==
Message-ID: <371b38d5-9322-4629-b378-ec62e0924fd4@kernel.org>
Date: Mon, 26 Jan 2026 15:04:12 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: Saikiran B <bjsaikiran@gmail.com>, Hans de Goede <hansg@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 rfoss@kernel.org, todor.too@gmail.com, vladimir.zapolskiy@linaro.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com>
 <ef6cf6c5-3b5d-45f2-af67-0567262a4561@linaro.org>
 <CAAFDt1spRkj7kySCa8P=jehQHbYVT2j+nxLira1vwYkiCJ7LDw@mail.gmail.com>
 <b699fcf5-5cb0-41eb-b9de-e5c6e98aefaa@linaro.org>
 <IlpLwcSSsQ89AZYFUkWtRcUkztg6PClgkVOyWG0StiDOUCE93t7KlF9q18JPi3GutJ1OQWj_2igjYq1OD8FLZg==@protonmail.internalid>
 <CAAFDt1tjiEXbuChcY73+NYxPW=rB83P4Bks1TPGsHTTqoSzOuw@mail.gmail.com>
 <ed1421d9-f094-4306-ae6d-e07b3a72f82b@kernel.org>
 <CAAFDt1ukAdXwADuFVoZrs6Ay2fB_sq6LMW5FCnsjqUL7V62mfg@mail.gmail.com>
 <eaf30b60-c0fb-4cf5-bc37-274faa187734@linaro.org>
 <CAAFDt1tgFf5MQcHm3s5DJEDHDtbTfj56_0-=fTz0ekDjSqY3CA@mail.gmail.com>
 <2084a247-053b-41c0-84ef-c56af640aa74@kernel.org>
 <I-1OPz69QKXF-LDqvufQARvv_3TIYaLyZIETdiGvSj_JSYhnJNeqiLERDUH2R0kclFyo6MqMRsaiZaS3RKmdZA==@protonmail.internalid>
 <CAAFDt1ufYyM4_xTy+AZTdXBB0cGNk+nFQHD5+5U7tUMQqZ+o=g@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1ufYyM4_xTy+AZTdXBB0cGNk+nFQHD5+5U7tUMQqZ+o=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51578-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,kernel.org,gmail.com,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.36:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A32E389E8A
X-Rspamd-Action: no action

On 26/01/2026 14:08, Saikiran B wrote:
> The exact issue is:
> 1. Open Camera -> Close -> Wait 3s -> Open: WORKS.
> 2. Open Camera -> Close -> Wait 1.5s -> Open: FAILS (I2C Timeout / 
> Device Busy).
> 
> If the VDD rail is floating in the brownout region (~1.0V) during that 
> 1.5s window, does the sensor's internal Reset Logic Gate even have 
> enough bias voltage to function?

I think the VDD rail floating is unlikely, this would require the 
description of the LDO configured by XBL to be incorrect - possible but, 
then you'd expect to see an update for Windows to fix it.

Have you gotten the latest firmware for the board from Lenovo ? A 
misconfigured LDO - without active discharge set, should receive a 
firmware update to address.

Another possibility is CCI is powering the chip in sleep.

Lets have a look at the CCI pins.

         cam_rgb_default: cam-rgb-default-state {
                 mclk-pins {
                         pins = "gpio100";
                         function = "cam_aon";
                         drive-strength = <16>;
                         bias-disable;
                 };

                 reset-n-pins {
                         pins = "gpio237";
                         function = "gpio";
                         drive-strength = <2>;
                         bias-disable;
                 };
         };

add
	cam_rgb_sleep: cam-rgb-sleep-state {
                 mclk-pins {
                         pins = "gpio100";
                         function = "cam_aon";
                         drive-strength = <2>;
                         bias-pull-down; // Force to Ground
                 };

                 reset-n-pins {
                         pins = "gpio237";
                         function = "gpio";
                         drive-strength = <2>;
                         bias-pull-down; // Force to Ground
                 };
         };


&cci1_i2c1 {
         camera@36 {
                 compatible = "ovti,ov02c10";
                 reg = <0x36>;

                 reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
                 pinctrl-names = "default", "sleep";
                 pinctrl-0 = <&cam_rgb_default>;
                 pinctrl-1 = <&cam_rgb_sleep>;

Failing that we should try a more liberal power_on()

power_on():

     Assert Reset (GPIO Low).
     Wait 10ms.
     Enable all regulators (RPMh votes).
     Wait 20ms (Allow PM8010 to ramp and stabilize).
     Start the Clock (MCLK).
     Wait 10ms.
     De-assert Reset (GPIO High).
     Wait 5ms.

If that doesn't work, we will have to go and look at the LDO 
configuration via SPMI directly.

During the 2.3 second window can you run

Getting the kernel's view:
cat /sys/kernel/debug/regulator/regulator_summary

We are looking for use_count > 0 and open_count

We could also look at the SPMI LDO config register

Getting the firmware's view:
cat /sys/kernel/debug/regmap/spmi0-0x08/registers

It should be possible to interrogate the configruation of all of the 
relevant LDOs and ascertain if active-discharge is set, which TBH it 
should be.

> ​My testing suggests the sensor is physically incapable of processing 
> the Reset signal until the rail fully discharges (~2.3s), which is why 
> the 5ms delay has no effect.

Yes accepted but, a 2.3 second delay is avoidable if we root-cause.
P.S.
Please bottom post !

---
bod

