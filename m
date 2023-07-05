Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89EA74824A
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 12:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjGEKij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 06:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbjGEKic (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 06:38:32 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D56DD
        for <linux-media@vger.kernel.org>; Wed,  5 Jul 2023 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688553511; x=1720089511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=99lgW8SwOeL+XxXAf4/JYC3hXb/PjBWLwMs5m5FZZyE=;
  b=iIFs5u5mjUBRcKTOvDWD5pqmyIRwR0l+Uh6Qec/1592c4N0+XB3hcYpv
   UyJCZZFdLGZzooHBiztA5tkvJ1dEZg5KHvtb/D9N0bIrsYlvR3i7hvGUr
   jE/pSQvLzD2IBg4A2XjNrprHECYIXcATsfUOqoAmacEfHbEiuTHrjtmkx
   oidjbaDmm6pMtjSdjllTXsZ4Yxw48oQMzSiGSSsqRQ9WJLRcVqWNCMP42
   0bZcjrrBSTiKSUpcgeDvOLYcXKKJ+vwDNyQVaB9xUcabj/sWOX7ujG2F9
   XwCVKk2Iy7pmfegNRHdKhMwhvW+ssRbeB4EJxRHz2UiJPjvm19Zs2JUSo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="348095296"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="348095296"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="784492889"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="784492889"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:38:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 67C5D11FB8E;
        Wed,  5 Jul 2023 13:38:25 +0300 (EEST)
Date:   Wed, 5 Jul 2023 10:38:25 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 13/15] media: atomisp: csi2-bridge: Switch to new
 common ipu_bridge_init()
Message-ID: <ZKVIIVCNKHebrnt1@kekkonen.localdomain>
References: <20230630110643.209761-1-hdegoede@redhat.com>
 <20230630110643.209761-14-hdegoede@redhat.com>
 <CAHp75Vcp9aoKOw-gPeXvJ9VuO5nGN=g5HHjAxWwNyNzo6J2Amw@mail.gmail.com>
 <26ce49af-1267-0a9d-5eb7-f15a94395328@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26ce49af-1267-0a9d-5eb7-f15a94395328@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Tue, Jul 04, 2023 at 09:21:47PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 6/30/23 16:45, Andy Shevchenko wrote:
> >> +       sensor->lanes = gmin_cfg_get_int(adev, "CsiLanes", lanes);
> >> +       if (sensor->lanes > IPU_MAX_LANES) {
> >> +               dev_err(&adev->dev, "Invalid lane-count: %d\n", sensor->lanes);
> > 
> > Yeah, I think we would be consistent in using the ACPI handle to print
> > the messages from ACPI sensor devices.
> 
> I do agree that we need to be consistent, but I regret having switched
> to using the handle for this in the csi2-bridge code. The dmesg logs
> this results in are much harder to read. Most devices typically have
> 2 different sensors and normally it is quite easy to see in the logs
> which GPIOs, etc. are being used for the sensor.
> 
> But after the move to using the ACPI handle for logging the logs
> show up prefixed with \_SB_.I2C2.CAM8 resp CAM2 rather then with
> OVTI2680 and INT0310 making it much harder to figure on what
> is going on (first need to do
> "cat /sys/bus/i2c/devices/i2c-OVTI2680:00/firmware_node/path"
> to find out which path belongs to which sensor).

In cases such as the above, the developer probably needs to address issues
not in the sensor driver but in the ACPI tables (or in IPU bridge code). So
for this reason I'd prefer printing the device path instead of the HID
(which is also somewhat opaque).

> 
> So I would rather get rid of the handle based logging, because it
> is very cumbersome to use.

The V4L2 async and fwnode frameworks use handles, too, for the same reason.

That said, I don't mind printing device names either. AFAIR Laurent
actually proposed that recently for the V4L2 fwnode and even promised to
send a patch. :-)

> 
> I'll add an extra patch to the next version of the set to switch all
> the logging to using the acpi_device for logging.

-- 
Kind regards,

Sakari Ailus
