Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8596E22407C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 18:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgGQQWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 12:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgGQQWD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 12:22:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1C0C0619D2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2020 09:22:03 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q7so13409669ljm.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2020 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fACPoBVYgPA8RnowVulSozftVjrJWXaD3641z7TZC/o=;
        b=BTmMpQYkjVK0sBHR/4B9I3dz3j4IFNf7gx5XspMYuuOhHpBZOEZkwz43xNodFQxe+J
         x3sTfOd0AuRYL1aCntiLUlonhT8SFL37Ug0DhJH6WSPiJNM6yrb5gQFS/KgIHnKmeIRR
         kwk4TlcGtm2gHzCGLqaJeX3OQA6b+DxckKizhETcUwT7h9/8wBZX2JaZ5NbxYxGYsQXF
         agByqcfk+OL0PgfZOEgxZY9WcfiTHrt3Ah4befdLjBX/YJP36QTaCMt3G2aPVLdBzSR/
         S+DxfGSbuA6FYHrm6vOIMbD/a0JXWbPg6d/WhT2sm8T6cRca1+NQBVRpa88xnmWliLIE
         Op1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fACPoBVYgPA8RnowVulSozftVjrJWXaD3641z7TZC/o=;
        b=sYwUiQExD285Tv+FkPGi7awoZPnrPd+tdTC1sxO/BLmnbMT+q5W1EIxNUhcFrTOkG5
         B0eJRYQKEYuXMxcim9f+ror985DD6Y+MDOPO6p5EoCmTlPic8/SbVV4hgt/i2G0so0vj
         DaL9AntVdGpiYXCvCG1auUNKLww88V63sgDQzFXTTYhAofoD88n7ef7zstYSIubIRQRt
         bYXSl4xeo8D9NaIGp8phJwi994qkOCL9jNpETjyj8/9M/oxDGewECXiHrnxlhxzOaRBO
         NWsB9G9FZOtS1d+dvLujT+rbv7lxWdnFBH1hfKyobiNHHJemV/+N/GUtC+kZQSTTnWE6
         nHqg==
X-Gm-Message-State: AOAM532mTn5iRTnEhARdRqd0EPn4P+P0NFrx0daLKTTSn/nXVPoBGqTh
        K0hFYMukGelcowo5z3ZjqpCzUQ==
X-Google-Smtp-Source: ABdhPJwZ8JSSL7WSwccdWrTKOynOhYUvfBj2377YQQ1rvq+pmz/JLbPmPBqF+ne/DGDsJTjtSJexVg==
X-Received: by 2002:a2e:3c03:: with SMTP id j3mr5127997lja.12.1595002921923;
        Fri, 17 Jul 2020 09:22:01 -0700 (PDT)
Received: from [192.168.118.216] (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.gmail.com with ESMTPSA id i22sm1720904ljb.19.2020.07.17.09.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 09:22:01 -0700 (PDT)
Subject: Re: [PATCHv3 2/7] qcom/camss: use vb2_video_unregister_device()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
 <20200713113048.1150542-3-hverkuil-cisco@xs4all.nl>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <b83173a4-e424-f9e4-f983-ada26a687708@linaro.org>
Date:   Fri, 17 Jul 2020 19:21:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713113048.1150542-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I've applied the first two patches of this series, and have given them a try
on db410c board with imx327c camera module by Framos.
Looks good.

Tested-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

On 13.07.2020 14:30, Hans Verkuil wrote:
> Use vb2_video_unregister_device() to automatically stop streaming
> at unregister time.
> 
> This avoids the use of vb2_queue_release() which should not be
> called by drivers that set vdev->queue.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c   |  8 --------
>   drivers/media/platform/qcom/camss/camss-vfe.h   |  2 --
>   drivers/media/platform/qcom/camss/camss-video.c | 12 ++----------
>   drivers/media/platform/qcom/camss/camss-video.h |  2 --
>   drivers/media/platform/qcom/camss/camss.c       |  5 -----
>   5 files changed, 2 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index fc31c2c169cd..b7d2293a5004 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2205,14 +2205,6 @@ static const struct camss_video_ops camss_vfe_video_ops = {
>   	.flush_buffers = vfe_flush_buffers,
>   };
>   
> -void msm_vfe_stop_streaming(struct vfe_device *vfe)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(vfe->line); i++)
> -		msm_video_stop_streaming(&vfe->line[i].video_out);
> -}
> -
>   /*
>    * msm_vfe_register_entities - Register subdev node for VFE module
>    * @vfe: VFE device
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 0d10071ae881..a90b0d2cc6de 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -178,8 +178,6 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
>   void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
>   void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
>   
> -void msm_vfe_stop_streaming(struct vfe_device *vfe);
> -
>   extern const struct vfe_hw_ops vfe_ops_4_1;
>   extern const struct vfe_hw_ops vfe_ops_4_7;
>   
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index cdbd6dba1122..0e2fcee97eeb 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -879,7 +879,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>   	if (ret < 0) {
>   		dev_err(v4l2_dev->dev, "Failed to init video entity: %d\n",
>   			ret);
> -		goto error_media_init;
> +		goto error_vb2_init;
>   	}
>   
>   	mutex_init(&video->lock);
> @@ -936,23 +936,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>   error_video_register:
>   	media_entity_cleanup(&vdev->entity);
>   	mutex_destroy(&video->lock);
> -error_media_init:
> -	vb2_queue_release(&video->vb2_q);
>   error_vb2_init:
>   	mutex_destroy(&video->q_lock);
>   
>   	return ret;
>   }
>   
> -void msm_video_stop_streaming(struct camss_video *video)
> -{
> -	if (vb2_is_streaming(&video->vb2_q))
> -		vb2_queue_release(&video->vb2_q);
> -}
> -
>   void msm_video_unregister(struct camss_video *video)
>   {
>   	atomic_inc(&video->camss->ref_count);
> -	video_unregister_device(&video->vdev);
> +	vb2_video_unregister_device(&video->vdev);
>   	atomic_dec(&video->camss->ref_count);
>   }
> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
> index aa35e8cc6fd5..bdbae8424140 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.h
> +++ b/drivers/media/platform/qcom/camss/camss-video.h
> @@ -52,8 +52,6 @@ struct camss_video {
>   	unsigned int nformats;
>   };
>   
> -void msm_video_stop_streaming(struct camss_video *video);
> -
>   int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>   		       const char *name, int is_pix);
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3fdc9f964a3c..d0f4360eb9a0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -964,13 +964,8 @@ void camss_delete(struct camss *camss)
>    */
>   static int camss_remove(struct platform_device *pdev)
>   {
> -	unsigned int i;
> -
>   	struct camss *camss = platform_get_drvdata(pdev);
>   
> -	for (i = 0; i < camss->vfe_num; i++)
> -		msm_vfe_stop_streaming(&camss->vfe[i]);
> -
>   	v4l2_async_notifier_unregister(&camss->notifier);
>   	v4l2_async_notifier_cleanup(&camss->notifier);
>   	camss_unregister_entities(camss);
> 
