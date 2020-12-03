Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8CE2CDA66
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 16:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731055AbgLCPwL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 3 Dec 2020 10:52:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731052AbgLCPwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 10:52:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0EFC061A51
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 07:51:30 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkqtB-0003Sr-Th; Thu, 03 Dec 2020 16:51:25 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kkqtB-00087p-Jr; Thu, 03 Dec 2020 16:51:25 +0100
Message-ID: <9147a168f368e7ed4e25f155c03394421b74511c.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: dt-bindings: coda: Add missing
 'additionalProperties'
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Rob Herring <robh@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Date:   Thu, 03 Dec 2020 16:51:25 +0100
In-Reply-To: <20201117200752.4004368-1-robh@kernel.org>
References: <20201117200752.4004368-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-11-17 at 14:07 -0600, Rob Herring wrote:
> 'additionalProperties' is now required by the meta-schema. Add it for
> coda. As a result, 'interrupts', 'interrupt-names' and 'power-domains'
> need to be reworked to be defined at the top level.
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/coda.yaml       | 42 +++++++++----------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
> index 7bac0057faf7..36781ee4617f 100644
> --- a/Documentation/devicetree/bindings/media/coda.yaml
> +++ b/Documentation/devicetree/bindings/media/coda.yaml
> @@ -44,6 +44,21 @@ properties:
>        - const: per
>        - const: ahb
>  
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: BIT processor interrupt
> +      - description: JPEG unit interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - const: bit
> +      - const: jpeg

I understand this would require a property

	interrupt-names = "bit";

in the arch/arm/boot/dts/imx{27,51,53}.dtsi device trees.
That property is currently not required nor present, with only one
interrupt on those devices. Is it possible to set "minItems: 0"?

regards
Philipp
