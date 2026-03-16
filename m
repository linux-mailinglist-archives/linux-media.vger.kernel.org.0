Return-Path: <linux-media+bounces-55844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMQeDJuht2n9TgEAu9opvQ
	(envelope-from <linux-media+bounces-55844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:22:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B02950FB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2CA0C300FC53
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 06:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D0634B1A5;
	Mon, 16 Mar 2026 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldxslXR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAUnADRI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E24329C7C
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642131; cv=none; b=kMoRq1htg0xu7HSF3VgbMewSxnRwbG1P11zgn+pqSi7lE85b5tJ9zmJk8aqMwr7SQAOVKFNy/vxCdNy7mAQbgmAAc6fgcv9PBvMDePwC3HcvUc/fjkC57WfPMIFWtL92qLavSJu+8hsnIQRFX4g+hQAhZTAYQ5ltmm4mVmci9Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642131; c=relaxed/simple;
	bh=CkQoYU/3FLq5DhFAEBY9fWpZoWx/jSQ2m/aJQfoJn9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D3kFv0I/qKx0+9EAMEz6KOmlELSm6IPDDcCcTcc+KYyb1r6rOpu/KXJJrmY3Gmn7TOiw+oDKR5oeP91eHdUI5VNaNCbFcAmCd/crYCpDyZaEKiuMxBTr/ojvc8XajDBHsSuHaN11LJkBbtmopbMqNMWrA2j84Ga2h+f55VxUNGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ldxslXR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAUnADRI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64kjx538935
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3VMQi4qVPweJ+FZbd9d/UOKcE9j5sX+9lxTGG+iwKs=; b=ldxslXR04sKoDz5C
	OaDPXYFfdh+JK/57bOMG3yJ8rnd4slqvBh/MDDYenpdQEO6GpQoj+umQibEOA101
	ZWbB4ECpv4KWW/utuPBMRAnf+0zcOw6HSCjKiFSGfL9Cqp6IdnWgvMoVwQm0pnIZ
	PxuDeJjFLhtzzRg6Umi8tI5WGr9y3pWunE9dxIz1JsEflgnY2s2I7a4oOobYUgBp
	1ZIH6pKoDbyj0Lt+Nfrt1/oN1yF00j2DozdFQBCdDC+VKtt+daw1EzP4wOihFZtC
	jy25STlu2JjHkrqyVIJZAnn7sYyYugr5UwX2K+cE/zDcOOxZwwic8PSbqoGkzuoa
	0tER/g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyy5mbq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 06:22:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso3260061a12.1
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773642129; x=1774246929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I3VMQi4qVPweJ+FZbd9d/UOKcE9j5sX+9lxTGG+iwKs=;
        b=SAUnADRIIKYN+6ei8+JmHUM+Dy0+Glibgb17W4m8QlImd0WPGtnWiuK3VAa0O/EoIi
         s/6IcHOQ/BuzMPdfNIjhMNVg6C2qLt72R/OivK0WYd/btCwf+vHnswhlTaT6JCORwLzv
         6ZUDkpEqWPKgBS8AvZfiByZRYp82ij20RJDMe7oLxj88vWfieOu/uikj8LsqMrKdlWxN
         1YSZ3Jkw3rUqBwxZyD498io1lXmJ5yokdh7/ZdI7cck0JziEGRI/s3GC+etZ8/7CpR0Y
         kqzI8K9Jhgjr75+zvx1zIKrFTbdTTDSCKN4LpILjAvyp/GJwpbE8UHvPAZtd3ui3aNcy
         qSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773642129; x=1774246929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3VMQi4qVPweJ+FZbd9d/UOKcE9j5sX+9lxTGG+iwKs=;
        b=FGiiSuekaOci/EwMzM7jGrSxx1Jy63KyyXOz7T+wPylkhCtVza1pRq0iSj/vlWPz9X
         4Yhe6pV66/C49G3Hh2szzJQikcLe5IcRkQou+U9OBs1Dv+mKXREnGEd6wov5aLiAQI1N
         106i9oUCDMa63O3TddkFsGCJegv1IGspx/E/v0quH/xZNte0tRLUA/lUFoYIO8uEF3Lp
         moLp9On8SAI/vaq1Oucd21JPnJvnMe41rUzEPmXJo88Ijc1LYWUGEbqKqFgnGrfW0HON
         ke464VnTQp6mjEZloUmYivNrvj+A0cWTdJ4ye0534NeQ9cHu/iEbJtn+imhFHXQiflBC
         EQlA==
X-Gm-Message-State: AOJu0Ywxika1GxNaYXsZXU/tmJSgh/ZDeMf1XX+0yNtxOlWpDwC1m8aB
	lAdajmJh4m2rAbp184Im1NZod9tPysIQJSTafBTFO6G43ZyWIZA1NNA8efsXjpqjGWHFInOqayE
	b6bxomRiKvcVpDvWg210srAlRM68PdT+Nv/JVGpd8dI+GsOFp6HKyQ/dvfiyOvLDwpw==
X-Gm-Gg: ATEYQzy/w285svhJXkGPOwTyU5tIwszgQsFw2sVJBFbJbDJVAIEmwXygrtdnVoR0VHL
	l4H62OLSXfS0u6FxmAHNzWypiCtNHrynXq1yQrig2ZPDRhhE4Z1CoVfTzXhL3GIS32ExoPIlYNY
	hWIZkJ6ks+uJxHAA4nde4KngCbMhXGaiIO2f7M2c3pdVddpxV9Y0d4WyAmOZ56ESVnNnYkeih1T
	JGmUxBM2E5LXjjlGcp0yY8VzR2cT9BZ7c1VJi3XHVfBH0suLX997g51tCylpzSSFet/Jd8JUKLc
	LiKP3eb9JIIa6+Mk//YlGIL+RqzYqQU+9PzZsJ3wjotdSuloVdE+s/eKfC/CFhPztvOSSoUVxpb
	gbLYY9tOS7X/JhDljPtd86fGfT7/cPtSSoQcsoHZYCLBO2nwB
X-Received: by 2002:a05:6a20:9189:b0:398:9ae9:70dd with SMTP id adf61e73a8af0-398ece25b27mr11086914637.68.1773642129475;
        Sun, 15 Mar 2026 23:22:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:9189:b0:398:9ae9:70dd with SMTP id adf61e73a8af0-398ece25b27mr11086892637.68.1773642129008;
        Sun, 15 Mar 2026 23:22:09 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb9966d9sm7860787a12.11.2026.03.15.23.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 23:22:08 -0700 (PDT)
Message-ID: <7f165169-427b-4f5b-9bee-bb227be23d82@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:52:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: iris: add new rate control type MBR for
 encoder
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
 <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
 <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <84895cad-9f1a-4e51-8e43-faf30b4bdabb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fi-S48BFThxKsp_Df8xW6dsy4wbEBmPc
X-Authority-Analysis: v=2.4 cv=QOxlhwLL c=1 sm=1 tr=0 ts=69b7a192 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mOGHD44pklf7LAQ1MEsA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: Fi-S48BFThxKsp_Df8xW6dsy4wbEBmPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0NiBTYWx0ZWRfX/Kqu4xkfC03l
 R/tcpODj4dTuik3tp5tUni36es9blqBiQcDE5UZWDxu63gUe18hLuLVFYK32A/PLLMlNfhih1VH
 ulSjLYWs28l4xV8n5qmVWdf+V3rI4K7VZAL94jKKqq5jm/4rqlnsFWMv6JK4yoqZ7Aj3O2ZeWhJ
 5Mu74oZ2e6zpeGoIEG2wHfvKZFrq3Buv3XeGrRC2uY6MuwFO+ScGjZ/QTRkA6xXRxdOaoctE8aG
 q4ggAEfPKsXzO86wc5XfXRCuDZujzETAEqaPMUvNxX7Lq7pTavDRrk9odJr+i8TrVWAiKwh7KXj
 tvCC/v7C0f7L+71BSXoD6NpL9u2W5MZ2YfxAMt27PI1v7aXXDmGhhr3iP6XzOFewnGTT6/ILEcg
 6gNhdOo+oDEbKrzcIH276nQrnqIJDZ22U95k+FXe3RJ2Wfittj9mJLEsdk7Ki8Rjled/xx8vagj
 gcoquap60cTYKxa6XoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160046
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55844-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 837B02950FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/13/2026 3:24 PM, Konrad Dybcio wrote:
> On 2/13/26 7:04 AM, Sachin Kumar Garg wrote:
>> Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
>> Encoder will choose appropriate quantization parameter and
>> do the smart bit allocation to set the frame maximum bitrate
>> level as per the Bitrate value configured.
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
>>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
>>   .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
>>   .../platform/qcom/iris/iris_platform_sc7280.h      | 202 +++++++++++++++++++++
> 
> Is this really only available on 7280?
> 
> Konrad

Yes Konrad, in this series we enable V4L2_MPEG_VIDEO_BITRATE_MODE_MBR 
only for SC7280 because currently, we have added the support only for 
low tier chipset. MBR rate control aims to improve the compression 
efficiency of encoder for static and low motion scenes for extremely low 
bitrate use-case.

Thanks,
Sachin


