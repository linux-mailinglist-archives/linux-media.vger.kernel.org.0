Return-Path: <linux-media+bounces-64180-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TJn/JcixJmofbQIAu9opvQ
	(envelope-from <linux-media+bounces-64180-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 14:12:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EA8656021
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 14:12:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kJ8GQ3tg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B05Ywc79;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64180-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64180-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B1A43050A41
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 12:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771E13783DE;
	Mon,  8 Jun 2026 12:09:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A391E5B63
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 12:08:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920541; cv=none; b=ILhD1JDwDFchn//bEVb/0jUNxS03E1H/IvWhFoYei0Uy3VhTLHjpEbF+VBAMuI2v6JaBNMyJVmmiH/7x0NR0B1MUGnYMhc+eE1lw5BsovVtN0DWxUnJzNCLxv3LjKXldEgTCS/IvxHg/sWIC30d5hGEUzSWlp0yIIIQHmX5Ied0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920541; c=relaxed/simple;
	bh=XiYzvzrRYBA/JuO/QX1C2PuSDfSlMv273Z2HFb4Zwn8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jfYakO2NFBOPGIttgM0pEAeZsP/zjP+QF80iFiIUV1z+XSr/wZ+YSd09DQqKpaMPfPs1Pplj1qRkycFhpFGZfcEg3pomc36OHko5/brm19DohjptQ1FZBz6/S00//81dYA3HFSGYuZJb5JTMO/MNAUSdf6wTuP3X8rXw06svSYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJ8GQ3tg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B05Ywc79; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BC0R93487388
	for <linux-media@vger.kernel.org>; Mon, 8 Jun 2026 12:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=; b=kJ8GQ3tgWSIXFx5V
	KaDA7I/oOXBKaOphO2BEwWl4O43NK6C5fXG5css4cuSRahXZQSJ7M6LWA277yIDd
	vbFE/fQlTgh0DwkBIeMjVSxKWJZwTKhNd2cGt3LYOQWetGsihMiFA674NBDuGdCn
	T2CmXqOpD8SBQVd3uM2A/tB1Q81u1AgfC7zhS19jaFSef5M3RcfoqzgvFgSXzL3u
	rxPnzF+YFcDvyPHfZmKGAab09QR2AlL/UuW3hjvycuKtOUubr7pKL9dgJXEnOty2
	3j572mDq302uwdlBIPUzM9FwVws0EnmW5cTyWuN+wu2R4kaF6A2RjTNYf8Nd5UCT
	fGYTMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmrfv14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 12:08:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c1e08848so59178115ad.0
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780920537; x=1781525337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=;
        b=B05Ywc79KY3V9P+NLPC3WSuENgYyZrOnUxpXLRK0HW/SabHTJpmUbQ4nJ4OvfXvO9n
         4/RtgXaUy/bRBR+CML0KfE8l4SW0lFoN7Gm/z3v93nWYMvCQNPixTjyBWQL7bwnqFCa4
         22nFh64n8QCrbg2HRgYzaJb6dDFG8+HvKFg4u6tbx/VyXlxYzf3c41r4TEXf0DMXf5wY
         RG53/7QrEiA63dMXQc0frQfVHIFbpgTJ2Jg3ITS+yn9JXxXl6TokDHrgcRpR7N1YGs7M
         4zvdVyPy2JikIr6VVfT+OTd4dbhx4wTPPYzLQBqRsQ6ah0ASk08pv54isw1u2znLOiXc
         uJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920537; x=1781525337;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1bf8K6eKadkefRImKNtRwUweNjPVdl7MQY80nf/beo=;
        b=ZpJXcM/kGDG4PiFm6WOqwGRhKN+BRSfOe+bceK1CHUhOsfD4gJGbsf0avHXu9L2CK9
         8sZjopkFbzxM2gBC2QlJNYJ7gF12pz4wuHuE6bsdvg6qYMgrqPega2T3N8O310vEA1xU
         07rAMhOOIuHUskOOcokoEM2FzAB5mC863KBkU6vNy2GFAetVir4b7QpIsRa90HG2aW31
         ie+MQaHFyNfPm3jtREXxOUrgz0hKMf8I05hmYEr/CV1SeFgQzMI1g/pKrizVSjs14hzy
         Rk0R1e1cv3gxJaEtvZ5bMHJ7caPzMLNgVHwQ4jxQ5I3EeJAb1BOXPmf40n4/iuczZgdQ
         9vog==
X-Forwarded-Encrypted: i=1; AFNElJ+KHmRRQcg7jnaU94jXWGm4KZT8jB8bAryKud2TGqlv2FHKPAJWwJot7H5xRH8K5qsJZB7c24dbineHZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypsCHI2AquyLseGVws1gwSXeDyAG4BHF7mRhgZslPKBh25hdzF
	+d8zCnhkUxT+qalZ2m60XGwfLZWeUs6TmdjvtIV1BvNWTcHC0iNhQb3nAgI5H8ufEHXWEvsRuKb
	9ATtTiJP1MhaewT95l5hoVJA0Egug8yl0nEvrLHw7sErI8BN1rV5YoJX2QPlXBJbotQ==
X-Gm-Gg: Acq92OFb41jcOJ566Rrx2Pm2ptZsnYYKxsvvCMvqBp3rIcVofFf+X1V7DtfU1euPpr2
	bLh5571dGC8Z8I6W5ve4mwWirngZymCWhJpQM5WDt/H42jbWBUGOJXc+JbtQOwZ799LRJ5xiEiA
	aqNmwXyNIZV55wxJkeMvvi2KKRRsYR5An6ZT0fKigVFtfQp1UfHUcm5imB+rTvufUCly0O5lwn3
	stpPcIQY/BLUiXQvec8Pekblro0eIMkppr4X4K2Unhrk6U1JO+EcKDCnIk66ldEDo02R/E/UAYT
	k2oq0xSJNDU1Jzaih1srX10TfJTR9OjquMi+qGA40yn+3ZPn+Bz3t7IWB7iDlgwYQhJtokVIcsz
	NNm1KmyvHaNH7lliuVpdBfBuoTS9DEgZ/IXmqAqNuNGD7u9eTOxrbA8wub8bZC16b
X-Received: by 2002:a17:903:1ac5:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c28659dc9bmr20889385ad.14.1780920537309;
        Mon, 08 Jun 2026 05:08:57 -0700 (PDT)
X-Received: by 2002:a17:903:1ac5:b0:2c2:8659:da2c with SMTP id d9443c01a7336-2c28659dc9bmr20888535ad.14.1780920536563;
        Mon, 08 Jun 2026 05:08:56 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm183538985ad.80.2026.06.08.05.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 05:08:56 -0700 (PDT)
Message-ID: <b10d6220-08d4-bcef-44c3-6bd2c1e096bb@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 17:38:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 07/12] media: iris: Add power sequence for glymur
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
 <20260603-glymur-v7-7-afaa55d11fe0@oss.qualcomm.com>
 <g5fpxwtlajz4p6gn55pjtgb2czjkbjyjlii2zkznle6lbtdgzb@zsiafc57gaco>
 <b9a11d38-13f7-ee33-0537-2557050afdfa@oss.qualcomm.com>
