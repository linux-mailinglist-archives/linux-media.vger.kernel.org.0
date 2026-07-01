Return-Path: <linux-media+bounces-66235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iYEjHI08RWpI9AoAu9opvQ
	(envelope-from <linux-media+bounces-66235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:13:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5BC6EF95D
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 18:13:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=rmhzcFff;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66235-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66235-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDC8630F9A9C
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 16:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917D449250D;
	Wed,  1 Jul 2026 16:05:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF1D72621
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 16:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921935; cv=none; b=A7KMVvygoLUx4XICPV4pq5TR91KxFwTP6iDukwMifIbWM4lbLfuSUjaJTjZTeU72r7xNNoFsVC6ARMk6S/XJSY4VmXj9AhkHokVR79YbPXV/f+PhcZukFTPw496RlvVJSmxzWbUeYZdYCnEkmXVeAlbWzc19WG5HTl5kcXyUO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921935; c=relaxed/simple;
	bh=MzLvwqONWmvEr8yqI+V8+QZHGK5zP4kz3RxrsvEDhTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MG6DdW/LnR2e2YkxzHNnQqD8eQyNX/faEm16qFKgrnYXbfxKxk33JlEeRbAgGd6yhT1XdbOqF8vIqZBYU+xuuRSkQOtoUY+fZDfyX2girIKzSWibV5m7bXz0zxQJj0A/UHKXrEBg9ib+1pVkP0oIa0HqrEmwzxvWMOdDSikVLvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rmhzcFff; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46ed4f66256so701678f8f.3
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782921932; x=1783526732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsosZm6xpnN24XGcV9MJwzrd6T6IUqwmGit4RNYmFFo=;
        b=rmhzcFffOe84HI093MlhVjE7JWUnRboh1QGbRmvkysFGkDzdvr9JHTLJBi/jBDscqH
         ZdT3nP/Cax/jrBVA+AfmPRFQuvh0FiE8AaebmYc/bl9n8M+/hfC7c+sZzypchJkYUJCr
         uiG4l8qEyuwM4UsR78qebLjyVco42/X8GTLFNdR2dtwuez+7WUiH9wVTc7K1vNyzV67f
         ZbRmaBlV+qrnmCmbgIy2aKMUhtXJJz4qwsdVXBovLuDF+M4UpvWUBEmnk4FlK0YQg0hL
         jV1AUM6JDlAd2izIoUZ7oR7XQPTXF/WH6xmiPbt1yNDlem+zlULemaiaDJ5Ek2d07tEF
         KxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921932; x=1783526732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UsosZm6xpnN24XGcV9MJwzrd6T6IUqwmGit4RNYmFFo=;
        b=Ql3mDFeUFjM2sD7/+1A7tPTL0eyaLyi+1pZ7RAtSkQsG+n5hsjEmIey8+LhZbJhDoQ
         VqnVEj3F7xCL2gKDidB8ZoW39mh5Aur+ScYgdEnvtoLjLHB3xeCccGdmrR55zKBtCiFA
         yph7Cjt1k3VSxaldw2aH0Ib8vwakEm2l7Fylq/fBkU9vdtldR7AhLvtY5Qki+qj2IGhw
         ZDWMJ2wDkdh3SpsmCuXSDHLnp8US9Xz+81DYfjbxFskYDaSWk/aJYNJZcpzVmSkwqsIn
         c8LJkakUd2ayetcVJo+QF12SpK14CvY3IIwSGhau5u/KeeVo9jDUhP6gJb3xlEIaOUdR
         ueAA==
X-Forwarded-Encrypted: i=1; AFNElJ8mO6rvO+xMp8JUZTFLh9MuPPd/ZRMT3YwVtoQh/sqOs/7PqZQCU8sJWB7P2z4intvLJ9Wgifq+A1+YRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxNIDM7r5ZcXXNuO9v8yUTgonr4NZdjz83l6XNi4Vum5aU6sWV
	e7UoMyVplIfmQ5NcRZMESmvxP2T+vn3Z3iVj9fFn7GKvlAJYC3mWzGmeoRqtCLZBpj0=
X-Gm-Gg: AfdE7ckfaObPle5vjq9HvcL+pTWCZjEkICAr29NFqUR4PV9JKrpyx4bUc90rvMOlliP
	5aghhMID9yAIBnJ6lni6kvgOymurp1CQtUe0B+TqxAhg6Y8Bvl8WYNB+Aw5e1G5L9suSD7ibGzc
	l46G6AQFiANkB+ZZmkQHhzfyYQ17DImxbLXgVNJ4lGl1tw31yF6nN3dLF1BYLRmKY9E/PNUar0/
	uSE42UQNZ2MOJFYv/FkvffW/wPpgugetlRxds6imjr2Schab6mUmD4/68rb6HhhLg5Da/SChUqI
	qc4j4K+/O5qGHE83fFxHXZ9+cFxrMT1nzfjvJu1RAcarPGkqEXH+XXmbp//AeDFUgB6uUSoeJZd
	jLDvyM2q6t2WRkdmVVB5/+x70Q7uw8cY89NyM7wPieNNo9zHZmD4bpV+GQQiBlyz+BAXFrmw8KC
	3hzKsa1Yux
X-Received: by 2002:a05:600c:8590:b0:493:b55f:bca2 with SMTP id 5b1f17b1804b1-493c2ba4341mr28332345e9.34.1782921932035;
        Wed, 01 Jul 2026 09:05:32 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.66.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4fef11sm79771845e9.15.2026.07.01.09.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 09:05:31 -0700 (PDT)
Message-ID: <af1377c4-f4fa-4130-b51d-bf57ae3831c7@linaro.org>
Date: Wed, 1 Jul 2026 17:05:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
 <b6a8c860-8b47-4250-a428-5225d0e64a1c@oss.qualcomm.com>
 <htxqjgwjczsghunsbvo44lwkadzeg2kp6wfcksf3hkmcubvs2d@cw5r67uxskvu>
 <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-66235-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D5BC6EF95D

On 05/06/2026 10:31, Nihal Kumar Gupta wrote:
> Could you please fix the driver to map logical lane indices, consistent with the gen2 camss convention.
> 
> [1]https://lore.kernel.org/all/20260326-x1e-camss-csi2-phy-dtsi- 
> v3-5-1d5a9306116a@linaro.org

I also agree with the principle here. camss since apq8016 has used 
data-lanes = <0 1 2 3> so we should stick to this established paradigm.

---
bod

