Return-Path: <linux-media+bounces-40714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 630F6B30DFA
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 07:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF1606889C0
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 05:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338722D46C8;
	Fri, 22 Aug 2025 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SviNHeyD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD544B661;
	Fri, 22 Aug 2025 05:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755840582; cv=none; b=cAIthSg/4N/gqR9Z5Mva725+OHfwzhVfAq9Bjnu8gAxzz5rnsgXd96kTAsrrtx6+Em9/5f/XPqNhKDSR3phO2h8VM1j2xjjWSyq9UnT9LPI1Uf0J87pndPLRp00HNHOtchQ1A/WQdVuTJm8Mgy7KtmEPIfyv+7AhfS5h60DdKBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755840582; c=relaxed/simple;
	bh=34Wicx5fiqySh4vcbwHKLgw38TXxHzyUyeFT3n/7A2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YbvRXeoobdn+jUsWukUGFE9Ls56lzIpqyqyQWHVQ82rzlkqH8Wuaooxh9o+sdpx245XBseYeOqJYWR91GPOpdVJvzmA8icXSFRJiDDMekdoZjeSun3pmLp+GLosazL9rlPii+hd1nZA+Gb+xheB2MBOIlTMIAOOOvZBQKHBvvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SviNHeyD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI94uv003022;
	Fri, 22 Aug 2025 05:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GjN8tcpqQR7ngN/208vaK7sSHrIqTJw0swa0+U/r4TQ=; b=SviNHeyDRZ51mI3i
	EbS8NBK9fryyoe4cKQ7Ay1R9rRlMwq7PjKbQ2j6QrZ1lMNfKb9NgJLIBEzAnl+4/
	uNWflwscJoCIIw/Ga3+vOm29N+9kFgzz7TUZ2OEgU62D+4in1MwRY8MrHuX0U7T7
	T3f0RXcABiLFsUGYiq8Pk6r99NcKHIyKKZqVQhvQCY7I75Aauynepyx1NSF0yl+T
	Lm39IDI3Dw3gwcTy1cj2b0loUQSE4qoYBhGGmG9ymv9qXGd4WYNSuzKFrgIxKpKb
	3Uc08gVWwWyG96xernN09/nvYh6yQdx7+l2h4SmDasq9WdenEEArBp6fDxL7RNbD
	ojy5Jw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5297x0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 05:29:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M5TXrV009617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 05:29:33 GMT
Received: from [10.50.10.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 22:29:30 -0700
Message-ID: <567f7007-12b1-ecf9-30cc-11fe9e90af39@quicinc.com>
Date: Fri, 22 Aug 2025 10:59:27 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] media: iris: fix module removal if firmware download
 failed
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250820-topic-sm8x50-iris-remove-fix-v1-1-07b23a0bd8fc@linaro.org>
 <6c93b790-6d84-aec5-5b4d-2584d249f74e@quicinc.com>
 <802b5a3c-15c7-4291-8e3e-e598b5587fb8@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <802b5a3c-15c7-4291-8e3e-e598b5587fb8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RQquNLQIQSg_prhf40Tv8TcbcjvIdXml
X-Proofpoint-ORIG-GUID: RQquNLQIQSg_prhf40Tv8TcbcjvIdXml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8snhT1ZZuBf8
 ngM4vdCEW8Ix/kD8GpBmDIZo+4tu0IuwDIcR4kcxxcwsm/GJB7DvTM5BbnJWrUdjfN0LwWGZdkI
 9LB+/9Nrg//kvfv3Jd+oc+4aprBjZ0f1I3lnM/azq+TFMAUVP5EJZYzWGAasOAN3NHbIgQXZv5V
 ea4yIK0Vhp152fBMJHDof8bBobyEcw64hwnpfuZHwXDn1nO/eo0BtfTwzV4ldC4XI1/U0BmRq3G
 dt6x8G0qzmiu5eA2rKfQXWaqEqFJ79W1GuUo15LXA2lFebqvCthrBcIdU7YX73BY+k7cjHOjJWY
 tzUtDbygd67hQBbATIYGPNiq3kiMZ3fqi5ignlqozAro9nvwyS4YK0LxAYxCKqt0QWckc2JkN2q
 dSoFvgVKRqwlyo5wF0Nw5eT+BExlXw==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a8003e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=Azs14qeiMlSh3algld4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/21/2025 5:57 PM, Neil Armstrong wrote:
