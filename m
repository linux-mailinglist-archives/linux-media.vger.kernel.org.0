Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD4C6C4567
	for <lists+linux-media@lfdr.de>; Wed, 22 Mar 2023 09:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjCVIww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Mar 2023 04:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCVIwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Mar 2023 04:52:51 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4C45BDA9
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 01:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679475170; x=1711011170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nju/TZBzGv+Im20Cah7NIogYU4vFgeH+88caQB94zMk=;
  b=bV5jJcS4PmzGOulk0qn3XtufeZrbTN/WmRai81QtNe0Ll9irIBGqxCQA
   oT9w7r3jMsNWnRcbQ9de8eTkrCIuJTEEvXOJV8YYPcYovGJ43fxriFMej
   kkje8uc/sh4jFrwGvni6jCUQEdg4SPHPvOFBaT8thooN3dwi4IvDby+AF
   UJEaxtLl1LTjil9SF1L1zF4UMI4+8OPeWtAQJyaL/hBEq3B9KyRxgLOuk
   ymp/jQQ9te0zctgMHZevj4To9Gre/AKKjvrvRKbsMeL2N5FLSyCOqCqDV
   pyh4aE0CHmURb99+fNcT5XBrzYIrxeI8+JXOUBwEKqjJ46zFkW6l5qhdq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="323001537"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="323001537"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684223091"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="684223091"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:52:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 796721207CD;
        Wed, 22 Mar 2023 10:52:45 +0200 (EET)
Date:   Wed, 22 Mar 2023 10:52:45 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2] media: v4l2-subdev: Add new ioctl for client
 capabilities
Message-ID: <ZBrB3dyLadF0ho+C@kekkonen.localdomain>
References: <20230320115306.87425-1-tomi.valkeinen@ideasonboard.com>
 <6a2d08be-dfcd-1f1f-49ec-a378339c8691@xs4all.nl>
 <55edac06-3d16-bab8-007e-d432420ba019@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55edac06-3d16-bab8-007e-d432420ba019@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Tue, Mar 21, 2023 at 11:25:04AM +0200, Tomi Valkeinen wrote:
> On 21/03/2023 10:43, Hans Verkuil wrote:
> > > @@ -250,6 +268,9 @@ struct v4l2_subdev_routing {
> > >   #define VIDIOC_SUBDEV_S_SELECTION		_IOWR('V', 62, struct v4l2_subdev_selection)
> > >   #define VIDIOC_SUBDEV_G_ROUTING			_IOWR('V', 38, struct v4l2_subdev_routing)
> > >   #define VIDIOC_SUBDEV_S_ROUTING			_IOWR('V', 39, struct v4l2_subdev_routing)
> > > +#define VIDIOC_SUBDEV_G_CLIENT_CAP		_IOR('V',  101, struct v4l2_subdev_client_capability)
> > > +#define VIDIOC_SUBDEV_S_CLIENT_CAP		_IOWR('V',  102, struct v4l2_subdev_client_capability)
> > 
> > Can't we just use __u64 as the ioctl type? Do we need to wrap it inside a struct?
> 
> We could, but then we need to pass a pointer to the u64 so that the kernel
> can modify it (for VIDIOC_SUBDEV_S_CLIENT_CAP). I personally find it more
> clear from the perspective of a user to use a struct here, instead of
> passing a generic u64 pointer. Also, all the other ioctls use a struct.
> 
> So, I'm fine either way, but personally I like this one.

I prefer it the way it is.

-- 
Sakari Ailus
