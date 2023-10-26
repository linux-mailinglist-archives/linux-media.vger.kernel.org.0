Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F72E7D7DC6
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 09:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbjJZHoC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 03:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjJZHoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 03:44:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DDEC0
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 00:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698306239; x=1729842239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q9PDmok1DTlPeVRuEURcaQ3HtoFxdYcif90UAieYvEo=;
  b=RxKfbmUN9DJYKQCpWQRvgWheUvs1iZcYULd1w5zsFfe1khFGBR6ROWVO
   HdHa1Ly4Wm9b27Q2ubNCYry5jcrR/ZgLBMyTWZFVgKvhGqFHD1VZB/JHW
   bp+2SnkRHbd3e0RvLhcEEXSBsdn1b6weWJ7r67aeDT77c3XnGQ6sy+5Zc
   RSzaSluukoSWsNiYvVkFykg5F0UVFimmSnwu7viqKgv3RJzJZTYA+zYQq
   xZKuMOzf7PmQzWGKPPenKSPJfEumanqTCxptMJAteQQ+Hc2jknz2wknTj
   uWmQSfOKzIMYSlx03w3PPRM87KAEwIfnEnwNaS+UIbgLi91fSEmZy3hAV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390340610"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="390340610"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="788393466"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="788393466"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 00:43:56 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 14E6111FAF5;
        Thu, 26 Oct 2023 10:43:54 +0300 (EEST)
Date:   Thu, 26 Oct 2023 07:43:54 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 8/9] media: v4l: subdev: Return NULL from pad access
 functions on error
Message-ID: <ZToYutbrmGgF1njH@kekkonen.localdomain>
References: <20231026070329.948847-1-sakari.ailus@linux.intel.com>
 <20231026070329.948847-9-sakari.ailus@linux.intel.com>
 <6665510a-76b3-4ac8-bd18-7cf6e675362b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6665510a-76b3-4ac8-bd18-7cf6e675362b@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 26, 2023 at 09:35:55AM +0200, Hans Verkuil wrote:
> On 26/10/2023 09:03, Sakari Ailus wrote:
> > Return NULL from sub-device pad state access functions
> > (v4l2_subdev_state_get_{format,crop,compose}) for non-existent pads. While
> > this behaviour differs from older set of pad state information access
> > functions, we've had a WARN_ON() there for a long time and callers also do
> > validate the pad index nowadays. Therefore problems are not expected.
> 
> Huh? Patch 2 adds the WARN_ON, and it is removed in patch 8 again?
> 
> I'm really confused.

Patch two makes the generic subdev state information access functions do
exactly what the subdev state pad-specific information access functions
did. As we're merging two classes of users, doing one thing at a time is
prudent.

This patch aligns the behaviour of the single set of subdev state access
functions. Should there a problem there, we can just revert this one.

-- 
Regards,

Sakari Ailus
