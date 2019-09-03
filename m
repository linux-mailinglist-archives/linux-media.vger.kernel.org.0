Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 157CEA6573
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 11:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbfICJfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 05:35:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51226 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfICJfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 05:35:51 -0400
Received: from pendragon.ideasonboard.com (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1789D542;
        Tue,  3 Sep 2019 11:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567503349;
        bh=7akX/fzTOQuDI6aK14kWheScJMfY3tBPVpx3kTcu7/Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q6B48hkY92aL0xb1K9cZrdJd6zmEAS9Ic0G4ugET27XUXN27STpXkn13lTmrtv/gd
         erGtf296Tjg/jhkrduH1Fzx+PJ2yaMLRfnQGU1jf7pKR0PJE0G7igGmx+Im+axpSPb
         vearqvBGTZop6qLEUPa+IWF4N4sb10dyD2/rBeVY=
Date:   Tue, 3 Sep 2019 12:35:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
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
Message-ID: <20190903093543.GB4779@pendragon.ideasonboard.com>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl>
 <e4421a68-e68f-e4b8-8e1d-82ace47ba632@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e4421a68-e68f-e4b8-8e1d-82ace47ba632@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Sep 03, 2019 at 09:21:43AM +0200, Hans Verkuil wrote:
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
> 
> Since this is really three half-day meetings, each with a different
> topic, please let me know which of those half-day meetings you want
> to attend.

The schedule looks good to me. I may skip the codec part, but will be
there on Wednesday.

On the libcamera side, I was wondering if we should announce the meeting
beforehand (possibly on the libcamera-devel mailing list and/or during
Jacopo's talk on Tuesday afternoon). We don't have a room secured, right
? Did the LF say they have no room available during the conference ?

-- 
Regards,

Laurent Pinchart
