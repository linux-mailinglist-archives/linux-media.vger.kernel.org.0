Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9526D4968B8
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 01:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiAVA20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jan 2022 19:28:26 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:35570 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiAVA20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jan 2022 19:28:26 -0500
Received: by mail-oi1-f181.google.com with SMTP id s127so15951210oig.2;
        Fri, 21 Jan 2022 16:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zv+cPZmVfKYvmqTOobK2PM2qsjcr1/IJJymKDRipxEY=;
        b=N49OmB5InG2QXuGLpE3Px9sJnBBnheUcklHaUINJR31a0bk5PWIPMm/9OrFKBzrxEd
         ZKcuzI8MeupUm1JXkTJIEBh3wz6YYzMte0JLFdrv3NrPYPaSjx+donSwQaVS9uFa5OPj
         zYvzrd5iuqePpoBmHyGLvo7AiTBLA5ABHM9o6nJ0ucubbphzXagebFqjQGXjJFk+RReg
         2YblP2zWtMK7ZtG4tqJjrCoEY6Dsi19KgeAf+NcCioMKWCe3rEcq7DkMWThIYJbMQwjk
         Xa2jRwywTBR36srBnOcrzG94FR6BBixegyA9fd4L+14OqiY65nX8ov3nXFhs9b4+bbd+
         h50Q==
X-Gm-Message-State: AOAM533Gs4OAaOMovcKzd5M4ykSukhZSzpxLcG5dv35iy7UhbWWEUNQ1
        UPncGCzLK3PJDirBJdsmRw==
X-Google-Smtp-Source: ABdhPJyd4e3WuvjJTk2qsrWsqqHp+CUSfLtpioZPWr9DhG0gyd12nSa3XSArG4CxPkQt+YZm7c2IWQ==
X-Received: by 2002:a54:460a:: with SMTP id p10mr2550707oip.163.1642811305309;
        Fri, 21 Jan 2022 16:28:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z1sm1699914oti.29.2022.01.21.16.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 16:28:24 -0800 (PST)
Received: (nullmailer pid 1908803 invoked by uid 1000);
        Sat, 22 Jan 2022 00:28:23 -0000
Date:   Fri, 21 Jan 2022 18:28:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thomas Nizan <tnizan@witekio.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2.1 03/11] dt-bindings: media: i2c: max9286: Add
 property to select bus width
Message-ID: <YetPp4Vy3gtv0eaM@robh.at.kernel.org>
References: <20220101182806.19311-4-laurent.pinchart+renesas@ideasonboard.com>
 <20220110212446.3021-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110212446.3021-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 10 Jan 2022 23:24:46 +0200, Laurent Pinchart wrote:
> The GMSL serial data bus width is normally selected by the BWS pin, but
> it can also be configured by software. Add a DT property that allows
> overriding the value of the BWS-selected bus width to support systems
> whose BWS pin doesn't result in the correct value.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Changes since v2:
> 
> - Specify the property type
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
