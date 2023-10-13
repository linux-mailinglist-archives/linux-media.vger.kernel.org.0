Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369AC7C8444
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjJMLTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjJMLTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:19:43 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A994491
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697195981; x=1728731981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uo25tM81b/nAXgj6NO0WlRud+nGTDSXTD1EQgeyPhSg=;
  b=MJG1sBZw3D7WrJEkMklkZDuU2RZQ7A1jcjRYvxdOxAJ/NF3Qxdi8vYaU
   fhAUGRrjeiRB/fJ/CYEy6iumEvs0ZmC7pILAjyWdfqYSOgw5e+pONr0nx
   VRHu41naaVld75+UqHlTmlrAFCUyHz4+ROiB2JGiWPsmXAMWF3Fy16QYi
   n7tQoBqkTQxCTBSFgrLei7lqV6QUuAuZqqXhUBKnnsPMkjXUNH8dzOtTQ
   pdFTZxClG+Ft/B4FBvUVESd4K5F9FLyjmTg3Sq7dujbf9hbVR9pc+pV4a
   OX/p2eO92HcgWi8YZgGIAUj2j5uGty3F5hK89GsygNF542UPRMLzB6aFt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="382386876"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="382386876"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001912066"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="1001912066"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:19:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 86EEB120A2E;
        Fri, 13 Oct 2023 14:09:36 +0300 (EEST)
Date:   Fri, 13 Oct 2023 11:09:36 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 3/6] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <ZSklcH8FrlCoIMqa@kekkonen.localdomain>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-4-sakari.ailus@linux.intel.com>
 <20231013110439.GB11101@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013110439.GB11101@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Oct 13, 2023 at 02:04:39PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Oct 13, 2023 at 01:44:21PM +0300, Sakari Ailus wrote:
> > Rename the sub-devices state information access functions, removing
> > "_state" and "_stream" from them. This makes them shorter and so more
> > convenient to use. No other functions will be needed to access this
> > information.
> 
> The new names are too generic, and thus confusing. For instance,
> v4l2_subdev_get_format() is way too close to v4l2_subdev_get_fmt(). I'm
> fine dropping "_stream", but I would like to keep "_state".
> 

My intention was actually to rename v4l2_subdev_get_fmt() later on: it's
used in an ops struct, almost uniquely, so its name can be longer without
it being a nuisance. I can include this in the same set.

The reason for using a shorter names such as v4l2_subdev_get_format() is
that they're nicer to use in the code. The function names we've added
recently are often exceedingly long. There's hardly room for confusion in
this case either: these functions will remain as the only interface to
access information in sub-device state.

-- 
Regards,

Sakari Ailus
