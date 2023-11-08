Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 760CC7E57E9
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 14:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjKHNYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Nov 2023 08:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjKHNYv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Nov 2023 08:24:51 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736491BEB
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 05:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699449889; x=1730985889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yRaSjDmjlZ+ibEOtcw6UHbdRvaHRiUf7SHHamsbvgLM=;
  b=BD0ovS1zDLvtvYZLZ/qR2ulvRGxfXKwy+iZIZ2Ati6sZa3aAPOEgXpDs
   PPsGVhwXjnbUGlZ6qbScNCHcI11ecvicfKU8/4Jy8H3/C6eXz1dPHjz5Z
   CbTBnJYkXp5z3tHuEbA25w/02CbRMzxAfpBIyoPVwI49dX3YbbRAGS1vS
   MUr/mJoMiLRImbchl7snLqzxdrWgB6jL+AXRxSB80TV6CT4hw+nxFT9Iu
   tRLW7Z4Cc2B1/lMGYmzWBxzUK/mXHDPfPXyNdr0utnZBFREykbUl8mngf
   vrN0kLtSZaiOHpqEFqhmc+HYNZ2NoJDW6+nJusqtoNcE6KLKzpfvnjkDQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2705369"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="2705369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 05:24:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797995969"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="797995969"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 05:24:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1r0iXr-0000000CLYf-3xIH;
        Wed, 08 Nov 2023 15:24:35 +0200
Date:   Wed, 8 Nov 2023 15:24:35 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hans@hansg.org>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
        andreaskleist@gmail.com, claus.stovgaard@gmail.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
        tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
Message-ID: <ZUuME44FjE9sdISe@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-2-bingbu.cao@intel.com>
 <a3184b70-e0b3-4227-94af-2412fd565724@hansg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3184b70-e0b3-4227-94af-2412fd565724@hansg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 08, 2023 at 12:25:19PM +0100, Hans de Goede wrote:
> On 10/24/23 13:29, bingbu.cao@intel.com wrote:

...

> > +	ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
> 
> This does not work on TGL systems (and is not reached on ADL and RPL).
> 
> The out of tree driver instead uses:
> 
>         ret = pci_enable_msi(dev);
> 
> and that does work correctly on TGL.

Does it mean TGL uses legacy IRQ?
In that case we need to simply change the flag to allow that as the used API
is what documentation says needs to be used and pci_enable_msi() is deprecated.

-- 
With Best Regards,
Andy Shevchenko


