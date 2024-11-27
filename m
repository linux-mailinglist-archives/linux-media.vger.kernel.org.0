Return-Path: <linux-media+bounces-22130-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61D9DA38D
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97E3C1666C1
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7401417BB32;
	Wed, 27 Nov 2024 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fa8eiGFH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1622AF9DD;
	Wed, 27 Nov 2024 08:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694853; cv=none; b=nl+zw3C5YGSU/BF347zeuJtRbVp2PB1VrrDFuHrpFVXW7+ZhscxFpn/MpXezTq3XUliZiHVBbHru1eqzAbLBUulYLZhayD0ssIRrYjZplUAGREnyH+pDJ0JXXCVRPYvGKGA1HMnWCmYM4bYIX73F5DAu8qmY5L8s6NZ9+5OznR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694853; c=relaxed/simple;
	bh=d+++Xyqx7hdZ+Uos44z9rtcxTP3mILukeQccLMg/MkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Lr7w4K7lH0wQH/cyozZVZtDo+IHgnm1AJ27BEA2DkBb5Pb26EetVm0qMQgt5RSvKrRWpHm9XYycdW68HAF0GbXLH1N1UBzf+FOJFKHVuJUVLhjw2GymRkCV52o7ROZQxRDaeVljvsVPfP76zGHBUNwDZtFCNxyxeeltvJOGMOZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fa8eiGFH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLZJ4007384;
	Wed, 27 Nov 2024 08:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOhnpcodZITKmMkpmRrbUNf8xTWmfG5w4jeaq6KpG8w=; b=Fa8eiGFHZ/066f5m
	KPoEfQaJLgDJJslUUidP5mNqBRLbdIGuW5B4YJ9gRn35NOnuM6XOh8sB93XNdfF3
	Kv4Nlu3re+J7NWOXo5DEiWfPyBerKcLVD7nsa/dqNBYWYY3Zyci7wtVKiviNbu7D
	TOL8xo92BOx6MltRbS1LeDOri+GwZbwtl2lDUAH7sQMLbYZK43LMYrftiakejTj4
	eJq778HK9HD+Zb1MEkI5gDLj6LIBRCd17D6hisM7246Jz7Ujk/P3oUDopL8G5MZ9
	4znzmHfMeZFAmIzgbZ3wRuzz1B6yjQqOyS4MDA9DrRVdusehPiDoGiAHXt66BXfL
	ZNOFjQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435cmqu2f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:07:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR87NSR002499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:07:23 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 00:07:18 -0800
Message-ID: <3de91bd8-ba8f-2779-71e5-81295bd941e4@quicinc.com>
Date: Wed, 27 Nov 2024 13:37:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Renjiang Han
	<quic_renjiang@quicinc.com>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "Mauro Carvalho
 Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <quic_qiweil@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
 <j4nnlbstclwgoy2cr4dvoebd62by7exukvo6nfekg4lt6vi3ib@tevifuxaawua>
 <da432de1369e4ce799c72ce98c9baaf1@quicinc.com>
 <ro5nx6brovd7inyy6tkrs7newszcxrzymfbsftejgpglz3gs6v@pscij26xmmco>
 <36fdb3d7-fd48-43a9-a392-336038db71a2@quicinc.com>
 <l4mnw6fu3cdbmqs4bxeykm73p2pb5u7vr5wh6zq5gf5y3fydsw@t3pijaf7qymf>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <l4mnw6fu3cdbmqs4bxeykm73p2pb5u7vr5wh6zq5gf5y3fydsw@t3pijaf7qymf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cmk-5fSUUW9Ta2gYm_c9FhnmBidm6sdN
X-Proofpoint-ORIG-GUID: Cmk-5fSUUW9Ta2gYm_c9FhnmBidm6sdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270066


