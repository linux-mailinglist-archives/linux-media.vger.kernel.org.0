Return-Path: <linux-media+bounces-19551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3F99C35B
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 10:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14397B25FDD
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 08:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BC4156C69;
	Mon, 14 Oct 2024 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VUNzeSgl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3F1509A0
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894679; cv=none; b=L4Utg2yRtKT4e5PzQeDdf4SQq3bDR+unjyrZ95MP0XioELCJyO3m3nK55ZOsAwS4Tjyo5oKq6ilaGWoOWewBSjt31RZ1948vDqDZxkqmt5i6YyBrNl33lpvVFQ0w978845dy0VGHLNcQqechJUqexy91cAGgkTZmVPHTxP7igGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894679; c=relaxed/simple;
	bh=Fv+iKDGnubuClZOy0sgzuUSOaRDVqKI+AzPFvb16xxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lob6PBKZIagJfpBlVqyJPCaUC10o5w+h8MCn95Hr2DY3yqK6ROGP8i/NTk7GyHRWfZpyBu2AsE24ARUnGIsFkG76K6BsaHe99PAjuJ1gsGekA4zV/APTUuHT/2LUUyOLKMzcviTFawNcFlWF8b8AqzkbT5XFl+/E2hVXVA7jYtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VUNzeSgl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c962c3e97dso1836670a12.0
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728894676; x=1729499476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVYpiwMgp/0jaR9U+wh+xTtNu0fqPqTVzNP6AS7gd9Q=;
        b=VUNzeSglEKwrq4M23wXEmHjG5rFqTfMvkTwY7gIPu7PMq8TdEwKlyrViSgWMKQ5I80
         VfRlfbbK0lWhaM7ojeUaJr3HKpRNqW1YtyElRNvIvfQ1elddwZiNsjBet8WPpDah0UKX
         sCrxrUdZsdEdGkX250UPEm+KdcAMRHWUSnOM9fNxZp6zL7Z+ftvEbowAHczuni/rNwbT
         EOkXd/bxx7grzL3TdRbZUm+7OjuqeXNmvsH1NXudNcGiiMcN/NhBdhJNNORSLThTTkEG
         /SzEKKMGIC/9yxChKrDeLsRaFMsVdMrXofODtGbRoiWkv229z1TNwNb809c5kfr1PgfO
         gFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894676; x=1729499476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVYpiwMgp/0jaR9U+wh+xTtNu0fqPqTVzNP6AS7gd9Q=;
        b=YybQ+Xsvj5LqA2CvN6CGLc3NgsWWBJUAeQeLQAv5qAInfo4Sh4jOAqVuSJlQnPsI8m
         hfe4wZO6dwq4K0Rlly3SaTq+kpLZ5vM3ZZt4uZGSgZWoePJ+a/CWqO8ZLtDFF+oc52na
         hwTi7uN3vhEt5lK3GH8x7FBvzR5YLQMDxHYgEn7J0HhvGzVoZnv7KJs9KraBtAiB/172
         KcUR1NZXMGq2keAOGewkAZa5n7xshMxM8XSBP0nA4byB96VfpB0qf/AY3OKGpdCemDmo
         I/OMneGpivSaqsgKnZ0mDfoPpwZHPC2SkuHzS5csZpifI+n2jikYlZnUStzqSBRo6aVc
         x1tg==
X-Forwarded-Encrypted: i=1; AJvYcCU77eEtipvjcgazLQKAoLERQnEhz4eA6jmsaQ2E51ENCQLiYf46awtwwj0OywtxZXIxbYMesL9E7Qj9Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi5+nsrfwUJUiSm2fg2T7bIuDI/q32LqAQSCdvlcWWrcCcBDVR
	2iplOK1ZTP8XeMwx312iZMKDj6PvBuIVVNGm+sZ2g2fkgCqdIeI4uESkaSqDCeo=
X-Google-Smtp-Source: AGHT+IF4ZeTiZ0TXalZNrlD6o7WG/tvA0YCER2qeJ3qHcdtTBeMwseRJMf6VI67pV1MSibnaeMxnPw==
X-Received: by 2002:a05:6402:2786:b0:5c9:615d:c784 with SMTP id 4fb4d7f45d1cf-5c9615dd641mr4858375a12.23.1728894676407;
        Mon, 14 Oct 2024 01:31:16 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711ba5dsm4634615a12.29.2024.10.14.01.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:31:15 -0700 (PDT)
Message-ID: <6f461cb3-3a41-4a3d-b9b2-71b1c6be77f7@linaro.org>
Date: Mon, 14 Oct 2024 09:31:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: dt-bindings: Use additionalProperties: false
 for endpoint: properties:
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Todor Tomov <todor.too@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
 <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-2-a2bb12a1796d@linaro.org>
 <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7ecxjoa7aije46cxmkyfd6ihxnqw4wleqkioddomxbwlu7qtrc@4dkfitppeksu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/10/2024 08:45, Krzysztof Kozlowski wrote:
> I do not understand the reasoning behind this change at all. I don't
> think DT maintainers ever suggested it (in fact, rather opposite:
> suggested using unevaluatedProps) and I think is not a consensus of any
> talks.

No there is not but then, how do you give consistent feedback except 
proposing something to be a baseline.

On the one hand you have upstream additionalProperties: false and 
unevaluatedProperites: false - it'd be better to have a consistent 
message on which is to be used.

---
bod

