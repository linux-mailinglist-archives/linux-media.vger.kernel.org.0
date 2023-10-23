Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676777D336C
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 13:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234053AbjJWLaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 07:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234034AbjJWLaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 07:30:07 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B8192
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 04:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698060605; x=1729596605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W6mJQcwi1i24qPTirrQk1IEep6O46xfxo0gjjKHXi1c=;
  b=A4V8c5NqVrNFCbMJTz0uIzdx4V+Pxn4bZaHwrH+KiR9vnu47Ubgw4OeQ
   7Rc6oTttsszslYftO79TS7GT0/65SrhAG/f8Tx0k+CIeTncVjokC7iVHX
   YJmRLlcJXfzJi0UyUcU1Ku6/JIzDPH6s9DzVT4UBhmLYUbx4J5I13W/kj
   xAc56/anGq/N0+ak9u1I4/dJDMBQGFvI9vpih7flxH0pSZPFVeQkSBoQL
   eoP9Z0ztnJBXpI9+U7AXR2A8qDDebVF4/UTMU1YtWW85o/WBFpa4+6D2j
   PFO2rEgCJbQ8l/D3vnLR09258VXjoU9DnTQfPk1wcZqewVdqOgvP9fdCW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="453289613"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="453289613"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="874678578"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="874678578"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 04:29:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qut85-00000007vCQ-0M6d;
        Mon, 23 Oct 2023 14:29:53 +0300
Date:   Mon, 23 Oct 2023 14:29:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>, bingbu.cao@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, ilpo.jarvinen@linux.intel.com,
        tfiga@chromium.org, senozhatsky@chromium.org,
        tomi.valkeinen@ideasonboard.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, claus.stovgaard@gmail.com
Subject: Re: [PATCH 10/15] media: intel/ipu6: add input system driver
Message-ID: <ZTZZMFt8//+KtiwS@smile.fi.intel.com>
References: <20230727071558.1148653-1-bingbu.cao@intel.com>
 <20230727071558.1148653-11-bingbu.cao@intel.com>
 <1ce2242844b3e1348d7343b84b15dd87e0f66e6a.camel@gmail.com>
 <ea3cc241-4074-2b53-359f-360ca45a7b1f@linux.intel.com>
 <900a1efcbf29aa238f2ace788dc739e9c6ad3c26.camel@gmail.com>
 <9d5d0bd8-41d1-4879-fccf-54e56aaa5073@redhat.com>
 <e0cc94736e4142f2d661a8bbb0c800b709349377.camel@gmail.com>
 <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83426573-8c4b-ec20-6916-2917aa06954f@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 23, 2023 at 09:44:07AM +0200, Hans de Goede wrote:
> On 10/23/23 08:23, Andreas Helbech Kleist wrote:
> > On Fri, 2023-10-20 at 16:39 +0200, Hans de Goede wrote:
> >> On 10/20/23 12:47, Andreas Helbech Kleist wrote:

...

> > +static const struct auxiliary_device_id ipu6_isys_id_table[] = {
> > +	{
> > +		.name = "intel_ipu6.isys",
> > +		.driver_data = (kernel_ulong_t)&ipu6_isys_auxdrv_data,
> > +	},

Quite likely terminator is missing here.

> > +};
> 
> Right, so this needs a:
> 
> MODULE_DEVICE_TABLE(auxiliary, ipu6_isys_id_table);

-- 
With Best Regards,
Andy Shevchenko


