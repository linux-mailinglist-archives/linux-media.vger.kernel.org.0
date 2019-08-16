Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE48A8FCC3
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 09:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfHPHvl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 03:51:41 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46480 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfHPHvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 03:51:41 -0400
Received: by mail-io1-f66.google.com with SMTP id x4so4468924iog.13
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 00:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AWgceAvU6POjiOexl1Btp+T4QifjJXxzgRXLkaW+bVs=;
        b=G8+4hKQ75lC0CXgqqbpZQfmUwSOyinUDPP/RVMBARh+9t4H+Lg6zKiDc3SRFkaHTAC
         dKYNUcQ+qd3Wrg4rhbAKAk7Hz6f+cM1q6pYkrMrh0hU1sQ1FY9nWi6f4oiBTJ6qpWPv0
         NCPOHLwgKinDRHDVshelIAjweOIlUujqOi3e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AWgceAvU6POjiOexl1Btp+T4QifjJXxzgRXLkaW+bVs=;
        b=b/2btFpdCPWK0ZW4B7lOpLsfJmHTaPCAkZhdQkJdp0GItucoI5i12E4CY+2uA1eGiO
         7eEs7h2qubtAWU5xfQNvEzT/wWlQ43kk0HmvgmtI4c7ypHl2nDjg25YYeQkwc4wH2VYc
         O+W3k7e7eGcgz7uRBZpA0HWZv1OY8zVQXr3B9+qm03+wa4F8yIaUuDs2lF/mcHexyUsF
         ELqOMJM83djc9QCpBeZueIMMCvxGhKaZpGVX1HBDkJPEpxfmqGjeaS36hszajVC3MT3F
         m2b8HKOJ/q9wT75meq9AQJ7JLQeai9DDEH8GTBezlMey01gdLhpcXmUHSvNb/mFsxhiI
         waVg==
X-Gm-Message-State: APjAAAVRoSoQ2asaJBfbjQ07tghVVbzEjvtBNVBnNnFKnYYNp3ZghqNv
        bR7SsNbBzyg5oG6wRX9ihe76ApZ1EXJMTw==
X-Google-Smtp-Source: APXvYqxnuevZOcCsZPp649jEH1O92fe37tR/7efkTb5SxDzJQBhTqexulsyn7OaErBl7oHN4asizqQ==
X-Received: by 2002:a05:6638:25a:: with SMTP id w26mr9351416jaq.133.1565941899829;
        Fri, 16 Aug 2019 00:51:39 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id e22sm3848333iog.2.2019.08.16.00.51.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2019 00:51:38 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id q22so4476577iog.4
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2019 00:51:38 -0700 (PDT)
X-Received: by 2002:a5d:8f8a:: with SMTP id l10mr9457560iol.306.1565941898165;
 Fri, 16 Aug 2019 00:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190630134404.7ba170f0@coco.lan> <20190801093400.5c351754@coco.lan>
 <20190808095535.1ec92a1d@coco.lan> <CAPBb6MUknz7hOpG=hHF59QwvMxJR-=RxWvK2aTPo=97XKqPPQA@mail.gmail.com>
 <e450c395-cc9d-ee5a-c02f-821807c48947@xs4all.nl> <CAPBb6MUHX1DUid+6rDaB_yFS8xrPQKmHGnRSa1F_R0YbmNfvXw@mail.gmail.com>
 <20190814094046.GA5009@pendragon.ideasonboard.com> <CAPBb6MVUrVshUZ6OWEkadVS7oS4q4uWw7ZbxcurVWZ50aGSckg@mail.gmail.com>
 <20190816073109.ydqzndocuetqdajh@uno.localdomain>
