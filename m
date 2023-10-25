Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA087D7669
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 23:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjJYVLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 17:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjJYVLa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 17:11:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B2712A
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 14:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698268288; x=1729804288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/rQJC8zBOJF99dOyqtN20wVl41/rl8NDKwxlLYUGTE=;
  b=UhWlBstV9F41WMrl4nNQzwo4PEX2Uofg6FL4QEQwMi6qiRluhMz+wHyA
   V5ynCeMCDOCVNvQfi/EExUb0QWofj1SDRo8PGB07hsCZy9WlrbF+VtE39
   85lVB51O0zlLlOsfNOKLUAHKSsf9A/5y8i4b80dj3SxNipSP9TOXtSdOg
   joSqpTW2zi1rsWOxoHcoxlvkOLVZ7/tr/f0KpZi396zt7qCon90DhJO9q
   Y7IoOr0ffuJ6x4kmtv5b1yxntrUSB4wWDy6xRYMm4UJ3n05BPk9CW1RbS
   ZYQMu59m+gglclPG8xkpNm9GdCu+gyy1g6VSQJMzv/oIrgBY3t3D6FTCw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367613528"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="367613528"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752472960"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="752472960"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:11:25 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1CFE811F758;
        Thu, 26 Oct 2023 00:05:46 +0300 (EEST)
Date:   Wed, 25 Oct 2023 21:05:46 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 14/28] media: v4l: subdev: Move G_ROUTING handling
 below S_ROUTING
Message-ID: <ZTmDKszO9VqchuiZ@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-5-sakari.ailus@linux.intel.com>
 <92176362-7127-45a3-a436-c4068885c7ce@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92176362-7127-45a3-a436-c4068885c7ce@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Mon, Oct 09, 2023 at 01:36:46PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 15:07, Sakari Ailus wrote:
> > Move G_ROUTING IOCTL handling below that of S_ROUTING. G_ROUTING
> > implementation will soon needed in handling S_ROUTING as well.
> 
> There's probably a "be" missing in the above text. Also, it's a bit unclear
> on why this is needed. You could say it'll allow switch-case fall-through.

I'll drop this patch as it seems it won't be needed after all: [GS]_ROUTING
will remain separate.

-- 
Sakari Ailus
