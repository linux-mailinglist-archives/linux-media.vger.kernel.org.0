Return-Path: <linux-media+bounces-59274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHdNE1Vl6GmpJwIAu9opvQ
	(envelope-from <linux-media+bounces-59274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:06:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8F442466
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFD68303EEB5
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006E12DECCC;
	Wed, 22 Apr 2026 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hO11ZdL4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIUiel4z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0232221F2F
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837908; cv=none; b=i9TqTrCevqTxhtbVLSLmWzlRue0wU6eiE1ezub7E0p0bwK1WC2pB+Gm4H2E0e8XgWNk70PeaEfefYwiF35qpXW0BDLm/ujJHFTTWiNNOR+9s2jY6Y1ZMclI+fHqHHBtWC/HWsV430kL3DOOofEbiDTxjdiN71b/+PI9End47LDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837908; c=relaxed/simple;
	bh=mATWKhoGAXhp5FVsPUMRJ+PEt2TwYksIeKv5eSOL1Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TBAV39zxe/SIkiHqHHtytVcYblnC+3oRLoZLE1J13b3K6hE+gq2oVNeAUXOi9kKgtsJcyn2QZuHM8lnchnJX2lBbvmy3tK8OFv1HJMeiRuQZFW7ocRXbu8lO2p7WHZSoq8WIXpg67vWg3RHFBmeYuY8Lo0OODKrnDov7hDUMgSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hO11ZdL4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIUiel4z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5FPrE2001071
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97ITzOl+alGgCbxR9t7YsLUIt222mwE9H2YQhA5I2fU=; b=hO11ZdL415Ei83BA
	tqxkhAgKGd6kXzwtWK8aJG5B7HLP9hBFLuwNkCshPzhDy2v+p8QO7QKnHI1lskig
	rzCMWUxzO+miW47+4qrTub0KqRvUSgQ5G8+jhsd6f8hZTzRSjQjnQVdZjE6MSRtB
	HZncZPGeERORGteUapK2K6SLx7aN9dsaca44Kiy0Y04ZOSiH4nRVuMHip67d39BI
	RHHMdY4ezZwpKp1pm30KIptGBYZKQpeJ6obYH6mV0RhUmvliwHcdDDXIqBBDxYG7
	Se02wO0gXOQucW4vKhsXC+e7rGrIMCdKpMuo2MVHBhJG/8TsfV1lBSIJJnzzpR1X
	1JuI9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenf9xa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 06:05:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so41717555ad.0
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 23:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776837905; x=1777442705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97ITzOl+alGgCbxR9t7YsLUIt222mwE9H2YQhA5I2fU=;
        b=RIUiel4zFt1cI3kkEcxKrcw3AgVysdAIqh/CzUhaxvtChXKDordIkmtZ6y4q6bkg1D
         S83I/tvJ6pD5UAz+IJ4Ah1rcElsA4wsRw1aoAbUbQnpoYD1VDCQ0OxVxz5+moddXpbYG
         kCotTmCsJOa+ZEFtH02M9F+3ZyfdqRj3XABZ2lm3UjQqG+R3OagPcWsO/OL0Xes3BLCz
         xUP+uDCx4odIKcsmi1b0nB14dVfTllYJL1pU1+2bngMkW7Oz1gpW88ThAHTPczxRpduP
         NBNbPoLxwk/wkqrVeEHKSHQB4NZu/jzTqU57e6pUYY2YI4VHe/eF1i00Le165Mm6IQci
         ddig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837905; x=1777442705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97ITzOl+alGgCbxR9t7YsLUIt222mwE9H2YQhA5I2fU=;
        b=PL9jb3u1zbsA1p0qJh8y1B9Fm52R61cgyGtoqo/Xx7KKhWCIFpUcm3MGddQcbAbAam
         66oLd3yXScooHTgWtZ7GzBzpw+mZp4sSBu1if+s9Pn79rZyJSCtP5wrBRkdu1DAIFOqQ
         k4VPTbvUzfs66BvdzskzfqNXLkoY8+rsyVT+pQ9QlLzrRS2pkRGt3u8PoSjCUXesOEdM
         DKa9uyOlfbvTsdgSHTv4BJfp3rHDwOWSJnfeVCS1PSxN9N+OTp5G3IybrhvfcDmeNxgm
         pNmicxKCLxT1YNg1S+nPpmVv7kQnd7PCV8TNXkm646gqWz2MVqCAx58N716+95+aiyJy
         +/cw==
X-Forwarded-Encrypted: i=1; AFNElJ9o8iBjgiFGWBXFqLhrzcofLSOVPoEavYIyJA8lESpR9GfwuZ03HPiI76ikZC3zaoDG7BOkyF0gSY3k/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOSHC6VAL7ONq/ynlfbulMB5TlgHvf52Xk+yp992/n3UmeJ9Mt
	TUEfamTz0TjuztT+QSF+v+1/QfFgvW+CtSZv8uxz8Yxg6ftNkYjWi0puylbz0Xyd1GzTdTxCRjX
	1PXDPgCwttH2u2rsL+paMT8VUYenmkY7op4r5N5qf6uDI/xFqK34kr8KVmAW1WAkw6w==
X-Gm-Gg: AeBDievLEVI7ltmReP0Sk4N17U6RvAA2mKU85dfqrwM2Qa8TRvYC3prcBdIHhxS+lRu
	QPjnHa3hAEJUTdy0eZgJhTxKMmZm2EzlVw4d4C8X0tmeXACSWgDhkyyHEqY1BmwF64KEzF6Bwnu
	X4EJ3ebRqr/n4p4K3/p/gqDPuGVpaCdNVNC7GQAQEVWxGbIWzFejgwRYC0I0AAQA3eXZvUbTphE
	F5xr7Xr7lRWr8+OUuR5SDsYHD3GIWe+qFfQM9/yLJDTMvv1S96twalko3Dv6A5WACPvafDLGOK8
	pT+qCu/a3S+0jLJtQyHyKyLfy4yWw2vD0cn7BZGPKJGP9uGdQfdltH5KAx1/H48O29IRj5FHVox
	MYFEOZZr2bMG3xrQ6P93FNxlJd1lDKJgnupJypF+hZQktELcvbNAUniSszm3tjw6Row==
X-Received: by 2002:a17:903:380b:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b5f9de2b9amr183607015ad.8.1776837905249;
        Tue, 21 Apr 2026 23:05:05 -0700 (PDT)
X-Received: by 2002:a17:903:380b:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b5f9de2b9amr183606535ad.8.1776837904610;
        Tue, 21 Apr 2026 23:05:04 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.251.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf67sm149167765ad.51.2026.04.21.23.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 23:05:03 -0700 (PDT)
Message-ID: <954b0303-601d-48c9-a688-d5f622894458@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 11:34:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] media: iris: Add support to select core for dual
 core platforms
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
 <utri77cprqzk5b4pt3qjucugs7vihfb4tn7rcg67nwpajkppqc@cizxr5zs2v66>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <utri77cprqzk5b4pt3qjucugs7vihfb4tn7rcg67nwpajkppqc@cizxr5zs2v66>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -NR_Sj_S4eVSIjT3-s1_5p3lWWJXnK0b
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e86512 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=NA3uopal6eRwgJmgyGZIkg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QuSuyie6uoy6f0Ri9VgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NiBTYWx0ZWRfX96CgouMUTm36
 0Aobs/TYmZW62EPVgw2loknC02kRagX+SEqmmu4VLdbbmWFYV/mjci6738AsK6wtAbxsbo6gVn8
 SDPUOd6lWDkQoWwMe69b35jXhkS/WNO/asNVrO3slFKRNqFtpcDpoTklwCSh2zYLUru+9FVIRWa
 b7kd2qtOfnhVYIe6Oqf/ckd80aKH5/EWamhVlKNodL/mlKqMYMLMUWge2RMhqadvZNYeArTfGs+
 Yfklj/S96nkqu+2GUJkohFxcwBw2NCBGNzSZA7chV465cCmaMvJrXEfO62m3K3LSwyMaKR79yIq
 IfnljMhmwTb4zpL6sWPPAMny5WnnCYuK/W3TDM4VV2xKN6K38VgItN88N68JVc9JgostRbktQiy
 vDdkWV30ZqgloLY0ai37w+0NX51bNmQIqWX01Ry+vUutKR3ayFPZA3Kw6u3yI34yNhQEv95Igku
 6n9aJyolAXc+cctNLMQ==
