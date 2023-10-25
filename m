Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEE1F7D751B
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 22:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbjJYUDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 16:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbjJYUDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 16:03:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7586B8F
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698264228; x=1729800228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jGdBv25JE11eR9zyIFDEyYBXtuB6oWJGHSvGxHdJ6Yc=;
  b=RUdgFGNOCdmStKByX+8ArwOHwzPRUnis4WOPxWq6PSexOEUShz/sDRjc
   KqHipEBUechaxw3gwk8ftI+iU8Zpg/SRGmkbJQStBM5XIrPf50iu1nB6A
   StJh2EYcS2h8kdcfSlxCtZ8+uIk92zby6VuMBBZUGzo0hmNB5RVcEPJJp
   hrPH2ZiGuMfsQ/0GP2BJIjt/USP0IA2CIKmYO/1G99WcAQtt1GlTDHgdW
   tLvrGe8rEBhy1j+jVVMrRRMkx3pqS1QJ9HYarORGJCWKKaMPIpWk67Z+6
   JOBRAgy80NK4HIdbzLWa3fxEStA6+1ETxc7OlsoZ8/bsJL6Jbp/6EO5Ay
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377756127"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="377756127"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="829357344"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="829357344"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:03:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qvk6P-00000008frq-1cDZ;
        Wed, 25 Oct 2023 23:03:41 +0300
Date:   Wed, 25 Oct 2023 23:03:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
        claus.stovgaard@gmail.com, tfiga@chromium.org,
        senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com
Subject: Re: [PATCH v2 01/15] media: intel/ipu6: add Intel IPU6 PCI device
 driver
Message-ID: <ZTl0nU8i6slPXkpN@smile.fi.intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <20231024112924.3934228-2-bingbu.cao@intel.com>
 <ec4d1e9530ec2f5bf90822edbe3130ec88410cf5.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec4d1e9530ec2f5bf90822edbe3130ec88410cf5.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 25, 2023 at 02:39:16PM +0200, Andreas Helbech Kleist wrote:
> On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:

...

> > +       ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
> > +       if (ret)
> > +               dev_err_probe(&dev->dev, ret, "Request msi failed");
> > +
> > +       return ret;
> > +}
> 
> pci_alloc_irq_vectors returns number of irqs, so I think it should be
> something like this instead:

Indeed, good catch!

>        ret = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
>        if (ret<0) {
>                dev_err_probe(&dev->dev, ret, "Request msi failed");
>                return ret;

		return dev_err_probe();

saves a line.

>        }

-- 
With Best Regards,
Andy Shevchenko


