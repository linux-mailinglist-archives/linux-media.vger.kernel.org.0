Return-Path: <linux-media+bounces-56879-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBfUK+qOwmnDewQAu9opvQ
	(envelope-from <linux-media+bounces-56879-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:17:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 527BD309294
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCF2030217FB
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760DF3F7ABF;
	Tue, 24 Mar 2026 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jw1XReow";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/xn/u1p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE23DFC93
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357812; cv=none; b=rzAkpkXulS4FWteHGNvgTIAGhFyu4C7L2ASWEatY3lkWk0adwqF7jNW2mR+eEkoidfYsQUQK3n1qYVibLWbHFDj9cpENoJzSFQ+RNqMZrfY7DIhc/aG+hBBNTzGM2mY/bolXym2AaQRIvlNlOtq9ur18K+0yJMaX6LKE4bIQ1QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357812; c=relaxed/simple;
	bh=XjjoBCqsPWoUyiJTSUCrVAmiqVUuemEKFjvvw3QmQ7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hxfkaniwe0be9KSwJv8WXj85BXyMomiX6nkbFkyRmSjhgkxOf2b3G6/f/ARAR4EfqQQr3CWih9cnaATpzKtg0X/1fD6SJYOOZXxbgk+FDCzvHLBui4syTMaYF/X45xbxkAMTSpGTmmhWfvvNwf4YAHyPHWO3IWampxkwsL/AlVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jw1XReow; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/xn/u1p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xhir2322932
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 13:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tmu0SBYVZeN4wXo5FDEvB7ZxNsjgyVdo+2SDD6LM7I=; b=jw1XReowrlDAzqM5
	vdUM7VNbdTTNW1CDWT2toKrapa59pPeZUSIhI7S1je/+PsUOWWLdzJDfA1zXYaD/
	7sYe5dH4/Ly+/hrQYAwI/9IMeNpxJ5Mp6IRPlrupH1ZcsQIZ9fYI9OLUzRtLUZRG
	W36EzTmeC4h8jiDhlqsjYJa8sDNQ2rmXZWdnlWlF2kPHGGJW+gG5ctSAUgUSjNNI
	9fXn9Uw7z1UQeMAVeFKO9qX3gmlervnJvAOLR7DfmfukFhDG92rSgxr5/WwtWIke
	o7rndhkPzS60BDrRfflNHCo7UR52KU6pKWVf4cFFtDifsdKK31lJLduxDJ+zZp+I
	LYxBrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkeryyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 13:10:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50911c94db1so66276751cf.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774357810; x=1774962610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tmu0SBYVZeN4wXo5FDEvB7ZxNsjgyVdo+2SDD6LM7I=;
        b=E/xn/u1pMzuAifYFHM5q1zdsEhv06VXcfqCm1Hz63rx81sAVHw6K+Bambkoy1yE+VT
         NJr5gOUuDaN7KFNeKgUBybQRM4xjCzNGYR/s0ykkbO6/TV/HoDUPbQpVjb+iwIuMQyiY
         sZME7ipCumd4cW0JScHyq6bZ0wf29hK1Q9hYLWMNk7r4iDYjbaRjFrYey5KL1ZjQn5D0
         BmtOwYhsry06h5G2kZLcMRu8iFHl68VRpXhqYBWZnbkLpV7Vdvdhc4pHI5ly695bAXz5
         wwe+eKnpmArmOIMXbvpqyw8Vms/fL3RUyH1AjN/vkq5qNQcROI48tRBt616RedNpXz04
         cD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357810; x=1774962610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tmu0SBYVZeN4wXo5FDEvB7ZxNsjgyVdo+2SDD6LM7I=;
        b=EKDNmE/dM1yeqgGZIiX26Gxu8rOpbh7CJpVpLIjf+LSEa9aBO2i6z0D7muIPD3JHhx
         19bOW4AWTE8BdlBbz9G9kyAcXDRarEx1gyirFXBp9txYk1OM5S+n4DFBHOl/y1K4qrcw
         Nr3EsnOnAoBhskHlv1PHlle+CQsj3a0O56CfQQTLwAS7qX0GVZfPaG6tdNKjJUj4KM3r
         ARBBSJuncOZ0rti0nkUQurUtzJ5WUm4lQupXmkcY96DLqqj5uO1GT7oLmKbiH+5vzRPX
         Qb+sp8Q8Kp/un8dkTvCdcFNIZZ0Wb2JBaaSGd60wzkpzPXmuwEtt0luUmDOJDFf0UR68
         0KLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaY4ovxnbKhHVTXTOI69daqMX1HezV6pykR93lsVfjjOXEopQb7piN/MgoLYg2yJ+uW0XAqvzCl9XYJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo3O9qtR5SDusj8JxPTui3r0vqzRbtwwh/ieY+YTr0nVbHgzk+
	0/MEjCT0q9F+bOKba/5hFRAjpdvhUJrfKoGMAOaRa6fJ6CH2JfXb40siavfaRaCBPnJD2OEKs+c
	7ECdo1Itk4vXCdFEqgwwzvgdxxIh6HmcykChdIA9xOgFZmavXFTufEtPIF+QcxI+tLw==
X-Gm-Gg: ATEYQzz9IbYvW7vXcR/xNE3sHKhUUyYWZs0nuBO23NHrI9cfluQ2WwVgWB6sIgwbyj2
	xiwzpk162jJ0x6SGPgWCfRE3YfoCm2gLIZArxfWg8vMX4aLZNr9EIrgSIpgkssd9LqpMza/6MFQ
	yh9OvVRa7go2jeAipkzp6J3730rlA1kWzws2EdQgcX7QUlBJSidiQuIrv/ccnqWCF6WlKrvMtIn
	IKIkN1A0D8JyoJMJGgoInpwLvuBUyt5ThtXIYqXNk+tcY8AyBwjlqReBhg2Dct4a0dapixoObfo
	XYmvYBIOrEcSQ7RRT2K40vZVaxrA0oa9OhUelgNz7j4V52qEk7rCeFGTdG/n1Ngy58DRCmqCeCW
	W4ALuKiJLXrKoEQM+ZYjX9EXJZiBvXNw+wnNn6EE1jprY/O2ZM18amQDuphgyTHLP6I0CnySlGU
	80q1fwWaA=
X-Received: by 2002:ac8:5d4d:0:b0:509:1b01:8926 with SMTP id d75a77b69052e-50b3738b0eemr254227411cf.6.1774357810010;
        Tue, 24 Mar 2026 06:10:10 -0700 (PDT)
X-Received: by 2002:ac8:5d4d:0:b0:509:1b01:8926 with SMTP id d75a77b69052e-50b3738b0eemr254226801cf.6.1774357809508;
        Tue, 24 Mar 2026 06:10:09 -0700 (PDT)
Received: from [10.38.244.11] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e5cc1fsm110775811cf.22.2026.03.24.06.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:10:08 -0700 (PDT)
Message-ID: <93624dae-71c0-45ac-9aca-7175d8771a32@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 21:10:01 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE
 lite
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
 <CAFEp6-2XrMkKzA4KAEkYF0v7XzVefFpUEG98VYa7wNuanbZ-Xw@mail.gmail.com>
 <02ecbd98-01dc-4e56-901b-41783c55d095@oss.qualcomm.com>
 <CAFEp6-39tUEBqX_FWLdohE2jenoj1ot18Gnhi4Aop9hukGoGQw@mail.gmail.com>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <CAFEp6-39tUEBqX_FWLdohE2jenoj1ot18Gnhi4Aop9hukGoGQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NDVF-7_3_CqzBYNFweaDTj3zSbkMWz1v
X-Proofpoint-ORIG-GUID: NDVF-7_3_CqzBYNFweaDTj3zSbkMWz1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX+oA1ktOE1f/1
 YT87CvxcRhyR8PzxYVaMpQ8K9VV7kphxpkDK4ypr69s68ncG5f3WJ79hCHS/6RHoJQ6Q/wAkYR8
 yKomlHZV7w/qJb6YHQhGLwoe2rhLWlvgBkuSlm3ztQ9BQnBSGChYoIBZqGDedfswAOEB+U82Lm8
 T5LPc7/B7xJmZT42Cz5WjbVO5BPSeV0rlEm/5PoKVipnLSMPvvvw5lGlRraDzxuiT1xSjkl4cVP
 gm+Hos6eut4etFDMJd4Q8cfemuL8DKnWf51vVg7Hca/RojMdyq7CwdVj1aaQcBpqOgOq+0gjqjE
 UviM83TLYYJX8ctXqAcynAh8ophBvWKayrHpegKJA/wDX/27u/WpA83VhPEbtUTBHZUbrvgFk3r
 AdhK3XaST3tIJhYMzy2w9paYMmztwNUb9j6sBTxHwdNUGO1ZwOeAnTX1csYH1FJer5jehnceYOM
 8VA6BsZvCU2+JpTDhxg==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c28d32 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=geiQnwYwG4LExPUYDA8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56879-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 527BD309294
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 5:55 PM, Loic Poulain wrote:
> On Mon, Mar 23, 2026 at 3:13 AM Wenmeng Liu
> <wenmeng.liu@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 3/19/2026 10:44 PM, Loic Poulain wrote:
>>> On Thu, Mar 19, 2026 at 10:11 AM Wenmeng Liu
>>> <wenmeng.liu@oss.qualcomm.com> wrote:
>>>>
>>>> VFE lite hardware does not provide a functional PIX path, but after
>>>> the per sub-device type resource changes the PIX subdev name is still
>>>> assigned unconditionally.
>>>>
>>>> Only assign the PIX subdev name on non-lite VFE variants to avoid
>>>> exposing a misleading device name.
>>>>
>>>> Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type resources")
>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>> index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f916736f1d1664767bdb6a36 100644
>>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>>> @@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>>>>                   v4l2_subdev_init(sd, &vfe_v4l2_ops);
>>>>                   sd->internal_ops = &vfe_v4l2_internal_ops;
>>>>                   sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>>> -               if (i == VFE_LINE_PIX)
>>>> +               if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
>>>>                           snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d_%s",
>>>>                                    MSM_VFE_NAME, vfe->id, "pix");
>>>
>>> So the PIX path will be called RDI? Doesn’t that seem misleading as well?
>> when i == VFE_LINE_PIX and vfe->res->is_lite == false then vfe name is
>> pix, not rdi.
> 
> I mean when is_lite==true, we're going to name the PIX(lite) path RDI,
> whereas it's not a raw dump interface, I guess pix-lite includes minimal
> processing engine.

For VFE Lite, only RDI paths are supported. There is no PIX output.

Thanks,
Wenmeng


