Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5695F25A931
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 12:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgIBKNQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 06:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIBKNP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 06:13:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5514C061244;
        Wed,  2 Sep 2020 03:13:14 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32A209CC;
        Wed,  2 Sep 2020 12:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599041592;
        bh=ktz25n1HDpTh4QSxQctN3Qhxboucjg/cY9qzXQPk6MA=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=VtztkQyvkCVngriSgBowAjXg8jKIqtm3QN7vqk6lTsZ6N+5WQWGZu1A2i0BX9dNty
         jpUYr60w+1YPMM1bwvfvC7EzsNjU0Z3Xd/o7jnU9bfSVDiJON1UDKcQ9n6SF7d+YTl
         4uogtDWAtED6FwGcjiqcued8D4J1vwChSOQS+5gQ=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 5/9] media: vimc: Separate closing of stream and thread
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-6-kgupta@es.iitr.ac.in>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <1614accb-dee5-1c0e-ece3-ecdd56f45253@ideasonboard.com>
Date:   Wed, 2 Sep 2020 11:13:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819180442.11630-6-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

On 19/08/2020 19:04, Kaaira Gupta wrote:
> Make separate functions for stopping streaming of entities in path of a
> particular stream and stopping thread. This is needed to ensure that
> thread doesn't stop when one device stops streaming in case of multiple
> streams.
> 
> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> ---
>  .../media/test-drivers/vimc/vimc-streamer.c   | 82 ++++++++++++-------
>  1 file changed, 52 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> index cc40ecabe95a..6b5ea1537952 100644
> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> @@ -13,29 +13,59 @@
>  #include "vimc-streamer.h"
>  
>  /**
> - * vimc_streamer_pipeline_terminate - Disable stream in all ved in stream
> + * vimc_streamer_pipeline_terminate - Terminate the thread
>   *
> - * @stream: the pointer to the stream structure with the pipeline to be
> - *	    disabled.
> + * @stream: the pointer to the stream structure
>   *
> - * Calls s_stream to disable the stream in each entity of the pipeline
> + * Erases values of stream struct and terminates the thread

It would help if the function brief described it's purpose rather than
'what it does'. "Erases values of stream struct" is not helpful here, as
that's just a direct read of what happens in the code.

I'm guessing here, but how about:

"Tear down all resources belonging to the pipeline when there are no
longer any active streams being used. This includes stopping the active
processing thread"


But reading my text makes me worry about the ordering that might take
place. The thread should be stopped as soon as the last stream using it
is stopped. Presumably as the 'first thing' that happens to make sure
there is no concurrent processing while the stream is being disabled.

Hopefully there's no race condition ...


>   *
>   */
>  static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>  {
>  	struct vimc_ent_device *ved;
> -	struct v4l2_subdev *sd;
>  
>  	while (stream->pipe_size) {
>  		stream->pipe_size--;
>  		ved = stream->ved_pipeline[stream->pipe_size];
>  		stream->ved_pipeline[stream->pipe_size] = NULL;
> +	}
>  
> -		if (!is_media_entity_v4l2_subdev(ved->ent))
> -			continue;
> +	kthread_stop(stream->kthread);
> +	stream->kthread = NULL;
> +}
>  
> -		sd = media_entity_to_v4l2_subdev(ved->ent);
> -		v4l2_subdev_call(sd, video, s_stream, 0);
> +/**
> + * vimc_streamer_stream_terminate - Disable stream in all ved in stream
> + *
> + * @ved: pointer to the ved for which stream needs to be disabled
> + *
> + * Calls s_stream to disable the stream in each entity of the stream
> + *
> + */
> +static void vimc_streamer_stream_terminate(struct vimc_ent_device *ved)

I would call this vimc_streamer_stream_stop to match
vimc_streamer_stream_start() rather than terminate...

