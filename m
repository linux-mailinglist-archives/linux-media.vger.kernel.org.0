Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 338286EC1C5
	for <lists+linux-media@lfdr.de>; Sun, 23 Apr 2023 21:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjDWTO1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Apr 2023 15:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjDWTO0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Apr 2023 15:14:26 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269D810E6
        for <linux-media@vger.kernel.org>; Sun, 23 Apr 2023 12:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682277264; x=1713813264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4EuPyPRKAJqWnktnovJ1eMth7WlvvOyqOkfKohaWRpI=;
  b=JAnxn9rr+BEuVu2EVYkFIlPLG8strC2ygp0j/zXxKI0Mmw4jk9xM0D/e
   zlWYmKo7TzzC7uVZQVjq/Lj9hY0ZIDFEYsW3xCIpfwaHolrPJmWDJWu0B
   7c0Ba3JmdpxxQkZc9YhtQghaS7MVHgRwB0f0c7abX0BQPjAzzDmiKvXQh
   9xId7NqSFYkAgfPNkTCsg7pPYlV3JPUI7/tvEgmarMJdh0NtHRag0CcH6
   XiCbJXdjiUjPqc2DguooVkWQdDHxJliMbVtSWsHMgf6HTXiIT3kvVfZzg
   WgXHHbjAeK5MPikYJxnavHLM+n+cd3CzKW5BgkNk5U971h41CXulSEcWw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="374253306"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="374253306"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 12:14:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="695514323"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="695514323"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 12:14:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 2CEFF11FAD0;
        Sun, 23 Apr 2023 22:14:19 +0300 (EEST)
Date:   Sun, 23 Apr 2023 22:14:19 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     hdegoede@redhat.com, djrscally@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH v5 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <ZEWDixTP7/LUXqk6@kekkonen.localdomain>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
 <1681096465-17287-2-git-send-email-wentong.wu@intel.com>
 <ZEVkMAAaarg91gRs@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEVkMAAaarg91gRs@kekkonen.localdomain>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Apr 23, 2023 at 08:00:32PM +0300, Sakari Ailus wrote:
> On Mon, Apr 10, 2023 at 11:14:23AM +0800, Wentong Wu wrote:
> > diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
> > new file mode 100644
> > index 0000000..9535ac1
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ivsc/Kconfig
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# Copyright (C) 2023, Intel Corporation. All rights reserved.
> > +
> > +config INTEL_VSC
> > +	tristate "Intel Visual Sensing Controller"
> > +	depends on INTEL_MEI
> 
> I think I requested to depend on PM in an earlier review, didn't I?

Scratch that --- the driver requests ownership of ACE to host, so this is
fine.

-- 
Sakari Ailus
