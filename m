Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F481478D43
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 15:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237077AbhLQOSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 09:18:08 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46896 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237072AbhLQOSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 09:18:08 -0500
Received: by mail-ot1-f42.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so2978217oto.13;
        Fri, 17 Dec 2021 06:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xddMlbg1g/0LpYJfFuVuu5Xj6Q9p1GcnY1zOaY607O8=;
        b=qFhQw58sN2jsdGeXm/9BGges74mggxpmKaWrZo2NsrFeZh3EWhS8lTbOPizPyz/P4N
         4y1WisU6FjrjbMQ6JP458cR8JkBW9BFIh5h/KiKhqliTkZqb2M3RTprROLHkQkHH6G5V
         WcwQsFFVFVpnYlleL39D8lmom8xNM8teyvqGmlORGDNsWA3hsMdg1KMQqZB/I1hy0Oxh
         Ra1BdD5+1J6cndKbm6lAFI/XyGJU8en8ll4AioMLNgYbxtw3XvdivnreCm7xcdnvqBKV
         wabBHNeCmD11p5ANq9gzG5bFfaILBBsLlcTZAMG9OgOh1JXJf7zAAgxP0kSW/J5NQ4tT
         Uhvw==
X-Gm-Message-State: AOAM532E1AzjRWcw/cR6vAoT5QXBvNm9QtXCU/GVbPn4W5OnqHcqz+gt
        DUkimjPLL7RO2aT1ke1WjD/2UwYTwQ==
X-Google-Smtp-Source: ABdhPJy2QHsjZm275n7ZX1psNGuJEUVKk/vqlEdt1Wxb7hy6fmTk+f/3jNqy4KS2yQ1re73Be8Zo+Q==
X-Received: by 2002:a9d:137:: with SMTP id 52mr2261764otu.260.1639750687565;
        Fri, 17 Dec 2021 06:18:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x12sm1600451oom.44.2021.12.17.06.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 06:18:07 -0800 (PST)
Received: (nullmailer pid 2808666 invoked by uid 1000);
        Fri, 17 Dec 2021 14:18:06 -0000
Date:   Fri, 17 Dec 2021 08:18:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: max9286: Add support for
 per-port supplies
Message-ID: <YbycHk2r+63PT+kP@robh.at.kernel.org>
References: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211216220946.20771-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216220946.20771-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 17, 2021 at 12:09:44AM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Power supplies for the ports can be controlled per port depending on the
> hardware design. Support per-port supplies in the DT bindings, mutually
> exclusive with the global supply.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 02f656e78700..33aa307e8ee5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -39,7 +39,7 @@ properties:
>      maxItems: 1
>  
>    poc-supply:
> -    description: Regulator providing Power over Coax to the cameras
> +    description: Regulator providing Power over Coax to all the ports
>  
>    enable-gpios:
>      description: GPIO connected to the \#PWDN pin with inverted polarity
> @@ -160,6 +160,10 @@ properties:
>  
>              additionalProperties: false
>  
> +patternProperties:
> +  "^port[0-3]-poc-supply$":
> +    description: Regulator providing Power over Coax for a particular port
> +
>  required:
>    - compatible
>    - reg
> @@ -167,6 +171,25 @@ required:
>    - i2c-mux
>    - gpio-controller
>  
> +allOf:
> +  - if:
> +      required:
> +        - poc-supply
> +    then:
> +      allOf:
> +        - not:
> +            required:
> +              - port0-poc-supply
> +        - not:
> +            required:
> +              - port1-poc-supply
> +        - not:
> +            required:
> +              - port2-poc-supply
> +        - not:
> +            required:
> +              - port3-poc-supply

I think you can invert the if and move patternProperties to the 'then' 
and...

> +
>  additionalProperties: false

then use unevaluatedProperties here.

Rob
