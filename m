Return-Path: <linux-media+bounces-65514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iJD3I6aMO2qTZggAu9opvQ
	(envelope-from <linux-media+bounces-65514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:52:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2346BC590
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:52:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UtAMG8LU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NjrA6g+d;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65514-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65514-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 046D330315FC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 07:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7083998A6;
	Wed, 24 Jun 2026 07:51:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A1A38D6AD
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:51:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287495; cv=none; b=s+LzHwOUoAvFxuhz45CXkVRwtCoMZA+dFg9mmavJz3hRrIoelHVkct/oALZphQu7IZTzMVxlWcksD9cYAVyG6KPoN81sLf9Ri94biLGWUOi587CmXz2w2es7N/bmoyigX904eL3fPr5SD36hUdUOSSnAmIeWkRIbAzyuu8L50iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287495; c=relaxed/simple;
	bh=2PY/fjJMsElkOcilf6A24gZwF5Tmn6HGgrHYpZ8QXJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsnjYXNtXsm2pHyLdgKft1pHxMy75wv/y2oDHexDWAlR7SFh5Rgg67GjXTOxyES7pd59G+NzM79mtQ/8XEw9DyYR/X2XY1xEZHKzc+FY/OhGUXQLJH2M9BGWUh88cqGnAgbkjWclfbxNie2Fkhhuigu0lMokso8tRqi45hY/vUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UtAMG8LU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjrA6g+d; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tqBZ1972108
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53Oq7ERiSBzuxDsqizgKHx7o8+yOZiEBcGpZU7cYEAQ=; b=UtAMG8LUPJOATG+g
	px2ZQoZPpGGMII+wMbZmUi9SLJOhGrm0al5KCao8rsqXyzY+G7uJJZCAcPiwrVlS
	tfVWAu1NghKXFWr9Js7diY2mCAccP05C/MpGh7ArFueokQX0CCtdwHygaCOLHNYB
	sxrqweI1qOD6jpRQG2XyVVUtfp6rPTYOh9XTF8GOGNw254xw+tF15p+4SeG4MJdB
	QMcCDQ3sX7fXca+fuNIVHm38N3s1FLDj28ywAXJibp+ab9DVkLmtow1r+5sWSti1
	6HYRIPHLWKFTa9xr5xgQaHwUu7iQn5ZqoNTu2EikeAdlhSDHMUiP4j0dMKdAuq2d
	IT6yPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00eva11t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:51:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91574ad681eso100889685a.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287492; x=1782892292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53Oq7ERiSBzuxDsqizgKHx7o8+yOZiEBcGpZU7cYEAQ=;
        b=NjrA6g+dIq0MU07Kpa0buZuR2X0V4KjRvR88SFKNhJoCXg2j/kdGoM932CW1O0qoPT
         Wuc6dFIRqvwvnq71pp3av0Rxoov87WKWYiw1janxZUagp2l0HzWuz4+Vzx5IHAAlI2au
         N/mgZ5DhIFfa6B2NxaGaDmkl8J+gEQbU0hPGMYbHDInjEgIheZqu+aDfp9NgARNw9zmc
         U/fMfUro9Mts1qGoa01HVUM9Zm89hbAHjP23cis653prh7EHDmIxhl1Inm+amjCcHmBX
         OFUKLdC9EGxVgqBAcJvoYkIPDTSNcE+j8toqdXsBgjUpN99ZR8qiJ9K7XkpyFw8AzYK6
         p/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287492; x=1782892292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53Oq7ERiSBzuxDsqizgKHx7o8+yOZiEBcGpZU7cYEAQ=;
        b=l17cBUYolSnifB6oh9IMzJGsJlemqQS/4/sdwW+dnhPe6lbV/TyT/wBUUHkFlrO0yw
         8vpjzLLF5qs6SS6lmr33mfNzwSd+yOfXJ5CPQhNR45HsLu0WS6V6V6uwWSmMvNaGe9Eq
         q2I/HZpajmbvEUpaxjrz4gMjQn7wwpOmGZyQdXRgGRECyLFilEN71C43uhgjk4TaGagR
         gReNGZPuLHFOoW9JD7J8P2gmZ+1MovPDKBbXJ86C1opQaO5+SFZ7JE8OARPDZDDhfODK
         lGGRZ6IRTnj7SQN7pOMfk9r8f8+saOJ+m9vy7V4wGbYj+wjsP7l0u1ScV7cqy6zbPJiP
         w+Gw==
X-Gm-Message-State: AOJu0Yy4DNLgTxGMLdZ64txJVzHAqN8ezVF06P62MMr2o3mHdLXgDZbt
	dwMP2nOPyY5U6Jh6xNwOJMVx2s5FaMtQKj2vMRYqUksECxACb1H7TLwJlGyKZfmhyVihhdfqIRu
	a/e3BDDYu2qbR9z+w+79/JqpHzZp4rmcjmo1s3EIEmLiK4iFVbqciW7KjRLxtGA0nLg==
X-Gm-Gg: AfdE7ckpKvZhS1QYtm932Ayby6etfaR/ETwHVtJAgey6DHVwHhJ9qtOqZOaphXsSdfo
	QtcX1EoC6rchp2+OnzGNVtpLZ8Qe1w7JL7bRI4ze+T5ntn0A2rApkKKQepovo9B3i2bIvol6pPy
	RvHu4tMAxhxJSa3eUCWHHgM4YZas6wOD+EIWc17PZdjSYwcJIU07ViuloBciiRFWcYwPRcFFXRB
	/mYtC4Co3SoggxvfW0o0AbBv4E1zx0lV+7DdTfjak11p8l9Pf/VXym3iw03WbIxn1jlueiS86ht
	GCG0Ojif461fe5vGPPg3SdjL/xTqbHAUM5ymezpmunRroNYg5oZYU3avDCbXZQZmK2d4CSjQjx/
	MUb7rLnKs9CLpu8DOM/8rKX6ckC1hM11JBs4MCAEqdybIkw==
X-Received: by 2002:a05:620a:8807:b0:91c:6dba:3d66 with SMTP id af79cd13be357-92781c063f9mr358922185a.16.1782287492048;
        Wed, 24 Jun 2026 00:51:32 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:91c:6dba:3d66 with SMTP id af79cd13be357-92781c063f9mr358919485a.16.1782287491547;
        Wed, 24 Jun 2026 00:51:31 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm616235166b.36.2026.06.24.00.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:51:29 -0700 (PDT)
Message-ID: <c376b499-1cc9-49c0-aa72-c2eb2fbf52d5@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:21:20 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] media: iris: add minimal GET_PROPERTY
 implementation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-10-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-10-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfX/KxuZ9hanVuS
 sRfEb7s1m0Ymlok0ZGt255Up7WJIBpwujB95rxS6rwYDUeorRiEb3asf1Qp82wP0FWH/7EOi/3Z
 530xKv7jM1GEOAk2hhIJ9UWZunH/CHafVxnP0UlykOHAjoC4ezy4WC3j3hQVsojjXqSKXliVMFk
 FzIxYl8+9T5EqQdoCvujiigBD3O42jwVBbGR9Au9oRPy79qDtBhHGZWPR9zIVisA96XggCZWtNT
 ZRPfZzj/3XuJ6+LYKg1xwKpmJrLTmfsiaShZ3StP/jJ+EkHJ+jglQlpqsG8tnYcVmusWXVMIGTh
 /uuUyR8Ps7K8ZOJO3O1XygAOHhpTQ3zsD2Rh9IB7lVp7wpPYC2DEe8dnv5aQtjRvJv7kwA+3QE7
 whzFaBi+Utc4Fp1Hfb0vmI0Kui5zQShw5L8Y1aTZobfvbLlj0HlUfAJ9IFPTGSHZOyv07rT8PGk
 1r7iQh+seDLe28XFmsg==
