Return-Path: <linux-media+bounces-60928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDpNCNfx/WlxlAAAu9opvQ
	(envelope-from <linux-media+bounces-60928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 16:23:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 084B94F7AA5
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 16:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62D7C300D4C7
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 14:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEF03EE1D8;
	Fri,  8 May 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tgUsYatJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C4A3EF0A5
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250196; cv=none; b=dYygqxPVPFuyrYnnQqyzYM+bJGpFoAjVEysihv151n47mS8tHtHZ0Xfmqj/rFdebxtZqnBfZ8sllonH/3ue/FPFgzG2/tJQrelMOZMf/DR1RZqKf7X/ao2TmlAE29m4Cv5aWuezFgqloKsLmEC1dBKMV0oRxt9cFPk9IZCWOWxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250196; c=relaxed/simple;
	bh=ManJat2Px3QZ0GJzd8wVC++psBG14jWrGPkE5Xc+QjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0y3/wJB+j3Oxg5zBdYCUws4grg4n26t6pcemOmszQN/Bl1ejQc1GP7cxc6F7gglScQ+oH0nT6JPhmYb8mOyovNE2Q5+XwBof29xneajomJ2FerVsw0FDtwbl/jCaTioSbIYn+w/DKRyc8l8GkJYPCiX85/SPoL+MDvOgSIuA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tgUsYatJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bb962ce4dcfso314000866b.1
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778250193; x=1778854993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=;
        b=tgUsYatJ8EjQF0k8zVoW4rLCBwuNKZOB8n1hN12Z5/0C35Scdaidd1ybzI7eYe+HSk
         Kq1ZSSzn7ppxc/+cYO1vlWfx/f5K2sIAKSm4Sht2g5erB+vJkJAyDHNjXti73+v61to8
         0CeaZfBUGVgyc4SYNma9WtwHYaiSasg1CXzVHBtIbDW5lLBq7selTJ7flEwxifm47emr
         /qiYFy24M1VSz0W3rmj9W8FW5S8aPzsFgTJWEC1+HTEAMlx1kbwl8QHnslZFveUeEEdI
         1bxTznL8O1GYym7QwtTHnPi3zGetrJRe29UBGT9RdWWVpUNKIBd0Fn2k5MHeQeXB6WRu
         QapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778250193; x=1778854993;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=;
        b=srSIysnge0aWAOx5BrHAQfvtDV9fzLIZjXiS3uLb0UGeCIrPOdSobcyNJSJzQ/OfLa
         O5FhezX4mshsESTzx/Tl6aFcwoDdSGOF8FCEzqw0Io4Lco/QBC7aCTus+ZC5TGTGZxkt
         nVdReQm9Y6J0rNr9cnJfW8Nx8EosV+PK54kgVGtawa0N5eq3CjqHBZktk0M2DAN8k8g5
         53N+y1x5a7XYD97HJXRFhiX1r3sKxIDgCCeWgikXuhSiUlTtgS+DyLIxPVNlDIA/SySS
         sVtjBuqNn9si3YjP4AUFM2oQYS/gJ0Wc01YwV+yVzVoED7uwRb9lE5ps/hTYvcDQeVdn
         tZQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XcC9WZequc8iElrI2LFzSv0g6ej21n5aImGEAh+7bzKGOas+4hd3YXX4pc66whbQ/c7a8+Wc7GrAE5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdXRaTMIcd3YACFyh5AguvTuxue5THiB9GICgQHMcXsc6F6L9
	ryhBb+YeiRqgeJgXLbqrakqiLcb1Ur61RHP7uXgZVUqukCDE1DAZPw76QE1xYTEnyGg=
X-Gm-Gg: AeBDietuO3v9rFmKPX+XXWYD5yXa7fdihMeVWNBN33TEb4Al734AdK1TnJxKahpO5Oe
	QfWY31URXPm87I/V1P7xV21CNt+HbxP2zZyi+jgtUldm3H8lpCbc4pzq0Xptx6bGYIKjkPUcViH
	W+971525scNt9Dl52+oc0zFJ8YRX8L+GGNZqEYyYeGydODdJmUxUdh2uZSoP85Xakv3ilDYXJHB
	vYP8ohTL9CLoeMet7KMNsIl8qQFN5MJLisUur0WTDf/bRrISa0r4LeuMH8vxUalY7YL+JByOq68
	T9UmYYGmLWN4KkoG5qbbltYdbHi+X7MORtN/FYL0ONRNd1xaz/VPhgE1/wm6n5MOrvvmYXPVQq/
	EczJYwjFbK8OK0a7wHVedujzdZFfPQT4QMPhKmaReVbcrR5vyY0wBNq7FYleqf00rKCsGNXS3/s
	ISCYzDCJa/x8QLHSFctKACVt1SmWrRyVOljC8=
X-Received: by 2002:a17:907:807:b0:ba5:2f0a:2f40 with SMTP id a640c23a62f3a-bc56aa45eafmr738018166b.4.1778250193349;
        Fri, 08 May 2026 07:23:13 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.20.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a648sm703741a12.7.2026.05.08.07.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:23:12 -0700 (PDT)
Message-ID: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Date: Fri, 8 May 2026 15:23:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 084B94F7AA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60928-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Action: no action

On 08/05/2026 12:40, Wenmeng Liu wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
I'll repost my working version with the PHY stuff so I'd kind of 
appreciate you not posting an old version here, just wait for it to land.

---
bod

