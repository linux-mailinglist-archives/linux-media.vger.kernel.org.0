Return-Path: <linux-media+bounces-56209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMd/DS+mummaaAIAu9opvQ
	(envelope-from <linux-media+bounces-56209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:18:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5212BC0FD
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 14:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FB3530B9C9B
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF613D75A1;
	Wed, 18 Mar 2026 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VebEEn84"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0844F3D3335
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839859; cv=none; b=QJ0/XYBYtadv3DpL5JJjd5pc9kHrobXNsMzY0/Xfq0a3PScMQav55g3WDdgQWVBTxLjRfYfa9LZTAZii2rBWnRvuxTudu4UrQcTykBer1Z2rFHfqSOdgugEXMDQ6tqmnPYPNTdqBxdo0jJa2eax1Q+IfU8MdioUVM59UYv+KOVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839859; c=relaxed/simple;
	bh=34vfCXW8oRGGcaBK9jaqcMWl8InMuT5iFBjmXmD8BI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dz934kXycPMmP0oh7iF3M785PrvMIp0bcqi0BHCEF3yf7SySFFAgQ9LW1EeZb9toc+H4mpmKB8kJ8BE7DP0K+9EnTJWyMAkd8c1EGAPpXasxjmEUQFJn+9OI52SLHa0Bs6Q4XGMyT/GuY/OoLoItKsPo18J5Ml1In0yaxHndUUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VebEEn84; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48374014a77so75947135e9.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773839856; x=1774444656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lY+vBk+jrr/WsrbU3NBPrdruLfUU1yCebVSPO/aA9bU=;
        b=VebEEn84oYgbCGvkB8OC74hU3WZiCDsgK50wX9AhQnk4KdsoaA4CxCQhv7Ccb+Rgv0
         P01egR1+KMxW87xi4+OZBorX1sQFmf6BT0PjuVzzdXvM1WoAhyfVSw/WJvNLqddmvuJG
         RbTc8gGPfbiGyZd1F7i1oHSBSk+BQFORiZwWzPMKUIwEXT5XCnNOi31047dujwAdd0gR
         ZokS7beMVDjPH9BP7VYzJfFcFfzj8HRt5L4Bk5sOUsrQdnvPIE0VkY1gBotfB0KcseF3
         Eo6Ifc5m20nftWM1EwIoXVSglueowgFwrETWMOBRJ1mtcxjCjgVV5yqKZbxsLLzv/VGy
         a0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839856; x=1774444656;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lY+vBk+jrr/WsrbU3NBPrdruLfUU1yCebVSPO/aA9bU=;
        b=Xxqvk2ASbDBQ4QIktW+RHv3oT5ofO/aSzuI7sHSIPnbklDv+eDrDd1gOdeogtLndcq
         lDXXkxb5vJGCQze6Uw5d3Nxsn0fqg/2dqcQhx0WtinRx28pWa7TAxcT9rxaGAoQ6Fb6P
         rBneQxJJPSc/MGgmYbrSblfjuFuSIPwq3h4hlcAwjmS9F6vrPjcVSIdFA7c3zA11uaEQ
         hCAXYakqDfOH1LjzAAESuaC777vpJRYqtdqhm7AOX+O42EFubSyOrowfXAfLSlMbWgjI
         Mc7wZXOHvWvAzTuuT2ftnNvQiHV5r2Zih57SxtgwpGRqXoFWAtoF7x5bkY4IHmuteoIc
         iQtA==
X-Forwarded-Encrypted: i=1; AJvYcCWX1Zb2259UF72XKwDRiq6NFn7oiSTJwwUsI91++7aVXrXCMKNXaScx1EYaO6kFiBM1nfvkRpVADtEc/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99E4ahecI/itsvTAagn94fle2OX1axaxsGPBcwLSOS2HdTg2Z
	SJUJO1MAHevOvpIbFgb5S4QTVObY41B3Uzyoua369IyfdCg0sUlU6Jbgjm5vcPv+EMA=
X-Gm-Gg: ATEYQzwfMjqNVxKmMXxL2TPMvul3GU//g1RDVZLVqVI8DNzebdzDCcLu51kBxDhGGlu
	YDj/pkS4OvYOwmHEAYGFAmb1F6VRxuhv5SKhxInWH+I2/W2Y0fLDGh+kzJ29VRptZ8lv7cUT7zc
	RZofn4V3gvon4xUdjSCZ4xTVw/mi3B4nRsyQiPq6oi1inWaHkaTvQZ9CK/XdJyXlxenK69vdF+1
	K+Jkwow1S6DSF6/ZmloXspJ/1YA6GYQktIZ5Jf2Pitl1Z3yjDWh213oe2k0oobtdCTPqrsi5oAs
	hW+BdQYRym45BkPzy9ZRP7Ms9IwP/zbzvQjlTfetHamJAa1xfpSfMHknPobXZe5EudHMkbAn5E7
	Gbfpy4UV2c5jYGs7t3W7mMUnkvTInvNj4zSdmppk4QVFKZN6f1Xx2J2qL4rFHzyQIiG1Uwj2tQd
	Pe7qOOmZ/4qkYOARSATlNr1KRPkdJsIp6l+g==
X-Received: by 2002:a05:600c:1d0c:b0:485:3cf3:1010 with SMTP id 5b1f17b1804b1-486f442e5d6mr56422235e9.2.1773839856267;
        Wed, 18 Mar 2026 06:17:36 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.1.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4b9bb2esm18004555e9.20.2026.03.18.06.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:17:35 -0700 (PDT)
Message-ID: <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
Date: Wed, 18 Mar 2026 13:17:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-56209-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BE5212BC0FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 10:15, Neil Armstrong wrote:
>> +    /*
>> +     * phy_configure_opts_mipi_dphy.lanes starts from zero to
>> +     * the maximum number of enabled lanes.
>> +     *
>> +     * TODO: add support for bitmask of enabled lanes and polarities
>> +     * of those lanes to the phy_configure_opts_mipi_dphy struct.
>> +     * For now take the polarities as zero and the position as fixed
>> +     * this is fine as no current upstream implementation maps 
>> otherwise.
>> +     */
> 
> This is wrong since you loose the lanes mapping defined in DT, which is 
> still in CAMSS
> but is a PHY property. The lanes layout is not a property of the CSI 
> controller,
> CSI controller only need to know the lanes count, and not the layout.

Lane layout is a PHY concern but, the PHY API gives us 
phy_configure_opts_mipi_dphy which should be extended to provide layout 
and polarity. This would then be of benefit to more than just qcom/camss.

Right now none of the CAMSS users for this driver depend on any other 
mapping and I propose a separate series to fix 
phy_configure_opts_mipi_dphy rather than introduce data-lanes to DPHY.

---
bod

