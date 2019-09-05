Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 861E3AA7F5
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 18:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388180AbfIEQFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 12:05:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:22094 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731857AbfIEQFT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 12:05:19 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 09:05:18 -0700
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; 
   d="scan'208";a="184277240"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 09:05:15 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D4FA92069D; Thu,  5 Sep 2019 19:05:12 +0300 (EEST)
Date:   Thu, 5 Sep 2019 19:05:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>,
        shengnan.wang@mediatek.com
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Message-ID: <20190905160512.GG5475@paasikivi.fi.intel.com>
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com>
 <20190819083009.GC6133@paasikivi.fi.intel.com>
 <1567676465.21623.100.camel@mhfsdcap03>
 <20190905104546.GA5475@paasikivi.fi.intel.com>
 <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 05, 2019 at 07:53:37PM +0900, Tomasz Figa wrote:
> On Thu, Sep 5, 2019 at 7:45 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dongchun,
> >
> > On Thu, Sep 05, 2019 at 05:41:05PM +0800, Dongchun Zhu wrote:
> >
> > ...
> >
> > > > > + ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > + if (ret < 0) {
> > > > > +         dev_err(dev, "Failed to enable regulators\n");
> > > > > +         goto disable_clk;
> > > > > + }
> > > > > + msleep_range(7);
> > > >
> > > > This has some potential of clashing with more generic functions in the
> > > > future. Please use usleep_range directly, or msleep.
> > > >
> > >
> > > Did you mean using usleep_range(7*1000, 8*1000), as used in patch v1?
> > > https://patchwork.kernel.org/patch/10957225/
> >
> > Yes, please.
> 
> Why not just msleep()?

msleep() is usually less accurate. I'm not sure it makes a big different in
this case. Perhaps, if someone wants that the sensor is powered on and
streaming as soon as possible.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
