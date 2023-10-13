Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C117C8435
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjJMLRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjJMLRs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:17:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7129EBD
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697195867; x=1728731867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ESUx6+EtVdq8CbDdTrgj39waQvLm7m0JQGPeMUsDofo=;
  b=FEM0UiwZnC2oW/2irxewWwr61AOAJ30h4yWUso9PAgbC6s8cwiOnTpyT
   PqY4c2kSah2cKBv8Amv5M5l2L6uXlIEFzAo+vhRL60gZUqMDL7PeH284w
   LDZHlaQLmR4wbtWUzd5UuJ4B0P39UFhN/YPXTRX5I6i+WbrVnFsuaTRG/
   BMJLU9qXaOBjX/dLyaqY9e3uiK3hfgXaLdUKfq+wt8st5I3Bvf5HklLST
   3qopc9kUwFfiZyLAnBFPp0tk0ZrGlgEXUbFhrzNE9pLhtZPNL9EzuBa4q
   F6+sxoU5Nz55Ve0YlTz9SXUNbPfFoCSCFwNjXvKNVYZCNqhN2gUINiMtY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471393738"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="471393738"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="928390013"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="928390013"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:17:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B2927120AB3;
        Fri, 13 Oct 2023 14:17:40 +0300 (EEST)
Date:   Fri, 13 Oct 2023 11:17:40 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH 1/6] media: v4l: subdev: Store the number of pads in
 sub-device state
Message-ID: <ZSknVGSWjNG2qwTa@kekkonen.localdomain>
References: <20231013104424.404768-1-sakari.ailus@linux.intel.com>
 <20231013104424.404768-2-sakari.ailus@linux.intel.com>
 <20231013105749.GA11101@pendragon.ideasonboard.com>
 <ZSkkoG7vjzMUXeOI@kekkonen.localdomain>
 <20231013111507.GE11101@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013111507.GE11101@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 13, 2023 at 02:15:07PM +0300, Laurent Pinchart wrote:
> On Fri, Oct 13, 2023 at 11:06:08AM +0000, Sakari Ailus wrote:
> > On Fri, Oct 13, 2023 at 01:57:49PM +0300, Laurent Pinchart wrote:
> > > On Fri, Oct 13, 2023 at 01:44:19PM +0300, Sakari Ailus wrote:
> > > > Store the number of pads in the sub-device state. This will be needed to
> > > > validate pad when retrieving information for non-stream-aware users.
> > > 
> > > I'd rather store a pointer to the subdev. You can get the number of pads
> > > from there.
> > 
> > The value is initialised after the array is allocated so this won't change.
> > 
> > I don't have a strong opinion either way. It's still more efficient to
> > store just the value.
> 
> Slightly so, but I don't think it will matter in practice. I believe
> we'll have more needs to access the subdev from the state in the future,
> which is why I'd rather store the pointer already.

Fair enough, I'll make it a sub-device pointer.

-- 
Sakari Ailus
