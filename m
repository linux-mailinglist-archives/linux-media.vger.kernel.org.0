Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C753925632A
	for <lists+linux-media@lfdr.de>; Sat, 29 Aug 2020 00:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgH1W3c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 18:29:32 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:32810 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbgH1W3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 18:29:30 -0400
Received: by mail-il1-f195.google.com with SMTP id o16so2001146ilq.0;
        Fri, 28 Aug 2020 15:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iQFt0CihdxULy68nCcZYRd5kNaVJz8UvKS1N864J1BU=;
        b=OKFFFD/IAjuDSWXRbefgts2fsucj+XfO9ReDxaY6ig8vR9APKxYNZ4tkTtun8BCdOP
         lHX8/Dfy+RFp1eJxAaCW83YdgHQo7cXOJWLyssFa2Beh9rVa4TD/RX9UHcQyXjoaD48o
         2rBFIJVM5ZmKxmQv4zgG+/rbQdNzpTHZFeC+WaIJkR4Tt8htE55liG7BwXEgLMWfZouk
         HqcwXO2lOo2FPSyin/J5jEMQ76/NSBe0EZYQX4rGrkNX4KRKkqqqSFyAnhng4GU5DIoL
         7/YAel5o5Nf+V2RkEiy01pn2djjqLjtfoHpGs/vSPeWjCFGfPSSq0C6z6Rl5FY9VXR/R
         sNig==
X-Gm-Message-State: AOAM53151fzs9OLjPeRjsrF0NeG3nsAuByu8MiWh9fb8lbgso/5FQgM+
        IVizcPPSvS0JprCU+wMAAVyM1ccYtSax
X-Google-Smtp-Source: ABdhPJyj1oI54kmO0VXet0M6Wnlx/AtnPO4DySgp+eMvr8ExcaO1uBfFrUQ2jyrnEZyhLuZlNMukGQ==
X-Received: by 2002:a92:c502:: with SMTP id r2mr867409ilg.223.1598653769307;
        Fri, 28 Aug 2020 15:29:29 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id t16sm353320ili.75.2020.08.28.15.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 15:29:28 -0700 (PDT)
Received: (nullmailer pid 3519224 invoked by uid 1000);
        Fri, 28 Aug 2020 22:29:27 -0000
Date:   Fri, 28 Aug 2020 16:29:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Message-ID: <20200828222927.GA3519178@bogus>
References: <20200826065142.205000-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826065142.205000-1-eugen.hristev@microchip.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 26 Aug 2020 09:51:40 +0300, Eugen Hristev wrote:
> Add bindings documentation for Microchip CSI2 Demultiplexer controller.
> 
> CSI2DC is a demultiplexer from Synopsys IDI interface specification to
> parallel interface connection or direct memory access.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v3:
> - Removed some text from description, as it was explained in the schema
> - fixed other things as per Rob's review
> - moved some text inside the schema, like the clock description
> 
> Changes in v2:
> - fixed warnings reported by dt_binding_check
> 
>  .../bindings/media/microchip,csi2dc.yaml      | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
