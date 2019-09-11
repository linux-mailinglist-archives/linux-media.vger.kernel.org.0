Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59E2DAFBA5
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2019 13:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbfIKLnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Sep 2019 07:43:10 -0400
Received: from mga17.intel.com ([192.55.52.151]:14773 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbfIKLnI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Sep 2019 07:43:08 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Sep 2019 04:43:07 -0700
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="360110894"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Sep 2019 04:43:03 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id B2DE220B6B; Wed, 11 Sep 2019 14:43:00 +0300 (EEST)
Date:   Wed, 11 Sep 2019 14:43:00 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        andriy.shevchenko@linux.intel.com,
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
Subject: Re: [V2, 2/2] media: i2c: Add more sensor modes for ov8856 camera
 sensor
Message-ID: <20190911114300.GI5781@paasikivi.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
 <20190910130446.26413-3-dongchun.zhu@mediatek.com>
 <CAAFQd5Ar39TeFJbprQuMwCBVgjsuap1iQviz2dbf5Yw6OU1ZWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5Ar39TeFJbprQuMwCBVgjsuap1iQviz2dbf5Yw6OU1ZWA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On Wed, Sep 11, 2019 at 07:12:02PM +0900, Tomasz Figa wrote:
> Hi Sakari,
> 
> On Tue, Sep 10, 2019 at 10:05 PM <dongchun.zhu@mediatek.com> wrote:
> >
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >
> > This patch mainly adds two more sensor modes for OV8856 CMOS image sensor.
> > That is, the resolution of 1632*1224 and 3264*2448, corresponding to the bayer order of BGGR.
> > The sensor revision also differs in some OTP register.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  drivers/media/i2c/ov8856.c | 654 +++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 639 insertions(+), 15 deletions(-)
> >
> 
> What do you think about the approach taken by this patch?
> 
> My understanding is that the register arrays being added by it can be
> only used with 24MHz input clock, while the existing ones are for
> 19.2MHz. That means that this patch makes the driver expose completely
> different modes (resolutions, mbus formats) depending on the input
> clock. Are we okay with this?

These register list based drivers only support a tiny subset of
configurations a sensor can support, and the number of those configurations
may be amended over time.

I don't see a problem in choosing a different set of available
configurations based on the external clock frequency; that may, after all,
cause that some of the configurations, at a particular frame rate, are not
even achievable --- albeit this is perhaps unlikely in this case.

In practice, it's often the case that the sensor vendor provides these
configurations and the vendor may provide different configurations
(including output resolutions etc.) to different parties. So it may well be
the submitter of the patch would also not have access to similar
configurations (output size, cropping etc.) that now exist in the driver.

I'll review the patch itself soonish.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
