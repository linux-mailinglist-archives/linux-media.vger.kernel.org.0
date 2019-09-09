Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A24C3AD269
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 05:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388055AbfIID4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Sep 2019 23:56:02 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:24135 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387942AbfIID4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Sep 2019 23:56:02 -0400
X-UUID: 53918360d9204d30b8041c335b5e8380-20190909
X-UUID: 53918360d9204d30b8041c335b5e8380-20190909
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1274453681; Mon, 09 Sep 2019 11:55:52 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 9 Sep
 2019 11:55:48 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Sep 2019 11:55:48 +0800
Message-ID: <1568001348.21623.173.camel@mhfsdcap03>
Subject: Re: [V1, 1/2] media: dt-bindings: media: i2c: Add bindings for
 ov8856
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <drinkcat@chromium.org>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        Ben Kao <ben.kao@intel.com>
Date:   Mon, 9 Sep 2019 11:55:48 +0800
In-Reply-To: <20190808165416.GA1845@kekkonen.localdomain>
References: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
         <20190808092215.5608-2-dongchun.zhu@mediatek.com>
         <20190808165416.GA1845@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 081F698E455D92653B89BAEE5D1532842DA0144527A369190CB26B39126B11652000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, 2019-08-08 at 19:54 +0300, Sakari Ailus wrote:
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
> 

Sorry, this frequency of the external clock to the sensor and
link-frequencies would be added in DT in next release.

> > +- avdd-supply: Analog voltage supply, 2.8 volts
> > +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> > +- dvdd-supply: Digital core voltage supply, 1.2 volts
> > +- reset-gpios: Low active reset gpio
> > +
> > +The device node shall contain one 'port' child node with an
> > +'endpoint' subnode for its digital output video port,
> > +in accordance with the video interface bindings defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +The endpoint optional property 'data-lanes' shall be "<0 1 3 4>".
> 
> If you don't support lane reordering, then monotonically incrementing lane
> numbers from 1 onwards are recommended.
> 
> Please also make the property mandatory.
> 

data-lanes would be required property on endpoint in next release.

> > +
> > +Example:
> > +&i2c7 {
> > +	ov8856: camera-sensor@10 {
> > +		compatible = "ovti,ov8856";
> > +		reg = <0x10>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&clk_24m_cam>;
> > +
> > +		clocks = <&cru SCLK_TESTCLKOUT1>;
> > +		clock-names = "xvclk";
> > +
> > +		avdd-supply = <&mt6358_vcama2_reg>;
> > +		dvdd-supply = <&mt6358_vcamd_reg>;
> > +		dovdd-supply = <&mt6358_vcamio_reg>;
> > +		reset-gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
> > +
> > +		port {
> > +			wcam_out: endpoint {
> > +				remote-endpoint = <&mipi_in_wcam>;
> > +				data-lanes = <0 1 3 4>;
> > +			};
> > +		};
> > +	};
> > +};
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 783569e..7746c6b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11889,6 +11889,7 @@ L:	linux-media@vger.kernel.org
> >  T:	git git://linuxtv.org/media_tree.git
> >  S:	Maintained
> >  F:	drivers/media/i2c/ov8856.c
> > +F:	Documentation/devicetree/bindings/media/i2c/ov8856.txt
> >  
> >  OMNIVISION OV9650 SENSOR DRIVER
> >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> 


