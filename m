Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67115A0EBE
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 02:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfH2A4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 20:56:49 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]:42768 "EHLO
        mail-qk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfH2A4t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 20:56:49 -0400
Received: by mail-qk1-f178.google.com with SMTP id f13so1428443qkm.9
        for <linux-media@vger.kernel.org>; Wed, 28 Aug 2019 17:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gobGEkGC/iwvwV7/Ymb9pi8LCsODfmbp0NZfuBfxus4=;
        b=cBGPbUEVYZkxGzN87lJE4RL6SfYJTQvC77PdJSpZXb7N4sHG95mX0LVft7/geOJ8pL
         24ZG8KujSa7nsVW8rApbYTeRGn0DodSA5pkIYvcryLEtnjJIIt2uHuJq0l+Adj3hoEVX
         iZeTRSC1a0JY9+EYchC/FMNkpmN/8q25j4D4HkhUhEnc2DQW3bhZFQCDeM7teZCox+mz
         4w74wDJAwUNKmjjXox0yrPI9iZqkaPDEFLQ3DC+Xu7DhDzGctZi6n/1uHGuQHR/30m2S
         dbzA3UDwu5EKUsG0Wy+/MYJ4bHYwfaLbx3qKSkaf33rQs2NJbzx/NRUCz6vMR7zrIZYE
         O+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gobGEkGC/iwvwV7/Ymb9pi8LCsODfmbp0NZfuBfxus4=;
        b=XBp6IfD7p9O4u3+Xy5LSkCSw/IjYoYDa0R9BNQ2SK6nOkPQdJwYiGNqTryP9WNCKJD
         w591Wpcp+frfQYnyucQkIRFIYQTLX8lZD97TdmFKDF7mLjskx3F3tAmQWddCY83OqqOs
         xjgVey+oOsN/hfhTNudHALyWdM0VMMEfu1YFH1JttbWyaBAK2kWi6GoFkbwG9RC/CLer
         KhbQj9w2B1bOy3izeaNcbZmIF0AkkOmFGGSsRx9/tkDc+Ro57fBe8heLNvbLtB11EjmN
         I1dFlULOKiVGKXxpeIKRUFtxj43ZoXTJC4SMt14atMWgQ6okpZlJzbNxmKkcIvrxruW/
         urgw==
X-Gm-Message-State: APjAAAVTF6HVaaTST3LmX+HeKmCtWFuV+Gc6qPCXatRXl96Q2McGjk0v
        zmrr34Ejv8IrZIQ6BffWfvwKdg==
X-Google-Smtp-Source: APXvYqw0Q2fJ096Rcs/BqfxAa3193ozCfiaXXp45i0Vz+1Uq5YmVhP6JAIdaCzA6Dhx91fdcO1pTTA==
X-Received: by 2002:ae9:ef44:: with SMTP id d65mr5091617qkg.241.1567040207905;
        Wed, 28 Aug 2019 17:56:47 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id t26sm484964qtc.95.2019.08.28.17.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 17:56:46 -0700 (PDT)
Message-ID: <11139d429c58a135c51e7bff35bad0651ee4c674.camel@ndufresne.ca>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 28 Aug 2019 20:56:40 -0400
In-Reply-To: <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
         <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 28 août 2019 à 12:55 +0200, Hans Verkuil a écrit :
> On 8/16/19 10:06 AM, Hans Verkuil wrote:
> > Rather then discussing topics for a meeting under the subject 'Lisbon'
> > let's start a new thread referring to the right place :-)
> > 
> > I will try to organize a room, either during the ELCE or (if that doesn't
> > work) perhaps on the Thursday afterwards. If that's going to be a problem
> > for someone, please let me know.
> 
> I can only get a room for Thursday afternoon (2pm-6pm). I'm inclined to take
> that room, but if a lot of people who want to come, will already have left
> on the Thursday, then there is no point in me reserving this room.
> 
> So if you are unable to attend on Thursday, then please let me know asap!
> 
> If Thursday is no problem, then I wanted to have more informal meetings
> somewhere in the conference center during the morning, and after lunch
> use the room.
> 
> If Thursday is a no-go, then we will just have to find a place inside
> the conference center during the ELCE.

For me it is not possible on Thursday, since it's day one of GStreamer
Conference. The conference ends at 17h and is 6km away from ELCE venue.

> 
> Regards,
> 
> 	Hans
> 
> > I do need to know how many people I can expect. I have the following
> > confirmed attendees (and please reply if you are not listed!):
> > 
> > Alexandre Courbot <acourbot@chromium.org>
> > Tomasz Figa <tfiga@chromium.org>
> > Jacopo Mondi <jacopo@jmondi.org>
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Hans Verkuil <hverkuil@xs4all.nl>
> > 
> > I know there were more who mentioned on irc that they would attend,
> > but it is easier to keep track if I have it in an email.
> > 
> > Topics posted under the previous thread:
> > 
> > Tomasz:
> > 
> > I would want to discuss various v4l2_buffer improvements, e.g.
> > - DMA-buf import with plane offsets,
> > - unifying the buffer structs for M and non-M formats,
> > - ability to import different FDs with offsets for non-M formats if the
> > layout matches driver expectations, etc.
> > 
> > Besides that, I would be interested in the general idea on handling
> > complex cameras in the Linux kernel in spite of the remaining V4L2
> > limitations, e.g.
> > - combinatorial explosion of /dev/video nodes,
> > - significant ioctl overhead,
> > - huge amount of historical legacy making the driver and userspace
> > implementations overly difficult and prone to repetitive mistakes,
> > - the above also limiting the flexibility of the API - formats, frame
> > rates, etc. set using distinct APIs, not covered by Request API, with
> > non-failure "negotiation hell", etc.
> > - lack of fences, etc.
> > 
> > Jacopo:
> > 
> > Apart from discussing libcamera and hope we could kickstart a review of
> > its API, I would like to re-start discussing multiplexed stream support,
> > but that would require Sakari to be there, something I'm not certain
> > about. Sakari?
> > 
> > Alexandre:
> > 
> > If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> > codecs, in particular m2m codec helpers and finalize the specification
> > in general.
> > 
> > Regards,
> > 
> > 	Hans
> > 

