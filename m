Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20996793A2A
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 12:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjIFKoo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 06:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbjIFKoo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 06:44:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCA01987
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 03:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693997037; x=1725533037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VwvHiI+HfevYjiZd5q9Rq0I9DBaavh4UE2Qbcc+dgY0=;
  b=MybwsSqJcB1qfTZ/Op1sLCQZCRizj6EBo3W0BWQX/xi6ZvzOrVd4XWX1
   3ZOo0p8SxyOR05l50wqC7cmTHkksbTUPZohVxkSQqX+/9X4QfUi5vGISJ
   JxFt2IXrTW4wrc3f/Cb+gLSkNMXjA9ShQGBF6xtn40VqxRD84+yneL72o
   0NvfcvFjeKBxso6nGHIgxkTc00o2USKcJgmUPs0mpf340mevmFONpuzYA
   Rxqz3iBU+2JB/8sjwBDLjyDMaiYfiOvJCHYmU1id5ZiSALhISZdMXE9VK
   s9s++ZquMjbdhmHeruEyhsLlGWvDwCjSUnzeY+ZXxxtGow4+k7PFcyRO0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="443424220"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="443424220"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915216942"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="915216942"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 03:43:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 7878111FC2C;
        Wed,  6 Sep 2023 13:43:34 +0300 (EEST)
Date:   Wed, 6 Sep 2023 10:43:34 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [v4l-utils PATCH 1/1] utils: libv4l2subdev: Set stream for
 g_routing
Message-ID: <ZPhX1ubYfEXi6ldO@kekkonen.localdomain>
References: <20230906094923.1447570-1-sakari.ailus@linux.intel.com>
 <15361ac5-8c1b-fce1-f101-ab9d83f21abb@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15361ac5-8c1b-fce1-f101-ab9d83f21abb@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 06, 2023 at 01:28:00PM +0300, Tomi Valkeinen wrote:
> On 06/09/2023 12:49, Sakari Ailus wrote:
> > Set the stream field for g_routing. This was missed in the original patch
> > adding support for streams.
> 
> I think you mean g_selection, in both the subject and desc.

Good point. I was thinking of routing but it's indeed about selection, as
in the patch. I'll send v2.

> 
> Other than that:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks!

-- 
Sakari Ailus
