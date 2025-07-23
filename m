Return-Path: <linux-media+bounces-38273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E84C2B0F3FE
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 15:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16A567B8CCC
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 13:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9821E2E7F03;
	Wed, 23 Jul 2025 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fhaHuC2V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6351F2E54A1;
	Wed, 23 Jul 2025 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277298; cv=none; b=KOMYx13G7yTvzaEagA7X+QcHUtWWzK3x7cRTMiYfIASnDlN8jDG2VAXpYHgA2p/mjzqCpG1U6qfb5KR9yroNOjacn6SwaRI3K2kwGAdRxLbfLka2LrtHdHd9nigExz5nDaz3Egt4kBbmFpnNecLNM4pxW1f5+KeprVfP4I2Vuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277298; c=relaxed/simple;
	bh=QyIANA/YmMM91NwDCoF+V1ARjFsotI66Qxoz2mA9wjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CAuBYf8nfs/S/CB+CCwKq93QK2NK4Ydv4Krz4QLQL3MsdiOlqOuPOBH3r8+AUAIkSZ8DIzzBT6+rVJCvVpUfQ4B0cUJmbbQFh5834eyW33HdnVA7B2pdrN/3l+xYSKgu5sceaSjx6oUiAsRX5iNFx/6ZK7+cmBi9C0MUKyZ2AP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fhaHuC2V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9dP43015739;
	Wed, 23 Jul 2025 13:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vc6acNw7VKdUlL2hxIk3Pgcz058l1S3DheUPIX5KL2s=; b=fhaHuC2VkxDqH+Yu
	mJvvNaQecQ3tyg5ysY1/ExXm2cx67+9DyNA3aUhFzE4pLuaeYP+ufAhMEtYrCJEX
	tXjoCpPt3v+av8tfJWc7nNNXNEalZCEzloxy79hCO8BPH+piHbvkp3iNBFswLb28
	9G40CsX3QUCzBlQCviBbcjityn+/80z/UTJMAtAwK2izrqgoCYlcoN1sEXa0ZTPL
	qbjOAcygPgOS7F7/zDMRFVG8NdJ3QqB1MPoBwk7k9pY+rC78aKV6APgA+tPpkuk5
	3oENAV8jTgSLfsGL0zWUl+OEc2LVtZdn+vw3XvHknAkYFxIwTcXZLUevX/MfUidl
	9VjkQg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vbm9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 13:28:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56NDS767028829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 13:28:07 GMT
Received: from [10.231.216.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 06:28:04 -0700
Message-ID: <4f506337-3481-41db-a2a4-5b4676f22eda@quicinc.com>
Date: Wed, 23 Jul 2025 21:28:01 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm64 dragonboard 410c Internal error Oops dev_pm_opp_put
 core_clks_enable
To: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        <lkft-triage@lists.linaro.org>,
        Linux Regressions <regressions@lists.linux.dev>,
        linux-clk
	<linux-clk@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
CC: <quic_vgarodia@quicinc.com>, <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Dan Carpenter
	<dan.carpenter@linaro.org>,
        Benjamin Copeland <ben.copeland@linaro.org>
References: <CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com>
 <ef216301-a7e6-4c9d-9153-8ce8b0a4111f@app.fastmail.com>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <ef216301-a7e6-4c9d-9153-8ce8b0a4111f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 41uk5J6Doifpz8Rljm64WqMWN2v_GWrs
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=6880e368 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=OV94zteYR8qjsgGYDZ0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX4bIXuGom4Gbx
 CmiYBEy/O+sPHd6rheAZ5lNc3INz3HzOdEJkJs7A+J+h2tF6asANepC+/MFJ3kLTEzSPQbbC7pc
 XwpeAZMS5+XCh2mKvB0KMPWPOzctbyvMHTEAQctrSnbwcytVbtUNBbvV03b4Nfpi8fxB49XR/tS
 SGwOGNJu42AVTeisQXTFAd0ZPpL6WfjusnFKWbx5qFvEB8ywyiSjcVMl3a8608OIRCn+fV5DjCt
 IxT+0o3jpN1YQjiQV4EausUfc00yKczD4v96Z5aSTxg12qVs2i6bIOvh3MHlXJiggL0OKwiQe5j
 phELmLB12nKuFnQ9whgikE/CCfXQqkalnZ6TCyjRslHTqegBAKGld0KK6edvTfnTOAxPUoP4KI4
 FL+DntGak+/j6qJBHbgyiWLQG7iKrQ5MAYvQHQ141XITcFODJLC8WIpMEsxdKqmCcUzkwnUo
X-Proofpoint-ORIG-GUID: 41uk5J6Doifpz8Rljm64WqMWN2v_GWrs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230116

On 7/18/2025 7:28 PM, Arnd Bergmann wrote:
> On Fri, Jul 18, 2025, at 13:13, Naresh Kamboju wrote:
>> The following Boot regressions are noticed on the Linux
>> next-20250708with gcc-13 and clang-20 toolchains for the dragonboard
>> 410c device.
>> [   12.629924] x5 : 0000000000000002 x4 : 00000000c0000000 x3 :
>> 0000000000000001
>> [   12.629939] x2 : 0000000000000002 x1 : ffffffffffffffde x0 :
>> ffffffffffffffee
>> [   12.629956] Call trace:
>> [   12.629962]  dev_pm_opp_put+0x24/0x58 (P)
>> [   12.629981]  core_clks_enable+0x54/0x148 venus_core
>> [   12.630064]  core_power_v1+0x78/0x90 venus_core
>> [   12.691130]  venus_runtime_resume+0x6c/0x98 venus_core
>> [   12.817608] Code: 910003fd f9000bf3 91004013 aa1303e0 (f9402821)
>> All code
>> ========
>>     0: 910003fd mov x29, sp
>>     4: f9000bf3 str x19, [sp, #16]
>>     8: 91004013 add x19, x0, #0x10
>>     c: aa1303e0 mov x0, x19
>>    10:* f9402821 ldr x1, [x1, #80] <-- trapping instruction
> It's loading from 'x1', which is an error pointer ffffffffffffffde
> (-EISCONN).  The caller was modified by Renjiang Han (added to Cc)
> in commit b179234b5e59 ("media: venus: pm_helpers: use opp-table
> for the frequency").
>
> The new version of the code is now
>
> static int core_clks_enable(struct venus_core *core)
>   {
>          const struct venus_resources *res = core->res;
> +       struct device *dev = core->dev;
> +       unsigned long freq = 0;
> +       struct dev_pm_opp *opp;
>          unsigned int i;
>          int ret;
>   
> +       opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> +       dev_pm_opp_put(opp);
>   
> Where the 'opp' pointer is the error code and gets passed
> into dev_pm_opp_put() without checking for the error condition.
Thank you for pointing it out.
I have submitted the following patch to fix this issue.
https://lore.kernel.org/linux-arm-msm/20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com
>
>      Arnd

-- 
Best Regards,
Renjiang


