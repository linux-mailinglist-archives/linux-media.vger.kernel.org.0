Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81EC14A2D31
	for <lists+linux-media@lfdr.de>; Sat, 29 Jan 2022 09:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352564AbiA2Ief (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jan 2022 03:34:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242166AbiA2Iee (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jan 2022 03:34:34 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95DEC061714
        for <linux-media@vger.kernel.org>; Sat, 29 Jan 2022 00:34:34 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id e6so8283660pfc.7
        for <linux-media@vger.kernel.org>; Sat, 29 Jan 2022 00:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=0Z9ktJxpCN4VlCMhyqBmhtQE2OstkHsHOyAL0hGGqN0=;
        b=ihSrlpFNfTA84jnIZD2F5Owo+o7HJ72PI3ag4j2IDoo+XmA4817zRA2aGryxe/07hc
         bcakUvPwIG48GvGHtYyL8dx8uBXFVdbqTZxQkxOkqzr2sq2f3YnKUx4xMkHw2teteyTc
         CeTdrKEQGPbmG75lRMjkHk9L9tq32Qg8L1yPTjL3L6b6ExDSx7hdc3RjDRa0tjEIKgrP
         2nnS5hyaAIhKwXX7xcI67u1Fwy4IIU+ua5r3MPZTUiqj6jQFc5m1MOxNN/Ab1LnZemr4
         uqC9XDz4324HVFbsOc0/F6Z0/LNMpYNvXW9RPzIlb5uPncZJL1Nf2BvIf1BOzPxSdYEo
         Af9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=0Z9ktJxpCN4VlCMhyqBmhtQE2OstkHsHOyAL0hGGqN0=;
        b=tTbElmp1BCPe0jgJrgaiJEVHlK65cTCgjGEUYoQ+I9HwWrxIl3eTE9IEUfMf7LjawR
         c6htwjJuAP7PSbJuI0QseSqCBwdbsSALCaJZhKcZg13IQlX6OQexWf8rLWXtOovemkl2
         BVj5rZTQtt5/qn1tnP1g0mopcoKQUJD9Wt8CSCUAnkFpQtRHZUB9R+3h2IEVY3OB9RR7
         Z1hY+S1uU+nUTENkAmiO79MIykiZ8CpIKIf0D1Y6fVFpnSY4l5FLD3Ihma+A+oB0V+S8
         NPN+rKuQMDF9TzO+/rhQWcWWDvTRnzwvJk/8853AMyMxpNyMyTc4xKVtH0Kiw3dUvfG2
         Wv0g==
X-Gm-Message-State: AOAM530DVxL3Uxsh2/m8JlWyaTcNKZheWZX60Pi0JnKDHIGPeV8LRuv0
        KaV/N2H+kDvt20UyHhNQE9KCzsMVcxjgAA==
X-Google-Smtp-Source: ABdhPJzZNMl2I1eFh/MZEABToLqEAsVl0IyXGnHhtaAMD3KJQoQuUxQVRHHOyiq3RYQiOD/oHh7uuQ==
X-Received: by 2002:a63:f542:: with SMTP id e2mr9542073pgk.381.1643445273971;
        Sat, 29 Jan 2022 00:34:33 -0800 (PST)
Received: from ?IPv6:2409:4053:595:51df:dfeb:160a:9aa5:961? ([2409:4053:595:51df:dfeb:160a:9aa5:961])
        by smtp.gmail.com with ESMTPSA id gx10sm4648842pjb.7.2022.01.29.00.34.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jan 2022 00:34:33 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   Sumit Rana <sumitrana036@gmail.com>
Subject: webcam not found in list
Message-ID: <d082ec38-d9e7-b97e-3a84-c773d363f792@gmail.com>
Date:   Sat, 29 Jan 2022 14:04:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I found device is working on my pc. I'm using archlinux or ubuntu in 
dualboot I think there is no issue with device. If you need more 
information email me.


lsusb output

Bus 001 Device 004: ID 05c8:0311 Cheng Uei Precision Industry Co., Ltd 
(Foxlink)

lsusb -d 05c8:0311 -v | grep "14 Video" output

       bFunctionClass         14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video
       bInterfaceClass        14 Video

Thank You for your support.

