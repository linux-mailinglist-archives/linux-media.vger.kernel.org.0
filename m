Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9C9230902
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 13:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgG1LkK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 07:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728985AbgG1LkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 07:40:09 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA695C0619D2
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 04:40:08 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o13so11757341pgf.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2020 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0XQ2Vxa93O1m7Vubhiuc2zEi8QabfXueBoQQ7/KZrOc=;
        b=SLJCGPxleMdS0DhIrEqzCKvRJUFdmxzb68cXKmQuQ5NQaRRIUQSsQaxoSDf1DlqarV
         0J8DIcPBOhEPVnS4EgFK4fZz+2pzJ5ofy9LmzbavzwQcIFGmoq8RGKkmedXIbuQfQDDG
         Ep6dtFfhbSq9E1XEGRPmRMPe44Ll1b+01RtZpvwjebKz8CQyiXv3ZkoFx9czpLc0ExZs
         TrjS/0Ffl5q2od7CGB/k8Tf0TOhkfvBiDEWlrfwszMDFD62SEYNDU7fxYxMrAVtME+Hy
         pbO3lgcL5k/8wsue3Ku069GJk7WQfOW0G8CH1m/4l9/jm3gBSV3rgvmKiaAKWfaAHExL
         A4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=0XQ2Vxa93O1m7Vubhiuc2zEi8QabfXueBoQQ7/KZrOc=;
        b=rCFZjiHgFm4eZySa1N+5hIUyxONQjkpxGiuAs+saFx10jP2cguH0pU+VsSLA9je1Aa
         45Sc8mzU/jnr+RzEdtuHhpJ5DfZn5qQZ6noqOaTUZxi/sM1k/diaJlhzRNjIS2Sv+kXl
         k8R6fR13xbGs+iaTiqBavSYfmvWj7vEBphYrzHgytW9GXJ4vbDa1ucVgrIx7OI092fAu
         8rfOEs+vucpCMgf05sqJA6vnQzGXr6gLNzW/WfzJVTEVeAA2vuaoy+f4y26VR6cC+PiR
         xM9NVJTQLIVY4JSW4C7JkzEyD4/1IBOqhCf3etop9F8wXrRwmmO3IX3xEGRh4g/GHPEN
         giCw==
X-Gm-Message-State: AOAM531bNRtgTOEHnrDJOBptqxZnSGpYn9bVRvOthSeUDMDmGrqia/0g
        TriFnXu0mEQPaw/BOQrTBSjjKw==
X-Google-Smtp-Source: ABdhPJxTbbtSSmVLfmcz/PL9kmrh+OiIOVC5xZqs2ykHzeJ60xYTpbOMQQAObkxqZAwDDtdbfMeFRg==
X-Received: by 2002:a63:144c:: with SMTP id 12mr23839912pgu.189.1595936408282;
        Tue, 28 Jul 2020 04:40:08 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id p19sm17230243pgj.74.2020.07.28.04.40.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 04:40:07 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Tue, 28 Jul 2020 17:09:59 +0530
To:     Helen Koike <helen.koike@collabora.com>
Cc:     kieran.bingham@ideasonboard.com,
        Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to
 use the same sensor
Message-ID: <20200728113959.GA6350@kaaira-HP-Pavilion-Notebook>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200724121521.GA2705690@oden.dyn.berto.se>
 <20200724122104.GA18482@kaaira-HP-Pavilion-Notebook>
 <a6f4eabf-6cd5-950b-f2e3-853370c77629@ideasonboard.com>
 <2a6cb067-283d-ca65-2698-1fae66a17d02@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a6cb067-283d-ca65-2698-1fae66a17d02@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 02:54:30PM -0300, Helen Koike wrote:
> Hi,
> 
> On 7/27/20 11:31 AM, Kieran Bingham wrote:
> > Hi all,
> > 
> > +Dafna for the thread discussion, as she's missed from the to/cc list.
> > 
> > 
> > On 24/07/2020 13:21, Kaaira Gupta wrote:
> >> On Fri, Jul 24, 2020 at 02:15:21PM +0200, Niklas Söderlund wrote:
> >> Hi,
> >>
> >>> Hi Kaaira,
> >>>
> >>> Thanks for your work.
> >>
> >> Thanks for yours :D
> >>
> >>>
> >>> On 2020-07-24 17:32:10 +0530, Kaaira Gupta wrote:
> >>>> This is version 2 of the patch series posted by Niklas for allowing
> >>>> multiple streams in VIMC.
> >>>> The original series can be found here:
> >>>> https://patchwork.kernel.org/cover/10948831/
> >>>>
> >>>> This series adds support for two (or more) capture devices to be 
> >>>> connected to the same sensors and run simultaneously. Each capture device 
> >>>> can be started and stopped independent of each other.
> >>>>
> >>>> Patch 1/3 and 2/3 deals with solving the issues that arises once two 
> >>>> capture devices can be part of the same pipeline. While 3/3 allows for 
> >>>> two capture devices to be part of the same pipeline and thus allows for 
> >>>> simultaneously use.
> >>>
> >>> I'm just curious if you are aware of this series? It would replace the 
> >>> need for 1/3 and 2/3 of this series right?
> >>
> >> v3 of this series replaces the need for 1/3, but not the current version
> >> (ie v4). v4 of patch 2/5 removes the stream_counter that is needed to
> >> keep count of the calls to s_stream. Hence 1/3 becomes relevant again.
> > 
> > So the question really is, how do we best make use of the two current
> > series, to achieve our goal of supporting multiple streams.
> > 
> > Having not parsed Dafna's series yet, do we need to combine elements of
> > both ? Or should we work towards starting with this series and get
> > dafna's patches built on top ?
> > 
> > Or should patch 1/3 and 3/3 of this series be on top of Dafna's v4 ?
> > 
> > (It might be noteworthy to say that Kaaira has reported successful
> > multiple stream operation from /this/ series and her development branch
> > on libcamera).
> 
> Dafna's patch seems still under discussion, but I don't want to block progress in Vimc either.
> 
> So I was wondering if we can move forward with Vimc support for multistreaming,
> without considering Dafna's patchset, and we can do the clean up later once we solve that.
> 
> What do you think?

I agree with supporting multiple streams with VIMC with this patchset,
and then we can refactor the counters for s_stream in VIMC later (over
this series) if dafna includes them in subsequent version of her patchset.

> 
> Regards,
> Helen
> 
> > 
> > 
> >>> 1.  https://lore.kernel.org/linux-media/20200522075522.6190-1-dafna.hirschfeld@collabora.com/
> >>>
> >>>>
> >>>> Changes since v1:
> >>>> 	- All three patches rebased on latest media-tree.
> >>>> 	Patch 3:
> >>>> 	- Search for an entity with a non-NULL pipe instead of searching
> >>>> 	  for sensor. This terminates the search at output itself.
> >>>>
> >>>> Kaaira Gupta (3):
> >>>>   media: vimc: Add usage count to subdevices
> >>>>   media: vimc: Serialize vimc_streamer_s_stream()
> >>>>   media: vimc: Join pipeline if one already exists
> >>>>
> >>>>  .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
> >>>>  .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
> >>>>  drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
> >>>>  drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
> >>>>  .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
> >>>>  5 files changed, 73 insertions(+), 10 deletions(-)
> >>>>
> >>>> -- 
> >>>> 2.17.1
> >>>>
> >>>
> >>> -- 
> >>> Regards,
> >>> Niklas Söderlund
> > 
