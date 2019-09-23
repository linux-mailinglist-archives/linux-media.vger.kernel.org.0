Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 559C8BBBC6
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 20:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731749AbfIWSov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 14:44:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50942 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727542AbfIWSov (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 14:44:51 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8E2F53B;
        Mon, 23 Sep 2019 20:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569264288;
        bh=hJ1+UoFCtzSwC2UIVj0uU3BeZv1f1/7qlUsVnGiWGDg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EO2TN/lkU9m2qZ2hn/t5shffTZ9G7TxA6zYCgx49RJEGcTDSDEc3nWQF4XGs5OcLt
         8wJNGLbmlTpbmpjFqS1Z7kDi9g0SjS3HKrln9r2yDKfd/QCn2eYb/JscA2aUwQHUhv
         Ahr49kEup8DMnPLx3Aft7nVk9+RGBvVW8GvUKT5A=
Date:   Mon, 23 Sep 2019 21:44:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
Message-ID: <20190923184437.GH5056@pendragon.ideasonboard.com>
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
 <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
 <cd309f07-16c7-94bc-2de6-e0baa22080ff@ideasonboard.com>
 <20190923155709.GC5056@pendragon.ideasonboard.com>
 <336f155e-9f1c-1df8-2761-8136cf8d201e@linuxfoundation.org>
 <CAH1Ww+TS55RwJZVebvZnHtNXe7ECe7DARDiPtg_f4w+7a7z3FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1Ww+TS55RwJZVebvZnHtNXe7ECe7DARDiPtg_f4w+7a7z3FA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah and Daniel,

On Mon, Sep 23, 2019 at 08:21:58PM +0200, Daniel Gomez wrote:
> On Mon, 23 Sep 2019 at 20:16, Shuah Khan wrote:
> > On 9/23/19 9:57 AM, Laurent Pinchart wrote:
> >> On Mon, Sep 23, 2019 at 04:03:54PM +0100, Kieran Bingham wrote:
> >>> On 23/09/2019 15:47, Nicolas Dufresne wrote:
> >>>> Le lundi 23 septembre 2019 à 16:21 +0200, Hans Verkuil a écrit :
> >>>>> Hi all,
> >>>>>
> >>>>> Since we have three separate half-day sessions for different topics I decided
> >>>>> to split the announcement for this in three emails as well, so these things
> >>>>> can be discussed in separate threads.
> >>>>>
> >>>>> All sessions are in room Terreaux VIP Lounge - Level 0.
> >>>>> There is a maximum of 15 people.
> >>>>>
> >>>>> The second session deals with libcamera and is on Wednesday morning
> >>>>> from 9:00 to 13:00.
> >>>>>
> >>>>> Attendees for this session:
> >>>>>
> >>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>>
> >>> Unfortunately I can no longer attend ELCE.
> >>>
> >>> (My second baby will be a bit too new for an extended stay away from home)
> >>>
> >>>>> Boris Brezillon <boris.brezillon@collabora.com>
> >>>>> Alexandre Courbot <acourbot@chromium.org>
> >>>>> Tomasz Figa <tfiga@chromium.org>
> >>>>> Ezequiel Garcia <ezequiel@collabora.com>
> >>>>> Daniel Gomez <daniel@qtec.com>
> >>>>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>>>> Eugen Hristev <Eugen.Hristev@microchip.com>
> >>>>> Shuah Khan <skhan@linuxfoundation.org>
> >>>>> Helen Koike <helen.koike@collabora.com>
> >>>>> Jacopo Mondi <jacopo@jmondi.org>
> >>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>> Niklas Söderlund <niklas.soderlund@ragnatech.se>
> >>>>> Hans Verkuil <hverkuil@xs4all.nl>
> >>>>>
> >>>>> If I missed someone, or you are on the list but won't attend after all, then
> >>>>> please let me know.
> >>>>
> >>>> I would like to join this one to, as after ELCE I should have some time
> >>>> to spend on this. I understand thought hat this would make use reach
> >>>> the limit, let me know if there is any issues, I can spare my seat if
> >>>> needed.
> >>>
> >>> You now have my seat, and I've just made you a required attendee to go
> >>> in my place :-D
> >>
> >> Thank you for the offer Kieran.
> >>
> >> We're reaching the room capacity, and I know of several people who may
> >> attend ELCE and would be beneficial for the discussions. If anyone in
> >> the above list only has a general curiosity about libcamera but doesn't
> >> expect to really contribute to the discussions, and would consider
> >> giving their seat if required, could you please let me know ?
>
> I would like to attend if possible since we are going to work with libcamera
> but not sure how much I can contribute so, no problem to give my seat
> if necessary.

Thank you for the offers. My goal is to secure a seat for everybody who
is interested in attending, and I will make sure to let all parties know
of the success (or lack thereof) of that initiative as we get closer to
the event.

> > Looks like I have a conflict with my talk for the an hour so towards the
> > end of this morning session. I might as well give up my seat so it can
> > be given to somebody that can attend the session in full.
> >
> > I am attending the afternoon session on Wednesday.

-- 
Regards,

Laurent Pinchart
