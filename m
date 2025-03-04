Return-Path: <linux-media+bounces-27486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E490A4DF92
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 14:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA5F43B31B4
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 13:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDBD2045AB;
	Tue,  4 Mar 2025 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDN1yHwo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3972204592
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741095921; cv=none; b=PGpR1ZR/i1nbPEnJXhVTy1LjobhjcrC+fwJtKg8AEar5f7mw0txBoBkuHgb/E+Apj9Uqd7v7dfK+jtYd4uk25nr5CQGThs5JAChFDlwK5eEgx76kk77YgTlwHb4QXAD6trN8e05NMcd6Jv23HXXwwYpPlqdv2tqc1xegNudwJK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741095921; c=relaxed/simple;
	bh=NqK0lDxLELOL9DD+GeZsCiZ5LA3cKDL5a44tbt5qZtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qR899gXBji7VBkfWo3A0VXeNiww2sXgaZKY75K1cfFWXnWRxEsbzcyfNDPTvWI7Swl45XZ4hEWan0ErVQea+aqG7zfx4gyW6xDmqVa/JpUUV5g5SqljN8f9O+RGQAdZKHTwHIiHV46i8Nw4A1gQJZRQULhn7MjlalHQ3ApUJevU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDN1yHwo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390e6ac844fso4963763f8f.3
        for <linux-media@vger.kernel.org>; Tue, 04 Mar 2025 05:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741095918; x=1741700718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtRRg4J7QV1jyEFxXJ9yQG1POl4I6geC1f76q6WuMIM=;
        b=tDN1yHwodjOz4V3TRaZu7iziYe2aMoFtxsUtCyMhRwPJNDTehta4eM8HZJhUpLmyAt
         qhbDdH/VrB4MYIV/Z99sMCVaaFF2iZLgEWWAuP8+B1K9Jc8uOCYmokoyiLqcLl7C3RLs
         Mab+JuebmUNp/JLd8S2mbpTiPiJJuQcIjxY/QIlOugVZFCzOKgDdabxmEoAKUEsakHW2
         lY/J+muA+GcXtLvoipL9knf62ZNEF7oifZqmqj9JwhyspGDXq8Twusj0dZE+l+L80Tnn
         HAFwbLvqqoL24nBma7S6eVVHq1IO1OEkHBHjsY0GIsll/AIeH6cjw2LivZ6ONaCcI6u+
         muWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741095918; x=1741700718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtRRg4J7QV1jyEFxXJ9yQG1POl4I6geC1f76q6WuMIM=;
        b=VZQote6VbaL89fxc0UlS40yRVQg4LKCnJHnOfgUKsNcBzX+7dEY3JgOYUMM85wCxc5
         Ij+TlcrjNxj0jryPeZ3/z+lKcamJQOzkmderQu9CQwT0BBd1lR5ka5qZU/+Vw1J8F03O
         TnIE9hBgBbistAqsJWcgSagjF4bx2ZBU0N7eFfXDJkLxzl8jZwTpuawp4zm05yaydQf/
         T4Fv9eosyYdYrX6N/opngYXRJmSg+4suiNwhpymFdDo0M1HNN2tVywbTw3lSblkIxq1e
         oUDqQhoHILpH8+aaZmxUxk2DHHwYzFgr6sJtbXl+4Kp7eoP1M5mf0EB8Ba6zY7p8Soal
         BfuA==
X-Gm-Message-State: AOJu0Yyvhiyxwq16xKG1O4iXEshvXTB6TfwCVLEPv5Hir1USFkzrqscz
	GATTypZkpJcLivr0vD3NOvKFHbukoEDSgRfsfAA8iOStjC6sRf5XGhY5tqMO5XM=
