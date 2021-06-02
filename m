Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDB9398B13
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 15:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhFBNyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 09:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhFBNyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 09:54:16 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675F5C061574
        for <linux-media@vger.kernel.org>; Wed,  2 Jun 2021 06:52:33 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010::e64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id F2FA8201E0;
        Wed,  2 Jun 2021 16:52:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1622641948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XasE4YAlNMR4WrY6dbX8b0zZWRhV24uifEW0Tnx0hOw=;
        b=cqoamrpMrsiGqJXo3AYGEX/BGroPhrmZJN5P8mYFRLehd+o3Y/MiWQy4tZ7JLczMmSjzfb
        SYptjivwo02pWcr6HE27e3Ma3rnJy7GL6WArjTaZAHFnPL0E8bEY6stT8oKH+pbus0lWbW
        Km/uOJ2AMxNRmCy+vgQE3BqZMZd1aRg=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9C9D8634C87;
        Wed,  2 Jun 2021 16:51:34 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1loRIJ-0002Uv-Ig; Wed, 02 Jun 2021 16:52:27 +0300
Date:   Wed, 2 Jun 2021 16:52:27 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>, mchehab@kernel.org,
        devicetree@vger.kernel.org, kernel@puri.sm,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com,
        robh@kernel.org, shawnx.tu@intel.com
Subject: Re: [PATCH v2 2/5] dt-bindings: media: document SK Hynix Hi-846 MIPI
 CSI-2 8M pixel sensor
Message-ID: <20210602135226.GX3@valkosipuli.retiisi.eu>
References: <20210528081336.3858700-1-martin.kepplinger@puri.sm>
 <20210528081336.3858700-3-martin.kepplinger@puri.sm>
 <YLCrVzzvKoJOZAK3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLCrVzzvKoJOZAK3@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1622641948; a=rsa-sha256; cv=none;
        b=yq3M8su7tNeLBYbQnxlIWE0xAZhDsPrQRCwhIaP9RldbEP/MGJWm/XhOSvzge40u7znPjj
        katd2z9xG91TN5OFQLlbOuJuZPeCVMglZdFFY4iMB4fm7KONcV0oraTQd3EOWTz3bvkwQ5
        tk79trHHMZeLqoh5mqcyCPdypFZXDPY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1622641948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XasE4YAlNMR4WrY6dbX8b0zZWRhV24uifEW0Tnx0hOw=;
        b=fnEa+jVXXHiczG9qsdnq1esoEoyqjPKbg10uvYRTxfNCFx3VfnTCRNCiXM7aTlaUWkuwXR
        +QKYETJssz2s187unMG62ION4pGBItem3P4m3Q7Eiw8F0nwILKi5cW2KqWFjKHaciuV2oS
        dIjCfTKCwojtbpc0+zXfWog8+Iq1hvg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 28, 2021 at 11:35:35AM +0300, Laurent Pinchart wrote:
...
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: Reference to the mclk clock.
> > +    maxItems: 1
> 
> You could also write this
> 
>   clocks:
>     items:
>       - description: Reference to the mclk clock.
> 
> The maxItems will then be implicit. This is the preferred form when
> multiple clocks are used, and given that clocks it meant to contain a
> list of clocks, even if it has a single entry, placing the description
> in a list of items may be a bit better semantically speaking.
> 
> > +
> > +  clock-names:
> > +    const: mclk
> 
> Similarly,
> 
>   clock-names:
>     items:
>       - const: mclk
> 
> Rob, is standardizing this pattern a good idea, or do you prefer the
> shorter form
> 
>   clock-names:
>     const: mclk

As there's just one clock, isn't the clock-names redundant?

-- 
Sakari Ailus
