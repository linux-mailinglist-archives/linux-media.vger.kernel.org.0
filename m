Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AC72C18C2
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 23:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733247AbgKWWqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 17:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732867AbgKWWqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 17:46:18 -0500
X-Greylist: delayed 125720 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 23 Nov 2020 14:46:18 PST
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40917C0613CF;
        Mon, 23 Nov 2020 14:46:18 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3180F634C24;
        Tue, 24 Nov 2020 00:45:43 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1khKad-0001Se-Jj; Tue, 24 Nov 2020 00:45:43 +0200
Date:   Tue, 24 Nov 2020 00:45:43 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2 v6] dt-bindings: leds: Add DT binding for Richtek
 RT8515
Message-ID: <20201123224543.GC4351@valkosipuli.retiisi.org.uk>
References: <20201123214439.1279464-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123214439.1279464-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

On Mon, Nov 23, 2020 at 10:44:38PM +0100, Linus Walleij wrote:
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index f1211e7045f1..92fa90b4a671 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -151,6 +151,12 @@ properties:
>        Maximum flash LED supply current in microamperes. Required for flash LED
>        nodes with configurable current.
>  
> +  torch-max-microamp:
> +    description:
> +      Maximum flash LED supply current in microamperes, when the flash LED is
> +      used as a torch (flashlight). This is usually lower than the flash mode
> +      maximum current, if the LED supports torch mode.

Thanks for the update.

One more thing. The other flash LED DT bindings are using led-max-microamp
for the torch mode --- for it's what the non-flash LEDs do.

Could you use the same here?

With that, for the set:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
