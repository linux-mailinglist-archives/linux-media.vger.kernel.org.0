Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AD028DB97
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 10:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgJNIbo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 04:31:44 -0400
Received: from mga05.intel.com ([192.55.52.43]:61044 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbgJNIbn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 04:31:43 -0400
IronPort-SDR: N/n9Llm172vGXEeJuFD/kngCwfdDA6KyFD5VgBsxmYIGz+tqXIng6cS5K45mRNuo9ONG7+nlkp
 M3lsON7hbEBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="250761740"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="250761740"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 01:31:45 -0700
IronPort-SDR: zbo01jgc7PH8Rw+C3AUgloG2Zo7L1nq574wq5hwhsjQb/FcN52ycKky7Von1N0ot7r1ThARJ0y
 RGjRmtUjfJCQ==
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="299862191"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 01:31:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9A81320609; Wed, 14 Oct 2020 11:31:39 +0300 (EEST)
Date:   Wed, 14 Oct 2020 11:31:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     mchehab@kernel.org, andriy.shevchenko@linux.intel.com,
        robh+dt@kernel.org, mark.rutland@arm.com, drinkcat@chromium.org,
        tfiga@chromium.org, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201014083139.GG13341@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
 <20201013161938.GE13341@paasikivi.fi.intel.com>
 <1602641418.4733.80.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602641418.4733.80.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 14, 2020 at 10:10:18AM +0800, Dongchun Zhu wrote:
> Hello Sakari,
> 
> Thanks for your timely review.
> 
> On Tue, 2020-10-13 at 19:19 +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> > 
> > On Tue, Oct 13, 2020 at 09:05:02PM +0800, Dongchun Zhu wrote:
> > > Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> > > relevant MAINTAINERS entries.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   7 +
> > >  2 files changed, 169 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> > > 
> 
> [snip]...
> 
> > > +  ovti,mipi-clock-voltage:
> > > +    description:
> > > +      An array of 2-tuples items, and each item consists of link frequency and
> > > +      MIPI clock voltage unit like <freq-kHz volt-unit>. Clock voltage unit is
> > > +      dependent upon link speed, indicating MIPI transmission speed select that
> > > +      controls D-PHY timing setting by adjusting MIPI clock voltage to improve
> > > +      the clock driver capability.
> > > +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> > > +    minItems: 2
> > > +    default: [390000, 4]
> > 
> > Why do you have the link frequency here as well?
> > 
> > In principle this does belong to the endpoint as link frequencies are
> > specific to that, but I don't mind; there's just a single port anyway.
> > 
> 
> This is an optional property which we model as an array of <link speed,
> clock voltage> pairs. An example to have all link speeds up to 390MHz
> use the value 4 for current driver. If one wants to select different
> voltage for different link, they could do so as well.

If you think you'd need that, then you need to put this to the endpoint.

-- 
Sakari Ailus
