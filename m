Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF4390D06
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 07:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbfHQFDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Aug 2019 01:03:48 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:41245 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725562AbfHQFDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Aug 2019 01:03:47 -0400
X-UUID: ecc1830c8ecd4958ac5df51f25475e52-20190817
X-UUID: ecc1830c8ecd4958ac5df51f25475e52-20190817
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 2014780734; Sat, 17 Aug 2019 13:03:43 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Sat, 17 Aug
 2019 13:03:41 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 17 Aug 2019 13:03:40 +0800
Message-ID: <1566018219.21623.18.camel@mhfsdcap03>
Subject: Re: [RFC,V2,1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <menghui.lin@mediatek.com>,
        <shengnan.wang@mediatek.com>, <tfiga@google.com>,
        <drinkcat@chromium.org>, Sakari Ailus <sakari.ailus@iki.fi>
Date:   Sat, 17 Aug 2019 13:03:39 +0800
In-Reply-To: <5d5d644af9334609bb7c3ff745b2e754@mtkmbs02n1.mediatek.inc>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
         <20190704084651.3105-2-dongchun.zhu@mediatek.com>
         <20190722234924.GA22604@bogus>
         <5d5d644af9334609bb7c3ff745b2e754@mtkmbs02n1.mediatek.inc>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 99049D467F5009BFBF475616B3B2A033809B34DAE95E200D350CC41481287DB52000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Rob,

On Mon, 2019-07-22 at 18:49 -0500, Rob Herring wrote:
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
> 
> Not documented. If you need this, use 'powerdown-gpios' instead.
> 

Fixed in next release.

> > +reset-gpios = <&pio 109 1>;
> > +
> > +port {
> > +   ov02a10_core: endpoint {
> > +       remote-endpoint = <&ov02a10_0>;
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
> > --
> > 2.9.2
> >
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> *********************MEDIATEK Confidential/Internal Use*********************


