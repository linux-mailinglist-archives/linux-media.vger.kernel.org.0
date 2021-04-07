Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6A63577BF
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 00:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhDGWdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 18:33:47 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:40596 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhDGWdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 18:33:43 -0400
Received: by mail-oi1-f174.google.com with SMTP id i3so135699oik.7;
        Wed, 07 Apr 2021 15:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OMJySpIrT3KHE0zbjaNs6x69YeSzNmzVNNw2STB2eTY=;
        b=RYXRltuNLjuBK5IqdH8uOht5ntDGggrh5ficM2eTzg4/gXe4WrSWs+PZ01rZWbth2j
         Nw8UcuR9/9WWROA1XGDeHcLChoAWsMwGlntSonfoMvnCcNIWyfyaApPTC6xY+WOnrnKa
         1CiaTs0rjh6GD2HBMlrPVh2HjTGLPxpDzmtmTAsBKnbMVhkHRX2QmbFBjK7DDtDO7Lm6
         UALvVkFRhEkG316qRTQ7HVvSuB5Dmhs2y/EdjfNP8eHTxTk+I6tFv/ZlRNqwUl39UPE4
         jbilahuvEGZ7keFEFKP+nDfDwB5ugsYE/bQt4kKsmznc/z71BGGs8UYBLhBz+jQoe3Yv
         GYoQ==
X-Gm-Message-State: AOAM532Kl3/bJeKDJlqiIAuPRBUcKXMM7WtuNnJEmXOhA2BD5/G2alCU
        X5TcDuKnBH8YXslDt73ncA==
X-Google-Smtp-Source: ABdhPJxuOyLkkbmlhyecRYmaJAxQO2NZwzK14nwe3T5HGmp+ihytHDzZe06PIj2aa5Sre8ZtCY387g==
X-Received: by 2002:aca:1c18:: with SMTP id c24mr3772698oic.7.1617834813064;
        Wed, 07 Apr 2021 15:33:33 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m14sm5822719otn.69.2021.04.07.15.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:33:32 -0700 (PDT)
Received: (nullmailer pid 140375 invoked by uid 1000);
        Wed, 07 Apr 2021 22:33:31 -0000
Date:   Wed, 7 Apr 2021 17:33:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martina Krasteva <martinax.krasteva@linux.intel.com>
Cc:     paul.j.murphy@linux.intel.com, robh+dt@kernel.org,
        gjorgjix.rosikopulos@linux.intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        devicetree@vger.kernel.org, daniele.alessandrelli@linux.intel.com
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for imx335
Message-ID: <20210407223331.GA140345@robh.at.kernel.org>
References: <20210330142023.141-1-martinax.krasteva@linux.intel.com>
 <20210330142023.141-2-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330142023.141-2-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 30 Mar 2021 15:20:18 +0100, Martina Krasteva wrote:
> From: Martina Krasteva <martinax.krasteva@intel.com>
> 
> - Add dt-bindings documentation for Sony imx335 sensor driver
> - Add MAINTAINERS entry for Sony imx335 binding documentation
> 
> Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
> Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx335.yaml | 90 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 ++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