In-Reply-To: <b9a11d38-13f7-ee33-0537-2557050afdfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExNSBTYWx0ZWRfXxI4DIVz34HRY
 hzK/z6meMy78z5/irSs/wry3XQbuS6BYEiY3s2GN8FfaK4nb36pa8BQpbqaZ2PrzDAvTFvmPCKL
 LBRS9wKlNgw7J8/VEnBIhCtXyWiNx69R6duLk30yIfK47guU6a6Dh/cOvxCu/VgYwUbK4DYdyR/
 ZElc/pImW0Kf+LKxCXHw6PaPWwHoM4j5CbNbbxUYhGroD4AhplPdO4hr73XyYsY7Qug+paveg3Y
 7ExWzlR+Pt49fkqupGD9yEzAm5547kmNHHJZePW8FGK7juzMiI1s+cuzzHJUHyU0r0GGDOZ0zRc
 M3wVp+XvcIPbIjR38pYZ9W4Ua3FFc9hlPsCXMGAWpIfwBnbPSOs6Z/R38WID7WbA6M6hUi9wmL1
 yeH7OU8r5ZbNJyG+fYgL8ZSyJWaZG5H/gI4wf5i+2hMaJItpGqiU08Y7rU+CI+gpHwRHkqXCu+Q
 9AIB8eryu6RAwUZMHng==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a26b0da cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zzk4QuvOVKE_xORUXiEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: p3uF893TpkMFskfdS6gxLXmnV_NH2_qO
X-Proofpoint-ORIG-GUID: p3uF893TpkMFskfdS6gxLXmnV_NH2_qO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-64180-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com,vger.kernel.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1EA8656021


