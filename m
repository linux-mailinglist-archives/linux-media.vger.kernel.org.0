Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2393FA5173
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 10:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730338AbfIBITv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 04:19:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58484 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729964AbfIBITv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 04:19:51 -0400
Received: from pendragon.ideasonboard.com (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54748303;
        Mon,  2 Sep 2019 10:19:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567412389;
        bh=5HBvswllGaiODYjSIoZK0GflOekHiZSNfmmM72aXnHo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ddESnutpxySaQ/3OkWOw3E0FVnOw68ZIr0ANYsVmiRXVIziGPIOVS4k0hcZquq8yP
         tcAbH9x6nM6+Tf7h3nu9gNOw0JjmVEcqqIrA6IH2Lp9iEVehsHh3/GILJbqOIeEFQ3
         RHnEDJc/VTN463sjn5hHj4hojUwkb9SHET+w1x28=
Date:   Mon, 2 Sep 2019 11:19:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/5] media: v4l2-ctrl: Document V4L2_CID_LOCATION
Message-ID: <20190902081942.GE4777@pendragon.ideasonboard.com>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-3-jacopo@jmondi.org>
 <20190814224340.GD5015@pendragon.ideasonboard.com>
 <664fe7b3-9051-30da-736e-710a4e9cecde@xs4all.nl>
 <d60e4664-3a3f-1723-6c96-4fc822b6a7bb@xs4all.nl>
 <20190815143423.vaoswb4jvzd2blxp@uno.localdomain>
 <cb36e8a0-b941-ff37-e58c-0f9b7f62116a@xs4all.nl>
 <20190901172457.GC1047@bug>
 <20190902080002.GC4777@pendragon.ideasonboard.com>
 <20190902080657.GC15850@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190902080657.GC15850@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 02, 2019 at 10:06:57AM +0200, Pavel Machek wrote:
> >>> Single integer. It's read-only, so it just reports the location.
> >>> 
> >>> It would be different if this was a writable control: then you need to
> >>> know which locations are possible to set, and that requires a menu type.
> >>> 
> >>> But it doesn't make sense to set the location from software. However, the
> >>> location might change as a result of other changes: e.g. if the camera
> >>> has motor control of the tilt and the tilt changes from forward facing to
> >>> downward facing, then the driver might change the location from FRONT
> >>> to DOWN. A convoluted example perhaps, but this is just brainstorming.
> >> 
> >> There are phones with exactly such camera setup. And yes, it makes
> >> sense to be writable in that case, as software can move the camera in
> >> such case.
> > 
> > Out of curiosity, what phones are those ?
> 
> This one:
> 
> https://www.samsung.com/global/galaxy/galaxy-a80/

Interesting device. I'm not sure we should control that through a
location control though, as it seems there's more than the rotation of
the camera involved. In any case I wouldn't care about it for now, and
turn the location control from read-only to read-write later if needed.
We need more information and more thought to support that use case.

-- 
Regards,

Laurent Pinchart
