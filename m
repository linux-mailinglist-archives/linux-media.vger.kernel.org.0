Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630C9267996
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 12:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgILKj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 06:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgILKjX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 06:39:23 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D89C061757
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 03:39:22 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mm21so2963495pjb.4
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0aZIs8mGxrLmW86a7K8xaGoW2rftgn3HBruZGZVjKl8=;
        b=YqFxAbi1XGYlmRR0z5WZennz2dkPzzLbpAGAQZitDSB8w7Dct4xWTW9lXW9x/XjLEe
         qYTsvZmsDC2aIrOhACGneA7zs1T70v97crIlTQvIlTsYPMWNVSPPa2R1n3lCgoz5qMOf
         6pHS0Vw8tU0HRW13RWNOU9SySmTVGbSkGOJOVmsQh6mQ87lI+iVlUoh+sHJXse2osSvI
         /flX3agvcR63vuTvkYcJEkHJq4ctT8pqmEPVosdtT2G/n50yBDCfYNOlorgT7m8YUYAj
         mYVXiveAlMbxw0BmKAR1RVGTcP9seR2GzxdvGXb+1VXPHnOwbBUDW8RRfAggCjhZbZUQ
         7NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0aZIs8mGxrLmW86a7K8xaGoW2rftgn3HBruZGZVjKl8=;
        b=IC8+LJriIMt5SE7+cC0/DssNpoRSmq4l5iFDzqzPxKUHpPNjtKXccXV1Bjv+ewBJRO
         vC8Fm3JGMPheuo9MiLLHYfYGuIq9zk0gsRwC1eer4AQ3sMJiCUwPMOIksp0ZxUB/lvep
         b2hyH4OeKHHkWHTcn0qPSrY4ZPX91qJOogaHVV/JtNyqp1RUkW+FKA5noJwVe6vBOCeD
         NMzYDgxXF3jLp3sMnRa/279To6ENqLtfwK6Z99rY6CIpGVTuqKyd740QQmdouW143i5M
         l42MSRZgwh3k1iGhR2QI7lefN88Y6qJLfLKBF1OYWkwIpXdHV0W2jizFL2D9w1aF8vJ0
         gq+A==
X-Gm-Message-State: AOAM531qGV/XBbaKYBqHLRM8ldQpKDO1j8ahbCeaJ2Lv9pgt1FZ+ZIEW
        WtI3BREBMd1eSKCgmvq6lSu1zw==
X-Google-Smtp-Source: ABdhPJwHUa2g3AYciClNiX5q1LANZ6zlfWvvZl5rczKDHOnvpiD++A49NAKoISnSl6oYimhVcSo4aA==
X-Received: by 2002:a17:90b:208:: with SMTP id fy8mr6018817pjb.153.1599907162317;
        Sat, 12 Sep 2020 03:39:22 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([2405:201:6801:484c:954a:305:9758:cc93])
        by smtp.gmail.com with ESMTPSA id s22sm5256660pfd.90.2020.09.12.03.39.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Sep 2020 03:39:21 -0700 (PDT)
Date:   Sat, 12 Sep 2020 16:09:16 +0530
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] media: vimc: Dynamically allocate stream struct
Message-ID: <20200912103916.GE5022@kaaira-HP-Pavilion-Notebook>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-8-kgupta@es.iitr.ac.in>
 <7300d7ab-2be0-a6c6-b506-5af8b4a9b893@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7300d7ab-2be0-a6c6-b506-5af8b4a9b893@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 02, 2020 at 11:29:31AM +0100, Kieran Bingham wrote:
> Hi Kaaira,
> 
> On 19/08/2020 19:04, Kaaira Gupta wrote:
> > Multiple streams will share same stream struct if we want them to run on
> > same thread. So remove it from vimc_cap struct so that it doesn't get
> > destroyed when one of the capture does, and allocate it memory
> > dynamically. Use kref with it as it will be used by multiple captures.
> > 
> 
> Is the vimc_stream stuct the context of the streamer? or of each 'stream'?

of streamer

> 
> If it's the streamer - then can't we store this (non-dynamically) as
> part of the Sensor node, to avoid kzalloc/freeing it ?

I tried this after we discussed, but I kept on having some memory
issues..so I used this method as an alternate. If making vimc_streamer
struct dynamically is an issue with others as well (I understand why it
might be an issue, since it should not be dependent on which capture
calls initialised it), I can work on moving it to the sensor instead

