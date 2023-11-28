Return-Path: <linux-media+bounces-1187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5057FB3BD
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 09:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3428E282350
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 08:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBEA1798C;
	Tue, 28 Nov 2023 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N+aB0tQS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F37BCE;
	Tue, 28 Nov 2023 00:14:28 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS4KoE4009769;
	Tue, 28 Nov 2023 08:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=guuOMbz3l0LYG0OKUpwSPI8VLzr9E5tLRgYzgSVkmA0=;
 b=N+aB0tQSxGe6q8bI6pecGjQg9+7D9+XOPqLl35CqfoPQ0oFv+0Y0nBzozkYwq0uMHW12
 uvB8iPBRqihWMp8SwHTiLu4Rf7IcY9KAL+zinmIbYRCTOhJ3Im4/aV67mc9sr2kagNV1
 bFD2vT4UfpmSRBtwHNsZCrA5cCY/cwjtMOV9KcudejKYVFeKwv4YFV20ldXoaUNfTKvF
 kBEkSSW7c3iQuFN3vL1jD8xRLVi7XRtGsmNUA569lmKk0Gg34QPHJ2IDklRk90oy2bLZ
 La8dqKQYKS6/nt32OsCL4X6/mD6OV5FUxJax4D/RtHMbM6VOa7aXXvOKJmvPUKbGuJZw nA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umrqq2xwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 08:14:20 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS8EJtV030775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 08:14:19 GMT
Received: from [10.216.60.229] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 00:14:13 -0800
Message-ID: <a4e8b531-49f9-f4a1-51cb-e422c56281cc@quicinc.com>
Date: Tue, 28 Nov 2023 13:44:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc7280: Move video-firmware to
 chrome-common
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro
 Carvalho Chehab <mchehab@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20231002-sc7280-venus-pas-v2-0-bd2408891317@fairphone.com>
 <20231002-sc7280-venus-pas-v2-2-bd2408891317@fairphone.com>
 <4cfad910-1821-3a31-c372-3f6b199e8f71@quicinc.com>
 <CX5ENKY70B5J.2D6DXKGI4EGX3@fairphone.com>
 <ff021f49-f81b-0fd1-bd2c-895dbbb03d56@quicinc.com>
 <CX70EBXCOB66.3998C482R86CN@fairphone.com>
 <a29123a3-afe1-8f92-ff6c-835926d411af@quicinc.com>
 <CAA8EJppkjpMmcHCvxomgUMPxGpf77iN9roRvb=NEcxdk237-UA@mail.gmail.com>
 <e6d80982-1674-d0c4-9dbe-94d77079f6ba@quicinc.com>
 <CX75Y1X2QIN7.1GRH1YI56MMZ@fairphone.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <CX75Y1X2QIN7.1GRH1YI56MMZ@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SWNyR8CKJr76zR2CihilRb79841x5gCd
X-Proofpoint-GUID: SWNyR8CKJr76zR2CihilRb79841x5gCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_07,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280063


