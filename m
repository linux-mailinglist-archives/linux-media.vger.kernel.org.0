Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6577874418A
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 19:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbjF3RrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 13:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbjF3RrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 13:47:08 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC2630C5
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688147228; x=1719683228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fW7VfQ0Y4PioIhA6B7VBxWOqB07TtlqsA3+z2rEpWHc=;
  b=VsgLtFTS4a0k3uOxM2emsJKKdKiXPNdNV+4F3WxU3Aeu61S70xfOcJ/R
   LZ6IZxYXqCGW24FeY7p3w296Y6texQfX04PUEOScdcnSmPwDVpGDB+qxa
   tYIO/Tb1RCwzY6fXnSpUyILl0c6l5jBwU6bZ/e0xwnTzAmX1rsY00f0U9
   TsAdPEwniA6dgzxtJPMxUXTKvxn8DaxUY2NDsZIu6ICfWD+gqHdz1wSdA
   q+mZKFsaKtvytG9cmHTVo4kCzFQIRMFhBc7ClY6PNeSZSn7wzYBuLjE2q
   D/u0QT2Ke1lhwd/7njIwyhKnbJMuGZBRoEFOmueTlY8+PyiiIku9Te9nN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="352274428"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="352274428"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 10:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="862363103"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="862363103"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2023 10:46:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qFICo-001AYz-1X;
        Fri, 30 Jun 2023 20:46:50 +0300
Date:   Fri, 30 Jun 2023 20:46:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/2] media: ipu-bridge: Make exported IPU bridge
 symbol GPL-only in a NS
Message-ID: <ZJ8VCe0LKdGxLcpb@smile.fi.intel.com>
References: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
 <20230630134506.109269-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630134506.109269-3-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 30, 2023 at 04:45:06PM +0300, Sakari Ailus wrote:
> Switch to EXPORT_SYMBOL_NS_GPL() on ipu_bridge_instantiate_vcm(). The rest
> of the ipu bridge symbols are this way already.

Hmm... This actually changes the license, Why is it initially non-GPL and what
are the consequences of this change?

...

> -EXPORT_SYMBOL(ipu_bridge_instantiate_vcm);
> +EXPORT_SYMBOL_NS_GPL(ipu_bridge_instantiate_vcm, INTEL_IPU_BRIDGE);

-- 
With Best Regards,
Andy Shevchenko


