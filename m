Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689C91F553C
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 14:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgFJM63 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 08:58:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:10288 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728819AbgFJM62 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 08:58:28 -0400
IronPort-SDR: xhjTV7Mfk8x4RkV75uczbCwDJHz4xtBXim8dwxlOVUB/WCI00ei8vnG3EnFbJfbxil+HP2RnCE
 vArBeqgtZTvQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 05:58:19 -0700
IronPort-SDR: x3O8cvdGygNGuR71gedAE/dXngwkvm27l9HiR8qBN0I7pniLgn9C7kruwSpSE6mMZ81gBjtdBP
 LcstwaPIarBA==
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="349838222"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 05:58:14 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5D2A9203EB; Wed, 10 Jun 2020 15:58:12 +0300 (EEST)
Date:   Wed, 10 Jun 2020 15:58:12 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, drinkcat@chromium.org, tfiga@chromium.org,
        matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200610125812.GF16711@paasikivi.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605124643.GG2428291@smile.fi.intel.com>
 <1591424358.8804.599.camel@mhfsdcap03>
 <20200608132720.GS2428291@smile.fi.intel.com>
 <1591674341.8804.628.camel@mhfsdcap03>
 <20200609111428.GH2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609111428.GH2428291@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy, Dongchun,

On Tue, Jun 09, 2020 at 02:14:28PM +0300, Andy Shevchenko wrote:
> On Tue, Jun 09, 2020 at 11:45:41AM +0800, Dongchun Zhu wrote:
> > On Mon, 2020-06-08 at 16:27 +0300, Andy Shevchenko wrote:
> > > On Sat, Jun 06, 2020 at 02:19:18PM +0800, Dongchun Zhu wrote:
> > > > On Fri, 2020-06-05 at 15:46 +0300, Andy Shevchenko wrote:
> > > > > On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> 
> ...
> 
> > > > > > +#define DW9768_AAC_TIME_DEFAULT			0x20
> > > > > 
> > > > > Hex? Why not decimal?
> > > > > 
> > > > 
> > > > There is one optional property 'dongwoon,aac-timing' defined in DT.
> > > > I don't know whether you have noticed that.
> > > > 
> > > > 'DW9768_AAC_TIME_DEFAULT' is the value set to AACT[5:0] register.
> > > > I thought the Hex unit should be proper as it is directly written to the
> > > > Hex register.
> > > 
> > > I see. I would rather put it like (BIT(6) / 2) to show explicitly that we
> > > choose half of the resolution.
> > > 
> > 
> > I knew your idea.
> > '(BIT(6) / 2)' may somewhat show the meaning of 'median of the total
> > range of AACT[5:0]'.
> > 
> > But this value is still very obscure relative to '0x20'.
> > As I thought that simple is the best, especially for kernel upstream
> > patch.
> 
> Okay, let's wait for maintainers to speak up.

The value 0x20 is the device default, I don't see it having any other
special significance. So I'm totally fine with 0x20.

-- 
Kind regards,

Sakari Ailus
