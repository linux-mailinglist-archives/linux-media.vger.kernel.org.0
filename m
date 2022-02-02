Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191124A74C8
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 16:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345516AbiBBPld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 10:41:33 -0500
Received: from mga07.intel.com ([134.134.136.100]:39227 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233663AbiBBPld (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Feb 2022 10:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643816493; x=1675352493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+XL8sWExGlCQGYkjQU1CnSiqHxTBUAUpqgt+jvAsg64=;
  b=UxQFLGV89xpcqZ4uItwswAPTjpAFGbUrXbXzKWcPcEeFSDH318sEGWtT
   VsrGFssX/HNDiSeRRmR+wbt7dlYXUjnR/osMby+kBKNrwVrQ8cIM+WjH/
   AEN9uBJnl+S1ynUMKi+QeL4xE2WJmdm3YyDMEAn9SJR1E/h9P+lIm52am
   hHBeiXtYF0MmO24b7dpH6jgVQiiKstpD4gPSfkjiwgRJV7fia4STypz3r
   SuJYyI1MK0KsxALaaMaJUkwiwFVln37HCbcmq4nkJ7qtWCA7CyA2Os9kB
   5STXSJM8qUvBV3pVOOX3WxFT4YwfNNkx+kSZqpvyYPljIB0UzMo1626R/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="311249800"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="311249800"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 07:36:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="698929339"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 07:36:11 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id CCDC520482;
        Wed,  2 Feb 2022 17:36:08 +0200 (EET)
Date:   Wed, 2 Feb 2022 17:36:08 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: ov08d10: Unlock on error in
 ov08d10_enum_frame_size()
Message-ID: <Yfqk6HYZalUyAWPW@paasikivi.fi.intel.com>
References: <20220202141121.238930-1-sakari.ailus@linux.intel.com>
 <YfqWzIyK+dX4+AVf@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfqWzIyK+dX4+AVf@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Feb 02, 2022 at 04:35:56PM +0200, Laurent Pinchart wrote:
> On Wed, Feb 02, 2022 at 04:11:21PM +0200, Sakari Ailus wrote:
> > From: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > This error path needs to drop the mutex to avoid a deadlock.
> > 
> > Fixes: 7be91e02ed57 ("media: i2c: Add ov08d10 camera sensor driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> I want RAII in C :-)
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Oops. This wasn't the patch I intended to send. But thanks for the
Reviewed-by: nonetheless. :-)

-- 
Sakari Ailus
