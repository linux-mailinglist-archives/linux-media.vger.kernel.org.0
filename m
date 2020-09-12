Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E728267983
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 12:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgILK2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 06:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgILK2n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 06:28:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84AAC061573
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 03:28:42 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id g21so799765plq.1
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 03:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y9VGa0M0e6MNLPEV/pdtmGB8puQ9Fbw+VhIuYrsWWVk=;
        b=jsdpUXpXRLHPhzBZcn405m5qKaNYyOcKlb79ijKETcal1HOs1FUzcwaRmtrmBWWFIa
         GWqFqPMPgyUPcbjSbXv7xD+BNTgiX++axw1907q9jZejdrKuiEMme9iOiJ5bh6OANEVL
         gtimZUbb2ImUSqEc7gjJ+JWyhMGIuKntCd66r3g3k8UiNRxWR46QQO5WmZBQKqRgpdFH
         xAy40U18cFNOU0u/mcW3eEyP/xBelgNsqNHBpfXR4OYq6kfJmYYg9pTRTMGk62QaMPw9
         n2GbBml0YIwMU10w76ll/ohwDFghU2bsCxAkLtqGGvYnUYoxywNcXHa4BAFC/JoqmI+D
         94xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y9VGa0M0e6MNLPEV/pdtmGB8puQ9Fbw+VhIuYrsWWVk=;
        b=rn2LtMaQYya8nfb0o6R22fVpD9T4U4s+elH8wwJQ1RymJzOs65Mfz0VK+e3D3FEiJy
         cxTzuRGyfpAL2NA4/Ji4BCDKWTiBb3aP5ezlJkpHhDG+aOiUuuSbWCphIvNBaJe1T0mG
         /Pxv1JkC28dNimBQPzVWWxGvu3JTso+azWc7VkhP8reQ6s8jQACw+1BApOP7fwc91hST
         8z+3xBjjBpnpnV3mtD8coGl51EdeftOj/yZbAfzSDhC9/bEA/iVmvJjglKLDEKzZhK2y
         rNF1e9FkdoO1PkTBPQDLQi3uMewsZlBvtPorJOhx6GjH8lH0uombbIUqTjnpX3ux4Ml9
         mqaA==
X-Gm-Message-State: AOAM532Sx77IxHMfB/6GGm4DhfMLuG8SXhVN4v7NhTta30phqWa7Jc4I
        zn9gpv9ExBKdHxbmK3fm2tJjRA==
X-Google-Smtp-Source: ABdhPJzWSuJXdN8QKfqNkiAD57zbgI2gpYXoEEn9vzNk/eRHm9ulyvUiNLa8evmCMErsxHTs8A1jpw==
X-Received: by 2002:a17:90a:ea08:: with SMTP id w8mr5737292pjy.41.1599906522368;
        Sat, 12 Sep 2020 03:28:42 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([2405:201:6801:484c:954a:305:9758:cc93])
        by smtp.gmail.com with ESMTPSA id e125sm4784646pfe.154.2020.09.12.03.28.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Sep 2020 03:28:41 -0700 (PDT)
Date:   Sat, 12 Sep 2020 15:58:36 +0530
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] media: vimc: Separate closing of stream and thread
Message-ID: <20200912102836.GD5022@kaaira-HP-Pavilion-Notebook>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-6-kgupta@es.iitr.ac.in>
 <1614accb-dee5-1c0e-ece3-ecdd56f45253@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614accb-dee5-1c0e-ece3-ecdd56f45253@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, Sep 02, 2020 at 11:13:09AM +0100, Kieran Bingham wrote:
