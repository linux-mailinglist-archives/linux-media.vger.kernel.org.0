Return-Path: <linux-media+bounces-65515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cWcvHEmQO2obZwgAu9opvQ
	(envelope-from <linux-media+bounces-65515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:07:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C84D66BC6B8
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 10:07:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mzxr6tyI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fRrlnvtW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65515-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65515-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF1E0301BCCC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 08:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94913A6F1B;
	Wed, 24 Jun 2026 08:07:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BF71ADC97
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:07:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288447; cv=none; b=UMi5ctaoNUwzQLnDgpPjovj71rVwxiNiofcryOIaXNaYm6Z1i+qhlCXW+lloDhYFPWO21CokD62emEnLaMH5kbCyFj08PTOpE9go6WzerkqVrOZwiIoodPeD0565W8IhyZwB70bGIDOHRKB8OVU/P0OFlpudodRPJKV++nBzwmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288447; c=relaxed/simple;
	bh=PnD90Rj22MBwRbRUAu3UlZZ9ydO1vRNXFYqA0O2T3kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOpbBeWxR5NUe9QPZkdpAje7QPk8xe20FFwTUqb9MGx/RGea1OhqjN8Hm9iyr6lIA84Y1QAqWiZhWAECwBNIfix1AYNqDKUfJRgxZ0rnwyFU8TVrMj8oCyK8GBp0mX5kIZYfgh3ooacUH/rnS3oG3MYFwoNCIoAynbtFog7Zd4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mzxr6tyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRrlnvtW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uCvb2555731
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FzVY8788rMGJlMr4B4yxqA305gNDuOqkYty6vubBhc=; b=Mzxr6tyI+nm9jMdS
	3SlZD3nLXPb775ui0RTNe80TcJJdy+gu4KmQ2g6Sq4CECQa2awmDbBvZjyHynqNB
	qCZy2XGQ88MuLNadRo2vlMYyXcAJ1zd1B6aGBBH5+fGGxbDjxFbIO11hLgPcSAS3
	AcS8J9Jo3wEGSTe9ONQJayFYMszbkt4vUBhLOBcN65xRQbHh9r8/JPI986L9p8cS
	8na+MBC30ydvwIde1lmQ11x7zzQv6WPwtG7MF0O0otAmXcm7UnuNnOhjjS26P/Fw
	DEZd3qSlcDv125wqgA6kCZb24klq6dPWkjghV6EHEFQPOwofl3h6EdrD7XcMn9he
	gJa1LQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996ggr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 08:07:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9205e6b0bcaso98647485a.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 01:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782288444; x=1782893244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FzVY8788rMGJlMr4B4yxqA305gNDuOqkYty6vubBhc=;
        b=fRrlnvtWRnNrQtAkKOcmCvZvmDhqOyZLFoQizKUoWDmeXmjWV7unfkOPg48gDk1r98
         1/5hT/2druBKPc4vmHyMUOFJf979JHZ08yVY938oIiDPHASDigXDFRrGf0cdzNqPO3Rb
         7pH5YowaPLuWn+1QdRX8Jfq//KG8MPUpItXNpM3P7qxazQWnu3OGXJM3Gcd9OTGE/jrO
         rwWzT9nDBiMNDAJokHVLm19pfGz7VSdVvNJNrz07zdtWgQfOtEggJYn638DhzZjXX5g4
         EPNf6lycGl/rL0L8yp0NvuktTMzhCqM0c2/y/nejmB6xydSYQmiUc5Yphv6RuwGmwrGL
         z8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288444; x=1782893244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FzVY8788rMGJlMr4B4yxqA305gNDuOqkYty6vubBhc=;
        b=INeuQuv0uyg47SCKPeSQVEerIuoFk+0HFkO+AN1Mh8zw94u302CetQR8qPE4QwZRPY
         wIKKRnp1zJ08pYGDRmF1BD44mkIpntaU5193DeR8hGqCuzRMvZWk7IwD3Un2NA4Fc8j/
         8VUg/1gfHNli7XgHc3pVl9PA/FUYSbJZ1zTRkAPZEY7ygsNARaU9pl8E+baj8rwCKyU2
         WKFZvwmkhFVggN099U/p61jP0Kk0c6La2U6OtoSlHnhssyGog4mbZ1aHQqf2nM2qATi5
         Fwjj2CvrGtWYDQzJ7KvjyYfzDTzBP8ZwkcUFAjfHnAhCiNlnIBopoyxsqlZzfV8gphne
         bvcQ==
X-Gm-Message-State: AOJu0YwA1MchfH4T0Wgico+w7n9N0QlnUK+yEPAt6XlS73bfGSifXd2U
	JvPdAOS0FA/RsY/j1Dg+lQ46qSE8xwXcTQo+mggJimCllDE0FElcn1/jveUbBU+0ZddNwWYNIYT
	xDTuvPWaj1PppeLn59jkNkYp0HN8AdduJ80gM1fyH/Xn9+563rs54xTX3zo64W+mP3w==
X-Gm-Gg: AfdE7ckis7DJkJcfOLXo4yWzeistBSPg/12XTo26X1WGrf9W6V2/x1GFlDY3gm8u6MS
	3zYC6j8AF8z31KXzYNSjQBcxjoGcwzTs1FtD8BiPr2J/AisT9TtQg2s12MPa2kBpXlPFjoesdKP
	qkj4VlCBUQ2LDMewH9aX+rLd1AiXueMZOZj5PX/+h5Ida+5FOmP4xF/4rwo79tpbDg+KCGpsHf4
	MpAWTXd+bFrWa72S64BFHY/MgB1zWjl3IHi6Xy7fKD5Rp0kX5LFypDhL7MAtTtVuNsX437QLKh3
	noXDi5zv3vhqQGT956QeM9hAAH/Oye/6I9gDHodyFab2cu8q12VRkH8arWsGqaMhIYbEWMJL4mE
	HCZLWJt7GehExxK0PNqx58OEyGjfKwj29c4GBkiU/fc9Meg==
X-Received: by 2002:a05:620a:29d2:b0:915:c76f:26e0 with SMTP id af79cd13be357-9277e739cffmr388253885a.18.1782288443582;
        Wed, 24 Jun 2026 01:07:23 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:915:c76f:26e0 with SMTP id af79cd13be357-9277e739cffmr388248885a.18.1782288442983;
        Wed, 24 Jun 2026 01:07:22 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.250.204])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11f0ee8f68sm27650366b.56.2026.06.24.01.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:07:21 -0700 (PDT)
