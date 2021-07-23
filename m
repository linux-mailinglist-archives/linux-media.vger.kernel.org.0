Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C03483D4209
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 23:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbhGWUhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 16:37:07 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:42810 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbhGWUhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 16:37:06 -0400
Received: by mail-il1-f173.google.com with SMTP id q18so2760749ile.9;
        Fri, 23 Jul 2021 14:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nSoj/UlWS4JPx6iZRYhcRTCPVju36DNxD7H5wssKpHk=;
        b=RA2jhbXpEtbz3wRq/PWuSO3VDP+TQ4piRmcOBYxBmCG3KXSVaK35fl4ueQ/C3OvoKo
         hXSVXNE4pbKlVt5rjRwBKHNuOTNtKVtg5B/xQf8sJk/ZnOPwLgmByVULKr3UVVhRdNgP
         l42vthpd+YOkPnvrTTwXy6zxT79C0Yn41PDVXSnn1QwmmN7cZzQZVdf2fgpfi2yXpS7n
         sk7NReQTwFvrvB9XkQWTzdrJTiLHkrXrJpsr5N12oeM8abHCJmY3as3sp1H+NThc+WLS
         ni3AN1xjNYpu4xsnJ38qNbtRGu5EV8NSJB9fuMl7u8cLfnPqpFuNOQHwudqAmxsO9ldd
         mAMQ==
X-Gm-Message-State: AOAM530iQ4699D+hduLhFpk+yyJNWTzcPo8W67s35T7Rj6HConMN4QVY
        wy0tIci/s8mmZZmZ8RQPLg==
X-Google-Smtp-Source: ABdhPJwwjWBOEYynQLyc0Zom7dPVOu7Owe+7JZNuqdHQwhoI4J0rYEqL0eVaIn8xZNRfPVXim/nGGQ==
X-Received: by 2002:a92:c989:: with SMTP id y9mr4712826iln.183.1627075059594;
        Fri, 23 Jul 2021 14:17:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j8sm4405629ilo.57.2021.07.23.14.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:17:39 -0700 (PDT)
Received: (nullmailer pid 2600667 invoked by uid 1000);
        Fri, 23 Jul 2021 21:17:37 -0000
Date:   Fri, 23 Jul 2021 15:17:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-media@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Fix graph 'unevaluatedProperties'
 related warnings
Message-ID: <20210723211737.GA2599616@robh.at.kernel.org>
References: <20210719194850.2410511-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719194850.2410511-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 19 Jul 2021 13:48:50 -0600, Rob Herring wrote:
> The graph schema doesn't allow custom properties on endpoint nodes for
> '#/properties/port' and '#/$defs/port-base' should be used instead. This
> doesn't matter until 'unevaluatedProperties' support is implemented.
> 
> Cc: Eugen Hristev <eugen.hristev@microchip.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: Ramesh Shanmugasundaram <rashanmu@gmail.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/atmel,isc.yaml      | 3 ++-
>  Documentation/devicetree/bindings/media/microchip,xisc.yaml | 2 +-
>  Documentation/devicetree/bindings/media/renesas,drif.yaml   | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 

Applied, thanks!
