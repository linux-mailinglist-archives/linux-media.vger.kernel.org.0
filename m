Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8B82241AE
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 19:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgGQRXo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 13:23:44 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60361 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726104AbgGQRXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 13:23:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id wU5AjYnyDyPEdwU5Ej5ctq; Fri, 17 Jul 2020 19:23:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595006620; bh=K0pn4gRc6IDLe9TWOE0KcttW36/Rzzyeect/Coj1Q8k=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DMfSM0l2DBnwTIM8f1leIBSd/8YXSbQ2R5KA8//Mt/xZCM44X9abE0VjSq22x3ATC
         zFU+AdGcbMTaap/+PZUO4ISHrM5QzsERdKGdAz7FfNEY47/enTzJbr35boPAovu4mn
         buXCXfWTj8nYE0enLo+haNv4rfJ46SkIq4CZoKScAvFnRSIep7dAapLTf6bfBZj/8R
         PjIfY1FTbK3ovJF0H3OHbNmahsCI2y2fCdbuSuCA+A78onsEvlWDT+akNuAiFcRaMH
         0aAoJph9rdWMtb5s5QcrV3uvq8GKLvYjLVvW4V5TTeMELI3bhMcTvocBQ3rGjqGvga
         K97bjkSDqlsrQ==
Subject: Re: [PATCHv3 2/7] qcom/camss: use vb2_video_unregister_device()
To:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
 <20200713113048.1150542-3-hverkuil-cisco@xs4all.nl>
 <b83173a4-e424-f9e4-f983-ada26a687708@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0c491bb2-fc91-2b70-503a-71199a791f7d@xs4all.nl>
Date:   Fri, 17 Jul 2020 19:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b83173a4-e424-f9e4-f983-ada26a687708@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEcWo41jVOmKm9NQWWA2/N0x18cPZvMP17LX+fnQJCHEFYD6b5c8APuriSDyitNIgZpPcManSzkLw1MgP4GJc9uCoRbWBmwyNmWTrH/brSZE0tlThOL4
 0ERxp2vLoKj+gjz6ENUQA3Bdfv/TBn02WEU3WriemHTg04UFJQjdRvURXKEjjriHYHsomnGP2lxgnZfQjX0C/NuV0fTwszh0BMi3WZ7jECv5TqC+jxJC63rT
 7RtNlEQ7x3sF3oOLQ6L1/LJeb1LdsDF67ZmckRYoc8U=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/07/2020 18:21, Andrey Konovalov wrote:
> Hi Hans,
> 
> I've applied the first two patches of this series, and have given them a try
> on db410c board with imx327c camera module by Framos.
> Looks good.
> 
> Tested-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Much appreciated!

	Hans

> 
> Thanks,
> Andrey
> 
> On 13.07.2020 14:30, Hans Verkuil wrote:
>> Use vb2_video_unregister_device() to automatically stop streaming
>> at unregister time.
>>
>> This avoids the use of vb2_queue_release() which should not be
>> called by drivers that set vdev->queue.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c   |  8 --------
>>   drivers/media/platform/qcom/camss/camss-vfe.h   |  2 --
>>   drivers/media/platform/qcom/camss/camss-video.c | 12 ++----------
>>   drivers/media/platform/qcom/camss/camss-video.h |  2 --
>>   drivers/media/platform/qcom/camss/camss.c       |  5 -----
>>   5 files changed, 2 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index fc31c2c169cd..b7d2293a5004 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -2205,14 +2205,6 @@ static const struct camss_video_ops camss_vfe_video_ops = {
>>   	.flush_buffers = vfe_flush_buffers,
>>   };
>>   
>> -void msm_vfe_stop_streaming(struct vfe_device *vfe)
>> -{
>> -	int i;
>> -
>> -	for (i = 0; i < ARRAY_SIZE(vfe->line); i++)
>> -		msm_video_stop_streaming(&vfe->line[i].video_out);
>> -}
>> -
>>   /*
>>    * msm_vfe_register_entities - Register subdev node for VFE module
>>    * @vfe: VFE device
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index 0d10071ae881..a90b0d2cc6de 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -178,8 +178,6 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
>>   void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
>>   void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
>>   
>> -void msm_vfe_stop_streaming(struct vfe_device *vfe);
>> -
>>   extern const struct vfe_hw_ops vfe_ops_4_1;
>>   extern const struct vfe_hw_ops vfe_ops_4_7;
>>   
>> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
>> index cdbd6dba1122..0e2fcee97eeb 100644
>> --- a/drivers/media/platform/qcom/camss/camss-video.c
>> +++ b/drivers/media/platform/qcom/camss/camss-video.c
>> @@ -879,7 +879,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>   	if (ret < 0) {
>>   		dev_err(v4l2_dev->dev, "Failed to init video entity: %d\n",
>>   			ret);
>> -		goto error_media_init;
>> +		goto error_vb2_init;
>>   	}
>>   
>>   	mutex_init(&video->lock);
>> @@ -936,23 +936,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>   error_video_register:
>>   	media_entity_cleanup(&vdev->entity);
>>   	mutex_destroy(&video->lock);
>> -error_media_init:
>> -	vb2_queue_release(&video->vb2_q);
>>   error_vb2_init:
>>   	mutex_destroy(&video->q_lock);
>>   
>>   	return ret;
>>   }
>>   
>> -void msm_video_stop_streaming(struct camss_video *video)
>> -{
>> -	if (vb2_is_streaming(&video->vb2_q))
>> -		vb2_queue_release(&video->vb2_q);
>> -}
>> -
>>   void msm_video_unregister(struct camss_video *video)
>>   {
>>   	atomic_inc(&video->camss->ref_count);
>> -	video_unregister_device(&video->vdev);
>> +	vb2_video_unregister_device(&video->vdev);
>>   	atomic_dec(&video->camss->ref_count);
>>   }
>> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
>> index aa35e8cc6fd5..bdbae8424140 100644
>> --- a/drivers/media/platform/qcom/camss/camss-video.h
>> +++ b/drivers/media/platform/qcom/camss/camss-video.h
>> @@ -52,8 +52,6 @@ struct camss_video {
>>   	unsigned int nformats;
>>   };
>>   
>> -void msm_video_stop_streaming(struct camss_video *video);
>> -
>>   int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>   		       const char *name, int is_pix);
>>   
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 3fdc9f964a3c..d0f4360eb9a0 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -964,13 +964,8 @@ void camss_delete(struct camss *camss)
>>    */
>>   static int camss_remove(struct platform_device *pdev)
>>   {
>> -	unsigned int i;
>> -
>>   	struct camss *camss = platform_get_drvdata(pdev);
>>   
>> -	for (i = 0; i < camss->vfe_num; i++)
>> -		msm_vfe_stop_streaming(&camss->vfe[i]);
>> -
>>   	v4l2_async_notifier_unregister(&camss->notifier);
>>   	v4l2_async_notifier_cleanup(&camss->notifier);
>>   	camss_unregister_entities(camss);
>>

