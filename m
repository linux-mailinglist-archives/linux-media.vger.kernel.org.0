Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6EA36AF55F
	for <lists+linux-media@lfdr.de>; Tue,  7 Mar 2023 20:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbjCGTYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Mar 2023 14:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbjCGTYL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Mar 2023 14:24:11 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D9299669
        for <linux-media@vger.kernel.org>; Tue,  7 Mar 2023 11:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678216204; x=1709752204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SgX+ORzViweruM0UBDV4TzHP5kR0lPy4Eer7/TB47k4=;
  b=mxZBcg2QfqWpwWJM9qnTflMJTsRQhtKdZxDhQFrA5SaLXzvty0MkATNl
   nH2UA28KU4pVwSH4X5JCC4pdmDLnuieoWn5rl5hZ2Sx7DoRrc0+0fL/Fy
   UWSAuI4LXRwTw/y3PkT3mnNx7514Dnk5ifMiy7+cW1OwYYtcjAlpNnCmy
   z+AU5si7ebQecoQJY/RbYpWsLZE/jvR4BiBOTr63yFQuFDufhrga3wuX6
   +NFbBRt2FfFGRuVJMnsWcqJmHe2veTqW8U4Xl6A1k8M7FikoNcZ9LXbYn
   FsRlqTBlchOjMOjsrcoZfBjK43b9jrtL7zqEtKNxoYJ1msQAqptXonvus
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="335968449"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="335968449"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 11:10:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="922477367"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="922477367"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 11:10:02 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id BA5DF12160F;
        Tue,  7 Mar 2023 21:09:59 +0200 (EET)
Date:   Tue, 7 Mar 2023 21:09:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: subdev: Fix validation state lockdep issue
Message-ID: <ZAeMB+yjuEf8zWb0@kekkonen.localdomain>
References: <20230303155249.140929-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303155249.140929-1-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Fri, Mar 03, 2023 at 05:52:49PM +0200, Tomi Valkeinen wrote:
> The new subdev state code has a possible deadlock scenario during link
> validation when the pipeline contains subdevs that support state and
> that do not support state.
> 
> The current code locks the states of the subdevs on both ends of the
> link when starting the link validation, locking the sink side first,
> then the source. If either (or both) of the subdevs does not support
> state, nothing is done for that subdev at this point, and instead the
> locking is handled the old way, i.e. the subdev's ops do the locking
> internally.
> 
> The issue arises when the sink doesn't support state, but source does,
> so the validation code locks the source for the duration of the
> validation, and then the sink is locked only when the get_fmt op is
> called. So lockdep sees the source locked first, then the sink.
> 
> Later, when the streaming is started, the sink's s_stream op is called,
> which probably takes the subdev's lock. The op then calls the source's
> s_stream, which takes the source's lock. So, the sink is locked first,
> then the source.
> 
> Note that link validation and stream starting is not done at the same
> time, so an actual deadlock should never happen. However, it's still a
> clear bug.
> 
> Fix this by locking the subdev states only if both subdevs support
> state. In other words, we have two scenarios:
> 
> 1. Both subdevs support state. Lock sink first, then source, and keep
>    the locks while validating the link.
> 2. At least one of the subdevs do not support state. Take the lock only
>    for the duration of the operation (get_fmt or looking at the
>    routing), and release after the op is done.
> 
> Obviously 1. is better, as we have a more consistent view of the states
> of the subdevs during validation. 2. is how it has been so far, so it's
> no worse than this used to be.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for the patch, Tomi!

I'll add this to my next fixes PR, probably tomorrow, unless there are
objections. I don't think this is a false positive: the same locks may well
be used for the same purpose in different video nodes.

-- 
Terveisin,

Sakari Ailus
