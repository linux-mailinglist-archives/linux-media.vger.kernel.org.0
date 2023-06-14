Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCAAB730496
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 18:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjFNQJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 12:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjFNQJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 12:09:10 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B531BF9
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 09:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686758949; x=1718294949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fdUaL5WWKdLvRUyGvA5btIMoOmiNEekUI4XI+LaVqrM=;
  b=QZYtcRbvvuC06qWEN9SFo4HFWPKfaLSrBjbM45gd4dJZC3D3mCPcpSQG
   ShAAj1aKGxV90F6XEcXH+b73HeAQRYgG5rX8dnqaobsrawZwTGnnD3wfu
   ZKXifmzD67Dn4LVKGYYtWcFbtr+J048W8yVZQax+9prYoCzao/pNHZE+d
   NrvLVUglhxM5fQYPqowTHc1JBqWwz6CGG5doFSAlb4oieutYQgfL9mY33
   Eyz/gFt17nWToIcbUBsxR1UzEmNfIdcdK+v7svpZwmUWFm5Nct/ZoJHL6
   mDmj7ZRJnut4Be/KYPIUcx2JEHKXth8BHnksmZvQT/1d23xTxYkKf9hUR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="356151238"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="356151238"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 09:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712113722"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="712113722"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 09:05:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id C26F9120C62;
        Wed, 14 Jun 2023 19:05:15 +0300 (EEST)
Date:   Wed, 14 Jun 2023 16:05:15 +0000
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: OV5693 Kconfig missing a select VIDEO_V4L2_SUBDEV_API ?
Message-ID: <ZInlO48ACwQ3lwYX@kekkonen.localdomain>
References: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 14, 2023 at 05:47:01PM +0200, Hans de Goede wrote:
> Hi All,
> 
> The ov5693 driver uses v4l2_subdev_get_try_crop() /
> v4l2_subdev_get_try_format() both of which are
> only defined if CONFIG_VIDEO_V4L2_SUBDEV_API=y .
> 
> Yet it does not do select VIDEO_V4L2_SUBDEV_API
> in its Kconfig bits ?
> 
> Note I've not seen any build errors because of this,
> I guess we somehow end up getting away with this...
> 
> But still I think the select should be added ?

I agree.

The reason there haven't been compile failures is that there's a vast
number of sensor drivers that all select this so for a failure you'd need
to select this one but none of the others.

I can send a fix.

-- 
Regards,

Sakari Ailus
