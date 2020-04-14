Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7E11A8810
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 19:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503119AbgDNR5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 13:57:24 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43149 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729303AbgDNR5W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 13:57:22 -0400
Received: by mail-oi1-f195.google.com with SMTP id j16so11197962oih.10;
        Tue, 14 Apr 2020 10:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tK0IFUlYSFlpwtU3mw9yw0HRR5HEG0AfQTUoX3ZwpXE=;
        b=B4ifQl11BRs4+R0/nTUGP2VO1VrHP/baPLPG0S5yoTaAwfoWYey4KBCstRUvECG4Y0
         j+cXIH642pLCa71JwzCks77oFBe71M4C5alXs9/KYpyzp5Cms63NlpHbsH9UJqKjGyhv
         O+rgiqYIq4w94cyYcIMrNm/kLwfIdqx9QLUiaMNlOx/AYZZhjYvY5H0zbFCb9Mv+MA4h
         p2ePyoTst7j5NFvSKAlfYB4/uRdVKnRgORkI2pgo8x8JWiC2L3lV6ZjH6BXydjxaUnQf
         xHY+09l7l9Hk0gpxn9sjbR76rBddoWSRmcyvj4XJyZxmln5Ntp64dcBW983rYsGBHRTW
         itZw==
X-Gm-Message-State: AGi0PuauAXggejwbzJzjplG30ZZ9s0KNchxiAY5yzwBDsohzbZTyuBjF
        3SFY04IC9xg8v9fFXV19nA==
X-Google-Smtp-Source: APiQypLcyf/n6ci6IwSg1aCxtAmgXiXqH5mqKWHgDXSYiQU4A+MiKq/SoER9LlqU1vkuA9hod5P3/A==
X-Received: by 2002:a05:6808:b1a:: with SMTP id s26mr15506712oij.150.1586887041653;
        Tue, 14 Apr 2020 10:57:21 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j90sm5689967otc.21.2020.04.14.10.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:57:20 -0700 (PDT)
Received: (nullmailer pid 29896 invoked by uid 1000);
        Tue, 14 Apr 2020 17:57:19 -0000
Date:   Tue, 14 Apr 2020 12:57:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     jacob-chen@iotwrt.com, ezequiel@collabora.com, mchehab@kernel.org,
        robh+dt@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: convert rockchip rga bindings
 to yaml
Message-ID: <20200414175719.GA29816@bogus>
References: <20200403130607.6138-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403130607.6138-1-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri,  3 Apr 2020 15:06:06 +0200, Johan Jonker wrote:
> Current dts files for Rockchip with 'rga' nodes
> are manually verified. In order to automate this process
> rockchip-rga.txt has to be converted to yaml.
> 
> Changed:
>   Add missing reg property
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> Changes v2:
>   Change MAINTAINERS
> ---
>  .../devicetree/bindings/media/rockchip-rga.txt     | 34 ----------
>  .../devicetree/bindings/media/rockchip-rga.yaml    | 78 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 79 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/rockchip-rga.txt
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-rga.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
