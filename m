Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F93C37EE66
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 00:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241129AbhELVmt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 17:42:49 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:46877 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385213AbhELUHK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 16:07:10 -0400
Received: by mail-oi1-f181.google.com with SMTP id x15so9627656oic.13;
        Wed, 12 May 2021 13:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gTKYsurg3KsgLfQkoKCsB6zBYtCXidtOP1XiepLCXuQ=;
        b=h8ZblA+2ms7AZsU8H4Zr5SLsIkj5B2LDDHqd8P3NP8AdlcFNs7i9tyPTJx656DXpu6
         lz2uwhfMjlmPKXgT32Mlz0CUjjeVZkvAoEMTZsAxCh5lEiEzpzwBur8Q6Sbmne8sisbB
         9IRDgC6YSAY7ifepP7WV8FtuSOCdIJR7eJ+3wR0yrbhs8cc+EH9taix3QuaH21qnLRJt
         drWpggIxPnsZFuj+zH/jGut5m5RqdHspUvkwJnO3Ro0q7Ct6aUBxsFI+j0Rxk73t84Dw
         2RCbDZqPaMnBXvAGzBN5S+8Z/VEVo5Jy84fpd+tFXxyXVTddxdDuISJQfHnLzVg8Z7QZ
         mJlA==
X-Gm-Message-State: AOAM530Whn99/eC5N0GjSoIPqNvaWiaPIpM8yvdd0uKL/g9e9bSIq+7r
        qM5NzPDFhwqtDJtcNF1GaA2hhtNE9A==
X-Google-Smtp-Source: ABdhPJz9/+M3P8/Lyyr96bsB15NxWhogDATiSjmj/Nuy4k+k7JVXvMW0FHjj7lW4IYphM3rP0hPsEQ==
X-Received: by 2002:a05:6808:655:: with SMTP id z21mr184862oih.8.1620849961118;
        Wed, 12 May 2021 13:06:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j16sm167302otn.55.2021.05.12.13.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:00 -0700 (PDT)
Received: (nullmailer pid 2491904 invoked by uid 1000);
        Tue, 11 May 2021 19:47:32 -0000
Date:   Tue, 11 May 2021 14:47:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] media: dt-bindings: media: renesas,vin: Add r8a779a0
 support
Message-ID: <20210511194732.GB2491222@robh.at.kernel.org>
References: <20210511143332.3469877-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210511143332.3469877-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 May 2021 16:33:32 +0200, Niklas Söderlund wrote:
> Document support for the VIN module in the Renesas V3U (r8a779a0) SoC.
> The V3U is different from other SoCs as it have 32 instead of 8 (most of
> Gen3) or 16 (V3H) VIN instances. The VIN instances are also connected to
> a new IP the R-Car ISP Channel Selector.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Update commit message documentation.
> ---
>  .../bindings/media/renesas,vin.yaml           | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
