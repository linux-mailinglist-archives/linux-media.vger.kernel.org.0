Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 105708EC09
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 14:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731893AbfHOMzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 08:55:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45204 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731243AbfHOMzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 08:55:32 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 025022AF;
        Thu, 15 Aug 2019 14:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565873730;
        bh=OcYASANIQKPbGrqus/I7QsrdQiBoQf+UunuHAYVyWcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cbHOH+DVwEERox3QJEaAsfXplF+NNZ7+R8sWXLhDKsge/A7Epp/bDEJrjHrx1D/1E
         XOmPDUpEkKwiPe/zYgQj4Z5NCR6Bwi5IXWhKV2F7D7xMeOyj7/xmSsZvIJKrn13j3a
         fIMg5UTDXF6ejT+I99fAPvny3THOmwbdlBmgFXNM=
Date:   Thu, 15 Aug 2019 15:55:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 1/5] media: dt-bindings: Document 'location' property
Message-ID: <20190815125526.GG13823@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-2-jacopo@jmondi.org>
 <20190815065635.GJ6133@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190815065635.GJ6133@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Aug 15, 2019 at 09:56:35AM +0300, Sakari Ailus wrote:
> On Wed, Aug 14, 2019 at 10:28:11PM +0200, Jacopo Mondi wrote:
> > Add the 'location' device property, used to specify the camera device
> > mounting position. The property is particularly meaningful for mobile
> > devices with a well defined usage orientation.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index f884ada0bffc..819077b2649c 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
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

I certainly hope that the flash or lens will be located on the same side
as the sensor... :-) It could however make sense to extend usage of this
property yet. I'm not sure I would do so already though, unless you
think all flash and lens controllers should really use it.

> Flash (torch) devices could be present, at least principle, without a
> camera. There once was even such a Nokia phone, 1100 unless I'm mistaken.
> :-)

-- 
Regards,

Laurent Pinchart
