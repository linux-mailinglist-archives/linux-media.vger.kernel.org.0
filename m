Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA79A25AE1B
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 16:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgIBO7T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 10:59:19 -0400
Received: from mga03.intel.com ([134.134.136.65]:50826 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726733AbgIBNv7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 09:51:59 -0400
IronPort-SDR: /BA2RQo+m62KlN2ZSSVsd2aTVYlD1DMWxRuiDqxc/R2FKqb6S6QmqKOeWDSJLlc8YnI6nUAkux
 Pt0V8Dt/ZBzA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="157389715"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; 
   d="scan'208";a="157389715"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 06:51:53 -0700
IronPort-SDR: P+aTxY/oGyABs3yhZTdeYQGh8ec6x91kIgFJPJ9zqoCHy5pgYy5nhSPfel8ln/ldcv36QcTZpe
 2CRDr0PwLsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; 
   d="scan'208";a="331442343"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 02 Sep 2020 06:51:48 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kDTAv-00Djiz-EK; Wed, 02 Sep 2020 16:51:45 +0300
Date:   Wed, 2 Sep 2020 16:51:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20200902135145.GO1891694@smile.fi.intel.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902134421.GN1891694@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 02, 2020 at 04:44:21PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:

> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);

> > +	ret = fwnode_property_read_u32_array(dev_fwnode(dev),

> > +		fwnode_property_read_u32_array(dev_fwnode(dev),

> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",


Btw, can somebody explain, why it's fwnode API and not direct use of device property API?

In all above cases I see no reason why not to use device property API directly.

-- 
With Best Regards,
Andy Shevchenko


