Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98AF46A9655
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 12:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjCCLcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 06:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCCLck (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 06:32:40 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363A15F500
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 03:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677843132; x=1709379132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sfxZQWL/jGcb8k/G+/ovbbt538/+1HYX9UaPmHiPTRo=;
  b=exXuDipXGw2S0lxQjSuu0QvEWgdd2CXJHe40UJ5I2+2Y4u9rK82ztdvM
   cDiilylBCQ+IrlDO75nu8GdDWmZk+hfRa52sBPLMHey6HQyAPq70JaIf4
   tRVEEyooVMgrNWO1xZJAKMy+KJItOo0IT1nmncifq5YEgn/KDl9izSJdH
   bM/PRkrGR9o0NKGn8maW7UsWXpg0vESX+6o+j+L+Y7rrnQe729Tc+kMoQ
   UbLjI6EdE6DXUhJ1zgfMp3GiinDrHJRpWVNDkbP4LbISN+gV+s1XqAtvr
   rrCMqzlD+jmfLfehmwDmsXOrTzOb4FNy71Au1e9+ogGSkmhg8znw/91rd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="323318776"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="323318776"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:30:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="744206668"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="744206668"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:30:03 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 35CF212231C;
        Fri,  3 Mar 2023 13:30:01 +0200 (EET)
Date:   Fri, 3 Mar 2023 13:30:01 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hdegoede@redhat.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Message-ID: <ZAHaOY6m864mEL0e@kekkonen.localdomain>
References: <441f2951-402b-0f3c-5ea6-8d6df3f3e894@redhat.com>
 <20230302202219.846011-1-sakari.ailus@linux.intel.com>
 <12e3fcc5-1a54-1313-8d52-5618b87f09d1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12e3fcc5-1a54-1313-8d52-5618b87f09d1@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Fri, Mar 03, 2023 at 10:41:27AM +0200, Tomi Valkeinen wrote:
> On 02/03/2023 22:22, Sakari Ailus wrote:
> > Link validation currently accesses invalid pointers if the link passed to it
> > is not between two sub-devices. This is of course a driver bug.
> > 
> > Ignore the error but print a debug message, as this is how it used to work
> > previously.
> > 
> > Fixes: a6b995ed03ff ("media: subdev: use streams in v4l2_subdev_link_validate()")
> > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi Hans,
> > 
> > Could you test this?
> > 
> > The bug is of course in the ImgU driver and this reverts to the old
> > pre-streams behaviour. It silently fails instead of oopsing. The ImgU driver
> > needs to be fixed and I think we could make this return an error at the same
> > time. Right now I can't be sure the ImgU driver is the only one suffering
> > from this, but if so, it's likely to be broken anyway.
> 
> Maybe it should be at least a warn? How do we catch other broken drivers
> otherwise?

The purpose of this patch is just to restore the old behaviour, and merge
it as a fix to v6.3 (via Cc'ing stable). I agree this should be made an
error but I'd like that change to be present in the media tree for some
time first.

> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks!

-- 
Kind regards,

Sakari Ailus
