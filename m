Return-Path: <linux-media+bounces-66735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cVCEKR2ZS2oMWQEAu9opvQ
	(envelope-from <linux-media+bounces-66735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 14:01:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8841471033C
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 14:01:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=TIJAuIeQ;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66735-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66735-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8542D301B5B2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 12:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62776424645;
	Mon,  6 Jul 2026 12:00:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A167423763
	for <linux-media@vger.kernel.org>; Mon,  6 Jul 2026 12:00:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339254; cv=none; b=TtltJxiX/2U53299TxEdnWrBV+71kwy1MwuvJywgvmSad+SwmdN2YMd2RVXmR2Rwp8hdT6odL+yfxGG3nZNeTQRGSlhm4HZA1Z4+ee1LtkXmV+UcZsOaJa/ATtvPrCBJdHtgvMyjQ6BA/mcZijD6YV2b2tYq1PxsQEim7yFjdJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339254; c=relaxed/simple;
	bh=r9XUtHpKfeTdXDwgOjlZYIyK35oBv8vrawLZipTt11Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvXpAvNGczU86NuTkbib3F2GPnx3YYYbxUOEV6gl8/vMMwOTPc+wZQdmAb32V/POkqY9aU59dQ1GsLjcuvH1bu/gy+N/cUrFEfYxKLTxGVEiVUTFAqs15zSiVp3EcrA/VpGXmPwcY5dnRP/54aU7/pjzE6Uk7okv3SskW3D4YRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TIJAuIeQ; arc=none smtp.client-ip=209.85.167.43
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so518538e87.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jul 2026 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783339252; x=1783944052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=biOXAUvJRswLbNqI7JWxyP6Sd5/K1iR+OePGqxXqYqY=;
        b=TIJAuIeQdUVxneW1BXRkIaJnMy01Z/U574xTj0MpR7Gdt20jRThYWvII9tGddlU7UF
         THcgBVC7VEoJSTqPbuiMJGuc373I5ITnLAx2iYWP3IZTQUO+OdhIh32fw0fue2+SXqfa
         fCCxaHsZr4WvXKKn6wBcecsmP50nugO6h54EAvPV9OYJqvRlxgX/Y40Drw4aSU1g68nY
         ZIiEQ80NGeahRb70yt6B1JyTlnnj2aFbtm6+GJzQsfIu5VUXmn0N+Bmt3hpH0+8jxvdU
         c3JEOIn7k28yX50GecTTPJ6ifRltsU1CXaxaAi4pw9iN5fZT+1Pg/mDI0JlEp5cGMX84
         /mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339252; x=1783944052;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biOXAUvJRswLbNqI7JWxyP6Sd5/K1iR+OePGqxXqYqY=;
        b=kc1Azw+f+fLYlGt569HZt/QnrtK8M2e+YEpYkT603cK8F5ZYY0Pe5o1x1kGeAGIgiH
         2ibJFeoElA9jFhB+yekWDypFfKRAafET7yMQweWdadDXiFmcHC45dfcVAbDBXR2far9O
         tDfB7J8IHNB98EpfOJ401oIkUl7i9Lmi/6Pl0tckxHhMcJzLFYTHMbaKEWyc2CGBZYfx
         XhXIO1RA0UBKEf9VtNxisDg88Qsi4zrYbtVGMQH8sfv6H0mGbw9NwI8Fijz6aOP1hk3L
         zp2jvq4XxKwPREFpcDzrcMNdNOD7As/gclJ6PvacRLg0y5ztR5hj3QRoH1QQbYFw92Jo
         tkew==
X-Forwarded-Encrypted: i=1; AHgh+RoYVbuNVkLjwCyvYXuDR7/86ceKe4L9FNx0dTTPZpNpw/9pQQeVBuF8FEfnpCYrSCb8mvfrVwcK0n48eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUrVhTF8j8wgw44yoJ0dJqj2WQOW8wfeZygnxZl1VQ+g3+dM54
	pfRakcJ4amqQ9hF30NQPl0kWCo91WECrouXpcDgb1IMgH15F+p394HJ3Sc/hEu6siXE=
X-Gm-Gg: AfdE7cmeph1l8sMclsyVMZB5IWNDy1m0IEAtEMAA7P+ihr8rVjEqD6epeA7azDqWKFH
	OAG3wOvYfQp9za8pexU7KxeYvSHoHvGjnJ9+6vVButMmQQmaBvQ4keTC2W8PDlPVyhPVqxUb7mS
	GFIqIwcXj274yCovo5YPBRdoyOCH/LYauNvWxIRw6SgXFjfe+IuO7Yjc5v9uaugCkNc/wBdVHr4
	uqTv2xtp1TWKwzJQGd4Nlo12VN0K+hHA+Cn3sDssC8M0mf6Y5bJvVJCuxprD7BQequ8Q/+t7pE8
	aB+6ds+rH5gBoLuMVUGu0KkNI5k/yAluBuDIq38ALZVxNxP9ITs81D78WBTD+nDs1ejWA8qGX66
	knw9Oi6MmfR9LPbo+uST9eff6aPUHqV6PBr4EodFjrwvmSohBO1/GeQM2FqshOJEIzAq5hXNwnH
	wW9H5vugAXnxoUW90mBg8ziqF+CR85morMduJhnrZhgCBIwYWQps73jg3f80rCFZlrwNgcVP9X+
	JvuQA==
X-Received: by 2002:a05:6512:8348:b0:5ae:ba8f:ad39 with SMTP id 2adb3069b0e04-5aed454f924mr766872e87.4.1783339251496;
        Mon, 06 Jul 2026 05:00:51 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8b5bsm2866776e87.80.2026.07.06.05.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:00:50 -0700 (PDT)
Message-ID: <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
Date: Mon, 6 Jul 2026 15:00:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66735-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[vladimir.zapolskiy@linaro.org:query timed out];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8841471033C

On 7/6/26 13:12, Bryan O'Donoghue wrote:
> On 06/07/2026 08:11, Atanas Filipov wrote:
>> Note: The handling of shared camera subsystem resources (power domains,
>> interconnects) for child IP blocks is still an open design question.
> 
> Why ?
> 
> A device needs to vote on its own interconnect and power-domains on any
> bus. A sub-device of another device may wish to ramp a clock for
> whatever reason.

Certainly a CAMSS device will vote on all needed to it resources, some of
which are shared and got their description under CAMSS device tree node.

> There is no "master" device in this block of devices - save perhaps for
> the CSID mux / wrappers on some of these parts.
> 
> We have shared resources like camera noc, system noc and external clocks.
> 
> Please include power-domains and interconnects.
> 

Why? The common power domain and interconnects have already been
described as resources of the parent CAMSS device, there is no need
to duplicate descriptions in every child device tree node of CAMSS.

-- 
Best wishes,
Vladimir

