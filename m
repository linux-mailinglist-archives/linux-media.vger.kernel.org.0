Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1AB920FE27
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 22:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgF3Uty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 16:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgF3Utx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 16:49:53 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8A1C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 13:49:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id n23so24260035ljh.7
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8TEkXURApU0QO8MhCg+aHvCyG0nhnoU07dZv94xTVGo=;
        b=mJ07pMpRasorccttMvFeublKoWgl6moNVn/kgRrhUYBKSPeNY6rlr4P90R/rf/X6Fs
         /NQZ0KmwuJcIXRAdIjBzw2+q6vhzL3LoPDZRO161GLz4XO+AZrzR46hvG8LVrw1Y4ceE
         IaMvm2G+KzJPo4OkJTSvlAH797zL8HN47VvcJ4+BUXS9xv0CQo1pN8mESaMjTfssYcVz
         9pvQ2yQCtTxjHnrYX7GDwTj2qit7e4gPtLvL+jmtwoDtW8a47FNRiBYFzZZztab2W2fB
         2YsPMBa1nrbTBiDujLWmHYEQnyLEJKucC6nGdR+pntm8MWHjRyT7H7vCZZ2Yfe+8Gsu8
         KTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8TEkXURApU0QO8MhCg+aHvCyG0nhnoU07dZv94xTVGo=;
        b=dY4ChusoDI+l3UgYXVQQKPju67Kgn0v+DGoMj6uTa0OYhD6rIQbw9v3zs1GeFCsW++
         7W+iLiYgFuYiJMasGTMbBs4wywX7BuIEZsak1o/ePz1NGsYqD2qcFdxkAyE49F572hDr
         ZUx9zNrCuG3ALbKNbPWKi1r9R659Sci1QQKn3lDNvP9dmQ53RD4GidtWGPHzFgcRsKSR
         kJ3PoAxRhnauXYUqiyBAhch2mOPbz0bDJwkpUDFil8HjVjMCtef/5+79iIxQMztB//YM
         UyHtNg2tdzfnn4e1dF95k8N3FHUC9SwD7+BSFxA1FSLxt5Ja+S3BHPuJZwiYiGWb7xK1
         xBLQ==
X-Gm-Message-State: AOAM533lE3Q7N8ECoPT5yVJ7VHuGKJ1qzZ94vPAxQsL271VO933HsXLN
        eyJsCzz0drrhZ6EB/oBdR1xDtA==
X-Google-Smtp-Source: ABdhPJwzNlAKj3F1zAIxQkau8KUphOIgeVAY6ZwKxOS0S8DxDn9IFc3GL96+N5Cq6VTL2/fqCBdQZw==
X-Received: by 2002:a05:651c:284:: with SMTP id b4mr508659ljo.283.1593550190979;
        Tue, 30 Jun 2020 13:49:50 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a9sm1083806ljm.84.2020.06.30.13.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 13:49:50 -0700 (PDT)
Date:   Tue, 30 Jun 2020 22:49:49 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: media: renesas,fcp: Make
 power-domains mandatory
Message-ID: <20200630204949.GB2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200621004734.28602-3-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your work.

On 2020-06-21 03:47:28 +0300, Laurent Pinchart wrote:
> All DT source files in the kernel tree specify the power-domains
> property. Make it mandatory.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> 
> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index 9241bf3c5efc..eeca7e255420 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -38,6 +38,7 @@ required:
>    - compatible
>    - reg
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
