Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503A3A9F52
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732979AbfIEKOM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:14:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:65141 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726137AbfIEKOM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:14:12 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 03:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; 
   d="scan'208";a="207823254"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 05 Sep 2019 03:14:07 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i5omE-0006KH-Di; Thu, 05 Sep 2019 13:14:06 +0300
Date:   Thu, 5 Sep 2019 13:14:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        sakari.ailus@linux.intel.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sam.hung@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V2, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
Message-ID: <20190905101406.GA2680@smile.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905072142.14606-2-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 05, 2019 at 03:21:41PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch is to add the Devicetree binding documentation and
> MAINTAINERS entry for dw9768 actuator.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt | 9 +++++++++
>  MAINTAINERS                                                     | 7 +++++++

This should be:
1) two separate patches
2) binding in YAML

-- 
With Best Regards,
Andy Shevchenko


