Return-Path: <linux-media+bounces-66851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3SswNAsBTWpltQEAu9opvQ
	(envelope-from <linux-media+bounces-66851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:37:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846471BFDB
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:37:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NWuVIwir;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ap3G1o2z;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66851-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66851-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29B6230A5B45
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 13:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164AE41D4DA;
	Tue,  7 Jul 2026 13:28:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032444189CA
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 13:28:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430907; cv=none; b=Yv6ODLKtOgVZgOer87cvkqXnMdrvscExqiRyDeoq4a3JPAlGgFoPESdDjWFhhNf/Dkbgb6wIJB1ShK7s89d/jlRPKeCH7xdSKFBk8Q+TkAG1fmfbdODDCPa3ogSsGHFaMFGbN9TKy8vb3tQzEdd5U6F0jiTx72/klGkKhvRpcoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430907; c=relaxed/simple;
	bh=nuLeoUEvOpXq9AkGBJOxyT85nniQu7opj6lTMbg2iLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cscy32iLVzSPkGmUN1GXfHqDVuJxFq8v3siMyysLafnEJVnNygV55RTECx0fpPoYcXxXf1n2ZPMLhIRLxaHvM+KP5td1hfh5Ghda8RknFNSphnQ9xh1qbFen6gClR0CuZksfHFNhLArJXtGtNM+TFzs7TQHIZNGG9mfMolspTgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWuVIwir; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ap3G1o2z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C93wL3590163
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 13:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=; b=NWuVIwirqTZmHAMA
	2nzlt/+8dYkyruTu4xT2JDM9ZJYh2QtSz837mrOje0yYqeSby9B3Vx83PpTA2fYO
	V82Dk/A111COS09W1pr9G/vUnn/CClXsvcF90V8ik3MESbxd4Wa1te7vLKPv2F5f
	SozhbPVZIwvz4h8FdSQ/GAtZqdqjggXo5TUuAMBHkUiZ+oVJ2ZERG8R3kCnTC2Il
	Ky3F9N2MEMQ9/qrzTRmPPvf3h1TsjJbQJ0xY3/Zk7gnU2kd7hl3oBFbTlvo1rirN
	eM3grW0Glae5H4Xm/mKhTkgUdd2OG/+Shtgt7FdW/RPscPJ8zn9J4xr+kIPcZ/Ft
	LB6mtA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u9dae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 13:28:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8479b45ad08so7093823b3a.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 06:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430904; x=1784035704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=;
        b=ap3G1o2ziE0vTEBZes9PNqXrCMvicB38n3Oz8r6kOfI4IDVW4vfvPAHNmKx6+mSCKV
         PHrGvRIqGSX6oIOGyuL9no67B7GkQxc1PPfErbklx29ON8S7abWWTYphVHpDNbcjaUNr
         HFBPxgRJ9A825Y7BnRtPaaUIdDXTWWW+j9XHxRrwezSaC0imsAqM4KqmfF6X5sZAKPto
         PX4Mcdwfni2QCorQLGiygoUm5QC/GuYdkDIYIAZpdyW3iB9HXjdp5ap8YI34ROCMI/1e
         ia9NcQ5odKqkASwQwVAI86rwCCqd3n4K1jiSooiWTf0J34uK0a1NRTTBhTAxwG/aDbLW
         eGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430904; x=1784035704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+BWYw27ihfmCLaAceDPp5weMHgOmeY7qTCbRdEdx+o=;
        b=GVjgvAainpWiFi1xgj0VC4eIhTNqTHFNHp1fEINfFtm0blBsLkoojG3kT90Ku8IBLx
         eeGk1ow892qhgILxzV+BXnMmSNHt+2mYtDodEsbvZ6+h/vXwD0/un8N31cWvBHedLtFu
         S6HUbPoRMC//qMSRam9Z6tgbEXP5yTVSdtjXVk+7mzw1SskjN7nm5n9PgVUQwk+QERjS
         VM2RHU8zwM+c0HB9mXEOsCoYdmidz/xIx808Y0E2AjLpKN+8KFQIvvsP/grh6RMNji2L
         Kex7liowRxDwCs7LZlDfzVEQl6q3uEEd7QUeTwntxF1Y7b2y7xXQoBWz8kEmHUub1MrS
         lzUQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3pcuXWpuVQVy74Iht4VM18KKT2rZEC2geTRvRKOkAvpXHo1NM4s82npNzpxLoNPLYwhUObSlaJuGKYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsJRCly2aboQZS8qa4mInJvUMiakvPW3YbUr52/PGfmmLAFHv
	ISrFx5ffawF4YjR7dAinIWUEJ7T5LLkGF+rKKMAzEvPsMAVuyNYfqn2+8qs7EiVYioFSzSeY4Bq
	yM8Q7G8/1TjXrzK+O7fhrYITsaYnSbfuqELYQCbrFQWA7BXhTw+j3kynmJerMl/CSs1wDAb/U/g
	==
X-Gm-Gg: AfdE7ckFOsPGo2tk6W04WNIbsqcpgwOtGnoXqOUqwUqX7YrHxOnYoriJ70xTdifKFam
	97rPX35yhfbGUgXMtm1MfL44nEWHfJIdZoPLCu/zhhhCdYhu3BwawBmrKUcL/JpOwfYAaDPdFsA
	D6oqx7OZPTUxEFtC/cj24N22mFH7SnBkbkVKqLWkIS/bXC7Jplu/jtgqW07cMAMY0zncpw6wU5N
	FnZ7KLPkcI4MDKsyVrff3HC59rYboh9/5z60KUnxtUmhgtyhd2uuP8LMp02gvyXTDrohndEMztU
	5JSLwXhvEtRP9vAyqTdsQI+V6lFz3tms6TXrmVf1gowyu83rSX62o4hAqJFO3yWHxOoY186Z7kY
	JtRLXc+xWfm9bC7gjBzhe3TvP/6S6Uhz7pU5te4J0qw7f
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c09c1a9bebmr3947193637.62.1783430903561;
        Tue, 07 Jul 2026 06:28:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:cfa8:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c09c1a9bebmr3947139637.62.1783430902989;
        Tue, 07 Jul 2026 06:28:22 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm8137106c88.15.2026.07.07.06.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:28:22 -0700 (PDT)
Message-ID: <1f258146-4ef4-4442-85e3-84af7ad735b5@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:58:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] media: iris: update buffer requirements based on
 received info
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-11-583b42770b6a@oss.qualcomm.com>
 <6f7622c5-2bfe-49f1-ac05-81e33c8bd66a@oss.qualcomm.com>
 <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <cxlhuzzvst3joilbhglxogx5hedqx6esbo3j4o3qzkeevqkrt2@47aaykt6z7yc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX2ru0buvcpeVM
 PhBfc0adz9oiXazDTGq+lPk7TS3y68HMifYjyjPHWlIzzjy8smTycHN+cwGTGOCfUrvUBRxw05H
 P415ZtYOmstvgatTgMXevsgG5dXSpSg=
