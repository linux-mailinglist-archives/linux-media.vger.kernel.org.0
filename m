Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFCA20FE44
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 22:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgF3U4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 16:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgF3U4a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 16:56:30 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F08C03E979
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 13:56:29 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c21so12220817lfb.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QzaiVWwjs11/Aggt7h4kjnpjmNK+rjlPN0n7owMC96g=;
        b=XK/DySsF4kqNHqlJGocfpYds8BJ+M3BZgmgJlHlyFJPh1xZ7Ya+mWYyuNbda+crVgZ
         yffPNZwxO61hSAvEatKROXpAlB9p767vdM9gS8eRENQt5/xbXHa3U2ahtk9zPrqsGEUh
         8ogkQz7Fk4F0h1ALajoWkEKgMXIUUXQkILmdAUnITKwZrxpe0Nod/biDgECWbr0Mxjoc
         vIGp9IjZVqbtDv9SCh06Q6jFxCFPngpSzkZyJEAvBfkmBNsPNcyySxZO5UZ5gEGkXef4
         5POOM8nD4Je+I+bT7i6WU+UYSs4FBmHiujyO+VqoWffM8vGY+r+9tvjwkJukNKfjMhzN
         vBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QzaiVWwjs11/Aggt7h4kjnpjmNK+rjlPN0n7owMC96g=;
        b=Vm2TS16eD42wNEJXnyUOvuHMqooqOj9NUzgIa6rkBIinLw83CgIimphUx7Ed9jhkXw
         SGEfk9OtFjWtA2unp0OiZQK7XRP7I8TAhbj7b0CQelT1TJ2ucR/0EN9BvwtvptwtL2sN
         ZBzFiedahCeZIdUIo4N8kijbiAdhQGsabZ/Jf6S5rBHEJvheVtNtmfjlE6LVXxVJRq7f
         k8YJ6NNL/rzK6K6k858aXDS0tpM+XGNkJzCqLklVAOaCYDMgXSefCtv48YS3VF9irhqg
         thRIyqr91dA6O3hWswKupJPXCQgCRPfwJP0sEQZuLuG3j6ZRXbsNriJxdtu+CR7uN/i/
         BzgA==
X-Gm-Message-State: AOAM530LU9tQcTI4OK1SyZFGXjgIW2upru4Fg/9assfPJZunjariJDta
        Qt3nGY3m42aicw5OlQlHW/VC1A==
X-Google-Smtp-Source: ABdhPJwNezK5/TIL/don+i1EEMPhpSmOIpoTVKFTYakrYGfHI8jjQEg+57LZ/Gwe6CKx0zDMde95YQ==
X-Received: by 2002:a19:4805:: with SMTP id v5mr13072165lfa.75.1593550585811;
        Tue, 30 Jun 2020 13:56:25 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id u19sm1219185lju.63.2020.06.30.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:56:25 -0700 (PDT)
Date:   Tue, 30 Jun 2020 22:56:24 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 5/8] dt-bindings: media: renesas,fdp1: Make
 power-domains mandatory
Message-ID: <20200630205624.GE2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-6-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank for your patch.

On 2020-06-21 03:47:31 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> 
> - Fix typo in comment message
> ---
>  Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> index f4db96a1f53c..39184bd21a27 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> @@ -43,6 +43,7 @@ required:
>    - reg
>    - interrupts
>    - clocks
> +  - power-domains
>  
>  additionalProperties: false
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Regards,
Niklas Söderlund
