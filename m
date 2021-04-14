Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB35635FDE1
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 00:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbhDNWej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 18:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234732AbhDNWeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 18:34:24 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C374C061574
        for <linux-media@vger.kernel.org>; Wed, 14 Apr 2021 15:34:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id p23so21288416ljn.0
        for <linux-media@vger.kernel.org>; Wed, 14 Apr 2021 15:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oEM4GLfY3N+b425KFSxZgcAidy5uKGPHGopRtHJBSVQ=;
        b=e68c8bJ3NeOnzmJijEMvO2UwsROIVSx00DPRyldtlVqI2m5MgLUq5Jbbl6jWxBj89l
         Ditp4Hkahu2jav1BC4jfSi3XatTGyUkI80ndwVuwyR+0v+PqlkDWHUTPHhD7wpx43HhR
         715FEOSasF6FcV8FRV58Xir9UMHVNeJYqutZWqktsQVk7QHwHn8h6+tKJ6Z/61mfBj8X
         3uILKZAooL2lykgT0RB5Nws2l9ln+jAasB8MD/rdct2OEG6ZiGrtyTKisaKbm/vJg88F
         4vCCaa6Ct037CNVuKczVuCGPnjVoPQjszFWK1SJmFHRhim2BwoDSSuwxzwraUgW/FyzK
         RJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oEM4GLfY3N+b425KFSxZgcAidy5uKGPHGopRtHJBSVQ=;
        b=msNoZ7yBoYzWfK2UfLaEtseo3Ao0KRm8vRFr/fTp9VSJvbPHRmUS1FN5RvU6M1D4ax
         /OeCdCCkUIukgM1FirRnG/MO2WH4+YHPQTylWj+iXL1gcNSeeR9eUZSyPP5Oq5Gjf7BM
         d7jhKHl1y++ecvtYW5+jql7U6MhDZnvfq9upD+YnQYNYlpc9kUUXibglM1GLx+UryIKi
         hPBOhw6QEYYQhG/1P8sLIJCy/1AWdXai83a2c8QuQGgEZ97x+e2t12U2d/gaXA6Wvj8J
         deJGVZmQ4E4naMBrIRa+IWkvMny4eu5eL5cEsXX/oiFujWcH/TKStJ1Qy1anNkXYNTlL
         49ag==
X-Gm-Message-State: AOAM533yx7/c3hq9wiwuTiiAvt9giZV1po5DapDdd17GCZK528N6QyYS
        wqG04PwWWfwYSGgEOnPq+oyMP/PlEdR5gg==
X-Google-Smtp-Source: ABdhPJwJ8SvOu1cLSNV79Ecm8l7P1TkS4uMSlPO8PqcBRUY7Fw1drd9DGVL7Wy+13C5/gYZi8D/XvA==
X-Received: by 2002:a2e:8713:: with SMTP id m19mr109555lji.207.1618439639997;
        Wed, 14 Apr 2021 15:33:59 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id i17sm254278lja.22.2021.04.14.15.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 15:33:59 -0700 (PDT)
Date:   Thu, 15 Apr 2021 00:33:58 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: media: renesas,vin: Add r8a779a0
 support
Message-ID: <YHdt1v8VBmv0U3MF@oden.dyn.berto.se>
References: <20210413173810.2561909-1-niklas.soderlund+renesas@ragnatech.se>
 <62b0a5ab-1b6c-3532-72af-bba23f82ff41@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62b0a5ab-1b6c-3532-72af-bba23f82ff41@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergei,

On 2021-04-14 11:28:00 +0300, Sergei Shtylyov wrote:
> On 13.04.2021 20:38, Niklas Söderlund wrote:
> 
> > Document support for the VIN module in the Renesas V3U (r8a779a0) SoC.
> > The V3U is different from other SoCs as it have 32 instead of 16 VIN
> 
>    Only V3H has 16 VINs, no?

You are correct, most Gen3 have 8 and V3H have 16 and now V3U with 32.  
Will fix in a v2.

> 
> > instances. The VIN instances are also connected to a new IP the R-Car
> > ISP Channel Selector.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> [...]
> 
> MBR, Sergei

-- 
Regards,
Niklas Söderlund
