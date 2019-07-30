Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D3779FC8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2019 06:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfG3ENI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jul 2019 00:13:08 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40906 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbfG3ENI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jul 2019 00:13:08 -0400
Received: by mail-pf1-f194.google.com with SMTP id p184so29103934pfp.7
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 21:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0dIdr0oee/yzISErhJRxkq09mvv2TBOhcmQ09wO6m0E=;
        b=OrtCq5Snu5fXUnizDVa0OuKzMhTHKT7s5OK7tU318dlfyuG3bM8RYHmuV7nP3E8a+/
         +yOlv35ESIfJr+g4pd9yjM6q41lvTW01/7heaskQI8d33iLkSP72SzxWG8aVo3W3u+ZW
         dlCPkfjpEZYFugUKH4EwVM50JS3i9vV3dshDL2KJChMPBmBzi26W0ceSNsth5kCjs3ZC
         eunZDBKEX1l8ogrLuX2V/aXyizny3TO8NSczp/xzmsx9f680i9TQH6sws+AnLECXDaiq
         Nz3tHjZnvmu8y3C3vgW2fEbRXakmRB+5d3ZWZnaOx/4227/5+FKR1sBYP+srlkJTAm+G
         jCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0dIdr0oee/yzISErhJRxkq09mvv2TBOhcmQ09wO6m0E=;
        b=NYfMXR7zOpMMXmq14/BTE5krp1yW0ms8eMU4WdiMxYimA40UBRIjnT6Hh/OHT/bnen
         yVkxmzs1DdsPUIHQHTGs4eyeFZ6NMdv8bliqO9RN3ob8Z7RuEpglojT4JEA8uGiXkzdp
         yuwKwRgbEDpwKBAs6NwDyHTE0BTH8i+cYHr+gy0rCbrIsqZiVjdrodFLbBaXlkGNvexS
         CCiowjjKna/gtFLtnMShAu+w2Y52J9KatXeFlgDrLro7qTVrgdtSSXyYRrSdo4whLYNK
         bROkTeHmdPTtuxV34wJRziKHr1/MmKp9uSOu9CAMGkEesAvhAOot8KfKOCXKzeliq1Sb
         zpXw==
X-Gm-Message-State: APjAAAU/eETminiGo2refyom6zPNqDMTwq11tK41f064+5fPEeac9uKr
        viAsbEImKGl/NnmYj2DIlSse
X-Google-Smtp-Source: APXvYqz5yPeIopb8Zi5XBaN/Wi6+Py+XNWnQJqU+IjLr28mzLvamVAUeAbUgGvxcXYv4TzlNrw5ZMA==
X-Received: by 2002:a62:770e:: with SMTP id s14mr38606145pfc.150.1564459987428;
        Mon, 29 Jul 2019 21:13:07 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2405:204:704e:cda4:ddd4:6d08:8469:b0f0])
        by smtp.gmail.com with ESMTPSA id h9sm76306769pgk.10.2019.07.29.21.13.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 21:13:06 -0700 (PDT)
Date:   Tue, 30 Jul 2019 09:42:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org
Cc:     robh+dt@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, c.barrett@framos.com,
        a.brela@framos.com
Subject: Re: [PATCH 0/3] Add IMX290 CMOS image sensor support
Message-ID: <20190730041253.GA3178@Mani-XPS-13-9360>
References: <20190703190230.12392-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703190230.12392-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 04, 2019 at 12:32:27AM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds support for IMX290 CMOS image sensor from Sony.
> Sensor can be programmed through I2C and 4-wire interface but the
> current driver only supports I2C interface. Also, the sensor is
> capable of outputting frames in following 3 interfaces:
> 
> * CMOS logic parallel SDR output
> * Low voltage LVDS serial DDR output
> * CSI-2 serial data output
> 
> But the current driver only supports CSI-2 output available from 4 lanes.
> In the case of sensor resolution, driver only supports 1920x1080 and
> 1280x720 at mid data rate of 445.5 Mpbs.
> 
> The driver has been validated using Framos IMX290 module interfaced to
> 96Boards Dragonboard410c.
> 

Ping on the patchset!

Thanks,
Mani

> Thanks,
> Mani
> 
> Manivannan Sadhasivam (3):
>   dt-bindings: media: i2c: Add IMX290 CMOS sensor binding
>   media: i2c: Add IMX290 CMOS image sensor driver
>   MAINTAINERS: Add entry for IMX290 CMOS image sensor driver
> 
>  .../devicetree/bindings/media/i2c/imx290.txt  |  51 ++
>  MAINTAINERS                                   |   8 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/imx290.c                    | 845 ++++++++++++++++++
>  5 files changed, 916 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
>  create mode 100644 drivers/media/i2c/imx290.c
> 
> -- 
> 2.17.1
> 
