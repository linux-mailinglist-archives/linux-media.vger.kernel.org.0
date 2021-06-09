Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3AD3A08DD
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 03:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhFIBGN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 21:06:13 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:44603 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbhFIBGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 21:06:13 -0400
Received: by mail-oi1-f176.google.com with SMTP id a26so2791340oie.11;
        Tue, 08 Jun 2021 18:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QHpQfhrLgwKNLV3ivBE+3b0dPjMmP/5BQ7SbDecHwUo=;
        b=ZXxDpmYP7vzA7aMvjj6+paqkkZ0r+ThDDCECy5Jn5YipD1gGJyWp0y31P61kxt2YNJ
         4haEVyLEZeYtgZ/OcTfvpkwisTip2SlYRQkyMLsd7j3OHLRgYaW9ejDL13Ij/A27gmnA
         HPxbCUS++jxq+I6YtxlYoF138s8/Woo32eLAdR25U9LdnAL2LplLNd2+GX40EPM5lPfz
         hvLt4qpc+sHSn65Fnn6juFUhyiPvMaz+WjIgAuvaMFhfIk94wM3Uwu/C2BS9r0dXRAfS
         Xr9Q2KBO2sHBmL6Uz8BgTOl+3uuY5Gf6+VDwwUJ5/Ebsmmgb4VyLzbmOJlHgf6XtFRhY
         fYfw==
X-Gm-Message-State: AOAM533tcHrsxRyIZqzjwJn66U1TVBkQJjFv+AIlb+iPHnA0ZcqN46Tk
        xuJyh0oxG18vt1DZDiFvrQruOuE5yw==
X-Google-Smtp-Source: ABdhPJw4gAos93VhNhqfo0KsKL7P6oMULhao9gZBHasZhpw4yX4fTm1ueTNM9Muj0MrTxxRw8hPxtQ==
X-Received: by 2002:aca:5c04:: with SMTP id q4mr4592082oib.11.1623200659290;
        Tue, 08 Jun 2021 18:04:19 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 102sm3428828otf.37.2021.06.08.18.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 18:04:17 -0700 (PDT)
Received: (nullmailer pid 2011104 invoked by uid 1000);
        Wed, 09 Jun 2021 01:04:16 -0000
Date:   Tue, 8 Jun 2021 20:04:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-media@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,drif: Fix fck
 definition
Message-ID: <20210609010416.GA2010770@robh.at.kernel.org>
References: <20210408202436.3706-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408202436.3706-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 08 Apr 2021 21:24:36 +0100, Fabrizio Castro wrote:
> dt_binding_check reports the below error with the latest schema:
> 
> Documentation/devicetree/bindings/media/renesas,drif.yaml:
>   properties:clock-names:maxItems: False schema does not allow 1
> Documentation/devicetree/bindings/media/renesas,drif.yaml:
>   ignoring, error in schema: properties: clock-names: maxItems
> 
> This patch fixes the problem.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Applied, thanks!
