Return-Path: <linux-media+bounces-16697-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF195DE1A
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 15:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5CCF1F21C44
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 13:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F94179967;
	Sat, 24 Aug 2024 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcdQWU0q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D980155346
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724506312; cv=none; b=ULWDsaCv31DYwoAvRak+8Aji6iEE0BZvtKXZsJqSjBBSiWAGFrCvQtMOvzlsKHdHojOeMWkZQDOaHrj/P9P3sgPW+fkbXkFMcDAjXS012klfQqar3MjbCVyOVBmY3RIOjY4NfoawBawDXfCTSh4uen47uRmLtLXI9qKuFXtdTSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724506312; c=relaxed/simple;
	bh=q2FiwbWN5Ks/pfrAWeo4mRm9niAs0IVKgREydX5NwxY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZjWmp07LAa0wWIe/IXgVbOy4eFfB7OSh58KwglZfG17bYa1vl5MaIPfL5EimbH8YVhFLqMWj3Y7Uaja+tS4tPlCXbgxZsWScDHScRGQpXU4SLheDkubePT9STvlQQ7UwXE7g4AlRHMEUsVmtb9Oyx5FFVzme9rUqQHDY06QgOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcdQWU0q; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53345676179so577812e87.0
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724506308; x=1725111108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLWX/5SIYPjwceOuGKBwVTZlsQA8zhlUnRn9GP6P+OY=;
        b=AcdQWU0qhF8EPyW1wq/B/Y8OhjHHeyWW+KiyadulPFjUtYtRxfB5CScUTX9K3vZ+Tf
         kUkF3TvX3T7sdXVMlPD5bUr/tHyAQTRxPlO4anl/DaNf5CwvvK/ZbnqLqo/RSRi9amRk
         FZy899ZNctP4OMRRYpv7/ClmMTZP2qxe1xOYUkAW2B8nDk+GCQGz92Muk4v57JL1Gpbx
         AIyqrc3LK0AfWQs0g7IgwFrKK+bQCrlKzOG/E0BgJZD5U6AIAE+731RRovbOBUNP1K3E
         2fOv1wUVxK88vXELU0LeHhaxVWJ72D9gcnQBHnmSc4RDyeltqmQSYiFSMmogllA7Idwl
         XvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724506308; x=1725111108;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLWX/5SIYPjwceOuGKBwVTZlsQA8zhlUnRn9GP6P+OY=;
        b=kZhpKotWMGqTkN8eDAfld3iZc+JDC/HQw9mjzAfVmtKKo7kvbSSHL/9qK0uWTYvi8w
         iLcxxF0uOKAjBHnEiLXIvUd0Lry4sHZMi0z6bWAJH4oui7WHLjP0wDOiaMYfaD18K3V7
         FbJzZcYcbqSNNHB8BSdsT52NY+XL2mGs+UITNdE7ACODrPvUnLofPXK3Dd9uxQ65K4cs
         7E+WAtXJ5vH1rMCSOG56VNjdXIzDoY/tcob82naa3AGanwvTKLEbJfeyn3cf3ConKwu/
         k79dQOidOWAxZKhLRUsxD2e5UbRMREM7FHjrf7HRm+sD2w82e/TwkZFiJgwsxuZ9NXMg
         IBDA==
X-Forwarded-Encrypted: i=1; AJvYcCVhi7zU6Wqe0bGagvq+Ng326IDsNR+z46WBOQr96MznuFV8lfWwH/09jnQxyV2g0F7Gvw27Ixa4cZelUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAfH5Az1TnwevZYTATEVc4oRaQAlADkMvzO3jWGASl6X7RaeoU
	qU9P1h/ft2L7oGLxO2puNN4VrpPo2Us1h1ls4eRDLMOnBkG6dKKfVMKMZwSQolg=
X-Google-Smtp-Source: AGHT+IGAyhgfB2fZzHIr7u9lFSSzZcMJDsFciOaPklAFNW6SbOGfj3F1ghJolQzNo0SgeO8ySa++yg==
X-Received: by 2002:ac2:4e07:0:b0:52e:ccf4:c5e2 with SMTP id 2adb3069b0e04-534387cd2d2mr1999710e87.8.1724506307592;
        Sat, 24 Aug 2024 06:31:47 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea36408sm854425e87.73.2024.08.24.06.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 06:31:47 -0700 (PDT)
Message-ID: <c7aa6519-0706-4cc2-b043-43f31a78ab5b@linaro.org>
Date: Sat, 24 Aug 2024 16:31:45 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <c501b813-e78a-4fb0-aa7b-a2fbbb90f10d@linaro.org>
In-Reply-To: <c501b813-e78a-4fb0-aa7b-a2fbbb90f10d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/24 14:11, Vladimir Zapolskiy wrote:
> On 8/12/24 17:41, Depeng Shao wrote:
>> Add support for VFE found on SM8550 (Titan 780). This implementation is
>> based on the titan 480 implementation. It supports the normal and lite
>> VFE.
>>
>> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
> 
> <snip>
> 
>> +
>> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
>> +{
>> +	int port_id = line_id;
>> +
>> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
>> +	 * Notify the event of trigger RUP.
>> +	 */
>> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
>> +}
>> +
>> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>> +					enum vfe_line_id line_id)
>> +{
>> +	int port_id = line_id;
> 
> Once I said that the comment with a typo can be removed from these two
> functions, however the functions can be removed, since they are trivial,
> use camss_reg_update(vfe->camss, vfe->id, port_id, ...) directly in the code.
> 

I see that these new vfe_reg_update() and vfe_reg_update_clear() are
callback functions now, so, without making a step back, now it will not
be straightforward to get rid of one more level of indirection.

Just remove the comments then.

>> +
>> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
>> +	 * Notify the event of trigger RUP clear.
>> +	 */
>> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
>> +}
>> +

--
Best wishes,
Vladimir

