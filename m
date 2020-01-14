Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40AC9139E00
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 01:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbgANAUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 19:20:35 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42327 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729489AbgANAUd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 19:20:33 -0500
Received: by mail-oi1-f196.google.com with SMTP id 18so10149484oin.9
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 16:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/2uIWxQRw2ac2zDhobeFtImF06Kett0ywn6nB0mPlAo=;
        b=O8AXEL9G1MM4VxAQ3aqc8T0fDkkwPWBmRwbr2hX7CPA78UGvbuomf2Iw/kq/7e74ag
         pMHdQGe85xJbFSpuCo0FHaMuemS/93wcUG2SF+wE67ytHPa/c1iy9LfPYTnWzBpe6JkJ
         nz7tNtgPmPNjSEBygqdhDpK7rxxTV5MZJKCQ9aNMdWcuFxfPwdX7v57/y+1oSzPK8kWJ
         CY1vEGRSlG+CDgNqO0bWm7HhHwUc6JKoKt2p//toYk4+2n0EXO+xQZS3JCZb7hRb2zoh
         vRrbg0Jx11pt8tk5iFdNjv3CjeI5KC/PgaIrqrXuYWqvfAs7X/whj1OL+V0eC8J1/kLd
         SdNA==
X-Gm-Message-State: APjAAAWuHLm9w34BlyOX3P3XfBviQv7RktF/RBfT7CGnckyBDEuBoaI7
        brofuMwsWHNMnEFsWhxiVzvMaiS20g==
X-Google-Smtp-Source: APXvYqynCRsFdnf2yupND72fie5V5GNfqQlcU6C5huShUglpGBTP/AqJYrwettzAsjookfa1zJaNDA==
X-Received: by 2002:aca:51c9:: with SMTP id f192mr15271045oib.10.1578961233089;
        Mon, 13 Jan 2020 16:20:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j10sm4749126otr.64.2020.01.13.16.20.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:20:32 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221ab2
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:16:59 -0600
Date:   Mon, 13 Jan 2020 18:16:59 -0600
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
Subject: Re: [PATCH v2 08/17] dt-bindings: atmel-nand: add
 microchip,sam9x60-pmecc
Message-ID: <20200114001659.GA11452@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-9-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-9-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Jan 2020 18:18:00 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-pmecc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
