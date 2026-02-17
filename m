Return-Path: <linux-media+bounces-52976-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJvYMDVqlGlFDgIAu9opvQ
	(envelope-from <linux-media+bounces-52976-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 14:16:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD814C7CA
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 14:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CB2B3051458
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D974936215C;
	Tue, 17 Feb 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lb0bsrf8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2tLWr/5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C9636213F
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334133; cv=none; b=sKi6nJqBSYyWm+LJDde9jHeLP3OzscZQgM51Wu2qQY0DACTUWUiJiEUm51PtJX7lBmogK8oQH1KYPTaBsAP1anTAmMXLmw/PJ26ohoes/Ni6yc1HpQTLyj6y1k0DBnH0szcCjWxul9RKZigY8Gp4uhcT/8uQaZI4CO9U3TItPYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334133; c=relaxed/simple;
	bh=bykETRd58Dgk1h8sjkjLrRt+Ejl+t02vqtwhc6NEw2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Slo4pQrsYXevvXHGUwhqcJx9d+/G5XsGX8+mejqivf7GXsArERjm63lWk9bWRif2h8KBvAh28Qvd/Wwazg/OetovU9tDLFZxeIFV5U9WgJChqVYzvETtgvNU7KwIgFkE9YVJfiSr/qBZFel73+cFyue3fenz/s1a7OrkDrbvJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lb0bsrf8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2tLWr/5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB4EAP1944069
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDJXIOFVhcsv24XAXUhX4av9F5wMERJmoHTDSIHUUv0=; b=lb0bsrf80ot+EW9J
	AVQkcMyfQolDxZx+BEZeXoQ5CEnPD9rva4zulcKyPNDvGyTuMmNkr9tW3M+Tc8Yz
	s/wygVjk/vFou0M4aqr9iklS39rKevj9NKTk1t+FcHCaxpUB+5ZrisM6gIYkU8Ij
	cBtGu6oKlZiIEObRVVV8JPlGccCcbCyzmI7rhfgd6cX0483kX7wUVUzWA6c/uYxk
	7lC1ioCtBnr5e8wF5rY7EW/JQSYn6CGIq0foeNJS4GKrQglyZ4gaTjLH3N+tnJwp
	Zwe8wQk8MXQZYqgsqZzzPh9vXM8rz21Vedujw3F8Vlxy1bgbh2S+PfNKQ7Dx8HuG
	5pRf3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g0dv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 13:15:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aad3f8367bso49645965ad.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 05:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771334129; x=1771938929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cDJXIOFVhcsv24XAXUhX4av9F5wMERJmoHTDSIHUUv0=;
        b=d2tLWr/5/Al2RsBAfZsGhAYOcjsaAI/8qRYtFTnhxD0BuV1fVBidQywlpkCPrys3p7
         sKQ0451yUbCOWl6QoLSkNmFog3pRUUdC3HV+H32maV8JoGRDt6PGEPNx0vP+WDqQz0W8
         qLNyoUijbWa9O5TlQxnXzoTI91QDCPeZi3q9ve+jtK6/DfceQ82JV/ZXBtKLze7OTlpD
         f0MM5rSVRDBPY5s9GvfInLfCHXPbggmJE0Mbo9on6X7Tkn2hcwhsQez7FjWzEqrHWpnd
         VH+Z5OFMKGVMwkVgxSbFeS40amVYikvdzJLeTf1kntc3//V3wIh3uTKzON+hdGG9a5qd
         dObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771334129; x=1771938929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDJXIOFVhcsv24XAXUhX4av9F5wMERJmoHTDSIHUUv0=;
        b=PN/kIFeSn3CxafwNxMz+S1ievIYPkAlZOus4hHdDlHEdsnHn5ICSsY3RI0YmbvypGH
         G7Y6ryzCcbc+K3IQRHDt23P5JIgxIf8M397TVrXMFCW9yyTJFv5GB/Bu1FHLo7eZkqOf
         /7nxcPXAX+P16Ld27yKb3k9wMC1GchEI3hSom30F9DNnF5bzOyPQUEWsYntoUM7t6XoI
         gKJ+37oGUibxgBZS1kaQTsFbPLYoNVuhQ3XTUib41O1o6krwbRkxYf++AeNjLzjPn/BD
         1VUcOgK65dY/hYCyoD8ipn/+9C6L8ZKrADVuldRYTuZdmdw2ZoniLmAIkQIau86QQbJK
         pz0g==
X-Forwarded-Encrypted: i=1; AJvYcCVCGUNSIGW84i5fI1saR1I9oTvC+rLB5BiGH1Ov/WA7pGQPQKOCj9Nw0zw/IFM9Jkped8dxSE8xm+s/kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfjiGXM/racfiKIosWPallnsT39gGYrpMtqVS86XDMTh79LXt
	FoQgugOPZKcvv515jVrol08UQqjD8MLB293sE5DWmOzhEQ7l9HAQXQhaykOmnyit4i4ZMOLR2+u
	UhsImWxmaZil8hC5t7DIOrmgU2jf5I2NEK+C22Sn+qvWxcTHNtkNzlkPZCtvMyg5fmQ==
X-Gm-Gg: AZuq6aI2Wf5RNZU/LNLg5hbfBf4RX0+gy1UZSkhoSimobaZjwrEB9ZDI7sUtJAYB0xc
	xoD5lENnVjdG7Tq6MSBQkaUlTzhBroNT9xxFdOal8vaRIDLvDJ+SlDph8CDnH5jVtz6pG0r7rLl
	GLhzEXnUWL+GHaQt4oQiGHpn6aGcEWy0+PZ0Uw7dy9EY1hGiasZEO37oyaFMb5stAFJ1GURlkey
	HFgPKXAUc8Lp/9e73QH0yjsYDEHQKbhbuobE3dSmcuocTgrrXK19bYBz1xLPDNXmaLncMf4hUH7
	Z9Luj5wefbfYqqCAxUHt8lYHdLdMalko1adKGvrbC8tgM3QY44h7amwFfbS/YTW75Oh3Y3A3MWI
	EkCdseoY5bCpE8UBcSBpSVxRnON6jnHMTd2hyhgd9huhDh1rOaBwuNQ==
X-Received: by 2002:a17:903:b43:b0:2aa:f469:fa23 with SMTP id d9443c01a7336-2ad17432168mr95805785ad.4.1771334128718;
        Tue, 17 Feb 2026 05:15:28 -0800 (PST)
X-Received: by 2002:a17:903:b43:b0:2aa:f469:fa23 with SMTP id d9443c01a7336-2ad17432168mr95805145ad.4.1771334127877;
        Tue, 17 Feb 2026 05:15:27 -0800 (PST)
Received: from [10.204.100.45] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aaeab38sm99970525ad.82.2026.02.17.05.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:15:27 -0800 (PST)
Message-ID: <aae75a6b-35d6-47ac-9852-d95b42849f2d@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 18:45:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: iris: add context bank devices using iommu-map
To: Robin Murphy <robin.murphy@arm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-5-e2646246bfc1@oss.qualcomm.com>
 <02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNyBTYWx0ZWRfX0zowcKQlivey
 pzRaNxOmza8vVYBoG7Il0Ou1UZUNnlDvAs/Xf685FOJ0xlth3dk+uNYp/mk5KxafojoaU7isghT
 GBzLY1h2Z0BC3cW5FAB79RwVOM8ARLXRnF9Tm0HnvBuYCoWnbp+cCegOkyGAImr278n6Ff8KL14
 8zq4V9mK2bktaOmzPcrPobFXg2LkmYD0XP+Oo+mKszHTE6iz633OLe8TZ0mDG9V0RwS3W/1U2mR
 r+ea/QFzfk+CP9I/BM5RQu5MiU1PKGZNQYcYpZ0p4k9xsDKXoswa9ZgnBOeogieCnvfkjwZZBd6
 tpH6uLZXSt5+dCZ26zTp5xNuOjYpXiXaWZZ6/XdIPJJhCkf/+9rHVpOsC+tzrebDaE9hJJ6WR8v
 BlXXozts3ky4i78N/CyG6GclcxjEfxm/BUDVE3pK5ajka7hGMWrCW78iVpcY17Wb5L28j8h2dqV
 77SAEgdEdas3hBpE+XA==
X-Proofpoint-ORIG-GUID: zswWt8JIFQZAWuFdRWailqCYg129HFtM
X-Proofpoint-GUID: zswWt8JIFQZAWuFdRWailqCYg129HFtM
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=699469f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=8ZOrhM5FIgLh972jGGIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52976-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29AD814C7CA
X-Rspamd-Action: no action


On 1/27/2026 8:19 PM, Robin Murphy wrote:
> On 2026-01-26 12:25 pm, Vikash Garodia wrote:
>> Introduce different context banks(CB) and the associated buffer region.
>> Different stream IDs from VPU would be associated to one of these CB.
>> The patch ensures to handle CBs which are described as iommu-map in DT.
>> Multiple CBs are needed to increase the IOVA for the video usecases like
>> higher concurrent sessions.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      | 29 ++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      | 55 ++++++++++++ 
>> ++++++++--
>>   drivers/media/platform/qcom/iris/iris_resources.c  | 35 ++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_resources.h  |  1 +
>>   4 files changed, 116 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 
>> 5a489917580eb10022fdcb52f7321a915e8b239d..d2d7c898fc8ef0de1b16aebd72681ea3c5b736ae 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -204,6 +204,33 @@ struct icc_vote_data {
>>       u32 fps;
>>   };
>> +enum iris_iommu_map_function_id {
>> +    IRIS_CB_NON_SECURE_NON_PIXEL    = 0x100,
>> +    IRIS_CB_NON_SECURE_PIXEL    = 0x101,
>> +    IRIS_CB_NON_SECURE_BITSTREAM    = 0x102,
>> +    IRIS_CB_SECURE_NON_PIXEL    = 0x200,
>> +    IRIS_CB_SECURE_PIXEL        = 0x201,
>> +    IRIS_CB_SECURE_BITSTREAM    = 0x202,
>> +    IRIS_CB_FIRMWARE        = 0x300,
>> +};
>> +
>> +enum iris_buffer_region {
>> +    IRIS_NON_SECURE_NON_PIXEL    = BIT(0),
>> +    IRIS_NON_SECURE_PIXEL        = BIT(1),
>> +    IRIS_NON_SECURE_BITSTREAM    = BIT(2),
>> +    IRIS_SECURE_NON_PIXEL        = BIT(3),
>> +    IRIS_SECURE_PIXEL        = BIT(4),
>> +    IRIS_SECURE_BITSTREAM        = BIT(5),
>> +};
>> +
>> +struct iris_context_bank {
>> +    struct device *dev;
>> +    const char *name;
>> +    const enum iris_iommu_map_function_id f_id;
>> +    const enum iris_buffer_region region;
>> +    const u64 dma_mask;
>> +};
>> +
>>   enum platform_pm_domain_type {
>>       IRIS_CTRL_POWER_DOMAIN,
>>       IRIS_HW_POWER_DOMAIN,
>> @@ -246,6 +273,8 @@ struct iris_platform_data {
>>       u32 inst_fw_caps_enc_size;
>>       const struct tz_cp_config *tz_cp_config_data;
>>       u32 tz_cp_config_data_size;
>> +    struct iris_context_bank *cb_data;
>> +    u32 cb_data_size;
>>       u32 core_arch;
>>       u32 hw_response_timeout;
>>       struct ubwc_config_data *ubwc_config;
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/ 
>> media/platform/qcom/iris/iris_probe.c
>> index 
>> ddaacda523ecb9990af0dd0640196223fbcc2cab..c1a6aac5a3d65d980c5a34ba5fa1c1dbcf790ec5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -123,6 +123,37 @@ static int iris_init_resets(struct iris_core *core)
>>                        core->iris_platform_data- 
>> >controller_rst_tbl_size);
>>   }
>> +static int iris_init_context_bank_devices(struct iris_core *core)
>> +{
>> +    struct iris_context_bank *cb;
>> +    const __be32 *map_data;
>> +    int tupple_size = 5;
>> +    int i, j, ret, len;
>> +    u32 fid;
>> +
>> +    map_data = of_get_property(core->dev->of_node, "iommu-map", &len);
> 
> If despite proposing all this hackery in the common OF code you're then 
> _still_ going to open-code your own parsing of the property, with hard- 
> coded assumptions to boot, then clearly this is not the appropriate 
> approach at all...

Ack. Driver should not be doing the parsing which OF code is already 
doing it.

> 
>> +    if (!map_data)
>> +        return 0;
>> +
>> +    len /= sizeof(__be32);
>> +
>> +    for (i = 0; i < len; i += tupple_size) {
>> +        fid = be32_to_cpu(map_data[i]);
>> +
>> +        for (j = 0; j < core->iris_platform_data->cb_data_size; j++) {
>> +            cb = &core->iris_platform_data->cb_data[j];
>> +
>> +            if (fid == cb->f_id && !cb->dev) {
>> +                ret = iris_create_child_device_and_map(core, cb);
>> +                if (ret)
>> +                    return ret;
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int iris_init_resources(struct iris_core *core)
>>   {
>>       int ret;
>> @@ -139,7 +170,11 @@ static int iris_init_resources(struct iris_core 
>> *core)
>>       if (ret)
>>           return ret;
>> -    return iris_init_resets(core);
>> +    ret = iris_init_resets(core);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return iris_init_context_bank_devices(core);
>>   }
>>   static int iris_register_video_device(struct iris_core *core, enum 
>> domain_type type)
>> @@ -187,6 +222,8 @@ static int iris_register_video_device(struct 
>> iris_core *core, enum domain_type t
>>   static void iris_remove(struct platform_device *pdev)
>>   {
>>       struct iris_core *core;
>> +    struct device *dev;
>> +    int i;
>>       core = platform_get_drvdata(pdev);
>>       if (!core)
>> @@ -194,6 +231,14 @@ static void iris_remove(struct platform_device 
>> *pdev)
>>       iris_core_deinit(core);
>> +    for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
>> +        dev = core->iris_platform_data->cb_data[i].dev;
>> +        if (dev) {
>> +            platform_device_unregister(to_platform_device(dev));
>> +            core->iris_platform_data->cb_data[i].dev = NULL;
>> +        }
>> +    }
>> +
>>       video_unregister_device(core->vdev_dec);
>>       video_unregister_device(core->vdev_enc);
>> @@ -277,9 +322,11 @@ static int iris_probe(struct platform_device *pdev)
>>       dma_mask = core->iris_platform_data->dma_mask;
>> -    ret = dma_set_mask_and_coherent(dev, dma_mask);
>> -    if (ret)
>> -        goto err_vdev_unreg_enc;
>> +    if (device_iommu_mapped(core->dev)) {
>> +        ret = dma_set_mask_and_coherent(core->dev, dma_mask);
> 
> Huh? Why would this be conditional? If it's a DMA device then it's a DMA 
> device, regardless of whether an IOMMU driver happens to be present or not.

To support existing SOC which are described by iommus, and not yet 
migrated to iommu-map.

> 
>> +        if (ret)
>> +            goto err_vdev_unreg_enc;
>> +    }
>>       dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>>       dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/ 
>> drivers/media/platform/qcom/iris/iris_resources.c
>> index 
>> 773f6548370a257b8ae7332242544266cbbd61a9..647f6760f2b7a6bab8a585a13eb03cf60a9c047e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/clk.h>
>>   #include <linux/devfreq.h>
>>   #include <linux/interconnect.h>
>> +#include <linux/of_device.h>
>>   #include <linux/pm_domain.h>
>>   #include <linux/pm_opp.h>
>>   #include <linux/pm_runtime.h>
>> @@ -141,3 +142,37 @@ int iris_disable_unprepare_clock(struct iris_core 
>> *core, enum platform_clk_type
>>       return 0;
>>   }
>> +
>> +int iris_create_child_device_and_map(struct iris_core *core, struct 
>> iris_context_bank *cb)
>> +{
>> +    struct platform_device *pdev;
>> +    int ret;
>> +
>> +    pdev = platform_device_alloc(cb->name, 0);
>> +    if (!pdev)
>> +        return -ENOMEM;
>> +
>> +    ret = platform_device_add(pdev);
>> +    if (ret) {
>> +        platform_device_put(pdev);
>> +        return ret;
>> +    }
>> +
>> +    ret = of_dma_configure_id(&pdev->dev, core->dev->of_node, true,
>> +                  (const u32 *)&cb->f_id);
> 
> No. As I already said before, of_dma_configure() is for bus drivers; if 
> you want to act like a bus, implement a proper bus_type with 
> a .dma_configure callback. If you don't want to do that then describe 
> the individual functional blocks of the codec appropriately as distinct 
> devices with distinct hardware properties so the platform bus code can 
> handle them correctly. It is not reasonable to advertise physical 
> hardware to Linux as a single monolithic device, but then have a driver 
> try to pull a "well actually..." by abusing all the internal 
> abstractions. The fact that you might happen to avoid the warning from 
> iommu_probe_device() because you're not binding drivers to these fake 
> platform devices doesn't make this design any less wrong.

Ack. Agree to define a proper bus_type to handle the .dma_configure 
callback. Will update this in v2.

Regards,
Vikash
> 
> Thanks,
> Robin.
> 
>> +    if (ret)
>> +        goto error_unregister;
>> +
>> +    ret = dma_set_mask_and_coherent(&pdev->dev, cb->dma_mask);
>> +    if (ret)
>> +        goto error_unregister;
>> +
>> +    cb->dev = &pdev->dev;
>> +
>> +    return 0;
>> +
>> +error_unregister:
>> +    platform_device_unregister(to_platform_device(&pdev->dev));
>> +
>> +    return ret;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/ 
>> drivers/media/platform/qcom/iris/iris_resources.h
>> index 
>> 6bfbd2dc6db095ec05e53c894e048285f82446c6..b7efe15facb203eea9ae13d5f0abdcc2ea718b4d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>   int iris_disable_unprepare_clock(struct iris_core *core, enum 
>> platform_clk_type clk_type);
>>   int iris_prepare_enable_clock(struct iris_core *core, enum 
>> platform_clk_type clk_type);
>> +int iris_create_child_device_and_map(struct iris_core *core, struct 
>> iris_context_bank *cb);
>>   #endif
>>
> 


