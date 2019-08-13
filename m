Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFB08B7AD
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfHML5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:57:07 -0400
Received: from mga11.intel.com ([192.55.52.93]:24305 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725981AbfHML5H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:57:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 04:57:07 -0700
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="183849614"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 04:57:03 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 73081210F0; Tue, 13 Aug 2019 14:55:54 +0300 (EEST)
Date:   Tue, 13 Aug 2019 14:55:54 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     dongchun.zhu@mediatek.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        drinkcat@chromium.org, tfiga@chromium.org, matthias.bgg@gmail.com,
        bingbu.cao@intel.com, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, shengnan.wang@mediatek.com,
        Ben Kao <ben.kao@intel.com>
Subject: Re: [V1, 1/2] media: dt-bindings: media: i2c: Add bindings for ov8856
Message-ID: <20190813115554.GA6133@paasikivi.fi.intel.com>
References: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
 <20190808092215.5608-2-dongchun.zhu@mediatek.com>
 <20190808165416.GA1845@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808165416.GA1845@kekkonen.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 08, 2019 at 07:54:16PM +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> (Cc'ing Ben, too.)
> 
> On Thu, Aug 08, 2019 at 05:22:14PM +0800, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > 
> > Add device tree binding documentation for the ov8856 camera sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov8856.txt       | 41 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  1 +
> >  2 files changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.txt b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
> > new file mode 100644
> > index 0000000..96b10e0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
> > @@ -0,0 +1,41 @@
> > +* Omnivision OV8856 MIPI CSI-2 sensor
> > +
> > +Required Properties:
> > +- compatible: shall be "ovti,ov8856"
> > +- clocks: reference to the xvclk input clock
> > +- clock-names: shall be "xvclk"
> 
> Could you add "clock-frequency" property here, please, and specify the
> upper and lower limits?

Can you also add the link-frequencies property, please?

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