On 11/24/2023 9:26 PM, Luca Weiss wrote:
> On Fri Nov 24, 2023 at 2:35 PM CET, Vikash Garodia wrote:
>>
>>
>> On 11/24/2023 6:23 PM, Dmitry Baryshkov wrote:
>>> On Fri, 24 Nov 2023 at 14:30, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>>>>
>>>> On 11/24/2023 5:05 PM, Luca Weiss wrote:
>>>>> On Fri Nov 24, 2023 at 7:38 AM CET, Vikash Garodia wrote:
>>>>>>
>>>>>> On 11/22/2023 7:50 PM, Luca Weiss wrote:
>>>>>>> On Wed Nov 22, 2023 at 2:17 PM CET, Vikash Garodia wrote:
>>>>>>>>
>>>>>>>> On 10/2/2023 7:50 PM, Luca Weiss wrote:
>>>>>>>>> If the video-firmware node is present, the venus driver assumes we're on
>>>>>>>>> a system that doesn't use TZ for starting venus, like on ChromeOS
>>>>>>>>> devices.
>>>>>>>>>
>>>>>>>>> Move the video-firmware node to chrome-common.dtsi so we can use venus
>>>>>>>>> on a non-ChromeOS devices.
>>>>>>>>>
>>>>>>>>> At the same time also disable the venus node by default in the dtsi,
>>>>>>>>> like it's done on other SoCs.
>>>>>>>>>
>>>>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>>>>> ---
>>>>>>>>>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 8 ++++++++
>>>>>>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 6 ++----
>>>>>>>>>  2 files changed, 10 insertions(+), 4 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
>>>>>>>>> index 5d462ae14ba1..cd491e46666d 100644
>>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
>>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
>>>>>>>>> @@ -104,6 +104,14 @@ &scm {
>>>>>>>>>   dma-coherent;
>>>>>>>>>  };
>>>>>>>>>
>>>>>>>>> +&venus {
>>>>>>>>> + status = "okay";
>>>>>>>>> +
>>>>>>>>> + video-firmware {
>>>>>>>>> +         iommus = <&apps_smmu 0x21a2 0x0>;
>>>>>>>>> + };
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>>  &watchdog {
>>>>>>>>>   status = "okay";
>>>>>>>>>  };
>>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>>>>> index 66f1eb83cca7..fa53f54d4675 100644
>>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>>>>> @@ -3740,6 +3740,8 @@ venus: video-codec@aa00000 {
>>>>>>>>>                            <&apps_smmu 0x2184 0x20>;
>>>>>> 0x2184 is a secure SID. I think qcm6490-fairphone-fp5.dts needs to override the
>>>>>> iommus property as well to retain only the non secure SID i.e 0x2180 ? I am
>>>>>> seeing below crash
>>>>>>
>>>>>> Call trace:
>>>>>> [   47.663593]  qcom_smmu_write_s2cr+0x64/0xa4
>>>>>> [   47.663616]  arm_smmu_attach_dev+0x120/0x284
>>>>>> [   47.663647]  __iommu_attach_device+0x24/0xf8
>>>>>> [   47.676845]  __iommu_device_set_domain+0x70/0xd0
>>>>>> [   47.681632]  __iommu_group_set_domain_internal+0x60/0x1b4
>>>>>> [   47.687218]  iommu_setup_default_domain+0x358/0x418
>>>>>> [   47.692258]  __iommu_probe_device+0x3e4/0x404
>>>>>>
>>>>>> Could you please reconfirm if Video SID 0x2184 (and mask) is allowed by the
>>>>>> qcm6490-fairphone-fp5 hardware having TZ ?
>>>>>
>>>>> Hi,
>>>>>
>>>>> On FP5 it seems it's no problem to have both SIDs in there, probe and
>>>>> using venus appears to work fine.
>>>>>
>>>>> Are you using different firmware than QCM6490.LA.3.0 on the device where
>>>>> you tested this?
>>>> I was testing this on RB3 board which uses firmware [1].
>>>
>>> There is something wrong here.
>>>
>>> RB3 board uses venus-5.2
>>> RB5 board uses vpu-1.0
>>> Only sc7280 uses vpu-2.0
>>
>> Tested on QCM6490 IDP board, which is QCOM internal board similar to RB3 gen2.
> 
> In any case, I don't know much about the venus & iommu setup here. I can
> try removing the 0x2184 SID and test if venus still works on FP5.

Please remove 0x2184 SID and confirm specifically encoder works. This SID is for
encoder.

> Also should the chromebooks keep that iommu entry or not?
Chrome-common can have 0x2184 since its no-TZ based solution. So in sc7280.dtsi,
you can keep the default SID i.e 0x2180 (with respective mask) and in
chrome-common, we can override the iommus property with 0x2180 and 0x2184.

Regards,
Vikash

> Regards
> Luca
> 
>>
>>>>
>>>> Regards,
>>>> Vikash
>>>>
>>>> [1]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/vpu-2.0
>>>>
>>>>>>
>>>>>>>>>                   memory-region = <&video_mem>;
>>>>>>>>>
>>>>>>>>> +                 status = "disabled";
>>>>>>>>> +
>>>>>>>>>                   video-decoder {
>>>>>>>>>                           compatible = "venus-decoder";
>>>>>>>>>                   };
>>>>>>>>> @@ -3748,10 +3750,6 @@ video-encoder {
>>>>>>>>>                           compatible = "venus-encoder";
>>>>>>>>>                   };
>>>>>>>>>
>>>>>>>>> -                 video-firmware {
>>>>>>>>> -                         iommus = <&apps_smmu 0x21a2 0x0>;
>>>>>>>>> -                 };
>>>>>>>>> -
>>>>>>>>>                   venus_opp_table: opp-table {
>>>>>>>>>                           compatible = "operating-points-v2";
>>>>>>>>>
>>>>>>>>>
>>>>>>>> Changes look good. Is this tested on SC7280 ?
>>>>>>>
>>>>>>> Hi Vikash,
>>>>>>>
>>>>>>> I didn't test it myself on sc7280 (just qcm6490-fp5) but dtx_diff
>>>>>>> reports no differences except for status = okay property being added, so
>>>>>>> there should be no change on those boards. See below.
>>>>>>>
>>>>>>> Regards
>>>>>>> Luca
>>>>>>
>>>>>> I tested on SC7280 (herobrine) and all good.
>>>>>
>>>>> Great, thanks!
>>>>>
>>>>> Regards
>>>>> Luca
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Vikash
>>>>>
>>>>
>>>
>>>
> 

