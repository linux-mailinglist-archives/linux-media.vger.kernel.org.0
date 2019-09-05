Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0371BAA02E
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388068AbfIEKpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:45:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:61875 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727900AbfIEKpx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 06:45:53 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 03:45:52 -0700
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; 
   d="scan'208";a="334516783"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 03:45:48 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9A6A620584; Thu,  5 Sep 2019 13:45:46 +0300 (EEST)
Date:   Thu, 5 Sep 2019 13:45:46 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Message-ID: <20190905104546.GA5475@paasikivi.fi.intel.com>
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com>
 <20190819083009.GC6133@paasikivi.fi.intel.com>
 <1567676465.21623.100.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1567676465.21623.100.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dongchun,

On Thu, Sep 05, 2019 at 05:41:05PM +0800, Dongchun Zhu wrote:

...

> > > +	ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Failed to enable regulators\n");
> > > +		goto disable_clk;
> > > +	}
> > > +	msleep_range(7);
> > 
> > This has some potential of clashing with more generic functions in the
> > future. Please use usleep_range directly, or msleep.
> > 
> 
> Did you mean using usleep_range(7*1000, 8*1000), as used in patch v1?
> https://patchwork.kernel.org/patch/10957225/

Yes, please.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
