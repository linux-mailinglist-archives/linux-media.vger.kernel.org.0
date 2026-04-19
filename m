Return-Path: <linux-media+bounces-59091-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOdgEpKG5GlgWQEAu9opvQ
	(envelope-from <linux-media+bounces-59091-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 09:38:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15F42356C
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 09:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A80B301876B
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 07:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C574F375F97;
	Sun, 19 Apr 2026 07:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeX+t3M9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF12A1B2
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776584333; cv=none; b=ZyNuFXx/aRNo+wAON27ro+BcXeTGzQ7mJF+d6zhwb6rCw9+lYhEMLHaD+GcKmhlF+lfG70gCoqeZOyQnyLdUEzG0HwtdLKbCevgMtmBIiaFHpHG6nEiOlDYMGjTkeoT/wB1qgJOfn6gVhq/IQI9ccb0uoFcu6OVTEfrAWHR8+nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776584333; c=relaxed/simple;
	bh=hDfKe0QMUmSalyAwjaCmL53DF1u9pssVZ/2QrwkgfMg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tlwQ354ilY19KA/6wRkscxwvushK4HPFZApEqZrF09IgZxPcMUTgQnTbERF3AGsl7TJWxyEhCynsozhCzf/UewpJNZKSzp3hQ1FPc1YU/b7xIcsug079qPN1yA6bdW9q6MEc1myG+bbPiCRkAYb5vC0fJIPwlrjzotSA+PD1KmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeX+t3M9; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so1692715a91.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 00:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776584331; x=1777189131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tdU7DYFMoYT+EMFZxBQxJC/c8a6HCHPZlnWvXhWBPfQ=;
        b=QeX+t3M92MJNPij25UczB2EKzFI77ewSGI43N4Yb6dB2W3Fu2zo4qqzmQxqYhagXnx
         wd9fRT3k8rpyG3MKWvImjokFsPtvzlypHdAbFr2WeXnEzmezrF35NQq3cB6bjD6sAlqH
         IiRbL71B3xKfQaUCKWkTepo3mC3hnXg9HIt88inr8O2KZOLAEKa4npCYN9+Qhrj8KH6o
         EojiWMtdyvp9W7RkYCs2ik9T5VfEb2qe6HAOyB8y9lYn8gh5H+Q72Qu/ojSgLuDmzt2H
         15hDsexYFlPqoIHjKCylyUj/919PAyMBrc5ctxAQ8dAWdkV61gQZbBEFPISKU/9gV+iB
         yVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776584331; x=1777189131;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdU7DYFMoYT+EMFZxBQxJC/c8a6HCHPZlnWvXhWBPfQ=;
        b=TzR15W/ft7B2eXpZpVAgypRPjz2qwzPi4QMfmKaQmzjxPMhvUhqjdovstbHKPbt3MT
         tfwFU5a8qB/PsV1Z+AiPm1sys9jJvjLfsKnUe2KqIUuV4bDgLod+yktmMJVpaXKi9RVv
         aYSyVKOnP/yyOtS0aQ6SPhaRvwHstDmumP8R1o11WKR962xWOsOgrwwOn70wXjwH/7bv
         lSdl5eVlDeJqbUqUmPS2wNQSU4caocc62fDAUfdQGq7rrKUrl31bhDuJZ6aR6QR0ooF8
         gZd+DNNyUgvu4/FhOE7kDqB74lVBzD5X7xUdGknfonKsiB2LcJ+Vy/m2Xig3ojGh37Xa
         lYqA==
X-Forwarded-Encrypted: i=1; AFNElJ94vYNzLVAQM/gpqbGgiy8ZnM8MpR9Wf9uFN6pt9mGJseq6WYlzlKrhM7J2AKmBPQfwzg9AqNypa0vJjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz31LuJog03XkPiCDJ43brfxuNC1c74zLToCdwuZM91SYemQwc
	uacIwHn7hB6jU2iLI1sO3FUHiOaK7vZngrIjc3HVK+2qvQ/6hj6wnHhY
X-Gm-Gg: AeBDievkVn3/0dkIrVZzgKlfqoPFlEh2uFbed8PZ1UySewBpPQ4i5Tv+D+NFwgRP+vi
	7+X83if+dgeC1nNUNjAQKYs4OBtCkYC4u+kjlfti0ii6wNNF6tjhNKPIvAhXU+PwDMP3VbwBmlL
	AVNfGS/uyxJnXBeGcG9PwymljP5VvbeUdpoGaBICcWeqE1ITCAbg3m0dsVXwPvjTuvz+1jSQAJ1
	908ih/Y9or4iN6mKvqvcmxA7ti+zUXKkD+HaocForps+hC7suY5dSk1aeKXOaThdDIzZJJTYnMp
	frepu2n/WXJLFXO4ntp8XIV751ArinH88BF2Cl0hSoqD3fGFijaUJ4sFyQJXSsjBVLlJ6scx+ZP
	brLuMpC6yp3w4Rb1nhxBzu9F8W72nRIxkXfIxKkDNtmOVk7PP4ieJywqlzYKHpZd/isdpLsHoiK
	hpQNM3h2sfaso/7kdNjTQIPeHHSNlcY4WldtdtaNBu2UCrTp3eb/Me80MzHA==
X-Received: by 2002:a17:90b:3c82:b0:34c:2db6:578f with SMTP id 98e67ed59e1d1-36140478642mr9692065a91.19.1776584331391;
        Sun, 19 Apr 2026 00:38:51 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:ac30:da43:8bfb:2c2f:1693:9900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa30134sm69244655ad.30.2026.04.19.00.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 00:38:50 -0700 (PDT)
Date: Sun, 19 Apr 2026 13:08:45 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Hans de Goede <hansg@kernel.org>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org
CC: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: gc0310: Use devm_v4l2_sensor_clk_get()
User-Agent: Thunderbird for Android
In-Reply-To: <404149fe-761e-4c8c-90f0-12850c5b049c@kernel.org>
References: <20260401181657.654055-1-sanjayembedded@gmail.com> <20260401181657.654055-4-sanjayembedded@gmail.com> <404149fe-761e-4c8c-90f0-12850c5b049c@kernel.org>
Message-ID: <34BAB686-0D85-481C-ADF1-8597FDD85AD7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-59091-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 9D15F42356C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2 April 2026 12:50:20=E2=80=AFam IST, Hans de Goede <hansg@kernel=2Eorg=
> wrote:
>Hi,
>
>On 1-Apr-26 20:16, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>=20
>> Several camera sensor drivers access the "clock-frequency" property
>> directly to retrieve the external clock rate or handle the external
>> clock manually in the driver=2E While this is valid on a subset of ACPI
>> platforms, implementing this logic directly in drivers is deprecated
>> and can lead to inconsistent behaviour across drivers=2E
>>=20
>> This driver supports ACPI platforms only=2E It currently retrieves the
>> external clock rate from the "clock-frequency" property and fails
>> probing if the rate does not match the expected value, which is the
>> correct policy for ACPI platforms=2E
>>=20
>> Switch to using the devm_v4l2_sensor_clk_get() helper to standardise
>> clock handling=2E This preserves the existing behaviour on ACPI
>> platforms that specify a clock-frequency property without providing
>> a clock=2E On platforms that provide a clock, the helper will program
>> the clock to the rate specified by clock-frequency, which is also
>> consistent with the driver's expectations=2E
>>=20
>> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>
>Thanks, patch looks good to me:
>
>Reviewed-by: Hans de Goede <johannes=2Egoede@oss=2Equalcomm=2Ecom>
>
>Regards,
>
>Hans
>
>
Hi maintainer,

It looks this change is not reflected in the media-next, is there pending =
to update or information required on the same to proceed further ?

Thanks,
Sanjay Chitroda

>
>> ---
>>  drivers/media/i2c/gc0310=2Ec | 29 +++++++++++++----------------
>>  1 file changed, 13 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/drivers/media/i2c/gc0310=2Ec b/drivers/media/i2c/gc0310=2E=
c
>> index e538479fee2e=2E=2Ee9e67bd73f51 100644
>> --- a/drivers/media/i2c/gc0310=2Ec
>> +++ b/drivers/media/i2c/gc0310=2Ec
>> @@ -6,6 +6,7 @@
>>   * Copyright (c) 2023-2025 Hans de Goede <hansg@kernel=2Eorg>
>>   */
>> =20
>> +#include <linux/clk=2Eh>
>>  #include <linux/delay=2Eh>
>>  #include <linux/errno=2Eh>
>>  #include <linux/gpio/consumer=2Eh>
>> @@ -84,6 +85,7 @@
>>  #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
>> =20
>>  struct gc0310_device {
>> +	struct clk *clk;
>>  	struct device *dev;
>>  	struct i2c_client *client;
>> =20
>> @@ -634,7 +636,6 @@ static int gc0310_check_hwcfg(struct device *dev)
>>  	};
>>  	struct fwnode_handle *ep_fwnode;
>>  	unsigned long link_freq_bitmap;
>> -	u32 mclk;
>>  	int ret;
>> =20
>>  	/*
>> @@ -646,21 +647,6 @@ static int gc0310_check_hwcfg(struct device *dev)
>>  		return dev_err_probe(dev, -EPROBE_DEFER,
>>  				     "waiting for fwnode graph endpoint\n");
>> =20
>> -	ret =3D fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>> -				       &mclk);
>> -	if (ret) {
>> -		fwnode_handle_put(ep_fwnode);
>> -		return dev_err_probe(dev, ret,
>> -				     "reading clock-frequency property\n");
>> -	}
>> -
>> -	if (mclk !=3D GC0310_MCLK_FREQ) {
>> -		fwnode_handle_put(ep_fwnode);
>> -		return dev_err_probe(dev, -EINVAL,
>> -				     "external clock %u is not supported\n",
>> -				     mclk);
>> -	}
>> -
>>  	ret =3D v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &bus_cfg);
>>  	fwnode_handle_put(ep_fwnode);
>>  	if (ret)
>> @@ -684,6 +670,7 @@ static int gc0310_check_hwcfg(struct device *dev)
>>  static int gc0310_probe(struct i2c_client *client)
>>  {
>>  	struct gc0310_device *sensor;
>> +	unsigned long freq;
>>  	int ret;
>> =20
>>  	ret =3D gc0310_check_hwcfg(&client->dev);
>> @@ -697,6 +684,16 @@ static int gc0310_probe(struct i2c_client *client)
>>  	sensor->client =3D client;
>>  	sensor->dev =3D &client->dev;
>> =20
>> +	sensor->clk =3D devm_v4l2_sensor_clk_get(sensor->dev, NULL);
>> +	if (IS_ERR(sensor->clk))
>> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
>> +				     "failed to get clock\n");
>> +
>> +	freq =3D clk_get_rate(sensor->clk);
>> +	if (freq !=3D GC0310_MCLK_FREQ)
>> +		return dev_err_probe(sensor->dev, -EINVAL,
>> +				     "external clock %lu is not supported\n", freq);
>> +
>>  	sensor->reset =3D devm_gpiod_get(sensor->dev, "reset", GPIOD_OUT_HIGH=
);
>>  	if (IS_ERR(sensor->reset)) {
>>  		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),
>

