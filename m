Return-Path: <linux-media+bounces-65179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qc0fCDnRM2ocGwYAu9opvQ
	(envelope-from <linux-media+bounces-65179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:06:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272069F9DA
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:06:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=U6zlviGb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65179-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65179-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EBDA303955F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E366A3E5A31;
	Thu, 18 Jun 2026 11:06:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B658B3EFFC1
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 11:06:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780786; cv=none; b=jbCMrcfX28G5ENqZ1cfOpbN0UYl86abQZAlqmJvoDjtm7EsPBmAm8IbLjefmbGgvkuzX0XBc23ZSHnTs+hKvRbi5nuRf4CZgOnMa5Nve8d8AEhbAY646cRsAf28NWghYbaPhRe7XQDH7OoqGZXClHnztj2VIsDKbmUGmZLWs6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780786; c=relaxed/simple;
	bh=NUicbhiAO5ua8Me7fPWYRCJJaEuoMDgg8YsbHkXxjJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ASfwrdVO60U+5trVKmIULJdupu1rzgobL2C5VGiXw5N9vtHPbEUHpmhbo21NapPWlYnKQ+yU4G81s9hnXjNU7aRhY2mgRWJbWYrmodMGOEbqBDTYEE2mMMHuVPFfPJpKslFky4D+UkbroYN9vy7BQvqtLeRrkI/rVrzkVF5xNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6zlviGb; arc=none smtp.client-ip=209.85.208.174
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3967720c093so510151fa.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 04:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781780783; x=1782385583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0fmq68+3hdiEDF6JrvX9WBO/0vNo5qekexZmlbtfqQ=;
        b=U6zlviGbR/sHt38EuJJaMSS+Aie2DDZKM3tyJmCDEt3ejeBcDh9CojCqQLvg+12OAG
         ggcZBfIjj/HEdAJtrZbVQpDYW+qkKay9KeeHPoQt0+NZnimojlYmAxmPDF46dCq33BV2
         JGShS1F34j1mLLTq7pDXXb+Lz8ZwjFCvAcSWNY9Q2wwZmVMcfQv20afoWaJCnGsHUTj5
         AVqzz/H9wN2o/3H/BdAOqU+txmXhKWioxtfmnWroXG6WhiNal9f3V3A6oeI3KAcE8msN
         KVBxi2fNdoYhxRv7afrT+JXbRXUT1VToVN/CD5p9wLzn/O+m+6QGagVk0roNAE1zpLva
         1shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780783; x=1782385583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0fmq68+3hdiEDF6JrvX9WBO/0vNo5qekexZmlbtfqQ=;
        b=L4BFjqMekolu/rIrcm9GUWqFfWllHoirj6GwWmn+ywuHpiBssZ/WhEQRJOYdQWENzw
         tN246sBqf9aYb/tQnV2232PFwEyH7Ywz5pONr7mpO8Y+dctY/E+jjfcinRjfAMf15M2M
         Jd00SKh+HTlbDTShgxvXhFzdictBvxKTTazyGGhVr8ZX6nH9vpLxs+1KHbjKENPoUoN5
         +y+2o8BOGA/1DVCGPioJZ3eG3RfYRyi/N/ku2zZgIwaeJ+z4y9T5IZ7f5v9pYg4c+xVC
         O1YFtc+Ex5qLBcX3yYYpObNir6JAC2UOs/5T5AW2I1khrxwbCKSZ+5eP14HiJJqtHWma
         AUSg==
X-Forwarded-Encrypted: i=1; AFNElJ+yu8fl3bAvkdfGTY+iUOrTo8LZLhis/qkaKu86S5SdKeorh7R37n7p5os2IGfSeO93tKWr1RNKSBnl7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv9bT21lSwxkB40esGXpTrzHYln7Dh4/ISJUw7pUUHGjDNJ+g4
	eEm4mdT2PmjjR2ZZ19D1cuP0vwVyN3PlzrQoINXlkBsWj+coCJe92hiQJ3kx8MulTiQ=
X-Gm-Gg: AfdE7cmuazdigXonKmJfGAXz7bRLpbQWjgHRqdwWLx3cXuLW2QnI/UaoMJYCxcpE/kU
	KABbCMQSC/d18e9Q3wrTseOVaOpAo6axR8oQYt51kEmqRXbN0TJTedW23woDRjQOV45v21IBCXL
	kQwoLmVnqkNhRMTIb7kMFrfD2u8oI9yDfQL+EsBCde7y3mt0voBrSd1f0SHIEVHqq47RKpmsOe5
	hk2+9FCTAUucWbqxoqlWw8eXbVMQVpgvlObHo4l7fGrPi6ci547DlR7WAGYdoFWuRJhFaWhbuUi
	usgFhPgWJOO9jFcShdIdHyqfdlvCX/u0hZPxyzh+XdACy5cvuixd3v6iiFVp//7lavUxeXDI51Y
	Z971xBk5SwuEEdweRwtK/lyFwsxk7bKYmmqqCdnG9Hfgg5uxy0ywG2bNKrSzT1jDbjeNgOOsV6E
	n3W587pBkBzSSvZrxXOUEkhPnnkyz3KyWrvoFRvAqP/Breyu44POJWrc6qs9HMZ7i619A=
X-Received: by 2002:a2e:bc87:0:b0:393:d08b:2a0c with SMTP id 38308e7fff4ca-39969a9269cmr11594201fa.2.1781780782745;
        Thu, 18 Jun 2026 04:06:22 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3997238ea3dsm10911441fa.27.2026.06.18.04.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 04:06:21 -0700 (PDT)
Message-ID: <fa5eb21d-ea67-47c9-b00e-6b9060e0c5f0@linaro.org>
Date: Thu, 18 Jun 2026 14:06:20 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: i2c: add os02g10 image sensor driver
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-3-elgin.perumbilly@siliconsignals.io>
 <421ae63a-88c6-4e81-8478-7f581357676b@linaro.org>
 <MA0P287MB2178300B0541EC81B91312F588E32@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <MA0P287MB2178300B0541EC81B91312F588E32@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linux.intel.com,foss.st.com,linaro.org,gmail.com,intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65179-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:elgin.perumbilly@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:himanshu.bhavani@siliconsignals.io,m:heimir.sverrisson@gmail.com,m:jingjing.xiong@intel.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,siliconsignals.io:email,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8272069F9DA

On 6/18/26 09:22, Elgin Perumbilly wrote:
> Hi Vladimir,
>   
> Thank you for the review.
>   
> I have addressed all of the comments except for two, where I am not entirely
> sure about the requested changes. Could you please take a look at the points
> below and let me know your opinion?
>   
>> On 4/24/26 12:25, Elgin Perumbilly wrote:
>>> Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
>>>
>>> The Omnivision os02g10 is a CMOS image sensor with an active array size of
>>> 1920 x 1080.
>>>
>>> The following features are supported:
>>> - Manual exposure an gain control support
>>> - vblank/hblank control support
>>> - vflip/hflip control support
>>> - Test pattern control support
>>> - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
>>>
>>> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>   
> ...
>   
>>> +#include <linux/array_size.h>
>>> +#include <linux/bitops.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/container_of.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/err.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/property.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <linux/units.h>
>>> +#include <linux/types.h>
>>> +#include <linux/time.h>
>>> +#include <linux/regmap.h>
>>
>> Please sort the list of includes in alphabetical order, also you
>> may consider to shrink the list by removing quite many inherited
>> includes.
>   
> Some maintainers prefer the "include what you use" approach, like Andy,
> so I added all the headers that are directly used. Should I now remove
> any inherited includes?

Yes, here opinions may vary, that's why I asked for sorting and to
consider to remove some of the redundant headers. In my personal opinion
this type of excessive information is not needed, especially if it is
justified only by probable and far future trivial clean-up work.

>>> +#include <media/v4l2-cci.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-fwnode.h>
>>> +#include <media/v4l2-mediabus.h>
>   
> ...
>   
>>> +static int os02g10_set_framefmt(struct os02g10 *os02g10,
>>> +                             struct v4l2_subdev_state *state)
>>> +{
>>> +     const struct v4l2_mbus_framefmt *format;
>>> +     const struct os02g10_mode *mode;
>>> +     int ret = 0;
>>> +
>>> +     format = v4l2_subdev_state_get_format(state, 0);
>>> +     mode = v4l2_find_nearest_size(supported_modes,
>>> +                                   ARRAY_SIZE(supported_modes), width,
>>> +                                   height, format->width, format->height);
>>> +
>>> +     cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret);
>>> +     cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);
>>> +     cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
>>> +     cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret);
>>> +     cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);
>>> +     cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
>>> +
>>> +     return ret;
>>
>> Just "return 0" here, and remove the local variable.
>   
> Could you clarify why this should return 0? The local ret is passed to all
> cci_write() calls so that any write error is propagated. Returning 0 here
> would appear to suppress those errors and always report success.
>

My bad, yes, here please leave 'return ret' as is, I was confused and
misleaded by initialization of the local variable to zero, which is
redundant, and I'd suggest to remove this initialization.

-- 
Best wishes,
Vladimir

