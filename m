Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5484938DEC3
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 03:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhEXBIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 May 2021 21:08:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53700 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbhEXBIp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 May 2021 21:08:45 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A370D476;
        Mon, 24 May 2021 03:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621818436;
        bh=l4n9Uacj5Y7lxDwas1p7vhQnJRghac4mJrw/dLVQAyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DNoDg2Z3N9AnCeU+DAq5YTQfeWrcDR8o0llVn+SCFSUD8FPIJ/CgzKXP3tDQy/hzB
         l75AvYK4swIGU1cdQI0w+DVk+i4n21ECsEGU3yXFZhSpd/Mq/m1HfL/P+9SsA8uGKV
         bOMx9fFha9GaM7QtePhEzDepndIcf3JlO2avNQOI=
Date:   Mon, 24 May 2021 04:07:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <YKr8Qc65KSFBZJ2s@pendragon.ideasonboard.com>
References: <20210517100240.3323-1-david.plowman@raspberrypi.com>
 <20210517100240.3323-3-david.plowman@raspberrypi.com>
 <20210519190121.GJ3@valkosipuli.retiisi.eu>
 <20210519190148.GK3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210519190148.GK3@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, May 19, 2021 at 10:01:49PM +0300, Sakari Ailus wrote:
> Added Laurent to cc.
> 
> On Wed, May 19, 2021 at 10:01:21PM +0300, Sakari Ailus wrote:
> > Hi David,
> > 
> > Thanks for the patch.
> > 
> > Cc'ing Laurent, too.
> > 
> > On Mon, May 17, 2021 at 11:02:40AM +0100, David Plowman wrote:
> > > Add documentation for each of the controls
> > > 
> > > V4L2_CID_NOTIFY_GAIN_RED
> > > V4L2_CID_NOTIFY_GAIN_GREENR
> > > V4L2_CID_NOTIFY_GAIN_BLUE
> > > V4L2_CID_NOTIFY_GAIN_GREENB
> > > 
> > > These controls are required by sensors that need to know what colour
> > > gains will be applied to pixels by downstream processing (such as by
> > > an ISP), though the sensor does not apply these gains itself.
> > > 
> > > Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> > > ---
> > >  .../media/v4l/ext-ctrls-image-source.rst      | 28 +++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > index de43f5c8486d..f824d6c36ae8 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > > @@ -72,3 +72,31 @@ Image Source Control IDs
> > >      * - __u32
> > >        - ``height``
> > >        - Height of the area.
> > > +
> > > +``V4L2_CID_NOTIFY_GAIN_RED (integer)``
> > > +    Notify the sensor what gain will be applied to red pixels by the
> > > +    subsequent processing (such as by an ISP). The sensor is merely
> > > +    informed of this value in case it performs processing that requires
> > > +    it, but it is not applied to the output pixels themselves. The
> > > +    units are determined by the sensor driver.
> > 
> > I wonder if this should say the default value should reflect gain of 1. It
> > probably wouldn't hurt at least.

Seems reasonable to me.

David, do you think we could also document that the values of these
controls are linear, or would that be too restrictive ?

> > > +
> > > +``V4L2_CID_NOTIFY_GAIN_GREENR (integer)``
> > > +    Notify the sensor what gain will be applied to green pixels (on
> > > +    red rows) by subsequent processing (such as by an ISP). The sensor
> > > +    is merely informed of this value in case it performs processing
> > > +    that requires it, but it is not applied to the output pixels
> > > +    themselves. The units are determined by the sensor driver.
> > > +
> > > +``V4L2_CID_NOTIFY_GAIN_BLUE (integer)``
> > > +    Notify the sensor what gain will be applied to blue pixels by the
> > > +    subsequent processing (such as by an ISP). The sensor is merely
> > > +    informed of this value in case it performs processing that requires
> > > +    it, but it is not applied to the output pixels themselves. The
> > > +    units are determined by the sensor driver.
> > > +
> > > +``V4L2_CID_NOTIFY_GAIN_GREENB (integer)``
> > > +    Notify the sensor what gain will be applied to green pixels (on
> > > +    blue rows) by subsequent processing (such as by an ISP). The sensor
> > > +    is merely informed of this value in case it performs processing
> > > +    that requires it, but it is not applied to the output pixels
> > > +    themselves. The units are determined by the sensor driver.

-- 
Regards,

Laurent Pinchart