Message-ID: <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:37:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] media: iris: update buffer requirements based on
 received info
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
 <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5DLDXDGEj1XpUBA2EfE2lNSAlKh5J0XR
X-Proofpoint-ORIG-GUID: 5DLDXDGEj1XpUBA2EfE2lNSAlKh5J0XR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2NiBTYWx0ZWRfX3C0XoP9tgHZP
 KtHoikjRMSEJBkMcmgwqlRxAm1+ht4jVc81Y2m/zp3Ze2UyH4Ju59RhYllJ1DeU5taFV1iUKQKS
 0532ZBIubrKp3ipKu3Vu/ges8cIbVM8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2NiBTYWx0ZWRfX1fJjjAlUM05Q
 I/78lNUo7dlX1LSYz/FWd5SF4MEIhnxP//0X60MSz6jLI446T/EANdZdCgCuST1E8GR5IBGWoeN
 4VR7fFf1dq3wWbmAetevUOBmGUWI7dDK1nROHRS4REnS03nz1BDF5ibCXMLbgEE252usXkzRO7W
 YRTob0MVr0T6FwFjDAJ8Jv6RHwa9MlqXsQVZkeybo7YxgoPllHw1X0bLHN7uTvCNAXxQtEF0mAh
 Dk7YudWtk3luASV19dNNc+QK2U5UR/wHWGFmHs0nVviB//LDGGd7XMMFhRou9/0mQtK57zrcqPy
 2H34D/LFsGxUk5omOgkWv5Ry8bxIiD/+8I67Safff/qo1G8Xb2Aw9ZqnIoODYIxfKxFC9YevdlL
 LFtLpsBe8IPFHqgIDm5cVUBebGroOnZKyJBAbXu3iP7h183oO8E2vuARIlXcdhJbE+4cUEMzznN
 JuEYWuqPG9vlg3pUu8A==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3b903c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=9U17wRWtyhLDe7ZN7ogbJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QYZdmEBtecGxs_tjcH4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65515-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C84D66BC6B8


