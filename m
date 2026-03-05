Return-Path: <linux-media+bounces-54663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PQjI5WoqWlSBwEAu9opvQ
	(envelope-from <linux-media+bounces-54663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 17:00:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 460132150D1
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 17:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 305B230900F9
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 15:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623753CA4B4;
	Thu,  5 Mar 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X78IvNrx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684B262BD
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772726278; cv=none; b=d2GwEwB0ACNALyYy0gxjqLkggrbKrBU2VcDzLN6R59aOzQW9r8+xro3vbeslMweYV3aRiI+UU+acp+AuKCkQQmN1v+wyuKXq6RdEBexk+qhy08lcX2Mx8amsQ1rN0rwTzecR221ZahKIFTf1LgWZMbzTThLKX+vriAvFNZfl6Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772726278; c=relaxed/simple;
	bh=XBZfHwikgvCU/gXjpI4Lxj6ao79hgiHVyVwVtLGE0aY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z4YfAcsR6CfVFyLkxELaeycNoQnIASIACM1y75n4C+1ZjmxVFjaeJAHbWbimymyRyqeNL5vniKNdts40hIp/Kj61qaPkQJBKCmP10n6am7d4VQ3NC/NM8SIlh7f+2Fv5DkPhW+jt93YG5IluOOEZmxC1E5ztXcofhw92qhMdeLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X78IvNrx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439c5b40f60so1919701f8f.0
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 07:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772726276; x=1773331076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVaAl61bpFuDZxzZADrOjRzw0mw5luPTO1AggexP8fw=;
        b=X78IvNrxLCZNLEiX/O3xbk+N8M8ngUPp+t5/7YAdcoyK4qTwQwEsc2zC3cODZOc1VZ
         JQMF3foLidiQPAj3RTzBEjsfUqbIpqaMFHkxoWQWGPSogBFWYFr2Gmx2ggO9MUfYGULQ
         GyQZh+/IrK9E4kwqoAzi4cy1hn2Aj9ELj7YU6nTCndCP13dppBU1wPi7dSz4+l1XPzfU
         CIUODTNYV2zxlHh0/pDfYTEfy6EdG2PQu+BiNRi2FxrFXDEEyqyUGJL3AMdPhLOI8qla
         HbE7azCrYqS7UFEDGeGE4vMEsK8N/9kUCjNW/RNCcUF2OBQy0BliKpPyIssyCKQaixDM
         a97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772726276; x=1773331076;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVaAl61bpFuDZxzZADrOjRzw0mw5luPTO1AggexP8fw=;
        b=PggkBc0oJqVvbmBZkBqRDXERNRv2/6Pe7oAUTXOa15FVqwLyDm1xfKK2N49P2QCH9Q
         9viHYbbNSz6cFH80clM011JBc3wC8KnyMKFAWtnuXDsiGTbN3t966N0mkInHfrjio47x
         aYImvgDg1KLoQdQpDxse1pZWnHJRSGEyuCElqQViCTUZ8qeZFZKXNSZjn0npr4A638ds
         L9Lp7VNV7EPQiZID3pVtZ0UZyahBOYTKgs/K9nhjnxRcmWVZ6jJGLlnOyJ2+HoYDZNlP
         Ju8TmFLypUbsroWYx+QfVK2zxkcosVIfg7VMN5LJDB5XHO5VS7+9NxL+zlQtkXu58wby
         7+7Q==
X-Gm-Message-State: AOJu0YxyG+1P4m66FNZjvx2duiKLWfsuJBdxp9z2Mz+smKiT9Fp9Zetc
	2iOJW/xdNGXjlImA0PdLODrAVArgKzhpBuVjMkESFML1gxjVJHIkxj8uzmxvA1J3ZF0=
X-Gm-Gg: ATEYQzw6LQsFueomID05Cc+3+RPtbM+g7DcL9jsdTBIdWxlV42xoyvu5894CVrWvHOw
	GB5UEXT/QdtN/QIe/NJzA0eGGNFrU3qhLZKd5qR1TFN3aZcFsZp429DJqrjhuodIDv+QIKmJSOb
	KWwQtbsrccjHDCxUoennlNzdYKS+6CtKXWsKwEyDh7AbxB4ZlkHu1UCVLVRaD7IgJ9jwLoMPE3Y
	H5ri0DRrYfO746SHmlLSQHZo8FUfiS1VoirnX2EoNcsQElrX+l5/UsVO559vSrSDvdkxYpV+8Ne
	K7WIVZiCDNv3Y73jadUYFIuNhB40OMiU+mjWQA1azmdNTA2yF3Pq0qdcfHVOIlZwpzenjVlzq6W
	BR3odJgLLFpYsL80sbNjliFFCV+QvWRz1zSmlO2FYZ5Fbb51PqL4Q7GSbIvTJ9NPW9Km/nu2NuL
	rOIYC/NL1W72FTs5ew7eOCMLxTamI2RN5T5qVDZfFY+zJRsvhxQhVUp7U2uSxFSbm8OEfpBF93A
	ThG
X-Received: by 2002:a05:6000:250f:b0:439:abcd:b30d with SMTP id ffacd0b85a97d-439c7ee8e03mr11275542f8f.0.1772726275778;
        Thu, 05 Mar 2026 07:57:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:73bc:1eca:d39e:509? ([2a01:e0a:106d:1080:73bc:1eca:d39e:509])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b1b97927sm37622495f8f.28.2026.03.05.07.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 07:57:55 -0800 (PST)
Message-ID: <f3e9a770-a81e-453f-a908-59bcc567f01d@linaro.org>
Date: Thu, 5 Mar 2026 16:57:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Zhentao Guo <zhentao.guo@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
 <26d0f52e-3681-46ce-b0dc-0cb020e8d9a1@amlogic.com>
 <69900d76-3820-467a-9fbc-13f79189df2f@kernel.org>
 <278f5018-9183-4eeb-bde1-7c19adecab06@linaro.org>
 <c8b9aa23-9081-4482-b638-e57a0c419356@kernel.org>
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
In-Reply-To: <c8b9aa23-9081-4482-b638-e57a0c419356@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 460132150D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54663-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,amlogic.com,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:replyto];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/5/26 12:53, Krzysztof Kozlowski wrote:
> On 05/03/2026 12:35, Neil Armstrong wrote:
>> On 3/5/26 12:08, Krzysztof Kozlowski wrote:
>>> On 05/03/2026 12:01, Zhentao Guo wrote:
>>>>
>>>>         2. Why canvas is needed?
>>>>
>>>>    1. Since the ARM IOMMU HW is not integrated into the Amlogic SOCs,we
>>>>       need canvas to prevent the DDR memory used by the decoder from being
>>>>       rewrote by other hardware. Canvas provides the decoder with a
>>>>       configurable DDR memory range, as well as hardware-based detection
>>>>       and blocking for out-of-bounds access.
>>>>     2. From the diagram above, we can see a lite CPU called AMRISC. AMRISC
>>>>       is the controller of the decoder HW and the decoder driver needs to
>>>>       access the decoder hardware through AMRISC. However, AMRISC is a
>>>>       16-bit CPU and cannot directly handle 32-bit or 64-bit physical
>>>>       addresses. Therefore, canvas is required to convert the addresses
>>>>       into index to facilitate processing by the AMRISC core.
>>>
>>> This suggests "Canvas" is IOMMU, thus use proper IOMMU abstractions and
>>> you cannot have own phandle for it.
>>
>>
>> No it is not, canvas was used for a long time for the display and video processing side.
>>
>> It's absolutely not like an IOMMU, the diagram is quite clear.
> 
> The diagram and all descriptions points to memory mapping...
> 
> "Canvas index is basically a reference to a memory region and its
> configurations."
> "Memory access through canvas has HW out-of-boundary check."
> "Canvas provides the decoder with a configurable DDR memory range"
> "canvas is required to convert the addresses into index to..."
> 
> so it is not a random phandle either.

No mapping is done by the Canvas HW, we simply reserve a "slot" we feed with
a linear buffer allocated by ourselves + parameters on the frame format, and
then the display engine or the video decoder will only need this slot index to
access the memory.

It doesn't fine anywhere and amlogic specific.

Neil

> 
> 
> Best regards,
> Krzysztof


