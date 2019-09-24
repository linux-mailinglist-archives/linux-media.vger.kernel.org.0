Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAC9BD555
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 01:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406767AbfIXXHu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 19:07:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40820 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392267AbfIXXHu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 19:07:50 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90A1C30F;
        Wed, 25 Sep 2019 01:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569366467;
        bh=3IeXgoQ0M0HD91YOcZQPauRf9IgH34xy5mYUNJW74xU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=er28n1IW/NmEqm663ht2KelfBnn0FOkfzNIiRe57fSgLHqANwW8Mk9z78Rf5BtoPd
         bIoEHpVoWFyhn+M/v7SQy4j3h3BYX2dC3kV1dXgrd/ejuFemX0BZnxQRriWj25gowV
         LoMxRoxMoGF+aB5953FZNKT16zVwOnG1So3A7oBw=
Date:   Wed, 25 Sep 2019 02:07:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Daniel Gomez <daniel@qtec.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [ANN] Media sessions in Lyon in October: libcamera
Message-ID: <20190924230736.GB14425@pendragon.ideasonboard.com>
References: <07f46758-66e3-5ac1-cc41-807a30f93359@xs4all.nl>
 <7f154b1ce154b75b352945cf05f6359393e9cc3b.camel@ndufresne.ca>
 <cd309f07-16c7-94bc-2de6-e0baa22080ff@ideasonboard.com>
 <20190923155709.GC5056@pendragon.ideasonboard.com>
 <336f155e-9f1c-1df8-2761-8136cf8d201e@linuxfoundation.org>
 <CAH1Ww+TS55RwJZVebvZnHtNXe7ECe7DARDiPtg_f4w+7a7z3FA@mail.gmail.com>
 <55fe5875-2a25-2e14-d976-85716c59977a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55fe5875-2a25-2e14-d976-85716c59977a@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Tue, Sep 24, 2019 at 07:48:55PM -0300, Helen Koike wrote:
> On 9/23/19 3:21 PM, Daniel Gomez wrote:
> > Hi Laurent, Hans:
> > On Mon, 23 Sep 2019 at 20:16, Shuah Khan <skhan@linuxfoundation.org> wrote:
> >>
> >> On 9/23/19 9:57 AM, Laurent Pinchart wrote:
> >>> Hello everybody,
> >>>
> >>> On Mon, Sep 23, 2019 at 04:03:54PM +0100, Kieran Bingham wrote:
> >>>> On 23/09/2019 15:47, Nicolas Dufresne wrote:
> >>>>> Le lundi 23 septembre 2019 à 16:21 +0200, Hans Verkuil a écrit :
> >>>>>> Hi all,
> >>>>>>
> >>>>>> Since we have three separate half-day sessions for different topics I decided
> >>>>>> to split the announcement for this in three emails as well, so these things
> >>>>>> can be discussed in separate threads.
> >>>>>>
> >>>>>> All sessions are in room Terreaux VIP Lounge - Level 0.
> >>>>>> There is a maximum of 15 people.
> >>>>>>
> >>>>>> The second session deals with libcamera and is on Wednesday morning
> >>>>>> from 9:00 to 13:00.
> >>>>>>
> >>>>>> Attendees for this session:
> >>>>>>
> >>>>>> Kieran Bingham <kieran.bingham@ideasonboard.com>
> >>>>
> >>>> Unfortunately I can no longer attend ELCE.
> >>>>
> >>>> (My second baby will be a bit too new for an extended stay away from home)
> >>>>
> >>>>>> Boris Brezillon <boris.brezillon@collabora.com>
> >>>>>> Alexandre Courbot <acourbot@chromium.org>
> >>>>>> Tomasz Figa <tfiga@chromium.org>
> >>>>>> Ezequiel Garcia <ezequiel@collabora.com>
> >>>>>> Daniel Gomez <daniel@qtec.com>
> >>>>>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>>>>> Eugen Hristev <Eugen.Hristev@microchip.com>
> >>>>>> Shuah Khan <skhan@linuxfoundation.org>
> >>>>>> Helen Koike <helen.koike@collabora.com>
> >>>>>> Jacopo Mondi <jacopo@jmondi.org>
> >>>>>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>>> Niklas Söderlund <niklas.soderlund@ragnatech.se>
> >>>>>> Hans Verkuil <hverkuil@xs4all.nl>
> >>>>>>
> >>>>>> If I missed someone, or you are on the list but won't attend after all, then
> >>>>>> please let me know.
> >>>>>
> >>>>> I would like to join this one to, as after ELCE I should have some time
> >>>>> to spend on this. I understand thought hat this would make use reach
> >>>>> the limit, let me know if there is any issues, I can spare my seat if
> >>>>> needed.
> >>>>
> >>>> You now have my seat, and I've just made you a required attendee to go
> >>>> in my place :-D
> >>>
> >>> Thank you for the offer Kieran.
> >>>
> >>> We're reaching the room capacity, and I know of several people who may
> >>> attend ELCE and would be beneficial for the discussions. If anyone in
> >>> the above list only has a general curiosity about libcamera but doesn't
> >>> expect to really contribute to the discussions, and would consider
> >>> giving their seat if required, could you please let me know ?
> >>>
> >
> > I would like to attend if possible since we are going to work with libcamera
> > but not sure how much I can contribute so, no problem to give my seat
> > if necessary.
> 
> Same thing for me. I also would like to attend since I intend to work on libcamera,
> more specifically in the Rockchip support part. But not sure how much I can contribute.

Given the recent offers from multiple people to give away their seat if
needed, I would like to, first of all, thank everybody, and then to
repeat that I will do my best to ensure that as many interested people
as possible will be able to attend. This will partly depend on whether
extending the room capacity will be possible, so I'm afraid the final
answer will need to wait for the beginning of the conference.

> >> Looks like I have a conflict with my talk for the an hour so towards the
> >> end of this morning session. I might as well give up my seat so it can
> >> be given to somebody that can attend the session in full.
> >>
> >> I am attending the afternoon session on Wednesday.

-- 
Regards,

Laurent Pinchart
