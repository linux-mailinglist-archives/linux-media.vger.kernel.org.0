Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A134E8AA3
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 15:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388915AbfJ2OUl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 10:20:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44976 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388595AbfJ2OUk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 10:20:40 -0400
Received: from pendragon.ideasonboard.com (unknown [91.217.168.176])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E41D82BA;
        Tue, 29 Oct 2019 15:20:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572358838;
        bh=uH3Lm48NZZdND2IWIyfVLaAIb3mJZXxKczrBLNDITEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vsTBTaPlZyGLASzNlatAoZHHeYPBp97Mlg8cdTLGSmeruCjCOYqsOus7e8vqcffWo
         S0cNqdv8/4VA4L5ZYXUHHsMhOPs0PC5alnbxaBypk2np2GA/iRifX8qpAeIUufIFxK
         PStc2ddYco3H+FKMEcb7veiS+jrEHOrmHdpQpE8U=
Date:   Tue, 29 Oct 2019 16:20:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [ANN v2] Media sessions in Lyon in October: libcamera
Message-ID: <20191029142029.GC4737@pendragon.ideasonboard.com>
References: <b5b18a86-6137-99a0-0319-d389bac01206@xs4all.nl>
 <CAAEAJfA+ErfDTj87C7rKmo4qSqHL9+uyFEWrWecpCg8RpJ+Cpg@mail.gmail.com>
 <a774d273-fa54-d0b8-1043-48404958ca05@collabora.com>
 <CAH1Ww+S7DoMUbqX5hO_MFpM3i0H=1F8SOTRxoPXLrWf45d6RuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1Ww+S7DoMUbqX5hO_MFpM3i0H=1F8SOTRxoPXLrWf45d6RuA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Oct 28, 2019 at 11:03:05PM +0100, Daniel Gomez wrote:
> On Mon, 21 Oct 2019 at 08:36, Helen Koike <helen.koike@collabora.com> wrote:
> > On 10/20/19 5:13 PM, Ezequiel Garcia wrote:
> >> On Thu, 17 Oct 2019 at 13:16, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>>
> >>> (Just updated the attendee list for this meeting, no other changes)
> >>>
> >>> Hi all,
> >>>
> >>> Since we have three separate half-day sessions for different topics I decided
> >>> to split the announcement for this in three emails as well, so these things
> >>> can be discussed in separate threads.
> >>>
> >>> All sessions are in room Terreaux VIP Lounge - Level 0.
> >>> There is a maximum of 15 people.
> >>>
> >>> The second session deals with libcamera and is on Wednesday morning
> >>> from 9:00 to 13:00.
> >>>
> >>> Attendees for this session:
> >>>
> >>> Nicolas Dufresne <nicolas@ndufresne.ca>
> >>> Tomasz Figa <tfiga@chromium.org>
> >>> Ezequiel Garcia <ezequiel@collabora.com>
> >>> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>
> >> I beliebe Dafna and I should not be on this list, and instead
> >> Helen Koike and Nicolas Dufresne would be attending.
> >
> > Yes, I'm interested in attending the libcamera session.
> >
> >>> Eugen Hristev <Eugen.Hristev@microchip.com>
> >>> Jacopo Mondi <jacopo@jmondi.org>
> >>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Niklas Söderlund <niklas.soderlund@ragnatech.se>
> >>> Dave Stevenson <dave.stevenson@raspberrypi.org>
> >>> Hans Verkuil <hverkuil@xs4all.nl>
> >>>
> >>> That's 10 people.
> >>>
> >>> Planning to use libcamera, but willing to give up their seat if needed:
> >>>
> >>> Daniel Gomez <daniel@qtec.com>
> >>> Helen Koike <helen.koike@collabora.com>
> >>>
> >>> Just interested:
> >>>
> >>> Boris Brezillon <boris.brezillon@collabora.com>
> >>> Alexandre Courbot <acourbot@chromium.org>
> >>>
> >>> If I missed someone, or you are on the list but won't attend after all, then
> >>> please let me know.
> >>>
> >>> Attendees: it is probably useful if you let us know whether you have to
> >>> join this meeting because you plan to use libcamera, or if you are 'just
> >>> interested'. After the libcamera presentation on Tuesday afternoon we
> >>> should know how many of the 'just interested' list can join.
> >>>
> >>> Agenda:
> >>>
> >>> TBD by Laurent.
> 
> I would like to know if there are more people you plan to add to the
> attendee's list.
> If not, I would like to be there.

You're certainly welcome. See you tomorrow :-)

-- 
Regards,

Laurent Pinchart
