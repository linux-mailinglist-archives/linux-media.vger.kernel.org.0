Return-Path: <linux-media+bounces-50803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D8D25831
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 16:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 372273010E69
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7F32750ED;
	Thu, 15 Jan 2026 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lfAGhMxK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC4119E968
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768492460; cv=none; b=hAiDlRrX9wY//L/BJDdJPGKzddapZWCGNgH4QaznbMWxP9838jBKZaK32PlpqSIxQRClp56P3zOoSVQkKYrDB72RA9hUdlLd0EXvjYNpyTpG0Jv6F9N0zzSMpRCPatMYhovxfnF68Qg33IwvP6vbHHGjUXUzmKDs5xZxGkMLLSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768492460; c=relaxed/simple;
	bh=Ske1nYGRXQK4PyUXkOyknKoa8+u+jcut+L+FXzFSQhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4Dyttg7j7HucZd2eVM8KwroE5tR0Ws+Doi8M93Bt1M9FpMA6GQAfaXIFw4WC1nltheozqxAK/OyWMWH5qMPKRr05fpyecQ949jSjvPlOO/oXVoCy3zrkJFAkKsjyMTZ6kSm694tH88xTODNBcN/2ld22HuYCOaqY9cYE+pZFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lfAGhMxK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so4308205e9.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 07:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768492457; x=1769097257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giMlm7L2g+M4CFMM8/nACLMgbMspj8AJvUXN07mxYlg=;
        b=lfAGhMxKEqvX1CfZ1GJdahUGj/ROD56xC91aK1qQysmzZGEg0v0xLmrXzS+vBXDsX2
         OWblT13a3Mompj3Qapc7gIcrpfBkWwzev8UuV9XpVMNdCCRZBj4aumNntkov/95pCtNp
         U1EflQyGEkYxgpLg8T17aJyoy7pvFX0LJwgvSOpW0rVJseXo2Ih/5pxDUCk9ebGR9JBd
         OEvy9Gvc9sHdWTfytpsZdBzC6YxxuFAFdA8+PZU4RI8TzP3HEoIa9yWlQOz6ws6LhPLB
         w0GXt50u9DylYVXWakzDfQRAB3z3rEOzhtdtPLyg39q/0q2Yt/ghJiS+rCfM6B0OwB7v
         NYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768492457; x=1769097257;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giMlm7L2g+M4CFMM8/nACLMgbMspj8AJvUXN07mxYlg=;
        b=vfaE+vkuwOfe3y22ZJK27IBXsJiBAJXCeyXaqIbArOG/QpoG1pUYGsjIn8wym2Fv+B
         bMnvE2wvtjlLNoQGVRmsxl2Y+gr5fVv1sAzjZJXBUHI2pWO7kzfeNqXKhu7HydpXebrW
         918KWlkeY9+NTtXkOUJEQGS6N5MTho5ZWVIscqxg/aWhDClfC4gEZ87ls8EEwZDpTtRh
         uxgNspM7wXWqYSzjTCb3ui3+W6doXk3XycR01WnFrxs4VQnOlUErhPqZVxUiEa1hOsQv
         0/Et2z49wwj58WsSYCxdobssXR3nSk+Fzprs1x4iTWHKqofIFJsZKBseiJRrgTzvFtZn
         /L1g==
X-Forwarded-Encrypted: i=1; AJvYcCX59dhves5sLLK5r7Qe3iQySbZKRIrwcv0nRN2iBt7Ag64KpruEH/fjwGzDvK6S2NsEb8UZJYePi+T8bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnTx24q/j6lPJu+1tOBNImhbdXGNvVl8zMhhhAHe1o+XzExhoW
	hKBAAvIYP3FPn5ATxpbFTNBjqaM8ewZkZ0bOQ7wZRn57tSNxyn+3l2d2wqfLbEwJPg8=
X-Gm-Gg: AY/fxX5bJLiHwqb8biyNFCp4nvhrnDT0JZfH8T+/drIyAbWGC5fgjxUCHfoXU/spTyf
	Eo6aUg3DeZf6MlyyeiRHwLqXZrhpgOTZmy+M0yc9FSdhsL+rNJsyHD9TKMYObBEpCMmQjO65yZ1
	2Q1fyBV7K7YSBMOnh0lL65ZRsi+/JkTT9BKeBSv+7UfwXlQi5W7PLzZFSd7FNoonrk7ul8yp408
	Es46Og254hNYvsWnEAlw0BYEwvtZajgSvOt6XoeVVKCEpvW5EKghRKeCNbXbJcJyyqVrAlhvk8s
	jlsNjGwe6GA0CU1FVkirJSKxH2Bk1ww8RvVd3P/RAGXCjsIMoc28a4VDB1nOP7uONdiurWekIMu
	Y+6V+X0iYwU3N9VVO2FctYItyc+0n+M6++gsaV+ZqpyC+Fl+7AI6C+Pe07yW46yIxjMbcNIm/Sm
	zA6MPFjks/aE/VuNPVVKrsxfJ/UuxIgo6iYU/2G/RKKOdX1sRNrF6xUvt08zCVTkA=
X-Received: by 2002:a05:600c:8b30:b0:480:1aae:676c with SMTP id 5b1f17b1804b1-4801e337219mr2560995e9.18.1768492457318;
        Thu, 15 Jan 2026 07:54:17 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f42907141sm52933395e9.9.2026.01.15.07.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 07:54:16 -0800 (PST)
Message-ID: <e94e3391-6fef-4378-b5bd-66aafea95a0c@linaro.org>
Date: Thu, 15 Jan 2026 15:54:15 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
 <a70f69e6-6ee6-4a96-88fc-c0ec4db48697@oss.qualcomm.com>
 <641421a6-bf42-49f4-8f94-9cb0bce8e97c@linaro.org>
 <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
 <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2026 02:58, Vladimir Zapolskiy wrote:
>>> Writing proper values to registers should be a concern on the driver 
>>> level,
>>> it sounds improper to push this simple task and responsibility to
>>> userspace.
>>
>> I think we should stick to the same format as is already upstream for
>> the CSID version of this - which is the same data.
>>
> 
> It is not the same and it will not be the same, if the currently presented
> version is taken. If TPG modes in CSID are continuous, here they are not,
> so it makes a big difference for userspace, and better it should be 
> removed.

Not sure I follow you here.

The set of strings for camss-csid we have now is:

const char * const csid_testgen_modes[] = {
         "Disabled",
         "Incrementing",
         "Alternating 0x55/0xAA",
         "All Zeros 0x00",
         "All Ones 0xFF",
         "Pseudo-random Data",
         "User Specified",
         "Complex pattern",
         "Color box",
         "Color bars",
         NULL
};

Wengmeng has

+const char * const testgen_payload_modes[] = {
+	"Disabled",
+	"Incrementing",
+	"Alternating 0x55/0xAA",
+	"Reserved",
+	"Reserved",
+	"Pseudo-random Data",
+	"User Specified",
+	"Reserved",
+	"Reserved",
+	"Color bars",
+	"Reserved"
+};

I think the "Reserved" should go away but, other than that we should 
keep namespace consistency between CSID-TPG and standalone-TPG.

---
bod

