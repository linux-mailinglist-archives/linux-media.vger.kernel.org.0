Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1E72FD307
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 15:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbhATOOs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 09:14:48 -0500
Received: from mga01.intel.com ([192.55.52.88]:2857 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390074AbhATNjH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:39:07 -0500
IronPort-SDR: YeNGUsJdzkiTmAsEr+/wpkDuYG82sVSL/pCFIH4OWbqwKTy/q9TcHSFDkCYdS6fzKkByu6BWvD
 DR3jwG0H8oVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="197830621"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="197830621"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 05:37:20 -0800
IronPort-SDR: 6iCIvZlhKAaus0xQHmBrMtwMWH5y3UOO3YLDn2ogriWgP7oQ5MBNU6JXvTgfmvycgpCiPH3cA/
 2y09oM0n0hdQ==
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="391554723"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 05:37:19 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E8B3E206D0; Wed, 20 Jan 2021 15:37:16 +0200 (EET)
Date:   Wed, 20 Jan 2021 15:37:16 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-async: Safely unregister an non-registered
 async subdev
Message-ID: <20210120133716.GK11878@paasikivi.fi.intel.com>
References: <20210107225458.4485-1-laurent.pinchart@ideasonboard.com>
 <ec851753-b344-ea01-0551-7fb9ffa477bb@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec851753-b344-ea01-0551-7fb9ffa477bb@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Jan 20, 2021 at 11:14:39AM +0000, Kieran Bingham wrote:
> Hi Laurent,
> 
> On 07/01/2021 22:54, Laurent Pinchart wrote:
> > From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Make the V4L2 async framework a bit more robust by allowing to
> > unregister a non-registered async subdev. Otherwise the
> > v4l2_async_cleanup() will attempt to delete the async subdev from the
> > subdev_list with the corresponding list_head not initialized.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index 8bde33c21ce4..fc4525c4a75f 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -750,6 +750,9 @@ EXPORT_SYMBOL(v4l2_async_register_subdev);
> >  
> >  void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> >  {
> > +	if (!sd->async_list.next)
> > +		return;
> 
> This is a bit opaque for anyone reading the code alone.
> 
> It could easily read as:
> 
> "If we don't have a following item in the async list - then don't
> unregister?", which seems a bit nonsensical.
> 
> Hopefully that would make someone question what it's actually checking
> but still.
> 
> I think I've seen you reference this pattern a couple of times so
> perhaps having a way to check if a list is initialised would be worth
> having as a helper in the list.
> 
> Otherwise, at least a comment to say that we're using the initialisation
> of the list to determine if the async subdevice is already registered or
> not. (perhaps a bit more briefly ;D)
> 
> 
> Anyway, with that all in mind - I always like being able to simplify
> error and clean up paths, so
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks.

I think the patch is good as-is but I wouldn't mind to see such a list
helper either. V4L2-async could later on use it.

-- 
Regards,

Sakari Ailus
