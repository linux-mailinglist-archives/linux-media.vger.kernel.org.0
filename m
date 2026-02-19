Return-Path: <linux-media+bounces-53070-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACqxC45ilmmCegIAu9opvQ
	(envelope-from <linux-media+bounces-53070-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 02:08:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD4415B51E
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 02:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D606B300C0D2
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 01:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E86620C038;
	Thu, 19 Feb 2026 01:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSz/ai7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EasqSy80"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF5239E7D
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 01:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771463301; cv=none; b=Rs2YZoXm7OI+iabfr6RisSxVhvp08ZWjkGwy6UUwUs9U2VIrhIK4zYAez3on4C3JXRBy46F+IIuRB0HVYQl/n/gWjmtZtjLMnhbRqenZApB6rxb3FV0FoEB7K60REpOMQHHkefaMjroT400m87YFtj0iKJNXj7VXiM0Uo2qKdrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771463301; c=relaxed/simple;
	bh=zpc3vxBmyowwamws9N66QY8zHz5nQtFouvAS9YUCUgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W38pfm0xuwXoubt+9St6MdJXy6xHResDe/YNG4GvXm4l6S7IwxDalGSEKDtkxdUx/zB/HOXuY8PVnjVjqWluQ3VZvm5gbeii6aHgD86QeM1m5grtmyQbT/zWNOaIyhNLHSh4tAySRfFI8xaJWJKwIx68X6PlLSi3LQb+/cIPlLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSz/ai7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EasqSy80; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IFHAAs4024346
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 01:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B1geA/cGZaqJIXyTzO6HfoUpfe8wABs6l5WrCbK8kMw=; b=SSz/ai7wIa66qU+i
	1X7aS3LxJY9HJZBYkmKv1DZO22dgE/ymWtMUikWhqz1P7qaSbpcKe88/1EAqMi9b
	UnXqqAiZqJYDfl6ISb2I+VrYIiIKdMhRSEPPXQL8J4qcijRIajDcsEhbMxNds0UY
	gYCV6Ky4OqTri8/KUCSuTwp2PSOi3fgzDBCUoqe9yfpCAt+199qixkaWeAQ46MIF
	PtlrGmLPl2wVT+OiW+PTarS5jB/kkYnpT3cRaaDbmblEklJH86fRfifqmCzVSRSV
	oylShsIKF4cUSdR+UloXeq5vRdTS+o3UlSAw3dpNOflTBZ+VrnyYTb/tU8PJZC3e
	UaP4qw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c2yah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 01:08:18 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4c27c728eso4826691a34.1
        for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 17:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771463298; x=1772068098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1geA/cGZaqJIXyTzO6HfoUpfe8wABs6l5WrCbK8kMw=;
        b=EasqSy80UOA/+MDSZFbGSxhshs3NBqByea46Kvf0zuj+ZowWevUWILj/o6mhwQr+gm
         ZHAIwiMiQuob1zjWyg844/7q8JsSaN29BIQikrU4KPIsMo7XbAvgp/7i46xelX8fzauV
         lM7B2Axgw758gHRJVmJ1sQM4VbHQPJEP9Fsz8t5oNKeQErzspqr9sYWCaalrDAmcZ9qA
         VZv8pIq+0d7jfL4sL6apC+5L2wakM2wbcnuvbDgX++KLuZb9vnR36X3toNrRn/JVFlu5
         9wZgllUXUj+hti0mlmYtjzZvQgYgOQZoCiGzRJqsIpdMMN8bf0EM/zj71cbCJdeNQq1m
         stFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771463298; x=1772068098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1geA/cGZaqJIXyTzO6HfoUpfe8wABs6l5WrCbK8kMw=;
        b=SPk9OwpwDBGGEDDHhkt/HMcfvCVgOBwhnwr95e+Y2nufsPdyBRTHQEgKY8EHtmx1vv
         366uiN5ozCJVuPzGvQib6K2jFarySkCtSU7J/quUR2YfOGjZpdzV9RgI6mid30RZThkQ
         ismvGrB96PT+ELMyBpKNGrimori70UTVnuWtnJSmFnwniShllX7UzqPUK04aRJPVVbmZ
         lAAbP5yaPsX3mxqKsa6S0iBcG9lbG64STgDGqg5XIUnMarLmRLXNgnDn2r2cWJzwJ34z
         mcPta4epwkR8uHxBQLGZPPfQp+xm65IZthsxj0t+zQbLLpgPTA4GHqm4Cucx++Ih6hEB
         f9bw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ6D3tZbmejX0DRQwi3lhug7H4qKkG/OXrKeSS60dVXIrHDgXodStVMh8sauY1JVMAdLUdt9boj5FJFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMiozJ8Y6GxSmc9Jbe7rdP+W+Ludy+FbRNj2sGjp5rTnCF0JVZ
	8qQ2+WhSqzMd1fZDFg6Q160DvAVBppCmTdaYJdsjHI5UBZEYNe2SXog1Ya0sb70euy/T6+MwLeb
	x/TUCM9pvZMupSSHkWQFN3u22zh/TxBvOxOUokQImoKMulGG8zZIRWmW8yahQl/JK0g==
X-Gm-Gg: AZuq6aJ8cS1rjuQS0yH9ZRfMeP0bNl8VF6Pe/aNeGsecHgwYf+aaqsyeeAxM0SOeLXq
	9jZM3YRlsZWmhQr6UHgU1iU2WqJ2w4DzS7I6WLzoMzM1hf7w3DDOwOXfOilRCWPPhe2jVDlm//n
	eZL7YnaNVs33S29r+ccNrpV+T3qgpg2dW6Svv/NgGWjQSQnSl3+velQ7JhLx+e2yGk3u0ym4/J/
	ya9Wx9NheBjNbuL6DPgdtDyhGsY3qY43zfGz5t7rLDToVOAhqE1sX9oL5mMtbyCZY5b1ib0wTVu
	FES4WgsSaDOzKogt+erVkPVHn5tKggAhfQmCpZh0tEpbgZfQVzte0uKpo6lUtpOVpptGrC9NbKI
	N6zVOZ40wpuOIwmB7ki1icGGsNseNbheU3jzX8hmr5/AzZ6Ih5QbzWsfqERItBr8p9xOnIVetbR
	wuWQ==
X-Received: by 2002:a05:6830:660c:b0:7cf:d7ab:bc5d with SMTP id 46e09a7af769-7d516a1d0f0mr127696a34.15.1771463298154;
        Wed, 18 Feb 2026 17:08:18 -0800 (PST)
X-Received: by 2002:a05:6830:660c:b0:7cf:d7ab:bc5d with SMTP id 46e09a7af769-7d516a1d0f0mr127684a34.15.1771463297760;
        Wed, 18 Feb 2026 17:08:17 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7720a95sm18315578a34.29.2026.02.18.17.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 17:08:17 -0800 (PST)
Message-ID: <1bb6ddd1-54ec-4085-a321-a9b4f2b54950@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 17:08:15 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/5] media: dt-bindings: Add CAMSS device for
 SM8750
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
 <20260119-add-support-for-camss-on-sm8750-v2-1-3e06583a0a81@oss.qualcomm.com>
 <406f2ca6-d136-4c05-bb46-65d39c1eedbc@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <406f2ca6-d136-4c05-bb46-65d39c1eedbc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XwTJnhOjzwQnCE4fzVo31dvTgH2H6b29
