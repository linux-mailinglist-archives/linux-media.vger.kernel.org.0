Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EC7221E4F
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 10:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgGPI2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 04:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgGPI2Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 04:28:24 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3E9C061755
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 01:28:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u25so2847769lfm.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RjEpDesXyeRNmLhGPug2tyO9ZPTJvGb9U3eRwwwxzxM=;
        b=fLbx8s1IaqhXcPrQ33FtDtM8m+ydjRETb0mMhbnFOVRQsqHueYS5rmXoefTM7B07k7
         lcKMbrRazDcn2rWBCoWx9oPSNCGUxv2yo4ZdmJnMWGkepdWnaBi8hYvV+2i8BkinWpeU
         FGsuDRdbvnXFR32cOfK1+xI8SjwZxdC78X2agX/sz+pDeY4pP0gW5+n+qaHmnSvFkTha
         5bGwNXReXQxbvAviyTZx1NAzFCA3Uj0ILs4P7DgVNuRVR5AAJ4t+hfNlkmALSFM4tlTx
         GOV6qk1Sm/ccNdVp4uCLOnDsaBPzXpn7r7e300SxIYJcMNGc1BZUuZM3+PhsGoTju6Tp
         gEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RjEpDesXyeRNmLhGPug2tyO9ZPTJvGb9U3eRwwwxzxM=;
        b=H5QEd+j4gdFnqesiXi8IqcHllZaH/51ELhQksdKpZh3iHHnJ/joI19uiEI6kc+Fmvg
         qBzaHkWNQsPOR31X0pmogvfKXuKxeLHmqcU6yOH80Xi4tndmu82jl4iut1IeWjT1FhbW
         IGonP6dQBmYq4J1+seLrtge56b/h4WTpn1QNJ1+rmfTM0b2gDdDLyf18vyEnlrQlS2UM
         2ybHO7cQxJsIec4ehgElJWGl3FbTsQAm8MvU/bMPDZdBsjtD1JSCC8jV3a43tXu5hsfF
         p5diKSl/+of+D9gp8LbxWWwYr3n0sp+aLJ6dU0uBW8JPx0LaBSeO3u5QfnG+R5esGt0/
         C4oQ==
X-Gm-Message-State: AOAM532TOvRQoyL/7INgVfbc7qNCLsDoxcyFzhwKgl6UXBD4LgJGuVXa
        Dm56eFdVnlDvbBG19mEVRm3svA==
X-Google-Smtp-Source: ABdhPJwNq9S23EUrLNRkNg1xBZL0MAyyZbWhvpfzK0I40MBcAZID7U7aXBdF0ROuF0BwElx8BlvpSw==
X-Received: by 2002:a19:4247:: with SMTP id p68mr1603359lfa.22.1594888102419;
        Thu, 16 Jul 2020 01:28:22 -0700 (PDT)
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id b2sm1076455lji.63.2020.07.16.01.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 01:28:21 -0700 (PDT)
Subject: Re: [PATCHv3 2/7] qcom/camss: use vb2_video_unregister_device()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Robert Foss <robert.foss@linaro.org>
Cc:     linux-media <linux-media@vger.kernel.org>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
 <20200713113048.1150542-3-hverkuil-cisco@xs4all.nl>
 <CAG3jFytOcv=0LuckgUvCpbdGe=F=4OrtbC8JPcH5ETBoL_xb7g@mail.gmail.com>
 <73999d49-17c6-2dd9-c8e3-8aaad81fd3a1@xs4all.nl>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <0c2f24e1-f374-3894-71c3-e3f72fde781a@linaro.org>
