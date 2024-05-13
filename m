Return-Path: <linux-media+bounces-11431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 157CE8C466F
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 19:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5F6D281C7D
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 17:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FCA2940B;
	Mon, 13 May 2024 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bk/Gg8Oz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624B364AB
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715622516; cv=none; b=XIFVGnzCos2RUo9Z/acZ/UAl16ZtSnan8iW1KBN9Lp8YDtI5yJGUaCDcdrEARSRTGbjJMmY6XRiiwKOeBwYfBC/Dm4TUIRKOYqwIsXN6Fawdek/I2gp4zyxJBCHWqCTl5GHeQ7lqMYWtd6TuEQv0O4ycltokmI4oCjMP00IbX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715622516; c=relaxed/simple;
	bh=Qb9pI7QfawdOPDOVP3uOoIDj0eSToii5WjRsBEqNIHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOqqTOmxBXi+VN8SNKMY5PentZZN5NucX4SE21fnuCn+XlbLsR0XpgUjKoaw0yo26KFSaAf/WQC2zyOsliW8maTSFvuzLl7CCAJMcQpBZ2a9K9lOj5p3OmYtVkDBhI1kqVZ5N5gwhqQOlhYHEp1tcgY3XLjrW5f4NeH/WhtO6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bk/Gg8Oz; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a5a7d28555bso47835066b.1
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715622513; x=1716227313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRY3tylgCmAliI8QRE7thGCyBV7jJo3wfys0Ur6AtsA=;
        b=bk/Gg8Oz+f9piwrkNNGwhRueQSquVpOk3rSxPgTNKprtsIz63AdTKzhCu9uSlhMESt
         /YYS3CD3TSv6byf0h3SOQWCa+5IpckzRS+rYFtiU2N+57yFWutvrRTeZGfKHBLZYD9i3
         QH+bqcH4AXn4DIywuJ0Lxu0VPs9qcTd+WHFgrnnACGRQ/lJXHM5ZQZ3dHJ3LZseM7K5b
         YIrlGCUzrljVDzmypc77PGuObojSYiAuZSgs2Ve9R8YEAghQW4RmAvnCRJcmzrMM2eeq
         CdElxCYrsDtIb+rH4+g1MsXUeMRVSkx+GmyUmC8kvIImfNmaRU5mFfFGED3nxQrbvdeC
         EvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715622513; x=1716227313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRY3tylgCmAliI8QRE7thGCyBV7jJo3wfys0Ur6AtsA=;
        b=b3Qon1MYBJuKggSQMWO7c24Bs/BTLbeL5yoLvHRc1nUv1Vfq90sXedUtJywMtVaNv2
         KFrTwZ7Pn3r1v6TAhqaTeizfWXrMlLNN4caNySWe4g+uVRB8s7mQgoKjaneJd2+Ga4ge
         NoRT5UKRDDBPl9vUjzTpGtSCmKlI128a2PHlYo1PmlaY1nvBOsTGhCW5SmV5BizX7oYf
         Fa/PhV16rRGn6w3M2Cya1xT+7eCG6F5weeOCN1sItlClilcLczTMqJdrzR34LYMPHwT7
         M2jQwS3wfI+SDFFvx+KIS4kI1zAECo+OLPN2RykZneyyl9eU5NfnvB0COn47GE5SjEWB
         LLbg==
X-Gm-Message-State: AOJu0Yy/UJBCd9wSiPZZYM9B/xkefutsebitluhj7cCy5OJrbB5YnmxC
	wQyqs42os+HdcPOIFVyJ5Sdk8qqtDYGyaGPmE0BfKFuAKlfwZxQVCCUoV32vKyM=
X-Google-Smtp-Source: AGHT+IGrVeWxVKN0p3yev+Hucpc6yYLDpPjmN9epTdt903Nk5yOck85W17lX4Glgzej2638xCJkGQQ==
X-Received: by 2002:a17:906:17c5:b0:a5a:1b57:426f with SMTP id a640c23a62f3a-a5a2d54c10fmr711563766b.13.1715622513191;
        Mon, 13 May 2024 10:48:33 -0700 (PDT)
Received: from [10.1.3.28] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cf9csm620178866b.7.2024.05.13.10.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 10:48:32 -0700 (PDT)
Message-ID: <5bcfbb01-9650-4420-8982-af6537d7e7b5@linaro.org>
Date: Mon, 13 May 2024 18:48:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] media: qcom: camss: Decouple VFE from CSID
Content-Language: en-US
To: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240411124543.199-1-quic_grosikop@quicinc.com>
 <20240411124543.199-9-quic_grosikop@quicinc.com>
 <adbd0eeb-62c0-46a3-9cbb-92f6fde6c152@linaro.org>
 <b4bf05b5-4e03-40d9-8149-956b55d91a41@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b4bf05b5-4e03-40d9-8149-956b55d91a41@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/05/2024 17:26, Gjorgji Rosikopulos (Consultant) wrote:
>>> +static void __iomem
>>> +*vfe_parent_dev_ops_get_base_address(struct camss *camss, int id)
>>> +{
>>> +    if (id < camss->res->vfe_num) {
>>> +        struct vfe_device *vfe = &camss->vfe[id];
>>> +
>>> +        return vfe->base;
>>> +    }
>>> +
>>> +    return NULL;
>> I can find code snippets above like
>>
>>      if (IS_ERR(csid->base))
>>          ...
>>
>> So, is it really a good idea to return NULL on error? Probably it might
>> be better
>> to return a reasonable error to the caller.
> As general rule i agree. But here either we have address or not,
> i dont see the reason to return an error code. Also i dont see what
> caller will do if he gets error code instead of NULL.
> I am refering in particular this case. If we have different error paths
> of failiure maybe it will more sense.

I don't see a compelling reason to change the submitted code. I'd leave 
well-enough alone for v4.

Please keep changes for V4 restricted to formatting/line indentation/SPDX.

I don't want to have to reverify all of this code unless a bug is found.

---
bod

