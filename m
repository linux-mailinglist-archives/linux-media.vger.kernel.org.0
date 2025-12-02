Return-Path: <linux-media+bounces-48009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 299A6C9A582
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 07:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 989C03448CC
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 06:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAE12FF176;
	Tue,  2 Dec 2025 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyDzfPP+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfrxft6P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CAD21D3CC
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657540; cv=none; b=uVLKhxb+ja7WDRJy6tx6o69YVV/611CuF85qVld/Ndx+bf3pxkD1YoR0LVuJcoX4/zeqLjxMwkQdrKrfcOToSqdOu261gsT0zjJZmUI1But2fWGCtcyaD1Ad2XsCWzTCV0pjEby8iyOEvVxmVhFPzhf9sHR684ZbopERisM8e3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657540; c=relaxed/simple;
	bh=peV8KREfrq72FJVaLI9eXBd7GU8p85ylOrYnUxG6CY8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dsxMGK2RZAKk315inTj34rY2annS8ZNLIequDa1ZCWz1kpU1a0Lt6a/u98/NFjZ+Gt9gdLOQxPCxRewAssy/s7UqyIEXN1UWxAg36DHZQDBum2O5y59C8HBq1w8YqRDK5+1djIkU3cNMCzGh84xk6JX4eHfAisWKAOPOvq/Re5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyDzfPP+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfrxft6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B217oiL1359070
	for <linux-media@vger.kernel.org>; Tue, 2 Dec 2025 06:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xOGkjazpPLr5YDsE/3FIK+YZUMoPZX0gdyBtrcJXV7E=; b=WyDzfPP+ARsnovsd
	xqo3snTZL+66Gipgdsz4G0C9QtKURZGhvtK/LC6EUqUryEjz1Mt0KQeqt3a0UFzF
	6uZTaUQf3eJiVup8LcM1XgBjhnCJOGvImCZKk8FEbnl32jirtrcQuRxymmVxNAk+
	R0yAL4lvARMEt65MXHsiPmQnMlZfykwD9rBd6fpBfiPejQLFYB4cJDBy/q6fBkfy
	SlEGZ9RFX7nlzLRJ2GeYYlLKmOLKP7c8cN9QOr0W23wu4/s/FI4tr1yLC8Oo6IOC
	da4a0ebPcTAe+gd6rxHm/eYbofx6A5bfeYUGJo0vwYi6F4qCM+LCv494sZEYTdoE
	1zHbBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asp63gt5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 06:38:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34188ba5990so12608724a91.0
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 22:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657537; x=1765262337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xOGkjazpPLr5YDsE/3FIK+YZUMoPZX0gdyBtrcJXV7E=;
        b=gfrxft6PrOMfItyuatXbl07+avh88Xp8yvqbVBONHZwCpklolv4tJLHK+5VY5EWozq
         ttytFOBC9aYvfNzr/O/PlfSGOdqt38MWDjO+Ek61KRYSMZQ1pB84CPFYWQoGcGqMij1E
         WdT3Btk3ehLGycZOjdp39hYyjTxTy5UucZc/9ciwABnOUyuNobvzoQZ/oisfw8FnTA+P
         MPqxdsH8KWKG7U1h6CvOiiboHMOvzIsHEVBp0YiK0nJdbR76ma/PBoUJe5OrBcnxARW9
         sV5pJEDz0BvQl8geTWgnDX09OYJ4PsQX0lpbJbkNgwrBNcqDiSZee9hW04nvKuQquBKP
         aYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657537; x=1765262337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOGkjazpPLr5YDsE/3FIK+YZUMoPZX0gdyBtrcJXV7E=;
        b=Yg96fItrwfmVaMk6OrL9eGPauSsOxN8izpXTGNzZzZ4KWVg52zaKKjEcb184WTiv/4
         qFiZ/8e8o97dSrxZ5F/btyZhLLVNjIOwma/0sGvnWr4wwsgeEmUTAZ6g0W8QB+NiHd1D
         t5wFzpsuu+S4oViO+ebRrZalnj0syGHAxLCfFwb4hKMObctdNxKw+vMwEJFAufkllFwx
         JjJViP3WPLivQdBg1TK7Db53GySe2cfVrFtQySOPDs9JLA3fzd+TVlQaa9Pqpm8iwlJQ
         R11t8SL2i6ECqS7qHzUw3/75soXMX0Ykp/hBfv6IVLgYkoKG9BT2cvoknPLhID8NrqEi
         Ng5A==
X-Forwarded-Encrypted: i=1; AJvYcCX+IB2TbH0ln1d+ZFgrUMGODQt/lVn62aPXhIGpdIDRwTV8QxoUI+hU5xhrU5N/TxO9YRWd8Igy59d76g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylppk7m0MfAoxCHKVS/BrjqgkfhXrbBou6DCvRYcchoRBu4Pcu
	LPFzltCkUAb+W0xrOkkfszZxA1l/af/vhG+I/JuIViK1koP1FNqbRW96G69NqRQDFeKseRqzRMr
	At0vatO9bLEwjIv4R4Gt2B32ZQQue9Xl5Igrh/9vIJGLms0DWdysjzPhK2JArC9JYQw==
