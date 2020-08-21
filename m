Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5E424E25B
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 23:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgHUVBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 17:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgHUVBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 17:01:32 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B61C061573
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 14:01:32 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id r11so1639065pfl.11
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NG3j+Njeqhjr/wMMFfSedllU1ygdUJrEzT0Q4vfVV1c=;
        b=Nq3wXWbFOgwTSXRY8VbgBp1A47xX4DihiOSCw6ddhLn8zGhMUtIqLgvWxIxCq1baIU
         ckuhvSHFMWkr8U8y2dr2rXc8+RE0JKgex9hR+8T63qPKEFfHqwS0hWO8jhDTUnwp0LgA
         Fzrx4JQEzLdvFYTApgW0wMgS4Q4f6Bb/31lYhHpjuz2eF1AOW1KngAqEDDQ13MPNxprN
         hAp3R+2eXMJ2MtPHlh7CV/UohYACeOHqGzVxgm6gmK2eVyLb9OVazr9n2KJT2KE8gTvm
         48ug6QdLgBUm1ZIEge+vTTkaBttFZRFkKvRlW9P6+ERimBybq5hZ/cpwL7XSkBsNoDVv
         D8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NG3j+Njeqhjr/wMMFfSedllU1ygdUJrEzT0Q4vfVV1c=;
        b=bt6IE9MIn1bWF6fUc1Mw1yAXDVL0US8I2DCf4gjdoCn0arJ12zbp7HCsQWcqevyjPH
         gUNS8D0i3mhun6MW2DXgXkYnGHvYZd0iYjC6hmZh7OdirmbIU8EV8Ih9NXS8/r7yyEXL
         bhaBobohJ4dg+BilsWhZhzBhQ6NbdgV9w49XNNbeyP8gQC9aez0WNv6vLx3Bkr/ygPm+
         VD7jpyXPrSpvP+qq1QP3vupYg+62RkioMWpoC3PBCEeQk1s3+qjp34GZM0sgIgE4PFw3
         f4L3g9vNLyyfoObyH8LbSgOd7YPpwZJLxN4AcGpom+CTaZ89K9mbskKAQlQhS9e2ooby
         R1Sw==
X-Gm-Message-State: AOAM531pNfkhjSEWlaCViJokBgDld2js2jcmin8JUBNrPPsFS9cTj8Pj
        spnOb2p4OjP/q8f9MhxjMinz1Jr2rbm46A==
X-Google-Smtp-Source: ABdhPJyb4YtnAwc73/hH/lA0DP42/T8bDzG8IXtoO3zGFsEPG0zhCDg0MLMv6eCLwWQSbi1BBTpcUA==
X-Received: by 2002:a63:5a1e:: with SMTP id o30mr3608753pgb.62.1598043691321;
        Fri, 21 Aug 2020 14:01:31 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id h9sm3682631pfq.18.2020.08.21.14.01.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 14:01:30 -0700 (PDT)
Date:   Sat, 22 Aug 2020 02:31:23 +0530
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 4/9] media: vimc: Separate starting stream from
 pipeline initialisation
Message-ID: <20200821210123.GA28410@kaaira-HP-Pavilion-Notebook>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <20200819180442.11630-5-kgupta@es.iitr.ac.in>
 <eb5d4259-fe77-b4f2-1e62-0f846420b7c2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb5d4259-fe77-b4f2-1e62-0f846420b7c2@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, Aug 21, 2020 at 05:11:23PM +0200, Dafna Hirschfeld wrote:
