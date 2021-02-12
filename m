Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44EA319849
	for <lists+linux-media@lfdr.de>; Fri, 12 Feb 2021 03:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhBLCTp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 21:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhBLCTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 21:19:44 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160C8C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 18:19:04 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id z6so4931741pfq.0
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 18:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=skYpGGj76oQv9lMxtcR9Xrk9JSgRv7NaNmfm4mnJLDI=;
        b=FC1oNB7uTxokBPROku9EWbtT5h5Jd2V1lP+WWsScUUesSs9V6Aamq4n52P3t8Muoxz
         Sia52vmwOBaBW4pBWYKDuGqYTgAL0rv2MVviRBr5IBOuwohsJDabxbO+fHTziyMKFDuP
         z9mX5UpFUbsd6Bu4FJToKFMMYCeKL5OX0xDmHejT3TG3KUr/EDlU6knWpiM1qsSeaAFX
         piC7CJjVadwgsjqGBeVqay1YIDlSDadU7xmV1O7I4N57JUXyjfBWy1I7CIky585rRNwy
         QwX+/CLdTEy79MlXmYfiZn6R9TLVL/hY5Nk20Zir09kWPDCgCN5XBdQCgpHBGgsbIMEm
         zqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=skYpGGj76oQv9lMxtcR9Xrk9JSgRv7NaNmfm4mnJLDI=;
        b=tUpsb2CUmoOllLe+xprCxlPu6/5paKuhX9HUUhJUl/8z/Cs0IoZ8fyCxTj6JHUjs/V
         f89m7Aby5vAqcRwOT7TxvnAJsyl/dlwK7PLntzLrNPZ+L94WC8qgVZI6v5AxT71t2mj2
         MbezBM1YjipycFzmCszYi6iZUWmtzxf0ZwsDZiGa5SKHLNiO+CfBcrEP4HgjeRpxiAI9
         dWXg6F4lV6YdZAuFf/Oar+npcwgKmxjYnIdqoz5SQAY+wbNbD8YRzs6ZCqglDdPTbdpe
         uHic/ylqTuKEr8vcmqoYspYcsAb2cUtIWiWR/UDU94BptO1M7Ij9/iDI6VY9XQjS2d5Y
         NBeA==
X-Gm-Message-State: AOAM530Wx1MAdk4JiMp6109EER66/w475EqZbZZRe1xO658nQeclFjLH
        riic3G7EZeDWBCs+Gwv6vdX9MjE3eefElA==
X-Google-Smtp-Source: ABdhPJxx2SSi+WeE7u4vfAcrSkUWNiFEKNaWlWcEkBhLQ+un9TpUWXUHOpGrl3PJO+cPUdZcUl4F0g==
X-Received: by 2002:a63:70f:: with SMTP id 15mr1032124pgh.250.1613096343291;
        Thu, 11 Feb 2021 18:19:03 -0800 (PST)
Received: from ?IPv6:2001:d08:d4:8acb:bb3d:b251:bee1:8a26? ([2001:d08:d4:8acb:bb3d:b251:bee1:8a26])
        by smtp.gmail.com with ESMTPSA id x1sm7725985pgj.37.2021.02.11.18.19.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 18:19:02 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   Afifi Kamil <afifikamil@gmail.com>
Subject: UVC device is not listed: Fantech Luminous C30 webcam
Message-ID: <ac2025ff-a769-6d24-8200-582bb151af55@gmail.com>
Date:   Fri, 12 Feb 2021 10:18:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi sir/madam,
Glad to inform that I found a webcam (I recently bought) which is not 
fully supported by UVC.

The webcam details are as follows:

*-usb:0
                    description: Video
                    product: Fantech Luminous C30
                    vendor: Fantech
                    physical id: 1
                    bus info: usb@1:1
                    version: 0.10
                    serial: YG_U700.2020.0921.1514
                    capabilities: usb-2.00
                    configuration: driver=snd-usb-audio maxpower=500mA 
speed=480Mbit/s

When I run the following code in Terminal: lsusb -d 1d6d:0105 -v | grep 
"14 Video"

The output given was: Couldn't open device, some information will be missing
       bFunctionClass         14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video

Please note that the device ID is 1d6d:0105

The webcam has built in mic and a standard USB-A interface.

Looking forward to hear from you soon as it will be very helpful if I 
can get this webcam works well in my Ubuntu 20.04 LTS.

Thanks

