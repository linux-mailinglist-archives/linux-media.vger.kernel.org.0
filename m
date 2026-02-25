Return-Path: <linux-media+bounces-53340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIYYMr3+nmlAYgQAu9opvQ
	(envelope-from <linux-media+bounces-53340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:53:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE8A19863A
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 14:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CAA4303E77E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D836F3ACF17;
	Wed, 25 Feb 2026 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RKgjavTx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D03161BF
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027291; cv=none; b=cwm5quVTRIjXghAu+Ob+QA9g0dl5pl4n7C9F0tCUSYsdBHSNLTpgrmPh9gvJGFhvzI3UIe37YbwEzyA3Rkr2HfGflriB0TxuNO2bt75YpYCP41qjOA1UcoW7STZKEBxGD1+QzDW4cozzpbmHDL805qhVYo59PF8kCGBjpLsp+50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027291; c=relaxed/simple;
	bh=RlmrWYpC27I3CmQ2g9mtzwZZvCPgpL3v1Rd019SyxTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LH47/TNZ1KORW+5RYoB7YtpubFZhZq+MGme5yBW/Ke4UAalbX2Il8gycUUWQT2Z6Wpt8NVEho5xmHJg6twtkR2rl35oTiXQFRqD9ErKY8ybZN58rZ6PBmMeMrLD6AVmRFv/2n/2v0fxTwpI42j+CsVv8WGEBQ/6FZd0RKZvDCmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RKgjavTx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48371bb515eso84457665e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 05:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772027288; x=1772632088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eykmgvSbv0vLUxYY3jrSx+qlZUgAvR5496gVQzQWS8U=;
        b=RKgjavTxc90yhm4olN2IfaQ+LpJmO27IsSpqEWQVLHqveqiqdtA6tQLh/ovpSipFfv
         0brrHI4V/SWiEBFozQPQ0iT6v150WVv1Fa5ZnMcZ0pnGjmneGr/r1YPbt2ri8yirwERo
         NJAJc53BYNY+yhCLXKhiLO/DT9+ggKqxEfyk226n4s/4aBvkSICZyk0ITFcpHaAHSmrY
         L28StWalaM93DWTkdVwVndXDe3fCb1IX8KVoDJOrjr0imHJZXpUfQNThfTllrQoSK5Y3
         OEwm0jtzU/0/qosYmIm4co+4pLfVK5WgNjmoprhsgdCaqlcmrxUaO871J+uvu77oEB/t
         fzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772027288; x=1772632088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eykmgvSbv0vLUxYY3jrSx+qlZUgAvR5496gVQzQWS8U=;
        b=niJtKXeZW2bC5mL21AJkN0QJPvwKqcn4NdxovHT2WbbeQXEbQOTe8PI089GndWsyWv
         yWRmbtxTVME0i+LwGzXgxdzI0xS4f4ND3FVZvVZsqY/U6kGK04Uvgo+O1ExHwycLCwn0
         gmMP3ggV2WxGkuFBGErsYoiPuhWUGVi6XsaHy7Wb8q8dW6UjvrpxgTr73bl8brqfwBbN
         QUvOaL+sdouKNCTYRfe+n+7Z2RkgsFQFr/86TGbhabXnIqe9kL+68D1KlWVNOJi8qnwd
         afWXhOGpoK1iXlWZjB/wnaDL8UwfOuxmTfgqXSUMFXFT/Ri35ZzHFKbN7SUBVPltE0tT
         tyhw==
X-Forwarded-Encrypted: i=1; AJvYcCXEq5T0pVwOOLpg/W6xe99g4rpCpyD4UKZDZj8Fe45+JTrnEB77S2Pq84K5Wc+X2hgAjANTgDD+2Ou9og==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkB4HKr8r532PBSh6q3z2pjOmp3LUaR/GXIPRZrT58VDMvyOKx
	eSA47tZOahctz1CrUPg4spq76iwJIMteW43+eW4I/pgi1sJxyuF5TkwNJusJi0U0KT0=
X-Gm-Gg: ATEYQzzB7W9dRrXk8c3eE1U4ZOcYWgIq36bao0Doh018cBlgDUvTp1paircUEHvHwqf
	BX0napM4l7NvDgTWRwaui8aKD+7Fce8YnK7CaOB3Ce8kvLZ6iNyunzwA3dx4+7ZbJAM52a7WimF
	RpBNaBGKYxIzeCzeR1th4ONJ5v1vlOpDdnXwYmu9Awwbh9d1Y91SjPzGedrPmSDQyRiV1jkoMN7
	UcvIKf71xbAdlmfBK3VHmBZpem8HTkGyZhXRGRLxZNRtIo4w4fEUuU9CIRcTSXKcrNNRRiX92ht
	WlVzK2D7cBVrxKRAeI3lJq2hDAJ1AcJUsl+SJ5X/lqAGiafNu4wAYSDWiKrZxFsvf+C8jEUaNJj
	HcrFUV1rYvm/p2GoA4UkW/HKfIeSe0RA8d/JwSmzDPhNstEVx3MnZp4Rq2nVLHntk4KbkJ0/UF0
	6rr4BSmzHXRCO8Iex7YridjhyjAtOD8jKne9XCy0CNaYbfZhAhVkUYBAbL9OfqiwQy
X-Received: by 2002:a05:600c:6207:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-483a963d61emr248565825e9.33.1772027288189;
        Wed, 25 Feb 2026 05:48:08 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7272bdsm62100135e9.10.2026.02.25.05.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 05:48:07 -0800 (PST)
Message-ID: <7c68d164-e2ef-4e2b-9ba3-9a8515128cc4@linaro.org>
Date: Wed, 25 Feb 2026 13:48:08 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260225-x1e-csi2-phy-v2-0-2f3770f660d1@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260225-x1e-csi2-phy-v2-0-2f3770f660d1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53340-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 4CE8A19863A
X-Rspamd-Action: no action

On 25/02/2026 02:08, Bryan O'Donoghue wrote:
> v2:
> 
> In this updated version
> 
Oops I typed "b4 send" @ 2 am instead of "b4 send --reflect" this series 
isn't quite ready yet.

Please ignore.

---
bod