> +{
> +	struct media_entity *entity = ved->ent;
> +	struct video_device *vdev;
> +	struct v4l2_subdev *sd;
> +
> +	while (entity) {
> +		if (is_media_entity_v4l2_subdev(ved->ent)) {
> +			sd = media_entity_to_v4l2_subdev(ved->ent);
> +			v4l2_subdev_call(sd, video, s_stream, 0);
> +		}
> +		entity = vimc_get_source_entity(ved->ent);
> +		if (!entity)
> +			break;
> +
> +		if (is_media_entity_v4l2_subdev(entity)) {
> +			sd = media_entity_to_v4l2_subdev(entity);
> +			ved = v4l2_get_subdevdata(sd);
> +		} else {
> +			vdev = container_of(entity,
> +					    struct video_device,
> +					    entity);
> +			ved = video_get_drvdata(vdev);
> +		}

It looks like this is walking back through the linked graph, calling
s_stream(0) right?

I wonder if struct vimc_ent_device should have a pointer to the entity
it's connected to, to simplify this. ... presumably this is done
elsewhere too?

Although then that's still walking 'backwards' rather than forwards...




>  	}
>  }
>  
> @@ -43,25 +73,25 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
>   * vimc_streamer_stream_start - Starts streaming for all entities
>   * in a stream
>   *
> - * @ved:    the pointer to the vimc entity initializing the stream
> + * @cved:    the pointer to the vimc entity initializing the stream
>   *
>   * Walks through the entity graph to call vimc_streamer_s_stream()
>   * to enable stream in all entities in path of a stream.
>   *
>   * Return: 0 if success, error code otherwise.
>   */
> -static int vimc_streamer_stream_start(struct vimc_stream *stream,
> -				      struct vimc_ent_device *ved)
> +static int vimc_streamer_stream_start(struct vimc_ent_device *cved)
>  {
>  	struct media_entity *entity;
>  	struct video_device *vdev;
>  	struct v4l2_subdev *sd;
> +	struct vimc_ent_device *ved = cved;
>  	int stream_size = 0;
>  	int ret = 0;
>  
>  	while (stream_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
>  		if (!ved) {
> -			vimc_streamer_pipeline_terminate(stream);
> +			vimc_streamer_stream_terminate(cved);
>  			return -EINVAL;
>  		}
>  
> @@ -71,7 +101,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
>  			if (ret && ret != -ENOIOCTLCMD) {
>  				dev_err(ved->dev, "subdev_call error %s\n",
>  					ved->ent->name);
> -				vimc_streamer_pipeline_terminate(stream);
> +				vimc_streamer_stream_terminate(cved);
>  				return ret;
>  			}
>  		}
> @@ -84,7 +114,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
>  				dev_err(ved->dev,
>  					"first entity in the pipe '%s' is not a source\n",
>  					ved->ent->name);
> -				vimc_streamer_pipeline_terminate(stream);
> +				vimc_streamer_stream_terminate(cved);
>  				pr_info ("first entry not source");
>  				return -EPIPE;
>  			}
> @@ -104,7 +134,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
>  		stream_size++;
>  	}
>  
> -	vimc_streamer_pipeline_terminate(stream);
> +	vimc_streamer_stream_terminate(cved);
>  	return -EINVAL;
>  }
>  
> @@ -120,13 +150,14 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
>   * Return: 0 if success, error code otherwise.
>   */
>  static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> -				       struct vimc_ent_device *ved)
> +				       struct vimc_ent_device *cved)
>  {
>  	struct media_entity *entity;
>  	struct media_device *mdev;
>  	struct media_graph graph;
>  	struct video_device *vdev;
>  	struct v4l2_subdev *sd;
> +	struct vimc_ent_device *ved = cved;
>  	int ret;
>  
>  	entity = ved->ent;
> @@ -170,6 +201,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  		}
>  	}
>  
> +	vimc_streamer_stream_terminate(cved);
>  	vimc_streamer_pipeline_terminate(stream);
>  	return -EINVAL;
>  }
> @@ -246,7 +278,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
>  		if (stream->kthread)
>  			return 0;
>  
> -		ret = vimc_streamer_stream_start(stream, ved);
> +		ret = vimc_streamer_stream_start(ved);
>  		if (ret)
>  			return ret;
>  
> @@ -260,6 +292,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
>  		if (IS_ERR(stream->kthread)) {
>  			ret = PTR_ERR(stream->kthread);
>  			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
> +			vimc_streamer_stream_terminate(ved);
>  			vimc_streamer_pipeline_terminate(stream);
>  			stream->kthread = NULL;

If vimc_streamer_pipeline_terminate() sets stream->kthread = NULL, it
doesn't need to be done again here.


>  			return ret;
> @@ -269,18 +302,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
>  		if (!stream->kthread)
>  			return 0;
>  
> -		ret = kthread_stop(stream->kthread);
> -		/*
> -		 * kthread_stop returns -EINTR in cases when streamon was
> -		 * immediately followed by streamoff, and the thread didn't had
> -		 * a chance to run. Ignore errors to stop the stream in the
> -		 * pipeline.
> -		 */

Do we need to retain that comment when stopping the thread?

> -		if (ret)
> -			dev_dbg(ved->dev, "kthread_stop returned '%d'\n", ret);
> -
> -		stream->kthread = NULL;
> -
> +		vimc_streamer_stream_terminate(ved);
>  		vimc_streamer_pipeline_terminate(stream);
>  	}
>  
> 

-- 
Regards
--
Kieran
