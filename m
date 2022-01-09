Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3985A4888F8
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 12:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbiAILqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 06:46:22 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:49507 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiAILqV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 06:46:21 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id DBB3E100002;
        Sun,  9 Jan 2022 11:46:18 +0000 (UTC)
Date:   Sun, 9 Jan 2022 12:47:19 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] dt-bindings: media: i2c: max9286: Add property
 to select bus width
Message-ID: <20220109114719.x6zuqtfukgjae3to@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-4-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jan 01, 2022 at 08:27:58PM +0200, Laurent Pinchart wrote:
> The GMSL serial data bus width is normally selected by the BWS pin, but
> it can also be configured by software. Add a DT property that allows
> overriding the value of the BWS-selected bus width to support systems
> whose BWS pin doesn't result in the correct value.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

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
