Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177E126799D
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 12:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgILKta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 06:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgILKt3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 06:49:29 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83E6C061757
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 03:49:28 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bh1so2133192plb.12
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2020 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ISGeX+oAmnEEghLwemM0/pol4ZXYMJRToq8cwGFBgBk=;
        b=toO4VsOj4YdqEEyfpcBXP/p17h1Yw0lw3mFX5MGzEBwBt9tWvjbfL15FInsar/iZGa
         pAldd+XExjm60LVIyj5DChl89LRsl6NrJm5Apg4WYC5QjmVjSoir8O0vQb9X7XIk3cr9
         z+Zy1DifeViubswPxdWD7eG+3inSgNTXql9uZjhMvBrRvJz4Eb9aEoV7kp1MDlWyy9S2
         xnUFONnjSNTJPIPKo6Tk7I0WZc/kYNL+BM68HOlPEe1lxPyT0lucxUoAHuIS7J1BYEVN
         GakNHdQZ/y/H/Qx15HyZotGJ2hivtL9F02RAvs+U67dNhlPuEwLDyJliKGK7nvwXoRmw
         nMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ISGeX+oAmnEEghLwemM0/pol4ZXYMJRToq8cwGFBgBk=;
        b=TSxnd+DDzDCumguoZPFnPOgrVoPHq/HIOuOfM1qIJSud4/x2Ry5YewYIBCVM4V+YnL
         R88gx5ZZJLpq8Va/miwVd7CkRp8llwrvXKd1RFBZs5+hw5xbE9IyWqjyG+2plZjt1vlk
         R/DeX5WG9AXaaUJprRJQZxpk/FFAnKyI1KttSm6DpVmhWL30/992cY5tYv9PZ/5WhHkM
         99fy0JOMGQhMJ+1XRSfgkXR4SB7Y+Mp8wbTYWCXjp/dkpCXwVDliiNfuUyxn7lxyMjLS
         E7uA246y3azGx7yB2hpW0kb8TYM+2ksrUzSORdv+2FZK2K5GJ+JDZ2lWdadgt1fCKCpx
         poog==
X-Gm-Message-State: AOAM532Z27ECYlOZPLkgRt9YeU311KK+2V8I2Arq7pPUYFBXwzuIJN/E
        DA9G8ku7/wq4KCiEkdopmuAVaw==
X-Google-Smtp-Source: ABdhPJzX8WOXtMJCHzk+LwgHx9mglUrpLUpiAMwSllHCnMfURgEri8qqi0kegnkB7ROoJAQjNQkJHQ==
X-Received: by 2002:a17:90b:793:: with SMTP id l19mr6065203pjz.154.1599907768076;
        Sat, 12 Sep 2020 03:49:28 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([2405:201:6801:484c:954a:305:9758:cc93])
        by smtp.gmail.com with ESMTPSA id a24sm4169063pju.25.2020.09.12.03.49.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Sep 2020 03:49:27 -0700 (PDT)
Date:   Sat, 12 Sep 2020 16:19:22 +0530
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: vimc: Multiple stream support in vimc
Message-ID: <20200912104922.GG5022@kaaira-HP-Pavilion-Notebook>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
 <3e374418-0ea1-783a-3943-0a0921d40725@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e374418-0ea1-783a-3943-0a0921d40725@ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 02, 2020 at 11:51:59AM +0100, Kieran Bingham wrote:
> Hi Kaaira,
> 
> Thank you for this series.
> 
> I have tested it, and indeed it works well, which is great work.
> I know this has been hard to debug some of the code paths!

Thanks for testing and helping! :D

> 
> There are a few bits that are hard for me to understand, with the graph
> walking/initialisation - so I think either some better comments or
> refactoring might help there - and Dafna has suggested that there might
> be a useful helper which will assist too. That needs to be checked
> though, as I think your 'streamer' needs to have full visibility of the
> whole pipeline, rather than just a single stream.
> 
> I wonder if it would help to rename it to make that clearer, as
> 'vimc_stream' sounds like it deals with only a single stream - but now
> it deals with multiple - so the naming is a bit confusing.

Hm, I too think that the name is confusing and doesn't show the correct
context..is vimc_streamer_referance a better name? What name do you
suggest?

Thanks, 
Kaaira

> 
> --
> Kieran
> 
> On 19/08/2020 19:04, Kaaira Gupta wrote:
> > This series adds supoort for two (or more) capture devices to be 
> > connected to the same sensors and run simultaneously.
> > 
> > Changes since v2:
> > 	- This series introduces new patches, namely patch 1, 2, 4, 5,
> > 	  7, and 9 to shift multiple captures to operate at a single
> > 	  thread.
> > 
> > Kaaira Gupta (7):
> >   media: vimc: Move get_source_entity to vimc-common
> >   media: vimc: Add get_frame callback
> >   media: vimc: Separate starting stream from pipeline initialisation
> >   media: vimc: Separate closing of stream and thread
> >   media: vimc: Dynamically allocate stream struct
> >   media: vimc: Join pipeline if one already exists
> >   media: vimc: Run multiple captures on same thread
> > 
> > Niklas Söderlund (2):
> >   media: vimc: Add usage count to subdevices
> >   media: vimc: Serialize vimc_streamer_s_stream()
> > 
> >  .../media/test-drivers/vimc/vimc-capture.c    |  42 +++-
> >  drivers/media/test-drivers/vimc/vimc-common.c |  14 ++
> >  drivers/media/test-drivers/vimc/vimc-common.h |  21 +-
> >  .../media/test-drivers/vimc/vimc-debayer.c    |  26 ++-
> >  drivers/media/test-drivers/vimc/vimc-scaler.c |  25 +-
> >  drivers/media/test-drivers/vimc/vimc-sensor.c |  17 +-
> >  .../media/test-drivers/vimc/vimc-streamer.c   | 213 ++++++++++++------
> >  .../media/test-drivers/vimc/vimc-streamer.h   |   2 +
> >  8 files changed, 271 insertions(+), 89 deletions(-)
> > 
> 
> -- 
> Regards
> --
> Kieran
