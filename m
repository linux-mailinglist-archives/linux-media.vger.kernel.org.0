Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC9A244174
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 00:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgHMWrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 18:47:03 -0400
Received: from retiisi.org.uk ([95.216.213.190]:45724 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726205AbgHMWrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 18:47:02 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 7AB1F634C87;
        Fri, 14 Aug 2020 01:46:19 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k6LzH-0001kc-9J; Fri, 14 Aug 2020 01:46:19 +0300
Date:   Fri, 14 Aug 2020 01:46:19 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: csi2dc: add bindings for
 microchip csi2dc
Message-ID: <20200813224619.GN840@valkosipuli.retiisi.org.uk>
References: <20200703074416.55272-1-eugen.hristev@microchip.com>
 <20200703074416.55272-2-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703074416.55272-2-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Fri, Jul 03, 2020 at 10:44:13AM +0300, Eugen Hristev wrote:
> Add bindings documentation for microchip CSI2 Demultiplexer controller.

...

> +  port@1:
> +    type: object
> +    description:
> +      Output port node, single endpoint, describing the output pad.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      reg:
> +        const: 1
> +
> +    patternProperties:
> +      "^endpoint@[0-9a-f]$":
> +        type: object
> +
> +        properties:
> +          reg:
> +            enum: [0, 1, 2, 3]
> +            description: virtual channel for the endpoint

Unless you need this right now I'd just hard code this to zero in the
driver. You can't have more endpoints for active devices anyway, can you?

-- 
Sakari Ailus
