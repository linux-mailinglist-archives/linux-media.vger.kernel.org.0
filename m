Return-Path: <linux-media+bounces-45772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C7FC13D17
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 533225E36F5
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F920302748;
	Tue, 28 Oct 2025 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4wEuk65"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5AD301484
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643567; cv=none; b=VtJfDMIJNb99Nifiuksoote2xYKQwFrZo2x8uSg6FRcm65Z0+dHPG87zlKnYcvIIkyydNyYOH0t3cmm2pT1L1wRUMXHzRbB9vXh2SHBLUFtbsbw5pC7o8HK9rq5VGQ94nZCs7vevtbFJN4VTzfk00j9jDcTX15zgb0jM4/UXHJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643567; c=relaxed/simple;
	bh=G3fa4DEKYJsrbjpYbG8l1S+0+U7oaIpFhApn3v9mVok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGQZ/4ZEYTQtyJxBlal43k6aR40NzqmfaRDJpFXIKjcX78NFltLtFQ/B8kRMCecWsWMthA0uxrUfHtNbOwOIugiMeRQCf0q1XAaILUnAuM18TC/57iFRwVsvza3VSfb/2YjuWPEkVvoOJLaFUt4L/+0kQ5FjVYzHYoaMwGm63bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4wEuk65; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-471191ac79dso59960455e9.3
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761643564; x=1762248364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WIhNUyRI0kZl2LUkLnytvQqzIt3iG3+keT/4POrd5A=;
        b=i4wEuk65Uva9JyllG5C3QAYlNH4CN9Ckyf3TnlnzuwawRg/lQIuwBvSboDw89RtB8j
         DrRkpo+XKGbDGzW342mx807zqrdPXxbPl3z150+96RbmE+VMnaxftxuNVg69bmCcKDHi
         b5MQV3sUliY/GOUPsn7/sXQtEs9CwwJEAzWHlzrUFPZW8vF14WGE2emLog1az3rmohVU
         4QC8GTHe2vqw2Oa31KkhnoqLCdx68gXonYBuJFuJG5Nwihqfn8dXj3p4ZH2kMSJ70jFD
         gOpOLdDhOWqGtvUfdawcU1sHQsTLLZaq9w1c7FzAqVU3CLuQgHkt7pn+VjWNOyXIcSTq
         MCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643564; x=1762248364;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WIhNUyRI0kZl2LUkLnytvQqzIt3iG3+keT/4POrd5A=;
        b=gbx3N1dEQncnsEmFgFnuNbVsvpvcJUH5r/8CiQhepHsP9CZyRz6S2nodNc0hCt7njE
         +Wo1a2KhSVnZGbG+UNyD02r73vcfKUbNwchJbvfkEl9O4dFJp0prcNz/Gqtz6Tz24Gni
         SptFzkl3UeED6JBHbsUqOp1M4fg+p7HL7QKjNunR59bpVEb0FLLBkoYo6HhXtZ3Acy0n
         5Tlr7SqN6n+5R/8/FubyriC7Ao0JcWImBlo2t3/mHwT9teEZ2008frE10ENlK6L1Ik7d
         W4oF8ubzKbNYHeHe/bJo12ChAM8TwW/MmW/D+5n1O181yzaVlRePxE4Z1r2PYlTFGaQ6
         4anQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE7+kaKkyQGBGV9rnlnY9N7FR78HPjJzduUd+JMzmiX9/a25nzS3T2kHEIuhR5l+hVFzn8AZJrfu7UIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTN9nmaAr/rte4M5S2PN1ZnkhRHkinG3M92h9Fo+Nt+Al4p1HU
	5AuKK/Bu2CZZTlOtOpMJJTU/2yhxWtyFArd/EHQAMkt3kbGBaTFjMB0C4fh/jM/sYGA=
X-Gm-Gg: ASbGnct2pYy5Ub8Shv80hpofGEufESZCf+vXQvaanDkzZ/R/Zna2xKqD6JtmuPMp5aW
	I23cQcCghunposf+yOuM/X4dGXZLMZ9UY3/SSz2DTY/q4tBC1VjOGQKRxQEm9X3PwOf/udkxWTC
	Z7sl2UC5tyi7ZCIgyjrb6+wcBrOnZ52W9NgV/LpGXLU3WD/FQWfGcQpGQK1k1Dr7bc3mi1m8qC0
	ZhAupkvEh/1gKHEu0adNqnvFpXwzzbZYMtOD6zJ4xZhb8ufpN6C+iL0OdQbLG5kM7uH8OIY6UXM
	svRlvQmUGzfLdDwI7Yc2p3579lUf3RD/q1/00sDqdXL9MdFnvIXNXl0KlUUTJz7W7ViTnaHBX2L
	CgsYxqqO33psjB+SzYRun1vsemmyYPozXYTQHQJodNufGrGDrKBcSqG3QZMUTl54h8/xDVcAPRm
	X8uFxJw7hVy1vKsQvVIpd3W/lAkUWKGsP+zxfJNkbYSlz/XAQjudy+Kw==
X-Google-Smtp-Source: AGHT+IG7SGjSk8s/DTqkizgYBNEXizsx92+JaKgr3Y3fQprN5gLYg9kJPcLa3kFS/x+7fFwVaMqF7g==
X-Received: by 2002:a05:600c:470b:b0:46e:32a5:bd8d with SMTP id 5b1f17b1804b1-47717df9dc0mr25845305e9.3.1761643564349;
        Tue, 28 Oct 2025 02:26:04 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd035dc2sm188343505e9.5.2025.10.28.02.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:26:03 -0700 (PDT)
Message-ID: <7e7e35f3-82b6-4757-bbcd-38e0e867b184@linaro.org>
Date: Tue, 28 Oct 2025 09:26:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251024-sm6350-camss-v1-2-63d626638add@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2025 13:24, Luca Weiss wrote:
> +		.regulators = { "vdda-0.9", "vdda-1.25" },

I'd like a little bit more consistency with the regulator names.

0p9 1p2 instead of 0.9 and 1.25

---
bod

