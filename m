Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7C6A1ADA
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 15:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfH2NHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 09:07:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33066 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbfH2NHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 09:07:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id B90C528D42D
Subject: Re: [PATCH] media: vimc: upon streaming, check that the pipeline
 starts with a source entity
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        ezequiel@collabora.com
References: <20190829110032.4187-1-dafna.hirschfeld@collabora.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andre.almeida@collabora.com>
Message-ID: <60333548-b905-a3cb-462c-c1abeab982eb@collabora.com>
Date:   Thu, 29 Aug 2019 10:06:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829110032.4187-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Dafna,

Thanks for your patch!

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

You should only use /** when you are writing kernel-doc comments. You
may either replace /** by /*, or add a function documentation[1].

Thanks,
    André

[1]
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation

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
