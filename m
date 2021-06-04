Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33AC039C13D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 22:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhFDUYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 16:24:52 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:34334 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhFDUYv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 16:24:51 -0400
Received: by mail-ot1-f45.google.com with SMTP id v27-20020a056830091bb02903cd67d40070so7192916ott.1;
        Fri, 04 Jun 2021 13:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qfaRQ60Ai+HXUBbmTjbsGYj34+/Yxdgx5z4uXBnlHm8=;
        b=F9S+ybR0fTuloX7n6NvDCTXjp4OTzofAuLc9n4IEALmLVpaFFTGVEVuUkcDrozEKAC
         wyHbrWOw/sXFnbNE1nMDj8adqFay8uqBrTr5mLwYS68jz/DNj5TIZ0sVcHoEy/IDSZAQ
         52ejOkYFCpA3aX+aZhoyEo8IZ5Y6Iu/Li3Z55KP/AGRk76/oBB2c2dgXZS+A+Qka0GSB
         NqgEneXTdl8p38keN61OW6K96QZAp9zd0UIpiNKt8n/zL8VGf/PQOVrjYxXIoKuQ0dOt
         ZdLNjTXKwYvk6jjRU76cis3ff4q/Ub2jeBYchLcARe2ujO/Rad/3AbKxIVHo/yBMXiNy
         ZPhw==
X-Gm-Message-State: AOAM5325A4v0uOJvN+SCrdVOxu+qdsUMeVcSuOiLMDyw8mQjMFx1hR6k
        907tP+GtctqdbUkXseMzW2IpT5hlbQ==
X-Google-Smtp-Source: ABdhPJwGQ8KZGfxIg5WFY60uRNbcBVzKNhBcG6L5czX8LOGWUoln6ANE03n7nMDmt/4IpPILIt8psg==
X-Received: by 2002:a05:6830:2704:: with SMTP id j4mr4950538otu.193.1622838184636;
        Fri, 04 Jun 2021 13:23:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g21sm703707otn.67.2021.06.04.13.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:23:04 -0700 (PDT)
Received: (nullmailer pid 3850351 invoked by uid 1000);
        Fri, 04 Jun 2021 20:23:02 -0000
Date:   Fri, 4 Jun 2021 15:23:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     daniele.alessandrelli@linux.intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com, mchehab@kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: media: Add bindings for imx412
Message-ID: <20210604202302.GA3850322@robh.at.kernel.org>
References: <20210527142145.173-1-martinax.krasteva@linux.intel.com>
 <20210527142145.173-4-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527142145.173-4-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 27 May 2021 15:21:42 +0100, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx412 sensor driver
> - Add MAINTAINERS entry for Sony imx412 binding documentation
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx412.yaml | 91 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
