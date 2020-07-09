Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FBD21A91E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 22:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgGIUhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 16:37:21 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42325 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgGIUhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 16:37:20 -0400
Received: by mail-io1-f66.google.com with SMTP id c16so3736559ioi.9;
        Thu, 09 Jul 2020 13:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zYVtac9Zi8Ea45Dv/JsLDGweT3Jj92BXMb3jivMTATc=;
        b=kVPjSnwCAg311sBi3lHCyqmE4UhJN1LrBKJOZdTCC/5VyextoYgu+J9wM+uID5YYHw
         R+QuvU+FFgGoGKlUePa1U+YgDibaYXptK327Z2Y1f6HCmteLBwQjW6tkqZlzNGurszjJ
         xua3HReQTME1vVnj4u0lK3i4ichUa4uxlCTAL+GVfBNOodnehEoihcSgTWgY4sPFLnEU
         FaL8aVeBYEIcv+Ff0S/iiZ4pRK4BN51Y/0OuOwdj5dI/FnO70a0VZU2q9487EKXTRuVO
         lgY2fkicjtVnNqharm+Pp75IHwxuIGN1XVoSFgyxJ4eidN27cHBLDnO4nsj47PvoDqYP
         gnjg==
X-Gm-Message-State: AOAM5323GwomK/MIuIxQPg41+orQ78JJ0YzgZyS5V0XlQ9VUHplwLE54
        anIvWLSLQT7H94tEvn51vA==
X-Google-Smtp-Source: ABdhPJzQBLgQu0/F5feMhyP/ZARue5TvyvtGE6/nGRA3cx1winlPMxKdNtL0DNf3bejnqdNjMXZpcg==
X-Received: by 2002:a05:6638:e93:: with SMTP id p19mr56572629jas.67.1594327039832;
        Thu, 09 Jul 2020 13:37:19 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id i188sm2677380ioa.33.2020.07.09.13.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:37:19 -0700 (PDT)
Received: (nullmailer pid 846237 invoked by uid 1000);
        Thu, 09 Jul 2020 20:37:18 -0000
Date:   Thu, 9 Jul 2020 14:37:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     hugues.fruchet@st.com, mchehab@kernel.org,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-media@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        vincent.guittot@linaro.org, valentin.schneider@arm.com,
        rjw@rjwysocki.net, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Message-ID: <20200709203718.GA837160@bogus>
References: <20200701130129.30961-1-benjamin.gaignard@st.com>
 <20200701130129.30961-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701130129.30961-2-benjamin.gaignard@st.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 01, 2020 at 03:01:27PM +0200, Benjamin Gaignard wrote:
> Document st,stm32-dcmi-min-frequency property which is used to
> request CPUs minimum frequency when streaming frames.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> index 3fe778cb5cc3..05ca85a2411a 100644
> --- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
> @@ -44,6 +44,13 @@ properties:
>        bindings defined in
>        Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
> +  st,stm32-dcmi-min-frequency:
> +    description: DCMI minimum CPUs frequency requirement (in KHz).
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +      - default: 0

I think this is questionable to be in DT and if it is, it's something 
that's hardly specific to ST or this block. IIRC, we already have a way 
to specify minimum OPPs.

Rob
