Return-Path: <linux-media+bounces-54620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLNADaZqqWnH7AAAu9opvQ
	(envelope-from <linux-media+bounces-54620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 12:36:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B742210A2B
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 12:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DA939302379B
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 11:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE9A38E12A;
	Thu,  5 Mar 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NSdUB0vr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F3C36B07F
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710556; cv=none; b=mYJUtak7wY9XSF1BrRzUxzxRbyWQLXj2vFSShS4mZ4IJJDVIKmPgXLLrpzk32qrG3ZBSu16uMRyvDNH8Lk9Z4Ykm2fWX4UNnbov2iAay1f1kHEd6RkkalqRMc7J7JFUiDllvKQp2nIOnAWYW+dHXik+81i+IlpRP2H2l1Ozlslw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710556; c=relaxed/simple;
	bh=cWAQ7ngG5RVW7DUollwYD3TWd2cPBsXwm+ttW4nOFkM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dpFJAYdFJsUjO3clsDaiB2vsuorRp38CJZsp4dZB+QWI0mD76QKihAQaA7ZDmIrsFUKrduGn17Az1B0ikvulsWaJfxcAmstLde0zlqTOEUN34z//VyDRmG1DKliO02VL40DSAgg8SLes1q/vg3jqXRK9gQ5Y7FEzjbAjmNdEai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NSdUB0vr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439c9eb5d36so1586068f8f.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 03:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772710553; x=1773315353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHYAEG7kdjVY7HjponX9xKsbsh2G3LLKlsqfumamkXE=;
        b=NSdUB0vr7edWE0/H2mPcR5IFZU7wCZpUxOeLyniKM5isNwWrlD/mEFMGZlEvbfghux
         pNVJv5MHCAaNF3kHnKFj+mJc0cH1lMu9Fzmp976jisOTWXtYIav6wnK73O7M81zCR80V
         fSeH8SBF1bAwvricXycH/6bWX2vKIhIZC2XCWTO59rHpZi+qsPy99z2EVMqxu7Vwm6Xw
         ic8VVJVUMKS6G2B4oG3wUyEaOofBDabuqgZAn9tYQejUcMaQi63tJWS6RYyzDejW8s7U
         Stz1CD5kbfAPRDjqG+PtGg/S22O4mWQC2vsKcRxH/E9oyJMIRzcjwJnczIBIFstowfJB
         QguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710553; x=1773315353;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHYAEG7kdjVY7HjponX9xKsbsh2G3LLKlsqfumamkXE=;
        b=rzOpd3fqJalD6sWcQ52WRv2E6DWrY8GH6MNKuN9TBaNtgxQEdFBK8gnrZvh6mcEcTe
         Y5N6DJlUJKH1PGkoL+GXffMTCINHVDHSfakPrcCaELpZKFjhrELwopN8ofl4Njyt0/Ac
         1kDn5tRFUe9M7ObCuBoHMU5lv1dvntxfvRGAUF8DWJb/zbidUo3ACBZffDJjbOPUJP5I
         f/Sn4f3vXrvY+5Ai9zH90QET+ySBBfmoXW0nCo8/JXPDMDofBNHGnrB28BeR1FjCynkk
         YFp7fuMf5fHLB3VhglwFD3gZkWXIa43VT00IZeqXAQUIetKHpqI5p4sGK7Okqm4upYmE
         hCtw==
X-Gm-Message-State: AOJu0YyCfmfhz6cFTVlOa84O2B2qUZ3EY8nbTXK2HpHxRlHynx0hbbCA
	KhY+HXcmQI4b89FMpRO96I+bsrCIDKPKD4APbGgwHhBb5/GrzEF/aqd1ytnQtEkv2Cg=
X-Gm-Gg: ATEYQzyjDRDBlBoFAhAffyAYitCkbAhm4Ue+RGBredI/WlNFjhzMiTTI+oGZg54wCZw
	mbZa6nm2a31Uex1YI/g+sPRsFrtnl60Qb1uz+DMcB1ueRUlNEal40HBEopo4VLl/LlmwKQYRgq2
	7fTcNotgaMgb3OKyhb6rzVC0T5uXY9Kbyh/ybH9EOOM1/ggolu4b8YItiQnH9be24g6IttCGgl2
	nkf5OkYpTxyVVsvTNXQoaXuPQ7dMojgtWPqplp9YQGchx0fD04j11e0av7rSsICQAXhWmlaeFBP
	rJwiY1SLKZXm/YssY0YIOsLSUlX5AnkDxNxCjmexRRwgifLMy1rFY6A+LPOPtRDeSn8f/lekKDT
	0Z/6TRgsWiV8HHs+r1fNO/CqLoojpXzcqGfPJ5SzB/+s7KfkXVLbFESJQQCADZiTviD22rwtXlU
	mbl6gs4zjt6fv9hsR85sHi/H92M4lRaBDA/y2rT+vIVWrgcfO1yxH7Bb0kGe+RJEWOJ/Yl5ogj1
	Nqi
X-Received: by 2002:a05:600c:4f8e:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-485198744bfmr97517545e9.19.1772710553227;
        Thu, 05 Mar 2026 03:35:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:73bc:1eca:d39e:509? ([2a01:e0a:106d:1080:73bc:1eca:d39e:509])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm47514905e9.15.2026.03.05.03.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 03:35:52 -0800 (PST)
Message-ID: <278f5018-9183-4eeb-bde1-7c19adecab06@linaro.org>
Date: Thu, 5 Mar 2026 12:35:52 +0100
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
In-Reply-To: <69900d76-3820-467a-9fbc-13f79189df2f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3B742210A2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-54620-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,amlogic.com,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:replyto,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/5/26 12:08, Krzysztof Kozlowski wrote:
> On 05/03/2026 12:01, Zhentao Guo wrote:
>>
>>        2. Why canvas is needed?
>>
>>   1. Since the ARM IOMMU HW is not integrated into the Amlogic SOCs,we
>>      need canvas to prevent the DDR memory used by the decoder from being
>>      rewrote by other hardware. Canvas provides the decoder with a
>>      configurable DDR memory range, as well as hardware-based detection
>>      and blocking for out-of-bounds access.
>>    2. From the diagram above, we can see a lite CPU called AMRISC. AMRISC
>>      is the controller of the decoder HW and the decoder driver needs to
>>      access the decoder hardware through AMRISC. However, AMRISC is a
>>      16-bit CPU and cannot directly handle 32-bit or 64-bit physical
>>      addresses. Therefore, canvas is required to convert the addresses
>>      into index to facilitate processing by the AMRISC core.
> 
> This suggests "Canvas" is IOMMU, thus use proper IOMMU abstractions and
> you cannot have own phandle for it.


No it is not, canvas was used for a long time for the display and video processing side.

It's absolutely not like an IOMMU, the diagram is quite clear.

Neil

> 
> Best regards,
> Krzysztof


