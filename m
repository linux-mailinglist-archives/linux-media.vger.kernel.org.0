Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B5E7D7C33
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 07:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbjJZF13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 01:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjJZF11 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 01:27:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372C6DE
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 22:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698298046; x=1729834046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9s9++6D5HSYjpIVZC+kyLE4T94fSdbYYE9aJcIJNdqo=;
  b=VqLw2CXJP3WH4HjrhMSRDcCEDjW/LustG65pcEGJP2UTlJF44prkklzy
   9XOCH2yNZ6y3i1sT0s3JHyf30jeFfmpnEbDp+d5rzd3ku0tfI6z8MUxUi
   By/9ETWwHjv0GegxIB/p/hlHiIPQUu+saGhFKc7Vc5ksL6PVKDRLSg2Wy
   vrILokRAF+/V2CytgsBd0fnLj1jnn3/iwLim+rlUcJ0t1nH57PkMH/9ri
   CHlwDpm9fXoOy416lC6thDCjdTSIZK57XB8JZUrIY8wZPA1SF3oc488EQ
   56flelhZ1IOGmkTfhhTAU4aNQyu/Gd4vSCjST5iiI+yZVmd5+ZQsSwlrN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="384669058"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="384669058"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 22:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="708940674"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="708940674"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 22:27:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 355BA11F89D;
        Thu, 26 Oct 2023 08:27:19 +0300 (EEST)
Date:   Thu, 26 Oct 2023 05:27:19 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com,
        andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 15/15] Documentation: add documentation of Intel IPU6
 driver and hardware overview
Message-ID: <ZTn4t_ppoUN8hgqt@kekkonen.localdomain>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-16-bingbu.cao@intel.com>
 <ZTkFXRwqyU8J8JDT@kekkonen.localdomain>
 <ec426b3d-e13f-8a9e-c207-ae189de1101c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec426b3d-e13f-8a9e-c207-ae189de1101c@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Oct 26, 2023 at 11:38:14AM +0800, Bingbu Cao wrote:
> Sakari,
> 
> Thanks for the review.
> 
> On 10/25/23 8:09 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > Thanks for the patch. It's a nice piece of documentation for the most
> > complex CSI-2 receiver driver. :-)
> > 
> > On Tue, Oct 24, 2023 at 07:29:24PM +0800, bingbu.cao@intel.com wrote:
> >> From: Bingbu Cao <bingbu.cao@intel.com>
> >>
> >> Add a documentation for an overview of IPU6 hardware and describe the main
> >> the components of IPU6 driver.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> ---
> >>  .../driver-api/media/drivers/index.rst        |   1 +
> >>  .../driver-api/media/drivers/ipu6.rst         | 205 ++++++++++++++++++
> >>  2 files changed, 206 insertions(+)
> >>  create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
> >>
> >> diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
> >> index c4123a16b5f9..7f6f3dcd5c90 100644
> >> --- a/Documentation/driver-api/media/drivers/index.rst
> >> +++ b/Documentation/driver-api/media/drivers/index.rst
> >> @@ -26,6 +26,7 @@ Video4Linux (V4L) drivers
> >>  	vimc-devel
> >>  	zoran
> >>  	ccs/ccs
> >> +	ipu6
> >>  
> >>  
> >>  Digital TV drivers
> >> diff --git a/Documentation/driver-api/media/drivers/ipu6.rst b/Documentation/driver-api/media/drivers/ipu6.rst
> >> new file mode 100644
> >> index 000000000000..2685e4a0d7ba
> >> --- /dev/null
> >> +++ b/Documentation/driver-api/media/drivers/ipu6.rst
> >> @@ -0,0 +1,205 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +==================
> >> +Intel IPU6 Driver
> >> +==================
> >> +
> >> +Author: Bingbu Cao <bingbu.cao@intel.com>
> >> +
> >> +Overview
> >> +=========
> >> +
> >> +Intel IPU6 is the sixth generation of Intel Image Processing Unit used in some
> >> +Intel Chipsets such as Tiger Lake, Jasper Lake, Alder Lake, Raptor Lake and
> >> +Meteor Lake. IPU6 consists of two major systems - Input System (IS) and
> > 
> > I'd use a semicolon:				  ^
> 
> semicolon or colon? :)

A colon, yes, indeed.

-- 
Regards,

Sakari Ailus
