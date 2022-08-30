Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DAB5A64DA
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 15:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiH3NeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 09:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbiH3NeC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 09:34:02 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20306EF004
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 06:34:00 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id f14so8392747qkm.0
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=y6vy91wVq0pottsc/WUdpWcgOiqyVzvfWliQSe6CSZE=;
        b=Trq6Kq+M/dwTO6USz7QGTJ9kHvmm7g85ZTGkYqntxEw523oL+EW1jeWviwILTZuKjI
         sLnwJEv2XFrPymkTLtqOUkQjnH4YSEA+OD8rgiqSyIW3lhZm7o98I0gjmDL5l3Qur5yf
         8lqF6Ib/HOoXDF/eR4EDSYHJHkmGFRpC698QF827wNE/F9LGs9i/j8zUcgseclEzGfIK
         UzYgDtRAOQFU6PCQpqsmTsVFwrP0LwMoWEpbZYfuB4vb6hQSGYPb/0QFi76zkUQllRf1
         M/De73rUBkAuM2mm5y8F9ImoBpaAPIgcUjI3C+53Jw5UyehMVfmu+Zv4sjQqnY5VUMlA
         1xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=y6vy91wVq0pottsc/WUdpWcgOiqyVzvfWliQSe6CSZE=;
        b=AqFc4J/Z0yiazcb69XEvMfD4uWBQJkh0Zjns7ky3c8pWcGSCFQJ6MOOeyrd4AHR7a4
         te7ecGTWXU0nHF1qBtEPlT03MtUyjyFVThntkf8vCwxImxP8Y1dhAKCyM4RxOrqeNTbc
         bj+UEu64ljwWGBL7raDBr/EcMsf9XniWo1qpP/yzUfuOnGFqTzq6XJKWYtG3ZAmjJfVA
         0+dfkzLHmNILnFk1YCncCYluIHlRw3A6z1O15RLMQVDutMvKqgnN3ttbbEGOjomsyw3r
         1yPA0bo+Dk8Vj/Zu6t3bT+s0QSfT+NVZo1LInBLHlIIBx19BL9ZcD2G2hgyMGE4Je00h
         hUjQ==
X-Gm-Message-State: ACgBeo1MpGXnl+9/ixpQlUosmJiesnzLVa55vybutGGeksRTr1f1nyKM
        kHWHHY2mOwxXnQElGWziCXORZApw7jE=
X-Google-Smtp-Source: AA6agR531mxV/RzFp3DyraR2VSKHbOrPUGC1zl9SfjIyLpZbbDOU1mMJQqLgDsrDQI25n6tPml905Q==
X-Received: by 2002:a05:620a:2482:b0:6bb:9825:4c3e with SMTP id i2-20020a05620a248200b006bb98254c3emr11871640qkn.458.1661866438701;
        Tue, 30 Aug 2022 06:33:58 -0700 (PDT)
Received: from [192.168.1.103] (c-73-165-23-36.hsd1.pa.comcast.net. [73.165.23.36])
        by smtp.gmail.com with ESMTPSA id n20-20020a05622a041400b003450358fe82sm6316184qtx.76.2022.08.30.06.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 06:33:58 -0700 (PDT)
Message-ID: <a1af00d2-b997-00c1-dc9f-efef1306c3f4@gmail.com>
Date:   Tue, 30 Aug 2022 09:33:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: No Sound from EM2861 Device
Content-Language: en-US
From:   Rich Sahlender <rsahlender@gmail.com>
To:     linux-media@vger.kernel.org
References: <35680d5e-26f0-04f7-15bd-3be3317ffec3@gmail.com>
In-Reply-To: <35680d5e-26f0-04f7-15bd-3be3317ffec3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Is this not the correct place to ask? Did I perhaps not provide 
sufficient detail?

The EM28xx card list at kernel.org seems to imply that this device 
should work however the list at linuxtv.org seems to imply that it is 
not yet validated upstream and that one should send detail to this list 
for assistance.

Should I be asking elsewhere?

Thanks.

On 8/25/22 10:43, Rich Sahlender wrote:
> Hello - I have a USB capture device from ClearClick. This device has 
> both analog and s-video connections and lsusb shows the device as:
>
> Bus 002 Device 004: ID eb1a:2861 eMPIA Technology, Inc. EasyCAP DC60+ 
> [EM2861]
>
> Using the Qt V4L2 Test Bench utility and selecting this device and 
> setting NTSC as the standard the video looks good from a DVD player 
> but there is no sound. In the User Controls tab of the test bench 
> utility I found the mute box was checked by default. When I uncheck 
> the mute box and restart there is still no sound regardless if using 
> the analog connections or the s-video connection.
>
> The playback tab in the alsa mixer shows 100% for ALSA plug-in 
> [qv4l2]. The input devices tab shows EasyCAP DC60+ [EM2861] Digital 
> Stereo (IEC958) at 100% and Port for this shows Digital Input (S/PDIF) 
> with no other choices.
>
> I have read that many other EM28xx devices work well but perhaps there 
> is something different about this one from ClearClick or I have just 
> not set things up properly yet? Any suggestions on how to troubleshoot 
> further?
>
> Thanks.
>
> Rich
>