X-Proofpoint-GUID: vXtvPTDIvbn1C6FL3f-bxmy0g18KpsPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX++7td9LZIIPy
 MjrQj93paklrhLFdPDVty2wgZkUNdcpTX33wYdNhRriaYCMTjUCODcPGG3dIsLigbgNIw618kfE
 AZJn1lFQ1uCbUaqb7XRtysjqsODHjc8wI4aJnoHViDypsRRqm/Tv9zSO+hDerrNfDaLxUASfK04
 yRpyAzDv8sgcegML4KB4izKYL6J60QZ+7cVi2FIlOrODoIfYrgNFVGW3IC/spUxUOEu0kf5gXaJ
 PxLg0tqFXm0dKIYVxWmy9fpdC4Pl35eC6T6E4+uYcIkw0Rceg4Nlb0QvIGM/4ys3PgSwV3+6IjO
 Zwnwu1Wyez/0ljl/GjkNdXAXWViqSJ6fJCKK/KBke7Xk+3LSDM02Zfi7LUddHRxNgesF/GykyDw
 q6wfCearp0IIUhGefNPMns+TF+i6rJr8SBvJXJtfjiI3qBp93vUkslxtojH7VIQyBU1EgcOtbtq
 gtS+VVJIZZE2SBpHtqg==
X-Proofpoint-ORIG-GUID: vXtvPTDIvbn1C6FL3f-bxmy0g18KpsPH
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cfef8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=--w9Y1qBsydm4NR-mTQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66851-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3846471BFDB


On 7/1/2026 6:55 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 24, 2026 at 01:37:12PM +0530, Vikash Garodia wrote:
>>
>> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
>>> Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
>>> driver should update buffer sizes and counts from the received data.
>>> Implement corresponding functionality updating buffers data. This will
>>> be used for upcoming support of AR50Lt platforms with Gen1 firmware.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
>>>    1 file changed, 74 insertions(+), 1 deletion(-)
> 
>>> +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
>>> +{
>>> +	struct hfi_msg_session_property_info_pkt *pkt = packet;
>>> +
>>> +	if (!pkt->num_properties) {
>>> +		dev_err(inst->core->dev, "error, no properties\n");
>>> +		goto out;
>>> +	}
>>> +
>>> +	switch (pkt->property) {
>>> +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
>>
>> If i check the venus message parsing logic, it loops through the packet till
>> it hits the case.
> 
> It doesn't, see hfi_session_prop_info()
> 

I see the loop happens a layer before during msg processing in 
iris_hfi_gen1_response_handler(). It calls for 
iris_hfi_gen1_session_property_info() for every packet of session 
property type, i was wrong in assuming that one property packet would 
have multiple property types in it.

Logic is fine.

>> Here, we are assuming the first packet type, in the pkt to
>> be the property "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS". There can be
>> multiple properties in the packet, and if
>> "HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS" is not the first one, the usecase
>> would break with incorrect buffer sizes.
>>
>>> +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
>>> +							  pkt->shdr.hdr.size - sizeof(*pkt));
>>> +		break;
>>> +	default:
>>> +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
>>> +	}
>>> +
>>> +out:
>>> +	complete(&inst->completion);
>>> +}
>>> +
>>>    struct iris_hfi_gen1_response_pkt_info {
>>>    	u32 pkt;
>>>    	u32 pkt_sz;
> 

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


