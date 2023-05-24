Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7BB070FBBF
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 18:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbjEXQgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 12:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbjEXQgX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 12:36:23 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5A6123;
        Wed, 24 May 2023 09:36:21 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OGXgnN024619;
        Wed, 24 May 2023 16:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vTG9mvZqKviqsRVEIrZVwuT6RML06eXihgrvhA3Nq/Q=;
 b=VkVQJTDeHnzcNKN5AiCnKmbZZ9rnbP8NCpHzIgCKJj612ximrJBd/r56prjIeQ6QLoe1
 C6H6XevHgKc3Q9QlleT15YFAYrWVQcZT5/yTBfNfBpzJAwpq4LG+Hg2qtcWIKdUkeOFz
 tCw7o2n5HETGa84klWWSuF2djb7dYvw4olWfHXej1nQtWWj1qC39B6TRSYET2sjnFpxN
 7q+OV8W/gKNnAvJ/xMd6I2E2VHUt3QQkHKzufOL+SdtRIebqqJ/EFeShsa/sqtxj6MqM
 bQwRcHVEWcEdkfooXAgsrQVOinqzeK9SY5/2mk7Kk5Dwmpq2wo3Q98qlTEdAwGlMhoPj ug== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsdhh1a9s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 16:36:14 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34OGaDt9011107
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 24 May 2023 16:36:13 GMT
Received: from [10.252.212.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 09:36:10 -0700
Message-ID: <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
Date:   Wed, 24 May 2023 22:06:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCHv3] media: venus: provide video device lock
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     Tomasz Figa <tfiga@chromium.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
 <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
 <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
Content-Language: en-US
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 95_k8Tj_02LiiVPwyETwJLraLIqULXah
X-Proofpoint-ORIG-GUID: 95_k8Tj_02LiiVPwyETwJLraLIqULXah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_11,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240137
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/24/2023 8:14 PM, Hans Verkuil wrote:
> On 24/05/2023 16:29, Bryan O'Donoghue wrote:
>> On 24/05/2023 15:12, Sergey Senozhatsky wrote:
>>> Video device has to provide ->lock so that __video_do_ioctl()
>>> can serialize IOCTL calls. Provided dedicated enc/dec mutex-s
>>> for that purpose.
Why do we need to serialize at device context ? Please share some details on the
issue faced leading to the serialization. This may impact performance, let say,
when we have multiple concurrent video sessions running at the same time and the
ioctl for one session have to wait if the lock is taken by another session ioctl.

>>>
>>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> Since these are m2m devices, I think this should set vfh->m2m_ctx->q_lock
> instead.
> 
> The vb2_queue is per filehandle for such devices, so by just setting
> vdev->lock you will have all vb2_queues use the same mutex.
> 
> Instead the struct v4l2_m2m_ctx q_lock pointer, if set, will use that
> mutex for all vb2 operations.
> 
> I think you can set it to the 'lock' mutex in struct venus_inst.

IIUC, the suggestion is to use the 'lock' in struct venus_inst while
initializing the queue. This might lead to deadlock as the same lock is used
during vb2 operations in driver. Might be introducing a new lock for this
purpose in struct venus_inst would do, unless we are trying to serialize at
video device (or core) context.

> 
> Regards,
> 
> 	Hans
> 
>>> ---
>>>   drivers/media/platform/qcom/venus/core.h | 4 ++++
>>>   drivers/media/platform/qcom/venus/vdec.c | 2 ++
>>>   drivers/media/platform/qcom/venus/venc.c | 2 ++
>>>   3 files changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>>> index 4f81669986ba..b6c9a653a007 100644
>>> --- a/drivers/media/platform/qcom/venus/core.h
>>> +++ b/drivers/media/platform/qcom/venus/core.h
>>> @@ -113,7 +113,9 @@ struct venus_format {
>>>    * @opp_pmdomain: an OPP power-domain
>>>    * @resets: an array of reset signals
>>>    * @vdev_dec:    a reference to video device structure for decoder instances
>>> + * @vdev_dec_lock: decoder instance video device ioctl lock
>>>    * @vdev_enc:    a reference to video device structure for encoder instances
>>> + * @vdev_enc_lock: encoder instance video device ioctl lock
>>>    * @v4l2_dev:    a holder for v4l2 device structure
>>>    * @res:        a reference to venus resources structure
>>>    * @dev:        convenience struct device pointer
>>> @@ -165,7 +167,9 @@ struct venus_core {
>>>       struct device *opp_pmdomain;
>>>       struct reset_control *resets[VIDC_RESETS_NUM_MAX];
>>>       struct video_device *vdev_dec;
>>> +    struct mutex vdev_dec_lock;
>>>       struct video_device *vdev_enc;
>>> +    struct mutex vdev_enc_lock;
>>>       struct v4l2_device v4l2_dev;
>>>       const struct venus_resources *res;
>>>       struct device *dev;
>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>>> index 51a53bf82bd3..7e9363714bfb 100644
>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>> @@ -1760,6 +1760,7 @@ static int vdec_probe(struct platform_device *pdev)
>>>       if (!vdev)
>>>           return -ENOMEM;
>>>   +    mutex_init(&core->vdev_dec_lock);
>>>       strscpy(vdev->name, "qcom-venus-decoder", sizeof(vdev->name));
>>>       vdev->release = video_device_release;
>>>       vdev->fops = &vdec_fops;
>>> @@ -1767,6 +1768,7 @@ static int vdec_probe(struct platform_device *pdev)
>>>       vdev->vfl_dir = VFL_DIR_M2M;
>>>       vdev->v4l2_dev = &core->v4l2_dev;
>>>       vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>>> +    vdev->lock = &core->vdev_dec_lock;
>>>         ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>>       if (ret)
>>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>>> index 4666f42feea3..8522ed339d5d 100644
>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>> @@ -1558,6 +1558,7 @@ static int venc_probe(struct platform_device *pdev)
>>>       if (!vdev)
>>>           return -ENOMEM;
>>>   +    mutex_init(&core->vdev_enc_lock);
>>>       strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
>>>       vdev->release = video_device_release;
>>>       vdev->fops = &venc_fops;
>>> @@ -1565,6 +1566,7 @@ static int venc_probe(struct platform_device *pdev)
>>>       vdev->vfl_dir = VFL_DIR_M2M;
>>>       vdev->v4l2_dev = &core->v4l2_dev;
>>>       vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>>> +    vdev->lock = &core->vdev_enc_lock;
>>>         ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>>       if (ret)
>>
>> LGTM
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
