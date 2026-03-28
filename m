Return-Path: <linux-media+bounces-57458-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCt9G3b8x2mIfwUAu9opvQ
	(envelope-from <linux-media+bounces-57458-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 17:06:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF35834F183
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 17:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8B5E302F7E3
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 16:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF844399018;
	Sat, 28 Mar 2026 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gn241dQV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA11256C6C
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 16:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713826; cv=none; b=t8THCRRNMgVs5QyH6+6OAVkVKDDJhjG5ZssZl6kmmlrJr4LjyWjtjk+zR8ixnWOUIxPEf5oDEwsc51DZOIql1phb/BddM8gWgzch3Zpu+yjiPZkiZlurMjcSGnbV2X+Y0cUHupv3KZb0Qmxvq9TBES+Wj2LVKGj/ZcK7z39/VPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713826; c=relaxed/simple;
	bh=lgGKVbBKE+fTwLHxUCzt47tu/KqD2I6032H0u1C/qDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+zQAQZJUz4VZ9sGsJsa87KoK0vIcm1HdmABOROESgnRSJIRK4y7HioJKrE9WoeN+nVFN46UJ1s2sXXAOz1TRGkhfVZpMuyVl3boQYIQ6USHwFkl4vveAkxDQXPwNjGtBtRspsIkccPOq72XmJVEAOch3hrWkqY84prs3FZzyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gn241dQV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9841aecf72so358592966b.2
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774713822; x=1775318622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrcVPMX3tCYm4PmLUfk7Jvax7+NoYzH2ICdp4Ljkplk=;
        b=gn241dQV4OW2CAqTiJCT6oPb4VnXb5U3otL9P1sJBtkfdEKR2d5z9zYU9vR39kkP/z
         EwLJ6JiERClgUnX4B8JaS2LgvRRLcZm4o9M/TXUZUWNb2NdgtS1Sioz1UvsuqiutrEhv
         zpI6zjNqYRz6axB/cW/Ek9TxVYIWO9r8h5Oyxd04j0uXzcnfoQtXtkx6g2gl1vGtuei7
         IF6QRMHgU/G/EKZksB2erGM/cMh76WswcxsEGi4qyRwal/bFSR4COMHndvAiAL8sWYYM
         Qbx8FSXDI+r5IVHa75X05//rfMibbMYJDwDIUzxWIc84/vFlBs/svTup0bK+rAMAf6ek
         7EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774713822; x=1775318622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrcVPMX3tCYm4PmLUfk7Jvax7+NoYzH2ICdp4Ljkplk=;
        b=WFflcBg1Eovyi5WV258+RsBEJZxjio35aLNDyst4SmiCxN7klb5n7jqK6k8vwEd5H4
         /TVnyzhTYBBkajdV4oKEsrzNDuTkud544WCWmLvt1i/wxVZ3LYRdDb30FW3sXV+Ag629
         4WAYQSqvaqp9mwYUJA8qvilMB0VP9ZGIxs0P8j8GTixb5l5CqZmwbAi53UR6K0cAg2MA
         0/pcKZmNEgKDhNclLop0yAhiNhqUqCMv1lXfsz7JwRF+BPsyMcqbRgt2a/NzgPS35qSK
         AQ4kKJPEmlZ0Gg3UyOzdivQRb27HLeySSbCEjhFKR7KCbRcdQrigL2KEOfnCJGuGEObP
         iMCA==
X-Gm-Message-State: AOJu0Yy34q1+T40O2ff2U682cP16uSFSw1pPok3wNGEcGtmqH+oVLA48
	JZNAuq1CaKWBv93PQ2mpFk+YAERrgjAmEznEeAm7AJitn9Au4MzyKTapqbJW1Z1t5obux080CwV
	Rqaon
X-Gm-Gg: ATEYQzzWcOxfYwX+Xf6E3qwx8hzmxvPpGxY+UVhoiVoxgw2wf5RYpt9K8/JUu4qCdQ6
	pDGGOlzqZwp+41hMvjVyHErJmQZ4c3bcWfBMhK39ot2CIu0bRf5gN779AqwlS8WKAxvyCJB9ras
	5+pM4iNo7lRufNlWazblAbGMhTe0UrYVOIRQs7AFx4ES7+D7BHcblZUAM2uxpP4LWmms0CrKnYn
	kAF9LN2+nNAHa9oShkQXvnfe76+nY2IkQp/pY8hWFDT7yjGSGYMQOcwkQxMNtel7jnxBNBxIJp4
	84UT+JF32HTVnVxWXunQhzNZYfKxLbxxg6fRpyf3P6ouKkLIuLqv+J0+pG7kwMQ2HkGi+oLu0Lz
	VTNnfaX3qQmF4OSILTgN++qzc9DlSUdDq9RCYQyPfhUmJ8BnUtvbjJQRB493I9xYodtlLZUW9CN
	VbbZXnv/7vZyoHfG6UzZy8g6WP8u/LcJsqXA==
X-Received: by 2002:a05:600c:8b77:b0:486:ffa3:584 with SMTP id 5b1f17b1804b1-48727f17035mr92343295e9.15.1774699085874;
        Sat, 28 Mar 2026 04:58:05 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.108.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21f173dsm5134165f8f.15.2026.03.28.04.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 04:58:05 -0700 (PDT)
Message-ID: <ccc4f25f-1796-419a-8d10-7180b28b0547@linaro.org>
Date: Sat, 28 Mar 2026 11:58:07 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Fix clock and IRQ
 configurations for sa8775p platform
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <uLRnS7PkynWp9Kn5RKKBeGY6obUZTTQfoIDTjSGe4xBdLmrU8OhgrUeADUAv4sLVAxhCLLY0jdE46Z6RnGyvpw==@protonmail.internalid>
 <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313-vfelite_fix-v2-0-7014429c8345@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57458-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: DF35834F183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 10:13, Wenmeng Liu wrote:
> This series contains three fixes for the Qualcomm Camera Subsystem driver
> on sa8775p platform:
> 
> 1. Fix CSID IRQ offset.
> 2. Fix CSID lite clock configuration.
> 3. Add missing clocks for VFE lite instances.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Split patch 1 into 2. -- bryan
> - Remove duplicate clk rates struct.
> - Link to v1: https://lore.kernel.org/r/20260313-vfelite_fix-v1-0-2ee7de00dee7@oss.qualcomm.com
> 
> ---
> Wenmeng Liu (3):
>        media: qcom: camss: Fix csid IRQ offset for sa8775p
>        media: qcom: camss: Fix csid clock configuration for sa8775p
>        media: qcom: camss: Add missing clocks for VFE lite on sa8775p
> 
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  6 +-
>   drivers/media/platform/qcom/camss/camss.c          | 80 +++++++++++-----------
>   2 files changed, 43 insertions(+), 43 deletions(-)
> ---
> base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
> change-id: 20260313-vfelite_fix-00a36e8dccfd
> 
> Best regards,
> --
> Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