> 
> 
> Am 19.08.20 um 20:04 schrieb Kaaira Gupta:
> > Separate the process of initialising pipeline array from starting
> > streaming for all entities in path of a stream. This is needed because
> > multiple streams can stream, but only one pipeline object is needed.
> > 
> > Process frames only for those entities in a pipeline which are
> > streaming. This is known through their use counts.
> > 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >   .../media/test-drivers/vimc/vimc-streamer.c   | 95 ++++++++++++++++---
> >   1 file changed, 83 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
> > index c1644d69686d..cc40ecabe95a 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> > @@ -40,33 +40,30 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
> >   }
> >   /**
> > - * vimc_streamer_pipeline_init - Initializes the stream structure
> > + * vimc_streamer_stream_start - Starts streaming for all entities
> > + * in a stream
> >    *
> > - * @stream: the pointer to the stream structure to be initialized
> >    * @ved:    the pointer to the vimc entity initializing the stream
> >    *
> > - * Initializes the stream structure. Walks through the entity graph to
> > - * construct the pipeline used later on the streamer thread.
> > - * Calls vimc_streamer_s_stream() to enable stream in all entities of
> > - * the pipeline.
> > + * Walks through the entity graph to call vimc_streamer_s_stream()
> > + * to enable stream in all entities in path of a stream.
> >    *
> >    * Return: 0 if success, error code otherwise.
> >    */
> > -static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> > -				       struct vimc_ent_device *ved)
> > +static int vimc_streamer_stream_start(struct vimc_stream *stream,
> > +				      struct vimc_ent_device *ved)
> >   {
> >   	struct media_entity *entity;
> >   	struct video_device *vdev;
> >   	struct v4l2_subdev *sd;
> > +	int stream_size = 0;
> >   	int ret = 0;
> > -	stream->pipe_size = 0;
> > -	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> > +	while (stream_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> >   		if (!ved) {
> >   			vimc_streamer_pipeline_terminate(stream);
> >   			return -EINVAL;
> >   		}
> > -		stream->ved_pipeline[stream->pipe_size++] = ved;
> >   		if (is_media_entity_v4l2_subdev(ved->ent)) {
> >   			sd = media_entity_to_v4l2_subdev(ved->ent);
> > @@ -104,6 +101,73 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> >   					    entity);
> >   			ved = video_get_drvdata(vdev);
> >   		}
> > +		stream_size++;
> > +	}
> > +
> > +	vimc_streamer_pipeline_terminate(stream);
> > +	return -EINVAL;
> > +}
> > +
> > +/**
> > + * vimc_streamer_pipeline_init - Initialises pipeline and pipe size
> > + *
> > + * @stream: the pointer to the stream structure
> > + * @ved:    the pointer to the vimc entity initializing the stream pipeline
> > + *
> > + * Walks through the entity graph to initialise ved_pipeline and updates
> > + * pipe_size too.
> > + *
> > + * Return: 0 if success, error code otherwise.
> > + */
> > +static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
> > +				       struct vimc_ent_device *ved)
> > +{
> > +	struct media_entity *entity;
> > +	struct media_device *mdev;
> > +	struct media_graph graph;
> > +	struct video_device *vdev;
> > +	struct v4l2_subdev *sd;
> > +	int ret;
> > +
> > +	entity = ved->ent;
> > +	mdev = entity->graph_obj.mdev;
> > +
> > +	ret = media_graph_walk_init(&graph, mdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	media_graph_walk_start(&graph, entity);
> > +
> > +	/*
> > +	 * Start pipeline array initialisation from RAW Capture only to get
> > +	 * entities in the correct order of their frame processing.
> > +	 */
> > +	if (!strncmp(entity->name, "RGB", 3)) {
> 
> I don't understand this condition, way is it good for?

I have explained that later in the reply

> 
> I think the function should be generic and not assume names of entities
> or specific topology.

It doesn't assume the topology, rather it is in place just to make sure
that the entities in ved_pipeline are in correct order.

> 
> 
> > +		entity = media_graph_walk_next(&graph);
> > +		mdev = entity->graph_obj.mdev;
> > +		media_graph_walk_cleanup(&graph);
> > +
> > +		ret = media_graph_walk_init(&graph, mdev);
> > +		if (ret)
> > +			return ret;
> > +		media_graph_walk_start(&graph, entity);
> > +	}
> > +
> > +	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
> > +		if (is_media_entity_v4l2_subdev(entity)) {
> > +			sd = media_entity_to_v4l2_subdev(entity);
> > +			ved = v4l2_get_subdevdata(sd);
> > +		} else {
> > +			vdev = container_of(entity, struct video_device, entity);
> > +			ved = video_get_drvdata(vdev);
> > +		}
> > +		stream->ved_pipeline[stream->pipe_size++] = ved;
> > +		entity = media_graph_walk_next(&graph);
> > +
> > +		if (!strcmp(entity->name, stream->ved_pipeline[0]->ent->name)) {
> 
> I also don't understand this condition
> 
> > +			media_graph_walk_cleanup(&graph);
> > +			return 0;
> > +		}
> >   	}
> 
> It is not clear what this function does, it looks like it adds to 'ved_pipeline'
> all entities that are connected to the video node, in addition to the entities
> that where there from previous calls, so some entities appear several times.

This function returns all the entities in a pipe, weather they are
streaming or not. For example, if only the RAW Capture 1 streams, or
RGB/YUB capture streams, or both stream..in all three cases ved_pipeline
will have the same entities, in exactly same order, and all will occur just once.
Since media_graph_walk goes to each node of the graph, it returns back
to the first one (as its a graph), hence the last condition, ie,

	if (!strcmp(entity->name, stream->ved_pipeline[0]->ent->name)) {

makes sure that the first entity is not added again to the array.

First condition, ie 

	if (!strncmp(entity->name, "RGB", 3)) {

Just makes sure that the search starts at RGB capture only. This is
because, in case of any other video node, the order of entities, as you
have mentioned later in the mail, will not be desirable, ie it won't
start at sensor and end at captures. So this condition just takes care
that all the entities in ved_pipeline array are in correct order
(starting at sensor, ending at captures).

Thanks,
Kaaira

> 
> I think there is no need to use the graph walk here but to access the source entity
> in each iteration, the way done in vimc_streamer_stream_start
> also.
> I think the code should iterate here until it reaches an entity that is already streaming,
> this means that the entity is already in the `ved_pipeline`, also you should make sure
> that the sensor is the first entity that process a frame, therefore the sensor should be
> at the end/start of the list of entities. Generally each entity should appear exactly once
> in the 'ved_pipeline' array and the entities should be ordered such that when calling 'process_frame'
> on one entity should be after calling 'process_frame' on its source entity.
> maybe it is easyer to implement if 'ved_pipeline' is a linked list.
> 
> Thanks,
> Dafna
> 
> >   	vimc_streamer_pipeline_terminate(stream);
> > @@ -138,8 +202,11 @@ static int vimc_streamer_thread(void *data)
> >   		for (i = stream->pipe_size - 1; i >= 0; i--) {
> >   			ved = stream->ved_pipeline[i];
> > -			ret = ved->process_frame(ved);
> > +			if (atomic_read(&ved->use_count) == 0)
> > +				continue;
> > +
> > +			ret = ved->process_frame(ved);
> >   			if (ret)
> >   				break;
> >   		}
> > @@ -179,6 +246,10 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
> >   		if (stream->kthread)
> >   			return 0;
> > +		ret = vimc_streamer_stream_start(stream, ved);
> > +		if (ret)
> > +			return ret;
> > +
> >   		ret = vimc_streamer_pipeline_init(stream, ved);
> >   		if (ret)
> >   			return ret;
> > 
