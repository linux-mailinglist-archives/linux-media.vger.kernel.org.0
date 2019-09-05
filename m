Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F33AA062
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733023AbfIEKsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:48:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:50553 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726137AbfIEKsg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:48:36 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 03:48:36 -0700
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; 
   d="scan'208";a="207830033"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 03:48:32 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1EDA220584; Thu,  5 Sep 2019 13:48:30 +0300 (EEST)
Date:   Thu, 5 Sep 2019 13:48:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     dongchun.zhu@mediatek.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org, tfiga@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sam.hung@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V2, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
Message-ID: <20190905104829.GB5475@paasikivi.fi.intel.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
 <20190905072142.14606-2-dongchun.zhu@mediatek.com>
 <20190905101406.GA2680@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905101406.GA2680@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 05, 2019 at 01:14:06PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 05, 2019 at 03:21:41PM +0800, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > 
> > This patch is to add the Devicetree binding documentation and
> > MAINTAINERS entry for dw9768 actuator.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt | 9 +++++++++
> >  MAINTAINERS                                                     | 7 +++++++
> 
> This should be:
> 1) two separate patches

Why? The MAINTAINERS entry is usually added in the first patch needing it,
isn't it?

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
