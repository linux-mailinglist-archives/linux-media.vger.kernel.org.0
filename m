Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3382A7D3D3F
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjJWRSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjJWRSm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:18:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E275BD
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698081520; x=1729617520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ks5k2jWD9IOf8odt8duJWbl++pNprnZMpi+wWVtrWs=;
  b=SAiydWi8f7LZXus5gmflBwOoX6yMt9kHdIO+ySi82Cz8QWxUsaICQSqy
   FH5m8vDrnXj8r5Nh+iD6VsOu7v3ABfD+TsMrRsBYnFGcN//IQCDnnIhy0
   ++N7la1yMMAzvCCdqSG2SFIA9d05Vxe96Zf1AZiM8xFJ33LF+5mmJpYnH
   PyTrv9NWHjV7WiQqZN0Bldvyjvb+8m/N2n+MrgkkMg6JgAcdJ9EJA/KEn
   M/SLzsk7a05qYNnozxyG6b1ai6FBTTYjLAkN00GHPgOtPl7T/xw4orCSH
   /O/55thwHFAA50z221r7i+PlFa0BGDQ4uQ0TiwmolY06A1DfR25IYW00k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="451116285"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="451116285"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="793199973"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="793199973"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:18:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2FE3711F82E;
        Mon, 23 Oct 2023 20:18:35 +0300 (EEST)
Date:   Mon, 23 Oct 2023 17:18:35 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 1/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZTaq6wj5y5gHRLtH@kekkonen.localdomain>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-2-sakari.ailus@linux.intel.com>
 <20231023132902.GQ3336@pendragon.ideasonboard.com>
 <20231023140845.GC13234@pendragon.ideasonboard.com>
 <ZTam_G4AAjgZ6Euw@kekkonen.localdomain>
 <20231023170953.GA18687@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023170953.GA18687@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 23, 2023 at 08:09:53PM +0300, Laurent Pinchart wrote:
> On Mon, Oct 23, 2023 at 05:01:48PM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Mon, Oct 23, 2023 at 05:08:45PM +0300, Laurent Pinchart wrote:
> > > > > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> > > 
> > > There's no sd field in struct v4l2_subdev_state in the linux media
> > > master branch, no mention of dependencies in the cover letter, and no
> > > specified base.
> > > 
> > > Please generate patch series with --base.
> > 
> > That wouldn't help.
> 
> Why not ?

Because the patch the rest of the set depends on is missing. The base for
the patches is indeed the media stage tree (or close to that).

> 
> > But I've realised what the problem is. I forgot to include the first patch.
> > There were six patches, but one added made that seven...
> > 
> > I'll send v3, addressing comments found in v2.
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
