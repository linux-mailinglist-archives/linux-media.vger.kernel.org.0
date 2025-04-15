Return-Path: <linux-media+bounces-30234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6DA89D0E
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 14:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EE09176277
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 12:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F9E2951A9;
	Tue, 15 Apr 2025 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O4fEfEc9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D82F28DF08;
	Tue, 15 Apr 2025 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718541; cv=none; b=m2WFP/zPaWQFqm3s8GDBbaaDEPYEtq0FrxnEuwSHbUxk1be3WMawcNkUFHyWYZwkL7c3pSwJaovUV+PP44Vi5WB9Y6trCS/1gi5qOK1xN1P6sBvH+J6VhYbMX5VHWvDYd25JmoaTxWROaE5mQvo4fMDBtKo5fm+ABEh/Ejta68w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718541; c=relaxed/simple;
	bh=udalSBmGzCGfr8UQ5FZtor/jqnOcT+MZs2j+3RE6im8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eK7CBAMioNLadqwPbiPqDptb+ELOOvoqKQeO6bCKtW6EkQKe9eIbducLirBg0QDwElUIremElugNHSZoosnXO8a3Dlj2YzfnXmOzk0lY8a2RWUF+142hUSodM9l8Zmqcb3n1tyT3jk+hchCom8QyHbOckuwKCtSBk9Jq+n+Rw78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O4fEfEc9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tSP0006072;
	Tue, 15 Apr 2025 12:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqmWgQbMmezRFjQxOdD4+ofxtLhhbuCI5buIA4J3K2s=; b=O4fEfEc98pWJGzUO
	i4OyvwNfRyO225c0dkIct3ByzIZKag8k8zyfoP9kLkew6LdtbVIqcwdTPYsJeNdZ
	H9el41ZmoW9bY/2smAqoVVZ920tBRp4pl8DyPJE6/UHdqjCsaU9f3xcUlkOwGc7A
	rIyhdXMNWPOSCZe8URu/nD2fIKStCOivXWD34xaUz2YgRdihiYTJn8Ytd9r1kdZB
	DCb5bI8nrFQeL/n4UEJZpaA5FNtwg3eQFSKE3y396KKmstyvHQhGdKrZntYCG2sb
	0rpMb8eSNcLR3iYhcH++oDsuVqXTv7fgzFl4ZiAkPCQEFsRm8TCjYonQiMY2GiFU
	TIHOQg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj857s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 12:02:11 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FC2AOr014291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 12:02:10 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Apr
 2025 05:02:06 -0700
Message-ID: <4671cb03-f52e-ee4e-3619-66c83c78f1bb@quicinc.com>
Date: Tue, 15 Apr 2025 17:32:03 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH RFC v5 0/8] media: qcom: iris: re-organize catalog & add
 support for SM8650
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <2740b178-34cc-4b95-a8da-7e6862cabc92@linaro.org>
 <96953447-cff5-98d4-053e-8cc31778849c@quicinc.com>
 <eb469388-d2f9-447a-aa80-41795991a4ad@linaro.org>
 <5b50ad93-0885-d908-fd13-3a597966115c@quicinc.com>
 <0c4fcd81-8e1f-4b4b-a345-c08caeb599c8@linaro.org>
 <69b2e66c-e9c7-37b5-e395-f7e2fd639261@quicinc.com>
 <95c6e3b1-e397-49f9-b841-e91c548793d5@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <95c6e3b1-e397-49f9-b841-e91c548793d5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe4ac3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=QOsI35gpghUkuXsZ8AoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2ZMl2Dww8Qnk7QYVHlk5Y8L_AT3zphMT
X-Proofpoint-ORIG-GUID: 2ZMl2Dww8Qnk7QYVHlk5Y8L_AT3zphMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150085



