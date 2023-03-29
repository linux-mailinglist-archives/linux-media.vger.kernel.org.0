Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3104F6CD531
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 10:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbjC2IvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 04:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbjC2IvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 04:51:05 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEDF468E
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 01:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680079836; x=1711615836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ATgckzeED5+ArBvVGtX19bqEKmGsVkxbWINdw1QdKiA=;
  b=Af+hD9d34CopPSXBcA90Ox9wPlS8q7aylmjHKCCn7op56SRQFgFcZOg3
   fNEwuoFTJnC6zFpdqNERuvkz3M2jbi242/12bavmcsHRZVEmfzm3kISgX
   6lkeuevOvmTZ1HmjbgDVAncEYDmDYDZVD+0oE+luNLcsWX+tgLg3Bsv7E
   fH8R1hC5ggNf2s2x13jzlfOanAgQeaJVkFQ+5yfO/UMdhaoG67C9xKomm
   5QZviOc0GOLLK1oxpeOkd4OurfE0MVawknLP/6bPNj0Wv3g9ER7+qc6NJ
   Cnt7ZfoV2PI3sZKyJfFyWtxAoCGHbtlpva+RXSETVsRUvJJQyW7cmG6m1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405763703"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="405763703"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 01:50:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="677713238"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="677713238"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 01:50:01 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E202F1224D2;
        Wed, 29 Mar 2023 11:49:58 +0300 (EEST)
Date:   Wed, 29 Mar 2023 11:49:58 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     hdegoede@redhat.com, djrscally@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH v3 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <ZCP7trUzn8cQ01F9@kekkonen.localdomain>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-2-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679898188-14426-2-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Wentong,

On Mon, Mar 27, 2023 at 02:23:06PM +0800, Wentong Wu wrote:
> diff --git a/drivers/media/pci/intel/ivsc/Kconfig b/drivers/media/pci/intel/ivsc/Kconfig
> new file mode 100644
> index 0000000..9535ac1
> --- /dev/null
> +++ b/drivers/media/pci/intel/ivsc/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright (C) 2023, Intel Corporation. All rights reserved.
> +
> +config INTEL_VSC
> +	tristate "Intel Visual Sensing Controller"
> +	depends on INTEL_MEI

I think you should depend on PM here.

Alternatively, request host ownership from ace + csi in probe() if runtime
PM isn't enabled.

> +	help
> +	  This adds support for Intel Visual Sensing Controller (IVSC).
> +
> +	  Enables the IVSC firmware services required for controlling
> +	  camera sensor ownership and CSI-2 link through Image Processing
> +	  Unit(IPU) driver of Intel.

-- 
Kind regards,

Sakari Ailus
