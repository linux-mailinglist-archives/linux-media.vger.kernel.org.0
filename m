Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD72290993
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 18:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410081AbgJPQUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 12:20:13 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34588 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408124AbgJPQUN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 12:20:13 -0400
Received: by mail-ot1-f66.google.com with SMTP id d28so2933713ote.1;
        Fri, 16 Oct 2020 09:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bg/ZEjUAQxpVo6DSmy7ehWLfv9K2VCGfCFh4744GjRc=;
        b=S49QRK2fKLGU2K6EDau3kWnKFdWlILXt9zoc/ksEtfT35oRF72pvAwAjuCDq5K1eXx
         2V4FUwZUTzRVy83Hobf5Lqhw27lvk9bNFFVkV9Hgfn7QnrIPWZytMGJRGVth1Y8Q4k51
         gqy7lirI7XLyH6BjJyqKFbgvNCbMMudOaE6wDvFtzmB90wlhmTOnkfOGeLXt2GEGyqS+
         L2cBhubTfGGl/RMKyc3VHPkAQcoYLFAJSG9Zpiwr/VWm+fia+SbWlAjPzWuDoTklcLo0
         uR/WFN1aFhjZtTuwk88uPg8/uEysV/sWyTuxVxnIzqEkeJe4Q8++1cOCqp+mCWKrmHgx
         1VvQ==
X-Gm-Message-State: AOAM530GbmqX2uUTxuhP7jOHskMdtb3/lZOvj9yWuOvfqPzhCdBCgLul
        F6bmz9W0lKNoXhVEHPO5Tw==
X-Google-Smtp-Source: ABdhPJzwlRz1vTJgihHyEJSqFrbGp1k4E5FHdra55hue6dM2uq8YhIQh0z4TfoqKQBRF4dyEp0kc/Q==
X-Received: by 2002:a9d:2a8a:: with SMTP id e10mr3150968otb.3.1602865212165;
        Fri, 16 Oct 2020 09:20:12 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f2sm1174379oig.15.2020.10.16.09.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 09:20:11 -0700 (PDT)
Received: (nullmailer pid 1520687 invoked by uid 1000);
        Fri, 16 Oct 2020 16:20:10 -0000
Date:   Fri, 16 Oct 2020 11:20:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 3/5] media: dt-bindings: media: renesas,drif: Add
 r8a77990 support
Message-ID: <20201016162010.GA1520090@bogus>
References: <20201014155719.15120-1-fabrizio.castro.jz@renesas.com>
 <20201014155719.15120-4-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014155719.15120-4-fabrizio.castro.jz@renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 14 Oct 2020 16:57:17 +0100, Fabrizio Castro wrote:
> The r8a77990 (a.k.a. R-Car E3) device tree schema is
> compatible with R-Car H3 and M3-W schema.
> 
> Document r8a77990 support within renesas,drif.yaml.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v3->v4:
> * No change
> v2->v3:
> * No change
> v1->v2:
> * No change
> 
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
