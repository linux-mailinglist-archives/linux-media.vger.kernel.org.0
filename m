Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C168EA64E4
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 11:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbfICJPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 05:15:49 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:36018 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfICJPt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 05:15:49 -0400
Received: by mail-lj1-f180.google.com with SMTP id l20so813068ljj.3
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2019 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wBRvHrB1sSuADoa0wB1VAxTj3qONn3T7tiotpa8FCI8=;
        b=xGfa1zhjG6XNEfsDgVeXDJIs78Xd0lb4c/jBuSeXf9QW5TeWregMrAY+VfvbPnajBv
         eZQylO4o5feJi3SvfXmXiJ5+L5MfFTIaABnEg3lNIEP3V6mBTZpxBWUYdMO6c1X/MhM/
         b8EioLLFM+cqavMjrXhzocgwxfLhqVrpjnv+J3rO82WzSO1dzX4l2v3r2egHF236zG9w
         KGRbhFCjvgMe3bKAtQfIDSGB4XHxo1Ps8ih033f7ijipTCzGYbmquaHRWMYoqmqSLsyP
         gimRIJOdnrSYfFRMmT8lVmTrsOKzUWJkMcvYp2YbruBgBOlWQ1NEeg7vdMDUY6UQZH5g
         S29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wBRvHrB1sSuADoa0wB1VAxTj3qONn3T7tiotpa8FCI8=;
        b=lAKlEIRz2/2oyi8Cbd6FVESqf0eDd1ljFfv80dFh6w0sRKX3TWWfc+Cnm4BWxccFJ2
         VVQMVD6F9/k7NAiJvKXvSg4KX8wFJeY/7xcATKv4xHzKK3m7xldJTpgbDBrbpRyZGL+6
         YaZJjSp8BSHxiJ8/CprdNQNHtkpOdu4Sy0nhMtVBpcD1syGD9vP1SQlzobQyuT3UcScE
         l0SuHdijnQ7IjCkoz5V7xxnI9R/St4GO0v79yK65JHEU84ImPHvNNj5qVZOpfYOkQaKf
         qMdVNAegMfacNLTXxMXIBk1mtNKfkKotQxxehRggH1kUFUwzIcRRipYb8cxCiMCrOkAk
         8sZg==
X-Gm-Message-State: APjAAAXxdsIgF7+e4nBriWE73qcbuiNbTTjYlicHqNVih0JSJA31XXg/
        0WBpTpnmu7jLyFm3hTVvnnEGTA==
X-Google-Smtp-Source: APXvYqyC5M4N9rgqlrCpxseOyTY8Itx0IhiC8u/BKbcTaPVN+QUOXAcYkTKPnscTu1v/HlelrZl4fg==
X-Received: by 2002:a2e:861a:: with SMTP id a26mr19414509lji.171.1567502146995;
        Tue, 03 Sep 2019 02:15:46 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id z72sm665015ljb.98.2019.09.03.02.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 02:15:46 -0700 (PDT)
Date:   Tue, 3 Sep 2019 11:15:45 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
Message-ID: <20190903091545.GF8086@bigcity.dyn.berto.se>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl>
 <e4421a68-e68f-e4b8-8e1d-82ace47ba632@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4421a68-e68f-e4b8-8e1d-82ace47ba632@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for organizing this.

On 2019-09-03 09:21:43 +0200, Hans Verkuil wrote:
> Hi all,
> 
> I've decided to hold the meeting during the ELCE and not on Thursday.
> Two key people can't be there on Thursday and some travel back Thursday
> evening and so would have to leave early.
> 
> Looking at the schedule I propose instead to have one meeting on
> Tuesday morning concentrating on finalizing the codec support.
> 
> On Wednesday we have a second meeting for libcamera (morning) and looking
> at future V4L2 developments such as v4l2_ext_buffer/format, Request API and
> complex camera pipelines (afternoon).
> 
> Laurent, it would make sense if you or one of the other libcamera devs is
> 'chairing' the libcamera meeting. Do you agree? If so, can you prepare an
> agenda for that meeting?
> 
> I plan on leaving Thursday afternoon, so we have the option to continue the
> talks around that last topic on Thursday morning.
> 
> I have no idea where we will hold these meetings since I've no idea
> what the conference center looks like and if they have suitable places
> for doing something like this. So I'll look around on the Monday and
> mail the details of where to meet then.
> 
> Confirmed attendees:
> 
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Helen Koike <helen.koike@collabora.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> If you are not on this list, but want to join, please let me know.

I will be there.

> 
> Since this is really three half-day meetings, each with a different
> topic, please let me know which of those half-day meetings you want
> to attend.
> 
> Regards,
> 
> 	Hans
> 
> On 8/28/19 12:55 PM, Hans Verkuil wrote:
> > On 8/16/19 10:06 AM, Hans Verkuil wrote:
> >> Rather then discussing topics for a meeting under the subject 'Lisbon'
> >> let's start a new thread referring to the right place :-)
> >>
> >> I will try to organize a room, either during the ELCE or (if that doesn't
> >> work) perhaps on the Thursday afterwards. If that's going to be a problem
> >> for someone, please let me know.
> > 
> > I can only get a room for Thursday afternoon (2pm-6pm). I'm inclined to take
> > that room, but if a lot of people who want to come, will already have left
> > on the Thursday, then there is no point in me reserving this room.
> > 
> > So if you are unable to attend on Thursday, then please let me know asap!
> > 
> > If Thursday is no problem, then I wanted to have more informal meetings
> > somewhere in the conference center during the morning, and after lunch
> > use the room.
> > 
> > If Thursday is a no-go, then we will just have to find a place inside
> > the conference center during the ELCE.
> > 
> > Regards,
> > 
> > 	Hans
> > 
> >>
> >> I do need to know how many people I can expect. I have the following
> >> confirmed attendees (and please reply if you are not listed!):
> >>
> >> Alexandre Courbot <acourbot@chromium.org>
> >> Tomasz Figa <tfiga@chromium.org>
> >> Jacopo Mondi <jacopo@jmondi.org>
> >> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Hans Verkuil <hverkuil@xs4all.nl>
> >>
> >> I know there were more who mentioned on irc that they would attend,
> >> but it is easier to keep track if I have it in an email.
> >>
> >> Topics posted under the previous thread:
> >>
> >> Tomasz:
> >>
> >> I would want to discuss various v4l2_buffer improvements, e.g.
> >> - DMA-buf import with plane offsets,
> >> - unifying the buffer structs for M and non-M formats,
> >> - ability to import different FDs with offsets for non-M formats if the
> >> layout matches driver expectations, etc.
> >>
> >> Besides that, I would be interested in the general idea on handling
> >> complex cameras in the Linux kernel in spite of the remaining V4L2
> >> limitations, e.g.
> >> - combinatorial explosion of /dev/video nodes,
> >> - significant ioctl overhead,
> >> - huge amount of historical legacy making the driver and userspace
> >> implementations overly difficult and prone to repetitive mistakes,
> >> - the above also limiting the flexibility of the API - formats, frame
> >> rates, etc. set using distinct APIs, not covered by Request API, with
> >> non-failure "negotiation hell", etc.
> >> - lack of fences, etc.
> >>
> >> Jacopo:
> >>
> >> Apart from discussing libcamera and hope we could kickstart a review of
> >> its API, I would like to re-start discussing multiplexed stream support,
> >> but that would require Sakari to be there, something I'm not certain
> >> about. Sakari?
> >>
> >> Alexandre:
> >>
> >> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> >> codecs, in particular m2m codec helpers and finalize the specification
> >> in general.
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> > 
> 

-- 
Regards,
Niklas S�derlund
