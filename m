Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9BFD139DC2
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 01:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgANAFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 19:05:08 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45485 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbgANAFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 19:05:08 -0500
Received: by mail-oi1-f196.google.com with SMTP id n16so10104514oie.12
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 16:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1hWr5fTf0UvM/FdokqnbY78OahK5vgKtckbIjPFsKcM=;
        b=Ih3F01xXIIf4g9bMxtMC+XDFHWWwGCXGwr6XAGnSHLWl4u0p7bmNDxqFc4RqWTODkT
         fY6kuQxiOelVqdLvVmae9lDHGSbnJ2GMyImpjh+7Jwb4ZYmFOC07MaMKARxhjc/fFzf2
         maQ9Osj+6nS7FavRMU/Y9PcXWusBRc9CVpSL6Lk3Nx5zrutNI5bG3VM9KCBSlM5UuelH
         HuW/pc6uxN9k9jFEzP/GORc7/HsNaCVQTVyFY1SPgHazbGCoRl5b3H53hPDU5SDWVrMy
         m/zIWEVeQVsAm6Az2X7DKSjSQsst9DPmx7EsABOyG0rPa2tS7Ug+qn5kA0ocJ7Tat1p5
         PSgQ==
X-Gm-Message-State: APjAAAXNQ1Xgm9MOc2XMYliynCooxqMU4VsKce/gkUFs3td7zb0i6v6l
        7+lt6bWmnNzb8AEv5hSLJh1EnYa3Dw==
X-Google-Smtp-Source: APXvYqy2IsGRAi57r/IQF9FtU0zBSZI4tHAAVMUngbq34lvblhf8dCMx11bC90NUCXRUZth4iFCXgQ==
X-Received: by 2002:a05:6808:3d0:: with SMTP id o16mr14795239oie.79.1578960307002;
        Mon, 13 Jan 2020 16:05:07 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q13sm4729938otc.5.2020.01.13.16.05.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:05:06 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 223f23
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:25:51 -0600
Date:   Mon, 13 Jan 2020 17:25:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, vkoul@kernel.org,
        eugen.hristev@microchip.com, jic23@kernel.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, mchehab@kernel.org,
        lee.jones@linaro.org, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, tudor.ambarus@microchip.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        wg@grandegger.com, mkl@pengutronix.de, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-can@vger.kernel.org, linux-rtc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 05/17] dt-bindings: atmel-isi: add
 microchip,sam9x60-isi
Message-ID: <20200113232550.GA2344@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-6-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-6-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Jan 2020 18:17:57 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-isi to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/media/atmel-isi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
