Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3260725A970
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 12:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIBK3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 06:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgIBK3j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 06:29:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2639EC061244;
        Wed,  2 Sep 2020 03:29:39 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5AD019CC;
        Wed,  2 Sep 2020 12:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599042574;
        bh=K8hSzZzRLU0QDVnoaA6pUJ+GddMonXWGKPjvCZ45nNA=;
        h=Reply-To:Subject:To:References:From:Date:In-Reply-To:From;
        b=CmpVF4NOqzY9WRWs3BrTs6ojEE4wBrwxmzt9+np+bpQ0W+3OOIi4uF+kL1gbm0CGa
         d9pz2PlepZCC+BKNLyWl28iHZOuEAk08JRliGldmiFePi1SLBOimcMQm92Uu+mP/Oc
         ALhT6FsXo7pIdoD2e1ymWDmNuy4tLnxeSLfNTxv0=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 7/9] media: vimc: Dynamically allocate stream struct
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-8-kgupta@es.iitr.ac.in>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <7300d7ab-2be0-a6c6-b506-5af8b4a9b893@ideasonboard.com>
Date:   Wed, 2 Sep 2020 11:29:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819180442.11630-8-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

On 19/08/2020 19:04, Kaaira Gupta wrote:
> Multiple streams will share same stream struct if we want them to run on
> same thread. So remove it from vimc_cap struct so that it doesn't get
> destroyed when one of the capture does, and allocate it memory
> dynamically. Use kref with it as it will be used by multiple captures.
> 

Is the vimc_stream stuct the context of the streamer? or of each 'stream'?

If it's the streamer - then can't we store this (non-dynamically) as
part of the Sensor node, to avoid kzalloc/freeing it ?


> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> ---
>  drivers/media/test-drivers/vimc/vimc-capture.c  | 15 +++++++++++----
>  drivers/media/test-drivers/vimc/vimc-streamer.c | 17 ++++++-----------
>  drivers/media/test-drivers/vimc/vimc-streamer.h |  2 ++
>  3 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> index 93418cb5a139..73e5bdd17c57 100644
> --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> @@ -28,7 +28,6 @@ struct vimc_cap_device {
>  	spinlock_t qlock;
>  	struct mutex lock;
>  	u32 sequence;
> -	struct vimc_stream stream;
>  	struct media_pad pad;
>  };
>  
> @@ -241,19 +240,25 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
>  	struct media_entity *entity = &vcap->vdev.entity;
> +	struct media_pipeline *pipe = NULL;
> +	struct vimc_stream *stream;
>  	int ret;
>  
>  	atomic_inc(&vcap->ved.use_count);
>  	vcap->sequence = 0;
>  
> +	stream = kzalloc(sizeof(*stream), GFP_ATOMIC);
> +	kref_init(&stream->refcount);
> +	pipe = &stream->pipe;
> +
>  	/* Start the media pipeline */
> -	ret = media_pipeline_start(entity, &vcap->stream.pipe);
> +	ret = media_pipeline_start(entity, pipe);
>  	if (ret) {
>  		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
>  		return ret;
>  	}
>  
> -	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
> +	ret = vimc_streamer_s_stream(stream, &vcap->ved, 1);
>  	if (ret) {
>  		media_pipeline_stop(entity);
>  		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
> @@ -270,9 +275,11 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
>  static void vimc_cap_stop_streaming(struct vb2_queue *vq)
>  {
>  	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
> +	struct media_pipeline *pipe = vcap->ved.ent->pipe;
> +	struct vimc_stream *stream = container_of(pipe, struct vimc_stream, pipe);

In fact, I see it's stored as part of the 'pipe' so there is one
vimc_stream per pipeline ...

So it could just be a structure on the pipe rather than obtaining a
pointer here.

I think it's probably 'ok' to have one streamer per pipe currently as
the raw input node is not functional, but I also thought that by having
the streamer as part of the sensor entity then there is one streamer
('one thread') per video source ... which would prevent this having to
be changed if someone later deals with the video node that allows
re-processing raw frames ?



>  	atomic_dec(&vcap->ved.use_count);
> -	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
> +	vimc_streamer_s_stream(stream, &vcap->ved, 0);
>  
>  	/* Stop the media pipeline */
>  	media_pipeline_stop(&vcap->vdev.entity);
> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> index f5c9e2f3bbcb..fade37bee26d 100644
> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> @@ -20,18 +20,13 @@
>   * Erases values of stream struct and terminates the thread
>   *
>   */
> -static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
> +static void vimc_streamer_pipeline_terminate(struct kref *ref)
>  {
> -	struct vimc_ent_device *ved;
> -
> -	while (stream->pipe_size) {
> -		stream->pipe_size--;
> -		ved = stream->ved_pipeline[stream->pipe_size];
> -		stream->ved_pipeline[stream->pipe_size] = NULL;
> -	}
> +	struct vimc_stream *stream = container_of(ref, struct vimc_stream, refcount);
>  
>  	kthread_stop(stream->kthread);
>  	stream->kthread = NULL;
> +	kfree(stream);
>  }
>  
>  /**
> @@ -202,7 +197,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  	}
>  
>  	vimc_streamer_stream_terminate(cved);
> -	vimc_streamer_pipeline_terminate(stream);
> +	kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
>  	return -EINVAL;
>  }
>  
> @@ -298,7 +293,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
>  			ret = PTR_ERR(stream->kthread);
>  			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
>  			vimc_streamer_stream_terminate(ved);
> -			vimc_streamer_pipeline_terminate(stream);
> +			kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
>  		}
>  
>  	} else {
> @@ -306,7 +301,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
>  			goto out;
>  
>  		vimc_streamer_stream_terminate(ved);
> -		vimc_streamer_pipeline_terminate(stream);
> +		kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
>  	}
>  out:
>  	mutex_unlock(&vimc_streamer_lock);
> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.h b/drivers/media/test-drivers/vimc/vimc-streamer.h
> index 3bb6731b8d4d..533c88675362 100644
> --- a/drivers/media/test-drivers/vimc/vimc-streamer.h
> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.h
> @@ -18,6 +18,7 @@
>  /**
>   * struct vimc_stream - struct that represents a stream in the pipeline
>   *
> + * @refcount:		kref object associated with stream struct

What does it track though?

We know it's associated with the stream struct because it's in the
vimc_stream struct.



>   * @pipe:		the media pipeline object associated with this stream
>   * @ved_pipeline:	array containing all the entities participating in the
>   * 			stream. The order is from a video device (usually a

The fact that this comment still says "all entities participating in the
stream" worries me a little, as I think now the Streamer is dealing with
multiple streams.

I think we need to be really clear with the differences of objects and
terminology.

For instance I think the current terms are something like this:

Streamer: Responsible for managing processing from a sensor device
through all entities.

Stream: A flow of frames to a single capture video device node.

Pipeline: All entities used within the vimc streamer ?

(I'm not sure if those are right, I'm writing down what my current
interpretations are, so if someone wants to/can clarify - please do).



> @@ -32,6 +33,7 @@
>   * process frames for the stream.
>   */
>  struct vimc_stream {
> +	struct kref refcount;
>  	struct media_pipeline pipe;
>  	struct vimc_ent_device *ved_pipeline[VIMC_STREAMER_PIPELINE_MAX_SIZE];
>  	unsigned int pipe_size;
> 

-- 
Regards
--
Kieran
