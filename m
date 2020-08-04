Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AB623BF78
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 20:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgHDSuF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 14:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgHDSuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 14:50:05 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05A2C06174A
        for <linux-media@vger.kernel.org>; Tue,  4 Aug 2020 11:50:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j21so4156056pgi.9
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2020 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=fgzQ9YeoAUvn4fgDKJ7ZgHwS0f5D5U/sKeSSA8bmfXc=;
        b=wMlqQyGXIimjqXlKLmy689EM7vym6Bx7/93a6yStEfBfsCFHe8T8IXzLYqTOk3/2YQ
         5fET/q/ZEVPvVBKKqvv+BJFliFd3bq/FIF3aKkMclzXcd7vIcjc+nVObkzjcr+uib6qY
         lia25i15qf0vsXwiypMLI6ZM98U61FuiWQfYtQPQuEdlmD3O27vfBtlZ670ldQPuzsSQ
         ydhfdAetXyXOROXXJ7x7NWt2spief6MExU/sWO/cW6dZchTDgLJqhR05y2UAtcHBKcHM
         HNWbu6PuPEl88exqH3Juc8qU+n49u55uhHnLIk/lMyBcSbYNbm/7fq/G+OJtxJ1q6rPu
         ieTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=fgzQ9YeoAUvn4fgDKJ7ZgHwS0f5D5U/sKeSSA8bmfXc=;
        b=DiJTUnL3CF2pDOFQANDDwxKsnqBEq3y4Vj2i/Jo1YS5c0Px4333pz2uRzeCSbDj9yd
         6GdFvETv9srcOYo9BGqwqknw6ue/aJ3BlrHqAa+dGvsspm66PfEtrSus2g1AVAbAf/no
         c6WppyOv6hu9bvJ2FqWD8O4GzY59gUtm9+4PK35KRnItwDBY/9pC5zFUOoUUawNrxqPH
         7OAP3In31r8vcj6YQ2vDvGurTSKq1Pm6NyltoTjB1Nxl2yYJRN6zqEy3RCKfauGOTQTk
         rAl0oiSPvqNHVmz98ApOCnkYztAtIo/UCkmqMqMBl8PYAlnyzd2l+EoKKVXUVDsWzEK4
         G2pg==
X-Gm-Message-State: AOAM533BcKF68gADbCA1loVKPYNa9P2+o0TncDxEUgQkhFjwfDQ8vp+c
        mKz5P6dFKi+1V0vDvNMi6Lp9UA==
X-Google-Smtp-Source: ABdhPJyJ/NrCYtH23VwVo/MKH6vU4czKXAQCqgdEXW06Tmmy+8AOQr9xXYh4RescFWn9jvYIoOnYJg==
X-Received: by 2002:a63:e24d:: with SMTP id y13mr20748714pgj.248.1596567003372;
        Tue, 04 Aug 2020 11:50:03 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id y128sm10377612pfy.74.2020.08.04.11.49.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 11:50:02 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Wed, 5 Aug 2020 00:19:52 +0530
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to
 use the same sensor
Message-ID: <20200804184952.GA13319@kaaira-HP-Pavilion-Notebook>
References: <2a6cb067-283d-ca65-2698-1fae66a17d02@collabora.com>
 <20200728113959.GA6350@kaaira-HP-Pavilion-Notebook>
 <3a9ac970-77b8-1bc5-536a-5b4f2bd60745@collabora.com>
 <b5fd3811-2f0e-7563-13fa-bb1e32189814@collabora.com>
 <f2fc6d81-16a6-206b-6bb2-fb99d5a84f65@ideasonboard.com>
 <cd1d18ef-d4ff-8240-e9dd-2d9f9c7c5a45@collabora.com>
 <a2ae2dba-6076-0abc-f620-9047a52b513c@ideasonboard.com>
 <5faeed28-75b2-48d8-4a48-c38418fd89f2@collabora.com>
 <20200731172221.GA28355@kaaira-HP-Pavilion-Notebook>
 <afcdaa96-11b0-bb36-3edb-47505aa28004@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afcdaa96-11b0-bb36-3edb-47505aa28004@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Tue, Aug 04, 2020 at 11:24:56AM +0100, Kieran Bingham wrote:
