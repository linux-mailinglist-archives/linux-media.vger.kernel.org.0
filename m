Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D1AAD677
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 12:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729836AbfIIKLQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 06:11:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:12995 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729826AbfIIKLQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 06:11:16 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 03:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; 
   d="scan'208";a="384911859"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2019 03:11:11 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i7GdZ-0006Sr-UN; Mon, 09 Sep 2019 13:11:09 +0300
Date:   Mon, 9 Sep 2019 13:11:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     dongchun.zhu@mediatek.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org, tfiga@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V4, 1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
Message-ID: <20190909101109.GT2680@smile.fi.intel.com>
References: <20190907092728.23897-1-dongchun.zhu@mediatek.com>
 <20190907092728.23897-2-dongchun.zhu@mediatek.com>
 <20190909094501.GO2680@smile.fi.intel.com>
 <20190909095715.GA5781@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190909095715.GA5781@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 09, 2019 at 12:57:15PM +0300, Sakari Ailus wrote:
> Hi Andy,
> 
> On Mon, Sep 09, 2019 at 12:45:01PM +0300, Andy Shevchenko wrote:
> > On Sat, Sep 07, 2019 at 05:27:27PM +0800, dongchun.zhu@mediatek.com wrote:
> > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > 
> > > This patch adds device tree bindings documentation for OV02A10 camera sensor.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
> > 
> > >  MAINTAINERS                                        |  7 +++
> > 
> > This doesn't belong to dt-bindings.
> 
> The practice has been to add the MAINTAINERS entry along with the DT
> bindings.

Ah, okay, good to know!

-- 
With Best Regards,
Andy Shevchenko