> 
> 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >  drivers/media/test-drivers/vimc/vimc-capture.c  | 15 +++++++++++----
> >  drivers/media/test-drivers/vimc/vimc-streamer.c | 17 ++++++-----------
> >  drivers/media/test-drivers/vimc/vimc-streamer.h |  2 ++
> >  3 files changed, 19 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> > index 93418cb5a139..73e5bdd17c57 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> > @@ -28,7 +28,6 @@ struct vimc_cap_device {
> >  	spinlock_t qlock;
> >  	struct mutex lock;
> >  	u32 sequence;
> > -	struct vimc_stream stream;
> >  	struct media_pad pad;
> >  };
> >  
> > @@ -241,19 +240,25 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
> >  {
> >  	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
> >  	struct media_entity *entity = &vcap->vdev.entity;
> > +	struct media_pipeline *pipe = NULL;
> > +	struct vimc_stream *stream;
> >  	int ret;
> >  
> >  	atomic_inc(&vcap->ved.use_count);
> >  	vcap->sequence = 0;
> >  
> > +	stream = kzalloc(sizeof(*stream), GFP_ATOMIC);
> > +	kref_init(&stream->refcount);
> > +	pipe = &stream->pipe;
> > +
> >  	/* Start the media pipeline */
> > -	ret = media_pipeline_start(entity, &vcap->stream.pipe);
> > +	ret = media_pipeline_start(entity, pipe);
> >  	if (ret) {
> >  		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
> >  		return ret;
> >  	}
> >  
> > -	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
> > +	ret = vimc_streamer_s_stream(stream, &vcap->ved, 1);
> >  	if (ret) {
> >  		media_pipeline_stop(entity);
> >  		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
> > @@ -270,9 +275,11 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
> >  static void vimc_cap_stop_streaming(struct vb2_queue *vq)
> >  {
> >  	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
> > +	struct media_pipeline *pipe = vcap->ved.ent->pipe;
> > +	struct vimc_stream *stream = container_of(pipe, struct vimc_stream, pipe);
> 
> In fact, I see it's stored as part of the 'pipe' so there is one
> vimc_stream per pipeline ...
> 
> So it could just be a structure on the pipe rather than obtaining a
> pointer here.
> 
> I think it's probably 'ok' to have one streamer per pipe currently as
> the raw input node is not functional, but I also thought that by having
> the streamer as part of the sensor entity then there is one streamer
> ('one thread') per video source ... which would prevent this having to
> be changed if someone later deals with the video node that allows
> re-processing raw frames ?
> 
> 
> 
> >  	atomic_dec(&vcap->ved.use_count);
> > -	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
> > +	vimc_streamer_s_stream(stream, &vcap->ved, 0);
> >  
> >  	/* Stop the media pipeline */
> >  	media_pipeline_stop(&vcap->vdev.entity);
> > diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> > index f5c9e2f3bbcb..fade37bee26d 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> > @@ -20,18 +20,13 @@
> >   * Erases values of stream struct and terminates the thread
> >   *
> >   */
> > -static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
> > +static void vimc_streamer_pipeline_terminate(struct kref *ref)
> >  {
> > -	struct vimc_ent_device *ved;
> > -
> > -	while (stream->pipe_size) {
> > -		stream->pipe_size--;
> > -		ved = stream->ved_pipeline[stream->pipe_size];
> > -		stream->ved_pipeline[stream->pipe_size] = NULL;
> > -	}
> > +	struct vimc_stream *stream = container_of(ref, struct vimc_stream, refcount);
> >  
> >  	kthread_stop(stream->kthread);
> >  	stream->kthread = NULL;
> > +	kfree(stream);
> >  }
> >  
> >  /**
> > @@ -202,7 +197,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> >  	}
> >  
> >  	vimc_streamer_stream_terminate(cved);
> > -	vimc_streamer_pipeline_terminate(stream);
> > +	kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
> >  	return -EINVAL;
> >  }
> >  
> > @@ -298,7 +293,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
> >  			ret = PTR_ERR(stream->kthread);
> >  			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
> >  			vimc_streamer_stream_terminate(ved);
> > -			vimc_streamer_pipeline_terminate(stream);
> > +			kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
> >  		}
> >  
> >  	} else {
> > @@ -306,7 +301,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
> >  			goto out;
> >  
> >  		vimc_streamer_stream_terminate(ved);
> > -		vimc_streamer_pipeline_terminate(stream);
> > +		kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
> >  	}
> >  out:
> >  	mutex_unlock(&vimc_streamer_lock);
> > diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.h b/drivers/media/test-drivers/vimc/vimc-streamer.h
> > index 3bb6731b8d4d..533c88675362 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-streamer.h
> > +++ b/drivers/media/test-drivers/vimc/vimc-streamer.h
> > @@ -18,6 +18,7 @@
> >  /**
> >   * struct vimc_stream - struct that represents a stream in the pipeline
> >   *
> > + * @refcount:		kref object associated with stream struct
> 
> What does it track though?
> 
> We know it's associated with the stream struct because it's in the
> vimc_stream struct.

Vimc_streamer should be destroyed only when both the streams (if there
are two) have been terminated. So, it takes care of that.

> 
> 
> 
> >   * @pipe:		the media pipeline object associated with this stream
> >   * @ved_pipeline:	array containing all the entities participating in the
> >   * 			stream. The order is from a video device (usually a
> 
> The fact that this comment still says "all entities participating in the
> stream" worries me a little, as I think now the Streamer is dealing with
> multiple streams.
> 
> I think we need to be really clear with the differences of objects and
> terminology.

Yes, 'stream' here should be replaced with pipeline I think? As it
represents all the entities in the entire path connected with the sensor

> 
> For instance I think the current terms are something like this:
> 
> Streamer: Responsible for managing processing from a sensor device
> through all entities.
> 
> Stream: A flow of frames to a single capture video device node.
> 
> Pipeline: All entities used within the vimc streamer ?
> 
> (I'm not sure if those are right, I'm writing down what my current
> interpretations are, so if someone wants to/can clarify - please do).
> 
> 
> 
> > @@ -32,6 +33,7 @@
> >   * process frames for the stream.
> >   */
> >  struct vimc_stream {
> > +	struct kref refcount;
> >  	struct media_pipeline pipe;
> >  	struct vimc_ent_device *ved_pipeline[VIMC_STREAMER_PIPELINE_MAX_SIZE];
> >  	unsigned int pipe_size;
> > 
> 
> -- 
> Regards
> --
> Kieran
