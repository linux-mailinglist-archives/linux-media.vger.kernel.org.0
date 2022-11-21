Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3521632FA6
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 23:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKUWRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 17:17:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbiKUWRE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 17:17:04 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7D0D9BB2
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 14:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669069024; x=1700605024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GpAppdyKdK4EFtlnJ8FG5s4G2mPU7d38lH3jhR1qsDg=;
  b=N7B9chvEJGINUtNiJTmoD9jKbUUdo7bZaDIxzD8xTqc69IhwMCv/Cylr
   81O5mRKMaMZ7uBbayoQa7/w52gNJAnZHT6EFMwxge4zpPWdOvhI69MTWq
   cRWWxmBLN5Qjveok4fPVUxgkd4Cf4QXP1PPNXhD0CujKpIZTx0uZlFeVg
   R0WkY4wLdj27LbVFDhazgO5LhZXROXxGhqvm+y0RwALl8xdv8bWfnLTgQ
   jCVKwUIi3shApMDPCLj0Xo+3Hiv1bxB60uBGNiH4Vafkd4cZsfiawuhHG
   ckEvOtM7SnKmW8viO3bwxuQqwJG0deN+CXzK8QQAYonA2/WZprlTNR1x9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="311304402"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="311304402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 14:17:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="783609800"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; 
   d="scan'208";a="783609800"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 14:17:02 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8C17F20207;
        Tue, 22 Nov 2022 00:17:00 +0200 (EET)
Date:   Mon, 21 Nov 2022 22:17:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Shawn Tu <shawnx.tu@intel.com>
Subject: Re: [PATCH 1/1] ov08x40: remove() now returns void
Message-ID: <Y3v43DaT/tZxD16B@paasikivi.fi.intel.com>
References: <20221121173453.24250-1-sakari.ailus@linux.intel.com>
 <166905361555.50677.4109012115533689827@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166905361555.50677.4109012115533689827@Monstersaurus>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Mon, Nov 21, 2022 at 06:00:15PM +0000, Kieran Bingham wrote:
> Hi Sakari,
> 
> Quoting Sakari Ailus (2022-11-21 17:34:53)
> > The return type of the driver's remove() callback is now void. This driver
> > got merged while the return type got changed tree-wide. Fix this.
> > 
> > Fixes: 38fc5136ac16 ("media: i2c: Add ov08x40 image sensor driver")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Kieran: Mon, 21 Nov 2022 17:34:47 +0000
> Sakari: Mon, 21 Nov 2022 19:34:53 +0200
> 
> Aha, so I got my v1 out 6 seconds before you ;-) Quite the tense race
> ...
> 
> But I'll not worry - yours is probably already in your tree, so:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks!

The SMTP standard does not define what time the Date: header signifies, it
could have been set by the sender or another server later on... but in this
case git send-email probably set it in both cases.

I haven't pushed my tree to linuxtv.org yet and yours has a better commit
message so I'll take it instead.

-- 
Sakari Ailus
