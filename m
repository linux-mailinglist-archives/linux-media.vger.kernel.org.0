Return-Path: <linux-media+bounces-57279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N69GsWjxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:35:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CB346D64
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA11307C241
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D8F332EBC;
	Fri, 27 Mar 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWCjWMOi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452E733260E
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625334; cv=none; b=LALQtoPZLlzs2m9KRyqO61g5MBkf/3KIK0eyD3BmKGQ/TaJXnwPQVFYu7JNAY4PD/iKe9K5Wf9wwlwbwUAndbw7OR+E04XcusMJQEUaUQOz9Fy7hOEjEk/7HnytJSnAtxjNmhT9z5OOTnoMBfh6r3g4JtPLXvgN+XPUAQR+P/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625334; c=relaxed/simple;
	bh=BzjorC/KMjxhyLd6FvLMV90Jk6WKFkKPHN77D+v5d54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DCoenLAwcB3mMMepEoBBCagN/ybh87GnZ1CNsBAd0D2Syrek74vk7kb+G0dezXe8JEs3q2STS1I3teny/XIoGt1vUG7KioERv+q1G3ByQFBgt/xDdSef8SAVCO3fokg0TnJ6WaIX0zpTdQYogHBqz2pWTSx3LO9bN353HJT6/bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWCjWMOi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso25293085e9.0
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625331; x=1775230131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPfKYIz0itJnZ243zFJfg1PZYfMp2nj029kDZFys+04=;
        b=DWCjWMOigoTHqan2NlPLA6T8fMT0fewrAxZMX5EKVhTwh4wj3esJRC9UlSoU7pnKAs
         IrgglkUaPoma0iwipw0nZqQKXmilBNhud7+xbXRd/9J/N+9AKsW9uQO9AiMQ7YXoRpoz
         UM1xFuvvQtRkus5X23hNxOxlXSHXGXYt6O6vfHu6P6mhXa6Wg/vNb/Qqg78ErXMhuZal
         4ZCPN3AOCaOkPMI1hKl4BgPUyXaf0bWmrXL96CAZ2S4IwjTdqGMxg69AfVwOdCfSCrll
         C3lhjfprVBkqaFKtzgQOl3YpoW7RD90Rcuni3uzbhddQ2xlRPhG+gg/uJ6EZHnEdv3yI
         qn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625331; x=1775230131;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPfKYIz0itJnZ243zFJfg1PZYfMp2nj029kDZFys+04=;
        b=bG1cqB0UXm+LsyIBhvaq7NQSxKOLTBJDiZ3Bc//2D3iFXaYpaK0DgfwhjY4/KjqV/K
         PoTK+Z4VtrUlrhTUVssiiGY93r3df0bPZ9LVSUE28Ow7lATUM/yUSftB/ww9VX7dEYb3
         5T3b3AiSHlkKABmgRiGOk8P+Qau9/A8tMSYV1x7t5JmZCaJWNUov/loy1z3ONwZkrhJk
         N8TbPsyMeUnO451E329Te/gYGBKFoZs7DauFzGEd+Lkm7WFvllc5XRYbIRh/uhffyXJj
         0eUOI+8Z9mqL2gDpYsOlbuNbMYuWpeeLsuEhHxpBcNy6uFIhpdn4A5QZuaQ9Y3epC0Mi
         5NGA==
X-Forwarded-Encrypted: i=1; AJvYcCU5S2zD2j8eP89m59igZpkCSvGzPh9/JUZke58xn7p3D2HgmJlyxqyD7L16t9Qfplctd0CEyAJ/3tq/ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6vuGq0CYuc4yIJ9rXtk1INDVpj4umKaNvL3Y1s4A6CKLJix6Z
	W8NaG+C0aCS1zMmrNj3N1QeKGFC6jxWL7Mp+22I76hXfjzhaZo+jtHleQye+OgH74ik=
X-Gm-Gg: ATEYQzwv9zxglDtrgawTEJ3xMIEUy0EX0y69BgMB59cNOKfAOUbfHnnMvf98AlubiAB
	HyHlsgNy1vHdKBddHGTJkL3L6EQ8succoIMyIbJbv7PtZgWMj71my8dEjGSuOVxgfLKQmFlhg75
	p2Zt8UmSMNNya2VN+AzPZbw78+v2DlixvWaJEw8PwFOmWpuXtJsN0HExaZaBK4lngHS3ya5X3L6
	aRjOCG3+i82Px96gdqNGxVON3tW5tX3QSC8Vzj4XZx/qNs4EX52qnDznDz5M1SQ/8sUnKmP55NY
	GOr7eUmdcriHwgJQ32LKZJxbclzr/TCsF60LDoLC3JVpVOfyhWse0BcvCopdBXSuRzaxNtN0UIc
	vs1UnMIl3jVIb61JpE51UJKL1D5GL9iHK5V319LYVXHkY0Vd81zY8YC80R1QHERts0s2bmprbbJ
	ofPLrMevEvqIAra21uYHZr50DvoyIUQoOj1j4SZIoLP4+mnJaYaBuU3kAIAwIpMl3ahM9SwTjlQ
	Ku2vjOEMCJkN/OuPjfEp8E=
