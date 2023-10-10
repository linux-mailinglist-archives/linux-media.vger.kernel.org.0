Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE1E7BFA50
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 13:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjJJLuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 07:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbjJJLuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 07:50:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3279D
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 04:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696938601; x=1728474601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=88EAsTvlA9sazY42zKRgyLtepyLlWwhGA1GDiaOG5Uw=;
  b=bm4/RFMUoP6joqEL9VYU4sn5LXNTpqaonaeTxVPOj/OCQmEip9RnvF8D
   U/alLreTo5mfsLz5X8WbEQ9aTdX/6O8xnDyHVGt0VxWtFvZgdAEbbypSh
   mvWhWUADN+QrhKjM9C83tbvOrgahPc+8j4r9l7VhGOE/XZS5gSjmwMsbl
   0Nrt+uobRABqTYoKzA5nqmoc2fbL2dKPPwHxm3xbHF8ezEHx4SUUM26tV
   Esmpckngz9oZNSis9ga+OgyRHyHZ+qQewmMGrwgSd7aPwXINTJxS+bC3O
   YKwWTxPrfiiruuKejIAYltfKRtZ80jF6iUXU60zDMNkb+g7CYMGZwbOpt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384227446"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="384227446"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 04:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="782858274"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="782858274"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 04:49:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4377F11F835;
        Tue, 10 Oct 2023 14:49:56 +0300 (EEST)
Date:   Tue, 10 Oct 2023 11:49:56 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Dennis Bonke <admin@dennisbonke.com>,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH] media: subdev: Don't report V4L2_SUBDEV_CAP_STREAMS when
 the streams API is disabled
Message-ID: <ZSU6ZFKS5QkFJgZw@kekkonen.localdomain>
References: <20231010102458.111227-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010102458.111227-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Oct 10, 2023 at 12:24:58PM +0200, Hans de Goede wrote:
> Since the stream API is still experimental it is currently locked away
> behind the internal, default disabled, v4l2_subdev_enable_streams_api flag.
> 
> Advertising V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
> confuses userspace. E.g. it causes the following libcamera error:
> 
> ERROR SimplePipeline simple.cpp:1497 Failed to reset routes for
>   /dev/v4l-subdev1: Inappropriate ioctl for device
> 
> Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
> to avoid problems like this.
> 
> Reported-by: Dennis Bonke <admin@dennisbonke.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> -Clearing the V4L2_SUBDEV_FL_STREAMS flag from sd.flags might seem
>  appealing as an alternative fix. But this causes various v4l2-core bits
>  to enter different code paths which confuses drivers which set
>  V4L2_SUBDEV_FL_STREAMS, so this is a bad idea.

Thanks, this apparently had been missed while disabling the API.

Probably also should be added:

Fixes: 9a6b5bf4c1bb ("media: add V4L2_SUBDEV_CAP_STREAMS")
Cc: stable@vger.kernel.org # for >= 6.3

Also cc'd Tomi.

> -No Closes: for the Reported-by since this was reported by private email
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b92348ad61f6..31752c06d1f0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -502,6 +502,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>  
> +	/*
> +	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
> +	 * Remove this when the API is no longer experimental.
> +	 */
> +	if (!v4l2_subdev_enable_streams_api)
> +		streams_subdev = false;
> +
>  	switch (cmd) {
>  	case VIDIOC_SUBDEV_QUERYCAP: {
>  		struct v4l2_subdev_capability *cap = arg;

-- 
Regards,

Sakari Ailus
