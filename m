Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE3E4139D9B
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 00:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbgAMXog (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 18:44:36 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38125 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbgAMXog (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 18:44:36 -0500
Received: by mail-oi1-f195.google.com with SMTP id l9so10077352oii.5
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 15:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T2alnzvz8KAPkt6TNZdOKsvg51Cv8nSh38BXX535N54=;
        b=Q7fsT/oxWPXMVnGXcgm9+vrbwwfz+KIK653JeZGLsLBBpbOCCopjzIrnDW+TZgrP5D
         nI3TeiEv9JF3xIB7Rx7frdCyzQE22IXJFrd4qk9zUSDlGyh5iWPnJ122cQybJgd2xxCc
         ijUruotm2iHseAFk54u5EkeJiAx9JsAQjRjNwD8KD8rFt8phtA17JhF9OZa7odvP2fQd
         pGC6p06J4sby0HkBa0rjtXFZrWUByI1w0hD3iB9xAzRnUbN3DeG+njEncryQi3Yh8eGB
         xBHEblRlexVu+dNSUaRR54dqiIUysgXlb81x/bH4aEuXdg6E3ynJRKp17RiA7j+F4lMN
         Xvbg==
X-Gm-Message-State: APjAAAX6QCEC6i5hK2amrGbJFeEjQK8x8DQ5L+pa8b6KoYDrxJVFzHp9
        E7shgdq15iHzWoTNDziMlH2De7u4Hg==
X-Google-Smtp-Source: APXvYqxEWsL5BLd+DkGPFThheRlsJ82xFZ93Zc/MXCf+reQMA4rIq5bCXkGWlyMx7A5GlcXaptEWpA==
X-Received: by 2002:aca:50cd:: with SMTP id e196mr14643725oib.178.1578959075453;
        Mon, 13 Jan 2020 15:44:35 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm4039115oin.5.2020.01.13.15.44.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:44:34 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221ac9
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:25:02 -0600
Date:   Mon, 13 Jan 2020 17:25:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     mark.rutland@arm.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        vkoul@kernel.org, eugen.hristev@microchip.com, jic23@kernel.org,
        knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
        mchehab@kernel.org, lee.jones@linaro.org,
        radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
        tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, wg@grandegger.com,
        mkl@pengutronix.de, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-can@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 04/17] dt-bindings: atmel-tcb: add
 microchip,sam9x60-tcb
Message-ID: <20200113232502.GA31265@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-5-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-5-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 10, 2020 at 06:17:56PM +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-tcb to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-tcb.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-tcb.txt b/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> index c4a83e364cb6..cf0edf5381c9 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-tcb.txt
> @@ -1,6 +1,6 @@
>  * Device tree bindings for Atmel Timer Counter Blocks
> -- compatible: Should be "atmel,<chip>-tcb", "simple-mfd", "syscon".
> -  <chip> can be "at91rm9200" or "at91sam9x5"
> +- compatible: Should be "atmel,at91rm9200-tcb", "atmel,at91sam9x5-tcb",
> +  "microchip,sam9x60-tcb", "simple-mfd", "syscon".

How many valid combinations are there? 1 with 5 strings? List one valid 
combination per line.

>  - reg: Should contain registers location and length
>  - #address-cells: has to be 1
>  - #size-cells: has to be 0
> -- 
> 2.7.4
> 
