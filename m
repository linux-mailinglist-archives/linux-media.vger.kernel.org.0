Return-Path: <linux-media+bounces-64127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vcZXEPZdJmoEVgIAu9opvQ
	(envelope-from <linux-media+bounces-64127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:15:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C3653112
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 08:15:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FTMMv2r6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bvegCvMc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64127-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64127-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4BA2300E25D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 06:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB820306D3F;
	Mon,  8 Jun 2026 06:15:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ED2386550
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 06:15:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899310; cv=none; b=DWsacb/RUmLKNy1iOp2JOmLwfup6KKZBoOWt6VDkgSFjEPeD3My5hIdHBdsMnxOwqcFG9yZJmTHj/s9mAM64hSnoGbAK/tNyqrLahVwoQl3h65+ZCzocYIrgOnDV0mU3ycQYiH9Yj5+RIvnjSuYCUPzsVC4DS4pspBF1eDMK1xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899310; c=relaxed/simple;
	bh=JEfr1WcPyptknpcLlK/YZlaRlnMjcAUayOk+d1ct/pM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9vXzAKYfRlSHkbX0B8FfjwRbi8yGB0weomz7yOVTUs4WeTcjsi4SFRCbTA48Np1MifXcWjpHUPJ6gBr5cPT6qacRXtpBOGk1eFEdu/9wYLXJV6n1zShlLGQP4wOvCrh1ErNoUmnzyh1Flb/iemcg7A9BfaoMUn6QxpvamuNg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTMMv2r6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvegCvMc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GxrH1933806
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 06:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExETEUVpBVZTy6Hv/NDQ/5WQWMbvebkxoNs1PpcJ2AE=; b=FTMMv2r6BvnEyOkG
	j9kFssqUR5myQ94L/y17wbLncaiAE9HyBasdi2lbeB4BX2ImpTJQobq7NP0xKNlj
	/SlxBKtN9M2M2hoqOJhFY3SFpXsDcaV4vPAxX1rUwiHe0Ue9qxnJ0yj7ynrPt3oX
	9ZY9LCwThf5FJdra3g5abvcfw/teI4ER9H5Iv4OT1b/mycU5u+koE/q+494po3mo
	YWqyjEFPtVGOW0Ppx4U6sxBGOZsjUwb8i22YkM6r0DCkZpx1HC7vYe6/8iPjx2/O
	0rmChlPUOtUyQcRmgmkd1Qe2AdqQJuJCyNFAN0EfCYewAoOe1PnHweUWYWrxSFVC
	CJY62Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6b4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 06:15:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f544944so2969786b3a.3
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 23:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899306; x=1781504106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ExETEUVpBVZTy6Hv/NDQ/5WQWMbvebkxoNs1PpcJ2AE=;
        b=bvegCvMcALfTkDM2gTdjFAOrm+vU7PVM7kikuVf/6U5b4d7bB4tqvl4i/P8mWeH5cS
         LS7Etlyx1wprHoWyRTvjNiLUUwK0nBefgyC4d9zInmOpGTE/Dv1lBP73d+snRsiBLj5v
         MoBdLqDYk7dq0tQq1onLs8IF5MRmA2wafdE/zNDA0/FIr+Xf4WJ9oSceop50hr5cyoQ4
         ckar5JGUD26ROBGNLUYxaas6fsq9rxPJEK1Joi0GTPQd6IrbQThtkvYjADe9P1Yf6SLC
         OaGQ79yyZlRicCxQ+E55xQj/TINVqBOBM9iGDw38EccNT7QO/SnYKxLsrHHxnFW9yLMj
         2nWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899306; x=1781504106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExETEUVpBVZTy6Hv/NDQ/5WQWMbvebkxoNs1PpcJ2AE=;
        b=gO9t48QgowtzWhIvgpVdrWNMc1nkaHq6luMGEpk2bMRX+gsrsE6Q8rPJhwZbbVT/qE
         pV0s7+VGnRwG1/jrXQrgeIE58huIQX+kQ5+FPTM+0a7Vtmd0FhfYKkDOxh571LzXCuk8
         Y5y8Ug8sR5MuqqJV3TItX+v9wRPxM0M63INE0jZ78JWijn1QfRiPZ+sXtBsnT2a5SHCf
         dI91HfljZ7DmH9vSimDVJO2lhfpkfjtkn7fjhmmsKxI818xwQhAvnk2mK16Yq/dVDoOf
         9XBdqQ7O99Pq/b+YNq+BglrvRooXHBXQDaLojwmhGv7BfLrXdFNdh2ONS8pxTpj771rK
         i61A==
X-Forwarded-Encrypted: i=1; AFNElJ9On8JI0nr7g6QM6GjUwwuQjjA8qkIZZlpY/XVZ4Vsf87teaCRRoH0z/tO0YaETcZ5etF6gnhZUONPoRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzkqwxPwFcPGKazCLlOKdkOWKa432M4k1hbkHfjg8/MYFTqg7M
	Rj5+vv9UrTqbLRlOJTRcarLlTQukGKQxtAxL8S4xsfXpbrwr21nZFPTrhoW38rt6ZXVaBO3LEPg
	WqWB+3UhLwqjgQHsYdC2sxh0gC8gysBs07CIbDrow7p2UP/vo6Avpg+8srQPFj25XdA==
X-Gm-Gg: Acq92OH4CIt6jse6dQqs5PdByXsaFP+9cGmPCvYbbJIkelIf5bq0em/nNRyitE6PItg
	CLH40Iyj1wVMbdEiprP/hrLy3ItQmQisFGL63ASvC5howB7ZZR3RzJ+/jOpveURd5t+y4rNYwbP
	Eb0H5sbNUJH6YgRKf/AE0YXAo5HJ5b/kJct/nDhznzPCFbkws3qNmwq81RrtL0OVEQTqpwL+S6p
	4Ti/tkBCSIFmLSLnI09sxWEyDTCMyKRW45UBQ6Dzpk5pmXdjJQO/JSl4n21MO8Rpyc8RMBXrTT4
	R2U+JearcvFGCjj95mwDhD0n98eP1v/fXEMvn0bTK5GAXoHZ8reocFlwE+7FpbwHr0ilgaTXBL8
	bZzZ+N/A3YR81fHftk9mSYb9vVRBFTKP3XA38/L0dLKbiV1CBG9eYKUrpErUx01I3
X-Received: by 2002:a05:6a00:3d0d:b0:836:5c3c:2054 with SMTP id d2e1a72fcca58-842b0fbb621mr12661115b3a.37.1780899305789;
        Sun, 07 Jun 2026 23:15:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d0d:b0:836:5c3c:2054 with SMTP id d2e1a72fcca58-842b0fbb621mr12661085b3a.37.1780899305277;
        Sun, 07 Jun 2026 23:15:05 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282915fe8sm16989771b3a.54.2026.06.07.23.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 23:15:04 -0700 (PDT)
Message-ID: <9b66e9fe-5288-0f9b-ac04-39452ee10e9b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:45:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
 <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
 <57owm4mtcve4t24cqjnpvpcbzljxi4eugmxnop32sraxzqrcj6@z347jmrvx6v2>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <57owm4mtcve4t24cqjnpvpcbzljxi4eugmxnop32sraxzqrcj6@z347jmrvx6v2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a265deb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5C0ElrtqdOlKzEHoQjoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: fKtzpm7yhaUWSFvMh77kqHquwqXg1PmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NSBTYWx0ZWRfXyVJX1qo6zkE7
 xZDvPCem9d8IbcW3IgCt2T8g1Y7bxTKq4Ih5OBmRz3AbCRJVTmm5aWakIRp0l7dNJoMhBABeTN/
 XsBqmekaNCn4yK4Uaosg/0RTyXAgnj+Pa8dJ1dmPPRbBpocaSduqM7v+aJQWZa01QV6ONkWHCIA
 4vc8o9gysFYGbJOGwYIOe/snxnDfWsK00LccGzRWvNMRBeAutBuXuJnOoiRwiDRV4hTPJrRDfJy
 V0cGPrAkoteQuwD3AgzPf8C+/zQewudIB/iRceRlfAbs3FyvuxM+FmEXJ9fpGN5fhgnCqu2+qpB
 k5FTMDOCripHP8xsbaFYOVRYZA8nwV+/p26bk88ysR8w/3+iH7zhfomBOPjsqQtcHMhhZL4uWQs
 TyMMhFS6FkXiD8psBNhne8bdcwrrr5x8S4cvHOf/ca/pHPyqgTnh17/FSo56n0eBLAjCevupmOq
 g0v5Toyovm2fPbq8ZJw==
X-Proofpoint-GUID: fKtzpm7yhaUWSFvMh77kqHquwqXg1PmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64127-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:sashiko-reviews@lists.linux.dev,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB1C3653112


On 6/8/2026 11:25 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 11:08:35AM +0530, Vishnu Reddy wrote:
>> On 6/3/2026 8:09 PM, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>>>
>>> New issues:
>>> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
>>> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
>>> - [High] PAS metadata memory is permanently leaked upon every firmware load.
>>> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
>>>
>>> Pre-existing issues:
>>> - [High] The sys_error_handler delayed work is never canceled during driver removal, risking use-after-free and locking crashes.
>>> --
>>>
>>> commit 85711dbb43a8f02c3f39064784fe37381f80c2c5
>>> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>>
>>> media: iris: Enable Secure PAS support with IOMMU managed by Linux
>>>
>>> On platforms without a hypervisor, Linux drives the firmware loading and
>>> authentication steps directly. This commit extends the Iris driver to support
>>> Secure Peripheral Authentication Service (PAS) on such platforms by creating
>>> the firmware context device and mapping the IOMMU when the firmware device
>>> SID is present.
>>>
>>> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>>>> index 1a476146d7580..8bdc9273036ce 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>>> [ ... ]
>>>
>>>> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>>>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>>>>  		return -EINVAL;
>>>>  
>>>> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>>>> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>>  	mem_phys = res.start;
>>>>  	res_size = resource_size(&res);
>>>>  
>>>> -	ret = request_firmware(&firmware, fw_name, dev);
>>>> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
>>> [Severity: High]
>>> Does this unconditional devm_qcom_scm_pas_context_alloc() cause a memory leak
>>> during repeated iris_core_init() failures?
>>>
>>> If a subsequent step in the firmware load fails (e.g., request_firmware()
>>> returning an error), iris_core_init() returns an error, but the device remains
>>> bound.
>>>
>>> Because iris_core_init() is called upon opening the V4L2 device, userspace
>>> could repeatedly open the device, failing each time and allocating a new
>>> pas_ctx without freeing the previous one.
>> If the dedicated firmware device is not there, will check and skip the repeated
>> allocations.
> No, the path is the following:
>
> iris_load_fw_to_memory():
>    devm_qcom_scm_pas_context_alloc() -> succeeds
>    request_firmware() -> returns an error
>      return
>
> Now you have a dangling PAS context. It will be freed only when the
> driver is unbound. If user is persistent, the driver can eat memory and
> possibly other resources.

Agree, Will store the allocated address directly into core->pas_ctx and used
for next time instead of allocating again.

>>>> +	if (IS_ERR(pas_ctx))
>>>> +		return PTR_ERR(pas_ctx);
>>>> +
>>>> +	ret = request_firmware(&firmware, fw_name, fw_dev);
>>>>  	if (ret)
>>>>  		return ret;
>>> [ ... ]
>>>

