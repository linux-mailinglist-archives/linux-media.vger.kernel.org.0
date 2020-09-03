Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA6F25C162
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 14:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728651AbgICMyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 08:54:43 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53447 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728918AbgICMwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 08:52:09 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1547520006;
        Thu,  3 Sep 2020 12:51:55 +0000 (UTC)
Date:   Thu, 3 Sep 2020 14:55:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, jacopo+renesas@jmondi.org,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: media: imx274: Add optional input
 clock and supplies
Message-ID: <20200903125542.nxiafnysatoexken@uno.localdomain>
References: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
 <1599012278-10203-3-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1599012278-10203-3-git-send-email-skomatineni@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Sowjanya,

On Tue, Sep 01, 2020 at 07:04:37PM -0700, Sowjanya Komatineni wrote:
> This patch adds IMX274 optional external clock input and voltage
> supplies to device tree bindings.
>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx274.yaml  | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> index 7ae47a6..57e7176 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
> @@ -25,6 +25,27 @@ properties:
>    reset-gpios:
>      maxItems: 1
>

I just sent an update to my json-schema conversion of this bindings
document (not yet on patchwork, sorry) and Sakari pointed me to the
fact in between my v2 and my v4 this patch from you went in:
4ea3273d24b ("dt-bindings: media: imx274: Add optional input clock and supplies")

I should probably now update my bindings conversion patch, basically
taking in what you've done here, but I would have one question.

> +  clocks:
> +    maxItems: 1
> +    description: Reference to the sensor input clock
> +
> +  clock-names:
> +    maxItems: 1
> +    items:
> +      - const: inck
> +
> +  vana-supply:
> +    description:
> +      Analog voltage supply, 2.8 volts
> +
> +  vdig-supply:
> +    description:
> +      Digital IO voltage supply, 1.8 volts
> +
> +  vddl-supply:
> +    description:
> +      Digital core voltage supply, 1.2 volts

4ea3273d24b introduced these regulators as VANA-supply, VDIG-supply
and VDDL-supply (please note the upper-case names). This version uses
lower-case ones instead. Is this intentional ? The driver currently
does not parse any of these if I'm not mistaken, but as the bindings
in textual form defines an ABI which should be preserved during the
conversion to json-schema, should these be kept in upper-case ?

Thanks
   j

> +
>    port:
>      type: object
>      description: |
> --
> 2.7.4
>