X-Gm-Gg: ASbGncsfQeIBIp914yB4g5RizMpnRq1uUBc1PaGvg1m5++sCJEVb5jCSSJOvJ2haWWi
	Qree6nRYt+9OyPAqp80Czvcf2kHcqr1w6Lfh65LS3UyZmFdaWGmwGx8eHkfwBzphxcQvrH8sffv
	5X/iIV5/ESDiQavr1Tp0ugPOFFDim5p60+0VgPtR6bPlurdKvmIGz0KXfmJUVxAuwB0KSCiJvna
	2E61LdSr+QZ2Ic6pRVoGMc796XcrfLXjZAPOcjkb3dlwLB0cWlMQgD9+AJWS+3IGmASUCr3f48u
	kxyEAcxz5KCsBAODKHnBpD5iQpT1I0wJ875jKb2DE5anc5f2r9BvpKzRHxnMG6CCrVxKhRhJt5o
	gW65yGsGxIw==
X-Google-Smtp-Source: AGHT+IGJ4dtiZRMJMOnqPeHzryVAMSS7yvTZyuTJnVR+H4eCzXwrKiCtheWRCRn+0WfWFlydM7tKCA==
X-Received: by 2002:a05:6000:1868:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-390eca40e2bmr15866381f8f.51.1741095918174;
        Tue, 04 Mar 2025 05:45:18 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d8e4sm17414305f8f.85.2025.03.04.05.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 05:45:17 -0800 (PST)
Message-ID: <79691e26-cddb-47d2-9112-deae3f9aaee6@linaro.org>
Date: Tue, 4 Mar 2025 13:45:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: venus: fix OOB read issue due to double
 read
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <20250215-venus-security-fixes-v2-1-cfc7e4b87168@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250215-venus-security-fixes-v2-1-cfc7e4b87168@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/02/2025 17:19, Vedang Nagar wrote:
> During message queue read, the address is being read twice
> from the shared memory. The first read is validated against
> the size of the packet, however the second read is not
> being validated. Therefore, it's possible for firmware to
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
> index f9437b6412b91c2483670a2b11f4fd43f3206404..c124db8ac79d18f32289a690ee82145dc93daee6 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -298,6 +298,7 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>   			memcpy(pkt, rd_ptr, len);
>   			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
>   		}
> +		*(u32 *)pkt = dwords << 2;
>   	} else {
>   		/* bad packet received, dropping */
>   		new_rd_idx = qhdr->write_idx;
> 

This is confusing - where is the read

Your previous code

https://lore.kernel.org/lkml/20250104-venus-security-fixes-v1-1-9d0dd4594cb4@quicinc.com/

memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));

V1 then would have been:

if (new_rd_idx < qsize) {
     memcpy(pkt, rd_ptr, dwords << 2);
} else {
     size_t len;

     new_rd_idx -= qsize;
     len = (dwords - new_rd_idx) << 2;
     memcpy(pkt, rd_ptr, len);
     memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
}

+ memcpy(pkt, (u32 *)(queue->qmem.kva + (rd_idx << 2)), sizeof(u32));

V2 proposed:

if (new_rd_idx < qsize) {
     memcpy(pkt, rd_ptr, dwords << 2);
} else {
     size_t len;

     new_rd_idx -= qsize;
     len = (dwords - new_rd_idx) << 2;
     memcpy(pkt, rd_ptr, len);
     memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
}

+ *(u32 *)pkt = dwords << 2;

My comment wasn't about use of memcpy() it was about why we are doing this.

For example if new_rd_idx < qsize is true then we literally do

a) memcpy(pkt, rd_ptr, dwords << 2);
b) *(u32 *)pkt = dwords << 2;

and the question is why ? That is an unambiguous cast of pkt to the 
value of dwords << 2;

What is the scope of how the data can change from a to b ?

And why is the data considered potentially invalid @ the memcpy() but 
valid subsequent the cast ?

Assuming rd_ptr contains the length of dwords << 2 to begin with in the 
first 4 bytes - why is it necessary to make _really_ _really_ sure by 
restuffing the data ?

For example if *(u32 *)rd_ptr != dwords << 2 - why shouldn't we just 
throw the whole frame away as containing junk data ?

---
bod

