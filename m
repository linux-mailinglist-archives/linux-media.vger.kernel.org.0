Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E49163D3FA
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 12:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbiK3LIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 06:08:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233049AbiK3LIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 06:08:05 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E10519C2F;
        Wed, 30 Nov 2022 03:08:02 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295732425"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="295732425"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 03:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="594624621"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="594624621"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2022 03:07:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p0KwH-002E8A-2d;
        Wed, 30 Nov 2022 13:07:41 +0200
Date:   Wed, 30 Nov 2022 13:07:41 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/6] ov5693/int3472: Privacy LED handling changes + IPU6
 compatibility
Message-ID: <Y4c5fTzJbn3x0SKu@smile.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129231149.697154-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 30, 2022 at 12:11:43AM +0100, Hans de Goede wrote:
> Hi All,
> 
> The out of tree IPU6 driver has moved to using the in kernel INT3472
> code for doing power-ctrl rather then doing their own thing (good!).
> 
> Some of the IPU6 devices with a discrete INT3472 ACPI device have a
> privacy-led GPIO. but no clk-enable GPIO. To make this work this series
> moves the privacy LED control from being integrated with the clk-provider
> to modelling the privacy LED as a separate GPIO. This also brings the
> discrete INT3472 ACPI device privacy LED handling inline with the privacy
> LED handling for INT3472 TPS68470 PMIC devices which I posted here:
> 
> https://lore.kernel.org/platform-driver-x86/20221128214408.165726-1-hdegoede@redhat.com/
> 
> This obsoletes my previous "[PATCH 0/3] platform/x86: int3472/discrete:
> Make it work with IPU6" series:
> 
> https://lore.kernel.org/platform-driver-x86/20221124200007.390901-1-hdegoede@redhat.com/
> 
> Mauro since laptops with IPU6 cameras are becoming more and more
> popular I would like to get this merged for 6.2 so that with 6.2
> users will be able to build the out of tree IPU6 driver without
> requiring patching their main kernel. I realize we are a bit
> late in the cycle, but can you please still take the ov5693 patch
> for 6.2 ? It is quite small / straight-forward and since it used
> gpiod_get_optional() it is a no-op without the rest of this series.
> 
> This series has been tested on:
> 
> - Lenovo ThinkPad X1 Yoga gen 7, IPU6, front: ov2740 with privacy LED
> - Dell Latitude 9420, IPU 6 with privacy LED on front
> - Mirosoft Surface Go, IPU3, front: ov5693 with privacy LED,
>                               back: ov8865 with privacy LED

FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
assuming nit-picks will be addressed as agreed.

-- 
With Best Regards,
Andy Shevchenko


