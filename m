Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F69A50BA
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 10:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730153AbfIBICh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 04:02:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58302 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730036AbfIBICT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 04:02:19 -0400
Received: from pendragon.ideasonboard.com (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D2A0303;
        Mon,  2 Sep 2019 10:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567411337;
        bh=9LpLDBZKeRKxbRTdwGzHizcveEKiifXyzbvf6jL+liQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l4oUO988Hlc4uTdtzaHPaZBcV30LXMyIR1ns7Ywb9XZhhkX6dXKaawv+8gDacGTqR
         pX6ZkK0asuMtPvXmXgwPYY3LdyNOirfYSlhJpz6yUaj65XTRlet3PMwl3d40Pom9Yt
         rq3DS4oYOEZlq5VQHWw7i6i2ZUbG4fZRQKf4k5Ug=
Date:   Mon, 2 Sep 2019 11:02:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Message-ID: <20190902080211.GD4777@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
 <20190815065635.GJ6133@paasikivi.fi.intel.com>
 <20190901172414.GB1047@bug>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190901172414.GB1047@bug>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

On Sun, Sep 01, 2019 at 07:24:15PM +0200, Pavel Machek wrote:
> > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > @@ -89,6 +89,10 @@ Optional properties
> > >    but a number of degrees counter clockwise. Typical values are 0 and 180
> > >    (upside down).
> > > 
> > > +- location: The camera device mounting position, relative to the device
> > > +  usage orientation. Possible values are:
> > > +  0 - Front camera. The image sensor is mounted on the front side of the device.
> > > +  1 - Back camera. The image sensor is mounted on the back side of the device.
> > 
> > Would it make sense to make this a little more generic? Such as s/image
> > sensor/ device/, for instance?
> > 
> > Is this also relevant for flash or lens devices?
> > 
> > Flash (torch) devices could be present, at least principle, without a
> > camera. There once was even such a Nokia phone, 1100 unless I'm mistaken.
> > :-)
> 
> Well, I'd call them LEDs, not camera flashes ... if there's no camera. And IIRC 
> these devices had LEDs on top of the phone... so neither front nor back side.

I would go for the name "torch" in that case. It really depends on the
device, but in any case, the torch LEDs would have a location (and we
would possibly need to expand this property to
include the top, bottom, left and right sides).

-- 
Regards,

Laurent Pinchart
