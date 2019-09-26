Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93FFFBF51B
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 16:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfIZOcy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 10:32:54 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39072 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfIZOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 10:32:54 -0400
Received: by mail-io1-f67.google.com with SMTP id a1so7109531ioc.6
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x1epx2+14seAC0bL8bquHz3k7HkVZCN5A34vqQ9JENQ=;
        b=YEFTqdLLPM8AHYKqV+joCrZGaEW12fVcx4gONzilIeYImPsz4EQWn/etUXP0tg5mtB
         yeZHLoHS3idUVqMsVywIgmuj2NbJRWM3T9S+6k572+T1k0AdLiU7lFRyzMXzGwDzA0Je
         U277nPpgc+kqjhdyE0xG4vVPGET6CsuljFOmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x1epx2+14seAC0bL8bquHz3k7HkVZCN5A34vqQ9JENQ=;
        b=NWsXNtoalTN6L4gYZNGP8hEZPrktWSKLmcmAK1JJd/NUylQhCqhES7f+QD5meESE+n
         galNc2ZQHpClq4pr1csv4HFQTGhWw7LUotGhgRr4rm5+/pGw6NewWar9NsQ6R+ExEh/Q
         /eI+wVjJetwq3fWlz/2aR0nD8prrb6UsfZi88GsE9iK944JHdLIkT5Za6bd5g3O+MNKg
         TlNfqMbd/Y7btTorg1OZzs7vusovbrAywLoA0CWQmQeSJFcYDxWHYltvJ14t8g6crytv
         f/yRAKXhyUAgFb55y63c+e0gqY/9TN1sENdMq6b5aeAIDeLOZNEFwSnb/o4zjffY/Zpi
         b/7w==
X-Gm-Message-State: APjAAAWE1Rbr/aJmE1ba5JCgfH211BSO6M07XFos3kCVti6tAwYHpljt
        byxkAmh48kdMrtkB8KGTWVBSEw==
X-Google-Smtp-Source: APXvYqxEi4pB4X6uRrcBoW+0thlkX7AmwBJ/Uc1bvoUAA6VvcyByfoWVAr+FHA7MXfsE8HfI7k0oIQ==
X-Received: by 2002:a6b:c402:: with SMTP id y2mr3651727ioa.136.1569508373614;
        Thu, 26 Sep 2019 07:32:53 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id k66sm1494068iof.25.2019.09.26.07.32.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 07:32:52 -0700 (PDT)
Subject: Re: [PATCH 1/5] media: vimc: upon streaming, check that the pipeline
 starts with a source entity
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
 <20190919203208.12515-2-dafna.hirschfeld@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <45a7e861-97ad-6149-610d-49bf8343215f@linuxfoundation.org>
Date:   Thu, 26 Sep 2019 08:32:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919203208.12515-2-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/19/19 2:32 PM, Dafna Hirschfeld wrote:
> Userspace can disable links and create pipelines that
> do not start with a source entity. Trying to stream
> from such a pipeline should fail with -EPIPE
> currently this is not handled and cause kernel crash.
> 

Minor: Can you make these 75 long. Makes it easier to read.

> Reproducing the crash:
> media-ctl -d0 -l "5:1->21:0[0]" -v
> v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
> v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2

I really would like to see the panic message so it can checked during
testing.

If you are fixing a panic, please include the panic info. in the future.

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>   drivers/media/platform/vimc/vimc-streamer.c | 39 +++++++++++++++------
>   1 file changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index faa2879c25df..d0a9f8a0f26a 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.c
> +++ b/drivers/media/platform/vimc/vimc-streamer.c
> @@ -12,6 +12,19 @@
>   
>   #include "vimc-streamer.h"
>   
> +/**
> + * Check if the entity has only source pads
> + */
> +static bool vimc_is_source(struct media_entity *ent)
> +{
> +	int i;
> +
> +	for (i = 0; i < ent->num_pads; i++)
> +		if (ent->pads[i].flags & MEDIA_PAD_FL_SINK)
> +			return false;
> +	return true;
> +}
> +

Why not make this a common routine and add it to vimc-common.c?

>   /**
>    * vimc_get_source_entity - get the entity connected with the first sink pad
>    *
> @@ -82,14 +95,12 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>   	struct media_entity *entity;
>   	struct video_device *vdev;
>   	struct v4l2_subdev *sd;
> -	int ret = 0;
> +	int ret = -EINVAL;
>   
>   	stream->pipe_size = 0;
>   	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> -		if (!ved) {
> -			vimc_streamer_pipeline_terminate(stream);
> -			return -EINVAL;
> -		}
> +		if (!ved)
> +			break;
>   		stream->ved_pipeline[stream->pipe_size++] = ved;
>   
>   		if (is_media_entity_v4l2_subdev(ved->ent)) {
> @@ -98,15 +109,22 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>   			if (ret && ret != -ENOIOCTLCMD) {
>   				pr_err("subdev_call error %s\n",
>   				       ved->ent->name);

While you are at it, can you make this a dev_err() instead? I think we
have access to dev here.

> -				vimc_streamer_pipeline_terminate(stream);
> -				return ret;
> +				break;
>   			}
>   		}
>   
>   		entity = vimc_get_source_entity(ved->ent);
> -		/* Check if the end of the pipeline was reached*/
> -		if (!entity)
> +		/* Check if the end of the pipeline was reached */
> +		if (!entity) {
> +			/* the first entity of the pipe should be source only */
> +			if (!vimc_is_source(ved->ent)) {
> +				pr_err("first entity in the pipe '%s' is not a source\n",
> +				       ved->ent->name);

Same commnet about dev_err() here.

> +				ret = -EPIPE;
> +				break;
> +			}
>   			return 0;
> +		}
>   
>   		/* Get the next device in the pipeline */
>   		if (is_media_entity_v4l2_subdev(entity)) {
> @@ -119,9 +137,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>   			ved = video_get_drvdata(vdev);
>   		}
>   	}
> -
>   	vimc_streamer_pipeline_terminate(stream);
> -	return -EINVAL;
> +	return ret;
>   }
>   
>   /**
> 

thanks,
-- Shuah
