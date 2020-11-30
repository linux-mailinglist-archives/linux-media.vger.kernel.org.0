Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD562C9073
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 23:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730299AbgK3WBk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 17:01:40 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:39435 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgK3WBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 17:01:39 -0500
Received: by mail-io1-f68.google.com with SMTP id j23so13459879iog.6;
        Mon, 30 Nov 2020 14:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ffuQXfxj9ttApqDQouaRNFwUbz09D8Tq1jiRM6FWfMg=;
        b=q6LqRfdA4ekfH5vxTYQFpcaDYCLU3XqQ6byUrhQxAOfTAet701s0q/XePLxzov8uwE
         MMoVUyC31TNaU51GNLUc4yY8H20IHVfFZTg52UvDxlb2xr6RFzRTicuHnyejEes7eGiN
         pNq65WOH0enTLycu7ojKLFTTuZU4ZWN+XFRBgDQfjJtF04cPVmAAVZv2xmJcXFPt0nV9
         1T6GKnzpnZkN8tRnm7sWl3ec3OcJeULvCgTE8Dx4I/CEDsScAFjVRTEwWJ8+LJekuLVe
         XpkwRdSxlyvcDos7uQ7B+KoxjTYgnuaS8sBylfPpGTdEHkN7nZfr69OGson6vz4u+E06
         ZWeQ==
X-Gm-Message-State: AOAM530pjkaNELOeczaLbC5PWwtTzqCEh1Wo4fMcT4gow1+vSWp3MDxg
        NLw8pflZjGS/ncCWEEAqIZ65vpuidQ==
X-Google-Smtp-Source: ABdhPJxiaNzQxKcsJ+2ju8yv8UTh5NosHoYLiQSGl/ZBfcKv//ZlASW+xpxCOe4xrbnIpEdt5dBHKw==
X-Received: by 2002:a5d:9a03:: with SMTP id s3mr17782095iol.20.1606773652684;
        Mon, 30 Nov 2020 14:00:52 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o195sm11503722ila.38.2020.11.30.14.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 14:00:51 -0800 (PST)
Received: (nullmailer pid 3106913 invoked by uid 1000);
        Mon, 30 Nov 2020 22:00:48 -0000
Date:   Mon, 30 Nov 2020 15:00:48 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v5 2/8] dt-bindings: media: max9286: Document
 'maxim,initial-reverse-channel-mV'
Message-ID: <20201130220048.GA3104550@robh.at.kernel.org>
References: <20201116135305.81319-1-jacopo+renesas@jmondi.org>
 <20201116135305.81319-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116135305.81319-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 02:52:59PM +0100, Jacopo Mondi wrote:
> Document the 'initial-reverse-channel-mV' vendor property in the
> bindings document of the max9286 driver.
> 
> The newly introduced property allows to specifying the initial
> configuration of the GMSL reverse control channel to accommodate
> remote serializers pre-programmed with the high threshold power
> supply noise immunity enabled.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 9ea827092fdd..f61234d204fa 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -51,6 +51,26 @@ properties:
>    '#gpio-cells':
>      const: 2
> 
> +  maxim,initial-reverse-channel-mV:

Use standard unit suffix.

> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    minimum: 30
> +    maximum: 200
> +    default: 170
> +    description: |
> +      Initial amplitude of the reverse control channel, in millivolts.
> +
> +      The initial amplitude shall be adjusted to a value compatible with the
> +      configuration of the connected remote serializer.
> +
> +      Some camera modules (for example RDACM20) include an on-board MCU that
> +      pre-programs the embedded serializer with power supply noise immunity
> +      (high-threshold) enabled. A typical value of the deserializer's reverse
> +      channel amplitude to communicate with pre-programmed serializers is 170mV.
> +
> +      A typical value for the reverse channel amplitude to communicate with
> +      a remote serializer whose high-threshold noise immunity is not enabled
> +      is 100mV.
> +
>    ports:
>      type: object
>      description: |
> @@ -221,6 +241,7 @@ required:
>    - ports
>    - i2c-mux
>    - gpio-controller
> +  - maxim,initial-reverse-channel-mV
> 
>  additionalProperties: false
> 
> @@ -243,6 +264,8 @@ examples:
>          gpio-controller;
>          #gpio-cells = <2>;
> 
> +        maxim,initial-reverse-channel-mV = <170>;
> +
>          ports {
>            #address-cells = <1>;
>            #size-cells = <0>;
> --
> 2.29.1
> 
