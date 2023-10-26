Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5F97D87D3
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 19:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjJZRu4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 13:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJZRuz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 13:50:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FC6AC
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698342654; x=1729878654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TH9NyH6kyqdqTf52xWzSTog92v/qN5hJr1bdUuq0XR8=;
  b=QvBwj2IOKiBRwLobdnyd1Iv8Qs8hXPjoHoSNBUlBrTaNy0gqL5suwsJe
   qunAfme0VpRRfYOZUoDy/oIhHr2hjID3xUqUO1QIDykwGE9yVVwMdOeFz
   EmBC9cYQIkevZTc0500QBDNPvoZHcdoiilRtvyG7JROGGxImlJEu1XNWl
   BJf1AgCzAkdVHFptMtnylqTQAkOU557Zj/JI9QP2Q4SlKZHILdZHEe7Wj
   b+SNyzziKgcpQ3WI2L1WqBaeEeJ+KYWmhPoSpUDvgBmAj20E93Kzq9fPL
   viYNIJrElixCSRoPt+z13MFR2/H20YPP2FrZj7ltMr+z5MRBr//nuJ2Xc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="377972776"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="377972776"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 10:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="902996267"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="902996267"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 10:48:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 787E011F758;
        Thu, 26 Oct 2023 20:50:48 +0300 (EEST)
Date:   Thu, 26 Oct 2023 17:50:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 9/9] media: v4l: subdev: Warn on stream when accessing
 stream-unaware data
Message-ID: <ZTqm-Cd4aPjwosYN@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-10-sakari.ailus@linux.intel.com>
 <913f5d17-58b3-4631-912c-98203e896ff6@xs4all.nl>
 <ZToYBPjwqKOIs68L@kekkonen.localdomain>
 <20231026142011.GG26306@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026142011.GG26306@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 26, 2023 at 05:20:11PM +0300, Laurent Pinchart wrote:
> On Thu, Oct 26, 2023 at 07:40:52AM +0000, Sakari Ailus wrote:
> > On Thu, Oct 26, 2023 at 09:36:41AM +0200, Hans Verkuil wrote:
> > > On 26/10/2023 09:03, Sakari Ailus wrote:
> > > > Warn if the stream is set ot a non-zero value on sub-device pad state
> > > > access functions. A driver bug is required for triggering the warning.
> > > 
> > > More confusion here: why not merge this into patch 2?
> > 
> > I can squash it there.
> 
> I'm fine with that, but I wonder if we need a WARN_ON() in that case.
> Won't driver developers notice the bug, given they'll get a NULL pointer
> ?

Obviously they would. But it's also that the function shouldn't be called
that way: it's an obvious omission of input validation elsewhere and that
should be fixed.

-- 
Sakari Ailus
