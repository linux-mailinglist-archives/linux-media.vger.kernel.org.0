Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78027D3CF9
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 19:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjJWRCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 13:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjJWRCA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 13:02:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA298100
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698080517; x=1729616517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CsOsX6+qic9aJ79GgOkYx46yXzdzv4rqChntMmcmajU=;
  b=D5I0EfZD3+JEck+PXZlKyN3lCWcQb+tnVTUjV7nY40y3TDvG67G4otCy
   DOyvdcHbeTKDWh6f3xuKbP60/8xMogbP2j7zaGNiGv8fX1Y6/7K+NplfY
   cz1yNr78eraN+YxyiBgQDfA8sIYyXBT8DmGufbmNbIsWBAE4DJeXX6khb
   BzAWMa3OXwYstovcZkaPlNaqjkhHic1VkCUiO/0can8YI6LiX87FW0xRR
   BOXcTP1geqg+uRJTmj8Rp7tP+wG3fs/ynaIQQhj/GEBAJmWAf2xRYyi/x
   7geg9i+DCT4wbM2eRojBFCi3+9T6riFpGbQxiJs9nuSkBD06Fpmqg4svk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="384083736"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="384083736"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="931750788"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="931750788"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 10:01:51 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id F366511F82E;
        Mon, 23 Oct 2023 20:01:48 +0300 (EEST)
Date:   Mon, 23 Oct 2023 17:01:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 1/6] media: v4l: subdev: Also return pads array
 information on stream functions
Message-ID: <ZTam_G4AAjgZ6Euw@kekkonen.localdomain>
References: <20231023123308.782592-1-sakari.ailus@linux.intel.com>
 <20231023123308.782592-2-sakari.ailus@linux.intel.com>
 <20231023132902.GQ3336@pendragon.ideasonboard.com>
 <20231023140845.GC13234@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023140845.GC13234@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Oct 23, 2023 at 05:08:45PM +0300, Laurent Pinchart wrote:
> > > +		if (WARN_ON(pad >= state->sd->entity.num_pads))
> 
> There's no sd field in struct v4l2_subdev_state in the linux media
> master branch, no mention of dependencies in the cover letter, and no
> specified base.
> 
> Please generate patch series with --base.

That wouldn't help.

But I've realised what the problem is. I forgot to include the first patch.
There were six patches, but one added made that seven...

I'll send v3, addressing comments found in v2.

-- 
Sakari Ailus
