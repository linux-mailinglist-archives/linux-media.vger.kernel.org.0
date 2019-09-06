Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C189AAB02C
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 03:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730204AbfIFBdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 21:33:19 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:46799 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727043AbfIFBdT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 21:33:19 -0400
X-UUID: 96808c8b9f2d4b26b2087594791eb926-20190906
X-UUID: 96808c8b9f2d4b26b2087594791eb926-20190906
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 2095559495; Fri, 06 Sep 2019 09:33:11 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 6 Sep
 2019 09:33:03 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Sep 2019 09:33:02 +0800
Message-ID: <1567733585.21623.163.camel@mhfsdcap03>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor
 driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Louis Kuo <louis.kuo@mediatek.com>,
        <shengnan.wang@mediatek.com>
Date:   Fri, 6 Sep 2019 09:33:05 +0800
In-Reply-To: <CANMq1KDVMGkeBvu1nO5WHopWwec9mxHfhmLmX2BzvaYVLzxoXw@mail.gmail.com>
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
         <20190819034331.13098-3-dongchun.zhu@mediatek.com>
         <20190819083009.GC6133@paasikivi.fi.intel.com>
         <1567676465.21623.100.camel@mhfsdcap03>
         <20190905104546.GA5475@paasikivi.fi.intel.com>
         <CAAFQd5Bh-11D9RR9WVH5A3DbXZoxWhbMhXSNKUV25mempMi+ag@mail.gmail.com>
         <20190905160512.GG5475@paasikivi.fi.intel.com>
         <CANMq1KDVMGkeBvu1nO5WHopWwec9mxHfhmLmX2BzvaYVLzxoXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: F407418E7C5334074F2F61C9B1662FF6503DAC5082ABBBF7307673C1AD9D1A8A2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-09-06 at 06:58 +0800, Nicolas Boichat wrote:
> On Fri, Sep 6, 2019 at 12:05 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > On Thu, Sep 05, 2019 at 07:53:37PM +0900, Tomasz Figa wrote:
> > > On Thu, Sep 5, 2019 at 7:45 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Hi Dongchun,
> > > >
> > > > On Thu, Sep 05, 2019 at 05:41:05PM +0800, Dongchun Zhu wrote:
> > > >
> > > > ...
> > > >
> > > > > > > + ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > > > + if (ret < 0) {
> > > > > > > +         dev_err(dev, "Failed to enable regulators\n");
> > > > > > > +         goto disable_clk;
> > > > > > > + }
> > > > > > > + msleep_range(7);
> > > > > >
> > > > > > This has some potential of clashing with more generic functions in the
> > > > > > future. Please use usleep_range directly, or msleep.
> > > > > >
> > > > >
> > > > > Did you mean using usleep_range(7*1000, 8*1000), as used in patch v1?
> > > > > https://patchwork.kernel.org/patch/10957225/
> > > >
> > > > Yes, please.
> > >
> > > Why not just msleep()?
> >
> > msleep() is usually less accurate. I'm not sure it makes a big different in
> > this case. Perhaps, if someone wants that the sensor is powered on and
> > streaming as soon as possible.
> 
> https://elixir.bootlin.com/linux/latest/source/Documentation/timers/timers-howto.txt#L70
> 
> Use usleep_range for delays up to 20ms (at least that's what the
> documentation (still) says?)
> 

Thank you for your clarifications.
From the doc,
"msleep(1~20) may not do what the caller intends, and
will often sleep longer (~20 ms actual sleep for any
value given in the 1~20ms range). In many cases this
is not the desired behavior."

So, it is supposed to use usleep_range in shorter sleep case,
such as 5ms.

> > --
> > Sakari Ailus
> > sakari.ailus@linux.intel.com