On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
> Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
> driver should update buffer sizes and counts from the received data.
> Implement corresponding functionality updating buffers data. This will
> be used for upcoming support of AR50Lt platforms with Gen1 firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
>   1 file changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 23fc7194b1e3..896953ea62ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -533,6 +533,79 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>   	dev_err(core->dev, "error in ftb done\n");
>   }
>   
> +static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
> +{
> +	switch (type) {
> +	case HFI_BUFFER_INPUT:
> +		return BUF_INPUT;
> +	case HFI_BUFFER_OUTPUT:
> +		if (iris_split_mode_enabled(inst))
> +			return BUF_DPB;
> +		return BUF_OUTPUT;
> +	case HFI_BUFFER_OUTPUT2:
> +		if (iris_split_mode_enabled(inst))
> +			return BUF_OUTPUT;
> +		return BUF_DPB;
> +	case HFI_BUFFER_INTERNAL_PERSIST_1:
> +		return BUF_PERSIST;
> +	case HFI_BUFFER_INTERNAL_SCRATCH:
> +		return BUF_BIN;
> +	case HFI_BUFFER_INTERNAL_SCRATCH_1:
> +		return BUF_SCRATCH_1;
> +	case HFI_BUFFER_INTERNAL_SCRATCH_2:
> +		return BUF_SCRATCH_2;
> +	case HFI_BUFFER_INTERNAL_PERSIST:
> +		return BUF_ARP;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
> +						      void *data, size_t size)
> +{
> +	struct hfi_buffer_requirements *req;
> +
> +	if (!size || size % sizeof(*req))
> +		return;
> +
> +	for (req = data; size; size -= sizeof(*req), req++) {
> +		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
> +
> +		if (type == -EINVAL)
> +			continue;
> +
> +		/* on relevant platforms hold_count and min_count are swapped */
> +		inst->buffers[type].min_count = req->hold_count;
> +		inst->buffers[type].size = req->size;
> +
> +		if (type == BUF_OUTPUT)
> +			inst->fw_min_count = req->count_actual;
> +	}
> +}
> +
> +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
> +{
> +	struct hfi_msg_session_property_info_pkt *pkt = packet;
> +
> +	if (!pkt->num_properties) {
> +		dev_err(inst->core->dev, "error, no properties\n");
> +		goto out;
> +	}
> +
> +	switch (pkt->property) {
> +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:

If i check the venus message parsing logic, it loops through the packet 
till it hits the case. Here, we are assuming the first packet type, in 
the pkt to be the property "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS". 
There can be multiple properties in the packet, and if 
"HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS" is not the first one, the 
usecase would break with incorrect buffer sizes.

> +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
> +							  pkt->shdr.hdr.size - sizeof(*pkt));
> +		break;
> +	default:
> +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
> +	}
> +
> +out:
> +	complete(&inst->completion);
> +}
> +
>   struct iris_hfi_gen1_response_pkt_info {
>   	u32 pkt;
>   	u32 pkt_sz;
> @@ -657,7 +730,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
>   		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
>   			iris_hfi_gen1_session_ftb_done(inst, hdr);
>   		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
> -			complete(&inst->completion);
> +			iris_hfi_gen1_session_property_info(inst, hdr);
>   		} else {
>   			struct hfi_msg_session_hdr_pkt *shdr;
>   
> 

Regards,
Vikash


