Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB54D230C60
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 16:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730294AbgG1O0O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 10:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730093AbgG1O0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 10:26:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A93EC0619D2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 07:26:11 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t1so805099plq.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=yWye7aaOVC0N5NGSUhVAFihgxHbQAy+hcp/icevuJzQ=;
        b=tLXWax6Mgil3NUz0RBaoHn14Nm7RUOSDRmFITnEhpSuALgkjSriY38YnsTgtaqgQu+
         OlDZPQre9De/cTMdDdronoKEd+1hFRpZ/1GF1GtLVntnt515h9EwonZ6NAupW6xNWAYt
         +obvIb4sVqpjI8kolIoukFxTk2Q0n19thONIQjAl40U6sErbvdDX+gyUxyjVG7SPGE3J
         9x/wsyy3IOSWOxuuQArAfytkszoFtGyKka0+6Ck01ttRCq+AcVw39Mjv8IyJfAiNEwxc
         X+ABe3CCnujKu+cW5Q8lOreMQ15uta9Ru7BqiuvWl5wQ651s1GCNnwx1eiCB/Y+rUrdd
         EBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=yWye7aaOVC0N5NGSUhVAFihgxHbQAy+hcp/icevuJzQ=;
        b=avAjzwECH1szImxX6Q2zwUBpwGU+CjmYmheFFByM5EYs4zb/70gYHmotXr16lTtPSh
         fUYCxIBOz+mCfmbS4Oy/dn1yS2EOp286hW65AzmAO7Rl1J7qUklfwGLRRw/YrSWPT6Bf
         lZMqASnDp0eMAtPob9k/7Pad+zJimj3d0bfOzX2hGIG9VHbq6bH07T+xYWR1m3W6fRiW
         IlpNHxaQ0BnXgc+tZ8nI9AgIf4l5blreCtIm9j1QqcPEGhLnJepQT1s8fc+4KEciVt5E
         CU8gdeskvH+GllkUJpe75p4ivTf5BBv1Im/gutUV6jq5Lm3GIrbxtvxECfhipyTyZdxh
         k8MA==
X-Gm-Message-State: AOAM533MqskbdRFYk9oISkki4zFVAn0NhruAQFTmAF5YhAe8GlolYg22
        4x2AX5D4Z42nOI0HdkUCSOSMFawxAjU=
X-Google-Smtp-Source: ABdhPJwT9PwF8AasW9nIoZykHYSZIPo88QFB9Sp400i/6hIC5/ISjU8gm5FjqBtYOD5uwBJ9Zg5J/Q==
X-Received: by 2002:a17:90a:3c8f:: with SMTP id g15mr1503794pjc.215.1595946370672;
        Tue, 28 Jul 2020 07:26:10 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id p127sm18312194pfb.17.2020.07.28.07.26.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 07:26:10 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Tue, 28 Jul 2020 19:56:01 +0530
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        kieran.bingham@ideasonboard.com,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to
 use the same sensor
Message-ID: <20200728142601.GA26259@kaaira-HP-Pavilion-Notebook>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200724121521.GA2705690@oden.dyn.berto.se>
 <20200724122104.GA18482@kaaira-HP-Pavilion-Notebook>
 <a6f4eabf-6cd5-950b-f2e3-853370c77629@ideasonboard.com>
 <2a6cb067-283d-ca65-2698-1fae66a17d02@collabora.com>
 <20200728113959.GA6350@kaaira-HP-Pavilion-Notebook>
 <3a9ac970-77b8-1bc5-536a-5b4f2bd60745@collabora.com>
 <b5fd3811-2f0e-7563-13fa-bb1e32189814@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5fd3811-2f0e-7563-13fa-bb1e32189814@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 28, 2020 at 04:00:46PM +0200, Dafna Hirschfeld wrote:
> 
> 
> On 28.07.20 14:07, Dafna Hirschfeld wrote:
> > Hi
> > 
> > On 28.07.20 13:39, Kaaira Gupta wrote:
> > > On Mon, Jul 27, 2020 at 02:54:30PM -0300, Helen Koike wrote:
> > > > Hi,
> > > > 
> > > > On 7/27/20 11:31 AM, Kieran Bingham wrote:
> > > > > Hi all,
> > > > > 
> > > > > +Dafna for the thread discussion, as she's missed from the to/cc list.
> > > > > 
> > > > > 
> > > > > On 24/07/2020 13:21, Kaaira Gupta wrote:
> > > > > > On Fri, Jul 24, 2020 at 02:15:21PM +0200, Niklas Söderlund wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > > Hi Kaaira,
> > > > > > > 
> > > > > > > Thanks for your work.
> > > > > > 
> > > > > > Thanks for yours :D
> > > > > > 
> > > > > > > 
> > > > > > > On 2020-07-24 17:32:10 +0530, Kaaira Gupta wrote:
> > > > > > > > This is version 2 of the patch series posted by Niklas for allowing
> > > > > > > > multiple streams in VIMC.
> > > > > > > > The original series can be found here:
> > > > > > > > https://patchwork.kernel.org/cover/10948831/
> > > > > > > > 
> > > > > > > > This series adds support for two (or more) capture devices to be
> > > > > > > > connected to the same sensors and run simultaneously. Each capture device
> > > > > > > > can be started and stopped independent of each other.
> > > > > > > > 
> > > > > > > > Patch 1/3 and 2/3 deals with solving the issues that arises once two
> > > > > > > > capture devices can be part of the same pipeline. While 3/3 allows for
> > > > > > > > two capture devices to be part of the same pipeline and thus allows for
> > > > > > > > simultaneously use.
> > 
> > I wonder if these two patches are enough, since each vimc entity also have
> > a 'process_frame' callback, but only one allocated frame. That means
> > that the 'process_frame' can be called concurrently by two different streams
> > on the same frame and cause corruption.
> > 
> 
> I think we should somehow change the vimc-stream.c code so that we have only
> one stream process per pipe. So if one capture is already streaming, then the new
> capture that wants to stream uses the same thread so we don't have two threads
> both calling 'process_frame'.

I didn't understand this well, can you please elaborate? How will it
lead to the new capture using same thread?

> 
> The second capture that wants to stream should iterate the topology downwards until
> reaching an entity that already belong to the stream path of the other streaming capture
> and tell the streamer it wants to read the frames this entity
> produces.

The first version of this series was doing this itself I think. But it
was for connecting the pipe(capture) at the sensor if one already
exists. 

> 
> Thanks,
> Dafna
> 
> > Thanks,
> > Dafna
> > 
> > > > > > > 
> > > > > > > I'm just curious if you are aware of this series? It would replace the
> > > > > > > need for 1/3 and 2/3 of this series right?
> > > > > > 
> > > > > > v3 of this series replaces the need for 1/3, but not the current version
> > > > > > (ie v4). v4 of patch 2/5 removes the stream_counter that is needed to
> > > > > > keep count of the calls to s_stream. Hence 1/3 becomes relevant again.
> > > > > 
> > > > > So the question really is, how do we best make use of the two current
> > > > > series, to achieve our goal of supporting multiple streams.
> > > > > 
> > > > > Having not parsed Dafna's series yet, do we need to combine elements of
> > > > > both ? Or should we work towards starting with this series and get
> > > > > dafna's patches built on top ?
> > > > > 
> > > > > Or should patch 1/3 and 3/3 of this series be on top of Dafna's v4 ?
> > > > > 
> > > > > (It might be noteworthy to say that Kaaira has reported successful
> > > > > multiple stream operation from /this/ series and her development branch
> > > > > on libcamera).
> > > > 
> > > > Dafna's patch seems still under discussion, but I don't want to block progress in Vimc either.
> > > > 
> > > > So I was wondering if we can move forward with Vimc support for multistreaming,
> > > > without considering Dafna's patchset, and we can do the clean up later once we solve that.
> > > > 
> > > > What do you think?
> > > 
> > > I agree with supporting multiple streams with VIMC with this patchset,
> > > and then we can refactor the counters for s_stream in VIMC later (over
> > > this series) if dafna includes them in subsequent version of her patchset.
> > > 
> > 
> > I also think that adding support in the code will take much longer and should not
> > stop us from supporting vimc independently.
> > 
> > Thanks,
> > Dafna
> > 
> > > > 
> > > > Regards,
> > > > Helen
> > > > 
> > > > > 
> > > > > 
> > > > > > > 1.  https://lore.kernel.org/linux-media/20200522075522.6190-1-dafna.hirschfeld@collabora.com/
> > > > > > > 
> > > > > > > > 
> > > > > > > > Changes since v1:
> > > > > > > >     - All three patches rebased on latest media-tree.
> > > > > > > >     Patch 3:
> > > > > > > >     - Search for an entity with a non-NULL pipe instead of searching
> > > > > > > >       for sensor. This terminates the search at output itself.
> > > > > > > > 
> > > > > > > > Kaaira Gupta (3):
> > > > > > > >    media: vimc: Add usage count to subdevices
> > > > > > > >    media: vimc: Serialize vimc_streamer_s_stream()
> > > > > > > >    media: vimc: Join pipeline if one already exists
> > > > > > > > 
> > > > > > > >   .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
> > > > > > > >   .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
> > > > > > > >   drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
> > > > > > > >   drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
> > > > > > > >   .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
> > > > > > > >   5 files changed, 73 insertions(+), 10 deletions(-)
> > > > > > > > 
> > > > > > > > -- 
> > > > > > > > 2.17.1
> > > > > > > > 
> > > > > > > 
> > > > > > > -- 
> > > > > > > Regards,
> > > > > > > Niklas Söderlund
> > > > > 
