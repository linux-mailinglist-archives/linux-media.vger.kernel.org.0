Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECEB221DF2
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 10:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgGPINE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 04:13:04 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:32881 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725831AbgGPINE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 04:13:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id vz0kjTfICyPEdvz0nj3MOZ; Thu, 16 Jul 2020 10:13:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594887181; bh=5V2F1ZKx9EpiEyq24XfwEz7N8TGJNHhgBwxQZx2lFkA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JexewlAhvgD7V0UBS2GgGKImqhZvH7QONyy8mPlCZTYcbqEjGerKxp8C39HDtJ9fs
         gum1XJlcNKW/Wx36PSHUupTPNvYZuUh+ID9Nv3vZ4yHcio2BOXuEgdKIlksqEmddzx
         Px0llyJGTKAayzKQQBYeZNoIXbS9jEVI0aIxTlVQZEYXuuxm1CY9opckARVqRVoIhK
         69+xIiNkre6ZpzSdPRCL94w5foW518z3LZf31loX0NbWjjenBJKTsOq9Ys30z3VNSo
         YDvwMwfRd0A2uLNsfMj6qZOAmRCWajDKn9p0jdL+8GESDjfQMpE88TqnIMmiYSrfKK
         VGw6HVd1h6NFA==
Subject: Re: [PATCHv3 2/7] qcom/camss: use vb2_video_unregister_device()
To:     Robert Foss <robert.foss@linaro.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
 <20200713113048.1150542-3-hverkuil-cisco@xs4all.nl>
 <CAG3jFytOcv=0LuckgUvCpbdGe=F=4OrtbC8JPcH5ETBoL_xb7g@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <73999d49-17c6-2dd9-c8e3-8aaad81fd3a1@xs4all.nl>
Date:   Thu, 16 Jul 2020 10:12:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFytOcv=0LuckgUvCpbdGe=F=4OrtbC8JPcH5ETBoL_xb7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMmBUrkIjwFruX5pbGdrDJ5LeYYX+Ld14dE12J/1zmZrLOHzjgi5SqyJfoDcNt3brCaDxS1KXjJK0HSJsm8fpgjKc6diM6Vgae1tGkajjAJrWcqphU38
 FV1eVgIk768OhJBRgOxAOQrYjClhCvGybN+3fdkQn2mVSggKu0ea3vI0NzWwoZ38N1xcOFsqtwpoTDjSJNzIJzq5EonX/MDaHIPiOSd065KkntTKmFBrVbRR
 cywnmPtuPV4I5Bu42it5GcM2Ad0zViSUylAd+IsTVSk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/07/2020 18:05, Robert Foss wrote:
> On Mon, 13 Jul 2020 at 13:30, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
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
>>  drivers/media/platform/qcom/camss/camss-vfe.c   |  8 --------
>>  drivers/media/platform/qcom/camss/camss-vfe.h   |  2 --
>>  drivers/media/platform/qcom/camss/camss-video.c | 12 ++----------
>>  drivers/media/platform/qcom/camss/camss-video.h |  2 --
>>  drivers/media/platform/qcom/camss/camss.c       |  5 -----
>>  5 files changed, 2 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index fc31c2c169cd..b7d2293a5004 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -2205,14 +2205,6 @@ static const struct camss_video_ops camss_vfe_video_ops = {
>>         .flush_buffers = vfe_flush_buffers,
>>  };
>>
>> -void msm_vfe_stop_streaming(struct vfe_device *vfe)
>> -{
>> -       int i;
>> -
>> -       for (i = 0; i < ARRAY_SIZE(vfe->line); i++)
>> -               msm_video_stop_streaming(&vfe->line[i].video_out);
>> -}
>> -
>>  /*
>>   * msm_vfe_register_entities - Register subdev node for VFE module
>>   * @vfe: VFE device
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
>> index 0d10071ae881..a90b0d2cc6de 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>> @@ -178,8 +178,6 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
>>  void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
>>  void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
>>
>> -void msm_vfe_stop_streaming(struct vfe_device *vfe);
>> -
>>  extern const struct vfe_hw_ops vfe_ops_4_1;
>>  extern const struct vfe_hw_ops vfe_ops_4_7;
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
>> index cdbd6dba1122..0e2fcee97eeb 100644
>> --- a/drivers/media/platform/qcom/camss/camss-video.c
>> +++ b/drivers/media/platform/qcom/camss/camss-video.c
>> @@ -879,7 +879,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>         if (ret < 0) {
>>                 dev_err(v4l2_dev->dev, "Failed to init video entity: %d\n",
>>                         ret);
>> -               goto error_media_init;
>> +               goto error_vb2_init;
>>         }
>>
>>         mutex_init(&video->lock);
>> @@ -936,23 +936,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>  error_video_register:
>>         media_entity_cleanup(&vdev->entity);
>>         mutex_destroy(&video->lock);
>> -error_media_init:
>> -       vb2_queue_release(&video->vb2_q);
>>  error_vb2_init:
>>         mutex_destroy(&video->q_lock);
>>
>>         return ret;
>>  }
>>
>> -void msm_video_stop_streaming(struct camss_video *video)
>> -{
>> -       if (vb2_is_streaming(&video->vb2_q))
>> -               vb2_queue_release(&video->vb2_q);
>> -}
>> -
>>  void msm_video_unregister(struct camss_video *video)
>>  {
>>         atomic_inc(&video->camss->ref_count);
>> -       video_unregister_device(&video->vdev);
>> +       vb2_video_unregister_device(&video->vdev);
>>         atomic_dec(&video->camss->ref_count);
>>  }
>> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
>> index aa35e8cc6fd5..bdbae8424140 100644
>> --- a/drivers/media/platform/qcom/camss/camss-video.h
>> +++ b/drivers/media/platform/qcom/camss/camss-video.h
>> @@ -52,8 +52,6 @@ struct camss_video {
>>         unsigned int nformats;
>>  };
>>
>> -void msm_video_stop_streaming(struct camss_video *video);
>> -
>>  int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>>                        const char *name, int is_pix);
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 3fdc9f964a3c..d0f4360eb9a0 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -964,13 +964,8 @@ void camss_delete(struct camss *camss)
>>   */
>>  static int camss_remove(struct platform_device *pdev)
>>  {
>> -       unsigned int i;
>> -
>>         struct camss *camss = platform_get_drvdata(pdev);
>>
>> -       for (i = 0; i < camss->vfe_num; i++)
>> -               msm_vfe_stop_streaming(&camss->vfe[i]);
>> -
> 
> I'm trying to understand this change, with msm_vfe_stop_streaming
> removed, are we relying on vb2_video_unregister_device being called
> through some other path?
> 
>>         v4l2_async_notifier_unregister(&camss->notifier);
>>         v4l2_async_notifier_cleanup(&camss->notifier);
>>         camss_unregister_entities(camss);

Yes: camss_unregister_entities -> camss_unregister_entities ->
	msm_vfe_unregister_entities -> msm_video_unregister -> vb2_video_unregister_device

I have to say that this is a pretty convoluted call sequence, it took me a
bit of time to unravel it.

That said, I think I want a 'Tested-by' before I'll apply this specific patch.

Unfortunately, I don't have hardware to test this. Are you or Andrey able to test it?

Regards,

	Hans
