Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11CDD8CFD9
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 11:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfHNJkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 05:40:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47496 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfHNJkv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 05:40:51 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FF462B2;
        Wed, 14 Aug 2019 11:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565775650;
        bh=gxmnWXLyNHLwBAGzfyBvuEt1FJyOEDpDyqb0e28If6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vxkf3Y3cVBg6sM9TUGmNZ2G/B9RRK97kxI0Gu3fQBLxXvW+2nTAaiztYTmgSiOdD/
         /t9SltrDuAyDp3yHHhF3lL4W3uAXAMd6fE1+9zHR9STxRW910zBNPw3IQjk+N5U3XJ
         zrhmuabO+RBkEK+PfJO9KaZdhyhiw1VPYnS+R/yg=
Date:   Wed, 14 Aug 2019 12:40:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Media summit in Lisbon at September
Message-ID: <20190814094046.GA5009@pendragon.ideasonboard.com>
References: <20190630134404.7ba170f0@coco.lan>
 <20190801093400.5c351754@coco.lan>
 <20190808095535.1ec92a1d@coco.lan>
 <CAPBb6MUknz7hOpG=hHF59QwvMxJR-=RxWvK2aTPo=97XKqPPQA@mail.gmail.com>
 <e450c395-cc9d-ee5a-c02f-821807c48947@xs4all.nl>
 <CAPBb6MUHX1DUid+6rDaB_yFS8xrPQKmHGnRSa1F_R0YbmNfvXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPBb6MUHX1DUid+6rDaB_yFS8xrPQKmHGnRSa1F_R0YbmNfvXw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 14, 2019 at 05:35:48PM +0900, Alexandre Courbot wrote:
> That could be nice. Of course something more informal is also fine.
> Anyone else planning to attend? I suspect Laurent and people living in
> France might be there?

I will, and so should the whole libcamera team.

> On Mon, Aug 12, 2019 at 4:28 PM Hans Verkuil wrote:
> > On 8/12/19 6:00 AM, Alexandre Courbot wrote:
> > > On Thu, Aug 8, 2019 at 9:55 PM Mauro Carvalho Chehab wrote:
> > >> Em Thu, 1 Aug 2019 09:34:00 -0300 Mauro Carvalho Chehab escreveu:
> > >>> Em Sun, 30 Jun 2019 13:44:04 -0300 Mauro Carvalho Chehab escreveu:
> > >>>
> > >>>> Hi all,
> > >>>>
> > >>>> We are organizing a media mini-summit in Lisbon to happen in September,
> > >>>> at the same week as the Linux Plumber Conference and the Kernel Summit.
> > >>>>
> > >>>> We're still discussing the details about that.
> > >>>
> > >>> Gently reminder.
> > >>>
> > >>> Right now, we have just one extra theme proposal from Sean:
> > >>>
> > >>>       - possible dvb improvements.
> > >>>
> > >>> If we don't have more proposals, we may end skipping the Media
> > >>> Summit this year.
> > >>
> > >> It sounds that we won't have material to have a media summit this year.
> > >> So, let's cancel the media summit this year.
> > >
> > > Loosely related, but are there people planning to go to ELCE on
> > > 10/28-30? Tomasz and I may attend if there is a chance to discuss
> > > libcamera/V4L2 codecs.
> >
> > I'll be there and if there is enough interest in setting up a meeting
> > to discuss this, then I can ask the LF to set a room aside for us for,
> > say, half a day or so.

-- 
Regards,

Laurent Pinchart
