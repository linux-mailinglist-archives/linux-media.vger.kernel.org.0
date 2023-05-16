Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98FB0704DDB
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 14:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbjEPMdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 08:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232539AbjEPMda (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 08:33:30 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3EA109;
        Tue, 16 May 2023 05:33:29 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34GBR5lN012046;
        Tue, 16 May 2023 12:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+Rl+L5SfvUfq33Q2pV0IOSElMxzRQnt81KvIE1otZA8=;
 b=NI8/17ngJe/HxwCrHcnxx6C9wbEn2XH7FjIhG8P+jPah5E4P1bLKUqTjmBTgguqwVV+j
 HHAgybJp1N+iFdCIRnz5AS3xrYLjEwEm0rG9QkUGyAKKWtY8inDNXTWqhaBwWsF6X/8f
 s05zjgMH5RQ/y/99hw2oydLDOA74bxBYS/oFhN+thFW7t0gFLy0iOBC3KfMIDSh8VeYr
 8U5HKUo3MB3SGftBvyT37VCtjAc2otQVqBg7AnlA4sH93VxR+LVoPjRkW7f7FWTPFS9a
 aXldDXdXXAyWnfKMnP0DZ7ZV+cc4RggA96uvI/LMJRr+6X7Ip7e9soPvgnR7Oe8fS5Jy Bw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkkq9b0fy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 May 2023 12:33:26 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34GCXPkg011608
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 May 2023 12:33:25 GMT
Received: from [10.252.212.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 16 May
 2023 05:33:23 -0700
Message-ID: <f15e254c-5d38-ae6a-36cf-546545f4b970@quicinc.com>
Date:   Tue, 16 May 2023 18:03:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>,
        <stanimir.k.varbanov@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <hverkuil-cisco@xs4all.nl>
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
 <2e61e054-105c-ae22-77b8-a3f41fe3eff0@linaro.org>
 <c4d6ba40-fbcd-3fce-62af-f2b7883a30f6@linaro.org>
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <c4d6ba40-fbcd-3fce-62af-f2b7883a30f6@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mEDWe__CuZ77xFK-t1Yhpg4udyLixVZH
X-Proofpoint-ORIG-GUID: mEDWe__CuZ77xFK-t1Yhpg4udyLixVZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_05,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=969 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 adultscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305160106
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/12/2023 4:02 PM, Bryan O'Donoghue wrote:
> On 02/05/2023 17:37, Bryan O'Donoghue wrote:
>> On 14/04/2023 11:12, Martin Dørum wrote:
>>> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>>>> =4xx. The code used to unconditionally set the property in
>>> venc_set_properties, which meant that initializing the encoder would
>>> always fail unless the hfi_version was >=4xx.
>>>
>>> This patch changes venc_set_properties to only set the
>>> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
>>>
>>> Signed-off-by: Martin Dørum <dorum@noisolation.com>
>>>
>>> ---
>>>
>>> I have an APQ8016-based board. Before this patch, the Venus driver
>>> would simply fail with EINVAL when trying to request buffers
>>> (VIDIOC_REQBUFS). With this patch, encoding works
>>> (tested using gstreamer's v4l2h264enc).
>>>
>>>   drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
>>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/venc.c
>>> b/drivers/media/platform/qcom/venus/venc.c
>>> index cdb12546c4fa..b3df805a8c9c 100644
>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>> @@ -672,16 +672,17 @@ static int venc_set_properties(struct venus_inst *inst)
>>>           if (ret)
>>>               return ret;
>>>
>>> -        ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>>> -        h264_transform.enable_type = 0;
>>> -        if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>>> -            ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>>> -            h264_transform.enable_type = ctr->h264_8x8_transform;
>>> -
>>> -        ret = hfi_session_set_property(inst, ptype, &h264_transform);
>>> -        if (ret)
>>> -            return ret;
>>> -
>>> +        if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
>>> +            ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>>> +            h264_transform.enable_type = 0;
>>> +            if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>>> +                ctr->profile.h264 ==
>>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>>> +                h264_transform.enable_type = ctr->h264_8x8_transform;
>>> +
>>> +            ret = hfi_session_set_property(inst, ptype, &h264_transform);
>>> +            if (ret)
>>> +                return ret;
>>> +        }
>>>       }
>>>
>>>       if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
>>> -- 
>>> 2.34.1
>>
>> I agree that a Fixes should be added.
>>
>> Fixes: bfee75f73c37 ("media: venus: venc: add support for
>> V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")
>>
>> When sending out your V2, please remember to cc -> Hans Verkuil
>> <hverkuil-cisco@xs4all.nl>
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Hey Martin.
> 
> I tried verifying the before/after of your patch last night on db410c as @
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-05-11-venus-check
> 
> I don't see any difference with h264 playback with or without your patch.
> 
> Could you share a command to verify the bug against ?

Probably try an encode session.

-Vikash
> 
> ---
> bod