> On 21/08/2025 11:42, Dikshita Agarwal wrote:
>>
>>
>> On 8/20/2025 10:36 PM, Neil Armstrong wrote:
>>> Fix remove if firmware failed to load:
>>> qcom-iris aa00000.video-codec: Direct firmware load for
>>> qcom/vpu/vpu33_p4.mbn failed with error -2
>>> qcom-iris aa00000.video-codec: firmware download failed
>>> qcom-iris aa00000.video-codec: core init failed
>>>
>>> then:
>>> $ echo aa00000.video-codec > /sys/bus/platform/drivers/qcom-iris/unbind
>>>
>>> Triggers:
>>> genpd genpd:1:aa00000.video-codec: Runtime PM usage count underflow!
>>> ------------[ cut here ]------------
>>> video_cc_mvs0_clk already disabled
>>> WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#1:
>>> sh/542
>>> <snip>
>>> pc : clk_core_disable+0xa4/0xac
>>> lr : clk_core_disable+0xa4/0xac
>>> <snip>
>>> Call trace:
>>>   clk_core_disable+0xa4/0xac (P)
>>>   clk_disable+0x30/0x4c
>>>   iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
>>>   iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
>>>   iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
>>>   iris_vpu_power_off+0x34/0x84 [qcom_iris]
>>>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>>>   iris_remove+0x20/0x48 [qcom_iris]
>>>   platform_remove+0x20/0x30
>>>   device_remove+0x4c/0x80
>>> <snip>
>>> ---[ end trace 0000000000000000 ]---
>>> ------------[ cut here ]------------
>>> video_cc_mvs0_clk already unprepared
>>> WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#2:
>>> sh/542
>>> <snip>
>>> pc : clk_core_unprepare+0xf0/0x110
>>> lr : clk_core_unprepare+0xf0/0x110
>>> <snip>
>>> Call trace:
>>>   clk_core_unprepare+0xf0/0x110 (P)
>>>   clk_unprepare+0x2c/0x44
>>>   iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
>>>   iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
>>>   iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
>>>   iris_vpu_power_off+0x34/0x84 [qcom_iris]
>>>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>>>   iris_remove+0x20/0x48 [qcom_iris]
>>>   platform_remove+0x20/0x30
>>>   device_remove+0x4c/0x80
>>> <snip>
>>> ---[ end trace 0000000000000000 ]---
>>> genpd genpd:0:aa00000.video-codec: Runtime PM usage count underflow!
>>> ------------[ cut here ]------------
>>> gcc_video_axi0_clk already disabled
>>> WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#4:
>>> sh/542
>>> <snip>
>>> pc : clk_core_disable+0xa4/0xac
>>> lr : clk_core_disable+0xa4/0xac
>>> <snip>
>>> Call trace:
>>>   clk_core_disable+0xa4/0xac (P)
>>>   clk_disable+0x30/0x4c
>>>   iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
>>>   iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
>>>   iris_vpu_power_off+0x48/0x84 [qcom_iris]
>>>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>>>   iris_remove+0x20/0x48 [qcom_iris]
>>>   platform_remove+0x20/0x30
>>>   device_remove+0x4c/0x80
>>> <snip>
>>> ------------[ cut here ]------------
>>> gcc_video_axi0_clk already unprepared
>>> WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#4:
>>> sh/542
>>> <snip>
>>> pc : clk_core_unprepare+0xf0/0x110
>>> lr : clk_core_unprepare+0xf0/0x110
>>> <snip>
>>> Call trace:
>>>   clk_core_unprepare+0xf0/0x110 (P)
>>>   clk_unprepare+0x2c/0x44
>>>   iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
>>>   iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
>>>   iris_vpu_power_off+0x48/0x84 [qcom_iris]
>>>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>>>   iris_remove+0x20/0x48 [qcom_iris]
>>>   platform_remove+0x20/0x30
>>>   device_remove+0x4c/0x80
>>> <snip>
>>> ---[ end trace 0000000000000000 ]---
>>>
>>> Skip deinit if initialization never succeeded.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_core.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c
>>> b/drivers/media/platform/qcom/iris/iris_core.c
>>> index
>>> 0fa0a3b549a23877af57c9950a5892e821b9473a..8406c48d635b6eba0879396ce9f9ae2292743f09 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
>>> @@ -15,10 +15,12 @@ void iris_core_deinit(struct iris_core *core)
>>>       pm_runtime_resume_and_get(core->dev);
>>>         mutex_lock(&core->lock);
>>> -    iris_fw_unload(core);
>>> -    iris_vpu_power_off(core);
>>> -    iris_hfi_queues_deinit(core);
>>> -    core->state = IRIS_CORE_DEINIT;
>>> +    if (core->state != IRIS_CORE_DEINIT) {
>>> +        iris_fw_unload(core);
>>> +        iris_vpu_power_off(core);
>>> +        iris_hfi_queues_deinit(core);
>>> +        core->state = IRIS_CORE_DEINIT;
>>> +    }
>>>       mutex_unlock(&core->lock);
>>>         pm_runtime_put_sync(core->dev);
>>>
>>
>> The iris_core_deinit() API should ideally not be called when core->state is
>> in IRIS_CORE_DEINIT. Better to handle this check in the caller itself.
> 
> Checking core->state in iris_remove() won't be protected by the core->lock,
> so the check and call to iris_core_deinit() should be done _after_
> unregistering
> the v4l2 devices to make sure there's no more users of core.
> 
> As you want, I think my approach is simpler and don't change the state if
> already in deinit state.

Agree.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

> 
> Neil
> 
>>
>>> ---
>>> base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
>>> change-id: 20250820-topic-sm8x50-iris-remove-fix-76f86621d6ac
>>>
>>> Best regards,
> 

