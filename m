Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10FE88B754
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfHMLix (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:38:53 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:35580 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfHMLix (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OhLDQQN+hbiEAG1TpQP8a/y4fpxqsnBJK9G3iQ2C2s4=; b=hR9C8SdbOHH8WqJOQWEwqSr9I
        lwLZSuUVnKR8i72bzk8GJ87wf6D5jPsRm8eA88Skhp56CD9oCqXvvC7ed9eX0kBjNeOR52PaU749P
        oofDaSOufoispmGRH8UprhrwSFfOakR0EJWiCgwg9BgNEsGKIWUmv0CHxNqsPu2ixQ+wuA7aQDJCf
        AZ8EhtXC/8XV9OGEHWNz5tSohTsDaYmGbvTJIJPxr7cb7u7e8DWbvk8ciX5NR8wnxebry9pwuv7W3
        ruzfmL+qbDeCKTpXkC9O8p1A0oyTqaS9KvxNRNwcoD28dpo7fOdWlXIyca66wqUQLDqglMufmZmut
        pNT+hXJkg==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:44432)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hxV8a-0008Tv-Jc; Tue, 13 Aug 2019 12:38:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hxV8Y-0007T9-Pj; Tue, 13 Aug 2019 12:38:46 +0100
Date:   Tue, 13 Aug 2019 12:38:46 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        c.barrett@framos.com, linux-kernel@vger.kernel.org,
        a.brela@framos.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Message-ID: <20190813113846.GG13294@shell.armlinux.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> +Required Properties:
> +- compatible: Should be "sony,imx290"
> +- reg: I2C bus address of the device
> +- clocks: Reference to the xclk clock.
> +- clock-names: Should be "xclk".
> +- clock-frequency: Frequency of the xclk clock.

Driver code:

+       ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);+       if (ret) {
+               dev_err(dev, "Could not get xclk frequency\n");
+               return ret;
+       }
+
+       /* external clock must be 37.125 MHz */
+       if (xclk_freq != 37125000) {
+               dev_err(dev, "External clock frequency %u is not supported\n",
+                       xclk_freq);
+               return -EINVAL;
+       }

So, only 37125000 is supported - is that not worth mentioning in this
description?  Is this a hard requirement of the sensor?  If so, why
does it need to be mentioned in the DT binding?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
