Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D19A69AA92
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 12:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjBQLji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Feb 2023 06:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjBQLji (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Feb 2023 06:39:38 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588586537B
        for <linux-media@vger.kernel.org>; Fri, 17 Feb 2023 03:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676633977; x=1708169977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Seski/4E4yrbwcDc2E9UxQVtRdX0m4sP/Hr9GVaRGg0=;
  b=cml8I2ZGuckmSnCZs9nQRlUzEAnSIOU74I1O8ZSBhilwesizAb1iX2mR
   Me3zmHTH/mXzFEXLHO9N0xFeACOCdTGvh0XAI0UQy4AKdv0YrYgsnVdAn
   ZXp/tlzaeyhBwVi7zQJjo3pXObbg9kkvSHnw3PBImzfb/xH8ONTqP9Au3
   CnvFYFxPy8UR8P9Y1WLlmDEGjwianmMQF6L7tSYf5h0Z7BLnbnbsaswlO
   edaMRh8nkN0ne3GijRWpk8T2phFR70MzisQzwuduGbXSq5F/jLjx/KFcr
   ijhjYIQjC9tLB4K7F6Q30Nb+57VZH25rQ1rRj6Ayw5CWcDrrpxnkhln6x
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311600708"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="311600708"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:39:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="672556216"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="672556216"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:39:35 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 4575911FC11;
        Fri, 17 Feb 2023 13:39:32 +0200 (EET)
Date:   Fri, 17 Feb 2023 13:39:32 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, frieder.schrempf@kontron.de,
        Tim Harvey <tharvey@gateworks.com>,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <Y+9ndOYuG8WNv1mL@kekkonen.localdomain>
References: <049f2fea-1725-74d9-d20d-fc4f7506d504@kontron.de>
 <20230209221634.35239-1-sakari.ailus@linux.intel.com>
 <Y+V02fe9lqVrt3lb@pendragon.ideasonboard.com>
 <Y+zJboHu13jqo+Mv@kekkonen.localdomain>
 <Y+0xGRgQdACCIqnL@pendragon.ideasonboard.com>
 <Y+3lZs3S1EhYuuHp@kekkonen.localdomain>
 <Y+64CdATkoeE5AdL@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+64CdATkoeE5AdL@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Feb 17, 2023 at 01:11:05AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Feb 16, 2023 at 10:12:22AM +0200, Sakari Ailus wrote:
> > On Wed, Feb 15, 2023 at 09:23:05PM +0200, Laurent Pinchart wrote:
> > > On Wed, Feb 15, 2023 at 02:00:46PM +0200, Sakari Ailus wrote:
> > > > On Fri, Feb 10, 2023 at 12:34:01AM +0200, Laurent Pinchart wrote:
> > > > > Thank you for the patch.
> > > > 
> > > > Thanks for the review!
> > > > 
> > > > This was indeed hastily written, to help debugging a particular issue. But
> > > > I hope it'll be useful for other purposes, too. V4L2 async is about to get
> > > > more complicated soon.
> > > 
> > > Could it get simpler instead ? :-) Maybe one day v4l2-async may cross
> > > the threshold of how much pain I can bear, and I'll rewrite it...
> > 
> > I wish it could, but often supporting complex needs is complicated.
> > "Simplicated" is not even a proper word after all. Let's see.
> 
> Don't try to lure me into rewriting it sooner than later ;-)

This could be all avoided if drivers got all what they need during probe.

It would require vast changes accross a large number of drivers and might
never happen.

Also this is related to not exposing access any hardware before all of it
is available.

-- 
Regards,

Sakari Ailus