X-Received: by 2002:a05:600c:4743:b0:487:2651:dd6b with SMTP id 5b1f17b1804b1-48727f179aemr49696065e9.29.1774625330441;
        Fri, 27 Mar 2026 08:28:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487270c3393sm28489395e9.4.2026.03.27.08.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:28:49 -0700 (PDT)
Message-ID: <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
Date: Fri, 27 Mar 2026 16:28:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57279-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 078CB346D64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 27/03/2026 à 15:38, Bryan O'Donoghue a écrit :
> On 27/03/2026 10:07, Konrad Dybcio wrote:
>> On 3/26/26 2:04 AM, Bryan O'Donoghue wrote:
>>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>>> PHY devices.
>>>
>>> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
>>> capture those modes as:
>>>
>>> - PHY_QCOM_CSI2_MODE_DPHY
>>> - PHY_QCOM_CSI2_MODE_CPHY
>>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
>> Does the_PHY_ DT node need to be aware about this upfront?
> 
> Yeah that's a fair question.
> 
> The standard model is to pass the mode via binding right now. You _could_ configure it @ run time in principle.
> 
> And you could even conceive of a sensor hardware that might find value in that - but IMO it's a 100% hypothetical use-case - you'd basically need an FPGA that could output CPHY, DPHY or for some reason SPLIT_MODE DPHY.
> 
> But that's a pretty off the wall use-case to hypothesize. Split-mode OTOH is a board-level physical reality which => a DT description not a runtime choice.
> 
>> If we have some sideband signal (e.g. the sensor driver specifically
>> requesting C-PHY mode), we can simply throw all this complexity into
>> phy_mode + phy_configure_opts, all at runtime
> 
> Like I say its conceivable but IMO not a real thing and unless your sensor is an FPGA not possible to support in real hardware.
> 
>> Further, the combo/split mode may possibly be selected through
>> aggregation of requests.
>>
>> The question remains whether the sensor should have a direct connection to
>> the PHY itself (i.e. phys = <&csiphyN> or of_graph straight into the PHY)
>> or whether it's going to be translated by the camss node (which would be
>> the one holding a PHY reference) - there's probably surface for adding such
>> negotiation logic in both places
> 
> To be frankly honest you can make an argument for it either way. However my honestly held position is analysing other upstream implementations connecting to the PHY means we can't make the PHY device a drivers/phy device - it would have to be a V4L2 device and then for me the question is why is that even required ?

This is plain wrong, DT definition is different from software implementation, you can do whatever you want if you describe HW accurately.

The CSIPHYs are not tied to a single "consumer" block, they can be connected to different consumers at runtime, which is not something classic PHY devices are designed for. So they are de facto a media element in the dynamic camera pipeline.

> 
> The model we have right now, right or wrong is sensor endpoint to controller. Similarly the <&phy MODE_GOES_HERE> is a pattern Rob Herring suggested and IMO is a consistent pattern we should aim for upstream. We see it in latest Rockchip, Cadence.

This doesn’t properly describe the data path, we got out of this classic scheme when implementing the whole USB-C complex on qualcomm SoCs where we had to describe the data flow within all the USB/DSP/DP/PHYs elements, and we have a link between the DP controller and the Combo PHY acting as a DRM bridge.
And actually Rob Herring asked use to define the complete data flow, it was a strong requirement. I don't see why we wouldn't here.

Looking at other vendors and sticking to this is wrong, we need to solve how to describe the Qualcomm CAMSS complex with accurate representation of the data flow and hw components interconnections. The choice of kernel API to access an HW element is irrelevant in the discussion.

Starting refactoring the DT representation of CAMSS is good, starting with PHY is weird since I don't see what it does solve we can't solve already,
but you need to take in account how the CSIPHYs are connected to other HW blocks. Simply adding a "phys =" reference from CAMSS node doesn't reflect
at all which HW element will consume the PHY, and what are the link parameters between the consumer and the PHY and between the PHY and the Sensor.
Those are the whole meaning of the port/endpoint links, where we can define multiple endpoints for a same connection to, for example, define multiple sensors on a same PHY for the split-mode.

Neil

> 
> 
>> Note this is a question and I'm not aware of all the possible combinations
>>
>> Konrad
> 


