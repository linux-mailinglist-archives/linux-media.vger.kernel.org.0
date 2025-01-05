Return-Path: <linux-media+bounces-24254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E3A01CCC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 00:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3F1218834C1
	for <lists+linux-media@lfdr.de>; Sun,  5 Jan 2025 23:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ABD1D63C3;
	Sun,  5 Jan 2025 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZARwvtBM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A5D1A9B43
	for <linux-media@vger.kernel.org>; Sun,  5 Jan 2025 23:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736121526; cv=none; b=MgKKhnn0dYVrHSSN3Toq7jtmb0UlzcMOZj4uPLVcD7qPutL0vARLbZLAVk9cxoiTX7BZfo+iK2tj4/X76buWvbxRhbona/g0yhl5QSTpCE/edvXBXftIBNlDwSz4BtnfZDEYORAodRqf1IkIHDy5WZoAJJ57Fn60NJkCqV5e05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736121526; c=relaxed/simple;
	bh=/oB79DLaXODS/gy0IycdhaP00aBIZCZoIFqlOL0QNUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwaXxW86NZtkSZGFC2My2+b3SUOL+jsxE6C+cyZWAEvDhvi4VDZKYY1gRbFUaGC2+zSVp5x8zHKJkjd5gEyXAQEF0I8Yp+GYyffYTHsSe3Dlk0/N6/jjZ/RYuf6SNtGwJUMj84pgHl/14lee6tFkPWV/Rp+9b4h8qGCiBrIqUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZARwvtBM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso91587915e9.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jan 2025 15:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736121523; x=1736726323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QbNsBvpoFk/1ISttIYoBxKkguUBs6TizEP3xjLgdI3c=;
        b=ZARwvtBMc9l9LUR3QyT8VfX+NWVX3LiEsgxZljjLUdImEa5brnRuIBhSu2deTwe7gD
         Muhs0bG+DkDkE+MygREuGoDMYsl8iDYxSfjP6pCPe64vuovD/k/OnbbDRHEgLLWt3vUZ
         1KjXFZf7Y2gM3IU/e64iGd+bhtpWbmRJmFib2xTGUdLLl1eoIqOZmcJF1cXFdXcj2WVN
         1uHd9fVtnDweF0AkImXCJeTL/Aye2dS2nZZe+nenFJiLhXouHQAjV7QBavBla5hcsQZH
         BlAYSRK6d4ppjAJ9OrNEQAO1IH9wDS5BYW5n+O9YXFn9Lof1E+6PVR71U5FBM2KClWIb
         EFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736121523; x=1736726323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbNsBvpoFk/1ISttIYoBxKkguUBs6TizEP3xjLgdI3c=;
        b=jBLQiXaIju/+YnDiAiUlxyk3D7JvMVVwpUUZrpIZH0yruZjN7ejZ/QNLxmQO6Ikx3a
         fOtbynXZXITnFmmepjerazcKNjaRcuMJ8AX0Q1gbLAZY33Yjiy6Ujy9wu9AlDUKXdTlK
         8HqbmzcO0C950SjCR9sSA7PJMcZ9JTQw6mnPSUj3xAoy1eSPXOCKNSNfwXDhgiGRowIR
         W/SxZFhKfzyyohjHCDrN/BaXEpjWRewODz7pnec1SGwBhKATWiEjLNBDp4lL9kxf7U2v
         FOdYh8H4626GcFWh2NuEnyl8ELgrHV0SRjpAo4s5S9TfH8TlJ1Vw1z7udq4lFYJe0yVh
         1Xdw==
X-Gm-Message-State: AOJu0YxTEUVKPquiTuC4Ob3ggCiUKJ4Gq0KsD8cq8kAcd+c1gygOBNPY
	qQ6IYC+TkabkNekxhKPPG9FXsvYkCEA2kNzDqTOEV+5XjQNweB3Ix7Xa52Ta2vw=
X-Gm-Gg: ASbGncvI0H+2CblXdInHpznLD5MstraJXTUj7/vn4EzRDPA6zr1JsTAvqs9FKvZsrdE
	xiVBX9j51ovMurdTbiWuC1s0KsW8Em/jnCLEsJ/9NTFOJd5n1zmiXmD2UDU7Yxh/uKDNS3ZwyKG
	TBe2a9Z8bfAGWZfU0bKltVFCCGFQ3ibPD6D3E4ipxStZURbP6WLi+qDRNOqW6QL2V3rhKBP3+iL
	z5IJmKRLxktRCjhXeCFn6NqGUDXMHrP0MysURA+jWYFy27FS8v6uBOzNGkWZF/BEQQ/XA==
X-Google-Smtp-Source: AGHT+IG6j9C9E/4LQM/2K35FNp7NLqsvOtrbIvhYHwapMRYFDdicWc8WyEtxiJGPCxEYcdYg4mD91g==
X-Received: by 2002:a5d:59ac:0:b0:385:db11:badf with SMTP id ffacd0b85a97d-38a221fb47amr46144030f8f.22.1736121522802;
        Sun, 05 Jan 2025 15:58:42 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833280sm46693179f8f.40.2025.01.05.15.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 15:58:41 -0800 (PST)
Message-ID: <f18c1277-0d72-4f7c-b325-5f19cfb0ab98@linaro.org>
Date: Sun, 5 Jan 2025 23:58:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: venus: fix OOB read issue due to double read
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2025 05:41, Vedang Nagar wrote:
> During message queue read, the address is being read twice
> from the shared memory. The first read is validated against
> the size of the packet, however the second read is not
> being validated.

A brief scan of this code doesn't really show the base case you assert here.

Could you be a bit more explicit.

  Therefore, it's possible for firmware to
> modify the value to a bigger invalid value which can lead
> to OOB read access issue while reading the packet.
> Added fix to reupdate the size of the packet which was
> read for the first time.
> 
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index f9437b6412b91c2483670a2b11f4fd43f3206404..64cc9e916f53e5a9c82b1ff25c4475d622ebc321 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -298,6 +298,7 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>   			memcpy(pkt, rd_ptr, len);
>   			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
>   		}
> +		memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));

I'm not entirely following your reasoning here.

Here's how the code looks after your change:

if (new_rd_idx < qsize) {
	memcpy(pkt, rd_ptr, dwords << 2);
} else {
	size_t len;
	
	new_rd_idx -= qsize;
	len = (dwords - new_rd_idx) << 2;
	memcpy(pkt, rd_ptr, len);
	memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
}

memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));

Which of the above memcpy() operations is subject to a pointer that 
firmware can influence exactly ?

Is this a real problem you've seen if so please add a backtrace to this 
commit log.

>   	} else {
>   		/* bad packet received, dropping */
>   		new_rd_idx = qhdr->write_idx;
> 

If this is a fix it requires a Fixes: tag.

Please add.

Still finding the reasoning you are outlining here not obvious.

---
bod

