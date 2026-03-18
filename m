Return-Path: <linux-media+bounces-56216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EfxAv/FumlobwIAu9opvQ
	(envelope-from <linux-media+bounces-56216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 16:34:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 535662BE4E4
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 16:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8DEB32CEAEB
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 15:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55E43E6397;
	Wed, 18 Mar 2026 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPJq7Ti/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B205C3E63A7
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846465; cv=none; b=DAO1sMOI+IiBxPq/8Z2PjUuh6Ddm1HPzLaKBDAf9jlsRayy5CBM8bF4Df1p8bfUXGc17L7vZ2KDC97nLy5GlIuGharC92C9Yr+N0lTTrHAxD7fnXDq6sIiPGp+3DY+twqsh1OR32AgxJ51eDEbG9ncxDZjKELQT7wJn2m1L6twA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846465; c=relaxed/simple;
	bh=ZoSHeT77078Iqbf3FZtOdYfRFw1inc0RQItH6XSpU7Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PfXMTIaehXkNeV2oBL3J3HxMlshT3jMVM95hOg0Pwdr8iF2ZrYlXjszgQj0/cTy8+9SxSNWWBk6JfnYOy59RHAtoaluT7iVxza9x75P3RWrb2pFalDlfQrEBI2lQSOGnKilraoiFm5PB9b1y15ZAcSjKJ3hE2WUzbWNpgsrBlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPJq7Ti/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so27920655e9.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773846462; x=1774451262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFLt/AnnZVIYBmUJ6Ma21B1/LPas1wfia2xtndFkX+Y=;
        b=qPJq7Ti/y39NCs3h5WZh/crMMRF4z8fi1mIqGXfpWF/xOf6toaQP7QvbgQr58R+2V9
         auKX9ppcjfsGvKMcjPUied9NMyBvry/aPB0gr+YMhbS54/9hNYRhXMm+52GgzT/ZrR2o
         lGdnnf5VKFhf6vY0fw/UOQEet7sQjQBRh46FvFjeUX36hJkpil5pJ1TCnY/K7OEXaMVT
         jVUGX7tzBVopUrCMrsFpZ97FVHq7gJYR+mcMqF+wjySPSgLxODxg+r4HYLXgZ858Fckw
         KFYnyelL1yQP57t91voKufOKcAn+x+Z7ys8+XcRGW2aa4n3K1qvB5mO7JPyC+fNmtCh0
         1HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846462; x=1774451262;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFLt/AnnZVIYBmUJ6Ma21B1/LPas1wfia2xtndFkX+Y=;
        b=rxPLJsJ5dXd7DU77hIfpkTPXJZcgAH9g6eE/fHt0QBCITXZcYMZW1phs/dTLNqdwYT
         sSS/9W6OgSbMZUE2Ib2n+cnAO5bVQcJmIFBNNiJ++KAC5+fmOS668Ybuam6ZnwwVhVcL
         9i1PhYpmbzORXOQB+VC8YVajXfYT8+JMBow/wUuPGXcpnZ0c1LYH0ohWRSMza2defNod
         slVWGQNv0bUFqtILbpkfnxHAlCp8Sk2xWMc0hRjSgn2ajfrqIT7jo8GzP7DSIf9+ioeK
         6pa9WowW084JtcPf8QcjDrza9vBdTj3TXo5GxazEFTPWdWX3mpT75rU78f1SqS4of6PA
         WUeA==
X-Forwarded-Encrypted: i=1; AJvYcCWepXwslRucl2XjjyxD+WtQRsmDkFw03Qz0NVm1oh78e6ZTkg7/MS50xL5/1mnfrvOcrQ8V+aJSrLoGOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2j1sRLZft5ANZ08SKVfbM9n5DG0/DiJvrlcFpSL4yHX+I2Gw
	UgZRxE2O2gtK69EscpXjBTv9kMK+4loPYESNUxa+1BTVYKfKGV4spURrd5P/O4MAJBw=
X-Gm-Gg: ATEYQzzc/g3wG8jOlAGc8gH5hKDO4TN/kHKkF3NiOaeAkoX3Sgxqn2AZUduSfs2SzsQ
	l0E8Rc70YrfPzCaaERnl26P2l55RP2hAD9Jm6ETChDECz4zDDlgwTHgJLlqG7oS7ttnnoxgHOtK
	mNQVabmu4jENyWIXpiZa/PcE6EYGm3/+DzlIWuB3VFYwk84gM1AWS/KmvWsQRCfOnfCPvL6dVP1
	8brZXuUrDdKluD7E3UFVfOVQCFawlJn44HSUiTH0eYfHOrnZJ1nOK/iqBPJbAYxJ+UQYlYOTjU8
	YYPqgES7KU35Ggxas93y6t/MtSrhjFoQESgEH5a7TT/0QCwXjeL7iS1UcIZZSJKvuAb1n+T1dUu
	jdF+t/b7S+w8hAekBCUw3ZOjcX4sKvOOINOb7h8JFetxQ8ivztBNzPHLx2EXYyMzYivoltzm9ER
	NhEwoOOGgkQtUF/Ft7C+OTn3rWgkND4m2HipYA0gCUS/Nc98kfwtujXb4PPmX2WUnS71MgHv+Sp
	mv4Ujs=
X-Received: by 2002:a05:600c:698c:b0:485:3ca4:4ef4 with SMTP id 5b1f17b1804b1-486f4437560mr59882285e9.9.1773846461614;
        Wed, 18 Mar 2026 08:07:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0? ([2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4618e42sm23287495e9.6.2026.03.18.08.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:07:40 -0700 (PDT)
Message-ID: <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
Date: Wed, 18 Mar 2026 16:07:39 +0100
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
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
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
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
In-Reply-To: <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56216-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:replyto,linaro.org:mid];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 535662BE4E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 14:17, Bryan O'Donoghue wrote:
> On 18/03/2026 10:15, Neil Armstrong wrote:
>>> +    /*
>>> +     * phy_configure_opts_mipi_dphy.lanes starts from zero to
>>> +     * the maximum number of enabled lanes.
>>> +     *
>>> +     * TODO: add support for bitmask of enabled lanes and polarities
>>> +     * of those lanes to the phy_configure_opts_mipi_dphy struct.
>>> +     * For now take the polarities as zero and the position as fixed
>>> +     * this is fine as no current upstream implementation maps otherwise.
>>> +     */
>>
>> This is wrong since you loose the lanes mapping defined in DT, which is still in CAMSS
>> but is a PHY property. The lanes layout is not a property of the CSI controller,
>> CSI controller only need to know the lanes count, and not the layout.
> 
> Lane layout is a PHY concern but, the PHY API gives us phy_configure_opts_mipi_dphy which should be extended to provide layout and polarity. This would then be of benefit to more than just qcom/camss.

Why ? the only concern between a controller and a PHY is the lane count to calculate the bandwidth, the actual pin layout is certainly not a controller concern.

> 
> Right now none of the CAMSS users for this driver depend on any other mapping and I propose a separate series to fix phy_configure_opts_mipi_dphy rather than introduce data-lanes to DPHY.

None of the upstream users of camss.

The problem is even larger, as you replied in [1], the csiphy is still exposed as a media element from the CAMSS driver, this means this driver is not complete,
it should be a media driver entirely with eventually an internal PHY aux driver, but this would be entirely implementation specific.

Either the PHY is standalone and the PHY consumer only calls phy_open/init/configure/power_on/power_off/exit, otherwise it's not a fully standaline PHY but a composite device like here.

I propose that you write a proper media driver for the qcom csiphy, which eventually spins a PHY driver as an aux device.

Neil

> 
> ---
> bod