X-Proofpoint-ORIG-GUID: XwTJnhOjzwQnCE4fzVo31dvTgH2H6b29
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=69966282 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NJT1t43cUZnzdZ1aRTsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDAwNyBTYWx0ZWRfX0HupO+kP9RPf
 rub1FF2ezm5b1xfEZZPtoBZKT6OGWQlT09SZNZ9dmJ99ZjbAuC+XOE/lanumxllKEGUD9V5QeJI
 sxGhHLJxhbtnRSpmaf9EQIatk1s8Tr5hwpWgGZWdsfr+7Ea94ep624Qzrk8t5RJutIbNKCt+yPM
 fi6iclINbJQPxvKD/TFFOxZhhXPcU/XAgsdd5+rLMEerNmRFjnpmpJqi/x3CJ7zyGcp/V2rsKLN
 dhO4rnIV66c48aMm7oRGKDxyPV2PHKUkbgz7vxKXwdLSoKX+XY4B/IdObLwtSSlQnanFG7nu3OJ
 gcT7oUxzYFELlEh6PH2YnEg3rcfZerbQkymbBj7lrhN1DBoNEd3BKI9LyK3ScgEuDDkrfsOTzD5
 aR/IFJqZcgfXP6zE/y63nVJmo594Eaed/lg7QUkrmnklrgvv3/m2hd8UQ2phZDuKBoc5tmwbAAV
 nl+5aXpJxxAGEj+EUbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_05,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53070-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,oss.qualcomm.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCD4415B51E
