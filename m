Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAA46B03B9
	for <lists+linux-media@lfdr.de>; Wed,  8 Mar 2023 11:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjCHKIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Mar 2023 05:08:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjCHKIV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Mar 2023 05:08:21 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C201CAC1
        for <linux-media@vger.kernel.org>; Wed,  8 Mar 2023 02:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678270100; x=1709806100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/XvfCaOmZ4r8UOjiPZW0+rqOkqE8/DTZmqsP9zWvuUE=;
  b=Rp6F91/rBzBT+JdDmbW+fKAFxgwmLJG1ZNPHdA9MB7k+eo0Dr5hlQfv+
   vJwqAXMaOAtnqY3+S8UihKx9YY2AOhwMfnehbEIsmJWE5P+XYVx0kUShV
   TJtrxkj31wQ9ZBEtvWF9eB9UQlxefHakhaP42lz9f1xPE6BUZceZHDOeS
   n1yLGtvInQ7eEb4vemhNu/sPUA3sDlRxf21f34EwRnWMI3iIt840vonvZ
   WyxDL4sSFPxXfLmA4D8gmVUKDtNkIdsi2tSJjvEN5TNP6QFT8MShmR1bG
   NmnfywOG2pYWgzrao0EGJhTIoBGULASeq/318frO/xfonv5cDYCeMJdap
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336134547"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="336134547"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 02:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="707128276"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="707128276"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 02:08:17 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2FE6612160F;
        Wed,  8 Mar 2023 12:01:33 +0200 (EET)
Date:   Wed, 8 Mar 2023 12:01:33 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-subdev: Add new ioctl for client capabilities
Message-ID: <ZAhc/YWyRsqd8DnF@kekkonen.localdomain>
References: <20230228154023.208465-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228154023.208465-1-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On Tue, Feb 28, 2023 at 05:40:23PM +0200, Tomi Valkeinen wrote:
> Add new ioctls to set and get subdev client capabilities. Client in this
> context means the userspace application which opens the subdev device
> node.
> 
> For now we only add a single flag, V4L2_SUBDEV_CLIENT_CAP_STREAMS, which
> indicates that the client is streams-aware.
> 
> The reason for needing such a flag is as follows:
> 
> Many structs passed via ioctls, e.g. struct v4l2_subdev_format, contain
> reserved fields (usually a single array field). These reserved fields
> can be used to extend the ioctl. The userspace is required to zero the
> reserved fields.
> 
> We recently added a new 'stream' field to many of these structs, and the
> space for the field was taken from these reserved arrays. The assumption
> was that these new 'stream' fields are always initialized to zero if the
> userspace does not use them. This was a mistake, as, as mentioned above,
> the userspace is required to zero the _reserved_ fields. In other words,
> there is no requirement to zero this new stream field, and if the
> userspace doesn't use the field (which is the case for all userspace
> applications at the moment), the field may contain random data.
> 
> This shows that the way the reserved fields are defined in v4l2 is, in
> my opinion, somewhat broken, but there is nothing to do about that.
> 
> To fix this issue we need a way for the userspace to tell the kernel
> that the userspace has indeed set the 'stream' field, and it's fine for
> the kernel to access it. This is achieved with the new iotcl, which the
> userspace should usually use right after opening the subdev device node.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Any thoughts on this?

I think this is ready to be merged.

-- 
Regards,

Sakari Ailus
