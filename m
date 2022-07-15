Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C12B5764B0
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 17:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235768AbiGOPos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 11:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235923AbiGOPo3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 11:44:29 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B2D27B05
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:43:52 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id eq6so6786997edb.6
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sMjWuFx8VfuOPKr3NQO99AGUhWnFSs5xz30WyRfNAFs=;
        b=q1IWrHw2gGCComPkBaZUENZaQYI4xJAZZYyWWiPz3ZnD/ZwjpSdiKQOD+TTbEzf03I
         yNKF9RRiLQ9iDjZj3jP8tBji0zKWRRmbEL9fUye/EB7KniGM2Rx2AKih8JRUqCiR1IKB
         iljGhO2QIUlsLgGGDlCCDZgQgDJGNtYuqluY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sMjWuFx8VfuOPKr3NQO99AGUhWnFSs5xz30WyRfNAFs=;
        b=6exRbDLmLRYKfFiGuZ5Avq0itldUpKROrOkqMvU3bwbkPfy8JuS8qdbf/Esb08nZUe
         eeoBS9KVZtleFwJ5YixhQRqfm7wo82bog4e4otl4ul91AGi7fW70GGbSCwr9z5eziADj
         StWT6szO7hyEvRujkVzaplodHK9hHWfPIWt2a+hJp7uMcCAymkJa/tcx2AVeAeIwmz3K
         kiZ03F6osAKli6AQwUgivNRFZTJfGH44K8ECisSqK85J6WGss31mIGvyDmgKNF0DR2ee
         4VzCNkaL1pG0mCLzYJfvOmDKZxcYpqpJNsqOOdA1fNMfaQmIO/9wzxWiP4Q0AeiI5cW3
         oOAg==
X-Gm-Message-State: AJIora9x8m88F2yNn7QCCoMqagcHBXE+HqaHIhv3i0F+frbf3qSJiHOd
        Qxc6i5xVkMhzggQ9Va8fXjx1k2iXZt7xUA==
X-Google-Smtp-Source: AGRyM1tJ0cxxHT/Kj5n6Q1Xmv1fo7oZqDf7KqAtbEkP+ceFJXTTwh09tgngLJJQXcrh+O0d28aJNFA==
X-Received: by 2002:aa7:dd16:0:b0:43a:e850:a245 with SMTP id i22-20020aa7dd16000000b0043ae850a245mr19334100edv.127.1657899830987;
        Fri, 15 Jul 2022 08:43:50 -0700 (PDT)
Received: from p310.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id h14-20020a17090619ce00b0072b4da1ed9asm2147494ejd.225.2022.07.15.08.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 08:43:50 -0700 (PDT)
Date:   Fri, 15 Jul 2022 18:47:09 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: properly set test pattern to a sub-device
Message-ID: <YtGL/fICgFf0yh8Q@p310.k.g>
References: <YtA0oTgCRlRP8K53@p310.k.g>
 <165784088978.3944957.6816198396634347236@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <165784088978.3944957.6816198396634347236@Monstersaurus>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22-07-15 00:21:29, Kieran Bingham wrote:
> Quoting Petko Manolov (2022-07-14 16:22:09)
> >         Hi guys,
> > 
> > I've got a long pipeline of four entities and need to make the imx492 sensor 
> > stream out a test pattern.  When i do:
> > 
> >         v4l2-ctl -d /dev/v4l-subdev2 --set-ctrl=test_pattern=2
> > 
> > I can see the driver acknowledging the switch to test pattern 2.  However, 
> > when start streaming with:
> > 
> >         v4l2-ctl -d /dev/video0 --stream-mmap --stream-to=frame.raw 
> >         --stream-count=1
> > 
> > the driver reports setting the test pattern to the default 0.  How should 
> > this be done properly?
> 
> 'Which' driver is reporting setting the test pattern? Can you check where 
> that's happening and identify 'why'?
> 
> As I understand it - it shouldn't be happening, so I suspect it's something in 
> your CSI2 receiver driver initialising some defaults perhaps.

Well, found it - my s_ctrl() was accidentally returning -EINVAL for 
V4L2_CID_TEST_PATTERN.  I _assume_ this is why V4L2 was correcting it to '0' at 
stream time.  Not being well versed in V4L2 i leave this one to you guys. :)

Now, this brings out an interesting question.  The way s_ctrl() is written 'int 
ret' is declared in the prologue of the function.  The only place 'ret' was not 
assigned some value was at 'case V4L2_CID_TEST_PATTERN:'.  s_ctrl() was happily 
returning whatever happened to be in the stack at that time.

With all GCC warnings enabled these days for the kernel build, i'm rather 
surprised to see absolutely nothing on the command line when compiling the 
driver.  Odd...


		Petko
