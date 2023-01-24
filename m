Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434836795EC
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 12:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233420AbjAXLBn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 06:01:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjAXLBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 06:01:21 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046946A6A
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 03:01:21 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324945686"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="324945686"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 03:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="786040664"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="786040664"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2023 03:01:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKH3C-00EIr1-2e;
        Tue, 24 Jan 2023 13:01:14 +0200
Date:   Tue, 24 Jan 2023 13:01:14 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/57] media: atomisp: Big power-management changes +
 lots of fixes
Message-ID: <Y8+6euqoTP0GtlMN@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:08PM +0100, Hans de Goede wrote:
> Hi All,
> 
> Here is another set of patches resulting from my continued work
> on cleaning up / improving the atomisp driver.
> 
> The main changes here are power-management related, divided
> into 2 sets:
> 
> 1. Move the pm of the core atomisp device to its own custom PM
>    domain. We turn the ISP on/off through the P-Unit and when
>    off the PCI subsystem resume method complains about the PCI
>    config space not being reachable. Changing to a custom PM
>    domain fixes the logs getting filled with PCI subsys errors
>    on every open of a /dev/video# node
> 
> 2. Except for devices shipped with Android as factory image,
>    all the DSDTs I have seen have proper ACPI pm code for
>    the sensors. So we really should be using ACPI pm for this.
> 
>    This series contains a lot of ov2680 patches, including
>    reworking the controls (so that control changes can be
>    delayed to stream on time instead of directly trying to do
>    i2c writes to the turned off sensor). Basically modernizing
>    the ov2680 driver a lot (there are still some atomisp-isms left).
> 
>    And then finally after all the ov2680 cleanups it moves
>    the ov2680 code over to using runtime-pm + ACPI pm,
>    dropping all the direct PMIC + clk poking done by the
>    atomisp_gmin_platform code.
> 
> Besides that this also contains quite a few other fixes / cleanups
> for things which I encountered during the way and it contains the
> start of making the ov2722 driver work. With the changes present
> in that driver I get a working (but very dark) stream. I expect
> that once I add a proper exposure control this will start working

The non-commented patches were reviewed, but I'm not so familiar with the
details of the functionality of the PM parts there. So I left them for others
to review.

-- 
With Best Regards,
Andy Shevchenko