On 6/8/2026 11:09 AM, Vishnu Reddy wrote:
> On 6/8/2026 3:17 AM, Dmitry Baryshkov wrote:
>> On Wed, Jun 03, 2026 at 07:48:45PM +0530, Vishnu Reddy wrote:
>>> Glymur platform has two video codec cores: vcodec0 and vcodec1.
>>>
>>> Both cores share a common clock source (video_cc_mvs0_clk_src) and the
>>> same power rails. The clock dividers between the source and the branch
>>> clocks are fixed. So when both cores are running, the source clock always
>>> runs at the highest frequency requested by either core.
>>>
>>> Since both cores share the same power rails, the power corner cannot be
>>> voted independently. Scaling one core's power corner up or down would
>>> directly affect the other, leading to under or over-voting.
>>>
>>> For these reasons, both cores should voted the clock and power rail must
>>> be based on the workload of both cores.
>>>
>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 111 ++++++++++++++++++++-
>>>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>>>  .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
>>>  3 files changed, 117 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> index 7cda94601555..f07eaf4b3be2 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>>> @@ -17,14 +17,14 @@
>>>  #define NOC_HALT				BIT(0)
>>>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
>>>  
>>> -static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>>> +static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core, u32 pwr_status_bit)
>>>  {
>>>  	u32 value, pwr_status;
>>>  
>>>  	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
>>> -	pwr_status = value & BIT(1);
>>> +	pwr_status = value & pwr_status_bit;
>>>  
>>> -	return pwr_status ? false : true;
>>> +	return !pwr_status;
>>>  }
>>>  
>>>  static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>> @@ -32,7 +32,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
>>>  	u32 reg_val = 0, value, i;
>>>  	int ret;
>>>  
>>> -	if (iris_vpu3x_hw_power_collapsed(core))
>>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>>  		goto disable_power;
>>>  
>>>  	dev_err(core->dev, "video hw is power on\n");
>>> @@ -78,7 +78,7 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
>>>  	u32 count = 0;
>>>  	int ret;
>>>  
>>> -	if (iris_vpu3x_hw_power_collapsed(core))
>>> +	if (iris_vpu3x_hw_power_collapsed(core, VCODEC0_POWER_STATUS))
>>>  		goto disable_power;
>>>  
>>>  	dev_err(core->dev, "video hw is power on\n");
>>> @@ -221,6 +221,98 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>>>  	iris_vpu33_power_off_hardware(core);
>>>  }
>>>  
>>> +static void iris_vpu36_power_off_vcodec(struct iris_core *core, u32 core_id)
>>> +{
>>> +	u32 value, i;
>>> +	int ret;
>>> +
>>> +	if (iris_vpu3x_hw_power_collapsed(core,
>>> +					  core_id ? VCODEC1_POWER_STATUS : VCODEC0_POWER_STATUS))
>>> +		goto disable_power;
>>> +
>>> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>> +	if (value)
>>> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
>>> +
>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>> +		ret = readl_poll_timeout(core->reg_base + (core_id ? VCODEC1_SS_IDLE_STATUSN :
>>> +					 VCODEC_SS_IDLE_STATUSN) + 4 * i, value,
>>> +					 value & DMA_NOC_IDLE, 2000, 20000);
>> Unreadable. Extract register addresses to separate variables.
> Ack
>
>>> +		if (ret)
>>> +			goto disable_power;
>>> +	}
>>> +
>>> +	writel(core_id ? REQ_VCODEC1_POWER_DOWN_PREP : REQ_POWER_DOWN_PREP,
>>> +	       core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS, value,
>>> +				 value & (core_id ? NOC_LPI_VCODEC1_STATUS_DONE :
>>> +				 NOC_LPI_STATUS_DONE), 2000, 20000);
>>> +	if (ret)
>>> +		goto disable_power;
>>> +
>>> +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>>> +
>>> +	writel((core_id ? VCODEC1_BRIDGE_SW_RESET | VCODEC1_BRIDGE_HW_RESET_DISABLE :
>>> +	       CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE),
>>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +	writel(core_id ? VCODEC1_BRIDGE_HW_RESET_DISABLE : CORE_BRIDGE_HW_RESET_DISABLE,
>>> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
>>> +
>>> +disable_power:
>>> +	dev_pm_genpd_set_hwmode(core->vcodec[core_id].dev, false);
>>> +	iris_disable_power_domain_and_clocks(core, &core->vcodec[core_id]);
>>> +}
>>> +
>>> +static void iris_vpu36_power_off_hw(struct iris_core *core)
>>> +{
>>> +	u32 num_cores = max(core->iris_platform_data->num_cores, 1);
>> Can we trust the patch authors that VPU3.6 hardware data will have at
>> least 1 core?
> On Glymur (VPU3.6), num_cores is 2. The max() guard is unnecessary.
> Will access num_cores directly.
>
>>> +	int i;
>>> +
>>> +	for (i = 0; i < num_cores; i++)
>>> +		iris_vpu36_power_off_vcodec(core, i);
>>> +}
>>> +
>>>  #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>>>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>> Lowercase hex.
> Ack

Just now I found that this change is not part of this series.
Can I take this into separate post?

>>>  #define REQ_POWER_DOWN_PREP			BIT(0)
>>> +#define REQ_VCODEC1_POWER_DOWN_PREP		BIT(1)
>>>  

