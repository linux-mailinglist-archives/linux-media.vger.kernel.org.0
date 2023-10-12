Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139667C77A8
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 22:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442438AbjJLUJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 16:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442340AbjJLUJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 16:09:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D72AC0
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697141362; x=1728677362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RO4bZYY7ZxfQjs5OtbIatzJWdxbN3XSNBZrqltJYfmM=;
  b=lzziArRPHPqRM+9CAiD5JCP7PM1I9drDHRZfBhAnjTiOg+RgeaRw3dSl
   RyVGTRAQ0lqaYGh9hzq2YrOms8b8My6QqtjImw4TJe8mvJk8A3u/bV3o0
   sRd+BMRcThaj4J1/hJ6/spRY50VAl92ReggiOkz6685lIEIP/P/mcExhK
   Ke6b++JsWSixEgcn1O4YkXwiQWMqPcq3o0Fv5cMLs+LULqG+OQ+/WjfoC
   OkbZTj/l9qr3UGbFtWHd3Zp6MVX143Uwzq1ErGwXHmHaR6OAyxIE6bKlK
   XCiGBPXUM2oNZoHK8996c2jK8tYouUZ2U8yMx72qaUExVJ3o+fWkx08LN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370100916"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="370100916"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="824748334"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="824748334"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 13:09:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 8C8BB120AE5;
        Thu, 12 Oct 2023 23:09:16 +0300 (EEST)
Date:   Thu, 12 Oct 2023 20:09:16 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 15/28] media: v4l: subdev: Copy argument back to user
 also for S_ROUTING
Message-ID: <ZShSbBaDwf8iVtdd@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-6-sakari.ailus@linux.intel.com>
 <794135ff-3e59-40c7-842d-4cb5336af6e2@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <794135ff-3e59-40c7-842d-4cb5336af6e2@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 05, 2023 at 12:37:41PM +0200, Hans Verkuil wrote:
> On 03/10/2023 14:08, Sakari Ailus wrote:
> > As the user needs to know what went wrong for S_ROUTING, copy array
> > arguments back to the user.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index fb453b7d0c91..6921a72566df 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -3419,7 +3419,8 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
> >  	 * in case of failure, but it is not defined here as part of the
> >  	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
> >  	 */
> > -	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
> > +	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING &&
> > +	    cmd != VIDIOC_SUBDEV_S_ROUTING)
> >  		goto out;
> >  
> >  	if (has_array_args) {
> 
> This is ugly.
> 
> How about this:
> 
> 	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
> 		always_copy = true;
> 
> 	if (err < 0 && !always_copy)
> 		goto out;
> 
> The first 'if' can also be a 'switch', I have no preference.
> 
> This cmd check can also be done earlier in the function, right after
> the call to video_get_user(). It might be a better place.

[GS]_ROUTING are already handled here (plus the related comment is right
above) so I prefer this location, i.e. exact lines above you suggested.
It's indeed cleaner.

-- 
Regards,

Sakari Ailus
