Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7C336139D
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 22:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235594AbhDOUiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 16:38:10 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:33392 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbhDOUiJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 16:38:09 -0400
Received: by mail-ot1-f48.google.com with SMTP id 92-20020a9d02e50000b029028fcc3d2c9eso1318489otl.0;
        Thu, 15 Apr 2021 13:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SV6uLdiUIbNtCGDaL9g5OEfzZbfEmr4PSTr5jNTx670=;
        b=ShCNOqVuoEnziWaIVQ1c+tl9sX7uf2aoSCq8/oi8kXbGekuUkm6LlAAjjx1urCVbyF
         4eyFk0AkZQhNB3SUSnDtlYLpNFRZG5VRxxmb0qviQMusHGmTnO1sqohcozshRRw8uUTe
         rk5CsFwCUdKpbY+pPCp0yib7T5MPTH63ovw/GTk+guElvUiPeETMgCg9+BJ9HijiH6SF
         VU85GJCGhFasrVFNDnBXDMyqzd7ZXkbxuZLmB/8dxjudkoLgZO2jOhdhFF+xQalvvE81
         2yg3EALAHwHwDBYZKIt3/TTx1Z+hepjxc5lil6qFrUYKH6uTWQcoSzK3760nyJYkQoaa
         atsg==
X-Gm-Message-State: AOAM533+XRWZ4JJUvQhA+BfV7wKpjx1msX+zR00Eyev5H3f3fkPC5/xJ
        TNM52J02mc6Vxfge0/v/Jw==
X-Google-Smtp-Source: ABdhPJyNGtj7dGg5GwtUMbHWt8Ht+g49ssWkYBZp2WW5+yqeI81C8urNbu4W7m7D/jx0Em+fsnnwFQ==
X-Received: by 2002:a05:6830:1515:: with SMTP id k21mr814922otp.269.1618519064589;
        Thu, 15 Apr 2021 13:37:44 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d7sm774314oop.9.2021.04.15.13.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 13:37:43 -0700 (PDT)
Received: (nullmailer pid 1842170 invoked by uid 1000);
        Thu, 15 Apr 2021 20:37:41 -0000
Date:   Thu, 15 Apr 2021 15:37:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     dillon.minfei@gmail.com
Cc:     olof@lixom.net, arnd@arndb.de, matthias.schiffer@ew.tq-group.com,
        mchehab@kernel.org, krzk@kernel.org,
        krzysztof.kozlowski@canonical.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux@rempel-privat.de,
        festevam@gmail.com, leoyang.li@nxp.com, linux-imx@nxp.com,
        prabhakar.csengg@gmail.com, s.riedmueller@phytec.de,
        s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, kernel@pengutronix.de,
        devicetree@vger.kernel.org, shawnguo@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX
 SBC
Message-ID: <20210415203741.GA1842113@robh.at.kernel.org>
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
 <1618459535-8141-3-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618459535-8141-3-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 15 Apr 2021 12:05:33 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> The DaSheng Com-9xx is and ARM based signle board computer (SBC)
> featuring:
> - i.MX6Q
> - 2GiB LPDDR3 DRAM
> - 8GiB eMMC 5.0 FLASH
> - 4MiB SPI Flash
> - USB 2.0 Host/Device
> - Multiple multi-protocol RS232/RS485 Serial ports
> - microSD socket
> - 5V DC power input
> - HDMI1.4a,1080p@60
> - RGMIIx1 Gigabit Ethernet
> - CSI0x1, connect with ov2659
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> v3: move 'ds,imx6q-sbc' after 'dmo,imx6q-edmqmx6' to follow the alphabetical
> order.
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
