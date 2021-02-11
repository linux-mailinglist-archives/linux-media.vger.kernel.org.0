Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19721318CD3
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 15:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhBKN7V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 08:59:21 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51654 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbhBKN44 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 08:56:56 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E03A541;
        Thu, 11 Feb 2021 14:55:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613051756;
        bh=teYYPUpBTKJG/hwpTHvlrp6FYATi01gIOZT+tY/o6ts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X/SZoBdYbkudSjrtcFYX/4NBpWqkHvFgcjwqkj0c/Rsr5balCqfa6P3sVRtlHJIV9
         hvf43GRveZ++t3h6m3H9WNlcp260O+RYJ1erfwE9FcpMlq/l3m2hqCyaNaDSwcu2Kd
         YzJ6s83p6/UkRSKd7zhKu7smBthBczzWqzqQ57hA=
Date:   Thu, 11 Feb 2021 15:55:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>, Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: add a new dma_alloc_noncontiguous API v2
Message-ID: <YCU3UuftNEl5Bxpf@pendragon.ideasonboard.com>
References: <20210202095110.1215346-1-hch@lst.de>
 <20210207184855.GA27553@lst.de>
 <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
 <20210209082213.GA31902@lst.de>
 <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
 <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com>
 <20210209170217.GA10199@lst.de>
 <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
 <20210211130625.GA20155@lst.de>
 <CANiDSCupVLQMbJVKrrKBJvJxHgteeVFik7LAJy5zbUi2ESwsGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCupVLQMbJVKrrKBJvJxHgteeVFik7LAJy5zbUi2ESwsGA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Feb 11, 2021 at 02:20:30PM +0100, Ricardo Ribalda wrote:
> On Thu, Feb 11, 2021 at 2:06 PM Christoph Hellwig <hch@lst.de> wrote:
> > On Thu, Feb 11, 2021 at 10:08:18AM +0100, Ricardo Ribalda wrote:
> > > Hi Christoph
> > >
> > > What are your merge plans for the uvc change?
> > > http://git.infradead.org/users/hch/dma-mapping.git/commit/3dc47131f8aacc2093f68a9971d24c754e435520
> > >
> > > Are you going to remove the patch on your Merge request and then send
> > > it for review to Laurent? or merge it through your tree with a S-o-B
> > > him?
> >
> > I though I had all the ACKs to queue it up.  Is that not what was
> > intended?  Queueing up the API without a user is generally a bad idea.
> >
> 
> I am pretty sure we need the ack from Laurent. He maintains uvc
> 
> @Laurent Pinchart what are your thoughts?

I think it would have been nice to CC me on the patch in the first place
:-) I won't have time to review the series before next week at the
earliest.

-- 
Regards,

Laurent Pinchart
