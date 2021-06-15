Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249BF3A8CA4
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 01:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbhFOXiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 19:38:10 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:45763 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhFOXiJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 19:38:09 -0400
Received: by mail-io1-f46.google.com with SMTP id k5so992993iow.12;
        Tue, 15 Jun 2021 16:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SCqoOy6lCgJsJ/aVAuyAHAHzFoPjEiHAtXa8ezPZfTc=;
        b=LbGRHpGR5XWBacjeifbZeezxHEzIVTh8tlv46JQghBqsBOfHC+TGg9fAFqNd1AZ+00
         vcH+Lc51mIaDfHlyLy0BGgEsDKjcVhkq2BAWoLrk5/ZQbym1uc3DfA6YjGq3R6gcIWJF
         xSMqGn+GkOg0pFwQtAc3FAxXj+534c+TYOKJ88YUExmnZT9j8f0ZtBRWCw5N79fTkvGC
         8pyUXIRaazaIUihVXpKufA1dvV/i6fbPMIxLKktbkWgXQS31y0IYo/ZpvV6ZRALMMm55
         GQJX0J5Xqd40/QcpBRQ6M6sPcq+maG3DX9UE8vyM7WiHBpT/RUUXb2dcIVEBnsN6rNPh
         e5Ww==
X-Gm-Message-State: AOAM533AgsBNF86hHLIl5jsbhguR6HanzMnMRFGu7i3j+fGfIDY6ICCq
        9LNXbt72I8wA9VlVM3J3/TL9csMAPA==
X-Google-Smtp-Source: ABdhPJyb+23mK8LdRdsRZMZm8Lkz8Ta6hp9UaZ1KLDsKMctrP6c5q0wWBMAb2clTScOu6DJjoapU6g==
X-Received: by 2002:a02:956a:: with SMTP id y97mr1432416jah.58.1623800164529;
        Tue, 15 Jun 2021 16:36:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k12sm290618ioh.26.2021.06.15.16.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 16:36:03 -0700 (PDT)
Received: (nullmailer pid 1666084 invoked by uid 1000);
        Tue, 15 Jun 2021 23:36:00 -0000
Date:   Tue, 15 Jun 2021 17:36:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nelson Costa <Nelson.Costa@synopsys.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vinod Koul <vkoul@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: phy: Document Synopsys DesignWare HDMI
 RX PHYs e405 and e406
Message-ID: <20210615233600.GA1665956@robh.at.kernel.org>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <570d5fa01a17be017346262b8a9b06d36bebe8f1.1622631488.git.nelson.costa@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <570d5fa01a17be017346262b8a9b06d36bebe8f1.1622631488.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 02 Jun 2021 13:24:19 +0200, Nelson Costa wrote:
> Document the device tree bindings for the Synopsys DesignWare HDMI RX
> PHYs e405 and e406.
> 
> Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
> ---
>  .../bindings/phy/snps,phy-dw-hdmi-e40x.yaml        | 93 ++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/snps,phy-dw-hdmi-e40x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
