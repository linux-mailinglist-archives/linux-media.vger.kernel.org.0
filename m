Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD5C7BFB48
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 14:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbjJJMYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 08:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjJJMYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 08:24:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88A899
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696940683; x=1728476683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WhZ7VHQFKnFkLgJOnxHmbOHpTOB5X3Tbn6tjcJOGJBM=;
  b=XX8yZZYz75g5xKbvbdSN6yQVQIG6waoMzCgXMtLK7KYoO1poREBVsz7k
   6hDwJWb8Ht2Ua2+55U9D8kqxr58p96V4tHn6gQoGN5/0d+9uBp4CN/Hzb
   t8cJdwiA+Lw+b/dbs17Ele4416pN8cMn7gYDzd90QadoxoxOe2Tz46l/p
   CGOQUHDz47nMgGxJVWB7ZBwHVeLTYn0sQUmTt+9bc+cxOIrbp6nT7gjGc
   e/LqpGe6iPJNqcNWsRgCxCGqd+9HdpxrRnbHEIDp4nLRWEcAmjInk+5bJ
   XlkxBtfSMxz0QDiLx/mTN9G0UrgHoTm2STFhpFUkcY1RiPttGeZTMidxK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="369443985"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="369443985"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="844110630"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="844110630"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:24:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 5E69B11F835;
        Tue, 10 Oct 2023 15:24:38 +0300 (EEST)
Date:   Tue, 10 Oct 2023 12:24:38 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Dennis Bonke <admin@dennisbonke.com>,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH] media: subdev: Don't report V4L2_SUBDEV_CAP_STREAMS when
 the streams API is disabled
Message-ID: <ZSVChht/IK+XA0dp@kekkonen.localdomain>
References: <20231010102458.111227-1-hdegoede@redhat.com>
 <ZSU6ZFKS5QkFJgZw@kekkonen.localdomain>
 <c9157c41-a890-4542-bdad-9e193dcbb833@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9157c41-a890-4542-bdad-9e193dcbb833@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Oct 10, 2023 at 01:52:21PM +0200, Hans Verkuil wrote:
> On 10/10/23 13:49, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Oct 10, 2023 at 12:24:58PM +0200, Hans de Goede wrote:
> >> Since the stream API is still experimental it is currently locked away
> >> behind the internal, default disabled, v4l2_subdev_enable_streams_api flag.
> >>
> >> Advertising V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
> >> confuses userspace. E.g. it causes the following libcamera error:
> >>
> >> ERROR SimplePipeline simple.cpp:1497 Failed to reset routes for
> >>   /dev/v4l-subdev1: Inappropriate ioctl for device
> >>
> >> Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
> >> to avoid problems like this.
> >>
> >> Reported-by: Dennis Bonke <admin@dennisbonke.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >> -Clearing the V4L2_SUBDEV_FL_STREAMS flag from sd.flags might seem
> >>  appealing as an alternative fix. But this causes various v4l2-core bits
> >>  to enter different code paths which confuses drivers which set
> >>  V4L2_SUBDEV_FL_STREAMS, so this is a bad idea.
> > 
> > Thanks, this apparently had been missed while disabling the API.
> > 
> > Probably also should be added:
> > 
> > Fixes: 9a6b5bf4c1bb ("media: add V4L2_SUBDEV_CAP_STREAMS")
> > Cc: stable@vger.kernel.org # for >= 6.3
> > 
> > Also cc'd Tomi.
> 
> Should this be queued up as a 6.6 fix?

I wonder what the criteria is these days.

I'd think it's unlikely anything is or will be broken by this in practice.
The further this exists, though, increases the likelihood for that to
happen.

-- 
Regards,

Sakari Ailus