X-Proofpoint-GUID: -NR_Sj_S4eVSIjT3-s1_5p3lWWJXnK0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220056
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59274-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5C8F442466
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 9:32 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 10:30:05AM +0530, Vishnu Reddy wrote:
>> Select the hardware core (vcodec) for a session, based on load when the
>> platform supports dual vcodec cores. Assign the session to vcodec if its
>> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
>> the selected vcodec core to firmware using new HFI_PROP_CORE_ID property.
> 
> Is it possibly do dynamically control power to those codec cores? Is it
> possible to shutdown unused vcodec?
> 

VPU core GDSCs are HW_CTRLed, so VPU does gate these GDSCs when not 
used, and even inbetween frames dynamically. So effectively it would not 
do any better doing the same thing in software.

Regards,
Vikash
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_common.c     |  7 +++
>>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 ++++++
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      | 68 +++++++++++++++++-----
>>   7 files changed, 83 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
>> index 7f1c7fe144f7..e31d4c988c55 100644
>> --- a/drivers/media/platform/qcom/iris/iris_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_common.c
>> @@ -49,11 +49,18 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>>   int iris_process_streamon_input(struct iris_inst *inst)
>>   {
>>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	bool dual_core = inst->core->iris_platform_data->dual_core;
> 
> inline
> 
>>   	enum iris_inst_sub_state set_sub_state = 0;
>>   	int ret;
>>   
>>   	iris_scale_power(inst);
>>   
>> +	if (dual_core) {
>> +		ret = hfi_ops->session_set_core_id(inst, inst->core_id);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>   	if (ret)
>>   		return ret;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> index 3edb5ae582b4..fbaf852a6b99 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> @@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
>>   	int (*session_drain)(struct iris_inst *inst, u32 plane);
>>   	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>>   	int (*session_close)(struct iris_inst *inst);
>> +	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
>>   };
>>   
>>   struct iris_hfi_response_ops {
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 30bfd90d423b..9d9fae587297 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>>   					inst_hfi_gen2->packet->size);
>>   }
>>   
>> +static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
>> +{
>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +	u32 payload = core_id;
>> +
>> +	iris_hfi_gen2_packet_session_command(inst,
>> +					     HFI_PROP_CORE_ID,
>> +					     HFI_HOST_FLAGS_NONE,
>> +					     HFI_PORT_NONE,
>> +					     inst->session_id,
>> +					     HFI_PAYLOAD_U32,
>> +					     &payload,
>> +					     sizeof(u32));
>> +
>> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>> +					inst_hfi_gen2->packet->size);
>> +}
>> +
>>   static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>>   	.sys_init = iris_hfi_gen2_sys_init,
>>   	.sys_image_version = iris_hfi_gen2_sys_image_version,
>> @@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>>   	.session_drain = iris_hfi_gen2_session_drain,
>>   	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>>   	.session_close = iris_hfi_gen2_session_close,
>> +	.session_set_core_id = iris_hfi_gen2_set_core_id,
>>   };
>>   
>>   void iris_hfi_gen2_command_ops_init(struct iris_core *core)
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index cecf771c55dd..1926a5344427 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -56,6 +56,7 @@
>>   #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
>>   #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
>>   #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
>> +#define HFI_PROP_CORE_ID			0x030001A9
> 
> lowercase hex
> 
>>   
>>   enum hfi_rate_control {
>>   	HFI_RC_VBR_CFR		= 0x00000000,
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 16965150f427..dd341ca5be57 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -37,6 +37,7 @@ struct iris_fmt {
>>    *
>>    * @list: used for attach an instance to the core
>>    * @core: pointer to core structure
>> + * @core_id: specifies the hardware core on which the session runs
>>    * @session_id: id of current video session
>>    * @ctx_q_lock: lock to serialize queues related ioctls
>>    * @lock: lock to seralise forward and reverse threads
>> @@ -79,6 +80,7 @@ struct iris_fmt {
>>   struct iris_inst {
>>   	struct list_head		list;
>>   	struct iris_core		*core;
>> +	u32				core_id;
>>   	u32				session_id;
>>   	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
>>   	struct mutex			lock; /* lock to serialize forward and reverse threads */
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index e3c1aff770dd..aeb70f54be10 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -258,6 +258,7 @@ struct iris_platform_data {
>>   	const struct tz_cp_config *tz_cp_config_data;
>>   	u32 tz_cp_config_data_size;
>>   	u32 core_arch;
>> +	bool dual_core;
>>   	u32 hw_response_timeout;
>>   	struct ubwc_config_data *ubwc_config;
>>   	u32 num_vpp_pipe;
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
>> index cfc5b576ec56..38ede9f76d0b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>> @@ -90,18 +90,51 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>>   	return NULL;
>>   }
>>   
>> -int iris_check_core_mbpf(struct iris_inst *inst)
>> +static u32 iris_get_mbps(struct iris_inst *inst)
>>   {
>> -	struct iris_core *core = inst->core;
>> -	struct iris_inst *instance;
>> -	u32 total_mbpf = 0;
>> +	u32 fps = max(inst->frame_rate, inst->operating_rate);
>> +
>> +	return iris_get_mbpf(inst) * fps;
>> +}
>> +
>> +static void iris_get_core_load(struct iris_core *core, u32 *core_load, bool mbpf)
>> +{
>> +	bool dual_core = core->iris_platform_data->dual_core;
>> +	struct iris_inst *inst;
>> +	u32 load;
>>   
>>   	mutex_lock(&core->lock);
>> -	list_for_each_entry(instance, &core->instances, list)
>> -		total_mbpf += iris_get_mbpf(instance);
>> +	list_for_each_entry(inst, &core->instances, list) {
>> +		if (mbpf)
>> +			load = iris_get_mbpf(inst);
>> +		else
>> +			load = iris_get_mbps(inst);
>> +
>> +		if (inst->core_id == BIT(0))
>> +			core_load[0] += load;
>> +		else if (dual_core && inst->core_id == BIT(1))
>> +			core_load[1] += load;
>> +	}
>>   	mutex_unlock(&core->lock);
>> +}
>>   
>> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
>> +int iris_check_core_mbpf(struct iris_inst *inst)
>> +{
>> +	struct iris_core *core = inst->core;
>> +	u32 max_core_mbpf = core->iris_platform_data->max_core_mbpf;
>> +	bool dual_core = core->iris_platform_data->dual_core;
>> +	u32 core_mbpf[2] = {0, 0}, new_mbpf;
>> +
>> +	inst->core_id = 0;
>> +	iris_get_core_load(core, core_mbpf, true);
>> +	new_mbpf = iris_get_mbpf(inst);
>> +
>> +	if (core_mbpf[0] + new_mbpf <= max_core_mbpf)
>> +		inst->core_id = BIT(0);
>> +	else if (dual_core && core_mbpf[1] + new_mbpf <= max_core_mbpf)
>> +		inst->core_id = BIT(1);
>> +
>> +	if (!inst->core_id)
>>   		return -ENOMEM;
>>   
>>   	return 0;
>> @@ -110,17 +143,20 @@ int iris_check_core_mbpf(struct iris_inst *inst)
>>   int iris_check_core_mbps(struct iris_inst *inst)
>>   {
>>   	struct iris_core *core = inst->core;
>> -	struct iris_inst *instance;
>> -	u32 total_mbps = 0, fps = 0;
>> +	u32 max_core_mbps = core->iris_platform_data->max_core_mbps;
>> +	bool dual_core = core->iris_platform_data->dual_core;
>> +	u32 core_mbps[2] = {0, 0}, new_mbps;
>>   
>> -	mutex_lock(&core->lock);
>> -	list_for_each_entry(instance, &core->instances, list) {
>> -		fps = max(instance->frame_rate, instance->operating_rate);
>> -		total_mbps += iris_get_mbpf(instance) * fps;
>> -	}
>> -	mutex_unlock(&core->lock);
>> +	inst->core_id = 0;
>> +	iris_get_core_load(core, core_mbps, false);
>> +	new_mbps = iris_get_mbps(inst);
>> +
>> +	if (core_mbps[0] + new_mbps <= max_core_mbps)
>> +		inst->core_id = BIT(0);
>> +	else if (dual_core && core_mbps[1] + new_mbps <= max_core_mbps)
>> +		inst->core_id = BIT(1);
> 
> else return -ENOMEM.
> 
> But... Which of the checks will be used in the wild? Will it be
> iris_check_core_mbpf() or iris_check_core_mbps()? What if they disagree?
> 
>>   
>> -	if (total_mbps > core->iris_platform_data->max_core_mbps)
>> +	if (!inst->core_id)
>>   		return -ENOMEM;
>>   
>>   	return 0;
>>
>> -- 
>> 2.34.1
>>
> 


