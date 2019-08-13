Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECE88BACA
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 15:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbfHMNwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 09:52:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45773 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729259AbfHMNwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 09:52:20 -0400
Received: by mail-pf1-f195.google.com with SMTP id w26so6385458pfq.12
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4omLmk4w6GxhJ6Ep/AGChVMuZmOFfkXmdaJYpOvWVdk=;
        b=Jm8wdiOchfcFJ0gRIk1GejkC9wyb0VHkwgGVXz8gKdqL7fzLdNe4X+BSaGG9GuV7hq
         7sD0rsng093Rsmzie0SdLHRA90thFE9fYj9WOv0ACjtbPytWctwLPNobjvwDlDrUm4jM
         +RiB/SkxEIKpmhyQWtb2ylSHLydV8aBHuQApwmN8zntmaCpdalFNBJkSWHshpYyVFOaE
         Qxc6xffuXBWRbS4E3gyJNLpoMCzlVb7s7hqB5moABRoHMHcPlrO7/sTM4WZowUZ3rGWX
         ZoYV4s/si/3dn7P9hJev1D9DePTX2DxnvqcyFilWTIfI+RaWWt2/x4YIohOqR7cPbIrn
         sc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4omLmk4w6GxhJ6Ep/AGChVMuZmOFfkXmdaJYpOvWVdk=;
        b=AITTmfcDb1GQl4V/Ismx5AHfJStrnW/w+2GN3GFHYTbMfcvVEg0grK123rLk3PcECW
         Rt3988Qul702Yau+u76oWUjqQ/vGj3c/g9P+q/QeluBtlTVmiewtQ2HvSqowDk13dp9L
         7Lo1O5cuZMYGdwP5jRdyGWsu5qzdiGfvDuORD7I3FfDOPGc+yLBcQbHoOdeplULC8nA8
         uqmdRvja1i+HDvJP30GoMjzhwa26r8qf69Hivbu+9W9BVRrR8jtBH/giCmqoVXDJdxvg
         zS9qp0qfwbKGLQlJMbQi6DJz/APpqVg18Mqhuyp+iEXe8ILPk4rhJOv1SsZ1bRVisrOl
         gZ5w==
X-Gm-Message-State: APjAAAVrbJsjhrSUql8+cnyIA7FfYm4y5uS6qh556Ad+6r1+K64y/iJz
        ruDbz38kq6oobiM8UbtjqLV7
X-Google-Smtp-Source: APXvYqwav0H6AVbnE2BwPov0OYBYEHoA+VkHR9bqs+s/y71GBF2NtI/p4j6/PJKhz+s8rgdAUXLynw==
X-Received: by 2002:aa7:8b52:: with SMTP id i18mr41768736pfd.194.1565704339044;
        Tue, 13 Aug 2019 06:52:19 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:649c:6ce0:9d44:669c:5d6c:bc5f])
        by smtp.gmail.com with ESMTPSA id j9sm16595539pfe.103.2019.08.13.06.52.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 06:52:18 -0700 (PDT)
Date:   Tue, 13 Aug 2019 19:22:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813135209.GA30945@Mani-XPS-13-9360>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
 <20190813094526.GG835@valkosipuli.retiisi.org.uk>
 <20190813113358.GA28877@Mani-XPS-13-9360>
 <20190813114643.GA2527@valkosipuli.retiisi.org.uk>
 <20190813121400.GA29378@Mani-XPS-13-9360>
 <20190813122212.GE2527@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813122212.GE2527@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Aug 13, 2019 at 03:22:12PM +0300, Sakari Ailus wrote:
> Hi Manivannan,
> 
> On Tue, Aug 13, 2019 at 05:44:00PM +0530, Manivannan Sadhasivam wrote:
> > Hi Sakari,
> > 
> > On Tue, Aug 13, 2019 at 02:46:43PM +0300, Sakari Ailus wrote:
> > > Hi Manivannan,
> > > 
> > > On Tue, Aug 13, 2019 at 05:03:58PM +0530, Manivannan Sadhasivam wrote:
> > > > Hi Sakari,
> > > > 
> > > > Thanks for the review!
> > > > 
> > > > On Tue, Aug 13, 2019 at 12:45:26PM +0300, Sakari Ailus wrote:
> > > > > Hi Manivannan,
> > > > > 
> > > > > On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> > > > > > Add devicetree binding for IMX290 CMOS image sensor.
> > > > > > 
> > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > > ---
> > > > > >  .../devicetree/bindings/media/i2c/imx290.txt  | 51 +++++++++++++++++++
> > > > > >  1 file changed, 51 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > > > 
> > > > > > diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > > > new file mode 100644
> > > > > > index 000000000000..7535b5b5b24b
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > > > > > @@ -0,0 +1,51 @@
> > > > > > +* Sony IMX290 1/2.8-Inch CMOS Image Sensor
> > > > > > +
> > > > > > +The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
> > > > > > +Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
> > > > > > +interfaces. The sensor output is available via CMOS logic parallel SDR output,
> > > > > > +Low voltage LVDS DDR output and CSI-2 serial data output.
> > > > > 
> > > > > If there are three to choose from, then you should specify which one is in
> > > > > use. Given that I think chances remain slim we'd add support for the other
> > > > > two (it's certainly not ruled out though), CSI-2 could be the default. But
> > > > > this needs to be documented.
> > > > > 
> > > > 
> > > > Hmm... I'm not sure here. Bindings should describe the hardware and not the
> > > > limitations of the driver. Here as you said, the sensor can output frames
> > > > in 3 different modes/formats but the driver only supports CSI2. I can add a
> > > > note in the driver but not sure whether dt-binding is the right place or not!
> > > 
> > > I guess alternatively you could document the necessary bindings for the
> > > other two busses.
> > > 
> > > But what I'm saying here is that it's highly unlikely they'll be ever
> > > needed, and it'd be mostly a waste of time to implement that. (That said, I
> > > have nothing against the use of these busses, but I've never seen anyone
> > > using them.) Many other devices use defaults for more contentious settings.
> > > 
> > 
> > Agree with you but my question was, whether I could document the supported
> > mode in bindings or not! I have seen comments from Rob in the past that the
> > binding should not document the limitations of the driver. But anyway, one
> > can infer from the current binding that only CSI2 is supported for now, it's
> > just stating it explicitly makes me doubtful!
> 
> I think it could be e.g.:
> 
> The CSI-2 bus is the default. No bindings have been defined for the other
> busses.
> 

Ack.

> ...
> 
> > > > > I suppose you can't change the lane order, so clock-lanes is redundant
> > > > > (don't use it in the example) and data-lanes should be monotonically
> > > > > incrementing series from 1 to 4.
> > > > > 
> > > > 
> > > > We can change the order and the example here illustrates how it has been
> > > > wired in FRAMOS module. If I change the lane order like you said, it won't
> > > > work.
> > > 
> > > I highly doubt that. Neither the driver nor the sensor uses the lane
> > > ordering information.
> > > 
> > 
> > Agree but CSI2 host will need this informtion, right? Please correct me if
> > I'm wrong!
> 
> The CSI-2 receiver may need that configuration, but it's not addressed by a
> sensor's binding documentation (it's configured in the endpoint on the
> receiver's side).
> 

Yes but I thought that documenting the sensor lane configuration based on one
example implementation might help interfacing w/ different hosts. Anyway, to be
host agnostic, I can drop the clock lane and make data lane start from 1 as you
suggested.

Thanks,
Mani

> -- 
> Sakari Ailus