On 4/15/2025 5:25 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 15/04/2025 13:26, Vikash Garodia wrote:
>>
>> On 4/15/2025 1:54 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 14/04/2025 21:48, Vikash Garodia wrote:
>>>>
>>>> On 4/14/2025 5:39 PM, neil.armstrong@linaro.org wrote:
>>>>> Hi,
>>>>>
>>>>> On 14/04/2025 12:54, Vikash Garodia wrote:
>>>>>> Hi Neil,
>>>>>>
>>>>>> On 4/14/2025 1:05 PM, Neil Armstrong wrote:
>>>>>>> Hi Vikash, Dikshita,
>>>>>>>
>>>>>>> On 10/04/2025 18:29, Neil Armstrong wrote:
>>>>>>>> Re-organize the platform support core into a gen1 catalog C file
>>>>>>>> declaring common platform structure and include platform headers
>>>>>>>> containing platform specific entries and iris_platform_data
>>>>>>>> structure.
>>>>>>>>
>>>>>>>> The goal is to share most of the structure while having
>>>>>>>> clear and separate per-SoC catalog files.
>>>>>>>>
>>>>>>>> The organization is based on the curent drm/msm dpu1 catalog
>>>>>>>> entries.
>>>>>>>
>>>>>>> Any feedback on this patchset ?
>>>>>> Myself and Dikshita went through the approach you are bringing here, let me
>>>>>> update some context here:
>>>>>> - sm8550, sm8650, sm8775p, qcs8300 are all irisv3, while qcs8300 is the
>>>>>> scaled
>>>>>> down variant i.e have 2 PIPE vs others having 4. Similarly there are other
>>>>>> irisv3 having 1 pipe as well.
>>>>>> - With above variations, firmware and instance caps would change for the
>>>>>> variant
>>>>>> SOCs.
>>>>>> - Above these, few(less) bindings/connections specific delta would be there,
>>>>>> like there is reset delta in sm8550 and sm8650.
>>>>>>
>>>>>> Given above, xxx_gen1.c and xxx_gen2.c can have all binding specific
>>>>>> tables and
>>>>>> SOC platform data, i.e sm8650_data (for sm8650). On top of this,
>>>>>> individual SOC
>>>>>> specific .c file can have any delta, from xxx_gen1/2.c) like reset table or
>>>>>> preset register table, etc and export these delta structs in xxx_gen1.c or
>>>>>> xxx_gen2.c.
>>>>>>
>>>>>> Going with above approach, sm8650.c would have only one reset table for now.
>>>>>> Later if any delta is identified, the same can be added in it. All other
>>>>>> common
>>>>>> structs, can reside in xxx_gen2.c for now.
>>>>>
>>>>> Thanks for reviewing, but...
>>>>> Sorry I don't understand what you and Dmitry are asking me...
>>>>>
>>>>> If I try really hard, you would like to have:
>>>>>
>>>>> iris_catalog_sm8550.c
>>>>> - iris_set_sm8550_preset_registers
>>>>> - sm8550_icc_table
>>>>> - sm8550_clk_reset_table
>>>>> - sm8550_bw_table_dec
>>>>> - sm8550_pmdomain_table
>>>>> - sm8550_opp_pd_table
>>>>> - sm8550_clk_table
>>>> Move or rename existing 8550.c as xxx_gen2.c. This is with the existing
>>>> assumption that everything under 8550.c is common for all gen2 to come in
>>>> future.
>>>>>
>>>>> iris_catalog_sm8650.c
>>>>> - sm8650_clk_reset_table
>>>>> - sm8650_controller_reset_table
>>>> yes, since reset is the only delta.
>>>>>
>>>>> iris_catalog_gen2.c
>>>>> - iris_hfi_gen2_command_ops_init
>>>>> - iris_hfi_gen2_response_ops_init
>>>>> ...
>>>>> - sm8550_dec_op_int_buf_tbl
>>>>>
>>>>> and:
>>>>> - struct iris_platform_data sm8550_data
>>>>> - struct iris_platform_data sm8650_data
>>>> all this goes to xxx_gen2.c as well.
>>>
>>> Yeah so this is exactly my current approach, except it use .h files
>>> for each SoC for simplicity.
>>>
>>>>
>>>>> using data from iris_catalog_sm8550.c & iris_catalog_sm8550.c
>>>>>
>>>>> So this is basically what I _already_ propose except
>>>>> you move data in separate .c files for no reasons,
>>>>> please explain why you absolutely want distinct .c
>>>>> files per SoC. We are no more in the 1990's and we camn
>>>>> defintely have big .c files.
>>>> Its not about the size of file alone, it is easy to understand later what would
>>>> be the delta in the SOCs and what would common. For ex, just navigating through
>>>> sm8650.c, anyone can comment that reset is the delta.
>>>
>>> What's the problem with the current approach with .h file for each SoC ?
>>>
>>>>>
>>>>> And we still have a big issue, how to get the:
>>>>> - ARRAY_SIZE(sm8550_clk_reset_table)
>>>>> - ARRAY_SIZE(sm8550_bw_table_dec)
>>>>> - ARRAY_SIZE(sm8550_pmdomain_table)
>>>>> ...
>>>>>
>>>>> since they are declared in a separate .c file and you
>>>>> need a compile-time const value to fill all the _size
>>>>> attribute in iris_platform_data.
>>>> I have not tries this, but isn't extern-ing the soc structs (in your case reset
>>>> tables) into xxx_gen2.c enough here ? Also i think the tables you are pointing
>>>> here, lies in the xxx_gen2.c only, so i am sure above ones would not be an
>>>> issue
>>>> at all. The only delta struct is reset table, lets see if extern helps.
>>>
>>> No it doesn't, because I wrote C for the last 25 years, and I tried it already,
>>> I also tried to export a const int with the table size, and it also doesn't
>>> work.
>> Got it, i tried too, it didn't work.
>>>
>>> The 3 only ways are:
>>> 1) add defines with sizes for each table
>> This leaves manual update everytime.
>>
>>> 2) add a NULL entry at the end of each table, and update all code using those
>>> tables
>> Does not sound right to update the code, just to get the size.
>>
>>> 3) declare in the same scope, which is my current proposalThe proposal in the
>>> RFC is about moving the common structs to 8550.h, rather, it
>> can be kept in xxx_gen2.c.
>> 8550.h can have the delta part (i.e reset tables) and can be included in
>> xxx_gen2.c. sm8650_data can reside in xxx_gen2.c, soc headers just brings the
>> delta structs which can be overridden from common in xxx_gen2.c
>> I am good with the header approach which contains the delta over and above
>> xxx_gen2.c.
> 
> I'll try to do that, but now I don't see the point of the SoC header files if
> they only contain the reset tables.
We already know that preset registers are also coming in (it is still a mystery
though on why h264 dec works without it, i have not got chance to explore it
more), so it would be useful when you extend it later.