X-Gm-Gg: ASbGncsw9UYIisT/6nofU+mk7/ZVf4Qun6FWg5NHCEs9FCNNMU7FZsDFcBGAVGG86jx
	lGrNvP2qz5Tn/raERskYbOHl8LjFIvxkeqMc9B/P0SW3aqXyxK3sh8g7MEB8A+eJc3k4wA5stNR
	ksV3iMwLeREvsQuR5Qn2sktBhGu1HbE9nlu5gIp2xtrpQN8azmtpp4JjoFbHN2scAWVSIhxkSDk
	zP0uPKYdKwm2ADJ5Eh4Pix01Yeo0872vU0l3DWOXZAFlKnxmrm1IhgEqspK6MeIgSZEEq8C7US9
	J+i7m3+ohuOWGCZSh898/cgbs5NbaUR2D7rEntWAXWeKnboowTEUfcp0dLthkVAyUSZ05S3ve8y
	M8XZYiVWkIm8azhFWjhJX+03LzP6WSklhcZIBNgEjdF7RW+mVDXA0KhlTt+lKnopXCmIhYMcBM7
	BodCk=
X-Received: by 2002:a17:90b:4c8f:b0:341:133:e13d with SMTP id 98e67ed59e1d1-3475ebd2d92mr31264047a91.5.1764657537582;
        Mon, 01 Dec 2025 22:38:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6ktYlRR9nG5ZUi0nAS6rXl4dEj9u5a4Ln1FMdZZzAfPBEqFlbadYLW79kLok9/9OoeY/CYQ==
X-Received: by 2002:a17:90b:4c8f:b0:341:133:e13d with SMTP id 98e67ed59e1d1-3475ebd2d92mr31264024a91.5.1764657536960;
        Mon, 01 Dec 2025 22:38:56 -0800 (PST)
Received: from [10.249.18.58] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b74b328sm15150023a91.13.2025.12.01.22.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 22:38:56 -0800 (PST)
Message-ID: <40785b92-e947-4c02-a5e3-94e0dd97423b@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 14:38:52 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, quic_qiweil@quicinc.com,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: qcom: iris: Add Long-Term Reference support
 for encoder
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
 <Lm-sduib7iCBaaUii-g8s2lQybZpjV4n2nWi9p68zk9gRImpIof2Z2zkV1pYMifyLlQmN4CqnFpbHpz8K-bffw==@protonmail.internalid>
 <20251127-batch2_iris_encoder_enhancements-v1-2-5ea78e2de2ae@oss.qualcomm.com>
 <26c1e2ac-6568-4d04-93f8-a8f1e49d156a@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <26c1e2ac-6568-4d04-93f8-a8f1e49d156a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Dv0_3l6rxVa1wkgpbIcoDKbU6OtZDcNm
X-Proofpoint-ORIG-GUID: Dv0_3l6rxVa1wkgpbIcoDKbU6OtZDcNm
X-Authority-Analysis: v=2.4 cv=XM49iAhE c=1 sm=1 tr=0 ts=692e8982 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EilkzCsaa4XF8CN22ykA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfX9M04W3+1dW9T
 YDCWx+JRHjheKAKjX8r0Aw4cBea5nPhltjrl4RJRtAs3WcQx1SE4VWfiVXhbvnUDZjqbjEjdxI8
 jh0C8tvkb+uBKj8MJyu6kikTr5gPaW7EXkVyd/ZATzB8Qrkt/2PAaBCib7wCwTBz7yDhGcEElI+
 U0uk/XA+kB4Qd6pNr+VV6shuODUD8Rq8Skwcb7isEdRHpL+rLJ52oyw9E0rHfGabGZkALPxB51U
 shPEUPsL1qCUs7rqWO1xAUjnZL0v7q7Kt4mhI8wPv9KCdMajw0x0tiBlgNAWOJzEE2isvFcIjbp
 J+qiA/FEsWt7sewkUolgCeristy3ofZHMLYhsX8xeZWnph3qUQLAHBVPAS3DKi/Re8eoBv8bZNp
 KVWJs3USNUop4OCptX/bqEHb6KZDPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020051



On 2025/11/27 18:41, Bryan O'Donoghue wrote:
>> @@ -693,6 +693,31 @@ iris_hfi_gen1_packet_session_set_property(struct 
>> hfi_session_set_property_pkt *p
>>           packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
>>           break;
>>       }
>> +    case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
>> +        struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
>> +
>> +        ltr_mode->mode = in->mode;
>> +        ltr_mode->count = in->count;
>> +        ltr_mode->trust_mode = in->trust_mode;
>> +        packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
> 
> This looks like an unconditional pattern in this code
> 
> packet->shdr.hdr.size += sizeof(u32) for each one of the switch cases.
> 
> Could you at least add a patch to the end of this series to tidy this up 
> - either always incrmenting by sizeof(u32) before the swich - or making 
> a macro or static inline that packs the header appropriately.
> 
> Also what is the sizeof(u32) representative of ? "Some field in the 
> header" - get that but right now its just a literal unnamed dword.
> 

A patch will be added in v2 to optimize the code structure here.
-- 
Best Regards,
Wangao


