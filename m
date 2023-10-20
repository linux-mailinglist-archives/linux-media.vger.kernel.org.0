Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF257D0D03
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 12:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376794AbjJTKUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Oct 2023 06:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376749AbjJTKUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Oct 2023 06:20:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50737D5A
        for <linux-media@vger.kernel.org>; Fri, 20 Oct 2023 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697797250; x=1729333250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IF0ePu62R1+Iu5G012G4S1wYbbELpfWjP3DySJjHU1E=;
  b=W2lQHaDXgalqOfUFyPyaMBWWx5zizNQPoHm2oTj6XGTJIQowTPl4XS9A
   C0thjVH7E2NdWL/d+TacRrnXgiJPx0wbahfOMMvpCsVLCTC78W7CkAPdh
   iyjgTqZyJVhuPVSuMxMhyEoBouBdLDEkVFdZ0ruNM2zkJtEh2GKLhdFDI
   cKWMwlL7xKtLdD3vvHCzJVVsdik77eQsvm8JmuARdqxMa7hP5QVH9BsgU
   XEJiGD8ikGn9bhnDtnKRJFwz9czyT8ofGBScH3cqPcKHML/j4UGm8YqDV
   eRlfsI7Nr0bQ8jrT67l2aoFKjis06vj2yJZArlQ5dUjTdOPLNiiB6LUDP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="366701792"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="366701792"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 03:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="873862596"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="873862596"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 03:20:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qtmcV-000000077Uy-1qor;
        Fri, 20 Oct 2023 13:20:43 +0300
Date:   Fri, 20 Oct 2023 13:20:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Wang, Hongju" <hongju.wang@intel.com>
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
Message-ID: <ZTJUe4RmkTKxyNiD@smile.fi.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
 <ZTEfg8+sNGf0KU+a@smile.fi.intel.com>
 <DM8PR11MB5653B677FD2888FB530B728A99DBA@DM8PR11MB5653.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5653B677FD2888FB530B728A99DBA@DM8PR11MB5653.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 20, 2023 at 02:21:09AM +0000, Cao, Bingbu wrote:
> >From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >Sent: Thursday, October 19, 2023 8:22 PM
> >On Thu, Oct 19, 2023 at 04:28:16PM +0800, Bingbu Cao wrote:
> >> On 10/3/23 6:13 PM, Andreas Helbech Kleist wrote:
> >> > On Thu, 2023-07-27 at 15:15 +0800, bingbu.cao@intel.com wrote:

...

> >> >> +static const struct pci_device_id isys_pci_tbl[] = {
> >> >> +       { PCI_VDEVICE(INTEL, IPU6_PCI_ID) },
> >> >> +       { PCI_VDEVICE(INTEL, IPU6SE_PCI_ID) },
> >> >> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_P_PCI_ID) },
> >> >> +       { PCI_VDEVICE(INTEL, IPU6EP_ADL_N_PCI_ID) },
> >> >> +       { PCI_VDEVICE(INTEL, IPU6EP_RPL_P_PCI_ID) },
> >> >> +       { PCI_VDEVICE(INTEL, IPU6EP_MTL_PCI_ID) },
> >> >> +       { }
> >> >> +};
> >> >
> >> > Unused
> >>
> >> Have you tried that whether isys driver can be auto-loaded w/o this
> >> pci id table? It cannot on my side.
> >
> >But where is the respective MODULE_DEVICE_TABLE()?
> 
> It is at the end of this source, someone snip it in mail.
> 
> +static struct auxiliary_driver isys_driver = {
> +	.name = IPU6_ISYS_NAME,
> +	.probe = isys_probe,
> +	.remove = isys_remove,
> +	.id_table = ipu6_isys_id_table,
> +	.driver = {
> +		.pm = &isys_pm_ops,
> +	},
> +};
> +
> +module_auxiliary_driver(isys_driver);
> +
> +MODULE_DEVICE_TABLE(pci, isys_pci_tbl);

So, please make sure you have this macro closest to the data it uses.

-- 
With Best Regards,
Andy Shevchenko


