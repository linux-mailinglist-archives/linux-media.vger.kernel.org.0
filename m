Return-Path: <linux-media+bounces-32870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB33ABD149
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F76416EE64
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF1621323C;
	Tue, 20 May 2025 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5rdZPjk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06356211A16
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728157; cv=none; b=PV3ennpPBC10P6/v5LNv/YlfkSOGHAtGukjz0PDcjOaXZOk3msN+Eet5Invo9YKdsWSeWiQrI42/neyKmQ6n6trc8iMBM6xPf8xQGhuqpte1Llhmc3VYOlDs29Qrfc44k6IcfGQiZYMxkR8H5Tcit1pHBLjvWm4TXr2sxa6qLII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728157; c=relaxed/simple;
	bh=v0KA+Ia6AKLTU6vaxhYFy9TsgIMQZTdhfRc8XyOtvG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jL7xOvRByUbUmVX2pYPoPyaT8c/K0xcM3AXcs3iuJEIK8t8JXu1f1fhswyYFmbyQ4dRc67xQAaPgjB5pjsl09dK51of2s05doc+BxC8wsJea9VS9X7C9UtOmtE/EXLdWFs/pzsU4Zt0g1mZ0cjR2W/iDaCx15Uji2/Yauo5smb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5rdZPjk; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso1117867a12.1
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728154; x=1748332954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c0WaLeySgYJ3O4eOM3NclXyBzpxZhxIahw3cOzvf6Vc=;
        b=d5rdZPjkXRWE2vyO887xUiScc7JGPf4qvpfra/QKMtF2+C3v80gV3P6E29TsjX8grn
         7NWNXp810IjgIVHDzy8adst8cqF2qxgrGKzJu9O3c0zIrf4olQtWXuDVAsRFgT8MbtKa
         JKDm5qtjOJj0tKyZlUf9QvgTjXWNsmu5mC2GxMQfwqWavXWAhoEoF+Q2ZE5zg7do2nOl
         8mS5kR5f16y0BPVZavTT4pn1szXJqh0d9PX0cl0JwmMSL9+Er90awk67Z3zxkbZSqj9q
         BIuJFHa4yl4hiLZiK9lt++oFsXqE75C4bI8bT5Vs5z8np0ik4AWYgrt+Pxg+NKbTXgaf
         l/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728154; x=1748332954;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0WaLeySgYJ3O4eOM3NclXyBzpxZhxIahw3cOzvf6Vc=;
        b=eyH/Y4RypxZ1M63b0oDGxgtyOUsvi7hSvjsojIxGCaxlx5I2tLpU9+xbLpLmKPEn+t
         rwK0CcYsKDj272XPqrJ1MUOHBe5unf9NOWdoIux71VlfhuTff0tkvEAqHEvHG1eBeWcd
         R5XBhCQsDhgx5FYFH9fku27CcRa261e06eLcOoojAA6p+wn+RiSAHyctMXtV69aFXAis
         qWPl/6t51Wim2WPGr4iBrb425sla3E/Kvk7YcqHLXFmEiXuZ78qBOQ37N2cMwhQwoS7f
         7HcgPKTapNMNpecOvC1Q+PxG0+++xJ7pA1JRs9R5eTQi6kJQJ/rsft0sXVlnNvCckAgs
         re8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpOTekO9nxMBobhZJXB6YgzyTRIQAH85Fb/ox6tw3glgiX/Ab7vPHyxvWnmtuDE+WDK91B7NxJBA9tLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbp/pvs23iBGGyrINxMFXKVRhu7Q4WOEWcsaZNxk+zrBEDqSP
	EdTw74KCH2WY1m3kxXBlO4b76Nn7GHdAb7W9H52cONCwEKfOw5N2iDDopJcHQv/Mmv0=
X-Gm-Gg: ASbGncuDuhmxMkzt0uXAmx4VWgacIus/m/Fo18xZWf/JW7cQx8BngT1eh6L7D49D4s+
	qLVSiCItIUtcccZpnPZGvZrpD+pHNIxK0jyr7O/ZeKQ5le8j/Qzx+eoWXmgOs6Jwg+km2ggdZ4v
	jINkKYI2sWP89qktK7/6bqAexpy/mjQGIZFS8qpcYauYegGWG2eAx1RBEPPK9CWKekbSmaWR/Je
	sxWIg7x7XKyXYVfGkfS3xZ5wLKjRL5WoI9KVzzR1/mE5kl+uEOydQs8tarK5ijAx6ZSM8P57Sgd
	teCz2bPO1pEN/EzQdh8NegqsGC4nPcA5AXMuhX09uqwVg+HxafZigVQcFfPVoWXOqlzQRWowLyG
	svEL0FA==
X-Google-Smtp-Source: AGHT+IGYkquSWyvlBeDuSbtHciwIcdkDkgm9sqwNT3vXUqO/eRvOX01n68zYbfiscV6GoL35v0UdXg==
X-Received: by 2002:a17:907:2ce7:b0:ad5:28f5:fe2b with SMTP id a640c23a62f3a-ad52d4ce281mr455191366b.8.1747728154224;
        Tue, 20 May 2025 01:02:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047ce3sm689389966b.21.2025.05.20.01.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:02:33 -0700 (PDT)
Message-ID: <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
Date: Tue, 20 May 2025 10:02:32 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Johan Hovold <johan@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aCw09Vci12txhYj-@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:53, Johan Hovold wrote:
> On Tue, May 20, 2025 at 08:06:22AM +0200, Krzysztof Kozlowski wrote:
>> On 30/04/2025 10:33, Krzysztof Kozlowski wrote:
>>> On 30/04/2025 10:30, Bryan O'Donoghue wrote:
>>>> On 30/04/2025 09:19, Krzysztof Kozlowski wrote:
>>>>> If anyone wants to know it and cannot deduce from compatible, then add
>>>>> debugfs interface.
>>>>
>>>> dev_dbg(); isn't too offensive really IMO but if it really bothers you 
>>>> switching to debugfs would be fine.
>>>
>>> Yes, please. Dmesg should be only contain issues or some useful
>>> debugging data. Probe success is not useful. It duplicates sysfs and
>>> tracing. Version of hardware - well, I am sure it duplicates the compatible.
>>
>> To recall: kernel coding style is also clear here:
>> "When drivers are working properly they are quiet,"
> 
> That's clear and well known (or should be).
> 
>> and kernel debugging guide as well:
>> "In almost all cases the debug statements shouldn't be upstreamed, as a
>> working driver is supposed to be silent."
> 
> But this is a very recent addition and questionable when read in
> isolation since debug statements are not printed by default. The
> preceding sentences do qualify this:
> 
> 	Permanent debug statements have to be useful for a developer to

Keyword here: useful ------------------------^^^^^^^^^^

> 	troubleshoot driver misbehavior. Judging that is a bit more of
> 	an art than a science...
> 
>> So I really do not get why this driver deserved exception. Nevertheless
>> I think we agreed that these logs can go away, thus I just sent a v2
>> with a bit extended commit msg.
> 
> Spamming the logs as the driver currently does is clearly broken and
> should be fixed. Keeping a hw version dev_dbg() is generally perfectly
> fine, though.
My main argument, expressed in the commit msg to which no one objected,
is that this debug is 100% useless: deducible from the compatible,
always known upfront, always the same.

Best regards,
Krzysztof