> Hi Kaaira,
> 
> On 31/07/2020 18:22, Kaaira Gupta wrote:
> > Hi everyone,
> > 
> > On Wed, Jul 29, 2020 at 05:24:25PM +0200, Dafna Hirschfeld wrote:
> >>
> >>
> >> On 29.07.20 15:27, Kieran Bingham wrote:
> >>> Hi Dafna, Kaaira,
> >>>
> >>> On 29/07/2020 14:16, Dafna Hirschfeld wrote:
> >>>>
> >>>>
> >>>> On 29.07.20 15:05, Kieran Bingham wrote:
> >>>>> Hi Dafna,
> >>>>>
> >>>>> On 28/07/2020 15:00, Dafna Hirschfeld wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 28.07.20 14:07, Dafna Hirschfeld wrote:
> >>>>>>> Hi
> >>>>>>>
> >>>>>>> On 28.07.20 13:39, Kaaira Gupta wrote:
> >>>>>>>> On Mon, Jul 27, 2020 at 02:54:30PM -0300, Helen Koike wrote:
> >>>>>>>>> Hi,
> >>>>>>>>>
> >>>>>>>>> On 7/27/20 11:31 AM, Kieran Bingham wrote:
> >>>>>>>>>> Hi all,
> >>>>>>>>>>
> >>>>>>>>>> +Dafna for the thread discussion, as she's missed from the to/cc
> >>>>>>>>>> list.
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> On 24/07/2020 13:21, Kaaira Gupta wrote:
> >>>>>>>>>>> On Fri, Jul 24, 2020 at 02:15:21PM +0200, Niklas Söderlund wrote:
> >>>>>>>>>>> Hi,
> >>>>>>>>>>>
> >>>>>>>>>>>> Hi Kaaira,
> >>>>>>>>>>>>
> >>>>>>>>>>>> Thanks for your work.
> >>>>>>>>>>>
> >>>>>>>>>>> Thanks for yours :D
> >>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> On 2020-07-24 17:32:10 +0530, Kaaira Gupta wrote:
> >>>>>>>>>>>>> This is version 2 of the patch series posted by Niklas for
> >>>>>>>>>>>>> allowing
> >>>>>>>>>>>>> multiple streams in VIMC.
> >>>>>>>>>>>>> The original series can be found here:
> >>>>>>>>>>>>> https://patchwork.kernel.org/cover/10948831/
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> This series adds support for two (or more) capture devices to be
> >>>>>>>>>>>>> connected to the same sensors and run simultaneously. Each
> >>>>>>>>>>>>> capture device
> >>>>>>>>>>>>> can be started and stopped independent of each other.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Patch 1/3 and 2/3 deals with solving the issues that arises once
> >>>>>>>>>>>>> two
> >>>>>>>>>>>>> capture devices can be part of the same pipeline. While 3/3
> >>>>>>>>>>>>> allows for
> >>>>>>>>>>>>> two capture devices to be part of the same pipeline and thus
> >>>>>>>>>>>>> allows for
> >>>>>>>>>>>>> simultaneously use.
> >>>>>>>
> >>>>>>> I wonder if these two patches are enough, since each vimc entity also
> >>>>>>> have
> >>>>>>> a 'process_frame' callback, but only one allocated frame. That means
> >>>>>>> that the 'process_frame' can be called concurrently by two different
> >>>>>>> streams
> >>>>>>> on the same frame and cause corruption.
> >>>>>>>
> >>>>>>
> >>>>>> I think we should somehow change the vimc-stream.c code so that we have
> >>>>>> only
> >>>>>> one stream process per pipe. So if one capture is already streaming,
> >>>>>> then the new
> >>>>>> capture that wants to stream uses the same thread so we don't have two
> >>>>>> threads
> >>>>>> both calling 'process_frame'.
> >>>>>
> >>>>>
> >>>>> Yes, I think it looks and sounds like there are two threads running when
> >>>>> there are two streams.
> >>>>>
> >>>>> so in effect, although they 'share a pipe', aren't they in effect just
> >>>>> sending two separate buffers through their stream-path?
> >>>>>
> >>>>> If that's the case, then I don't think there's any frame corruption,
> >>>>> because they would both have grabbed their own frame separately.
> >>>>
> >>>> But each entity allocates just one buffer. So the same buffer is used for
> >>>> both stream.
> >>>
> >>> Aha, ok, I hadn't realised there was only a single buffer available in
> >>> the pipeline for each entity. Indeed there is a risk of corruption in
> >>> that case.
> >>>
> >>>> What for example can happen is that the debayer of one stream can read the
> >>>> sensor's buffer while the sensor itself writes to the buffer for the other
> >>>> stream.
> >>>
> >>>
> >>> So, In that case, we have currently got a scenario where each 'stream'
> >>> really is operating it's own pipe (even though all components are reused).
> >>>
> >>> Two questions:
> >>>
> >>> Is this acceptable, and we should just use a mutex to ensure the buffers
> >>> are not corrupted, but essentially each stream is a separate temporal
> >>> capture?
> >>>
> >>>
> >>> Or B:
> >>>
> >>> Should we refactor to make sure that there is a single thread, and the
> >>> code which calls process_frame on each entity should become aware of the
> >>> potential for multiple paths at the point of the sensor.
> >>>
> >>>
> >>> I suspect option B is really the 'right' path to take, but it is more
> >>> complicated of course.
> >>
> >> I also think option B is preferable.
> >>
> >> Maybe we can add a bool field 'is_streaming' to struct 'vimc_ent_device'
> >> The stream thread can do a BFS scan from the sensor up to the captures
> >> and call the 'process_frame' for each entity if 'is_streaming == true'.
> >> When a new capture wants to stream it sets 'is_streaming = true'
> >> on the entities on his streaming path.
> > 
> > It is s_stream(enable) that initialises a streaming pipeline, ie the one with
> > those components of the pipeline which are in stream path and then runs a
> > thread which calls process_frame on each and passes the frame to the
> > next entity in streaming pipeline. So currently, one thread is for one
> > "streaming pipeline". So there are two options I can think of if a
> > single thread is required,
> > 
> > 1. Not creating a streaming pipeline, rather create a graph(?) which
> > connects both say Raw capture 1 and debayer B to sensor B if two streams
> > are asked for, and only one of them if one stream is asked..that will
> > not be a property of streamer, so I am not sure where it should be kept.
> > Then I could move creating a thread out of s_stream. Creating the thread
> > should wait for entire pipeline to be created, ie s_stream(enable) to
> > must be called by both the captures, and a graph made of all pipeline
> > components before thread initialisation starts. I am not sure how this
> > should be implemented.
> 
> The graph already exists, and can be walked through the media controller
> right?

