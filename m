Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032326EE105
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 13:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbjDYLWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 07:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjDYLWD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 07:22:03 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208381707
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682421722; x=1713957722;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3jD/sKbXTBiB5c03rA8JaR04Huf13bLxMjjY77dKWiE=;
  b=SiNbB9ixcMf9PuDxrSSDXBcLirPJ6QNO4CphoBMa7JUP+Ienn4W9+uSW
   wszLtIvDPloVN4eqJo4pvG3dJbETU2ldTJCZE10At3OdgVGsNxORgLgXX
   z7x7KARSQIcxrD6Fo0WglyCQE0+80tg85rKoIEJGOP+IH/WEJHXCapdX2
   HrGoJ7g+KYWYIDUijmkFPcD25eU9/JBNX5K8jAG3obh98lzdmPdY8h8+w
   BjW/9SCtAgDrltgjzlLC5bk5lCgWXFXnjX+WUyU2xmjU7FlcBjvKE5YXG
   lnEmQRZM3OxVsc8ViPMSZdlJegT5QtRdsevaJc1dInVwj38VHO+tqldtb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349527179"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="349527179"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="723985227"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="723985227"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:21:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id EE30E11FAD0;
        Tue, 25 Apr 2023 14:21:55 +0300 (EEST)
Date:   Tue, 25 Apr 2023 14:21:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, daniel.h.kang@intel.com
Subject: Re: [RFC PATCH 12/14] media: add Kconfig and Makefile for IPU6
Message-ID: <ZEe307NCELYXEIX+@kekkonen.localdomain>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
 <20230413100429.919622-13-bingbu.cao@intel.com>
 <20230420142320.GB17497@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420142320.GB17497@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Apr 20, 2023 at 05:23:20PM +0300, Laurent Pinchart wrote:
> Hi Bingbu,
> 
> Thank you for the patch. I'm happy to see this series landing on the
> mailing list. I'm starting the review with the easy pieces :-)
> 
> On Thu, Apr 13, 2023 at 06:04:27PM +0800, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > Add IPU6 support in Kconfig and Makefile, with this patch you can
> > build the Intel IPU6 and input system modules by select the
> > CONFIG_VIDEO_INTEL_IPU6 in config.
> > 
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > ---
> >  drivers/media/pci/Kconfig             |  1 +
> >  drivers/media/pci/intel/Makefile      |  3 ++-
> >  drivers/media/pci/intel/ipu6/Kconfig  | 15 +++++++++++++++
> >  drivers/media/pci/intel/ipu6/Makefile | 23 +++++++++++++++++++++++
> >  4 files changed, 41 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
> >  create mode 100644 drivers/media/pci/intel/ipu6/Makefile
> > 
> > diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> > index 480194543d05..38fb484f5c8e 100644
> > --- a/drivers/media/pci/Kconfig
> > +++ b/drivers/media/pci/Kconfig
> > @@ -74,6 +74,7 @@ config VIDEO_PCI_SKELETON
> >  	  when developing new drivers.
> >  
> >  source "drivers/media/pci/intel/ipu3/Kconfig"
> > +source "drivers/media/pci/intel/ipu6/Kconfig"
> >  
> >  endif #MEDIA_PCI_SUPPORT
> >  endif #PCI
> > diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
> > index 0b4236c4db49..de2b73fef890 100644
> > --- a/drivers/media/pci/intel/Makefile
> > +++ b/drivers/media/pci/intel/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  #
> > -# Makefile for the IPU3 cio2 and ImGU drivers
> > +# Makefile for the Intel IPU drivers
> >  #
> >  
> >  obj-y	+= ipu3/
> > +obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= ipu6/
> > diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
> > new file mode 100644
> > index 000000000000..c88ef2f40f6d
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ipu6/Kconfig
> > @@ -0,0 +1,15 @@
> > +config VIDEO_INTEL_IPU6
> 
> As there will (hopefully) be a driver for the processing system in the
> future, should this Kconfig symbol be named with a reference to the
> input system already (and the help text be updated accordingly) ? The
> name "IPU6" covers both. Or do you envision that we would have a single
> Kconfig symbol to select both drivers ?

I'm fine with just one option. Much of the code is shared by both drivers.

I don't object adding an option for both (starting with ISYS) though.

> 
> > +	tristate "Intel IPU6 driver"
> > +	depends on ACPI || COMPILE_TEST
> > +	depends on MEDIA_SUPPORT
> > +	depends on MEDIA_PCI_SUPPORT
> > +	depends on X86_64
> 
> Do you use any x86-64 API, or could this be
> 
> 	depends on X86_64 || COMPILE_TEST
> 
> ?

The driver uses cache related APIs that are available on x86 only.

I think in the long run we should have better non-coherent memory support
for x86 API-wise but I don't think this driver should wait for that. But
once we do, this dependency can be removed.

-- 
Kind regards,

Sakari Ailus
