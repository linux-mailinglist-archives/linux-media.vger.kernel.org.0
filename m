Return-Path: <linux-media+bounces-55897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFgvE1Xyt2mfXQEAu9opvQ
	(envelope-from <linux-media+bounces-55897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:06:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8629922F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 996173056173
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872B839447B;
	Mon, 16 Mar 2026 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHSj+cUu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B1283CBF
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662653; cv=none; b=QP1Ta0QTwVztQQ86XvtwDhfu716Axrr7hw5ICii/aDzmwwoW8U0k0EFlBVghqYgh1wQ3KygV06BKv+Q2Pat8p5UFwezpAcNsc6JB+jrfI82s4U6LA+eE0MJVfxhJitSxDKYCMiJUAo7g8Fuk8Hcq70T1+yy8YYogD5ieoyZJOkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662653; c=relaxed/simple;
	bh=LX5yusRdGu2NPKbwJNIiJLhad5QQp5GkRw1dSGQMaaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdjHQmeE/+K07JCY2cnFR/Do5NjP+eNVfiFtAw7kb9dR1JpDSSU25CutBBX+v9pTJ3twJh+NDVxsQvVPcfgzZDe1aC35hgyZUkFFWy6VGVQSt81Fj3R/ZBk8uIL1s3LV2MQ/7rEgKMJcVtG6wDmBtA4hhP6WxBP6oATb0YEyaR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHSj+cUu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b936331786dso507491966b.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773662650; x=1774267450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cXZiqeg/Ax9pD8IPIWwwtJQH6u7g8vd5+THmAzzvx+k=;
        b=cHSj+cUurK7pBBqBPSZw0HfyDplYc3TfR85XerAUER8XotcbHoQvx3vknvr2X4BQyI
         4xi8gJUQjVwn5P664RsZkLfdFKz6GEIWWgV5qYLN7+pchQes3YXBChu2EIRbFNQK99wJ
         LkfgelXkfdUSD9QEvG5N3OHWdabmRFz2j5GTAPZpl9SOK0kFoXV7LKUxNeOzuqh9JvK+
         zmJci3zwe5a7rnHIzwWYYokV5rwzTjAPyNSJCYNRRYNfSaDGcqWXi05SgrLdKCcgoCiB
         xSsCwoR+9n12f3sdV/bcpi3XguHOP1gctIU+raRYkfC2LWcbCTf7vxtUuizYh+pR9GA/
         7ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662650; x=1774267450;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXZiqeg/Ax9pD8IPIWwwtJQH6u7g8vd5+THmAzzvx+k=;
        b=CST6Ky/xIAnXYosikAKZzZWWKfsMsJ735OO43JYbZRlbvRzpnWaVSPDxAS4Igu0/uD
         Enf060wsOS/Ly3st5A9errMk8iMWwwFfiG86gWjkmiQvavg/HaM4btBabCRCY4+BWBr3
         /lZbgmwtoBm7YYFSr8srFBroTVNQAd86s4eK4yVzkaGTGi511fzpudnj49kDlEX7Slrd
         va6icWOSFda0aWMz4O96eKPNJlom8wBnZs9f4CLtIPZOCcnF8SfDlpVLKHfzVVT+kBSK
         iV/1beZ+NRr457necMlbPnjuR//o6ch6Vz83kTCW0Jp30gP0tiWkqJLI9DUZOZpha/un
         amVA==
X-Forwarded-Encrypted: i=1; AJvYcCVGgrVPOUuxWk4hHuJiIIA28Qv84aEcwiM5nf09T6bvJowOq79lvpaenbaSH5NAok5i0Ei+9PSSbtbe2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WUpj5zXSi+M6ifo9xfF4AJRUFbvV8k2GW8TkkGBYBLNeM/Gx
	BFQeE64yrx+lgp13Bpf4ZYM51NeLQ4Pl0DiMW+9m7FlUgNai1B5quwYl//OyyRfmJZs=
X-Gm-Gg: ATEYQzyZHLlndvScXgUCip+ZxdPOZ0OhUz8JnjJpJ0z+k1x5EG9Wm66rIRyIrWh2U7N
	4olrCzD5pufJBl/AMtAPtGxTXXBwF/xPLc5sWJH7oiT9t6CyGMz1w0q+PKq66AEJZQERx9rIaNl
	zXioa+0iF+2rYYXDM/MaQ3oCqQ6zh1dmMv+RtrvVMEig1uTwaI+YxbuLw12n393sJgtzLwlKJKu
	cfeLGBZIvAiZVnZT4xdg6XLqEluiQqOv5TlfjJUvmek463jTnjsAriucLAfZQq/YBZEbGq9fUYz
	1xgBWPDwt1SRCEujeYZhRO5tNCC8g79oZXLAauX20xjz5TsXqOQqNoRzrJLJkl1k3juDBskssBb
	isvgqQD9ciCaY26LRfmUxIGjmoOSscaU8w4xygKY5YFrMyKCCV7ghS/nXNWz5P2pYvsXdehBes/
	O3s8XuGCmye2rP9SGB9liPvR29+QQ7tdNoFeJF
X-Received: by 2002:a17:907:1c88:b0:b97:7659:8bca with SMTP id a640c23a62f3a-b9776598f6cmr548363066b.40.1773662649653;
        Mon, 16 Mar 2026 05:04:09 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97d201082esm10993066b.63.2026.03.16.05.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:04:08 -0700 (PDT)
Message-ID: <976c8a29-bcb7-4207-9d3c-5b1f6036300b@linaro.org>
Date: Mon, 16 Mar 2026 12:04:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <55db5547-96b0-4d3a-90bf-3d2b289abaa3@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <55db5547-96b0-4d3a-90bf-3d2b289abaa3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-55897-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: B6F8629922F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 10:12, Krzysztof Kozlowski wrote:
>> +		if (IS_ERR(csi2phy->pds[i])) {
> API is terrible, but it does return NULL.

Ah b******s... thanks missed that completely.

---
bod

