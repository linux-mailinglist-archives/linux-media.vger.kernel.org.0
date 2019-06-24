Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 474AE50AF0
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 14:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfFXMlN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 08:41:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36078 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfFXMlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 08:41:13 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C528323;
        Mon, 24 Jun 2019 14:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561380071;
        bh=gltNgpFQ3C2KfYFZAsmCnWI7kRcbQ1ehljQC5DikTAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gecnw8vSn+zJkk16Ei9Bn+vtWPPsDZHZR08kzKEDhKfPkT39vwP34g0YVgOBFAhk9
         8ZKIY80kLFfe3kIERia9JVmLPshAtlqFH2YOsPwx2dgcB9J1TB43YiZE2TydwvoMZ0
         oiHhlB8/42dyjZGGJ1oT0O+dkFDPuuWU0ePqHsH4=
Date:   Mon, 24 Jun 2019 15:40:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] MAINTAINERS: Add maintainers for Media Controller
Message-ID: <20190624124005.GJ5737@pendragon.ideasonboard.com>
References: <20190620141753.15983-1-sakari.ailus@linux.intel.com>
 <20190620141955.GF5720@pendragon.ideasonboard.com>
 <20190624093012.3a1b5101@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190624093012.3a1b5101@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Mon, Jun 24, 2019 at 09:30:12AM -0300, Mauro Carvalho Chehab wrote:
> Em Thu, 20 Jun 2019 17:19:55 +0300 Laurent Pinchart escreveu:
> > On Thu, Jun 20, 2019 at 05:17:53PM +0300, Sakari Ailus wrote:
> >> When Media Controller was merged to mainline long, long time ago, no-one
> >> bothered to think what its MAINTAINERS entry should be. Now that Media
> >> Controller is moved into its own directory, address this at the same time.
> >> 
> >> So tell people to mail patches to myself and Laurent Pinchart.
> >> 
> >> Note that the patches are still merged through the Media tree, just like
> >> any other driver or framework bits that have separate "mail patches to"
> >> entries different from the main drivers/media one.
> >> 
> >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>  
> > 
> > This will help me catching changes to the media controller, and being
> > more active on reviews, so I welcome that change.
> 
> Ok, but please notice that this is a core part of the subsystem, and
> not a driver one.
> 
> So, you should be sure that you'll have enough bandwidth to not
> get patches accumulated here for no more than a reasonable time
> (a couple of weeks).
> 
> If both you and Sakari are ok with that, I'll pick it.

I think that will be fine, based on the existing development rate for
that code. Of course, if tomorrow 10 developers decide to work full time
on it, I may not be able to follow, but that's hardly specific to MC,
the media subsystem or me.

-- 
Regards,

Laurent Pinchart
