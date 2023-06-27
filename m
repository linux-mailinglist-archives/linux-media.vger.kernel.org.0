Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E1474056E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 23:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjF0VEt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 17:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjF0VEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 17:04:42 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7056510F0
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 14:04:41 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="364228794"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="364228794"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 14:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="751912201"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="751912201"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 27 Jun 2023 14:04:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qEFrY-000QLb-2V;
        Wed, 28 Jun 2023 00:04:36 +0300
Date:   Wed, 28 Jun 2023 00:04:36 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 00/12] media: intel-cio2-bridge: Add shared
 intel-cio2-bridge code, rework VCM instantiation
Message-ID: <ZJtO5Lgd511lqJoj@smile.fi.intel.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627175643.114778-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 27, 2023 at 07:56:30PM +0200, Hans de Goede wrote:
> Hi All,
> 
> While working on adding (proper) VCM support to the atomisp code
> I found myself copying yet more code from
> drivers/media/pci/intel/ipu3/cio2-bridge.c into the atomisp code.
> 
> So I decided that it really was time to factor out the common code
> (most of the code) from intel/ipu3/cio2-bridge.c into its own
> helper library and then share it between the atomisp and IPU3 code.
> 
> This will hopefully also be useful for the ongoing work to upstream
> IPU6 input system support which also needs this functionality and
> currently contains a 3th copy of this code in the out of tree driver.

I like the idea.
Some nit-picks here and there, but in general
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> This set consists of the following parts:
> 
> Patch 1     A bugfix for a recent change to the cio2-bridge code
> Patches 2-8 Cleanup / preparation patches
> Patch 9     Move the main body of the cio2-bridge.c code into
>             a new shared intel-cio2-bridge module
> Patch 10    Drop cio2-bridge code copy from atomisp, switching to
>             the shared intel-cio2-bridge module
> Patch 11    Rework how VCM client instantiation is done so that
>             a device-link can be added from VCM to sensor to
>             fix issues with the VCM power-state being tied to
>             the sensor power state
> Patch 12    Example patch to show how patch 11 avoids the need
>             for hacks in VCM drivers caused by the shared power state
>             (not intended for merging)
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (12):
>   media: ipu3-cio2: Do not use on stack memory for software_node.name
>     field
>   media: ipu3-cio2: Move initialization of node_names.vcm to
>     cio2_bridge_init_swnode_names()
>   media: ipu3-cio2: Make cio2_bridge_init() take a regular struct device
>     as argument
>   media: ipu3-cio2: Store dev pointer in struct cio2_bridge
>   media: ipu3-cio2: Only keep PLD around while parsing
>   media: ipu3-cio2: Add a cio2_bridge_parse_sensor_fwnode() helper
>     function
>   media: ipu3-cio2: Add a parse_sensor_fwnode callback to
>     cio2_bridge_init()
>   media: ipu3-cio2: Add supported_sensors parameter to
>     cio2_bridge_init()
>   media: ipu3-cio2: Move cio2_bridge_init() code into a new shared
>     intel-cio2-bridge.ko
>   media: atomisp: csi2-bridge: Switch to new common cio2_bridge_init()
>   media: intel-cio2-bridge: Add a runtime-pm device-link between VCM and
>     sensor
>   [RFC] media: dw9719: Drop hack to enable "vsio" regulator
> 
>  MAINTAINERS                                   |   9 +
>  drivers/media/common/Kconfig                  |   4 +
>  drivers/media/common/Makefile                 |   1 +
>  drivers/media/common/intel-cio2-bridge.c      | 464 ++++++++++++++++++
>  drivers/media/i2c/dw9719.c                    |  27 +-
>  drivers/media/pci/intel/ipu3/Kconfig          |   1 +
>  drivers/media/pci/intel/ipu3/cio2-bridge.c    | 464 +++---------------
>  drivers/media/pci/intel/ipu3/cio2-bridge.h    | 146 ------
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |   7 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   7 +-
>  drivers/staging/media/atomisp/Kconfig         |   2 +
>  .../staging/media/atomisp/pci/atomisp_csi2.h  |  67 ---
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   | 307 ++----------
>  include/media/intel-cio2-bridge.h             | 105 ++++
>  14 files changed, 723 insertions(+), 888 deletions(-)
>  create mode 100644 drivers/media/common/intel-cio2-bridge.c
>  delete mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
>  create mode 100644 include/media/intel-cio2-bridge.h
> 
> -- 
> 2.41.0
> 

-- 
With Best Regards,
Andy Shevchenko


