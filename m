Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A057D63D6A7
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 14:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbiK3N1Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 08:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiK3N1X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 08:27:23 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778E752892
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 05:27:22 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id td2so27201472ejc.5
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 05:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8Xn6LJgqOaqUOJvllVtK/7z29XiCe20Dq6u22yxPjQ=;
        b=nIlLNsFVVrChv7MrUKC9WwWw77ybqE2eGNqbYLthladtysQ30QWvG7BIWTBEz0Mjht
         ogzHaSaNuClU2Ibn2xL5swhlcQP4rWDKdkI/zIXmiCD0CNzt6zqfEEQ6i4stVlzJhZKN
         XmTXc6f8EeRPiMtIat7I6Lv4FSC70LguP+tf5yLVRO/Slkb9eyx1BcY+mzid/tsTyqZa
         h1I/D/b6yN+gNm2KT6tzRWV7Z+0c1W/BiVyqxtDKsFXfLJ1z+bJYqinqwOyv4WZe1pfr
         wcNborP3h88szIpG3a5WooCIl+2iWTBIShv6uq4S9/+Rxls8sNtFuMRcS3GpsXM9w5NA
         whfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y8Xn6LJgqOaqUOJvllVtK/7z29XiCe20Dq6u22yxPjQ=;
        b=XaHB58IJyUBxNprQsll26N8XCs0+oE26XPyQZB4NuW67KROKrkFbsDQDKODZvds4lX
         UOptQw8Dly0BD4zrTZWpMRj5xyyAM/Gq+lGk4q1XN2UVItWi9Sga0/2Na+mNyLfW6bfL
         /ptqaNKdFA0hDudATQpbgcInJXTW4pmUf/geWrZ6+b0Wv8aydNv2nOQvpZoNqt6e4voi
         c4xE+8YoS1NXl2OURBxe7aDPfbdKm6Iq12dEALpHpC7mThftV0OTP3Jbwn+iJeI5ozBQ
         Grg0nGBJIDQ4/z8Rla8LZQoscysJ/yeStd5yOILcJ85feBnjQ9mJYSWu3Zu1Nsv92uS+
         APVA==
X-Gm-Message-State: ANoB5pm0qYgiKreHWiUddgZxzpIo0n++LEJ60fqCJ3q8slwau9djNIZk
        RhcSuqyHs4MHLSUw5ATey/ptxjKuARA=
X-Google-Smtp-Source: AA0mqf77sSdn6lOMrC1lwiXKvp2UbVJF9ipgrNQJLD/mm6/QCbqBbHyimOq/PQhs312yNAZ5MlRwrw==
X-Received: by 2002:a17:907:b689:b0:78c:f5a1:86bf with SMTP id vm9-20020a170907b68900b0078cf5a186bfmr26797557ejc.245.1669814841033;
        Wed, 30 Nov 2022 05:27:21 -0800 (PST)
Received: from [192.168.178.36] (p54a626b1.dip0.t-ipconnect.de. [84.166.38.177])
        by smtp.gmail.com with ESMTPSA id s17-20020a05640217d100b004585eba4baesm618682edy.80.2022.11.30.05.27.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 05:27:20 -0800 (PST)
Message-ID: <d0a24a46-8906-3839-8285-9b356741f684@gmail.com>
Date:   Wed, 30 Nov 2022 14:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: de-DE
To:     linux-media@vger.kernel.org
From:   "Ben K." <kuchenohnegraeten@gmail.com>
Subject: not listed but supported device: Creative Live! Cam Sync 1080p V2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tested on ubuntu 22.04 with Microsoft-Teams (native app and web app in 
chromium) and with Cheese:

$ v4l2-ctl -D
Driver Info:
     Driver name      : uvcvideo
     Card type        : Creative Live! Cam Sync 1080p V
     Bus info         : usb-0000:0a:00.3-2
     Driver version   : 5.15.64
     Capabilities     : 0x84a00001
         Video Capture
         Metadata Capture
         Streaming
         Extended Pix Format
         Device Capabilities
     Device Caps      : 0x04200001
         Video Capture
         Streaming
         Extended Pix Format
Media Driver Info:
     Driver name      : uvcvideo
     Model            : Creative Live! Cam Sync 1080p V
     Serial           : Creative Live! Cam Sync 1080p V2 Audio
     Bus info         : usb-0000:0a:00.3-2
     Media version    : 5.15.64
     Hardware revision: 0x00000100 (256)
     Driver version   : 5.15.64
Interface Info:
     ID               : 0x03000002
     Type             : V4L Video
Entity Info:
     ID               : 0x00000001 (1)
     Name             : Creative Live! Cam Sync 1080p V
     Function         : V4L2 I/O
     Flags            : default
     Pad 0x01000007   : 0: Sink
       Link 0x02000010: from remote pad 0x100000a of entity 'Processing 
2' (Video Pixel Formatter): Data, Enabled, Immutable


Output from lsusb:
Bus 005 Device 002: ID 041e:40a0 Creative Technology, Ltd Creative Live! 
Cam Sync 1080p V2
