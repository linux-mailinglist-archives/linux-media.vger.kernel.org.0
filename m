Return-Path: <linux-media+bounces-56338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHlaFtQCvGmurAIAu9opvQ
	(envelope-from <linux-media+bounces-56338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:06:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB072CC60A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 15:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B93A3017269
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 14:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 242913093C6;
	Thu, 19 Mar 2026 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zOQ2VIIK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082833033E1
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929113; cv=none; b=cozNFGxI3TQr4hq6wCruFCo87vxSVFTp4cUn0I6n695HeuB8qGDfvQe/ptzaRVMWD8BUFaYnhbFsyEU2Kk4QDaR9CAM3ctuI+d7B7foFr3KxVWjPiO56m/6pASY/PfreSXju4QbZ1JhkvPkh/oqq9qvs6JrfbtF98TsQPmC0fII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929113; c=relaxed/simple;
	bh=4L1Xe+B2zH5DjfgyXfNDDLqJOWMQ1gtfk0F2HLvrxgA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gCOAWrkJ+UmVBO7VqkG9Xjo6n/j+AOKnZ0LGx7Kl4d6UB+tHGy+wYZwzMxjtIyAYezzA8LoHhPDgX1U7Byyfk8TESMC6plhV7Qbd84OsQta47RwiAmI1map/fiDfrmGqTvwOi+dII8AC1qI4cmvnUZZ5JgluANg1kagqhqgYcuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zOQ2VIIK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so709472f8f.3
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773929110; x=1774533910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9e2+lA0DIZE3y9aERv7AEJRfbRg9zhF3NxdBRQrILoQ=;
        b=zOQ2VIIKvVaDKa7Zz+cCop0jfUgHohpRW06iprse2byA2kf3ujMIXJTKJDCJW29GD6
         Bj5w6SCP1ItVX67k9JCtW1GE81xZLmMHy/9nDDEh1OOgiCunJZ0gq6qLkJEQtw1y5dL3
         8r/X7A5EQcTIm6ec1H0TDSuHgox19SKu9Z9ZEWG1P/U9GKOEw56N4nHEcnuGWOhTMdG6
         JIHUEynb4JvWlLRE+m+FxiDsrZHnJo+0xQTm+JL6aetmToDv8CZkHMb9G620T19WNbJs
         EnwVtQ1BY7c6oN57x84pgmzA9MBeIYBjw7AyYcqLDuNAaRgVkiVWQj+gH91kbDjBJR0k
         DheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929110; x=1774533910;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9e2+lA0DIZE3y9aERv7AEJRfbRg9zhF3NxdBRQrILoQ=;
        b=DhER8fubf8xG7rEWALt+b4bc/KZvuFDv/A9AC3CCJ7MEgqvBc9aYORZvZff2RSXRyz
         SJ7gwtrSAWs9j7H1inFEef2kW2vHBRK/dbJn+ZX4nk5UuiwBMkCEqkGOQq1+dgV3vEJb
         mMkTMhEM4WL7X+6gml0nV58GtfxJP/2bNe2GEXWdfBR1JQWbHZ6I6Zp2I/WkQzfLzOmB
         ywuCpEHrcD6+IFpQAN7rqqEibpX3oyj274tW2/NugDSkJBg4PnbIyBEAo9H193jOdx/H
         OgDyg7xBmOf1tOYrCNwWZ8ZhSy5whuU8WOY8ac+DZg3dYx7sA2V1+R6I2kNjElBQ4A5w
         8eMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYpHcglVX08duF/05bPDBJY8Q41WAmq2xdp805CFuhQRlCadE7WjMoUzvN8rjZtGhMseeG2+0WjOMVaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySiyUKsHhIVe0uWZk7ctDfDD+e4XBsQGlCq/vr72WFAMXRX0sr
	xtcqA6BoW61bomNyB4yDxJseP0YfTfxmQArrZPB5A+Q8vGBYJ8YdIySZDuzs82aftk0=
X-Gm-Gg: ATEYQzxOofRC6tGyA1EM/GBltmNgGqv4rcAgOYNYHlOL5/Gp38odBYe/68r1XXzahqa
	HjCqPbayUiYhrmJMTjOOT3SwO/tse3gR0CejsB/r5dBheLKdNS8v398u1+J5YkL5no+PxPvb/K/
	IH9q268cd0+zRcAkJQjNJzLPxWpv3AmwFR8f/NKGUOeMifp7xdKHjZ9ZF9NooPYCt/cvqyOBtWv
	ies9ct4kB1vkATwsWyGIVZGEm+ZHvAAprQ/mYSYE+0MZJrDpXdmy1439h4RWzqG5VO+85k++cAW
	DDfUoa1ZA1XKJIZOnfeoCO0GMLasUj7qjeroXsG+uzsgMa4SEEAOvBMBylOJA+rODRK6XfF9STa
	d3LZaHvewLqzEiQTfrhwL0/Zm3GB7Krl5NLTP02db9aqvR8EMyuwb7zPC4pNg8Lecn6d2jIrmdv
	ylb9CuoFS8WKCX6Yo4pd0doo8XZktTra/Eb89wXXMXHIPLge7lPW70j1k7tehzYaG5F/VDgshkQ
	3Rxsqk=
X-Received: by 2002:a05:6000:1865:b0:439:beba:300 with SMTP id ffacd0b85a97d-43b5279df60mr13775850f8f.1.1773929110168;
        Thu, 19 Mar 2026 07:05:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7? ([2a01:e0a:106d:1080:8e54:fbaf:8cb6:e9f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184957bsm17767759f8f.5.2026.03.19.07.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:05:09 -0700 (PDT)
Message-ID: <4d376a1b-37d7-4d37-8579-a0053f7b91f2@linaro.org>
Date: Thu, 19 Mar 2026 15:05:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bod@kernel.org>,
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
In-Reply-To: <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-56338-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 0CB072CC60A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 14:17, Bryan O'Donoghue wrote:
> On 19/03/2026 13:08, Vladimir Zapolskiy wrote:
>>> Why do you want a media driver? Isn't PHY driver enough?
>>>
>> As for today CAMSS CSIPHY are already media devices, and a user applies media
>> specific properties to them, for instance media bus format, resolution etc.
>> Technically this might be removed from CAMSS, but if so, then it should be
>> done before this new PHY driver model is applied.
>>
>> -- 
>> Best wishes,
> 
> There's no reason to remove that from CAMSS - it would be an ABI break in user-space anyway.
> 
> The media entity in CAMSS msm_csiphyX handles format negotiation and pipeline routing. The PHY driver handles electrical configuration. They don't conflict and there multiple cited examples of this upstream already.

If csiphy component was only handling  electrical configuration, the only code handling csiphy would be phy API calls, not be part of the pipeline configuration. Today, it's a media element

The whole CAMSS architecture is wrong, it should be modular, each hardware module should be an independent driver and all be connected via port/endpoint and configured with the media controller API.

If you _really_ want to move the "electrical configuration" part of the CSPIPHY out of camss frankendriver, fine, then first just create an internal PHY device as an aux device, then continue migrating _all_ CAMSS components into independent driver modules, then in the end re-architecture the whole DT description by adding a node per component with a proper port/endpoint representation to be configured via the media controller API.

Neil

> 
> -- 
> bod


