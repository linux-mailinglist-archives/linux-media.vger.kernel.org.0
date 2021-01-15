Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2882F748F
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 09:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAOItP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 03:49:15 -0500
Received: from mga18.intel.com ([134.134.136.126]:47424 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbhAOItP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 03:49:15 -0500
IronPort-SDR: RDWGbO9zfCyH0DQ4fT9MgV9oPDxWPYGckjwtMycuADNNYCuamtuFQbo5Tll7BXMOS88zzpSyId
 wJUn6XGEZAsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166189532"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="166189532"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 00:47:25 -0800
IronPort-SDR: Xplb/O8iwy4xFItQZQ5UTuJsRUWSyjCnND7SqBMcDOD6/Rd3tKY0txumIQhvHCt2NLa89RxxGu
 YBkdDoSyEZcw==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="390054772"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 00:47:21 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0CA3D206A9; Fri, 15 Jan 2021 10:47:18 +0200 (EET)
Date:   Fri, 15 Jan 2021 10:47:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH 12/13] media: Clarify v4l2-async subdevice addition API
Message-ID: <20210115084717.GO11878@paasikivi.fi.intel.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-13-ezequiel@collabora.com>
 <X/+qw3OtGpveRK17@pendragon.ideasonboard.com>
 <38064ab4f6d0fc4302171e3c24bb8be37e500b86.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38064ab4f6d0fc4302171e3c24bb8be37e500b86.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 10:39:33AM -0300, Ezequiel Garcia wrote:
> On Thu, 2021-01-14 at 04:21 +0200, Laurent Pinchart wrote:
> > Hi Ezequiel,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Jan 12, 2021 at 10:23:38AM -0300, Ezequiel Garcia wrote:
> > > Now that most users of v4l2_async_notifier_add_subdev have
> > > been converted, let's fix the documentation so it's more clear
> > > how the v4l2-async API should be used.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  .../driver-api/media/v4l2-subdev.rst          | 38 ++++++++++++++++---
> > >  include/media/v4l2-async.h                    | 12 +++++-
> > >  2 files changed, 43 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > > index bb5b1a7cdfd9..5ddf9de4fcf7 100644
> > > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > > @@ -204,11 +204,39 @@ Before registering the notifier, bridge drivers must do two things:
> > >  first, the notifier must be initialized using the
> > >  :c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
> > >  begin to form a list of subdevice descriptors that the bridge device
> > > -needs for its operation. Subdevice descriptors are added to the notifier
> > > -using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
> > > -takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
> > > -and a pointer to the subdevice descripter, which is of type struct
> > > -:c:type:`v4l2_async_subdev`.
> > > +needs for its operation. Several functions are available, to
> > > +add subdevice descriptors to a notifier, depending on the type of device:
> > 
> > You could reflow this to
> > 
> > needs for its operation. Several functions are available, to add subdevice
> > descriptors to a notifier, depending on the type of device:
> > 
> > > +:c:func:`v4l2_async_notifier_add_devname_subdev`,
> > > +:c:func:`v4l2_async_notifier_add_fwnode_subdev` or
> > > +:c:func:`v4l2_async_notifier_add_i2c_subdev`.
> > 
> > Should you also list v4l2_async_notifier_add_fwnode_remote_subdev() (and
> 
> Yes.
> 
> > possibly v4l2_async_notifier_parse_fwnode_endpoints()) here ?
> > 
> 
> Unsure. I'd rather not document this one, as it's deprecated
> and we want to remove it.

This document is here to guide people to use the right functions and that
isn't one of them. So it shouldn't be added here.

-- 
Regards,

Sakari Ailus
