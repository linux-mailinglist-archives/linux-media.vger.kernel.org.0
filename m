Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F2B4845AB
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 16:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbiADP4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 10:56:25 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:37477 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235330AbiADP4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 10:56:21 -0500
Received: by mail-oi1-f177.google.com with SMTP id i9so51832629oih.4;
        Tue, 04 Jan 2022 07:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UDkI8c4C+W3C1L2xmnxS2iQML1CaWO7g4jG+vK+lDSI=;
        b=WDoPrwLU/vU1GbwZJaX4UncrgmRQgvCPW8woQei7MVKt7He7yyx9ZZBILPROPkNig2
         sMFz3gbQBkGfzMKvvF1LdYRPxg1WAhdSyqJCRJ8RBRsoFWWJkEYqQICYncD3+DaJkSo5
         kfe8bx2sXEWIemkhcuPRRkkzvkrtij/3yttuuwjDlCrDWEkPBz6w8lzbw+pKuCBK55gh
         JD3cWm+62ok2AD6ilvROaQjIiWRkUzjzuwplECv7drui9glXku/MpwHy0CcaWP/qQOab
         iwuSgz8d80WUCOyjTvJN1C84QAq+1kLBYtmb97W6jB/zwMc9Y7iEsHDDn6GbeDqv70i3
         C99g==
X-Gm-Message-State: AOAM532twftKz/kz0eCYhPpakgZCjfUQKiE/A3Cb/1cEZUXaANZcUlVo
        qxL3r9PL0QjE80Kbc90Xba9LGHfBOA==
X-Google-Smtp-Source: ABdhPJzMUwln+0FhAWxpm99txJ5a4ASzL30GX9qoEHQOsvtBhmaj/cyoH/K2ZuGq8KgJoNmy89YqDA==
X-Received: by 2002:aca:1818:: with SMTP id h24mr39881146oih.174.1641311780194;
        Tue, 04 Jan 2022 07:56:20 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k1sm8213397otj.61.2022.01.04.07.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 07:56:19 -0800 (PST)
Received: (nullmailer pid 915707 invoked by uid 1000);
        Tue, 04 Jan 2022 15:56:18 -0000
Date:   Tue, 4 Jan 2022 09:56:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Thomas Nizan <tnizan@witekio.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/11] dt-bindings: media: i2c: max9286: Add property
 to select I2C speed
Message-ID: <YdRuIgC5sHI6TSUg@robh.at.kernel.org>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-3-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 01, 2022 at 08:27:57PM +0200, Laurent Pinchart wrote:
> The I2C speed on the remote side (the I2C master bus of the connected
> serializers) is configurable, and doesn't need to match the speed of the
> local bus (the slave bus of the MAX9286). All remote buses must use the
> same speed, and the MAX9286 needs to be programmed accordingly. Add a
> new DT property to select the speed to make it configurable.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml       | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index c20557b52e45..5d3e99027a79 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -50,6 +50,13 @@ properties:
>    '#gpio-cells':
>      const: 2
>  
> +  maxim,i2c-clock-frequency:

Use '-hz'. I don't see much reason to align with 'clock-frequency'.

Actually, I'd make this 'maxim,i2c-remote-bus-hz' or similar to be a bit 
more self-describing.

> +    enum: [ 8470, 28300, 84700, 105000, 173000, 339000, 533000, 837000 ]
> +    default: 105000
> +    description: |
> +      The I2C clock frequency for the remote I2C buses. The value must match
> +      the configuration of the remote serializers.
> +
>    maxim,reverse-channel-microvolt:
>      minimum: 30000
>      maximum: 200000
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
