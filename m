Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3398A363835
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 00:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhDRWWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 18:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbhDRWWy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 18:22:54 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476D0C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 15:22:24 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id e7so23037426wrs.11
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 15:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/vQcmhmqMiUAJbyHeuRKghSLw7oX6RI6OxK8J2dPgQY=;
        b=T2R7Tn6+PvMnlVfWMYsBZjQdJSpAa2pkY5MaBXeC0eGfTBvboGeF61bqIsjs4KWu8o
         azP2VtZr3dYuzL9qdliNobBRkuD5k4gB1ZRVX4+VamgFegI0Gae4/nLQV/9o6pRzWyfA
         RKR3kWnAMgFTh/f9xQxIiG34COEhPKnZ+RkKDDWX0wCrRgrU8LcKXXjknIN9T8pEzN3V
         8yQufNzTWB10W8p+wWZKzE/OGBCATRwQJ4WEwlLtivuQDGxk6/79atS6DIWDi/HLGt9j
         LCbyTSzklG23Nby98KNrGPVXcRQnACu+wSbuXI1cIkDLBhbNcomvEtAW4Rrb7hUVgXIh
         xOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/vQcmhmqMiUAJbyHeuRKghSLw7oX6RI6OxK8J2dPgQY=;
        b=YdHdUtzWcFEsvsvK2aWzAKHJYiai06YS1POWEiddrHGg2cfX6oCe/atYt3uk0HReM0
         gtnAsiX/ER3dbchKSj09w0GOm518O5xPIJPqNSXIlMWavQ7Yug3eRGvTmH5YlxmFPEoS
         F/Bv7vsLsju1d8t5rQuU5KUN6VGT6HPuwSfcIg8fkwOI7o8a0Da7iWuJR2R5DkuxSEHr
         F142p84c55I0ZL6SphIjauMunwTgLZvlVIT0Q2GFekgvnR0wIAA/x0TypCugxQ0C/5FZ
         8f8aMT0s11LU8lLjI0gGsnwFDLtRD3u/SXkM4PBKDHEwrTiRQEjPAs44rmbYuBbZ50Zf
         Yvfw==
X-Gm-Message-State: AOAM531VBeFKBwBHR8hkuKiPSYHKLzzslIV0NzTBZyGc2d0+qjFlbEiG
        +iNak+VjW8ul2XmK3JQpwX6A2EzOigU=
X-Google-Smtp-Source: ABdhPJwJ6ZMA6UzVcnTiuCNSa7EcrGYJ+KZsKt7lFemo8RV3ivav1Szo096S1QZr42cQ8adEbtdqnw==
X-Received: by 2002:a5d:4043:: with SMTP id w3mr10876434wrp.320.1618784542972;
        Sun, 18 Apr 2021 15:22:22 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c1sm19527341wrx.89.2021.04.18.15.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 15:22:22 -0700 (PDT)
Date:   Sun, 18 Apr 2021 23:22:20 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 24/23] media: imx: imx7_mipi_csis: Update MAINTAINERS
Message-ID: <20210418222220.dzabxju42yiojn4d@arch-thunder.localdomain>
References: <20210413023014.28797-1-laurent.pinchart@ideasonboard.com>
 <20210418201406.11631-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418201406.11631-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Sun, Apr 18, 2021 at 11:14:06PM +0300, Laurent Pinchart wrote:
> Given my recent contributions to the imx7-mipi-csis driver, I can as
> well be listed as a maintainer.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb727179826b..2f498269c2ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11029,6 +11029,7 @@ F:	include/media/imx.h
>  
>  MEDIA DRIVERS FOR FREESCALE IMX7
>  M:	Rui Miguel Silva <rmfrfs@gmail.com>
> +M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for this, really appreciated.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git
> -- 
> Regards,
> 
> Laurent Pinchart
> 
