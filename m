Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7880D39CB64
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 00:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhFEWLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 18:11:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49438 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhFEWLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 18:11:43 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E38C8DD;
        Sun,  6 Jun 2021 00:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622930994;
        bh=uqksyTRk5JSFhu6g59/qBO+7A1sgnZJ3iogFrRLlhQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oo+IfvGhIlMw0nnzACZPJZ8rh4PaMaLUa/wnoiMQCN5sV2tVfTGX+FwK0yF2QXLdi
         rEbDlqnTMznl9LqDhCwNYPSlA+NZY3L27avd6kVzFNS4XiOeB2D8lc1xR4wg4OMz3x
         kUP3cHJUK29T2ycEknF5lYzMdn630L3JK9za4TuI=
Date:   Sun, 6 Jun 2021 01:09:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        phone-devel@vger.kernel.org, martijn@brixit.nl,
        linux-media@vger.kernel.org, martin.kepplinger@puri.sm,
        dorota.czaplejewicz@puri.sm
Subject: Re: Recording videos on phones and camera on Librem 5 devboard
Message-ID: <YLv2JM03idf7DZ17@pendragon.ideasonboard.com>
References: <20210512214702.GB27652@duo.ucw.cz>
 <YJz0cn4OrXNhRDoO@bogon.m.sigxcpu.org>
 <694c6d07525eb5f6d5a19a0c94b4f1f280b03973.camel@ndufresne.ca>
 <20210513161929.GD19588@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210513161929.GD19588@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, May 13, 2021 at 06:19:29PM +0200, Pavel Machek wrote:
> Hi!
> 
> > > > Who is the right person to talk about Librem 5 cameras? Is there
> > > > mailing list I should use?
> > > 
> > > I think most of the coordination is mostly happening via the gitlab issues in
> > > 
> > > https://source.puri.sm/Librem5/linux-next
> > > 
> > > Maybe Martin and Dorota who are working on the camera drivers (put in cc:)
> > > have a more suggestions.
> > > 
> > > > 
> > > > AFAICS from bugzillas, it is still not compeletely working. I see
> > > > megapixels packaged in the repository, but without required config
> > > > files. Are there work-in-progress configurations somewhere? Would it
> > > > be useful if I tried to get it to work on the devboard?
> > > 
> > > Megapixels work is mostly happening here atm:
> > > 
> > > https://source.puri.sm/dorota.czaplejewicz/megapixels
> > 
> > While this is interesting work, I would also keep an eye on libcamera, which I
> > believe is a better place for HW specific media controller and request handling.
> > Shouldn't be very hard to port this GTK3 library on top of libcamera.
> > 
> > https://libcamera.org/
> 
> Hmm, famous last words :-).

No humans or animals were terminally injured during libcamera
development :-)

> I view megapixels as hand-optimized camera application tailored to
> phones and taking photos (and it is good at that).
> 
> OTOH Unicsy camera (https://gitlab.com/tui/tui/-/tree/master/cam ) is
> simple python wrapper over GTK+ and gstreamer aimed at videos. (It can
> do photos, too; slowly. Hand-coded app would probably have better
> performance).
> 
> Eventually it would be nice to have media controller support in
> libcamera, gstreamer and probably some other framework I forgot about.

Media controller (and any camera-related kernel API really) support is
exactly what libcamera is about. While it may make sense for gstreamer
to deal directly with kernel devices that require configuration through
the media controller API is some cases, for computational cameras (or
software-defined cameras as they're also called today) it's increasingly
a dead end. GStreamer is good as an application API, or as a framework
wrapped in helpers that offer a simpler, higher-level API, and the
libcamerasrc element can bridge it to the camera implementation.

-- 
Regards,

Laurent Pinchart
