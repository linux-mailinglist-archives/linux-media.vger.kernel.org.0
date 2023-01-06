Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6015660070
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 13:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbjAFMoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 07:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233519AbjAFMoE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 07:44:04 -0500
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5FB74588
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 04:44:02 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id g10so982915wmo.1
        for <linux-media@vger.kernel.org>; Fri, 06 Jan 2023 04:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTClWjT4byKGMegNPIsfINnGfyLulTMJwypcAg7J/gU=;
        b=AEmtewgzTDh9ko6onZXzAhFanrmx9YTk31+HeMZy9Y2mfeYSO5m0bNPq0PFMDydm1p
         OT2+N0hWu0rf5C2ifPYllYUTYvqXyJYTtRDvNt7zYTS/O21BHwEVmnL9iwpSqRz0dnnI
         byl0BT7WOPz35FGZSuFO7gDB2YvXFCzaujj/pRvg+y/Gf0/xu1JkbWlhonVPZoWcNZQq
         3MSB2JuoEeJA+tM4ZS9fxO//lhwgyKP6+/YvRhImKYKxBqkiiMWf9JQRfaxx5n1QMzSy
         wafUoGfgG3I6Jpe9+ZhK8p8G/uZZ0YB9kVB/X7of2hDtepZXldKtP+VoJSOVxF1zBbcI
         yXSw==
X-Gm-Message-State: AFqh2krZp0Ku+xLTUDEwS0kdadDGl68ex+E3OPzIVAGg2UAswCBsgOCX
        eHRM23irl9R7mm8/H39oqSw=
X-Google-Smtp-Source: AMrXdXtsW3m/C0JyYf0+fp87e5p0obd9SVw9XWJxmTOVwOOaisMSaR/KjsqZCtAjjfbcrITebQKazg==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id r10-20020a05600c35ca00b003d1f2de195amr42500508wmq.32.1673009041272;
        Fri, 06 Jan 2023 04:44:01 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id s7-20020a1cf207000000b003d98438a43asm1527737wmc.34.2023.01.06.04.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:44:00 -0800 (PST)
Message-ID: <d9d79e2b-61bd-571f-0896-b1ddf2baee6b@kernel.org>
Date:   Fri, 6 Jan 2023 13:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
References: <afdc583c-22c1-b57b-7773-307c84550218@kernel.org>
 <CANiDSCu-1MOwMjh5NioDvNPWUtF_2A1nKf77RZ_OvgeLhLECKA@mail.gmail.com>
 <Y7Z69HKvkFAunqQd@pendragon.ideasonboard.com>
 <5da0eeca-70d6-9933-8408-36b20bbc0d56@kernel.org>
 <CANiDSCt7opKhNoiOEpN-x09hXtY+YEf=i=kvWQCg7b-T5U=6vg@mail.gmail.com>
Content-Language: en-US
From:   Jiri Slaby <jirislaby@kernel.org>
Subject: Re: EasyCAP (534d:0021) not offering native 720x576
In-Reply-To: <CANiDSCt7opKhNoiOEpN-x09hXtY+YEf=i=kvWQCg7b-T5U=6vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 05. 01. 23, 10:27, Ricardo Ribalda wrote:
>>> If plugging an active PAL source to the device before plugging it to the
>>> USB port doesn't help, another option for investigation is to capture
>>> USB traffic under Windows to check what happens there.
>>
>> OK, I can try it. I have win10 virt machine set up. So that should be
>> easy using usbmon. Except I don't know how to read the mon dumps. I
>> should start at Documentation/usb/usbmon.rst, I believe.
> 
> TL/DR:
> modprobe usbmon
> sudo wireshark; select the usbmonX device where your device is attached
> 
> Good luck ;)

This is the last SET CUR (the "Commit" one) Windows do:
Setup Data
     bmRequestType: 0x21
     bRequest: SET CUR (0x01)
     Control Selector: Commit (0x02)
     Interface: 0x01
     Entity: 0x00
     wLength: 26
     Probe/Commit Info
         bmHint: 0x0001, dwFrameInterval
         bFormatIndex: 1
         bFrameIndex: 2
         dwFrameInterval: 400000
         wKeyFrameRate: 0
         wPFrameRate: 0
         wCompQuality: 0
         wCompWindow: 0
         wDelay: 0
         dwMaxVideoFrameSize: 691200
         dwMaxPayloadTransferSize: 3072
     Data Fragment: 01000102801a060000000000000000000000008c0a00000c0000

I assume the Win program only pretends (recodes) as 720x576. In fact -- 
IMO, it grabs only 640x480. 691200 above is 2*720*480 and lsusb says 
"bFrameIndex: 2" is this:

       VideoStreaming Interface Descriptor:
         bLength                            42
         bDescriptorType                    36
         bDescriptorSubtype                  7 (FRAME_MJPEG)
         bFrameIndex                         2
         bmCapabilities                   0x00
           Still image unsupported
         wWidth                            640
         wHeight                           480
         dwMinBitRate                   768000
         dwMaxBitRate                196608000
         dwMaxVideoFrameBufferSize      614400
         dwDefaultFrameInterval         400000
         bFrameIntervalType                  4
         dwFrameInterval( 0)            400000
         dwFrameInterval( 1)            500000
         dwFrameInterval( 2)            666666
         dwFrameInterval( 3)           1000000


Holy crap. Can someone recommend a cheap full PAL device?

FWIW, full pcap of a piece of video grabbed in Win is at:
https://hci.fi.muni.cz/~xslaby/n/av-win.pcap

thanks,
-- 
js