> Hi Kaaira,
> 
> On 19/08/2020 19:04, Kaaira Gupta wrote:
> > Make separate functions for stopping streaming of entities in path of a
> > particular stream and stopping thread. This is needed to ensure that
> > thread doesn't stop when one device stops streaming in case of multiple
> > streams.
> > 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >  .../media/test-drivers/vimc/vimc-streamer.c   | 82 ++++++++++++-------
> >  1 file changed, 52 insertions(+), 30 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> > index cc40ecabe95a..6b5ea1537952 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> > @@ -13,29 +13,59 @@
> >  #include "vimc-streamer.h"
> >  
> >  /**
> > - * vimc_streamer_pipeline_terminate - Disable stream in all ved in stream
> > + * vimc_streamer_pipeline_terminate - Terminate the thread
> >   *
> > - * @stream: the pointer to the stream structure with the pipeline to be
> > - *	    disabled.
> > + * @stream: the pointer to the stream structure
> >   *
> > - * Calls s_stream to disable the stream in each entity of the pipeline
> > + * Erases values of stream struct and terminates the thread
> 
> It would help if the function brief described it's purpose rather than
> 'what it does'. "Erases values of stream struct" is not helpful here, as
> that's just a direct read of what happens in the code.

Okay, I will make these changes

> 
> I'm guessing here, but how about:
> 
> "Tear down all resources belonging to the pipeline when there are no
> longer any active streams being used. This includes stopping the active
> processing thread"
> 
> 
> But reading my text makes me worry about the ordering that might take
> place. The thread should be stopped as soon as the last stream using it
> is stopped. Presumably as the 'first thing' that happens to make sure
> there is no concurrent processing while the stream is being disabled.
> 
> Hopefully there's no race condition ...

There isn't..in further patches (when multiple streams are allowed),
pipeline_terminate is called only after both the streams terminate.

> 
> 
> >   *
> >   */
> >  static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
> >  {
> >  	struct vimc_ent_device *ved;
> > -	struct v4l2_subdev *sd;
> >  
> >  	while (stream->pipe_size) {
> >  		stream->pipe_size--;
> >  		ved = stream->ved_pipeline[stream->pipe_size];
> >  		stream->ved_pipeline[stream->pipe_size] = NULL;
> > +	}
> >  
> > -		if (!is_media_entity_v4l2_subdev(ved->ent))
> > -			continue;
> > +	kthread_stop(stream->kthread);
> > +	stream->kthread = NULL;
> > +}
> >  
> > -		sd = media_entity_to_v4l2_subdev(ved->ent);
> > -		v4l2_subdev_call(sd, video, s_stream, 0);
> > +/**
> > + * vimc_streamer_stream_terminate - Disable stream in all ved in stream
> > + *
> > + * @ved: pointer to the ved for which stream needs to be disabled
> > + *
> > + * Calls s_stream to disable the stream in each entity of the stream
> > + *
> > + */
> > +static void vimc_streamer_stream_terminate(struct vimc_ent_device *ved)
> 
> I would call this vimc_streamer_stream_stop to match
> vimc_streamer_stream_start() rather than terminate...

Okay, noted..I will make this change

