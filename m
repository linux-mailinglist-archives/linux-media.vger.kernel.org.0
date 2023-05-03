Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816C96F5053
	for <lists+linux-media@lfdr.de>; Wed,  3 May 2023 08:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjECGr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 May 2023 02:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjECGr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 May 2023 02:47:26 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9FE1FEC;
        Tue,  2 May 2023 23:47:25 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3434r6xq004322;
        Wed, 3 May 2023 06:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YxnChbQsgjX63wgP7p3clK2nWccSZ5xyKu9JJhMg+ww=;
 b=KeAhjw6aC06R/MchMsPaqiLIJGWt6eXOpd6Paix9/VAgsoLo3aP3xCGSxkKL1gL29mXv
 Ablo8iZR0KbvliZE/VneR0chayV82divrOP/Bh5wpDUsCtdTv3IVBjcqge1wFrypJXm3
 i3eB50d7X8o/ENsA24sS+zHRZFRZRM9xQujKKcZSrBL/UorkfgRKkjeBDGbC5puBx0yU
 cflAbvc3AVv7Bcf9DWZJ0fnHRaLqLF2/q/1VBvSEKJtFr24o3KSmTKNNFHIXleMksJpL
 skamoa83+Qp1+9qd2a7Z6kvEaNcsKHatbwJabxACkdQyyuPJS3NaN03DlFkpqRv197EK Rg== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qb9fah4fx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 May 2023 06:47:23 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3436lLhB022686
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 3 May 2023 06:47:21 GMT
Received: from [10.216.36.190] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 23:47:20 -0700
Message-ID: <24c92a72-3d32-d6ce-172b-b127d54c3c75@quicinc.com>
Date:   Wed, 3 May 2023 12:17:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>
CC:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
 <5a851116-561f-2d00-1310-2debc43ce249@gmail.com>
 <03da235f-0d94-60d9-8907-9caf0991c0a6@quicinc.com>
 <33ff3062-4f50-19c4-dce3-3be17e4f7d10@gmail.com>
Content-Language: en-US
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <33ff3062-4f50-19c4-dce3-3be17e4f7d10@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NEcfHzRJQXQIVNVWXFVkvWG66G1x_K8t
X-Proofpoint-GUID: NEcfHzRJQXQIVNVWXFVkvWG66G1x_K8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_03,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030054
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/3/2023 11:23 AM, Stanimir Varbanov wrote:
> Hi,
>
> On 3.05.23 г. 7:25 ч., Vikash Garodia wrote:
>> On 5/3/2023 2:22 AM, Stanimir Varbanov wrote:
>>>
>>>
>>> On 14.04.23 г. 13:12 ч., Martin Dørum wrote:
>>>> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>>>>> =4xx. The code used to unconditionally set the property in
>>>> venc_set_properties, which meant that initializing the encoder would
>>>> always fail unless the hfi_version was >=4xx.
>>>>
>>>> This patch changes venc_set_properties to only set the
>>>> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
>>>>
>>>> Signed-off-by: Martin Dørum <dorum@noisolation.com>
>>>>
>>>> ---
>>>>
>>>> I have an APQ8016-based board. Before this patch, the Venus driver
>>>> would simply fail with EINVAL when trying to request buffers
>>>> (VIDIOC_REQBUFS). With this patch, encoding works
>>>> (tested using gstreamer's v4l2h264enc).
>>>>
>>>>   drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
>>>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>>>> b/drivers/media/platform/qcom/venus/venc.c
>>>> index cdb12546c4fa..b3df805a8c9c 100644
>>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>>> @@ -672,16 +672,17 @@ static int venc_set_properties(struct 
>>>> venus_inst *inst)
>>>>           if (ret)
>>>>               return ret;
>>>>
>>>> -        ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>>>> -        h264_transform.enable_type = 0;
>>>> -        if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>>>> -            ctr->profile.h264 == 
>>>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>>>> -            h264_transform.enable_type = ctr->h264_8x8_transform;
>>>> -
>>>> -        ret = hfi_session_set_property(inst, ptype, &h264_transform);
>>>> -        if (ret)
>>>> -            return ret;
>>>> -
>>>> +        if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
>>>
>>> Instead of doing these checks here you could do:
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c 
>>> b/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> index bc3f8ff05840..2453e5c3d244 100644
>>> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
>>> @@ -1064,6 +1064,7 @@ static int pkt_session_set_property_1x(struct 
>>> hfi_session_set_property_pkt *pkt,
>>>                 break;
>>>         }
>>>         case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI:
>>> +       case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8:
>>>                 return -ENOTSUPP;
>>>
>> This may still deinit the session from [1] based on failure return 
>> value.
>>
>> [1] 
>> https://elixir.bootlin.com/linux/v6.3/source/drivers/media/platform/qcom/venus/venc.c#L963
>
> No, it will not fail because of:
>
> https://elixir.bootlin.com/linux/v6.3/source/drivers/media/platform/qcom/venus/hfi_venus.c#L1426 
>

Thats correct, I missed to notice the explicit handling for -ENOTSUPP.  
Above suggestion is better than keeping verison checks and

would also avoid deinit.