X-Proofpoint-ORIG-GUID: RvHnYd_NTPYiG3YPIs7qVdlKdcr8gTDp
X-Proofpoint-GUID: RvHnYd_NTPYiG3YPIs7qVdlKdcr8gTDp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2MyBTYWx0ZWRfX3ZWt8fkLdua4
 qgFl7H+EvpR25beP42YeSR5ycdtGR/JB+bt8pZ9Kq466H/VyolHLIuQAzlpkREVRO4drNRO+uiL
 yUWvypnABjLsOUOSYHeV2kHXnuUjXg8=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3b8c84 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=9U17wRWtyhLDe7ZN7ogbJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6_ngj5waxJiJTN2e3xMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65514-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,pkt.data:url,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB2346BC590


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> AR50Lt with the Gen1 firmware requires host to read
> HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
> update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
> command. Implement minimal support for querying the properties from the
> firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
>   .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
>   4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index a27447eb2519..16099f9a25b6 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
>   	int (*session_set_property)(struct iris_inst *inst,
>   				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
>   				    void *payload, u32 payload_size);
> +	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
>   	int (*session_open)(struct iris_inst *inst);
>   	int (*session_start)(struct iris_inst *inst, u32 plane);
>   	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 7674b47ad6c4..99e82e5510ab 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
>   	return 0;
>   }
>   
> +static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
> +{
> +	struct hfi_session_get_property_pkt pkt;
> +	int ret;
> +
> +	pkt.shdr.hdr.size = sizeof(pkt);
> +	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
> +	pkt.shdr.session_id = inst->session_id;
> +	pkt.num_properties = 1;
> +	pkt.data = packet_type;
> +
> +	reinit_completion(&inst->completion);
> +
> +	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
> +	if (ret)
> +		return ret;
> +
> +	return iris_wait_for_session_response(inst, false);
> +}
> +
>   static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
>   	.session_open = iris_hfi_gen1_session_open,
>   	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
>   	.session_set_property = iris_hfi_gen1_session_set_property,
> +	.session_get_property = iris_hfi_gen1_session_get_property,

