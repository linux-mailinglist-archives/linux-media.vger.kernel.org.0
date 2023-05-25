Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5B5971062B
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 09:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjEYHWa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 03:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjEYHW0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 03:22:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1C7189;
        Thu, 25 May 2023 00:22:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AB8DF64327;
        Thu, 25 May 2023 07:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E72C433D2;
        Thu, 25 May 2023 07:22:20 +0000 (UTC)
Message-ID: <1eeb16e4-0812-b70b-df5a-1670c21a5221@xs4all.nl>
Date:   Thu, 25 May 2023 09:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCHv3] media: venus: provide video device lock
Content-Language: en-US
To:     Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230524135737.2557837-1-senozhatsky@chromium.org>
 <20230524141312.2558810-1-senozhatsky@chromium.org>
 <2c732d80-1a18-7a34-03a8-16afb0de5ea2@linaro.org>
 <f9219cb0-2cac-bace-20f7-27005cd0e6f1@xs4all.nl>
 <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <83cd3dc7-455d-0f26-d2a8-3ebe92d9e33f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/05/2023 18:36, Vikash Garodia wrote:
> 
> On 5/24/2023 8:14 PM, Hans Verkuil wrote:
>> On 24/05/2023 16:29, Bryan O'Donoghue wrote:
>>> On 24/05/2023 15:12, Sergey Senozhatsky wrote:
>>>> Video device has to provide ->lock so that __video_do_ioctl()
>>>> can serialize IOCTL calls. Provided dedicated enc/dec mutex-s
>>>> for that purpose.
> Why do we need to serialize at device context ? Please share some details on the
> issue faced leading to the serialization. This may impact performance, let say,
> when we have multiple concurrent video sessions running at the same time and the
> ioctl for one session have to wait if the lock is taken by another session ioctl.
> 
>>>>
>>>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>>
>> Since these are m2m devices, I think this should set vfh->m2m_ctx->q_lock
>> instead.
>>
>> The vb2_queue is per filehandle for such devices, so by just setting
>> vdev->lock you will have all vb2_queues use the same mutex.
>>
>> Instead the struct v4l2_m2m_ctx q_lock pointer, if set, will use that
>> mutex for all vb2 operations.
>>
>> I think you can set it to the 'lock' mutex in struct venus_inst.
> 
> IIUC, the suggestion is to use the 'lock' in struct venus_inst while
> initializing the queue. This might lead to deadlock as the same lock is used
> during vb2 operations in driver. Might be introducing a new lock for this
> purpose in struct venus_inst would do, unless we are trying to serialize at
> video device (or core) context.

For the record, I have not analyzed how that lock is used in the driver,
so if a new mutex has to be added to venus_inst rather than reusing the
existing one, then that's fine by me.

But it should be a instance-specific mutex, not one at the device level.

Regards,

	Hans

> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>> ---
>>>>   drivers/media/platform/qcom/venus/core.h | 4 ++++
>>>>   drivers/media/platform/qcom/venus/vdec.c | 2 ++
>>>>   drivers/media/platform/qcom/venus/venc.c | 2 ++
>>>>   3 files changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
>>>> index 4f81669986ba..b6c9a653a007 100644
>>>> --- a/drivers/media/platform/qcom/venus/core.h
>>>> +++ b/drivers/media/platform/qcom/venus/core.h
>>>> @@ -113,7 +113,9 @@ struct venus_format {
>>>>    * @opp_pmdomain: an OPP power-domain
>>>>    * @resets: an array of reset signals
>>>>    * @vdev_dec:    a reference to video device structure for decoder instances
>>>> + * @vdev_dec_lock: decoder instance video device ioctl lock
>>>>    * @vdev_enc:    a reference to video device structure for encoder instances
>>>> + * @vdev_enc_lock: encoder instance video device ioctl lock
>>>>    * @v4l2_dev:    a holder for v4l2 device structure
>>>>    * @res:        a reference to venus resources structure
>>>>    * @dev:        convenience struct device pointer
>>>> @@ -165,7 +167,9 @@ struct venus_core {
>>>>       struct device *opp_pmdomain;
>>>>       struct reset_control *resets[VIDC_RESETS_NUM_MAX];
>>>>       struct video_device *vdev_dec;
>>>> +    struct mutex vdev_dec_lock;
>>>>       struct video_device *vdev_enc;
>>>> +    struct mutex vdev_enc_lock;
>>>>       struct v4l2_device v4l2_dev;
>>>>       const struct venus_resources *res;
>>>>       struct device *dev;
>>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
>>>> index 51a53bf82bd3..7e9363714bfb 100644
>>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>>> @@ -1760,6 +1760,7 @@ static int vdec_probe(struct platform_device *pdev)
>>>>       if (!vdev)
>>>>           return -ENOMEM;
>>>>   +    mutex_init(&core->vdev_dec_lock);
>>>>       strscpy(vdev->name, "qcom-venus-decoder", sizeof(vdev->name));
>>>>       vdev->release = video_device_release;
>>>>       vdev->fops = &vdec_fops;
>>>> @@ -1767,6 +1768,7 @@ static int vdec_probe(struct platform_device *pdev)
>>>>       vdev->vfl_dir = VFL_DIR_M2M;
>>>>       vdev->v4l2_dev = &core->v4l2_dev;
>>>>       vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>>>> +    vdev->lock = &core->vdev_dec_lock;
>>>>         ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>>>       if (ret)
>>>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>>>> index 4666f42feea3..8522ed339d5d 100644
>>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>>> @@ -1558,6 +1558,7 @@ static int venc_probe(struct platform_device *pdev)
>>>>       if (!vdev)
>>>>           return -ENOMEM;
>>>>   +    mutex_init(&core->vdev_enc_lock);
>>>>       strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
>>>>       vdev->release = video_device_release;
>>>>       vdev->fops = &venc_fops;
>>>> @@ -1565,6 +1566,7 @@ static int venc_probe(struct platform_device *pdev)
>>>>       vdev->vfl_dir = VFL_DIR_M2M;
>>>>       vdev->v4l2_dev = &core->v4l2_dev;
>>>>       vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
>>>> +    vdev->lock = &core->vdev_enc_lock;
>>>>         ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>>>       if (ret)
>>>
>>> LGTM
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>

