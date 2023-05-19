Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B3B709063
	for <lists+linux-media@lfdr.de>; Fri, 19 May 2023 09:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjESHcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 May 2023 03:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjESHcG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 May 2023 03:32:06 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D27E0
        for <linux-media@vger.kernel.org>; Fri, 19 May 2023 00:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684481525; x=1716017525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MxfzHP1Or4QpjMycJ2Hc0O1YWboJ3/Dhj1hz8mps+IA=;
  b=k4SO9GwEB+JRu/fLTuHOjXk9c+qSnqEUW5hxvPmbincygF9ZxJDiCtwl
   axJPWs8bSH0ixtgUFocV5WQABMWg9+4JNEuWx+x79IK2FkcSeuQZJlW8H
   OlDGp6u/RrbRF14uKWiqqfsppDpW/8+0HCBZVdRmwWGm/LHxfeGRXv7FV
   5U7kWggWrqHNLZfsdTviwNQT2BK3gp7ks+6iZS2lHZoC4GztIMzNVn3J9
   VlM/GlFzDpG/C22q/5kBea9HMLYW7epSENofIzA0TNRBRcYFzgSttBmVg
   5hu6mjzH5jfevOxdCW+nw7IyZ159bk/GRb2+tMqlVpQndXn0BdhLv+2Fj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="332669038"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="332669038"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 00:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="814627422"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="814627422"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 00:32:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id B23D3120279;
        Fri, 19 May 2023 10:31:59 +0300 (EEST)
Date:   Fri, 19 May 2023 07:31:59 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios()
 helper function
Message-ID: <ZGcl7+cKu0/h43YC@kekkonen.localdomain>
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <20230518153214.194976-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518153214.194976-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, May 18, 2023 at 05:32:06PM +0200, Hans de Goede wrote:
> On x86/ACPI platforms the GPIO resources do not provide information
> about which GPIO resource maps to which connection-id. So e.g.
> gpiod_get(devg, "reset") does not work.
> 
> On devices with an Intel IPU3 or newer ISP there is a special ACPI
> INT3472 device describing the GPIOs and instantiating of the i2c_client
> for a sensor is deferred until the INT3472 driver has been bound based
> on the sensor ACPI device having a _DEP on the INT3472 ACPI device.
> 
> This allows the INT3472 driver to add the necessary GPIO lookups
> without needing any special ACPI handling in the sensor driver.
> 
> Unfortunately this does not work on devices with an atomisp2 ISP,
> there the _DSM describing the GPIOs is part of the sensor ACPI device
> itself, rather then being part of a separate ACPI device.
> 
> IOW there is no separate firmware-node to which we can bind to register
> the GPIO lookups (and also no way to defer creating the sensor i2c_client).
> 
> This unfortunately means that all sensor drivers which may be used on
> BYT or CHT hw need some code to deal with ACPI integration.
> 
> This patch adds a new v4l2_acpi_parse_sensor_gpios() helper function
> for this, which does all the necessary work. This minimizes the
> (unavoidable) change to sensor drivers for ACPI integration to just
> adding a single line calling this void function to probe().

I'd rather avoid making changes to sensor drivers due to this hack. At the
very least it must be labelled so: this has no more to do with ACPI
standard than that this information happens to be located in an ACPI table.

Although if the number of those drivers would be small, this could be just
undesirable but still somehow acceptable. And I wouldn't expect new sensors
to be paired with the IPU2 anymore. How many drivers there would be
roughly? I think I've seen ten-ish sensor drivers with the atomisp driver.

Isn't it possible to create a device for this purpose and use software
nodes for the GPIOs? I guess that would be a hack as well and you'd somehow
have to initialise this via other route than driver probe.

-- 
Kind regards,

Sakari Ailus
