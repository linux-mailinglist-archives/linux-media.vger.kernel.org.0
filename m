Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5993A4DB4
	for <lists+linux-media@lfdr.de>; Sat, 12 Jun 2021 10:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhFLIhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Jun 2021 04:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhFLIhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Jun 2021 04:37:43 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB09C061574
        for <linux-media@vger.kernel.org>; Sat, 12 Jun 2021 01:35:43 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id k7so8058476ejv.12
        for <linux-media@vger.kernel.org>; Sat, 12 Jun 2021 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y17o1CwKed3ewmX6HPexv1Ft5E+hPY1b3KZ4Tlud1wY=;
        b=DP2I1qEHrDEscnVPZL9zrld22PPK4e567sPdzYJ41coQJGE/vzM0l8NBBEndccfK8X
         pYp1s0YEH58BCgFoWbwFDTkM2y7VnN7Ni4wzWGrrr5cXsnBvtIhIKQxx1O34pwHIV5G4
         ayHXSGljM9QKzQB/KWk4IvcJoXfy+zaFdGZ/eOyxtzk8oGRr6YS7yMiDW4Fp0/1Adcp9
         njzIdqessrRgyEtoEsUmgDwaiqq+rB2WYPFAuy4dHb+csvGxWvHrcPFLVnYQnu7uONaM
         bbNMe/hoy9JGG1ZOQb5eVXSgm17S1yXlskGP87LxjNYoByHzGLRgrR0BasPnD+ZhiqbH
         8b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y17o1CwKed3ewmX6HPexv1Ft5E+hPY1b3KZ4Tlud1wY=;
        b=phmFDCZiT37crzFnEIWnrvJhNuxB8GsTbo5UixvAnZxgW8BVE/5K8en8hM/5njnxuZ
         fS5XM8asWd16HoyGr+afUcsNR7Bjf3m9579iGkc95pdGx9+HmxfROrOWnR98Rl52RjwM
         Np5XNqjRtVCOfWYwWcUYA8rM6strCLjTkYcLVwtqa5wPwJaEq6feVkOBR7sP7Uz45bqK
         C3sfSsfol/LDAT/bBOjVcKWCYzQnXYG5ZCgfebv/GerNP9Nil95Z26f+UA5Wq5egNoTn
         W7gWlEDgv4epoeWGMmmBFslGvtqFpHcpoqtIZPZjpTa1jGGpNjlemAcxDgOhPrj7a2+e
         OExw==
X-Gm-Message-State: AOAM533PEB6D2YHJmZdYLh6OIEACxZl2NtztVerbiblPbm+4KaEEkpF9
        JkAnU+shb8KSDKYapZltJXmClp+RYWFLpA==
X-Google-Smtp-Source: ABdhPJwWw/Y34I6DavsRQM9d3e9RdK6NEMjN+Rch1CASmc5ho2OnjV0e2M7yk1UZXPBdCWDLr5oq3Q==
X-Received: by 2002:a17:906:b7d7:: with SMTP id fy23mr7338466ejb.49.1623486942296;
        Sat, 12 Jun 2021 01:35:42 -0700 (PDT)
Received: from [10.8.0.2] (terefe.re. [5.255.96.200])
        by smtp.gmail.com with ESMTPSA id p5sm2824760ejm.115.2021.06.12.01.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 01:35:41 -0700 (PDT)
Subject: Re: Logilink DVB-T2 stick VG0022A
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Sean Young <sean@mess.org>, Gon Solo <gonsolo@gmail.com>,
        Antti Palosaari <crope@iki.fi>
Cc:     linux-media@vger.kernel.org
References: <20210611144917.26rvhietmpbuuo5p@pengutronix.de>
From:   Tomasz Maciej Nowak <tmn505@gmail.com>
Message-ID: <6934ee17-9dd7-fdc2-9629-cfff286a8031@gmail.com>
Date:   Sat, 12 Jun 2021 10:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611144917.26rvhietmpbuuo5p@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

W dniu 11.06.2021 o 16:49, Uwe Kleine-König pisze:
> Hello,

Hi Uwe.

> 
> I have a Logilink VG0022A stick and when I plug it in I get:
> 
> [  426.019171] usb 1-1.3: new high-speed USB device number 5 using xhci-hcd
> [  426.171443] usb 1-1.3: New USB device found, idVendor=1d19, idProduct=0100, bcdDevice= 1.00
> [  426.172184] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  426.172822] usb 1-1.3: Product: TS Aggregator
> [  426.173205] usb 1-1.3: Manufacturer: ITE Tech., Inc.
> [  426.173641] usb 1-1.3: SerialNumber: AF0102020700001
> [  426.180314] dvb_usb_af9035 1-1.3:1.0: prechip_version=83 chip_version=01 chip_type=9306
> [  426.181324] usb 1-1.3: dvb_usb_v2: found a 'Logilink VG0022A' in cold state
> [  426.182034] usb 1-1.3: firmware: direct-loading firmware dvb-usb-it9303-01.fw
> [  426.182666] usb 1-1.3: dvb_usb_v2: downloading firmware from file 'dvb-usb-it9303-01.fw'
> [  426.221915] dvb_usb_af9035 1-1.3:1.0: firmware version=1.4.0.0
> [  426.222456] usb 1-1.3: dvb_usb_v2: found a 'Logilink VG0022A' in warm state
> [  426.224991] usb 1-1.3: dvb_usb_v2: will pass the complete MPEG2 transport stream to the software demuxer
> [  426.225998] dvbdev: DVB: registering new adapter (Logilink VG0022A)
> [  426.226551] usb 1-1.3: media controller created
> [  426.229845] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> [  426.454279] i2c i2c-9: Added multiplexed i2c bus 10
> [  426.454726] si2168 9-0067: Silicon Labs Si2168-B40 successfully identified
> [  426.455377] si2168 9-0067: firmware version: B 4.0.2
> [  426.458522] usb 1-1.3: DVB: registering adapter 0 frontend 0 (Silicon Labs Si2168)...
> [  426.460236] dvbdev: dvb_create_media_entity: media entity 'Silicon Labs Si2168' registered.
> [  426.469300] si2157 10-0063: Silicon Labs Si2147/2148/2157/2158 successfully attached
> [  426.489642] usb 1-1.3: dvb_usb_v2: 'Logilink VG0022A' successfully initialized and connected
> 
> which looks fine. But when I try to use it (using mumudvb2) I get:
> 
> [  479.915150] si2168 9-0067: firmware: direct-loading firmware dvb-demod-si2168-b40-01.fw
> [  479.915871] si2168 9-0067: downloading firmware from file 'dvb-demod-si2168-b40-01.fw'
> [  480.436016] si2168 9-0067: firmware version: B 4.0.11
> [  480.444089] si2157 10-0063: device is buggy, skipping firmware download
> [  480.496756] si2157 10-0063: firmware version: �.�.255

That is to be expected, the device provides its own (patched?) firmware. This output is very
similar to what I have and it works fine. Tested reception on both DVB-T standards with
kaffeine, mumudvb2 tip and t2scan. You'll see the second part of dmesg message each time
You'll switch the channel or start tuning.

> 
> and it fails to tune.
> 
> Do you have a hint?

What differentiates between Your configuration and mine is I tested the stick in USB 2.0
port. Also what I'm missing from Your log is loading of dvb-demod-si2168-02.fw, I assume
it's present, since the driver doesn't complain.
I don't know if it's enough of a hint, since I'm not 100% sure if my TerraTec TC2 Stick is
exactly the same as VG0022A, but hope it helps

> 
> Best regards
> Uwe
> 

Regards, Tomek.

-- 
TMN
