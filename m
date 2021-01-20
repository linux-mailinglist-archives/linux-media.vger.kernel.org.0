Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607192FD6D3
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 18:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732264AbhATPiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 10:38:55 -0500
Received: from mga18.intel.com ([134.134.136.126]:47532 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732005AbhATPhX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 10:37:23 -0500
IronPort-SDR: XANggYIgo3iLCPUw4n4P6JCrm/QZqlF9THdegIzAQBxfZwXK1ZQphrqYGTkeFTJw50sP4v83aa
 YxV3VEA73ZWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="166787378"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="166787378"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 07:35:25 -0800
IronPort-SDR: kqusGp0UM6BgtkGAy08PFQG0KblX/AjeowN0nTgO1yotSaTofI1cl4Y6TDdeUA0IMORG1HkdVH
 NqcIpw7huuig==
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="402774940"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 07:35:24 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2A768206D0; Wed, 20 Jan 2021 17:35:22 +0200 (EET)
Date:   Wed, 20 Jan 2021 17:35:22 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-async: Safely unregister an non-registered
 async subdev
Message-ID: <20210120153522.GM11878@paasikivi.fi.intel.com>
References: <20210107225458.4485-1-laurent.pinchart@ideasonboard.com>
 <ec851753-b344-ea01-0551-7fb9ffa477bb@ideasonboard.com>
 <20210120133716.GK11878@paasikivi.fi.intel.com>
 <9eee9dbf-a30b-cd5e-aa7f-dda2b2d10229@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eee9dbf-a30b-cd5e-aa7f-dda2b2d10229@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 20, 2021 at 02:02:00PM +0000, Kieran Bingham wrote:
> On 20/01/2021 13:37, Sakari Ailus wrote:
> > Hi Kieran,
> > 
> > On Wed, Jan 20, 2021 at 11:14:39AM +0000, Kieran Bingham wrote:
> >> Hi Laurent,
> >>
> >> On 07/01/2021 22:54, Laurent Pinchart wrote:
> >>> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>>
> >>> Make the V4L2 async framework a bit more robust by allowing to
> >>> unregister a non-registered async subdev. Otherwise the
> >>> v4l2_async_cleanup() will attempt to delete the async subdev from the
> >>> subdev_list with the corresponding list_head not initialized.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
> >>>  drivers/media/v4l2-core/v4l2-async.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> >>> index 8bde33c21ce4..fc4525c4a75f 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-async.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-async.c
> >>> @@ -750,6 +750,9 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
> >>>  
> >>>  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> >>>  {
> >>> +	if (!sd->async_list.next)
> >>> +		return;
> >>
> >> This is a bit opaque for anyone reading the code alone.
> >>
> >> It could easily read as:
> >>
> >> "If we don't have a following item in the async list - then don't
> >> unregister?", which seems a bit nonsensical.
> >>
> >> Hopefully that would make someone question what it's actually checking
> >> but still.
> >>
> >> I think I've seen you reference this pattern a couple of times so
> >> perhaps having a way to check if a list is initialised would be worth
> >> having as a helper in the list.
> >>
> >> Otherwise, at least a comment to say that we're using the initialisation
> >> of the list to determine if the async subdevice is already registered or
> >> not. (perhaps a bit more briefly ;D)
> >>
> >>
> >> Anyway, with that all in mind - I always like being able to simplify
> >> error and clean up paths, so
> >>
> >> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Thanks.
> > 
> > I think the patch is good as-is but I wouldn't mind to see such a list
> > helper either. V4L2-async could later on use it.
> 
> Yes, I don't think a list-helper is 'required' for this patch (though a
> comment would be nice otherwise as described above).
> 
> Checking an internal object's list's next pointer to determine if the
> object is already registered is quite opaque. That was my only concern.

I also have to say I don't like poking list internal data structures. There
are just no other struct members that could tell the same bit of
information, and as we do have the list, there's no reason to add a new
field for the purpose either.

Who would like to submit the patch to add a function telling whether a list
is initialised? :-)

-- 
Sakari Ailus
