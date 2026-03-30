Return-Path: <linux-media+bounces-57551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGBWNAYrymmQ5wUAu9opvQ
	(envelope-from <linux-media+bounces-57551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:49:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A69356A3C
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 123CB300D17F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6C23A7F74;
	Mon, 30 Mar 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9im0yTG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D729D281
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856953; cv=none; b=ZoZhvh/KDCAMe6reGhXHfpbcWC5b8jJNKwUcYa2NGv1wdWR/AkgXihlHHDpqSGwKZszFtEgrl4IOkoZxic8wOyBh5uDs2zsNl8eXFMO7vAbGZRg4ZKK/hC6b8cFgCPgPSz3i401xoVrSpfRuAuFCyOpoHcLcTif3x/rOyGOb3KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856953; c=relaxed/simple;
	bh=o622oh54cTsU+KKUTxCLpNHU169i/iVq4YO8czMNyw0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kCJMRx4SPhSGTr2IeXA0bPamGS5wp/Ns6Z69luJxAE40JPj6rnQk+24SI0VFdIgh26nDBpNPI/nkrJYmYurgH+9ny6n247ese7yCvE4iCezizLsUjSNY4Pwwz5td8Lpm6ovzxOZHt5GBJQXopeBZbyjju+lpWx58VpyGKNS+d5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9im0yTG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fb14227cso54975915e9.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774856950; x=1775461750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/nFmeNNFWPp+7jec/T1A0Kyh+DGfRIv+rs3nkdXw+U=;
        b=s9im0yTG6+qrtiG1MwP/0px8LTVk+D/844FhT8O2dG57xgC6GKZyLCkkt0/gdWA5z4
         yE/nSLNp1VRO89RgGzj793QjMauERltq6EIMbHzGoFCeqWNYd0q1/AGflm7li1GcL3Rz
         hLcvI/YwO6iPS8i8kZvqBvuqfgQG7XbDHsHSVA9t3IcgkwnUgwsYLLKS3LAvN7hau1ed
         tmebh8iFJ4EDv3PGk5GSnndakw65ZkylArrlRBWci2ur6r1grWfe8iB9zROxJaccH3mk
         GcHv6O9P0k+8xoWqD4oXbBqxp4Cbi5cZaLn4AsN802c1RONRkznBNmD/Z7kteIAHCD9y
         /hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856950; x=1775461750;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/nFmeNNFWPp+7jec/T1A0Kyh+DGfRIv+rs3nkdXw+U=;
        b=HbtxXfGF3C/GfbTBln9nFKtcQlT6ftW4yLhWYHnkJAAfzCbSadnagO6rlvHPjj7x47
         N3f6S1wMLTAZujVQ+AO7aIkcrsHDiaNqEIbqkadQH3taxkvWCImV7r70RApRG03QvTuj
         ff8LsUl9gIrNQNADdjiGroacW6ZYfdYPjJwO6dQj2iDjJXVw2GUlu0xMUn21cH6qf5Vs
         DHhLihOTEw1oMhyIK4AzD0ULEPsC4SqK7jDRYEoWpT5VKnDwNz/BNzujvbsm6E9YXu/R
         7CocHxKag6uqlobAMbLP22ex6RlOoB06Kj1O9RPO2ulvJgptn7xEODtw3mX4zfZtWuIe
         J6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsQ0+bjPULJ3xbMo7OFrI+G4mDmoVzlkH0gP2d/YDtKCkEF8yL+zjsxfozEY4P0H85g33vAHUM0c/y9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy75JwjT4BgEU968TqusJVdGJpESQczaTfPJo+VK5H7JpzlgAaW
	r49qgJnztLKNVgLJdr9ZyrbYsAuUo6QQcYC8F7opU44pVtNo8Ooe6Ia4oFcc31xN6ow=
X-Gm-Gg: ATEYQzzLgPfs5RJg86ZjRsUI3zVEoCP1CKn9gD//+8/fic5sX80tXq34bfNLNWag+SM
	q2ka8Zkvt79lSENeFeKq5J/lhshBavWimR6fjpB1kXOjpEG3vkal8K9Decct/Wq3km1gmEfDdVe
	/CPREDxuk5D9SvvnXPTFBHfJfziKA1nMV9DCzb8lFiGcsRse/BmgBB//8iggXGDOxAPyDGoFay9
	JW7cQmNSnnWRjGsDpx0nU9+HkUcH55lXtl6GXYu03Q26We0s+pP2MoEn90GIb4xgTsY2LjjsURv
	GAjPL4pBD9GKWpXHppWHWlPZRJgrwLZ1AQxHFs2RI2+3YMnChqR7YCkhEQhlOIx8MybteWSaFg3
	weXlcyzhrfKW/jYvZ79OU8vgHYlCBS8qJw0LCJAHOw5sLA19YFZWpvsamXzLWI4wHV/zh+stVNL
	QxfYwEFLCSfDTc2h8jvdOLQrjCDVf9BycDPJNqLv/xASLtoYHm/6hKdc9H001vJ+4Rw5ZfMmhYv
	JJ/hQQ=
X-Received: by 2002:a05:600c:1d08:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-48727e95417mr189631935e9.11.1774856949649;
        Mon, 30 Mar 2026 00:49:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0? ([2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9506dsm251920295e9.7.2026.03.30.00.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:49:09 -0700 (PDT)
Message-ID: <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
Date: Mon, 30 Mar 2026 09:49:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
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
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-57551-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:replyto,linaro.org:mid];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 71A69356A3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 18:42, Bryan O'Donoghue wrote:
> On 27/03/2026 15:28, Neil Armstrong wrote:
>>> To be frankly honest you can make an argument for it either way. However my honestly held position is analysing other upstream implementations connecting to the PHY means we can't make the PHY device a drivers/phy device - it would have to be a V4L2 device and then for me the question is why is that even required ?
>>
>> This is plain wrong, DT definition is different from software implementation, you can do whatever you want if you describe HW accurately.
> 
> I'm not sure what point it is you are trying to make here. Are you trying to say drivers/phy is OK with you but you want an endpoint ? If so, please just say so.

I'm against using the "phys = <>" property in the CAMSS to reference the PHYs, a "PHY" in the classic terminology is tied to a single consumer, and if it can be shared to multiple consumer you must model a mux or whatever in the middle.

The PHY API as an internal software implementation is probably fine, even if it makes implementation of split mode much much harder and doesn't really solve anything, you can just call init()/poweron()/poweroff()/exit() directly from the CSIPHY media callbacks.

> 
> I can see an argument for that hence my response to Konrad, I just don't see why its a Qualcomm specific argument and of course understood stuff bubbles up in review, we have a public debate and come to a consensus - that's a good thing.
> 
> However, I'd want wider buy-in and understanding that endpoints in the PHYs is a more accurate description of the data-flow.

It is, and it was designed for that, and extensively used in the media DT representation, so I wonder here you would not use it...
In an ideal world, you would add nodes for each CAMSS hw elements and adds port/endpoints links between all nodes to describe the data graph, this would be used to construct the media controller graph, and make it much easier supporting new hardware.

> 
> We've been applying DT bindings aplenty without that so far. So we would establish new CSI2 PHY bindings should represent the sensor endpoints.

We've been using a dummy representation of CAMM in a single node with only endpoints connecting to the sensors and hiding all the hardware layout in code, it doesn't scale and makes supporting new HW hard.
I mean this is common sense, why would we continue to stick to the current CAMSS bindings ???

> 
> Is that what you want ?
> 
>> The CSIPHYs are not tied to a single "consumer" block, they can be connected to different consumers at runtime, which is not something classic PHY devices are designed for. So they are de facto a media element in the dynamic camera pipeline.
> 
> The existing CAMSS binding and media graph are not changed by this series.

This is not my point, I don't care about the software implementation at all, I care about accurate hardware representation. Using the "phys = <>" property does not describe hardware accurately.

In other words: The CSIPHY are not connected to CAMSS. This is _not_ true, tying the CSIPHYs to the CAMSS block hides the real data muxing in software.

Please remind DT is used by multiple operating systems, and properly describing hardware in DT will help have good software support over all OSes, not just Linux.

> 
>> And actually Rob Herring asked use to define the complete data flow, it was a strong requirement. I don't see why we wouldn't here.
> 
> I'm implementing feedback from Rob.
> 
> https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/

Where did he ask using the PHY DT bindings ? Is he aware those CSIPHYs are muxed to multiple consumers which are burried in the CAMSS code ?

> 
> To me, here is where we stand:
> 
> - Individual nodes - we all agree that
> - As sub-nodes - I think the majority agrees this Krzsztof, Dmitry
>    I'm fine with it too.
> - drivers/phy - I think we are accepting this is also fine ?

Like I said this adds a supplementary API layer for no reason and will make life harder, but I don't care personally.

> - endpoints should flow into the PHY and then back to the controller
> 
> I get that argument. In fact I _like_ that argument at least I like my conception of that argument.
> 
> I'll stipulate to that argument meaning then that, new CSI2 PHYs shall include endpoints for this purpose globally.
> 
> As I've said before, there's nothing Qualcomm specific about this discussion, really.

There is, because the current Qualcomm CAMSS bindings are insufficient and should be entirely redesigned from the ground up to properly describe the HW.

Neil

> 
> ---
> bod


