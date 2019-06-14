Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E27BE46526
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 18:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbfFNQ4H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 12:56:07 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33716 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbfFNQ4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 12:56:06 -0400
Received: by mail-qt1-f195.google.com with SMTP id x2so3289459qtr.0;
        Fri, 14 Jun 2019 09:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BW1xnYGWg+aoTF/Yaq1jahB+G0s53KZIsKdfCRLCS5M=;
        b=uEcut09jaC8j2kkKPZHvfItobvM10u4m8o7PXc3kPe53zLrKIwZgef4flM1Q2WMvCM
         POMvGSd3RQbWDAr8wCPe5McULBFXGaLIMa/3XcPxCFq7wP+kvH2qsQulicYQD87g+94D
         iXDKOvCQpOs0O6/r+JodqTQzHXFT55EkpSA/SdOT8r/PY34fAjmEQtP5GiiziKasI2w1
         RS/Bn78K2F6SpuUZqpsw3Rk5G7nxBBfc9qDc8gTdzniSU1QYroUr+s2NuglNhb8rW4+f
         mSbCPUQd+iCTJpfCc8F+kQkv3k/RgZ+33/jri3WahNqCZGy6XaV0RLA8x26ZyWPISc2N
         dGpw==
X-Gm-Message-State: APjAAAXs6T0heDj96KQViNvIYlYO8WBuHSVsb6epLxP6iaqmi/oyRF5c
        ioNVut3KbNVmitkSkGrMNA==
X-Google-Smtp-Source: APXvYqwKw7gEikdDCeeVBg/sr7wzmaN+sPvOXjG11rUJ9NjiqHre30+rVmiZbgs/Z8FdHdOZJiRV0g==
X-Received: by 2002:ac8:70d1:: with SMTP id g17mr37959971qtp.124.1560531365401;
        Fri, 14 Jun 2019 09:56:05 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id e63sm1697857qkd.57.2019.06.14.09.56.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 09:56:04 -0700 (PDT)
Date:   Fri, 14 Jun 2019 10:56:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     dongchun.zhu@mediatek.com, mchehab@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, sj.huang@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        louis.kuo@mediatek.com, menghui.lin@mediatek.com,
        shengnan.wang@mediatek.com
Subject: Re: [PATCH 3/3] media: dt-bindings: media: i2c: Add bindings for
 ov02a10
Message-ID: <20190614165603.GA30462@bogus>
References: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
 <20190523102204.24112-4-dongchun.zhu@mediatek.com>
 <20190531161658.2y2amfngbhfbllj7@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531161658.2y2amfngbhfbllj7@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 31, 2019 at 07:16:58PM +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> Thanks for the patch.
> 
> On Thu, May 23, 2019 at 06:22:04PM +0800, dongchun.zhu@mediatek.com wrote:
> > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > 
> > Add device tree binding documentation for the OV02A10 CMOS image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov02a10.txt      | 43 ++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> > new file mode 100644
> > index 0000000..fdc2904
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
> > +'endpoint' subnode for its digital output video port,
> > +in accordance with the video interface bindings defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +The endpoint optional property 'data-lanes' shall be "<1>".
> 
> If the sensor only supports a single lane configuration (one lane), you can
> omit that property altogether. Is that the only possible configuration for
> the sensor?
> 
> Please also wrap the text at 80 characters, not 65 or so.
> 
> > +
> > +Example:
> > +&i2c4 {
> > +	sensor_sub: sensor_sub {
> 
> camera-sensor@3d {
> 
> > +		compatible = "ovti,ov02a10";
> > +		reg = <0x3d>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> > +
> > +		clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> > +			<&topckgen CLK_TOP_UNIVP_192M_D8>;
> > +		clock-names = "xvclk", "freq_mux";
> > +
> > +		avdd-supply = <&mt6358_vcama1_reg>;
> > +		dvdd-supply = <&mt6358_vcn18_reg>;
> > +		dovdd-supply = <&mt6358_vcamio_reg>;
> > +		pwdn-gpios = <&pio 107 1>;
> > +		reset-gpios = <&pio 109 1>;
> > +
> > +		port@0 {

Also, drop the unit-address as there is no 'reg' property. Building your 
dts file will 'W=1' will tell you this.

> > +		   ov02a10_core: endpoint {
> > +		       remote-endpoint = <&ov02a10_0>;
> > +			   data-lanes = <1>;
> > +		   };
> 
> Tabs for indentation, please.
> 
> > +		};
> > +	};
> > +};
> 
> -- 
> Kind regards,
> 
> Sakari Ailus
