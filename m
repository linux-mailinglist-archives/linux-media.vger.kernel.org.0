Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5A037EE71
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 00:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346081AbhELVnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 17:43:20 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:46943 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385245AbhELUHt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 16:07:49 -0400
Received: by mail-oi1-f172.google.com with SMTP id x15so9629457oic.13;
        Wed, 12 May 2021 13:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tH0uP4kbT2K4dbMJy1WnIwOnLMaRXnLhS70byarsYPk=;
        b=uCSFpmcpKSZ4uY+ZIu6B50OOp0SNNZfQTNCMG7zYPMtZ7G9eUeAY2HfNc4ZR4vKaxf
         +nmvBkTTeWvkvwueGJeXque9apsvs1qgnZPEmKQmfPCHXWuP9aSm3l+nahqEjMysZT/x
         /iZUhjiBLEc+sHiQIoq91c4t/hOZQCm543TjNi8wwcrUYD0HNMGJ1Em5/CgwYSBARcUu
         xCqsvj48ic258Dc2yY/LPddGKNhH2SfqpIDgktq/pqqRzQFGYdmsalpDEemcNK7QPEbi
         XM/KmR0Is/jtjUNgFe2dWTeVowY6aVHqFLWCGCE1FFeae+M3Neqw2M7bKDelU92xkiXu
         JbOQ==
X-Gm-Message-State: AOAM532dneiQYzZia+UG0zTBM4JUAkv89j+QdMgBaa5oREjbDg1uZTCO
        W2vnu3KquXCERK8NN4sT/A==
X-Google-Smtp-Source: ABdhPJx3EpAPwhZKx9aHT/jJbZuQ/7I3A6eO4fAPoiikmfxRxbhA47sWrgL/sKQCmbV/v4Qxt/qfAA==
X-Received: by 2002:a05:6808:193:: with SMTP id w19mr10841986oic.152.1620850000411;
        Wed, 12 May 2021 13:06:40 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h2sm217086oop.47.2021.05.12.13.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:39 -0700 (PDT)
Received: (nullmailer pid 2460281 invoked by uid 1000);
        Tue, 11 May 2021 19:23:38 -0000
Date:   Tue, 11 May 2021 14:23:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] media: dt-bindings: media: renesas,isp: Add bindings
 for ISP Channel Selector
Message-ID: <20210511192338.GA2460234@robh.at.kernel.org>
References: <20210511142320.3463742-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210511142320.3463742-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 May 2021 16:23:20 +0200, Niklas Söderlund wrote:
> Add bindings for Renesas R-Car ISP Channel Selector IP. The ISP is
> responsible for filtering the MIPI CSI-2 bus and directing the different
> CSI-2 virtual channels to different R-Car VIN instances (DMA engines)
> for capture.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Fix order of compatible value.
> - Use /schemas/graph.yaml#/properties/port instead of
>   /schemas/graph.yaml#/$defs/port-base for port@0.
> - Drop status in examples.
> ---
>  .../bindings/media/renesas,isp.yaml           | 196 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 197 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,isp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
