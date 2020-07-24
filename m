Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4265122C506
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 14:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgGXMVM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 08:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgGXMVL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 08:21:11 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785B8C0619E4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:21:11 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k1so5130219pjt.5
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=C2/h5UjeFskvfl8RWhRF+RA8gCVrQiaw+gKjZeYALgY=;
        b=g6icLpl22LF2yOH4Jey3EDzEKeK33r0xxY/XYlASaeu5H8vv+AB0UTt84LL36sHaQz
         O0BMqkAXohsZ1bIRdtXpuCP7E+R+UH0mZIdTvB96LTMoC6V0+848/F0lM5TS+YdHliqh
         934WCQcfywmAhp7xcddThNCHptNNQLnbfsX90PAlELWvnJMU2lSORTDweKJdwKCqjmvB
         O904lZ2vZoZTLCNob6Qz2vlMMDOEjjPZjH4+RIR1PQt8ngYFZScy4T0TbFmyerEicPrj
         AU/lDzD0omTuSMpsM0yKvkf1IJHCZ0+YQb+jBJNLLd+CRzrK41Z/DEh/QZmx7r+hLlvb
         Yr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=C2/h5UjeFskvfl8RWhRF+RA8gCVrQiaw+gKjZeYALgY=;
        b=Fmc16JcuGStkA1A1AzFpXdGmfc1tsiBKVJWQ9jXxdXtLZ0cSRepg/w9mIoTUyMxjzL
         mDJuOI1LQXlqdAToy2MWtG8orc4NVEepJbO2rFNKm4Bwrm4bJkoOWwwzXHROPgor5Hi6
         pQ8ByH05y8+gZvznJjBWlSr85BK2zEu+1M1LlRiLiSjlKnsqtbtKUZk+mH+s6NK4mJNF
         gfqpaqat2ElyA+rz8jghX93rv5ESSzN2hqO/sLf5F78zbcCfOewoPFT2JCR1l9kRR207
         HPotisjyWbHHEenXGzOB7oclf9rdjEj286J4Rvx8i4z3zJ5CDGVfWX/QiAjtQPec2RRd
         DaGg==
X-Gm-Message-State: AOAM5335bF3OrnkqZcgUmYMnlNBda5x74ugFLLldvfLd+PuVeARMT+cc
        4wiuZftDzNREEm5dq3dT3awG1tMlqkE=
X-Google-Smtp-Source: ABdhPJy9n1m+7gbI5xbxjzWVy7KzIaWQzWQKFwoxokZQFjaDtAZ37o0Mou+xAob6CZtUkTVsJvG//A==
X-Received: by 2002:a17:90a:20ad:: with SMTP id f42mr4993812pjg.96.1595593270849;
        Fri, 24 Jul 2020 05:21:10 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.178])
        by smtp.gmail.com with ESMTPSA id p9sm6334855pja.4.2020.07.24.05.21.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 05:21:10 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Fri, 24 Jul 2020 17:51:04 +0530
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 0/3] media: vimc: Allow multiple capture devices to
 use the same sensor
Message-ID: <20200724122104.GA18482@kaaira-HP-Pavilion-Notebook>
References: <20200724120213.17119-1-kgupta@es.iitr.ac.in>
 <20200724121521.GA2705690@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200724121521.GA2705690@oden.dyn.berto.se>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 24, 2020 at 02:15:21PM +0200, Niklas Söderlund wrote:
Hi,

> Hi Kaaira,
> 
> Thanks for your work.

Thanks for yours :D

> 
> On 2020-07-24 17:32:10 +0530, Kaaira Gupta wrote:
> > This is version 2 of the patch series posted by Niklas for allowing
> > multiple streams in VIMC.
> > The original series can be found here:
> > https://patchwork.kernel.org/cover/10948831/
> > 
> > This series adds support for two (or more) capture devices to be 
> > connected to the same sensors and run simultaneously. Each capture device 
> > can be started and stopped independent of each other.
> > 
> > Patch 1/3 and 2/3 deals with solving the issues that arises once two 
> > capture devices can be part of the same pipeline. While 3/3 allows for 
> > two capture devices to be part of the same pipeline and thus allows for 
> > simultaneously use.
> 
> I'm just curious if you are aware of this series? It would replace the 
> need for 1/3 and 2/3 of this series right?

v3 of this series replaces the need for 1/3, but not the current version
(ie v4). v4 of patch 2/5 removes the stream_counter that is needed to
keep count of the calls to s_stream. Hence 1/3 becomes relevant again.

> 
> 1.  https://lore.kernel.org/linux-media/20200522075522.6190-1-dafna.hirschfeld@collabora.com/
> 
> > 
> > Changes since v1:
> > 	- All three patches rebased on latest media-tree.
> > 	Patch 3:
> > 	- Search for an entity with a non-NULL pipe instead of searching
> > 	  for sensor. This terminates the search at output itself.
> > 
> > Kaaira Gupta (3):
> >   media: vimc: Add usage count to subdevices
> >   media: vimc: Serialize vimc_streamer_s_stream()
> >   media: vimc: Join pipeline if one already exists
> > 
> >  .../media/test-drivers/vimc/vimc-capture.c    | 35 ++++++++++++++++++-
> >  .../media/test-drivers/vimc/vimc-debayer.c    |  8 +++++
> >  drivers/media/test-drivers/vimc/vimc-scaler.c |  8 +++++
> >  drivers/media/test-drivers/vimc/vimc-sensor.c |  9 ++++-
> >  .../media/test-drivers/vimc/vimc-streamer.c   | 23 +++++++-----
> >  5 files changed, 73 insertions(+), 10 deletions(-)
> > 
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Regards,
> Niklas Söderlund