was looking for caller for this property, saw that in patch#12 to update 
the size. Commit should have mentioned about it.

>   	.session_start = iris_hfi_gen1_session_start,
>   	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
>   	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 0e4dee192384..bb495a1d2623 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -35,6 +35,7 @@
>   #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
>   #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
>   #define HFI_CMD_SESSION_FLUSH				0x211008
> +#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
>   #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
>   #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
>   #define HFI_CMD_SESSION_CONTINUE			0x21100d
> @@ -113,6 +114,7 @@
>   #define HFI_MSG_SESSION_FLUSH				0x221006
>   #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
>   #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
> +#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
>   #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
>   #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
>   
> @@ -205,6 +207,12 @@ struct hfi_session_set_property_pkt {
>   	u32 data[];
>   };
>   
> +struct hfi_session_get_property_pkt {
> +	struct hfi_session_hdr_pkt shdr;
> +	u32 num_properties;
> +	u32 data;
> +};
> +
>   struct hfi_sys_pc_prep_pkt {
>   	struct hfi_pkt_hdr hdr;
>   };
> @@ -574,6 +582,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
>   	u32 data[];
>   };
>   
> +struct hfi_msg_session_property_info_pkt {
> +	struct hfi_session_hdr_pkt shdr;
> +	u32 num_properties;
> +	u32 property;
> +	u8 data[];
> +};
> +
>   struct hfi_msg_session_release_buffers_done_pkt {
>   	struct hfi_msg_session_hdr_pkt shdr;
>   	u32 num_buffers;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index bfd7495bf44f..23fc7194b1e3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
>   	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
>   	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
>   	},
> +	{
> +	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
> +	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
> +	},
>   };
>   
>   static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
> @@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>   			iris_hfi_gen1_session_etb_done(inst, hdr);
>   		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
>   			iris_hfi_gen1_session_ftb_done(inst, hdr);
> +		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
> +			complete(&inst->completion);
>   		} else {
>   			struct hfi_msg_session_hdr_pkt *shdr;
>   
> 

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


