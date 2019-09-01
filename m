Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6477A4AD8
	for <lists+linux-media@lfdr.de>; Sun,  1 Sep 2019 19:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbfIARYS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Sep 2019 13:24:18 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39184 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728570AbfIARYS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Sep 2019 13:24:18 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 86F49815E8; Sun,  1 Sep 2019 19:24:02 +0200 (CEST)
Date:   Sun, 1 Sep 2019 19:24:15 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Message-ID: <20190901172414.GB1047@bug>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
 <20190815065635.GJ6133@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815065635.GJ6133@paasikivi.fi.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -89,6 +89,10 @@ Optional properties
> >    but a number of degrees counter clockwise. Typical values are 0 and 180
> >    (upside down).
> > 
> > +- location: The camera device mounting position, relative to the device
> > +  usage orientation. Possible values are:
> > +  0 - Front camera. The image sensor is mounted on the front side of the device.
> > +  1 - Back camera. The image sensor is mounted on the back side of the device.
> 
> Would it make sense to make this a little more generic? Such as s/image
> sensor/ device/, for instance?
> 
> Is this also relevant for flash or lens devices?
> 
> Flash (torch) devices could be present, at least principle, without a
> camera. There once was even such a Nokia phone, 1100 unless I'm mistaken.
> :-)

Well, I'd call them LEDs, not camera flashes ... if there's no camera. And IIRC 
these devices had LEDs on top of the phone... so neither front nor back side.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
