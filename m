Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8217E6C0BF8
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 09:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjCTIPx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 04:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjCTIPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 04:15:52 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071E51BF
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 01:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679300151; x=1710836151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0oq6eHrtl/j515jMotXjeLXyet0ZkkPrHGLFm+OThS0=;
  b=HJxQ4AzigiIQ05BMi2GV1g3JOWTdkWpQRUpfu0q41HECXENkxhPBMqhy
   pjt9ux8OoUS7QbaWd4wMP9V/hJeJX9ZmyrBpr7CBIFxXSJNfiKTuN3KzJ
   +nt+waOOXc1qdy7k+LwK+pRp0N9lTFyy1La2+mjt+SwpkT04xnf0BYj6m
   Yy6jBApRKEgF1bAHzdeRwavh2bO8NDOH4YzfayKgC03gbk7aEN49oQ9aj
   CeKnr5oZZ1vHQvq+qPcNqLOKPpNEFJe8zry7fHFClmv7ApjMX3PKC5JHa
   fVd6UWKkbW1IP5Kw81GsOKvTyJgP4ex6rBgd59wyDaEGRTemvixkltquW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="340145581"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="340145581"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 01:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="824397487"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="824397487"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 01:15:48 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id CC08E122400;
        Mon, 20 Mar 2023 10:15:45 +0200 (EET)
Date:   Mon, 20 Mar 2023 10:15:45 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] media: v4l2-subdev: Add new ioctl for client capabilities
Message-ID: <ZBgWMfqVeW7E20NG@kekkonen.localdomain>
References: <20230228154023.208465-1-tomi.valkeinen@ideasonboard.com>
 <20230312131134.GG2545@pendragon.ideasonboard.com>
 <1e3faadb-bb57-74f8-10bb-3a7267916398@ideasonboard.com>
 <20230319144037.GO10144@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319144037.GO10144@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Mar 19, 2023 at 04:40:37PM +0200, Laurent Pinchart wrote:
> > >> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > >> index 654d659de835..9f863240a458 100644
> > >> --- a/include/uapi/linux/v4l2-subdev.h
> > >> +++ b/include/uapi/linux/v4l2-subdev.h
> > >> @@ -233,6 +233,26 @@ struct v4l2_subdev_routing {
> > >>   	__u32 reserved[6];
> > >>   };
> > >>   
> > >> +/*
> > >> + * The client is aware of streams. Setting this flag enables the use of streams
> > >> + * and routing related ioctls and fields. If this is not set (which is the
> > >> + * default), all the 'stream' fields referring to the stream number will be
> > >> + * forced to 0 by the kernel, and routing related ioctls will return
> > >> + * -ENOIOCTLCMD.
> > > 
> > > Do we need the latter ? Surely if userspace calls routing ioctls, it
> > > should be stream-aware.
> > 
> > I think it makes the API more consistent. I don't think there's much use 
> > for the routing ioctls without the stream field.
> > 
> > I guess it depends on what V4L2_SUBDEV_CLIENT_CAP_STREAMS means. I 
> > thought it means "client wants to use streams", but if we define it to 
> > mean "client is aware of streams and has cleared the 'stream' fields", 
> > then we can only do the field clearing.
> 
> I would go for the second option, as that's the need we have at the
> moment, ensuring backward compatibility with the introduction of the
> streams field.

I'd prefer this, too. Defining it clearly what this actually means is
better as is configuring exactly what's needed --- in order to make it
easier to avoid passing garbage both ways between the user and the kernel
(where it may be a security issue as well).

-- 
Kind regards,

Sakari Ailus
