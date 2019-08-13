Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FAA38B828
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 14:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfHMMOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 08:14:10 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39940 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbfHMMOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 08:14:09 -0400
Received: by mail-pl1-f194.google.com with SMTP id a93so49157553pla.7
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qSoVEIqNaOExh67Z6AKi/3gvBhmET7Q2JnQdOFBkG+Y=;
        b=xVsKlQndmoKfmKjbH3yVxeW1V/Qao83PlCF8Fr+rgXVqfzS1f2OUp/FODQ3Lc4vbbC
         bhIgdsO7DHtzKL4eq86oSP6AwFG2yq2b6WJjGtz862ByPdIwzwKCiL5ZnONtBN803mzJ
         Hp0GoSDNg1ePUSOg6yarxQgtha3y4tfhUTUZ/IMU0HZzdbASQmt2Th8IirIdvaay0wHd
         +OapeDH7N9/2fGO93QtWLxDHTanzS+lk6Jww5APWnGxcrvib4QPLAmq1BY+pqJux9KvG
         1EM8U1fZC4sVg44n0gmoRPjyqLDBIh9QVCahB1Qo28qL9NEdIlH3SbMjA/l1Ehxu6m81
         9CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qSoVEIqNaOExh67Z6AKi/3gvBhmET7Q2JnQdOFBkG+Y=;
        b=kZTM1EogcXP1wLSKSch6leO2E4piId+VrlFInANlTdCHy/6OdlfOCFV53s2fiYWrPV
         TXdaqD6+/vsyKq1f3hv2KWCGRdb8ykQ7s0wwkHIzIc/nfrOA9S4gsQvTOc1EehHWle7C
         EvbiKKuPzBPn4oyS9DZ0iFMuylz3GBir2kfaW5bl2QPoY/u8Yfgb1V2xUm3NFmyYGZ+u
         bvhGGug4FiA4L+//5y0iL0/wyemXAL6qNzALGNRdfdLtJN7ihhPyfrXmJ3tZeqCFFBz1
         SpTJXNHjQKwTOs0fKbmxwifitzn1MvtT7wy9WiuiaXObvmdxSWFsjdHWpCoUTaSwG9gz
         hW+g==
X-Gm-Message-State: APjAAAUCoAwwqQga8J58Ep9wV2lZb5xLzh9NUOwao3Wj/ZWAZCaUG6+y
        3fGi4MMMHk+9J6ZyOmDGHzJ3
X-Google-Smtp-Source: APXvYqyqk5l2TCDeiILn8sdBnKDZ03tP2u4wc3zOtMi6rIRkZXzhbn5iaUNzL/6GdHA2nfzu68C0NQ==
X-Received: by 2002:a17:902:d70e:: with SMTP id w14mr8185306ply.339.1565698448530;
        Tue, 13 Aug 2019 05:14:08 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:649c:6ce0:9d44:669c:5d6c:bc5f])
        by smtp.gmail.com with ESMTPSA id i124sm195773668pfe.61.2019.08.13.05.14.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 05:14:07 -0700 (PDT)
Date:   Tue, 13 Aug 2019 17:44:00 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813121400.GA29378@Mani-XPS-13-9360>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
 <20190813094526.GG835@valkosipuli.retiisi.org.uk>
 <20190813113358.GA28877@Mani-XPS-13-9360>
 <20190813114643.GA2527@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813114643.GA2527@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Aug 13, 2019 at 02:46:43PM +0300, Sakari Ailus wrote:
> Hi Manivannan,
> 
> On Tue, Aug 13, 2019 at 05:03:58PM +0530, Manivannan Sadhasivam wrote:
> > Hi Sakari,
> > 
> > Thanks for the review!
> > 
> > On Tue, Aug 13, 2019 at 12:45:26PM +0300, Sakari Ailus wrote:
> > > Hi Manivannan,
> > > 
> > > On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> > > > Add devicetree binding for IMX290 CMOS image sensor.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/media/i2c/imx290.txt  | 51 +++++++++++++++++++
> > > >  1 file changed, 51 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > new file mode 100644
> > > > index 000000000000..7535b5b5b24b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > @@ -0,0 +1,51 @@
> > > > +* Sony IMX290 1/2.8-Inch CMOS Image Sensor
> > > > +
> > > > +The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
> > > > +Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
> > > > +interfaces. The sensor output is available via CMOS logic parallel SDR output,
> > > > +Low voltage LVDS DDR output and CSI-2 serial data output.
> > > 
> > > If there are three to choose from, then you should specify which one is in
> > > use. Given that I think chances remain slim we'd add support for the other
> > > two (it's certainly not ruled out though), CSI-2 could be the default. But
> > > this needs to be documented.
> > > 
> > 
> > Hmm... I'm not sure here. Bindings should describe the hardware and not the
> > limitations of the driver. Here as you said, the sensor can output frames
> > in 3 different modes/formats but the driver only supports CSI2. I can add a
> > note in the driver but not sure whether dt-binding is the right place or not!
> 
> I guess alternatively you could document the necessary bindings for the
> other two busses.
> 
> But what I'm saying here is that it's highly unlikely they'll be ever
> needed, and it'd be mostly a waste of time to implement that. (That said, I
> have nothing against the use of these busses, but I've never seen anyone
> using them.) Many other devices use defaults for more contentious settings.
> 

Agree with you but my question was, whether I could document the supported
mode in bindings or not! I have seen comments from Rob in the past that the
binding should not document the limitations of the driver. But anyway, one
can infer from the current binding that only CSI2 is supported for now, it's
just stating it explicitly makes me doubtful!

> > 
> > > > +
> > > > +Required Properties:
> > > > +- compatible: Should be "sony,imx290"
> > > > +- reg: I2C bus address of the device
> > > > +- clocks: Reference to the xclk clock.
> > > > +- clock-names: Should be "xclk".
> > > > +- clock-frequency: Frequency of the xclk clock.
> > > 
> > > ...in Hz.
> > > 
> > 
> > Ack.
> > 
> > > > +- vdddo-supply: Sensor digital IO regulator.
> > > > +- vdda-supply: Sensor analog regulator.
> > > > +- vddd-supply: Sensor digital core regulator.
> > > > +
> > > > +Optional Properties:
> > > > +- reset-gpios: Sensor reset GPIO
> > > > +
> > > > +The imx290 device node should contain one 'port' child node with
> > > > +an 'endpoint' subnode. For further reading on port node refer to
> > > > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > > 
> > > Which other properties are relevant for the device?
> > 
> > Not much other than, clock/data lanes.
> 
> Please document data-lanes, and which values it may have.
>

Ack.

> > 
> > > I suppose you can't change the lane order, so clock-lanes is redundant
> > > (don't use it in the example) and data-lanes should be monotonically
> > > incrementing series from 1 to 4.
> > > 
> > 
> > We can change the order and the example here illustrates how it has been
> > wired in FRAMOS module. If I change the lane order like you said, it won't
> > work.
> 
> I highly doubt that. Neither the driver nor the sensor uses the lane
> ordering information.
> 

Agree but CSI2 host will need this informtion, right? Please correct me if
I'm wrong!

> And even if the driver only supported four lanes, then it should check the
> number of lanes is actually four.
> 

Ack. Sensor works with 2/4 lanes but the driver only handles 4 for now. Will
add the check in driver.

Thanks,
Mani

> -- 
> Regards,
> 
> Sakari Ailus
