Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 873ED6EC14A
	for <lists+linux-media@lfdr.de>; Sun, 23 Apr 2023 19:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjDWRGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Apr 2023 13:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjDWRGn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Apr 2023 13:06:43 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46309E7
        for <linux-media@vger.kernel.org>; Sun, 23 Apr 2023 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682269602; x=1713805602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ymiOkYivMUG2nSIVEcj6ORoaoZJf79UsiHqMpky+coo=;
  b=bhOaa9JS7DvSzoE/5LIw+Id0sk4MwlhJwscS+PHWLvR8zmJL4rxRKESE
   ClWavnLjsw3Hw6GvDVDBrydHsyUGSaJsRJrVMdMatLOWB/noo8Hgv57AS
   404I3dZOEv/2EecBxAINWGJ5Er7rvoGOQa3UYtyAkLDaJSgqH+up2MP0s
   LDz5GpDQUB953LC05UIqdULN2tuH040wemb3QkrLT8Up5gwwZNTXCWS5N
   jUm1/q2WCLMP9wnjeCGNAb5WzgRgsZKBnYHhPM0OvWMDxVaetCoeF4I0v
   hU/WoH7+0RyQnRcj/8dnS4kRXDc8Bapb9ebQk91pR5VYmEiCIpeH0P6pS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="346321344"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="346321344"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 10:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="816986072"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; 
   d="scan'208";a="816986072"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 10:06:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1AF2F11FAD0;
        Sun, 23 Apr 2023 20:00:32 +0300 (EEST)
Date:   Sun, 23 Apr 2023 20:00:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     hdegoede@redhat.com, djrscally@gmail.com,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH v5 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <ZEVkMAAaarg91gRs@kekkonen.localdomain>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
 <1681096465-17287-2-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681096465-17287-2-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 10, 2023 at 11:14:23AM +0800, Wentong Wu wrote:
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

I think I requested to depend on PM in an earlier review, didn't I?

-- 
Sakari Ailus
