Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F91139DE4
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 01:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729345AbgANAQc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 19:16:32 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:33859 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728641AbgANAQb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 19:16:31 -0500
Received: by mail-oi1-f194.google.com with SMTP id l136so10186501oig.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 16:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E6IJAm/G2BZsEtWssBpYlld99L9pgrhy2OUvTYO1Gu4=;
        b=N0W/QmMgvmr1vuzpi2hMswjNuzYGdiWVilR2ajo0K0reY2BfrT+vqLnjWiq6bjTxTJ
         StU0YkU2ephxfJ4bvzq8/U2EtzOC8EbQxNGht1+sqZp/qp4VeVVMPAehlWW1gGPckPZ8
         burSiXvVOui5bZHR9pAmI2mSh69z3Ni+HpkQaL3VhWNxyx88O1gBDHV3SPT0yumFz7wq
         MdefqCwEgSJXLi5aCJT+1WunsF5zMPZAnr7ju46v5k5avu7MNCkXFlcJ0yfQiPAEQ/g1
         7NMSTlSU8jAi+SF97EoDFhYFkcc1LGrqY+n7cODDEPv9Rztklcfos9j+g+Z/QK4fj5C5
         q/HQ==
X-Gm-Message-State: APjAAAU2VhLxxrNDlqnkjkvV6udVa3Fckj0UgrADPcwX/2HVBoQhLo9N
        sTQJt95hFs18Njk9gc6fcoZXEQZMvA==
X-Google-Smtp-Source: APXvYqy0wuHKUT6xLDaDZ8E2TlEDQUn5wjROC2cLpUtl+QSmfuOcMIHpJm7suhsKORlJS4qO8bLgEQ==
X-Received: by 2002:aca:bac3:: with SMTP id k186mr15318102oif.19.1578960990609;
        Mon, 13 Jan 2020 16:16:30 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f4sm4053720oij.25.2020.01.13.16.16.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:16:29 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:16:27 -0600
Date:   Mon, 13 Jan 2020 18:16:27 -0600
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
Subject: Re: [PATCH v2 06/17] dt-bindings: at91-sama5d2_adc: add
 microchip,sam9x60-adc
Message-ID: <20200114001627.GA10411@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-7-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-7-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Jan 2020 18:17:58 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-adc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
