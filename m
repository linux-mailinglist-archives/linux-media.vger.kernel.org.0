Return-Path: <linux-media+bounces-56336-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eALAEIL3u2koqwIAu9opvQ
	(envelope-from <linux-media+bounces-56336-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:17:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B72CBCC7
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:17:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A857730117D0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 13:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C013D47B6;
	Thu, 19 Mar 2026 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtnPFzM8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79C33D3335;
	Thu, 19 Mar 2026 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926264; cv=none; b=A/52g0r3ojhSie/Ya1EZc6i6X1cBNGZ+QCiW6Qje2YbQ8HB4ym1Q8IOo1Ci4a8t6wa3LrvVFQj3h15D4cIWnLgtEHrSa8Ip5AwOgYN7A816XvprVkf+bqV/9E7PBBzN7YYiwD8jvST5Bwysmjski2GFyFarEx5fuIac3v+xN9eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926264; c=relaxed/simple;
	bh=NZlbAz1x3bJFNwyQ/jeMy7DD41+VCnD1WXAuW8TtbGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Elo120cbASZVmAJuJUn5nSydcWchgEfsvKFQL6h76Ahb/gRA2QaoObrBI3wb0NTrwsBHj+sLK6zBtGQgT4O4LpBZx7dr9qgTKySklTF5qX8yZSqboMkcprUoZIDHZ/zyrmdjoaY4dgOKYDNZvgDQOVNWfRmidobY1SY2itVsm/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtnPFzM8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8395EC19424;
	Thu, 19 Mar 2026 13:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773926264;
	bh=NZlbAz1x3bJFNwyQ/jeMy7DD41+VCnD1WXAuW8TtbGI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RtnPFzM8u1MThlIHxWAIl7u1aOKDu52Q4TzCHzVgkUwytHNxZFd5sQ1FrS5hzGCtS
	 bmDjB7IKpX4W0jwJnFCMkjwswrkHVVMvh4meoKRx0T2Id9pWsqpWXsSt4y9/O9qgCW
	 W/iwnSWW68E/+bVdZSwb3Y7aIYm89Ir8wNqEGmZuOPNsrCrhWd4Ln5kUiklLkQt8fd
	 U3HvDJUSCrFimN4bdDFrHcMwBCEI0lZl1xnRCpg6CxpJwu4QRIB+QDvi2nyvs7ZX9h
	 HmNw15C8RZibNCbl+0XrJAmmkbFdryuCkBS/s3qT3ROs2aC+41bZOcdM1LlqsEPZ2g
	 mBMduRUE4Eq2A==
Message-ID: <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
Date: Thu, 19 Mar 2026 13:17:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
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
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56336-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D88B72CBCC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 13:08, Vladimir Zapolskiy wrote:
>> Why do you want a media driver? Isn't PHY driver enough?
>>
> As for today CAMSS CSIPHY are already media devices, and a user applies media
> specific properties to them, for instance media bus format, resolution etc.
> Technically this might be removed from CAMSS, but if so, then it should be
> done before this new PHY driver model is applied.
> 
> --
> Best wishes,

There's no reason to remove that from CAMSS - it would be an ABI break 
in user-space anyway.

The media entity in CAMSS msm_csiphyX handles format negotiation and 
pipeline routing. The PHY driver handles electrical configuration. They 
don't conflict and there multiple cited examples of this upstream already.

--
bod

