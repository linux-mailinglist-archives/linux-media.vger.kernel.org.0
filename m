Return-Path: <linux-media+bounces-56345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE2HFggSvGnbrwIAu9opvQ
	(envelope-from <linux-media+bounces-56345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:11:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C212CD72B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 16:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5101B3033BEC
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FCB3DEFF6;
	Thu, 19 Mar 2026 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iN/Icxvx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E32DF126;
	Thu, 19 Mar 2026 15:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932816; cv=none; b=l9zF43R5XexdnucPOlQodoHsqYIWcAdwzhe847LBC30wJYfxZw/uEzQPXk5Xpms3sSEaee4KQfkxSmTTfl+PU0t8Cj1W4F1keAiTiwZzdU1mLe0wt9WQYbsNAEgGMLkPyExRWAjliOi2zQhoE/EAiTKJb74OHkNl9zZMZuQWzAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932816; c=relaxed/simple;
	bh=iWMn2mqaeBlBrAT5D6y+nE5Iz4bKcLZY2PCtIYzPMKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JC0bQPYD8P+bB7aa69wiNJ92iJC6ic8EEbiIVSUg2E34Za4Jn4MmyBeOwfnaeBBQ7hjFH17VphipJ1P0GmfNeAsVLnMoa598NDrMgNfsODwkaGlrLHMjM3V+icAoPzMZ1BuXaoX+cbKGFEHehvNa57zEbRUH1qUqHBFUkNwbc9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iN/Icxvx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7AEC19424;
	Thu, 19 Mar 2026 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773932816;
	bh=iWMn2mqaeBlBrAT5D6y+nE5Iz4bKcLZY2PCtIYzPMKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iN/IcxvxjmBw+DWdH/+faofTJaE9hFATxGB3X5UDnD7HnuCZ3L2a1JAg9stIQQqoa
	 kXV5tyY02zSsqBg82LcwtvahmRPSoKo5cPru/0ATiO6Ez4AR8mc+z6usF9XytZeJ3v
	 74GU2zSHKnWmfYK41edlEVimGn/CUYKFQrrgfvip7gdm1qgJgjKCviooFG6AB/nmhD
	 eUxXRSLnrwk2goIriwa8ZyI7uxpJi3ok1xdFbH4iLYJZD7E1uvIDp5KjIALzAbyRYc
	 5AtMKDAh1tHXb7ltPO+KtMMkrgKFPASrR42GF0eOGin2h4gYDvwFfOZGvoe9Q+bzBm
	 Cr+r+vA2rKQbQ==
Message-ID: <cb752d25-9eab-4cb0-91a5-8aebb7e49169@kernel.org>
Date: Thu, 19 Mar 2026 15:06:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
 <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
 <26XTdUyQTB41Oc4D5HnMtSm_QpZRjlkljQRJVw-u1Zp3Ltn9s4LVU-LQkP6drdl3Z3GGssLCCbsVYPFEqssHcQ==@protonmail.internalid>
 <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
 <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
 <pXsqxK3NVHOSeJHN2u2QbCefn-pOmgmVNM9AKAxinHJdvEBjZy40Asek29h6THEIWLKZFT1dIr17tF2QRSA7UA==@protonmail.internalid>
 <4d376a1b-37d7-4d37-8579-a0053f7b91f2@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <4d376a1b-37d7-4d37-8579-a0053f7b91f2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56345-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63C212CD72B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 14:05, Neil Armstrong wrote:
>> There's no reason to remove that from CAMSS - it would be an ABI break in user-space anyway.
>>
>> The media entity in CAMSS msm_csiphyX handles format negotiation and pipeline routing. The PHY driver handles electrical configuration. They don't conflict and there multiple cited examples of this upstream already.
> If csiphy component was only handling  electrical configuration, the only code handling csiphy would be phy API calls, not be part of the pipeline configuration. Today, it's a media element
> 
> The whole CAMSS architecture is wrong, it should be modular, each hardware module should be an independent driver and all be connected via port/endpoint and configured with the media controller API.
> 
> If you_really_ want to move the "electrical configuration" part of the CSPIPHY out of camss frankendriver, fine, then first just create an internal PHY device as an aux device, then continue migrating_all_ CAMSS components into independent driver modules, then in the end re-architecture the whole DT description by adding a node per component with a proper port/endpoint representation to be configured via the media controller API.
> 
> Neil

Re-architecting the whole driver without breaking legacy code is well 
out of scope.

I'd note making a standalone CSIPHY driver 100% fits in with such a 
goal. I don't think I've seen one good reason why CAMSS needs an aux 
device and can't follow established upstream paradigms for Cadence and 
Rockchip.

Anyway I take the feedback on polarities and will in v5 of this patch 
address.

---
bod

