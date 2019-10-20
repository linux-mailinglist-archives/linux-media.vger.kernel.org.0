Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62C89DDE30
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2019 13:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfJTLKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Oct 2019 07:10:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50824 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfJTLKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Oct 2019 07:10:21 -0400
Received: from pendragon.ideasonboard.com (unknown [213.174.99.132])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAEF9A2C;
        Sun, 20 Oct 2019 13:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571569818;
        bh=AD41gTVGmDqI9a0Obd0HriR17Xf3fqIMJ+jLqQYvTyA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rw+Ne5KugiZTgQvPVifbjklm4nASKpcViHK++dbIa1U5NmzQQRBl02RzvGPmsQjMg
         UmLs/MczgYpG9RUBy4Q/MAkD+YvypXY21hXoR3Grni0/5R9JTM36uXzHIF4IKLt3Hv
         iyKQ0s2Ua33f9u4oftO6gnGhmgfYw5B+yfXqmaIg=
Date:   Sun, 20 Oct 2019 14:10:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [ANN v2] Media sessions in Lyon in October: libcamera
Message-ID: <20191020111014.GA11723@pendragon.ideasonboard.com>
References: <b5b18a86-6137-99a0-0319-d389bac01206@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5b18a86-6137-99a0-0319-d389bac01206@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for handling the announcement.

On Thu, Oct 17, 2019 at 01:16:20PM +0200, Hans Verkuil wrote:
> (Just updated the attendee list for this meeting, no other changes)
> 
> Hi all,
> 
> Since we have three separate half-day sessions for different topics I decided
> to split the announcement for this in three emails as well, so these things
> can be discussed in separate threads.
> 
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
> 
> The second session deals with libcamera and is on Wednesday morning
> from 9:00 to 13:00.
> 
> Attendees for this session:
> 
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Jacopo Mondi <jacopo@jmondi.org>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Niklas Söderlund <niklas.soderlund@ragnatech.se>
> Dave Stevenson <dave.stevenson@raspberrypi.org>
> Hans Verkuil <hverkuil@xs4all.nl>
> 
> That's 10 people.
> 
> Planning to use libcamera, but willing to give up their seat if needed:
> 
> Daniel Gomez <daniel@qtec.com>
> Helen Koike <helen.koike@collabora.com>
> 
> Just interested:
> 
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> 
> If I missed someone, or you are on the list but won't attend after all, then
> please let me know.
> 
> Attendees: it is probably useful if you let us know whether you have to
> join this meeting because you plan to use libcamera, or if you are 'just
> interested'. After the libcamera presentation on Tuesday afternoon we
> should know how many of the 'just interested' list can join.
> 
> Agenda:
> 
> TBD by Laurent.

The two main items we would like to discuss are:

API review
----------

Following Jacopo's talk on Tuesday that will kickstart the public API
review, we would like to receive feedback from all attendees on the
libcamera APIs. This includes the public API towards applications and
the API toward the Image Processing Algorithms (IPA, also known as 3A).
The internal APIs between libcamera components and helpers, as well as
the Android camera HAL implementation, can also be discussed given
interest from the audience if time permits.

The libcamera API is documented in the source code using doxygen. A
nightly build of the documentation can be found at
https://www.libcamera.org/api-html/. Please note that the built
documentation covers all libcamera classes, making it a bit difficult to
tell the public API apart from the internal APIs. We will try to address
this problem this week.

Use cases sharing
-----------------

The libcamera project aims at supporting a wide range of use cases, even
if we need to limit the scope of the first release. Our experience with
camera support in Linux systems give us a good but still restricted view
of the uses, and we would like to discuss additional use cases with the
audience. If you have camera-related needs, from simple to crazy, we
want to hear about them.


Please all feel free to propose other topics that you would find of
interest. We will finalise the agenda this week.

-- 
Regards,

Laurent Pinchart
