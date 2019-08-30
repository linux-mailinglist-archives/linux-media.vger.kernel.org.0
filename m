Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE807A374E
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 14:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbfH3M5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 08:57:15 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40508 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbfH3M5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 08:57:14 -0400
Received: by mail-qt1-f195.google.com with SMTP id g4so7456952qtq.7
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 05:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=U51dzlsgckdiz6fwcExqUkLC5XNksk6+iVuJdvVqhv4=;
        b=TqLFMeKfkXjLYMP5h+m7R1Nmb3Rweo8K3TRgUYPbBaeyKreju9crPnlURwAuU+HjWp
         u6RDrWbT0cef6JhFOPF6+TNZ+6fAacs+crwsLAT4zGHtZmYfRzlHDVhASZ2C9Hf21cTa
         tR1UW/5DgEPhHoa8TpURnIvXnIonXtNksb7zBGMXciUomqfbDYwzyAM2KVLa+qlyAh84
         APjCYiP+obRp3i9Fh5+0wgjcTC/lG8/4k56fsUXZPITRMbXYyi3F7ElLLGrqqXstXwYs
         ucPsdk6f+JSB1InuCLhXLqcXG1fi3P4QVzYzYldhJSrp8wp8LcEsDjSDxFQDwqcu+4od
         DzZA==
X-Gm-Message-State: APjAAAWZYRV9HWgp+x50LIWfeth58S1QP8BBAuGAHuLLdNEBpBfNTaDU
        EF1xWHMCo1b42W40OgjKC4g=
X-Google-Smtp-Source: APXvYqzZP707/xLozrwpqTbHX4wGOw4Csg4TXUyEBvoNfuqDfwwsQmJx16zSPFIP7TJTf02ABY6+xQ==
X-Received: by 2002:ac8:60d6:: with SMTP id i22mr11727031qtm.250.1567169833059;
        Fri, 30 Aug 2019 05:57:13 -0700 (PDT)
Received: from [172.16.0.115] ([177.103.155.130])
        by smtp.gmail.com with ESMTPSA id o27sm2690070qkm.37.2019.08.30.05.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 05:57:11 -0700 (PDT)
Subject: Re: [PATCH] media: vimc: upon streaming, check that the pipeline
 starts with a source entity
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com
References: <20190829110032.4187-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen@koikeco.de>
Openpgp: preference=signencrypt
Autocrypt: addr=helen@koikeco.de; keydata=
 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
Message-ID: <60bd2bd2-159c-81fb-3afb-274c124d64df@koikeco.de>
Date:   Fri, 30 Aug 2019 09:57:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190829110032.4187-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch. Just small comments below.

On 8/29/19 8:00 AM, Dafna Hirschfeld wrote:
> Userspace can disable links and create pipelines that
> do not start with a source entity. Trying to stream
> from such a pipeline should fail with -EPIPE
> currently this is not handled and cause kernel crash.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> Hi,
> These are the commands to reproduce the crash:
> media-ctl -d0 -l "5:1->21:0[0]" -v
> v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
> v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2
> 
> drivers/media/platform/vimc/vimc-streamer.c | 39 +++++++++++++++------
>  1 file changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index 048d770e498b..bfc7921c7a8b 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.c
> +++ b/drivers/media/platform/vimc/vimc-streamer.c
> @@ -13,6 +13,19 @@
>  
>  #include "vimc-streamer.h"
>  
> +/**
> + * Check if the entity has only source pads
> + */

please add docs like the other functions in this file.

> +static bool vimc_is_source(struct media_entity *ent)
> +{
> +	int i;

unsigned

Regards,
Helen

> +
> +	for (i = 0; i < ent->num_pads; i++)
> +		if (ent->pads[i].flags & MEDIA_PAD_FL_SINK)
> +			return false;
> +	return true;
> +}
> +
>  /**
>   * vimc_get_source_entity - get the entity connected with the first sink pad
>   *
> @@ -83,14 +96,12 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  	struct media_entity *entity;
>  	struct video_device *vdev;
>  	struct v4l2_subdev *sd;
> -	int ret = 0;
> +	int ret = -EINVAL;
>  
>  	stream->pipe_size = 0;
>  	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> -		if (!ved) {
> -			vimc_streamer_pipeline_terminate(stream);
> -			return -EINVAL;
> -		}
> +		if (!ved)
> +			break;
>  		stream->ved_pipeline[stream->pipe_size++] = ved;
>  
>  		if (is_media_entity_v4l2_subdev(ved->ent)) {
> @@ -99,15 +110,22 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  			if (ret && ret != -ENOIOCTLCMD) {
>  				pr_err("subdev_call error %s\n",
>  				       ved->ent->name);
> -				vimc_streamer_pipeline_terminate(stream);
> -				return ret;
> +				break;
>  			}
>  		}
>  
>  		entity = vimc_get_source_entity(ved->ent);
> -		/* Check if the end of the pipeline was reached*/
> -		if (!entity)
> +		/* Check if the end of the pipeline was reached */
> +		if (!entity) {
> +			/* the first entity of the pipe should be source only */
> +			if (!vimc_is_source(ved->ent)) {
> +				pr_err("first entity in the pipe '%s' is not a source\n",
> +				       ved->ent->name);
> +				ret = -EPIPE;
> +				break;
> +			}
>  			return 0;
> +		}
>  
>  		/* Get the next device in the pipeline */
>  		if (is_media_entity_v4l2_subdev(entity)) {
> @@ -120,9 +138,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  			ved = video_get_drvdata(vdev);
>  		}
>  	}
> -
>  	vimc_streamer_pipeline_terminate(stream);
> -	return -EINVAL;
> +	return ret;
>  }
>  
>  /**
> 