On 11/26/2024 5:33 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 26, 2024 at 03:40:47PM +0800, Renjiang Han wrote:
>>
>> On 11/26/2024 12:20 AM, Dmitry Baryshkov wrote:
>>> On Mon, Nov 25, 2024 at 03:34:19PM +0000, Renjiang Han (QUIC) wrote:
>>>> On Monday, November 25, 2024 9:36 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Nov 25, 2024 at 11:04:50AM +0530, Renjiang Han wrote:
>>>>>> Initialize the platform data and enable venus driver probe of QCS615
>>>>>> SoC.
>>>>>>
>>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com> >
>>>>>> ---
>>>>>>   drivers/media/platform/qcom/venus/core.c | 50
>>>>>> ++++++++++++++++++++++++++++++++
>>>>>>   1 file changed, 50 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/venus/core.c
>>>>>> b/drivers/media/platform/qcom/venus/core.c
>>>>>> index
>>>>>> 423deb5e94dcb193974da23f9bd2d905bfeab2d9..39d8bcf62fe4f72674746b75994c
>>>>>> ce6cbaee94eb 100644
>>>>>> --- a/drivers/media/platform/qcom/venus/core.c
>>>>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>>>>> @@ -630,6 +630,55 @@ static const struct venus_resources msm8998_res = {
>>>>>>   	.fwname = "qcom/venus-4.4/venus.mbn",  };
>>>>>> +static const struct freq_tbl qcs615_freq_table[] = {
>>>>>> +	{ 0, 460000000 },
>>>>>> +	{ 0, 410000000 },
>>>>>> +	{ 0, 380000000 },
>>>>>> +	{ 0, 300000000 },
>>>>>> +	{ 0, 240000000 },
>>>>>> +	{ 0, 133333333 },
>>>>>> +};
>>>>>> +
>>>>>> +static const struct bw_tbl qcs615_bw_table_enc[] = {
>>>>>> +	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
>>>>>> +	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
>>>>>> +	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
>>>>>> +};
>>>>>> +
>>>>>> +static const struct bw_tbl qcs615_bw_table_dec[] = {
>>>>>> +	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
>>>>>> +	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
>>>>>> +	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
>>>>>> +};
>>>>>> +
>>>>>> +static const struct venus_resources qcs615_res = {
>>>>>> +	.freq_tbl = qcs615_freq_table,
>>>>>> +	.freq_tbl_size = ARRAY_SIZE(qcs615_freq_table),
>>>>>> +	.bw_tbl_enc = qcs615_bw_table_enc,
>>>>>> +	.bw_tbl_enc_size = ARRAY_SIZE(qcs615_bw_table_enc),
>>>>>> +	.bw_tbl_dec = qcs615_bw_table_dec,
>>>>>> +	.bw_tbl_dec_size = ARRAY_SIZE(qcs615_bw_table_dec),
>>>>>> +	.clks = {"core", "iface", "bus" },
>>>>>> +	.clks_num = 3,
>>>>>> +	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
>>>>>> +	.vcodec_clks_num = 2,
>>>>>> +	.vcodec_pmdomains = (const char *[]) { "venus", "vcodec0" },
>>>>>> +	.vcodec_pmdomains_num = 2,
>>>>>> +	.opp_pmdomain = (const char *[]) { "cx" },
>>>>>> +	.vcodec_num = 1,
>>>>>> +	.hfi_version = HFI_VERSION_4XX,
>>>>>> +	.vpu_version = VPU_VERSION_AR50,
>>>>>> +	.vmem_id = VIDC_RESOURCE_NONE,
>>>>>> +	.vmem_size = 0,
>>>>>> +	.vmem_addr = 0,
>>>>>> +	.dma_mask = 0xe0000000 - 1,
>>>>>> +	.cp_start = 0,
>>>>>> +	.cp_size = 0x70800000,
>>>>>> +	.cp_nonpixel_start = 0x1000000,
>>>>>> +	.cp_nonpixel_size = 0x24800000,
>>>>>> +	.fwname = "qcom/venus-5.4/venus_s6.mbn",
>>>>> I really want the firmware discussion of linux-firmware to be solved first,
>>>>> before we land this patch.
>>>>> SHort summary: can we use a single image for all 5.4 platforms (by using
>>>>> v5 signatures, by using v6 signatures, v3 or any other kind of quirk).
>>>> Thanks for your comment. We have discussed with the firmware team and
>>>> other teams if we can use the same firmware binary. The result is we'd better
>>>> use different firmware files. They should respond in the firmware binary
>>>> thread. I will push them and hope them respond as quickly as possible and
>>>> give reasons.
>>>>>> +};
>>>>>> +
>>>>>>   static const struct freq_tbl sdm660_freq_table[] = {
>>>>>>   	{ 979200, 518400000 },
>>>>>>   	{ 489600, 441600000 },
>>>>>> @@ -937,6 +986,7 @@ static const struct of_device_id venus_dt_match[] = {
>>>>>>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>>>>>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>>>>>>   	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>>>>>> +	{ .compatible = "qcom,qcs615-venus", .data = &qcs615_res, },
>>>>> The hardware seems to be the same as sc7180, only the frequencies differ.
>>>>> Can we change the driver in a way that we don't have to add another
>>>>> compat entry just for the sake of changing freqs / bandwidths?
>>>> Thank you for your comment. I agree with you. But based on the Venus code
>>>> architecturE ANd the distinction between different platforms, I think the
>>>> current changes are the simplest.
>>> Well, it is simplest, correct. But not the best one. There is no plan no
>>> migrate these platforms to the iris driver. So instead, please improve
>>> the venus driver instead of just pushing the simplest change. I should
>>> have been more explicit about it earlier.
>>
>> Based on the current code architecture, I don't know if there is a better
>> way. If we
>>
>> refactor the code, it will take a lot of effort.
> 
> Yes, please. The freq_tbl contents is a duplicate of the OPP table in
> DT. Drop it from the driver.
Agree, we should reuse OPP table in this case to set the required rate.
Renjiang, let us know your findings with using opp table.

Regards,
Vikash
>> Therefore, I submit this change. Do you have a better approach?
> 
> NAK for this submission. Please spend some time and improve the driver
> instead.
> 
>>
>> Also, the driver architecture of iris is implemented as you said.
> 
> Irrelevant. You are patching venus, not iris.
> 
>>>>>>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>>>>>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>>>>>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>>>>>
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>>>> -- 
>>>>> With best wishes
>>>>> Dmitry
>>
>> -- 
>> Best Regards,
>> Renjiang
>>
> 

