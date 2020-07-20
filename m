Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFBF226F1B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 21:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbgGTTgK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 15:36:10 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34180 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgGTTgK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 15:36:10 -0400
Received: by mail-io1-f68.google.com with SMTP id q74so18912106iod.1;
        Mon, 20 Jul 2020 12:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1YZl80952mHTSs8UNwk68pvRqpUlNAQdc1Q4B7k7SNM=;
        b=QtpbFdhZhjJ3OT+s+fDEdMsb3JgKGpGeDg+L2aUySOkkyM68LDynT4d4N99YvBPHQa
         1asdfdJkzgpxA+PPTFg99BiliDy/XNpXjy60z0RvGnxqFerBsk6IIKv7XOBeZ6cLK6yg
         bIUyyP67qlKCLYDm6HefJvV2Ws4OCt/i0NhklvGDW422ZVwtFJ8PbQj6e/XNkIqCM5GW
         JwndOwi4EjepESHcdE2hMZdw38mjdQjzoaQ5RdXCcTOSvLhBDjraaNdUqlYH+dq43K7h
         Gqc7kJA5fZuaLOORVoxu0F6N0+0Nc6+iABiqDYlIfk9LDZ77ThoROLnproRe+/y6ohKv
         PzjA==
X-Gm-Message-State: AOAM5304GR+6+J0t97bxgEQH/By7696wblYkhcbzE1wslZXjErNjVUYE
        0+3xlFoP8XuWlP1LDLmY0w==
X-Google-Smtp-Source: ABdhPJzc8i0GZHL5ILLIAxZ8ilXyFLcBjyDnfVYAFmK/L3yC7ekaolASQz7arjDrz62StByEvkBNPg==
X-Received: by 2002:a6b:ba8b:: with SMTP id k133mr24656306iof.204.1595273769393;
        Mon, 20 Jul 2020 12:36:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a10sm9267565iln.20.2020.07.20.12.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:36:07 -0700 (PDT)
Received: (nullmailer pid 2872234 invoked by uid 1000);
        Mon, 20 Jul 2020 19:36:06 -0000
Date:   Mon, 20 Jul 2020 13:36:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        devicetree@vger.kernel.org, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/13] dt-bindings: media: ov5640: Do not limit rotation
Message-ID: <20200720193606.GA2858543@bogus>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-4-jacopo+renesas@jmondi.org>
 <20200717193807.GE5961@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717193807.GE5961@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 17, 2020 at 10:38:07PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Fri, Jul 17, 2020 at 03:28:49PM +0200, Jacopo Mondi wrote:
> > The 'rotation' property should not be limited to only support 0 and
> > 180 degrees, as that limitation comes from the driver implementation
> > and not from any device specific constraint.
> > 
> > Remove the enumeration of supported values from 'rotation'.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > index ceeacc91c801..503f8b78615c 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> > @@ -55,7 +55,7 @@ properties:
> >    rotation:
> >      description: |
> >        As defined in Documentation/devicetree/bindings/media/video-interfaces.txt
> > -    enum: [0, 180]
> > +    maxItems: 1

Not an array, so 'maxItems' doesn't make sense here.

> 
> Maybe
> 
>     $ref: /schemas/types.yaml#/definitions/uint32
>     minimum: 0
>     maximum: 359
> 
> ?

We should have a common definition and this binding just needs to define 
the specific constraints. If none, then just 'rotation: true'.

Rob
