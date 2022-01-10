Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD5548A128
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 21:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343592AbiAJUxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 15:53:31 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:41974 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243927AbiAJUx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 15:53:28 -0500
Received: by mail-oi1-f175.google.com with SMTP id q186so14891971oih.8;
        Mon, 10 Jan 2022 12:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g/f29/VeybHmKBuZISOgPk113LWmAqeqK6xdSwv4Wkk=;
        b=tWEMCOsTa9k3yyTVZoG10TKkefTwo8acLvlv8D46Z7S1B2z0RE0XDOYQAu3OPcUgn0
         cwwPDBbyLZ1k+ZeaHfwycLMJBYX+uZWY+VPvmMJypqsDZ4zjrDWzm+auz2cnOOSfqIdG
         XghGEeF5yAK1aqW9JoDfBJ/9zOM9yo3DTzkvuux2dHpVPurPiSuPKmr/4tU71VN/WMnl
         G2k7S4xpkSONotJHrglWb4EjrfQAHxMHAzUPWbIw78ehg+GqmUTNGmg9tiSH3IMEJJrb
         KdfaryuRYd0xCc6PuvnEXGPGYYRYu6GNS0Y8YxSkGyy4Os0D4r7mha0zXcGiYd8GEgMI
         tuQA==
X-Gm-Message-State: AOAM530lrlsS8/aPFkge2dFyPMbqJfvArHalP6xtvsnW9pa6i38RH+xo
        9lqIUabmxF32p/zaz6+fSA==
X-Google-Smtp-Source: ABdhPJydQ1atnnSgGAiReb0y3fCbcqp1Q0BIVN4rdmZ9UPR4kCB5rQ+EiuAtxmLTaF7WxGirdTKlkQ==
X-Received: by 2002:a05:6808:f94:: with SMTP id o20mr903400oiw.54.1641848007502;
        Mon, 10 Jan 2022 12:53:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e19sm1703396otk.47.2022.01.10.12.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 12:53:26 -0800 (PST)
Received: (nullmailer pid 1488301 invoked by uid 1000);
        Mon, 10 Jan 2022 20:53:25 -0000
Date:   Mon, 10 Jan 2022 14:53:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Thomas Nizan <tnizan@witekio.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] dt-bindings: media: i2c: max9286: Add property
 to select bus width
Message-ID: <YdycxTsKRudqOJHY@robh.at.kernel.org>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-4-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 01, 2022 at 08:27:58PM +0200, Laurent Pinchart wrote:
> The GMSL serial data bus width is normally selected by the BWS pin, but
> it can also be configured by software. Add a DT property that allows
> overriding the value of the BWS-selected bus width to support systems
> whose BWS pin doesn't result in the correct value.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 5d3e99027a79..123e98cdb7b6 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -50,6 +50,13 @@ properties:
>    '#gpio-cells':
>      const: 2
>  
> +  maxim,bus-width:

Needs a $ref to a type.

> +    enum: [ 24, 27, 32 ]
> +    description: |
> +      The GMSL serial data bus width. This setting is normally controlled by
> +      the BWS pin, but may be overridden with this property. The value must
> +      match the configuration of the remote serializers.
> +
>    maxim,i2c-clock-frequency:
>      enum: [ 8470, 28300, 84700, 105000, 173000, 339000, 533000, 837000 ]
>      default: 105000
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