Date:   Thu, 16 Jul 2020 11:28:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <73999d49-17c6-2dd9-c8e3-8aaad81fd3a1@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 16.07.2020 11:12, Hans Verkuil wrote:
> On 13/07/2020 18:05, Robert Foss wrote:
>> On Mon, 13 Jul 2020 at 13:30, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>
>>> Use vb2_video_unregister_device() to automatically stop streaming
>>> at unregister time.
>>>
>>> This avoids the use of vb2_queue_release() which should not be
>>> called by drivers that set vdev->queue.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Cc: Robert Foss <robert.foss@linaro.org>
>>> Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
>>> ---
>>>   drivers/media/platform/qcom/camss/camss-vfe.c   |  8 --------
>>>   drivers/media/platform/qcom/camss/camss-vfe.h   |  2 --
>>>   drivers/media/platform/qcom/camss/camss-video.c | 12 ++----------
>>>   drivers/media/platform/qcom/camss/camss-video.h |  2 --
>>>   drivers/media/platform/qcom/camss/camss.c       |  5 -----
>>>   5 files changed, 2 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> index fc31c2c169cd..b7d2293a5004 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> @@ -2205,14 +2205,6 @@ static const struct camss_video_ops camss_vfe_video_ops = {
>>>          .flush_buffers = vfe_flush_buffers,
>>>   };
>>>
>>> -void msm_vfe_stop_streaming(struct vfe_device *vfe)
>>> -{
>>> -       int i;
>>> -
>>> -       for (i = 0; i < ARRAY_SIZE(vfe->line); i++)
>>> -               msm_video_stop_streaming(&vfe->line[i].video_out);
>>> -}
>>> -
>>>   /*
>>>    * msm_vfe_register_entities - Register subdev node for VFE module
>>>    * @vfe: VFE device
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
>>> index 0d10071ae881..a90b0d2cc6de 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>>> @@ -178,8 +178,6 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
>>>   void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
>>>   void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
>>>
>>> -void msm_vfe_stop_streaming(struct vfe_device *vfe);
>>> -
>>>   extern const struct vfe_hw_ops vfe_ops_4_1;
>>>   extern const struct vfe_hw_ops vfe_ops_4_7;
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
>>> index cdbd6dba1122..0e2fcee97eeb 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-video.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-video.c
>>> @@ -879,7 +879,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>>          if (ret < 0) {
>>>                  dev_err(v4l2_dev->dev, "Failed to init video entity: %d\n",
>>>                          ret);
>>> -               goto error_media_init;
>>> +               goto error_vb2_init;
>>>          }
>>>
>>>          mutex_init(&video->lock);
>>> @@ -936,23 +936,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>>   error_video_register:
>>>          media_entity_cleanup(&vdev->entity);
>>>          mutex_destroy(&video->lock);
>>> -error_media_init:
>>> -       vb2_queue_release(&video->vb2_q);
>>>   error_vb2_init:
>>>          mutex_destroy(&video->q_lock);
>>>
>>>          return ret;
>>>   }
>>>
>>> -void msm_video_stop_streaming(struct camss_video *video)
>>> -{
>>> -       if (vb2_is_streaming(&video->vb2_q))
>>> -               vb2_queue_release(&video->vb2_q);
>>> -}
>>> -
>>>   void msm_video_unregister(struct camss_video *video)
>>>   {
>>>          atomic_inc(&video->camss->ref_count);
>>> -       video_unregister_device(&video->vdev);
>>> +       vb2_video_unregister_device(&video->vdev);
>>>          atomic_dec(&video->camss->ref_count);
>>>   }
>>> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
>>> index aa35e8cc6fd5..bdbae8424140 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-video.h
>>> +++ b/drivers/media/platform/qcom/camss/camss-video.h
>>> @@ -52,8 +52,6 @@ struct camss_video {
>>>          unsigned int nformats;
>>>   };
>>>
>>> -void msm_video_stop_streaming(struct camss_video *video);
>>> -
>>>   int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>>                         const char *name, int is_pix);
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>>> index 3fdc9f964a3c..d0f4360eb9a0 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -964,13 +964,8 @@ void camss_delete(struct camss *camss)
>>>    */
>>>   static int camss_remove(struct platform_device *pdev)
>>>   {
>>> -       unsigned int i;
>>> -
>>>          struct camss *camss = platform_get_drvdata(pdev);
>>>
>>> -       for (i = 0; i < camss->vfe_num; i++)
>>> -               msm_vfe_stop_streaming(&camss->vfe[i]);
>>> -
>>
>> I'm trying to understand this change, with msm_vfe_stop_streaming
>> removed, are we relying on vb2_video_unregister_device being called
>> through some other path?
>>
>>>          v4l2_async_notifier_unregister(&camss->notifier);
>>>          v4l2_async_notifier_cleanup(&camss->notifier);
>>>          camss_unregister_entities(camss);
> 
> Yes: camss_unregister_entities -> camss_unregister_entities ->
> 	msm_vfe_unregister_entities -> msm_video_unregister -> vb2_video_unregister_device
> 
> I have to say that this is a pretty convoluted call sequence, it took me a
> bit of time to unravel it.
> 
> That said, I think I want a 'Tested-by' before I'll apply this specific patch.
> 
> Unfortunately, I don't have hardware to test this. Are you or Andrey able to test it?

I can do that.

Thanks,
Andrey

> Regards,
> 
> 	Hans
> 
