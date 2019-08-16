Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37B2490A34
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 23:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbfHPVSF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 17:18:05 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45374 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbfHPVSF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 17:18:05 -0400
Received: by mail-oi1-f195.google.com with SMTP id v12so2132787oic.12;
        Fri, 16 Aug 2019 14:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ac94VtdzfeI7thgY2mCAS/x3VlOC++V3yHeJ0VOA7+o=;
        b=VH4ZboBTUNDtT8T23ixQulJxKEUrV6dWp5t09LGAGs67+780RY0xupQorBFe3yS4EV
         S6dmOyoDxzRz71efm+iVGtMG41nL8Nnyxtix9JSPlMKQsC6zlq4hsvxEbMkYBA/ZameZ
         qG0Fwztr336jtfSe9P2z7R/2no+dGR2Prv3H/kK7ATKZ9nKvDHl9/VZnAXbOndIgawm5
         Mq3urXvF4YS8cyJxSQVojN0I47oHGXAMQobr3/63+koWw62IwZ4AYWUUrm7nVEjXnB5d
         UzJKRFIw4U2PiaM9lJhYrzYr5NFhAEFtROnc8PHAEEhSpmG2qwL43mhUlftHY5fkkdKs
         kxCg==
X-Gm-Message-State: APjAAAU2B0/yKMNGKWrErGihuKuSuvFQrqbueu6yDQ2n3Wb0kuIShLAq
        ZWDZqQN7CONoJ6UnnC/EY45Af8Y=
X-Google-Smtp-Source: APXvYqzVzx2M+M4luk3nUx+OIDyTYPSI/rW7hHhdaz9oyNtBvJg0f0jbZiOETI+PBiQ5Ploco6tfpA==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr5839166oib.48.1565990284206;
        Fri, 16 Aug 2019 14:18:04 -0700 (PDT)
Received: from localhost (ip-173-126-47-137.ftwttx.spcsdns.net. [173.126.47.137])
        by smtp.gmail.com with ESMTPSA id c11sm1100476otr.54.2019.08.16.14.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 14:18:03 -0700 (PDT)
Date:   Fri, 16 Aug 2019 16:18:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jan Kotas <jank@cadence.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org,
        mark.rutland@arm.com, rafalc@cadence.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: dt-bindings: Update bindings for Cadence
 CSI2RX version 2.1
Message-ID: <20190816211802.GA12657@bogus>
References: <20190725102648.13445-1-jank@cadence.com>
 <20190725102648.13445-2-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725102648.13445-2-jank@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 25, 2019 at 11:26:46AM +0100, Jan Kotas wrote:
> This patch adds a DT bindings documentation for
> Cadence CSI2RX v2.1 controller.

And 1.3?

> 
> Signed-off-by: Jan Kotas <jank@cadence.com>
> ---
>  Documentation/devicetree/bindings/media/cdns,csi2rx.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> index 6b02a0657..a35bb0aed 100644
> --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> @@ -5,7 +5,9 @@ The Cadence MIPI-CSI2 RX controller is a CSI-2 bridge supporting up to 4 CSI
>  lanes in input, and 4 different pixel streams in output.
>  
>  Required properties:
> -  - compatible: must be set to "cdns,csi2rx" and an SoC-specific compatible
> +  - compatible: must be set to "cdns,csi2rx" or "cdns,csi2rx-1.3"
> +    for version 1.3 of the controller, "cdns,csi2rx-2.1" for v2.1
> +    and an SoC-specific compatible

This wording is now not clear that an SoC-specific compatible is always 
required or just for 2.1. Please format one compatible per line.

>    - reg: base address and size of the memory mapped region
>    - clocks: phandles to the clocks driving the controller
>    - clock-names: must contain:
> -- 
> 2.15.0
> 
