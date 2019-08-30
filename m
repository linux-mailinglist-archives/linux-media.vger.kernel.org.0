Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D723A31A4
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 09:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbfH3HyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 03:54:05 -0400
Received: from mail-ed1-f41.google.com ([209.85.208.41]:44929 "EHLO
        mail-ed1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727417AbfH3HyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 03:54:05 -0400
Received: by mail-ed1-f41.google.com with SMTP id a21so6938959edt.11
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rVKrV2u7Thb8iFKr9dvRhjS7h11FjZztLbIwGqxmSFU=;
        b=kc2lLO40yHPvMOl1/DBa9a7TBVjclRMnPxsPQI4JGilz3EjCt0d6Y8cNdxeim3j4Pg
         MnB8CE1HgbKAwTb602xQD1dA9qLXiILrp8YLRInQxKbha74otVzeNO+430RM1s+tyfR/
         79mgUCRvB3SLBkRnhL/aTF4BiAO7dYJLT7YOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVKrV2u7Thb8iFKr9dvRhjS7h11FjZztLbIwGqxmSFU=;
        b=oaZZSDfndDcuDEVk84yC/OQFOQpyr5QSOUBQ5+4EM+6dOkSQW9WY2XTo4u83c7/sJF
         Rlu3k+qZRass06xPx5gIrUtnhPllx/g2lMPm3v4kS6Oik7SSojqd+k4DRGnTaLQz7Eet
         6BWS4eIHI+kZaDkeMRkAXPUxRO64AU2jlt7INl6AV3EQqm9z4P6bxl8xmfU6STzPtaw/
         pa2a+3Zj01s/XDtZ41y9qHO5mZdA0OQhaDX3bcaCMqiFVshn84CD3qBGxj74Nq3LdFZe
         33e27zZXkrtC38SuAco978f2GC1qtXAeHvmUQ42UdaBa9cYmXDOzWDJ/SeBY8dqnviDs
         wsAQ==
X-Gm-Message-State: APjAAAVys4VOjYbjdkRxmcoz3tS7UEPu36pBRzsQYnaElf9dYRLHTcdL
        U53ZszWS0Xa+cY7PsWy5ywQGjGymhiU=
X-Google-Smtp-Source: APXvYqxN1gOOuPVzTd1us55ini2/WhJwBYY0QJQC/myv/gxlGZOH8oTahVVe8kOrggaEORRvYXw4FQ==
X-Received: by 2002:aa7:df03:: with SMTP id c3mr14082744edy.112.1567151643021;
        Fri, 30 Aug 2019 00:54:03 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id s4sm693677ejq.72.2019.08.30.00.54.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2019 00:54:02 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id b16so5934036wrq.9
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2019 00:54:01 -0700 (PDT)
X-Received: by 2002:a05:6000:1082:: with SMTP id y2mr6486774wrw.77.1567151641421;
 Fri, 30 Aug 2019 00:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl> <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl>
In-Reply-To: <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 30 Aug 2019 16:53:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CrwTnDmzURJH_Uu3T8YpytUorcN1sz9+aJME5=k8__1Q@mail.gmail.com>
Message-ID: <CAAFQd5CrwTnDmzURJH_Uu3T8YpytUorcN1sz9+aJME5=k8__1Q@mail.gmail.com>
Subject: Re: [ANN] Topics for a media summit in Lyon in October
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 28, 2019 at 7:55 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
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

Thanks for organizing this!

I'm okay with Thursday, but would prefer a day during the conference.

Best regards,
Tomasz

>
> Regards,
>
>         Hans
>
> >
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
> >       Hans
> >
>
