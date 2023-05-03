Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA476F4F75
	for <lists+linux-media@lfdr.de>; Wed,  3 May 2023 06:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjECEZY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 May 2023 00:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjECEZX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 May 2023 00:25:23 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F392684;
        Tue,  2 May 2023 21:25:21 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3434Kxm5018925;
        Wed, 3 May 2023 04:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=IHhA4XNd1a4Ygz13NoeVFX3a1p8k8A7V1k0CwJ7DNlc=;
 b=A3+zEhPuZYRL4ce36bF1Q6WNuw+CYk15jxGzuZu5yieFeHhATeXvS/fs8QKsbNlz+iz7
 fJc/RR444I26zG50QZBu6x7ylcJCkDowskHkGXRvBpQWa3tPHaxLJlwRBLWFVWNFMbeY
 kmoI4O5YmJNFsqKh2Dc1vUM939I8Dz2j80JO/KFIvIcvekGhwW4YqWhdwhEvK77mGpBG
 3wP18t01fAFJFP8NMCWHUG9BWfspfp42bt083/N8KARuqmMFEkEH9f7qa4acdQsFE1dW
 Cj/18cxpNu/rh7bCp9WTSdDCKCI207iOkpYthRCqhpmJt2sMzHmPKbfB5OwSOLBh5/Bv fw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbbsw0das-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 May 2023 04:25:19 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3434PIPt006295
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 3 May 2023 04:25:18 GMT
Received: from [10.216.0.255] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 2 May 2023
 21:25:17 -0700
Message-ID: <03da235f-0d94-60d9-8907-9caf0991c0a6@quicinc.com>
Date:   Wed, 3 May 2023 09:55:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported
 hfi versions
Content-Language: en-US
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        =?UTF-8?Q?Martin_D=c3=b8rum?= <dorum@noisolation.com>
CC:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
 <5a851116-561f-2d00-1310-2debc43ce249@gmail.com>
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <5a851116-561f-2d00-1310-2debc43ce249@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GlRBWieYCdROl136ymEpYX02WumZhyNE
X-Proofpoint-ORIG-GUID: GlRBWieYCdROl136ymEpYX02WumZhyNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_01,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030034
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/3/2023 2:22 AM, Stanimir Varbanov wrote:
>
>
> On 14.04.23 г. 13:12 ч., Martin Dørum wrote:
>> Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>>> =4xx. The code used to unconditionally set the property in
>> venc_set_properties, which meant that initializing the encoder would
>> always fail unless the hfi_version was >=4xx.
>>
>> This patch changes venc_set_properties to only set the
>> H264_TRANSFORM_8X8 property if the hfi version is >=4xx.
>>
>> Signed-off-by: Martin Dørum <dorum@noisolation.com>
>>
>> ---
>>
>> I have an APQ8016-based board. Before this patch, the Venus driver
>> would simply fail with EINVAL when trying to request buffers
>> (VIDIOC_REQBUFS). With this patch, encoding works
>> (tested using gstreamer's v4l2h264enc).
>>
>>   drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
>>   1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/venc.c 
>> b/drivers/media/platform/qcom/venus/venc.c
>> index cdb12546c4fa..b3df805a8c9c 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -672,16 +672,17 @@ static int venc_set_properties(struct 
>> venus_inst *inst)
>>           if (ret)
>>               return ret;
>>
>> -        ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>> -        h264_transform.enable_type = 0;
>> -        if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>> -            ctr->profile.h264 == 
>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>> -            h264_transform.enable_type = ctr->h264_8x8_transform;
>> -
>> -        ret = hfi_session_set_property(inst, ptype, &h264_transform);
>> -        if (ret)
>> -            return ret;
>> -
>> +        if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
>
> Instead of doing these checks here you could do:
>
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c 
> b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index bc3f8ff05840..2453e5c3d244 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -1064,6 +1064,7 @@ static int pkt_session_set_property_1x(struct 
> hfi_session_set_property_pkt *pkt,
>                 break;
>         }
>         case HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI:
> +       case HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8:
>                 return -ENOTSUPP;
>
This may still deinit the session from [1] based on failure return value.

[1] 
https://elixir.bootlin.com/linux/v6.3/source/drivers/media/platform/qcom/venus/venc.c#L963

> /* FOLLOWING PROPERTIES ARE NOT IMPLEMENTED IN CORE YET */
>
>> +            ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
>> +            h264_transform.enable_type = 0;
>> +            if (ctr->profile.h264 == 
>> V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
>> +                ctr->profile.h264 == 
>> V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
>> +                h264_transform.enable_type = ctr->h264_8x8_transform;
>> +
>> +            ret = hfi_session_set_property(inst, ptype, 
>> &h264_transform);
>> +            if (ret)
>> +                return ret;
>> +        }
>>       }
>>
>>       if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
>> -- 
>> 2.34.1
>