X-Rspamd-Action: no action

Hi Bryan,

On 2/18/2026 4:50 PM, Bryan O'Donoghue wrote:
> On 20/01/2026 06:42, Hangxiang Ma wrote:
>> +      - description: Registers for ICP (Imaging Control Processor) 0
>> +      - description: Registers for ICP 0 SYS
>> +      - description: Registers for ICP 1
>> +      - description: Registers for ICP 1 SYS
>> +      - description: Registers for IPE (Image Processing Engine)
>> +      - description: Registers for JPEG DMA & Downscaler 0
>> +      - description: Registers for JPEG Encoder 0
>> +      - description: Registers for JPEG DMA & Downscaler 1
>> +      - description: Registers for JPEG Encoder 1
>> +      - description: Registers for OFE (Offline Front End)
> 
> This is a weird map - it doesn't seem to have a BPS ?
There is no BPS module on SM8750.
> 
>> +      - description: Registers for RT CDM (Camera Data Mover) 0
>> +      - description: Registers for RT CDM 1
>> +      - description: Registers for RT CDM 2
>> +      - description: Registers for RT CDM 3
>> +      - description: Registers for RT CDM 4
> 
> I actually think these should be standalone nodes.
> 
> I've done some prototyping work on Hamoa to bring up the BPS and IPE 
> using the ICP and the HFI protocol.
> 
> An absolute torrent of TLAs there but one thing that pops out of that is 
> the current CAMSS bindings we have kind of match how camx works when 
> there is an ICP.
> 
> Linux/HLOS programs up the PHYs, CSID, IFE, sensor and then the ICP is 
> tasked with owning the BPS, IPE and hiding away the complexity of the CDM.
> 
> So to me that says we should keep CAMSS bindings as they are largely.
> 
> I think its just messy to keep jamming registers into this map - it 
> really is an enormous list.
> 
> Lets revert to the simpler version and add new nodes as we enable them 
> for OPE, IPE, BPS and ICP instead.
> 
> OTOH I will publish the CSIPHY code you were asking for either tomorrow 
> Thursday or Friday and I'd be obliged if you could review and ideally 
> align with that.
> 
> A humongous blob of a camera block seems like a legacy sin we should 
> just fix.
I am not sure I followed this entirely. Firstly, you weren't referring 
to the RT CDM register blocks (although you added your comment there), 
are you? Secondly, I thought you wanted the complete HW description as 
it is supposed to be in the DT bindings, isn't it? I am not sure why you 
think it is based on how CAMX works, rather purely based on the HW 
blocks and registers available in the Camera sub system on SM8750 and it 
is up to the driver, whether or not to use the ICP for offline modules, 
although using ICP is generally advised for the stripe based processing.

CSIPHY nodes - sure, if you advise that, we can.
> 
> ---
> bod

Thanks,
Vijay.

