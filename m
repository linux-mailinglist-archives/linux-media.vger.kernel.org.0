Return-Path: <linux-media+bounces-66817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QrTZKbS/TGqHpAEAu9opvQ
	(envelope-from <linux-media+bounces-66817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 10:58:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 196BF719714
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 10:58:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G2JApmaw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="HDItK/kS";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66817-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66817-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EBF3308DCC6
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 08:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37AA34CFC7;
	Tue,  7 Jul 2026 08:54:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4CA3403EB
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 08:54:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414449; cv=none; b=F5LosRcKeVvWdFLWV22wRN++FJr3YU33E+5VHBW2ADDxK7ZWnkNfL1Nx9NlBGl+zLuSTaJQUepVO9+8UiqPf8d9HCSRr5b3t7LzFz3HhIb5og4BCAJ6vomGYUWMFZRZkF5jz38F5Im0dSMF5YcWV4z2nz5PQDYLa0KbA+OLYY5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414449; c=relaxed/simple;
	bh=H+1xQdIuoHy+Nk2vlq10nHbMJcUSSEPlCSoflmw4yr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcdMYVOXlnw1uCF8LMylbmkZVuxBLoC8dEN849C/wwHlVoLN4KwaU+OZTT1PnbeKLaRUusMMxC8LSo10pSGPHPcvcLVCN0SMfBBgNKbQbgd7cOCXCQh+XVWONjoPQyeh0IpHceefKf8PHS8+zYpCmek6AfGl6D8JpWnzOB/iD9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2JApmaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDItK/kS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DoBh3205913
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 08:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2n1C9hOFlYsRmTm9Nk1r1gsSE3jJPg/8JSVraPix7s=; b=G2JApmawdiqJgeng
	aj/GqZciBvsdO78F6chdium2PmjaE3aKnRbSyUByGQH845VNNEA+nk6g+EB3f+Re
	IYgO5nLxldGTZb1QyM4MIKTf2StoF24DOU9FwiL3XVTRmg/l2O8lZEvOnMXnspcl
	AikyGa6lvWnIBXhy8U7hKZW8a8avxS9Wvn5wSPy90VwZQ1QVdysUFh73NQ7aiNtA
	bqEiQaABs9KC7LOC8xYiHLRxS4heUlU4Z446hgwCTeY0UrY8GNg8w9lOUyGvG8WI
	JmbvoXtIjvL2xYQrU3aOJCZopIRUuMEL3ZVbYlDe+XStDZWyn4Q3TrihztjcXLaN
	cm5jWQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3fhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 08:54:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so3604897a12.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783414446; x=1784019246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2n1C9hOFlYsRmTm9Nk1r1gsSE3jJPg/8JSVraPix7s=;
        b=HDItK/kSNujE0dUNvbgdNLTIHOAEIMaEJ6trCNdyHXFn2yeNytNLdL9yDi5l16WWZL
         90VHduboccqhPoud+yeLAWL5X7LyN80gTzpLRRpE7HLhDrup3dH7JBRSY0cpfagrZR3Y
         OZKyh8YDQQyozvY/AWnbSaaG3AK5a7rQzCKaymcIUy1UgsEW2zxqFxMCalGOZnKvdeBl
         JJe8WOg72w9MBBPj52UT6SkZmQhWmxuXwug8In2gZnJwEutsqYwtyto0z6nMj5nSZlNR
         joD/vtkMivbYKUjBahuzgVzW0OhqtfqX9gisunbSeKq2ezSEm67qdvbpYFTowH4BVA+C
         rd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783414446; x=1784019246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2n1C9hOFlYsRmTm9Nk1r1gsSE3jJPg/8JSVraPix7s=;
        b=KcEsa1GUcWWb/6DJrnKTXWMjQL4MdJZy25Ab7zuLm8GhtjE0EExFhPpi3fYY+IGw/h
         Les8UNcbK4U48fyQwqr8w+1HuS3jh3W2QBFCN0GQYi6AGxk0YntVsFw0gursYTw8SONj
         xf1uoQt7Bq2iaxeemGVRnCa29IfCD4uwROaMOEVwNKwzmzFbHFtbnm8QziVR5g93citz
         nopqFEynNtqWL4Qoh6uPlbk55CsFu6GFjeq1li6g6pJcqN1GDhSXX21YQYlEq751dfvR
         y0NIazgt6DuT/Q5plqs1BV5Od9l50bAbYYK8kQsYXlOxhvse1nb4T7CkerhPbiGy0m7K
         JOCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpdg62Agsw02EIwK4P6EC/HbvWyq8cZI4Go8ui8N5KgU+KMjvJOLwtRPAoL8fhoGvr6wGS+HL1uBu7IpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+bMzp8gt7qotaATKFCGUdyifMpFFud9tbqpGR8Fytf2+Zf2ru
	8ogxW5NEXaXdUn3PPuT7RbcGRAsRfjKkg1StW8YXWGCDaJ8qLc5Yyv/Y+xKGNUwd5s59daUfBw9
	qX4zGYFH8H8E2UKRz+WQBBCLssYGJk8Ha6Rk33ZxP7p1orApk/0OBaON87MwpMcbAeg==
X-Gm-Gg: AfdE7cktLBIV5dlP1QM6pkoOQthLo2R5QcDb408iJ4YKs/v9GwCnXwpT+513yCNJKn+
	VGQoFbH3C3LM4N/SQVMAmVGqqehUCqfLGdHO2dpGz1dH6d3NAxtWKaPGA8xega4XevoZrHt8F7h
	pPvnNBbGwCSsqFWyOezpS9txefEKgblNEmlqqWrx1aexH8jyBbvuXHzKtBWLIsaOJtjD/rPn2YG
	5Ri0UBzuj64Ogtk8REAhSICTKrjbXLjAfLlszrCpwww8j5v1FJnh0ZEeFdUxJF9XAdfrqEO4587
	GiPsWW4lavOGd9Z2QHeJXs/vEiGD7aqo8opzxgc0TWHcazktIy5kDVNJIVmO4t7ydDL1fDX1tUl
	2Ktci+adKcGjqp7I2n0oGnV6W8aBOaqWWZJ7hYk0tcR5t
X-Received: by 2002:a05:6a21:50f:b0:3bf:b68f:4682 with SMTP id adf61e73a8af0-3c08ec8d9f5mr5523183637.7.1783414446273;
        Tue, 07 Jul 2026 01:54:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:50f:b0:3bf:b68f:4682 with SMTP id adf61e73a8af0-3c08ec8d9f5mr5523149637.7.1783414445809;
        Tue, 07 Jul 2026 01:54:05 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm6275219c88.11.2026.07.07.01.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:54:05 -0700 (PDT)
Message-ID: <fbed6245-75dd-4975-8193-76edd4587fb5@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:23:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: iris: avoid bit depth validation for capture
 formats
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
 <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-1-33fa130bc535@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-1-33fa130bc535@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NSBTYWx0ZWRfX/XT4c8UtXN9X
 9NBCy0TJvcwNsR60M/At+Y2xla9ZCdDTs4N/OzVp2iscr4PcmQkaSMriIQnoY/fjMy9rcL8iqSW
 SxuJaxzFxuslw8KLtR0drz8+oZQw6a8=
X-Proofpoint-ORIG-GUID: yampju36sd13k651kCKpcaDKqvCh9g9j
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cbeae cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0mt3kmHqsDAWChUqZT8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NSBTYWx0ZWRfXxx65+JVeBQeU
 pDkA6smvzGG/GiKKAopxNVuz/SS21m6RzH3Pc+JITfBc9gYokrYbxw7Hc2seCvVIrsFgr8lp0cx
 sr6I7oersvt0vdK47TQMT6HMEaR9lm5T8mY2rXtmNCF1ughK9K8sfxk0wdwTiR4sl4HjO/dnsoa
 Th8y3DflRvD160qEwgP/nsYAvXuwqvT0wArbfdt/E0CrB5OVwjzXUPvc3WMfbbbo47ZdBxxPU2z
 agNl8EJScy2bNf06huLJGjHzK7mWZ7ZEPfQG03zLYZmR97kOqtGbK+U2EdHymno/lNYjIlN4GHS
 YRjdEVJeXcRlNbn0LUYTEa3+wXUNw9whtvruyvzBFaCrjiYYRrwFijUsu+nUq1H3xCbo+Od3NRl
 gYYJY96dVAoBjBUKOUMeS4dMgNHlQVUG3Q7TQWT86hgplHgr0ZwNtckFitzTZiBZHo5MWUdqP7b
 ZderX6dyULyDjHphdcA==
X-Proofpoint-GUID: yampju36sd13k651kCKpcaDKqvCh9g9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66817-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 196BF719714



On 7/7/2026 12:05 PM, Vishnu Reddy wrote:
> When validating a capture format, check_format() compares the requested
> pixel format against inst->fw_caps[BIT_DEPTH]. However, the bit depth
> capability is not available at this stage and it contains the default
> value of BIT_DEPTH_8. The actual bit depth is updated later after the
> firmware reports stream capabilities through read_input_subcr_params().
> Because of this, a valid QC10C format request is rejected during the

client request

> initial format negotiation. The driver then falls back to the default
> capture format (NV12) and stores it as capture format.
> 

No new line

> Later, when the firmware reports that the stream is 10-bit, the driver
> sees NV12 as the selected capture format and switches to the default
> 10-bit format (P010). As a result, the original QC10C format requested
> by userspace is lost and QC10C decoding cannot work correctly.
> 

No new line.

> The bit depth information is not reliable during the initial format
> setup, so it should not be used to validate capture formats. Remove
> the bit-depth checks from check_format() and only verify that the
> requested pixel format is supported. This allows the format requested
> by userspace is handled correctly.
> 
> Fixes: 20c3ef4c7cae ("media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 9e228b70420e..7f89e745a4b1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -95,16 +95,6 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   	if (i == size)
>   		return false;
>   
> -	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> -		if (iris_fmt_is_8bit(pixfmt) &&
> -		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
> -			return false;
> -
> -		if (iris_fmt_is_10bit(pixfmt) &&
> -		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> -			return false;
> -	}
> -
>   	return true;
>   }
>   
> 


