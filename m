Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C38139D31
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 00:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbgAMXXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 18:23:01 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44485 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbgAMXXB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 18:23:01 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so10015064oia.11
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2020 15:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F2iDZ52lWikDVmU5g/bwIONEfUCTF197jf9k+MTeRXI=;
        b=Td2bOxUpJKvGO2JY0YiQXSvRZXDzEq10pdAhxKVn3cFEMhOzUfEtBi1m8ayD/p/VkO
         4TBQ8mOb43AAb493baTt00WEuI+Yc8FNNFyzTJeySXZN++dnkS0iGWMv770veLvUZ8qx
         PKTLxfkNMzb0h293F67xFi7WqzoRjEd68uXrPm60NfOtMYVn5D9hE7h78f1Z1MVQ7oCZ
         skVyxYuxPNZ2Y5uIzZLqNMYxgBXlE+qerj+bvqp4VxP8yM52KDQ6z9Z8YVMX9rpVwYTx
         nEXHVVSr34gIrHdHfOizo/XZWg+ssczzNF9kwGC/cKq8JJT4q6GlGkdE3J4YU/2eKdTV
         wRlg==
X-Gm-Message-State: APjAAAV6KHBiWOBESKV6qwdkGtS0i5n51d3TzOIQuw76s2wEulGhBuGr
        qzVokvSaJ59w324WUSBUkrEerbQ=
X-Google-Smtp-Source: APXvYqzuNjQv5NvR4uLQDV7p0JgZPdhAIDMQTAoT77G1LbMLHAr03fewXM57VrwjzIZCmXNc6OrPew==
X-Received: by 2002:a05:6808:6c5:: with SMTP id m5mr13838420oih.106.1578957779803;
        Mon, 13 Jan 2020 15:22:59 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c12sm4755948otp.9.2020.01.13.15.22.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:22:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:22:57 -0600
Date:   Mon, 13 Jan 2020 17:22:57 -0600
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
Subject: Re: [PATCH v2 01/17] dt-bindings: at_xdmac: remove wildcard
Message-ID: <20200113232257.GA30124@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-2-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-2-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 10 Jan 2020 18:17:53 +0200, Claudiu Beznea wrote:
> Remove wildcard and use the available compatible.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/atmel-xdma.txt | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
