Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB2B139E56
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 01:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgANAfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 19:35:07 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:32993 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgANAfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 19:35:07 -0500
Received: by mail-oi1-f195.google.com with SMTP id v140so10221042oie.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 16:35:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UiO2+Fp93HhiZmZTyPCKddyYzvj9rECWLiqMRlRa5BM=;
        b=GrKLUadW4JSCIofbUA55Y95aqdHlTYKw6/iN9RK3+N5XOLt24Cf3cYiXKN4H+czMaq
         Z7ykmJKFFuCF47r1y5JbWipVqvnj9BOL7ngGXVCc1XPdImzD+p661Yv/pEPputwSenE8
         yR/C81x1YSxcVfPYmc6Gg3lChsWJTm4qHhjfR7KSAl8RF0WTxol6Uy/TysLn/5naCkVr
         TOf7+7rbD8o4gWr5BYINtl/jYxiN97Pa6lFOqvlwO+SsZIXgCGzzWXk8Xvv9YuBAF51W
         DFyl0qh75hMYX2RewKNThr32hO/41cBWcVOigaijRLDQ9DP7nqdlVdBogXx2VEGCtez4
         41Cw==
X-Gm-Message-State: APjAAAX2SLXi4rK9kaik8wq8N7/6Op+6V1h5y2HQR6faWC+y7xdolod+
        qr9eFamcJJsKAx53H5kAXlJ/9UT8ew==
X-Google-Smtp-Source: APXvYqxlgNOGYv/iHCKu1oKGq7fayZZR4A0dchaplNvnuedj01N0JsXOZ+JAmwhCj96BVKbyTYTosQ==
X-Received: by 2002:aca:4ec3:: with SMTP id c186mr14444187oib.53.1578962106431;
        Mon, 13 Jan 2020 16:35:06 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k13sm4076583oig.24.2020.01.13.16.35.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:35:05 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:18:03 -0600
Date:   Mon, 13 Jan 2020 18:18:03 -0600
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
Subject: Re: [PATCH v2 10/17] dt-bindings: atmel-smc: add
 microchip,sam9x60-smc
Message-ID: <20200114001803.GA13249@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-11-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-11-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Jan 2020 18:18:02 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-smc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-smc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
