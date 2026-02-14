Return-Path: <linux-media+bounces-52813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJOrB8VzkGn9ZwEAu9opvQ
	(envelope-from <linux-media+bounces-52813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:08:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1413C123
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 14:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 122443016D27
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 13:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054CE2E0B5B;
	Sat, 14 Feb 2026 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MqqwmOTe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E732D1936
	for <linux-media@vger.kernel.org>; Sat, 14 Feb 2026 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771074488; cv=none; b=dFgFRM0tYb0FLEuT31a+IoWKPqnLIa+nkitXZZvq3a40Jrbim0auayeUn3P8ajgr032EhBvEId6KW0pKH1CZXFfJhDJuiCk0ZOCjB8Q1zuK/g/wk7fzFaJJQmOuQZwYbNaOcXIdEn+pPSUBSetZz/wRU5QgiP/4l+k8WITO3bOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771074488; c=relaxed/simple;
	bh=Xm8XODMXJSzY9NLp4tcqBkU1VfXaD9Om7v6YOHEYd2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2MqksXw9C5Kxl9WRZz2otz18xm+HZnypyBDt9wges9qYOBcPFHPWSfiCHw3BjvwIlYzwh8+2zszIuVttPDSgWwXPadLb+8VzIQf2U4kc62g2amO3cGC1BtUTaFXRIt4T594e+Z7dElF58k1xGVQ4GB0GaNERWuB6GNXvgzYyRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MqqwmOTe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48069a48629so16485595e9.0
        for <linux-media@vger.kernel.org>; Sat, 14 Feb 2026 05:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771074485; x=1771679285; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rzmmv41L7C5cO2Ws4KVpSa6Tyv0KOhi9Xitj1/4fLpM=;
        b=MqqwmOTeg9chWLTX/Mx+ofkEuhAowh0QdIrT+iTgjFatzBjwqB3/LHEzDk+lXDQTTF
         PnjRXsR9z4RkkQqeN3JxRFVhXjsSSwxBrSfrzSZt9Ys15rAAlB0LIM/OTWWQVgc+s2y8
         zv2J5+h15f7s8bSpJ4Y59lGWlaFH8NHfX5XDUoqQnhrajFIPXIzdtq9dLQEYPg9nEEw/
         YEs02aQv+npyJoaPadPVWlRTkxHNBHC9gK4L1fHNxSiQpsV2ggVxhYjK1su7u8SJU5q1
         R3EwUF6QBtbiKYic1PbqXPum1vocvMQKYfBhjwlhjNIVV92wBYQmnZYzR4qfyMdbsRSI
         8FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771074485; x=1771679285;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rzmmv41L7C5cO2Ws4KVpSa6Tyv0KOhi9Xitj1/4fLpM=;
        b=qmbV1fYbdvu4w3X4sfHyrz6oet7utGh4qHx2trV/Y4mr17hSkKIH9J9kDBPHRddCe2
         Q8yodU7MAYe8/UCXPVVi2mD+iPD/DGy7aKBolTSFJXWgd17SwBM5sOgklCyk5tDzBstT
         WIFbYWKfG1QE49D92YDBkQ/QP8q471YZ+Rzs2U2Boh3fMYGAV+JfF+WRXo41N+gALG/f
         IVY6PDRCjPb1o24P8AUvtqsIkFFAb5CcNPfOFbVvUOqKmUML9y5c86YQ0VixyKQNmNqt
         egvjFISeaRhEm4pKzGlBQ0ne1g7d7DH58lTfIl0VXHnHaEVObYwhYkfswTL3zJy8UP9n
         efRA==
X-Forwarded-Encrypted: i=1; AJvYcCXqyIEaVOF31/8TzAgC2MqlkGeAPGVWDWs5nREqc1amtEsuyKPosA10Bi7wNYezzYDd4SFvs7Yo0ZUIMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjzEKOWSG3OcgVjXFu96DvwEtFGCRPqeVifO5Trf0xTYfTl6ce
	AWrmSsX+S5H9F51mOjUfmWMXArn3lo2QHuFgfl+XeHxi6KUX4UQMnnnD5G99A8ZvdNE=
X-Gm-Gg: AZuq6aLBG0mCS0Iw2taQKFWXOCXT64AJG2p/vDAovMInP+4hcmkHCHz/YJLtheOLRHc
	RwRyrmLPpY+ofsN9vfN60I4a0vjvoCBEWH/e6KFfnN5vnNLSLo+Zm3z78/TXRt7Q0mXf0CRye7j
	JZxuEPGQ9L1Kz0ainDeaE1774ZG/3SICUxOtEKshyxYdLrajcYCjcZKwkpewNX+pqYI01aMJHQw
	pj9gR0jvDoDyAPi/+dGyo4+9kXb+WvgkJ3ZOoRj1gaeYctu7Eqn6uE71P+TpWfSP25W9lxCq2AN
	J8y5WCaYlQnZ4PD5l2Y3gNFW/YFZxYU+2aa/iKlogEH7+r54ZRaZ0/xCxOeiDhfu2rH+uUgn0WW
	nTY203eFVeuHguwlkFW4C9sKchNtRkvhd6P9+8xXHCrmmHamYe2TONZwq6ZHNFaXhdmkbzaiTmN
	cjlnOSwfDbnRTtchnQAdH5tk+w+ThLwx88zQbZJre4MCmkSGWr7R3s2PoKey/V6DWQ
X-Received: by 2002:a05:600c:8189:b0:483:6de6:37b8 with SMTP id 5b1f17b1804b1-48373a61afdmr83067205e9.34.1771074484681;
        Sat, 14 Feb 2026 05:08:04 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8209sm13435710f8f.30.2026.02.14.05.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 05:08:04 -0800 (PST)
Message-ID: <2f8a6e03-b056-451f-a1b9-ec5fd160eabd@linaro.org>
Date: Sat, 14 Feb 2026 13:08:01 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: qcom: camss: Add SM6350 support
To: Luca Weiss <luca.weiss@fairphone.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <dGg5QwFM0sztOGMjGgxyYq5Gtq-iX44xBpvwElP7wLKKiuZTJWQwQvGiHgmEwwMgbT3gk_giDKd5AffNlscpKg==@protonmail.internalid>
 <20260213-sm6350-camss-v3-2-30a845b0b7cc@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260213-sm6350-camss-v3-2-30a845b0b7cc@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52813-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A6D1413C123
X-Rspamd-Action: no action

On 13/02/2026 13:15, Luca Weiss wrote:
> Add the necessary support for CAMSS on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 125 ++++++++++
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 261 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   4 files changed, 389 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 415483274552..2b0c21c90e30 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -399,6 +399,126 @@ csiphy_lane_regs lane_regs_sm8250[] = {
>   	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
> 
> +/* GEN2 1.2.3 2PH */
> +static const struct
> +csiphy_lane_regs lane_regs_sm6350[] = {
> +	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0910, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0900, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0908, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0028, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x005C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0060, 0x0D, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C90, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C80, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C88, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x070c, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0A10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0A00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0A08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0228, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x025C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0260, 0x0D, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0B10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0B00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0B08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0428, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x045C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0460, 0x0D, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +	{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C10, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C00, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C08, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0628, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x065C, 0xC0, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0660, 0x0D, 0x00, CSIPHY_SKEW_CAL},
> +	{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0000, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +};
> +
>   /* 14nm 2PH v 2.0.1 2p5Gbps 4 lane DPHY mode */
>   static const struct
>   csiphy_lane_regs lane_regs_qcm2290[] = {
> @@ -1011,6 +1131,7 @@ static bool csiphy_is_gen2(u32 version)
>   	switch (version) {
>   	case CAMSS_2290:
>   	case CAMSS_6150:
> +	case CAMSS_6350:
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> @@ -1105,6 +1226,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_regs = &lane_regs_qcm2290[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
>   		break;
> +	case CAMSS_6350:
> +		regs->lane_regs = &lane_regs_sm6350[0];
> +		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
> +		break;
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   		regs->lane_regs = &lane_regs_sm8250[0];
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 5baf0e3d4bc4..7dc937d018f6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -343,6 +343,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_660:
>   	case CAMSS_2290:
>   	case CAMSS_6150:
> +	case CAMSS_6350:
>   	case CAMSS_7280:
>   	case CAMSS_8x96:
>   	case CAMSS_8250:
> @@ -2003,6 +2004,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
> 
>   	switch (vfe->camss->res->version) {
>   	case CAMSS_6150:
> +	case CAMSS_6350:
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 00b87fd9afbd..b53fb94ab54a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1703,6 +1703,253 @@ static const struct resources_icc icc_res_sm6150[] = {
>   	},
>   };
> 
> +static const struct camss_subdev_resources csiphy_res_sm6350[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 80000 },
> +			{ .supply = "vdd-csiphy0-1p25", .init_load_uA = 80000 },
> +		},
> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 300000000, 384000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 80000 },
> +			{ .supply = "vdd-csiphy1-1p25", .init_load_uA = 80000 },
> +		},
> +		.clock = { "csiphy1", "csiphy1_timer" },
> +		.clock_rate = { { 300000000, 384000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy1" },
> +		.interrupt = { "csiphy1" },
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 80000 },
> +			{ .supply = "vdd-csiphy2-1p25", .init_load_uA = 80000 },
> +		},
> +		.clock = { "csiphy2", "csiphy2_timer" },
> +		.clock_rate = { { 300000000, 384000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy2" },
> +		.interrupt = { "csiphy2" },
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.regulators = {
> +			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 80000 },
> +			{ .supply = "vdd-csiphy3-1p25", .init_load_uA = 80000 },
> +		},
> +		.clock = { "csiphy3", "csiphy3_timer" },
> +		.clock_rate = { { 300000000, 384000000, 400000000 },
> +				{ 300000000 } },
> +		.reg = { "csiphy3" },
> +		.interrupt = { "csiphy3" },
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	}
> +};
> +
> +static const struct camss_subdev_resources csid_res_sm6350[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0" },
> +		.clock_rate = { { 300000000, 384000000, 400000000 },
> +				{ 0 },
> +				{ 320000000, 404000000, 480000000, 600000000 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1" },
> +		.clock_rate = { { 300000000, 384000000, 400000000 },
> +				{ 0 },
> +				{ 320000000, 404000000, 480000000, 600000000 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID2 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2" },
> +		.clock_rate = { { 300000000, 384000000, 400000000 },
> +				{ 0 },
> +				{ 320000000, 404000000, 480000000, 600000000 } },
> +		.reg = { "csid2" },
> +		.interrupt = { "csid2" },
> +		.csid = {
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID3 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite" },
> +		.clock_rate = { { 300000000, 384000000, 400000000 },
> +				{ 0 },
> +				{ 400000000, 480000000 } },
> +		.reg = { "csid_lite" },
> +		.interrupt = { "csid_lite" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	}
> +};
> +
> +static const struct camss_subdev_resources vfe_res_sm6350[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "camnoc_axi", "vfe0",
> +			   "vfe0_axi", "cam_axi", "soc_ahb" },
> +		.clock_rate = { { 19200000 },
> +				{ 0 },
> +				{ 320000000, 404000000, 480000000, 600000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "camnoc_axi", "vfe1",
> +			   "vfe1_axi", "cam_axi", "soc_ahb" },
> +		.clock_rate = { { 19200000 },
> +				{ 0 },
> +				{ 320000000, 404000000, 480000000, 600000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE2 */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "camnoc_axi", "vfe2",
> +			   "vfe2_axi", "cam_axi", "soc_ahb" },
> +		.clock_rate = { { 19200000 },
> +				{ 0 },
> +				{ 320000000, 404000000, 480000000, 600000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe2" },
> +		.interrupt = { "vfe2" },
> +		.vfe = {
> +			.line_num = 3,
> +			.has_pd = true,
> +			.pd_name = "ife2",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE3 (lite) */
> +	{
> +		.regulators = {},
> +		.clock = { "cpas_ahb", "camnoc_axi", "vfe_lite",
> +			   "cam_axi", "soc_ahb" },
> +		.clock_rate = { { 19200000 },
> +				{ 0 },
> +				{ 400000000, 480000000 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "vfe_lite" },
> +		.interrupt = { "vfe_lite" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +};
> +
> +static const struct resources_icc icc_res_sm6350[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 0,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "sf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "sf_icp_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5233,6 +5480,19 @@ static const struct camss_resources sm6150_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm6150),
>   };
> 
> +static const struct camss_resources sm6350_resources = {
> +	.version = CAMSS_6350,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_sm6350,
> +	.csid_res = csid_res_sm6350,
> +	.vfe_res = vfe_res_sm6350,
> +	.icc_res = icc_res_sm6350,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm6350),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_sm6350),
> +	.csid_num = ARRAY_SIZE(csid_res_sm6350),
> +	.vfe_num = ARRAY_SIZE(vfe_res_sm6350),
> +};
> +
>   static const struct camss_resources sm8250_resources = {
>   	.version = CAMSS_8250,
>   	.pd_name = "top",
> @@ -5329,6 +5589,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
> +	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 6d048414c919..d323c105d185 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -81,6 +81,7 @@ enum camss_version {
>   	CAMSS_660,
>   	CAMSS_2290,
>   	CAMSS_6150,
> +	CAMSS_6350,
>   	CAMSS_7280,
>   	CAMSS_8x16,
>   	CAMSS_8x39,
> 
> --
> 2.53.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

