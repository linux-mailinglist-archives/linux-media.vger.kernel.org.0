Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E87260EFB
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 11:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbgIHJqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 05:46:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:7276 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728591AbgIHJqu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 05:46:50 -0400
IronPort-SDR: 88L+Y8oIvXvSH9OO6VoewxGm74/Ke/jS1sZJW6jzMyGMSjdlxWsskQJTMUfW8EzdQP4UGhoxHZ
 ig3R1OXHadGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="145812874"
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="145812874"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 02:46:49 -0700
IronPort-SDR: JCsKZbWN6Vz7RQqkJklFsmCFoRp3eDltO1H9Br0I7dMd8eGpZYQvSQ/sNUdHZcUaYgBJuURuQp
 SpE2unAMwpsg==
X-IronPort-AV: E=Sophos;i="5.76,405,1592895600"; 
   d="scan'208";a="299732273"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 02:46:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5DEE920765; Tue,  8 Sep 2020 12:46:43 +0300 (EEST)
Date:   Tue, 8 Sep 2020 12:46:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= 
        <shengnan.wang@mediatek.com>, matrix.zhu@aliyun.com
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20200908094643.GE27352@paasikivi.fi.intel.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
 <20200902120122.24456-3-dongchun.zhu@mediatek.com>
 <20200902134421.GN1891694@smile.fi.intel.com>
 <20200902135145.GO1891694@smile.fi.intel.com>
 <1599226354.4733.69.camel@mhfsdcap03>
 <CAHp75VezE2iGBarXke4P9z31SmymBgPH5fwoknt9vBfFTw0u=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VezE2iGBarXke4P9z31SmymBgPH5fwoknt9vBfFTw0u=w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Fri, Sep 04, 2020 at 04:55:56PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 4, 2020 at 4:38 PM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > On Wed, 2020-09-02 at 16:51 +0300, Andy Shevchenko wrote:
> > > On Wed, Sep 02, 2020 at 04:44:21PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Sep 02, 2020 at 08:01:22PM +0800, Dongchun Zhu wrote:
> > >
> > > > > + ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > >
> > > > > + ret = fwnode_property_read_u32_array(dev_fwnode(dev),
> > >
> > > > > +         fwnode_property_read_u32_array(dev_fwnode(dev),
> > >
> > > > > + ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > >
> > >
> > > Btw, can somebody explain, why it's fwnode API and not direct use of device property API?
> > >
> > > In all above cases I see no reason why not to use device property API directly.
> > >
> >
> > From the fwnode API's usage:
> > @fwnode: Firmware node to get the property of.
> >
> > It seems dev_fwnode(dev) could return dev->of_node->fwnode if CONFIG_OF
> > is enabled, or return dev->fwnode if not.
> 
> So?..
> 
> Shouldn't be the above an equivalent to device_property_*(dev, ...)?

Yes.

V4L2 does not have a dummy implementation for almost no V4L2 driver has no
use without V4L2.

-- 
Regards,

Sakari Ailus
