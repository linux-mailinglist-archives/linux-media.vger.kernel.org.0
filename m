Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7811590C93
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 05:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfHQDxQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 23:53:16 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:49033 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725829AbfHQDxQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 23:53:16 -0400
X-UUID: 7a5ffd59a7b94a3fa676b8e7829e81cc-20190817
X-UUID: 7a5ffd59a7b94a3fa676b8e7829e81cc-20190817
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 968920771; Sat, 17 Aug 2019 11:53:10 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Sat, 17 Aug
 2019 11:53:08 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 17 Aug 2019 11:53:07 +0800
Message-ID: <1566013985.21623.9.camel@mhfsdcap03>
Subject: Re: [RFC,V2,1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <sakari.ailus@iki.fi>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <menghui.lin@mediatek.com>,
        <shengnan.wang@mediatek.com>, <tfiga@google.com>,
        <drinkcat@chromium.org>
Date:   Sat, 17 Aug 2019 11:53:05 +0800
In-Reply-To: <ef65288c523f405396991bd6d757bba0@mtkmbs02n1.mediatek.inc>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
         <20190704084651.3105-2-dongchun.zhu@mediatek.com>
         <20190723074153.GA4606@paasikivi.fi.intel.com>
         <ef65288c523f405396991bd6d757bba0@mtkmbs02n1.mediatek.inc>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 4774094677F93A251C0A435CD09B88B2EBA9C5713E4CDF9174222B5ED8EA93A72000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Sakari,

On Tue, 2019-07-23 at 10:41 +0300, Sakari Ailus wrote:
> 
> Hi Dongchun,
> 
> On Thu, Jul 04, 2019 at 04:46:50PM +0800, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> >
> > Add device tree binding documentation for the OV02A10 camera sensor.
> >
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov02a10.txt      | 43 ++++++++++++++++++++++
> >  MAINTAINERS                                        |  7 ++++
> >  2 files changed, 50 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > new file mode 100644
> > index 0000000..d40aa87
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > @@ -0,0 +1,43 @@
> > +* Omnivision OV02A10 MIPI CSI-2 sensor
> > +
> > +Required Properties:
> > +- compatible: shall be "ovti,ov02a10"
> > +- clocks: reference to the xvclk input clock
> > +- clock-names: shall be "xvclk"
> > +- avdd-supply: Analog voltage supply, 2.8 volts
> > +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> > +- dvdd-supply: Digital core voltage supply, 1.8 volts
> > +- reset-gpios: Low active reset gpio
> > +
> > +The device node shall contain one 'port' child node with an
> > +'endpoint' subnode for its digital output video port, in accordance
> > +with the video interface bindings defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +The endpoint optional property 'data-lanes' shall be "<1>".
> 
> How many lanes does the module (or the sensor) have?
> 

From sensor datasheet, OV02A10 supports 1-lane MIPI interface.

> > +
> > +Example:
> > +&i2c4 {
> > +ov02a10: camera-sensor@3d {
> > +compatible = "ovti,ov02a10";
> > +reg = <0x3d>;
> > +pinctrl-names = "default";
> > +pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> > +
> > +clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> > +<&topckgen CLK_TOP_UNIVP_192M_D8>;
> > +clock-names = "xvclk", "freq_mux";
> > +
> > +avdd-supply = <&mt6358_vcama1_reg>;
> > +dvdd-supply = <&mt6358_vcn18_reg>;
> > +dovdd-supply = <&mt6358_vcamio_reg>;
> > +pwdn-gpios = <&pio 107 1>;
> > +reset-gpios = <&pio 109 1>;
> > +
> > +port {
> > +   ov02a10_core: endpoint {
> > +       remote-endpoint = <&ov02a10_0>;
> 
> Indentation is still wrong. :-(
> 

Fixed in next release.

> > +   data-lanes = <1>;
> > +};
> > +};
> > +};
> > +};
> > diff --git a/MAINTAINERS b/MAINTAINERS index 5cfbea4..62b81ff 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11571,6 +11571,13 @@ T:git git://linuxtv.org/media_tree.git
> >  S:Maintained
> >  F:drivers/media/i2c/ov13858.c
> >
> > +OMNIVISION OV02A10 SENSOR DRIVER
> > +M:Dongchun Zhu <dongchun.zhu@mediatek.com>
> > +L:linux-media@vger.kernel.org
> > +T:git git://linuxtv.org/media_tree.git
> > +S:Maintained
> > +F:Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > +
> >  OMNIVISION OV2680 SENSOR DRIVER
> >  M:Rui Miguel Silva <rmfrfs@gmail.com>
> >  L:linux-media@vger.kernel.org
> 
> --
> Kind regards,
> 
> Sakari Ailus
> sakari.ailus@linux.intel.com
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> *********************MEDIATEK Confidential/Internal Use*********************