> 
> > +{
> > +	struct media_entity *entity = ved->ent;
> > +	struct video_device *vdev;
> > +	struct v4l2_subdev *sd;
> > +
> > +	while (entity) {
> > +		if (is_media_entity_v4l2_subdev(ved->ent)) {
> > +			sd = media_entity_to_v4l2_subdev(ved->ent);
> > +			v4l2_subdev_call(sd, video, s_stream, 0);
> > +		}
> > +		entity = vimc_get_source_entity(ved->ent);
> > +		if (!entity)
> > +			break;
> > +
> > +		if (is_media_entity_v4l2_subdev(entity)) {
> > +			sd = media_entity_to_v4l2_subdev(entity);
> > +			ved = v4l2_get_subdevdata(sd);
> > +		} else {
> > +			vdev = container_of(entity,
> > +					    struct video_device,
> > +					    entity);
> > +			ved = video_get_drvdata(vdev);
> > +		}
> 
> It looks like this is walking back through the linked graph, calling
> s_stream(0) right?

Yes

> 
> I wonder if struct vimc_ent_device should have a pointer to the entity
> it's connected to, to simplify this. ... presumably this is done
> elsewhere too?
> 
> Although then that's still walking 'backwards' rather than forwards...

I don't understand your concern here

> 
> 
> 
> 
> >  	}
> >  }
> >  
> > @@ -43,25 +73,25 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
> >   * vimc_streamer_stream_start - Starts streaming for all entities
> >   * in a stream
> >   *
> > - * @ved:    the pointer to the vimc entity initializing the stream
> > + * @cved:    the pointer to the vimc entity initializing the stream
> >   *
> >   * Walks through the entity graph to call vimc_streamer_s_stream()
> >   * to enable stream in all entities in path of a stream.
> >   *
> >   * Return: 0 if success, error code otherwise.
> >   */
> > -static int vimc_streamer_stream_start(struct vimc_stream *stream,
> > -				      struct vimc_ent_device *ved)
> > +static int vimc_streamer_stream_start(struct vimc_ent_device *cved)
> >  {
> >  	struct media_entity *entity;
> >  	struct video_device *vdev;
> >  	struct v4l2_subdev *sd;
> > +	struct vimc_ent_device *ved = cved;
> >  	int stream_size = 0;
> >  	int ret = 0;
> >  
> >  	while (stream_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> >  		if (!ved) {
> > -			vimc_streamer_pipeline_terminate(stream);
> > +			vimc_streamer_stream_terminate(cved);
> >  			return -EINVAL;
> >  		}
> >  
> > @@ -71,7 +101,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
> >  			if (ret && ret != -ENOIOCTLCMD) {
> >  				dev_err(ved->dev, "subdev_call error %s\n",
> >  					ved->ent->name);
> > -				vimc_streamer_pipeline_terminate(stream);
> > +				vimc_streamer_stream_terminate(cved);
> >  				return ret;
> >  			}
> >  		}
> > @@ -84,7 +114,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
> >  				dev_err(ved->dev,
> >  					"first entity in the pipe '%s' is not a source\n",
> >  					ved->ent->name);
> > -				vimc_streamer_pipeline_terminate(stream);
> > +				vimc_streamer_stream_terminate(cved);
> >  				pr_info ("first entry not source");
> >  				return -EPIPE;
> >  			}
> > @@ -104,7 +134,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
> >  		stream_size++;
> >  	}
> >  
> > -	vimc_streamer_pipeline_terminate(stream);
> > +	vimc_streamer_stream_terminate(cved);
> >  	return -EINVAL;
> >  }
> >  
> > @@ -120,13 +150,14 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
> >   * Return: 0 if success, error code otherwise.
> >   */
> >  static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> > -				       struct vimc_ent_device *ved)
> > +				       struct vimc_ent_device *cved)
> >  {
> >  	struct media_entity *entity;
> >  	struct media_device *mdev;
> >  	struct media_graph graph;
> >  	struct video_device *vdev;
> >  	struct v4l2_subdev *sd;
> > +	struct vimc_ent_device *ved = cved;
> >  	int ret;
> >  
> >  	entity = ved->ent;
> > @@ -170,6 +201,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> >  		}
> >  	}
> >  
> > +	vimc_streamer_stream_terminate(cved);
> >  	vimc_streamer_pipeline_terminate(stream);
> >  	return -EINVAL;
> >  }
> > @@ -246,7 +278,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
> >  		if (stream->kthread)
> >  			return 0;
> >  
> > -		ret = vimc_streamer_stream_start(stream, ved);
> > +		ret = vimc_streamer_stream_start(ved);
> >  		if (ret)
> >  			return ret;
> >  
> > @@ -260,6 +292,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
> >  		if (IS_ERR(stream->kthread)) {
> >  			ret = PTR_ERR(stream->kthread);
> >  			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
> > +			vimc_streamer_stream_terminate(ved);
> >  			vimc_streamer_pipeline_terminate(stream);
> >  			stream->kthread = NULL;
> 
> If vimc_streamer_pipeline_terminate() sets stream->kthread = NULL, it
> doesn't need to be done again here.

Noted

> 
> 
> >  			return ret;
> > @@ -269,18 +302,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
> >  		if (!stream->kthread)
> >  			return 0;
> >  
> > -		ret = kthread_stop(stream->kthread);
> > -		/*
> > -		 * kthread_stop returns -EINTR in cases when streamon was
> > -		 * immediately followed by streamoff, and the thread didn't had
> > -		 * a chance to run. Ignore errors to stop the stream in the
> > -		 * pipeline.
> > -		 */
> 
> Do we need to retain that comment when stopping the thread?

I am not sure, I think helen or dafna can help?

> 
> > -		if (ret)
> > -			dev_dbg(ved->dev, "kthread_stop returned '%d'\n", ret);
> > -
> > -		stream->kthread = NULL;
> > -
> > +		vimc_streamer_stream_terminate(ved);
> >  		vimc_streamer_pipeline_terminate(stream);
> >  	}
> >  
> > 
> 
> -- 
> Regards
> --
> Kieran
