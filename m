Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3351B5143E4
	for <lists+linux-media@lfdr.de>; Fri, 29 Apr 2022 10:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355526AbiD2ISS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Apr 2022 04:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355490AbiD2ISO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Apr 2022 04:18:14 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F059FC12F6
        for <linux-media@vger.kernel.org>; Fri, 29 Apr 2022 01:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651220085; x=1682756085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zm7FH+yqt6vni36zfYx9v6kZnS9JKu2LdAvh7lzSDMo=;
  b=Z4GksEw2UrYn1VaAuiZU5oGfex4UPR8jFfNJ0pw8+Hoh35fZuZ6HFz9F
   ByTfyThjR2ebgpPYXLhv1kzYkdBNV76M3efXqMDdvqqS7yuDcSbvSOL5M
   Rwaw0w8II3yAWmFqD03FaSt+U0BunHjmX2yutoAPABRY0xxjiVWjUA6QF
   3BMrXqt3GzQt8Jgj7h4XCAcTyHpA7HeA7sC6sGyncMtQdDGEPN8mmbNXP
   KXrZJzfxIY7O+l2tZCzdl7IqzV5e9Klf5pXqwCuiyHJpkU3tjB4CbjHzZ
   56Rxc4lXQ4yNYAcM/ijT+3znRPgqjdHk+bY5uLlSoWHb1oQ+dMSMFgO0T
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="247130018"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="247130018"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 01:14:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="731951411"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 01:14:44 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6192E200F1;
        Fri, 29 Apr 2022 11:14:42 +0300 (EEST)
Date:   Fri, 29 Apr 2022 11:14:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: Documentation: mc: Add
 media_device_{init,cleanup}
Message-ID: <Ymueci/jIQVtcMO2@paasikivi.fi.intel.com>
References: <20220309171006.12327-1-sakari.ailus@linux.intel.com>
 <Yijgknjnti4LgNqL@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yijgknjnti4LgNqL@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Mar 09, 2022 at 07:14:58PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 09, 2022 at 07:10:06PM +0200, Sakari Ailus wrote:
> > Document that drivers must first initialise a media device before
> > registering it, and clean up once the media device is unregistered.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/driver-api/media/mc-core.rst | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/mc-core.rst b/Documentation/driver-api/media/mc-core.rst
> > index 57b5bbba944e..02481a2513b9 100644
> > --- a/Documentation/driver-api/media/mc-core.rst
> > +++ b/Documentation/driver-api/media/mc-core.rst
> > @@ -42,9 +42,16 @@ Allocation of the structure is handled by the media device driver, usually by
> >  embedding the :c:type:`media_device` instance in a larger driver-specific
> >  structure.
> >  
> > -Drivers register media device instances by calling
> > -:c:func:`__media_device_register()` via the macro ``media_device_register()``
> > -and unregistered by calling :c:func:`media_device_unregister()`.
> > +Drivers initialise media device instances by calling
> > +:c:func:`media_device_init()`. After initialising a media device instance, it is
> > +registered by calling :c:func:`__media_device_register()` via the macro
> > +``media_device_register()`` and unregistered by calling
> > +:c:func:`media_device_unregister()`. An initialised media device must be
> > +eventually cleaned up by calling :c:func:`media_device_cleanup()`.
> > +
> > +Note that it is not allowed to unregister a media device instance that was not
> > +previously registered, or clean up a media device instance that was not
> > +previously initialised.
> 
> Could we fix this, to simplify drivers ? This patch is fine as it

I think this could be thought with object lifetime.

> documents the current behaviour, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