Yes, but actually, the current implementation of the thread does not
walk through the entire pipeline, rather ved_pipeline, which is the
portions of the pipeline which come in the streaming path of a stream
which calls the thread. This also answers your doubt why the pipeline is
decreamenting (which you have asked later in the mail). ved_pipeline is
an array of the entities in the path of the stream starting from
capture. Hence my suggestion was if I should make a data structure (a 
graph) which holds all the entities in one or more stream path.

> 
> 
> > 2. Another option is to check if a stream already exists (by creating it
> > a property of vimc to keep a track of no. of streams maybe?), if it is
> > already present I could take the previous output of sensor (but
> > then it will have to be stored, so i don't think this is a nice idea),
> > and use it further (but thread will be different in this case).
> 
> I don't think I understand this one...

I meant that to start a thread for the driver, rather than each stream,
maybe instead of creating a graph (as in the first option), maybe the
druver could know the number of steams alsready running, and hence when
s_stream is called for another, it knows how many and what type of
streams are running, which can then /know/ which entity's output of
process_frame(previous stream) to give on to the current stream. But I
wasn't sure about the implementation of the /knwing/part without
hardcoding it to take output from the sensor. But since that is the only
topology (hardcoded)we have currently, maybe that can be a solution,
hence I asked.

> 
> 
> > What can be a better design for VIMC to have a single thread if two
> > streams are asked (apart/of the options I mentioned)?
> 
> How about adding a count in s_stream so that the thread only gets
> started when the use count is > 0, and stopped when the usage < 1.
> 
> That handles making sure that only one thread is available.
> 
> All calls into s_stream() will need to take a lock/mutex to protect /
> prevent any action from occurring while the thread is performing a
> process of the pipeline.
> 
> 
> static int vimc_streamer_thread(void *data)
> {
> 	struct vimc_stream *stream = data;
> 	u8 *frame = NULL;
> 	int i;
> 
> 	set_freezable();
> 
> 	for (;;) {
> 		try_to_freeze();
> 		if (kthread_should_stop())
> 			break;
> 
> +		/* take lock shared with s_stream */
> 
> 		for (i = stream->pipe_size - 1; i >= 0; i--) {
> 			frame = stream->ved_pipeline[i]->process_frame(
> 					stream->ved_pipeline[i], frame);
> 			if (!frame || IS_ERR(frame))
> 				break;
> 		}
> 
> +		/* Release lock/mutex shared with s_stream
> 
> 		//wait for 60hz
> 		set_current_state(TASK_UNINTERRUPTIBLE);
> 		schedule_timeout(HZ / 60);
> 	}
> 
> 	return 0;
> }
> 
> 
> 
> And you'll need to make the code which processes the pipeline aware of
> the fact that there may be two pipelines to fulfil:
> 
> Pseudo patch/code:
> 
> static int vimc_streamer_thread(void *data)
> {
> -	struct vimc_stream *stream = data;
> +	/* Something which knows about the whole device */
> +	struct xxxxx *yyy = data;
> 
> +	u8 *raw;
> 	u8 *frame = NULL;
> 	int i;
> 
> 	set_freezable();
> 
> 	for (;;) {
> 		try_to_freeze();
> 		if (kthread_should_stop())
> 			break;
> 
> 		/* take lock shared with s_stream */
> 
> +		/* Process the sensor first */
> +		raw = stream->ved_pipeline[sensor]->process_frame(..);
> +		error check;
> 
> +		/* (If connected) Process stream 1 */
> +		if (raw)
> +		frame = stream->ved_pipeline[raw]->process_frame();
> +		error check;
> 
> +		/* If connected process the rest of the pipe */
> +		for (i = after sensor; end_entity; i++) {
> 			frame = stream->ved_pipeline[i]->process_frame(
> 					stream->ved_pipeline[i], frame);
> 			if (!frame || IS_ERR(frame))
> 				break;
> 		}
> 
> 		/* Release lock/mutex shared with s_stream
> 
> 		//wait for 60hz
> 		set_current_state(TASK_UNINTERRUPTIBLE);
> 		schedule_timeout(HZ / 60);
> 	}
> 
> 	return 0;
> }
> 
> 
> 
> I may have missed something as the original loop was decrementing and
> going backwards through the entities in stream->ved_pipeline.
> 
> I guess splitting that all out so instead it starts at the sensor, and
> just walks the graph (handling any running/connected fork to two
> entities appropriately) in a neater way would be another option rather
> than hardcoding it, but either way the thread needs to operate at the
> device level rather than the stream level.
> 
> 
> 
> > Thanks
> > Kaaira
> > 
> >>
> >> Thanks,
> >> Dafna
> >>
> >>
> >>>
> >>> --
> >>> Kieran
> >>>
> >>>
> >>>
> >>>
> >>>> Thanks,
> >>>> Dafna
> >>>>
> >>>>>
> >>>>>
> >>>>> I don't think that's a good example of the hardware though, as that
> >>>>> doesn't reflect what 'should' happen where the TPG runs once to generate
> >>>>> a frame at the sensor, which is then read by both the debayer entity and
> >>>>> the RAW capture device when there are two streams...
> >>>>>
> >>>>>
> >>>>> So I suspect trying to move to a single thread is desirable, but that
> >>>>> might be a fair bit of work also.
> >>>>>
> >>>>> -- 
> >>>>> Kieran
> >>>>>
> >>>>>
> >>>>>
> >>>>>> The second capture that wants to stream should iterate the topology
> >>>>>> downwards until
> >>>>>> reaching an entity that already belong to the stream path of the other
> >>>>>> streaming capture
> >>>>>> and tell the streamer it wants to read the frames this entity
> >>>>>> produces.
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Dafna
> >>>>>>
> >>>>>>> Thanks,
> >>>>>>> Dafna
> >>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> I'm just curious if you are aware of this series? It would
> >>>>>>>>>>>> replace the
> >>>>>>>>>>>> need for 1/3 and 2/3 of this series right?
> >>>>>>>>>>>
> >>>>>>>>>>> v3 of this series replaces the need for 1/3, but not the current
> >>>>>>>>>>> version
> >>>>>>>>>>> (ie v4). v4 of patch 2/5 removes the stream_counter that is
> >>>>>>>>>>> needed to
> >>>>>>>>>>> keep count of the calls to s_stream. Hence 1/3 becomes relevant
> >>>>>>>>>>> again.
> >>>>>>>>>>
> >>>>>>>>>> So the question really is, how do we best make use of the two
> >>>>>>>>>> current
> >>>>>>>>>> series, to achieve our goal of supporting multiple streams.
> >>>>>>>>>>
> >>>>>>>>>> Having not parsed Dafna's series yet, do we need to combine
> >>>>>>>>>> elements of
> >>>>>>>>>> both ? Or should we work towards starting with this series and get
> >>>>>>>>>> dafna's patches built on top ?
> >>>>>>>>>>
> >>>>>>>>>> Or should patch 1/3 and 3/3 of this series be on top of Dafna's v4 ?
> >>>>>>>>>>
> >>>>>>>>>> (It might be noteworthy to say that Kaaira has reported successful
> >>>>>>>>>> multiple stream operation from /this/ series and her development
> >>>>>>>>>> branch
> >>>>>>>>>> on libcamera).
> >>>>>>>>>
> >>>>>>>>> Dafna's patch seems still under discussion, but I don't want to
> >>>>>>>>> block progress in Vimc either.
> >>>>>>>>>
> >>>>>>>>> So I was wondering if we can move forward with Vimc support for
> >>>>>>>>> multistreaming,
> >>>>>>>>> without considering Dafna's patchset, and we can do the clean up
> >>>>>>>>> later once we solve that.
> >>>>>>>>>
> >>>>>>>>> What do you think?
> >>>>>>>>
> >>>>>>>> I agree with supporting multiple streams with VIMC with this patchset,
> >>>>>>>> and then we can refactor the counters for s_stream in VIMC later (over
> >>>>>>>> this series) if dafna includes them in subsequent version of her
> >>>>>>>> patchset.
> >>>>>>>>
> >>>>>>>
> >>>>>>> I also think that adding support in the code will take much longer and
> >>>>>>> should not
> >>>>>>> stop us from supporting vimc independently.
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>> Dafna
> >>>>>>>
> >>>>>>>>>
> >>>>>>>>> Regards,
> >>>>>>>>> Helen
> >>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>>> 1.
> >>>>>>>>>>>> https://lore.kernel.org/linux-media/20200522075522.6190-1-dafna.hirschfeld@collabora.com/
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Changes since v1:
> >>>>>>>>>>>>>       - All three patches rebased on latest media-tree.
> >>>>>>>>>>>>>       Patch 3:
> >>>>>>>>>>>>>       - Search for an entity with a non-NULL pipe instead of
> >>>>>>>>>>>>> searching
> >>>>>>>>>>>>>         for sensor. This terminates the search at output itself.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Kaaira Gupta (3):
> >>>>>>>>>>>>>      media: vimc: Add usage count to subdevices
> >>>>>>>>>>>>>      media: vimc: Serialize vimc_streamer_s_stream()
> >>>>>>>>>>>>>      media: vimc: Join pipeline if one already exists
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>     .../media/test-drivers/vimc/vimc-capture.c    | 35
> >>>>>>>>>>>>> ++++++++++++++++++-
> >>>>>>>>>>>>>     .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
> >>>>>>>>>>>>>     drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
> >>>>>>>>>>>>>     drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
> >>>>>>>>>>>>>     .../media/test-drivers/vimc/vimc-streamer.c   | 23
> >>>>>>>>>>>>> +++++++-----
> >>>>>>>>>>>>>     5 files changed, 73 insertions(+), 10 deletions(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> -- 
> >>>>>>>>>>>>> 2.17.1
> >>>>>>>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>>>>> -- 
> >>>>>>>>>>>> Regards,
> >>>>>>>>>>>> Niklas Söderlund
> >>>>>>>>>>
> >>>>>
> >>>
> 
> -- 
> Regards
> --
> Kieran
