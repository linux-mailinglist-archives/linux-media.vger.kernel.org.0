Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D964352E3
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 20:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhJTSqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 14:46:03 -0400
Received: from meesny.iki.fi ([195.140.195.201]:36916 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230076AbhJTSqD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 14:46:03 -0400
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 69C4A200A4;
        Wed, 20 Oct 2021 21:43:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1634755426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RoYvvqZQkhJSELmgjkpysEUTTnb/9wmmXf4FzNHpdn4=;
        b=SYlYaDz8mPMtSzfo7f+2jzLc7AjFYqb7YHgf8eB9lpAa1cNOz5/V6kK6wZFif4yT2B2M/8
        b36oIylv6ajzENnwxh9JbZ+OEk76HRB1AQFs6PlwVAoIPWV6RlRnSfKxae0hqChzAi4uuV
        7WJRe8WXOuJ6xrlUw3NFKj86hPI3ULo=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3C6BA634C90;
        Wed, 20 Oct 2021 21:43:44 +0300 (EEST)
Date:   Wed, 20 Oct 2021 21:43:43 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <YXBjX2vUwrKVOd78@valkosipuli.retiisi.eu>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
 <m3mtnflpna.fsf@t19.piap.pl>
 <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
 <m3a6jel9ce.fsf@t19.piap.pl>
 <YWXwSAm3OO/WTkOL@valkosipuli.retiisi.eu>
 <m335p5lc04.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m335p5lc04.fsf@t19.piap.pl>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1634755426; a=rsa-sha256; cv=none;
        b=YVth3SL3n/8q/Y+6g18UnZ4TugSE/pDLHS49PElAlo8/NTiBl/xtwBer8I1rdSMz/L3N6Z
        zXlrtmEnSM4NQLz2+2meyFb8Dxgcr+c266sAVKD37H4+FbdEIgUVwp9eLfGR/GiDb+VtwF
        ColZdm/Zh3EeiEusBYosu2pR8ltSo2I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1634755426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RoYvvqZQkhJSELmgjkpysEUTTnb/9wmmXf4FzNHpdn4=;
        b=w854VqFbZ0kTtLlb7l0UwUSVmDHmOQCY4Si79n2t+9kZx2Kj1Y8BxxwcWeQ7eKSimg7iZK
        t3usWgnh/Ii+OhqqG3E+JAOJ1dxtxFJKh53yjHbVE/oFSP68GxjONoqqqKqQ1LtW5ccrh/
        WdGJx1vUjsTs6N8+lZhxtag6PPPn/Cs=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Wed, Oct 13, 2021 at 07:39:07AM +0200, Krzysztof Hałasa wrote:
> Hi Sakari,
> 
> > 	https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html
> 
> Ok:
> "8.2.2. Devicetree
> 
> The currently preferred way to achieve this is using assigned-clocks,
> assigned-clock-parents and assigned-clock-rates properties. See
> Documentation/devicetree/bindings/clock/clock-bindings.txt for more
> information. The driver then gets the frequency using clk_get_rate()."
> 
> Let's see:
> Documentation/devicetree/bindings/clock/clock-bindings.txt:
> 
> "==Assigned clock parents and rates==
> 
> Some platforms may require initial configuration of default parent clocks
> and clock frequencies. Such a configuration can be specified in a device tree
> node through assigned-clocks, assigned-clock-parents and assigned-clock-rates
> properties. The assigned-clock-parents property should contain a list of parent
> clocks in the form of a phandle and clock specifier pair and the
> assigned-clock-rates property should contain a list of frequencies in Hz. Both
> these properties should correspond to the clocks listed in the assigned-clocks
> property."
> 
> So I'm after "assigned-clock-rates", right?
> 
> "Configuring a clock's parent and rate through the device node that consumes
> the clock can be done only for clocks that have a single user. Specifying
> conflicting parent or rate configuration in multiple consumer nodes for
> a shared clock is forbidden."
> 
> This sounds a bit problematic, the clock I use is at least potentially
> shared by multiple parts of the system, depending on current (run time)
> configuration. I am/was getting different frequencies depending of the
> particular system (all based on the same i.MX6* SoC, but with different
> peripherals used/enabled). I think it's quite a common situation.

This was discussed some time ago before I wrote the documentation. The
conclusion back then was that it's just fine, and such cases would need to
be addressed when they turn up. We haven't had any yet as far as I know.

> 
> > Generally camera sensor drivers that set the clock in drivers themselves
> > are (very) old.
> 
> Let's have a look... ov9282 is (one of) the newest drivers. It does:
> #define OV9282_INCLK_RATE    24000000
> 
>         /* Get sensor input clock */
>         ov9282->inclk = devm_clk_get(ov9282->dev, NULL);
>         if (IS_ERR(ov9282->inclk)) {
>                 dev_err(ov9282->dev, "could not get inclk");
>                 return PTR_ERR(ov9282->inclk);
>         }
> 
>         rate = clk_get_rate(ov9282->inclk);
>         if (rate != OV9282_INCLK_RATE) {
>                 dev_err(ov9282->dev, "inclk frequency mismatch");
>                 return -EINVAL;
>         }
> 
> $ git grep -l ov9282
> Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
> MAINTAINERS
> drivers/media/i2c/Kconfig
> drivers/media/i2c/Makefile
> drivers/media/i2c/ov9282.c
> 
>   clocks:
>     description: Clock frequency from 6 to 27MHz
> 
> No in-tree DTS exists, but the single frequency (both in the driver -
> this one can be fixed - and in the DTS) is rather limiting. Maybe
> another:
> 
> imx412, imx335, imx334, imx258 - same here.
> imx208 is ACPI-based.
> 
> Which driver should I consult?

The drivers you're looking at are based on register lists so they usually
support just a single frequency. The sensors are not limited to this
frequency however, which is why you see the frequency in DT bindings, too.

-- 
Regards,

Sakari Ailus