In-Reply-To: <20190816073109.ydqzndocuetqdajh@uno.localdomain>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 16 Aug 2019 16:51:25 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DFkL60FJ4s0RZqQZNcz-ZwNr0ULi1w3ywF4hpzHyC-xA@mail.gmail.com>
Message-ID: <CAAFQd5DFkL60FJ4s0RZqQZNcz-ZwNr0ULi1w3ywF4hpzHyC-xA@mail.gmail.com>
Subject: Re: [ANN] Media summit in Lisbon at September
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 16, 2019 at 4:29 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Alexandre,
>
> On Fri, Aug 16, 2019 at 02:52:13PM +0900, Alexandre Courbot wrote:
> > On Wed, Aug 14, 2019 at 6:40 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Wed, Aug 14, 2019 at 05:35:48PM +0900, Alexandre Courbot wrote:
> > > > That could be nice. Of course something more informal is also fine.
> > > > Anyone else planning to attend? I suspect Laurent and people living in
> > > > France might be there?
> > >
> > > I will, and so should the whole libcamera team.
> >
> > It seems to be confirmed that Tomasz and I will be attending. Maybe we
> > can come with a list of topics to discuss for all people present?
> >
>
> Apart from discussing libcamera and hope we could kickstart a review of
> its API, I would like to re-start discussing multiplexed stream support,
> but that would require Sakari to be there, something I'm not certain
> about. Sakari?

I would want to discuss various v4l2_buffer improvements, e.g.
- DMA-buf import with plane offsets,
- unifying the buffer structs for M and non-M formats,
- ability to import different FDs with offets for non-M formats if the
layout matches driver expectations, etc.

Besides that, I would be interested in the general idea on handling
complex cameras in the Linux kernel in spite of the remaining V4L2
limitations, e.g.
- combinatorial explosion of /dev/video nodes,
- significant ioctl overhead,
- huge amount of historical legacy making the driver and userspace
implementations overly difficult and prone to repetitive mistakes,
- the above also limiting the flexibility of the API - formats, frame
rates, etc. set using distinct APIs, not covered by Request API, with
non-failure "negotiation hell", etc.
- lack of fences, etc.

Best regards,
Tomasz

>
> Thanks
>    j
>
> > If Collabora/Bootlin is there, I'd certainly want to discuss stateless
> > codecs, in particular m2m codec helpers and finalize the specification
> > in general.
> >
>
>
> > >
> > > > On Mon, Aug 12, 2019 at 4:28 PM Hans Verkuil wrote:
> > > > > On 8/12/19 6:00 AM, Alexandre Courbot wrote:
> > > > > > On Thu, Aug 8, 2019 at 9:55 PM Mauro Carvalho Chehab wrote:
> > > > > >> Em Thu, 1 Aug 2019 09:34:00 -0300 Mauro Carvalho Chehab escreveu:
> > > > > >>> Em Sun, 30 Jun 2019 13:44:04 -0300 Mauro Carvalho Chehab escreveu:
> > > > > >>>
> > > > > >>>> Hi all,
> > > > > >>>>
> > > > > >>>> We are organizing a media mini-summit in Lisbon to happen in September,
> > > > > >>>> at the same week as the Linux Plumber Conference and the Kernel Summit.
> > > > > >>>>
> > > > > >>>> We're still discussing the details about that.
> > > > > >>>
> > > > > >>> Gently reminder.
> > > > > >>>
> > > > > >>> Right now, we have just one extra theme proposal from Sean:
> > > > > >>>
> > > > > >>>       - possible dvb improvements.
> > > > > >>>
> > > > > >>> If we don't have more proposals, we may end skipping the Media
> > > > > >>> Summit this year.
> > > > > >>
> > > > > >> It sounds that we won't have material to have a media summit this year.
> > > > > >> So, let's cancel the media summit this year.
> > > > > >
> > > > > > Loosely related, but are there people planning to go to ELCE on
> > > > > > 10/28-30? Tomasz and I may attend if there is a chance to discuss
> > > > > > libcamera/V4L2 codecs.
> > > > >
> > > > > I'll be there and if there is enough interest in setting up a meeting
> > > > > to discuss this, then I can ask the LF to set a room aside for us for,
> > > > > say, half a day or so.
> > >
> > > --
> > > Regards,
> > >
> > > Laurent Pinchart
