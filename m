Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C27B744186
	for <lists+linux-media@lfdr.de>; Fri, 30 Jun 2023 19:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjF3Rpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jun 2023 13:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjF3Rpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jun 2023 13:45:39 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A79199B
        for <linux-media@vger.kernel.org>; Fri, 30 Jun 2023 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688147140; x=1719683140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BfTgYmUW4cu/SEJrIRUGZNeLKPJczf9sBaxN/DmNwQE=;
  b=YVmLAgAh7EE0+9o1hVp2SG6O31ZTPUh2fFfBPeKaoXb3UjjbjoIW8n8P
   9g/nSetkz0cf9AxzcMmO3rMuUAH/tDYZ25Zngcnu/TV5btAXyfkNmDYft
   RL+6J8+pyPaMK+dfd6QHBubuD60hyPFu8NZXaUOrlQD06QEmkIqA0lIBf
   yHmudyW6ZFvu0ga0FDb8CXJ8ZYqjRwleyXub81s5Ut9H4Mb96EK2FvqWP
   1b9lkbMA3rZ/8rNcrlsHrRdccXTSZrC6dx2UVmUwu3TQgO1cD2R6566s/
   idelXlA1G2No+aRUfoTOA3T2duzE2chFmSsP5qycElJYv2gUlXAHBCIDo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="347234432"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="347234432"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 10:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="695095939"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="695095939"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 30 Jun 2023 10:45:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qFIBR-001AY8-2X;
        Fri, 30 Jun 2023 20:45:25 +0300
Date:   Fri, 30 Jun 2023 20:45:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
        bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
        xiang.ye@intel.com, tian.shu.qiu@intel.com,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/2] media: ipu-bridge: add IVSC support
Message-ID: <ZJ8UtSP8q/hq8Xre@smile.fi.intel.com>
References: <20230630134506.109269-1-sakari.ailus@linux.intel.com>
 <20230630134506.109269-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630134506.109269-2-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 30, 2023 at 04:45:05PM +0300, Sakari Ailus wrote:
> From: Wentong Wu <wentong.wu@intel.com>
> 
> Previously on ACPI platforms, sensors that are intended to be connected
> to a IPU device for use with the ipu3-cio2 driver lacking the necessary
> connection information in firmware. IPU bridge driver is to connect
> sensors to IPU device via software nodes.
> 
> Currently IVSC located between IPU device and sensors is available in
> existing commercial platforms from multiple OEMs. But the connection
> information between them in firmware is also not enough to build V4L2
> connection graph. This patch parses the connection properties from the
> SSDB buffer in DSDT and build the connection using software nodes.
> 
> IVSC driver is based on MEI framework (previously known as HECI), it
> has two MEI clients, MEI CSI and MEI ACE. Both clients are used to
> communicate messages with IVSC firmware. Linux abstracts MEI client
> as a device, whose bus type is MEI. And the device is addressed by a
> GUID/UUID which is part of the device name of MEI client. After figured
> out MEI CSI via the UUID composed device name, this patch setup the
> connection between MEI CSI and IPU, and the connection between MEI CSI
> and sensor via software nodes.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> [Sakari Ailus: rebase on Hans de Goede's cleanups and fixes]

I believe we use past tense in these comment lines...

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


