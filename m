Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60EA78B700
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfHMLeJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:34:09 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34722 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbfHMLeI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:34:08 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so44899466pgc.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aqKzsId2hKvcmQF7fGKO1YK1h2GnFRh9+uXig4ZlhlI=;
        b=qIM74CehEWqpruIVCMxZ1SU6H+bafjp4CnsZA1QUPeAuSeAXNz0eJuPF1cvKYzNPrB
         Urm06rTx/UJ10JMASVZP7ORYWict6oCGdi8OT1E2aX8Bmx2GqZsjr6TemvVAU+g1KHjr
         XJV88ycQnQ9nqtp2YkULT9jrRkG7Xb/QMehenAgC+HxOSsfOJ1pc5rEu5YgN3/c/dhuP
         0x4VToIoFdcK6KsaZKVf2eTz52vHeh3UDKxpe768xMZHZB88ySoKj4PV38tA7ZDTqfvV
         0q+76Tfv0+ULGbjk7PkKRYbaMNqCPrP4086Tq5UuMSccQGKdDl01hven962hEj4XK0JI
         5EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aqKzsId2hKvcmQF7fGKO1YK1h2GnFRh9+uXig4ZlhlI=;
        b=GhQCCwIgaZr7Ec04GNI0gjydP+yZKcE5reapzkQjJxvGB+yl+4PzIMND/yXGEDz1ap
         uYA7nbCYGDCyhpii1G116pAa6f3fXsexZdXMFEmwZOMDPJ3zhIcgtmJhRgSWZMw0IMTF
         KSFHIVA5BgV1JRG/3D4E+nSSbzQ8c8+IJs9QkKeMAz+wLx5CVFXxOt66PLeNUMLhsZ2w
         0OpvlZHEo41JXIn00FKhARnmiwu7tUtLCzbmQCQ+GBy110NDS0YXAN7VUBbpu40tF/wF
         i28ZSWENsywU+o8xN/LBsCQCv4+HCrKjYJTdMru9CxlXuFBc+z+eRc8k09lnnEQhfJEV
         RVFg==
X-Gm-Message-State: APjAAAVx2JJdhiN50JDqsJ37EUJ/5dR+cXDVw9qp9+pz/czdZR2HRRAf
        W5YiQqZEMkzjK0vs9oIL/DNI
X-Google-Smtp-Source: APXvYqxFqGvvALogO0qGnnxAWwPceWM61LYF6yJdHePWaHoUBIRZ6KPZx+AQ7CTcd9g3uFciYU6ehg==
X-Received: by 2002:a17:90a:bc42:: with SMTP id t2mr1777337pjv.121.1565696047695;
        Tue, 13 Aug 2019 04:34:07 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:649c:6ce0:9d44:669c:5d6c:bc5f])
        by smtp.gmail.com with ESMTPSA id o24sm199536009pfp.135.2019.08.13.04.34.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 04:34:07 -0700 (PDT)
Date:   Tue, 13 Aug 2019 17:03:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813113358.GA28877@Mani-XPS-13-9360>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
 <20190813094526.GG835@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813094526.GG835@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for the review!

On Tue, Aug 13, 2019 at 12:45:26PM +0300, Sakari Ailus wrote:
> Hi Manivannan,
> 
> On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> > Add devicetree binding for IMX290 CMOS image sensor.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/media/i2c/imx290.txt  | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > new file mode 100644
> > index 000000000000..7535b5b5b24b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > @@ -0,0 +1,51 @@
> > +* Sony IMX290 1/2.8-Inch CMOS Image Sensor
> > +
> > +The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
> > +Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
> > +interfaces. The sensor output is available via CMOS logic parallel SDR output,
> > +Low voltage LVDS DDR output and CSI-2 serial data output.
> 
> If there are three to choose from, then you should specify which one is in
> use. Given that I think chances remain slim we'd add support for the other
> two (it's certainly not ruled out though), CSI-2 could be the default. But
> this needs to be documented.
> 

Hmm... I'm not sure here. Bindings should describe the hardware and not the
limitations of the driver. Here as you said, the sensor can output frames
in 3 different modes/formats but the driver only supports CSI2. I can add a
note in the driver but not sure whether dt-binding is the right place or not!

> > +
> > +Required Properties:
> > +- compatible: Should be "sony,imx290"
> > +- reg: I2C bus address of the device
> > +- clocks: Reference to the xclk clock.
> > +- clock-names: Should be "xclk".
> > +- clock-frequency: Frequency of the xclk clock.
> 
> ...in Hz.
> 

Ack.

> > +- vdddo-supply: Sensor digital IO regulator.
> > +- vdda-supply: Sensor analog regulator.
> > +- vddd-supply: Sensor digital core regulator.
> > +
> > +Optional Properties:
> > +- reset-gpios: Sensor reset GPIO
> > +
> > +The imx290 device node should contain one 'port' child node with
> > +an 'endpoint' subnode. For further reading on port node refer to
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> 
> Which other properties are relevant for the device?

Not much other than, clock/data lanes.

> I suppose you can't change the lane order, so clock-lanes is redundant
> (don't use it in the example) and data-lanes should be monotonically
> incrementing series from 1 to 4.
> 

We can change the order and the example here illustrates how it has been
wired in FRAMOS module. If I change the lane order like you said, it won't
work.

> > +
> > +Example:
> > +	&i2c1 {
> > +		...
> > +		imx290: imx290@1a {
> 
> imx290: camera-sensor@1a {

Ack.

Thanks,
Mani

> 
> > +			compatible = "sony,imx290";
> > +			reg = <0x1a>;
> > +
> > +			reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> > +			pinctrl-names = "default";
> > +			pinctrl-0 = <&camera_rear_default>;
> > +
> > +			clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> > +			clock-names = "xclk";
> > +			clock-frequency = <37125000>;
> > +
> > +			vdddo-supply = <&camera_vdddo_1v8>;
> > +			vdda-supply = <&camera_vdda_2v8>;
> > +			vddd-supply = <&camera_vddd_1v5>;
> > +
> > +			port {
> > +				imx290_ep: endpoint {
> > +					clock-lanes = <1>;
> > +					data-lanes = <0 2 3 4>;
> > +					remote-endpoint = <&csiphy0_ep>;
> > +				};
> > +			};
> > +		};
> 
> -- 
> Regards,
> 
> Sakari Ailus
