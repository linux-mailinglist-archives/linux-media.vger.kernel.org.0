Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2619F21DB2E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 18:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgGMQFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 12:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGMQFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 12:05:24 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C834EC061755
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 09:05:24 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id j11so11368196oiw.12
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oU2jrnv3uHeDUkpBJlxwF0TRyYlDOZF4Q/HwqCY9EeM=;
        b=LQZUKG3diz6eCy4QxQb3ad3Q9JD+udlNAGh6yDDfXTYcft9xkq6sn3u75a3QWsxn3d
         /TbEx37oacnSGpQwjOhLg8OIFYLdKLx3OqBDVFmpswbZLICnROoVnkVQpu9fdajss3bs
         8sDSMZ9zP87QsfNnw4Aqw1vBhj5nCDqhW3OUlQWBxm3wg8pbYrejfEe9tTLFf5EnLw99
         sydZMBa3SN7Om1p/lzwRe7sg1ws5CMwwQovLHAj396hWnDiq92tjAl+NXks2XQmhzmkx
         xCO1zxGTStvvHmcmNf4XWLjeZI1UpB2XtQFA+oghUUGoByZgARmaoZvR1k8c5yYuO2+p
         QVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oU2jrnv3uHeDUkpBJlxwF0TRyYlDOZF4Q/HwqCY9EeM=;
        b=C1z4oajuArOiXlFANXuQhCqFFwuJYyrP/SElmUkP6Tn4+nEfTJBECoYu5sEDLJDo6n
         DwLinhJF39EvqdvFpqQvwdq4c6OUwY2XnSYKf4BZzaFI/rOaRWBBFZURRThN3OtlerKw
         PgQn4xxSw5gYT5kVbKR5izU8ARPCzj8IIwPvAK5v2uvR/gq07G6l2lvbgsiJu3anIW06
         hVyqBMKP51ubN3ZROM10eHSL1r47pKr5PlHgDHjd7jBXYM/Ga/BGSVkSVQ3Kb1Nsqwwm
         AbdhDOj6qHdrNMXvva1eMZUgVpk4LGm7zPAEeVVSSmWN2f4OwQY0ly7gWIOOz4JYoBWC
         tKew==
X-Gm-Message-State: AOAM532TnxetcJeANZw9WINK6uUbB2bG/DmDhKLGULda88MhdTgjR6xl
        K1C0kkgnbGcV7MPtfaSHyKD6dA+7KpVWK6ufBl4P0g==
X-Google-Smtp-Source: ABdhPJzGTwz5tHNG+UMbFiPOWBO76kfy8A7WrbJh4OArE/PCTZKi4H2E23ByplsdCprUct6va4HKBPY3YvM2a4usoBk=
X-Received: by 2002:aca:eb17:: with SMTP id j23mr112250oih.56.1594656323957;
 Mon, 13 Jul 2020 09:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl> <20200713113048.1150542-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20200713113048.1150542-3-hverkuil-cisco@xs4all.nl>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 13 Jul 2020 18:05:07 +0200
Message-ID: <CAG3jFytOcv=0LuckgUvCpbdGe=F=4OrtbC8JPcH5ETBoL_xb7g@mail.gmail.com>
Subject: Re: [PATCHv3 2/7] qcom/camss: use vb2_video_unregister_device()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 13 Jul 2020 at 13:30, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
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
>  drivers/media/platform/qcom/camss/camss-vfe.c   |  8 --------
>  drivers/media/platform/qcom/camss/camss-vfe.h   |  2 --
>  drivers/media/platform/qcom/camss/camss-video.c | 12 ++----------
>  drivers/media/platform/qcom/camss/camss-video.h |  2 --
>  drivers/media/platform/qcom/camss/camss.c       |  5 -----
>  5 files changed, 2 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index fc31c2c169cd..b7d2293a5004 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2205,14 +2205,6 @@ static const struct camss_video_ops camss_vfe_video_ops = {
>         .flush_buffers = vfe_flush_buffers,
>  };
>
> -void msm_vfe_stop_streaming(struct vfe_device *vfe)
> -{
> -       int i;
> -
> -       for (i = 0; i < ARRAY_SIZE(vfe->line); i++)
> -               msm_video_stop_streaming(&vfe->line[i].video_out);
> -}
> -
>  /*
>   * msm_vfe_register_entities - Register subdev node for VFE module
>   * @vfe: VFE device
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index 0d10071ae881..a90b0d2cc6de 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -178,8 +178,6 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
>  void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
>  void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
>
> -void msm_vfe_stop_streaming(struct vfe_device *vfe);
> -
>  extern const struct vfe_hw_ops vfe_ops_4_1;
>  extern const struct vfe_hw_ops vfe_ops_4_7;
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index cdbd6dba1122..0e2fcee97eeb 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -879,7 +879,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>         if (ret < 0) {
>                 dev_err(v4l2_dev->dev, "Failed to init video entity: %d\n",
>                         ret);
> -               goto error_media_init;
> +               goto error_vb2_init;
>         }
>
>         mutex_init(&video->lock);
> @@ -936,23 +936,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>  error_video_register:
>         media_entity_cleanup(&vdev->entity);
>         mutex_destroy(&video->lock);
> -error_media_init:
> -       vb2_queue_release(&video->vb2_q);
>  error_vb2_init:
>         mutex_destroy(&video->q_lock);
>
>         return ret;
>  }
>
> -void msm_video_stop_streaming(struct camss_video *video)
> -{
> -       if (vb2_is_streaming(&video->vb2_q))
> -               vb2_queue_release(&video->vb2_q);
> -}
> -
>  void msm_video_unregister(struct camss_video *video)
>  {
>         atomic_inc(&video->camss->ref_count);
> -       video_unregister_device(&video->vdev);
> +       vb2_video_unregister_device(&video->vdev);
>         atomic_dec(&video->camss->ref_count);
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
> index aa35e8cc6fd5..bdbae8424140 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.h
> +++ b/drivers/media/platform/qcom/camss/camss-video.h
> @@ -52,8 +52,6 @@ struct camss_video {
>         unsigned int nformats;
>  };
>
> -void msm_video_stop_streaming(struct camss_video *video);
> -
>  int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
>                        const char *name, int is_pix);
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 3fdc9f964a3c..d0f4360eb9a0 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -964,13 +964,8 @@ void camss_delete(struct camss *camss)
>   */
>  static int camss_remove(struct platform_device *pdev)
>  {
> -       unsigned int i;
> -
>         struct camss *camss = platform_get_drvdata(pdev);
>
> -       for (i = 0; i < camss->vfe_num; i++)
> -               msm_vfe_stop_streaming(&camss->vfe[i]);
> -

I'm trying to understand this change, with msm_vfe_stop_streaming
removed, are we relying on vb2_video_unregister_device being called
through some other path?

>         v4l2_async_notifier_unregister(&camss->notifier);
>         v4l2_async_notifier_cleanup(&camss->notifier);
>         camss_unregister_entities(camss);
> --
> 2.27.0
>
