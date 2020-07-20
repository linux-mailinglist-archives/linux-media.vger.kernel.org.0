Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3199D226F46
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 21:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730014AbgGTTug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 15:50:36 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:39567 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728435AbgGTTuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 15:50:35 -0400
Received: by mail-il1-f195.google.com with SMTP id k6so14378089ili.6;
        Mon, 20 Jul 2020 12:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pw3nfNSVYbLlvuZtUqTHANYMqd3697kJaU7JLsBqfBU=;
        b=En6ZY1wZGfLNBpBS0d+HMoJuz1UH7soCfhB4lvCu1wN64iMUzHG9aWba21CKvWLKFu
         nLrB+Tdk8UudtqLkjDy6bPGqKZxy9etil3x0m8FPCHb7uzi/RrZ1hWJx3trZadeOrDcN
         LTxhRLf56jxCfL+MfkiRFeCXdX/ZtYZshybVO41mAbQYczXLfVJK91jvNyfVrvtQZJAK
         D4Fesq81Q7pZVPWdlgrMlzjjg4bAvAyv7CQMk9Gkug4InbxLOsumMxLPCPf25iLttYML
         67i9y5z+HM7oCSYN/w53fDFG/7b0JZFCqBYChvLJGCDMmNQvxgEkPdX1BKs4Rc8Gw4rY
         0oMA==
X-Gm-Message-State: AOAM531VAfETX9esrM+CJ2mka8CBxqOxzYGGN9YIjBVZxqYseGMoQ5I1
        bsHD1j7uGl57yi/VZfuFCw==
X-Google-Smtp-Source: ABdhPJwD8GtpZXO5BtULoB9rez+5VgrtF/djxq7FleOMmqCR7mWk4LvslHBBv9N1LBybOxdma9a4hA==
X-Received: by 2002:a92:46:: with SMTP id 67mr6968061ila.113.1595274634616;
        Mon, 20 Jul 2020 12:50:34 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y2sm9574181iox.22.2020.07.20.12.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:50:33 -0700 (PDT)
Received: (nullmailer pid 2891674 invoked by uid 1000);
        Mon, 20 Jul 2020 19:50:32 -0000
Date:   Mon, 20 Jul 2020 13:50:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/13] dt-bindings: media: ov5640: Add default for synch
 signals
Message-ID: <20200720195032.GA2889388@bogus>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-10-jacopo+renesas@jmondi.org>
 <20200717205931.GK5961@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717205931.GK5961@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 17, 2020 at 11:59:31PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Fri, Jul 17, 2020 at 03:28:55PM +0200, Jacopo Mondi wrote:
> > Add defalt value for the DVP interface synchronism signals.
> 
> s/synchronism/synchronization/
> 
> > The default values have been derived from register 0x4740
> > documentation (datasheet version 2.03)
> > 
> > 0x4740 POLARITY CTRL00 default = 0x20
> > bit 5: pclk polarity = 1 active high
> > bit 1: HREF polarity = 0 active low
> > bit 0: VSYNC polarity = 0 active low
> 
> Do we need default values ? That's only for the case where the
> properties are not specified, and I think they are mandatory when the
> bus-type is set to parallel, aren't they ? I think stating this
> explicitly will be less error-prone.

In this case, I think default should be fixed or not configurable.

> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > index ab700a1830aa..3c20cdd02f76 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > @@ -94,12 +94,15 @@ properties:
> >  
> >            hsync-active:
> >              enum: [0, 1]
> > +            default: 0
> >  
> >            vsync-active:
> >              enum: [0, 1]
> > +            default: 0
> >  
> >            pclk-sample:
> >              enum: [0, 1]
> > +            default: 1
> >  
> >          allOf:
> >            - if:
> 
> -- 
> Regards,
> 
> Laurent Pinchart
