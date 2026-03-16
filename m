Return-Path: <linux-media+bounces-55900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJXBOTT0t2mLXgEAu9opvQ
	(envelope-from <linux-media+bounces-55900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:14:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36C29948A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A80913043D67
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 12:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA38395260;
	Mon, 16 Mar 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTkvCI0G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66643299AB1
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662995; cv=none; b=dbjGYdRZxHC+PR1QHPFFKbjMJ6V4JBJS02EWBURxMYDLA9dZi36KdnO4OANiBhyEDKnb0tEQm3FIQxy26EWor0TMy/1e1KdcCtcQMmn46uwEWpOqh3by+zeEzZpRyKtLU9ifnWcrGAZ/g9rtv1H1pBCdd939CY47fYkA1lK5axc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662995; c=relaxed/simple;
	bh=Z1kSTj5dx/DqtFtksQ0PnVCA5c+aBQ+uynxwanfdfrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCIjixwNJJKcrO/vQRyqydeC391KnqnADOwNn4ELsSY9uxgdPmJIKZIKOMFdQpA4ObtffK1PNxHObBHi+927fgDbb0wXusKv33ZXbO3P312mS4IPSBK+ODUqGUCTezA8t6N/cUo5t6foNkBR59k01p9j7H21p2zwoiUpAYggjx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTkvCI0G; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so7521200a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773662993; x=1774267793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+aOA6KmbmXewMZ7P8FODs/N6f8zkWWVqFAVl7awbb6I=;
        b=vTkvCI0GM7wvFxNJxbQn+h3l4KunQAvfbadC0Mq6VPFOQorXXgKh6vTsSeXAU1QmAd
         WA5QPJjJdQyz6RUHByQe+Xc5UOVkmef4HvzzLic2RlwqyD9h3axVfrjSr9O5MQLCf67q
         Mns5kkURxY60Jp36EddwOKqAlUQyt4NbRFhoZ5FqKgGWtMwi8sp4x29sDucOkrhW3BGp
         AuB+CfI/qcX/AWYEDwbZUfs27kqmpRj7oy8jG4NWYtvAn2+Gr0/37yT/D6kPI3V5MlOS
         ZlnJ6wSogN/tJXE9Rh/4OJdYs7KWnI+B/qMLGf4aszRPLmE1Vq67KB1qroNDxBOD/5kk
         1jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662993; x=1774267793;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aOA6KmbmXewMZ7P8FODs/N6f8zkWWVqFAVl7awbb6I=;
        b=aXFphFjj+JhSGHvV54oHgeie0HQT/Ka+8RQeRxWSL0pk4IQ/s1d6EdAe2ghGCbK1rO
         ChGqO1INbaFRA0EoCWOZ8I3C7T2wzuNQt9+RamcL//MCFUiGlsrneTuzurz+dhmTHTm+
         ntKA0FP5uHrijM10UQnRpu8PCqbw9ORxJxHy4Xxhrqgi29gVsN+L8wJ2PCmkFKm3EL4u
         ezBFqCvqYungIb9/rJtJ2cEYOguv78RfJC1hO3+JHXydCX2x+14on7tDx7oKsUDLLClG
         Hk3F3aVPI8ZeBFTwZwtd0j0TTIOa39leKCk0NQBf8XT0vn5zE48CAbCmZOT/YASo2g55
         /P/g==
X-Forwarded-Encrypted: i=1; AJvYcCUarN1OetcuP9tq+7AbD8WzQxrM/InSFJCMN1mzPVWyskdNHUqx7Flu1i5zhGFBQ597saWtfwM6EmhAVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziCIpBb72j6RzUTYgoQPbIOuzCqKYYZGI2EvUonG2NTkxAWAwT
	FD1OMzer9kCmTw45kqZPocnfAZ5MsLzPFRUGovy+Ma2Oalue0dr8t8JE0u8mFUi5w/8=
X-Gm-Gg: ATEYQzxlnJB1R2foo6WucjuDfnD/gRfaL0qblZfaFFW4grA2pbuoy9M5dshBT+1Caol
	hzSVKGlX7fvgY4vDH9TmZ1nnvoV4ODHGQYPk1ALMnj99FNirO09M8EG2fwI78zNnpYQUVUJAW7v
	sKQ6tBwtufay0oPRCpjlses0xSwdQKyaV+2jVc0Ps2wjjrJh5JCaSvr4Lg6HfqUsFGR1qVQdhLB
	Rs45L6MSGpIGWn5V90jhRdZVOr6TJuDsBKzCHkOZJMt/qOLLBxRRw8FpIK/zn0oCwVMENJBeX+x
	KqS96qHeuOe3HQ8wHo08HC6GD5SHFDDbBjipMlIhbXI/RcfwjqwRlmDdW1mSKcL3dLU+50EyV7U
	WpTa84PmcjoCnB0dIteww/lzGedRUqmOQvG+K/VZO7XBJ3hK1NTzIsgFJfYtzypOdxSKRyX7uW8
	/revNaO4ZIhO3O9ZorfgPc20YLEkyRhAHBafGf
X-Received: by 2002:a05:6402:510b:b0:663:b689:ca74 with SMTP id 4fb4d7f45d1cf-663babf098bmr6870723a12.19.1773662992752;
        Mon, 16 Mar 2026 05:09:52 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d84130sm4654241a12.33.2026.03.16.05.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:09:52 -0700 (PDT)
Message-ID: <e4f0810a-903c-45af-8d6b-80bab53b26a6@linaro.org>
Date: Mon, 16 Mar 2026 12:09:50 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <c59f621f-23a0-4c60-b8e3-5a9082c816e2@linaro.org>
 <wjsnwdyoptrfbmdkqlcepzekfbccv6vsfop5wm37m56rtlevfk@jkbievryoo2j>
 <a685b880-0239-4804-adeb-c63204a91142@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <a685b880-0239-4804-adeb-c63204a91142@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-55900-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 6B36C29948A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 10:49, Konrad Dybcio wrote:
>>> On Hamoa the CSIPHY supply voltage is 0.88-0.92, so it is 0p9 rather than 0p8.
>> What is its name in the schematics or in the datasheet?
> VDD_A_CSI_n_0P9
> 
> so vdda-0p9 seems fitting
> 
> Konrad

(0.88+0.92) / 2 == 0.9

I'm happy with the average.

---
bod

