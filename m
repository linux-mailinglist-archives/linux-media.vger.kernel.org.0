Return-Path: <linux-media+bounces-61153-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPHUGpYDAmrknAEAu9opvQ
	(envelope-from <linux-media+bounces-61153-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:28:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B83AC512207
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3156A3300862
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 16:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A55042EEC1;
	Mon, 11 May 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I0ekfSPF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEShGxrk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045C0426680
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516116; cv=none; b=qtlWExFxi2ZnuIIR3Frt/mojIJCiM/8x22qvDVsQTSbM3rsdG6TWhHGr7TSKZ+oTIIbTDCAcjuN6tV0rgFu90bwi+XPltBIKokM6W+LNUDK46rS2KoBssPsAvPcyLstx9xpnUcC3yFkZq57rWXbLI3zIgN/RCy316NsmvlkkzJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516116; c=relaxed/simple;
	bh=x+sJrku8s3QgciMXY/IRx7C2pgzlluK+65eSpkFdW7c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FCSRsL2aITJSftXZkV48iP3dvjDdouH/SVkCF/WLHXn87X5KvyldAj1oo3SeEoBQyZt7EscdmGXZ9nwBJlZHAYF5HgYDeMVssSf+r6pmoczun8wJ3zzPjP3bgR3xAnaxYGiRKIOwjtV82hUtlvzXTaURC9MMH8Si6syU7yaPeno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I0ekfSPF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEShGxrk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BFTfcW653932
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 16:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWkP+IVA7pVC0A2xSTUNH7ulm8FtAGcJkIxrdpM/PJw=; b=I0ekfSPFjlE0/XeN
	UCXhq4T9g7JmRHztNzjqx/CxemagIeX401LFxOi3Nzi6I67pL69PzkVaDZq5hZ27
	JM6kjO8wlZVFxo3BSdzHigO8d+fMQ0H3pWVJ1D+mEn3ng4jmD2j0iLC351tTqEJi
	vICHhdRN5O8w5tfqIOdm/kJzVHgSdMeQ5ClQy557fKHHVT58xr8qSfGlrFFI+KKp
	6gSlYG4kbsWN76/tviOuhDNmkJ493DFKW1IE0mjZYbli/dt/Ti7UXYu8cl68i2YT
	Pe1SW/GbrKkz0GKoXag4aq/t1AOCujuxXx3dQF5jC6EPRwG9DyCX0MOat9lLwv6F
	KzSSkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xuaqpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 16:15:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4530a90fdso111286435ad.1
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778516113; x=1779120913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zWkP+IVA7pVC0A2xSTUNH7ulm8FtAGcJkIxrdpM/PJw=;
        b=kEShGxrka1lVhySuSmxOyLFB3TwuI8a4hSupp2E+liUcZDJUAcn07hwfT9+h4sBk8C
         c2J0WKLf/D0+u/3+QaMXr/PDlMg1SE2BStIGSs4Nt7R5ZTyPimd0yJuQwI1u6iJVe5tt
         +J39XwNIbVn0PkIxKCUJwrbOBGaQEPJf4WQqik1HSTww5VrkBSkJl9A3PMSdvL3F4VSi
         8+n4onGDtFJ34ikZf2NA1XA3gfksuUwC3x8wgZDgOujChMcKJrZ2NieyCO/iPoGGkn2r
         1rLlrzN6a9xnce4LEzIDUE4SJ9astenwfHwwFOEfuGPn3iTm7cRHN3wCHMfDVPCq7mP5
         bVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516113; x=1779120913;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zWkP+IVA7pVC0A2xSTUNH7ulm8FtAGcJkIxrdpM/PJw=;
        b=bi5a6oasLsaU7iX3C0rMJFDBnDLWk+2q+u6rZMusyZM/ZwJe4e5rsB0VlRJi1waw3c
         tfa7KTTc7RoDHlbxlqRs9Hq4SqHkmOV3vyz+a00nPEtElCBiF+gm/B0EobSfADMLXzH0
         NxOlldM/BrDyprObxvtuVckSHCyvo0P7vC42tXX+dUwiO9Pn9Ls67Km5fgy9DQToQEZ3
         iBB72bEqM5WA1Lu3+umhG5NdFO5ROjU8+1xNRnQGMqP4086ghwppUlGcJhlXaqAvjouz
         KlLpGz4CEF4FjpI5g0WN8T331CNarQrP1PcztzHetoBlkLGTp8qTES2EazR61TwS2XOA
         o6LA==
X-Forwarded-Encrypted: i=1; AFNElJ9/GDCCPLolu49nXU0knt+J41Gx95kwLu8pGqBRsjzbmgVXf5qaznNAX0BulHai0zNG7wrHm4uHsors5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwEqK6GIEdqsxfH6VgM1W2upD6xCn6WPFgGPk6BIJK0BUFCRYv
	e3DTBKxaYYFTeLR9gv+Blei1pGq+MUjuLRL61w7z2//Q2kmU+uL0jV+iIdMyG8hjrAJOz7WgzwH
	ZjivyTUWqVH4TSbZDSBaMGZEpdbVDS9GNN0nrd/2g1bJX0j+h8O2x7J+WOr2VL4kTXQ==
X-Gm-Gg: Acq92OFSt7boTKls2eKlm9G9kX80iHKTnshhKneaO44/tnHeE8D6jF1P5uEVwAtf330
	bYCw8ZaojSFZf9IDzVS9a3C8Pn4g5yCvaMRDD5nXajM1QpxdPOcOILB72vYBR8WH1iuipAISe3v
	toh7iLHrmJy33SoiRzGAziMN6EPNtH6htxP+ttN2nEoFz9/zj+u2dFSi51NjbtKNzHxL60Gl6y/
	UEXseSaJG/BEV6iz8t51mm4HEju5CkYu52O6up4mxvZkzG0s9K7d4/VL0i/TKH6Kctb1/qLE2sm
	1t7LtR/vZNaSPWLM7WvnQuwXhvvJOlzjHml193mq76oQ8Xf6qWMuUSjsIlCwWe/gV5wKf8MwMg7
	Oe7LS9zYTERIMpTdU8/fP46SGGejPaoLfy6xCKMXOeKVuUMg2s7lCDA==
X-Received: by 2002:a17:903:1ab0:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2ba7a34b378mr274223035ad.33.1778516112789;
        Mon, 11 May 2026 09:15:12 -0700 (PDT)
X-Received: by 2002:a17:903:1ab0:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2ba7a34b378mr274222475ad.33.1778516112114;
        Mon, 11 May 2026 09:15:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ecc4bbsm105532675ad.84.2026.05.11.09.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 09:15:11 -0700 (PDT)
Message-ID: <b6dc6b32-26ad-6f2e-dfd4-551e7fd0481e@oss.qualcomm.com>
Date: Mon, 11 May 2026 21:45:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
 <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
Content-Language: en-US
In-Reply-To: <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a020091 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C8oSwA0Y8qkr12hsufMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE3NCBTYWx0ZWRfX6LVLsbcYjvER
 6TJxyuxz92ok/hkhR3JNxZNQyUL+K33hifpRvFY99Ui0rb1IXtN68ZZlN+RQBnoLDwu6m7inkgf
 fdHn5jY510pHeP1YkdLkxJRJaxsUlQWb4LxrVfzzaNENEmcxrgqwi+skSdajXR/QBr8mBzzcWSx
 MLSCs54kevqxQx6HLvSsuxHAlCAAMPaAyOSUvYYjIzbyR7YS/7bCo0IkHVueGUG6Z5SIuQkuxvF
 w++gFk+kc/UeohVUsRAPHpVxnmj86M4qVfAnxricvBRQ6LccEnEvGsvsvmL/DjP4xQZ7dUi+sAs
 +1lzYzmkF7lGBQBbT8FWwJihewVBxm1KitmZ4coXcnZ0I/s9HMX5z4OgrBnjC8uDZtI7j1if4f0
 Ftu+7c6YKs1oDqRD2qqEO3hyjO4KfGRcgwNJr08qDOCNZknlFkiRxLWlDpzBH/6V1yf6Xi6PdmG
 YpxJ3wA/4C2SKqEiNpg==
X-Proofpoint-ORIG-GUID: FGt-ujaYWopzdXk11KUL6g_tuT7I2pPK
X-Proofpoint-GUID: FGt-ujaYWopzdXk11KUL6g_tuT7I2pPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110174
X-Rspamd-Queue-Id: B83AC512207
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61153-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/9/2026 2:35 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
>> On glymur platform, the iris core shares most properties with the
>> iris core on the SM8550 platform. The major difference is that glymur
>> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
>> one. Add glymur specific platform data, reusing SM8550 definitions
>> wherever applicable.
> This leave me in confusion. Having two cores, each with its own set of
> clocks and pm domains, I'd have expected that each core scales
> independently. I.e. if the load is pushed to the core0, it requires
> core0 clocks to go higher (while core1 clocks can stay at the low freq).
> Or, at least, the clocks would be set to the frequency corresponding to
> the max of the workloads (if for some reason the cores should stay in
> sync).
>
> However, I don't see it in the code. All clocks and all power domains
> seem do be scaled using the common workload. If my assumptions were not
> correct, please explain it in the commit message.

The OPP core logic sets the rpmhpd level and clock rate based on the OPP table
defined in the DT node, where the clock frequency and power rail level are
tightly coupled together. Since vcodec0 and vcodec1 share the same power rails,
independently scaling one clock high while keeping the other low is not
straightforward within this OPP framework.

Do you have any suggestion on how best to handle per core independent clock
scaling within these constraints?

>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>>  .../platform/qcom/iris/iris_platform_common.h      |  5 ++
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
>>  .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
>>  .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
>>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>  6 files changed, 223 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
>> index 79bc67980339..adb970b3a3af 100644
>> --- a/drivers/media/platform/qcom/iris/Makefile
>> +++ b/drivers/media/platform/qcom/iris/Makefile
>> @@ -11,6 +11,7 @@ qcom-iris-objs += iris_buffer.o \
>>               iris_hfi_gen2_response.o \
>>               iris_hfi_queue.o \
>>               iris_platform_gen2.o \
>> +             iris_platform_glymur.o \
>>               iris_power.o \
>>               iris_probe.o \
>>               iris_resources.o \
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 502d7099085c..2003b7186480 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -30,6 +30,10 @@ struct iris_inst;
>>  #define DEFAULT_QP				20
>>  #define BITRATE_DEFAULT			20000000
>>  
>> +#define VIDEO_REGION_SECURE_FW_REGION_ID	0
>> +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
>> +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
>> +
>>  enum stage_type {
>>  	STAGE_1 = 1,
>>  	STAGE_2 = 2,
>> @@ -41,6 +45,7 @@ enum pipe_type {
>>  	PIPE_4 = 4,
>>  };
>>  
>> +extern const struct iris_platform_data glymur_data;
>>  extern const struct iris_platform_data qcs8300_data;
>>  extern const struct iris_platform_data sc7280_data;
>>  extern const struct iris_platform_data sm8250_data;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 5862c89a4971..d11c9d1ce6b1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -12,6 +12,7 @@
>>  #include "iris_vpu_buffer.h"
>>  #include "iris_vpu_common.h"
>>  
>> +#include "iris_platform_glymur.h"
>>  #include "iris_platform_qcs8300.h"
>>  #include "iris_platform_sm8650.h"
>>  #include "iris_platform_sm8750.h"
>> @@ -931,6 +932,104 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>>  	BUF_SCRATCH_2,
>>  };
>>  
>> +const struct iris_platform_data glymur_data = {
>> +	.get_instance = iris_hfi_gen2_get_instance,
>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>> +	.vpu_ops = &iris_vpu36_ops,
>> +	.set_preset_registers = iris_set_sm8550_preset_registers,
>> +	.init_cb_devs = iris_glymur_init_cb_devs,
>> +	.deinit_cb_devs = iris_glymur_deinit_cb_devs,
>> +	.icc_tbl = sm8550_icc_table,
>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>> +	.clk_rst_tbl = iris_glymur_clk_reset_table,
>> +	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
>> +	.bw_tbl_dec = sm8550_bw_table_dec,
>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> +	.pmdomain_tbl = &iris_glymur_pmdomain_table,
>> +	.opp_pd_tbl = sm8550_opp_pd_table,
>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>> +	.clk_tbl = iris_glymur_clk_table,
>> +	.clk_tbl_size = ARRAY_SIZE(iris_glymur_clk_table),
>> +	.opp_clk_tbl = iris_glymur_opp_clk_table,
>> +	/* Upper bound of DMA address range */
>> +	.dma_mask = 0xffe00000 - 1,
>> +	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
>> +	.pas_id = IRIS_PAS_ID,
>> +	.dual_core = true,
>> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>> +	.inst_caps = &platform_inst_cap_sm8550,
>> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>> +	.tz_cp_config_data = iris_glymur_tz_cp_config,
>> +	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
>> +	.core_arch = VIDEO_ARCH_LX,
>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>> +	.ubwc_config = &ubwc_config_sm8550,
>> +	.num_vpp_pipe = 4,
>> +	.max_session_count = 16,
>> +	.max_core_mbpf = NUM_MBS_8K * 2,
>> +	.max_core_mbps = ((8192 * 4320) / 256) * 60,
>> +	.dec_input_config_params_default =
>> +		sm8550_vdec_input_config_params_default,
>> +	.dec_input_config_params_default_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
>> +	.dec_input_config_params_hevc =
>> +		sm8550_vdec_input_config_param_hevc,
>> +	.dec_input_config_params_hevc_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
>> +	.dec_input_config_params_vp9 =
>> +		sm8550_vdec_input_config_param_vp9,
>> +	.dec_input_config_params_vp9_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +	.dec_input_config_params_av1 =
>> +		sm8550_vdec_input_config_param_av1,
>> +	.dec_input_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>> +	.dec_output_config_params =
>> +		sm8550_vdec_output_config_params,
>> +	.dec_output_config_params_size =
>> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +
>> +	.enc_input_config_params =
>> +		sm8550_venc_input_config_params,
>> +	.enc_input_config_params_size =
>> +		ARRAY_SIZE(sm8550_venc_input_config_params),
>> +	.enc_output_config_params =
>> +		sm8550_venc_output_config_params,
>> +	.enc_output_config_params_size =
>> +		ARRAY_SIZE(sm8550_venc_output_config_params),
>> +
>> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
>> +	.dec_output_prop_avc_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
>> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
>> +	.dec_output_prop_hevc_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
>> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>> +	.dec_output_prop_vp9_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +	.dec_output_prop_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>> +
>> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>> +
>> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
>> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>> +};
>> +
>>  const struct iris_platform_data sm8550_data = {
>>  	.get_instance = iris_hfi_gen2_get_instance,
>>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> new file mode 100644
>> index 000000000000..f16155b7dc99
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
>> @@ -0,0 +1,97 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>> +#include <linux/iris_vpu_bus.h>
>> +#include "iris_core.h"
>> +#include "iris_platform_common.h"
>> +#include "iris_platform_glymur.h"
>> +
>> +const struct platform_clk_data iris_glymur_clk_table[] = {
>> +	{IRIS_AXI_VCODEC_CLK,		"iface"			},
>> +	{IRIS_CTRL_CLK,			"core"			},
>> +	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
>> +	{IRIS_AXI_CTRL_CLK,		"iface1"		},
>> +	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
>> +	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
>> +	{IRIS_AXI_VCODEC1_CLK,		"iface2"		},
>> +	{IRIS_VCODEC1_CLK,		"vcodec1_core"		},
>> +	{IRIS_VCODEC1_FREERUN_CLK,	"vcodec1_core_freerun"	},
>> +};
>> +
>> +const char * const iris_glymur_clk_reset_table[] = {
>> +	"bus0",
>> +	"bus1",
>> +	"core",
>> +	"vcodec0_core",
>> +	"bus2",
>> +	"vcodec1_core",
>> +};
>> +
>> +const char * const iris_glymur_opp_clk_table[] = {
>> +	"vcodec0_core",
>> +	"vcodec1_core",
>> +	"core",
>> +	NULL,
>> +};
>> +
>> +const struct platform_pd_data iris_glymur_pmdomain_table = {
>> +	.pd_types = (enum platform_pm_domain_type []) {
>> +		IRIS_CTRL_POWER_DOMAIN,
>> +		IRIS_VCODEC_POWER_DOMAIN,
>> +		IRIS_VCODEC1_POWER_DOMAIN,
>> +	},
>> +	.pd_names = (const char *[]) {
>> +		"venus",
>> +		"vcodec0",
>> +		"vcodec1",
>> +	},
>> +	.pd_count = 3,
>> +};
>> +
>> +const struct tz_cp_config iris_glymur_tz_cp_config[] = {
>> +	{
>> +		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
>> +		.cp_size = 0,
>> +		.cp_nonpixel_start = 0,
>> +		.cp_nonpixel_size = 0x1000000,
>> +	},
>> +	{
>> +		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
>> +		.cp_size = 0,
>> +		.cp_nonpixel_start = 0x1000000,
>> +		.cp_nonpixel_size = 0x24800000,
>> +	},
>> +	{
>> +		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
>> +		.cp_size = 0,
> Whys is cp_size 0 for all entries?
>
>> +		.cp_nonpixel_start = 0x25800000,
>> +		.cp_nonpixel_size = 0xda600000,
>> +	},
>> +};
>> +
>> +int iris_glymur_init_cb_devs(struct iris_core *core)
>> +{
>> +	u64 dma_mask = core->iris_platform_data->dma_mask;
>> +	const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
>> +	struct device *dev;
>> +
>> +	dev = create_iris_vpu_bus_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
>> +	if (IS_ERR(dev))
>> +		return PTR_ERR(dev);
>> +
>> +	if (device_iommu_mapped(dev))
>> +		core->fw_dev = dev;
>> +	else
>> +		device_unregister(dev);
>> +
>> +	return 0;
>> +}
>> +
>> +void iris_glymur_deinit_cb_devs(struct iris_core *core)
>> +{
>> +	if (core->fw_dev)
>> +		device_unregister(core->fw_dev);
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
>> new file mode 100644
>> index 000000000000..e0d07ccf658c
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __IRIS_PLATFORM_GLYMUR_H__
>> +#define __IRIS_PLATFORM_GLYMUR_H__
>> +
>> +extern const struct platform_clk_data iris_glymur_clk_table[9];
>> +extern const char * const iris_glymur_clk_reset_table[6];
>> +extern const char * const iris_glymur_opp_clk_table[4];
>> +extern const struct platform_pd_data iris_glymur_pmdomain_table;
>> +extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
>> +int iris_glymur_init_cb_devs(struct iris_core *core);
>> +void iris_glymur_deinit_cb_devs(struct iris_core *core);
>> +
>> +#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 34c981be9bc1..78e3627557e9 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -369,6 +369,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>>  };
>>  
>>  static const struct of_device_id iris_dt_match[] = {
>> +	{
>> +		.compatible = "qcom,glymur-iris",
>> +		.data = &glymur_data,
>> +	},
>>  	{
>>  		.compatible = "qcom,qcs8300-iris",
>>  		.data = &qcs8300_data,
>>
>> -- 
>> 2.34.1
>>