Regards,
Vikash
> 
> Neil
> 
>>
>> Regards,
>> Vikash
>>> Neil
>>>
>>>>
>>>> Regards,
>>>> Vikash
>>>>>
>>>>> So I recall my goal, I just want to add sm8650 support,
>>>>> and I'm not the owner of this driver, and I'm really happy
>>>>> to help, but giving me random ideas to solve your problem
>>>>> doesn't help us at all going forward.
>>>>>
>>>>> Neil
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Vikash
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Neil
>>>>>>>
>>>>>>>>
>>>>>>>> Add support for the IRIS accelerator for the SM8650
>>>>>>>> platform, which uses the iris33 hardware.
>>>>>>>>
>>>>>>>> The vpu33 requires a different reset & poweroff sequence
>>>>>>>> in order to properly get out of runtime suspend.
>>>>>>>>
>>>>>>>> Follow-up of [1]:
>>>>>>>> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org/
>>>>>>>>
>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>> ---
>>>>>>>> Changes in v4:
>>>>>>>> - Reorganized into catalog, rebased sm8650 support on top
>>>>>>>> - Link to v4:
>>>>>>>> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org
>>>>>>>>
>>>>>>>> Changes in v4:
>>>>>>>> - collected tags
>>>>>>>> - un-split power_off in vpu3x
>>>>>>>> - removed useless function defines
>>>>>>>> - added back vpu3x disappeared rename commit
>>>>>>>> - Link to v3:
>>>>>>>> https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org
>>>>>>>>
>>>>>>>> Changes in v3:
>>>>>>>> - Collected review tags
>>>>>>>> - Removed bulky reset_controller ops
>>>>>>>> - Removed iris_vpu_power_off_controller split
>>>>>>>> - Link to v2:
>>>>>>>> https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org
>>>>>>>>
>>>>>>>> Changes in v2:
>>>>>>>> - Collected bindings review
>>>>>>>> - Reworked rest handling by adding a secondary optional table to be used by
>>>>>>>> controller poweroff
>>>>>>>> - Reworked power_off_controller to be reused and extended by vpu33 support
>>>>>>>> - Removed useless and unneeded vpu33 init
>>>>>>>> - Moved vpu33 into vpu3x files to reuse code from vpu3
>>>>>>>> - Moved sm8650 data table into sm8550
>>>>>>>> - Link to v1:
>>>>>>>> https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org
>>>>>>>>
>>>>>>>> ---
>>>>>>>> Neil Armstrong (8):
>>>>>>>>           media: qcom: iris: move sm8250 to gen1 catalog
>>>>>>>>           media: qcom: iris: move sm8550 to gen2 catalog
>>>>>>>>           dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS
>>>>>>>> accelerator
>>>>>>>>           media: platform: qcom/iris: add power_off_controller to vpu_ops
>>>>>>>>           media: platform: qcom/iris: introduce optional controller_rst_tbl
>>>>>>>>           media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
>>>>>>>>           media: platform: qcom/iris: add support for vpu33
>>>>>>>>           media: platform: qcom/iris: add sm8650 support
>>>>>>>>
>>>>>>>>      .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
>>>>>>>>      drivers/media/platform/qcom/iris/Makefile          |   6 +-
>>>>>>>>      .../media/platform/qcom/iris/iris_catalog_gen1.c   |  83 +++++++
>>>>>>>>      ...{iris_platform_sm8550.c => iris_catalog_gen2.c} |  85 +------
>>>>>>>>      ...ris_platform_sm8250.c => iris_catalog_sm8250.h} |  80 +-----
>>>>>>>>      .../media/platform/qcom/iris/iris_catalog_sm8550.h |  91 +++++++
>>>>>>>>      .../media/platform/qcom/iris/iris_catalog_sm8650.h |  68 +++++
>>>>>>>>      drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>>>>>>>>      .../platform/qcom/iris/iris_platform_common.h      |   3 +
>>>>>>>>      drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
>>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
>>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
>>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275
>>>>>>>> +++++++++++++++++++++
>>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
>>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>>>>>>>>      15 files changed, 598 insertions(+), 300 deletions(-)
>>>>>>>> ---
>>>>>>>> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
>>>>>>>> change-id: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f
>>>>>>>>
>>>>>>>> Best regards,
>>>>>>>
>>>>>
>>>
> 

