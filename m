Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE92726782E
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 08:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgILGTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 02:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgILGTf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 02:19:35 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2D8C061573
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 23:19:35 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id y6so1924126plt.9
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 23:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=O+jkf/ysAqyDWr/bejv6k/ru/CqrcTIT1ZilhOAcnAM=;
        b=K3dxI7QZvjIEghHMwYqtUNcwMt0PvN8ZCbjliRGYMBoxb6dBlDYE1TAs+jSMW1FEmE
         E5qxuM/liGr2WRdid6ij9kdAYZJy22VHaFq476V9CiFCgWs5UggJWdRz4DF5a8QkviOf
         Dl/PqwdTCBBB5eIFPFXPHCIoDkGHEy87QClgr0N85kR7sOF3hs5Rve0QjoOzwEtOB+dC
         ddMddnyXs+5++P4/TwHI8En6y90rQwfdMTTP4hA/y7oID28ePI0/aYH0mHyazKAxmycy
         lRRHyb0eRXSHDxdmqMErYrnvL3z/NgoaElffW3edJv6q0HxbG6FxGnlT33D4oOxg/MqL
         RhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=O+jkf/ysAqyDWr/bejv6k/ru/CqrcTIT1ZilhOAcnAM=;
        b=aQZ0sO/qIIlkY9MBXx/XTvmBjDrAJom7crC1u6qv4AurBRRRzBMfzNQ1kFXCNWhV2T
         Ft+mu08wJ2bXL7qgVgZrDBt2pbeZFRr/LaS1jsjTwTIPKwj5U7tA34ZRN48b1QzLA3iO
         MEw/4WdLl1gazP65bhdw5aloljdsKRTUG+AJrTpz5JMRpX4k3w78MmIwv7sN1Vg9gt9a
         wlfhfYExelGC8DAHVECb/p1IEW+9fCU1eO8VaW+eEW7J1/Epj9mssyKfOtFjeWLphwez
         8IhNkumgEeZPZjiUvSvElrTYhGG0M3HEU/0hZi0RedkrBq8DEWq/idyNN+QXIYmmRlY3
         JeRg==
X-Gm-Message-State: AOAM531e6D5WE3yvjjCOvSt2MS9hk9sU/wLdV8f9LrAueGewHaahFscg
        7j4nGKqcxxTNYE+iAqiOS3rwH7L21QL3pExleLs=
X-Google-Smtp-Source: ABdhPJzjzmuPplxo2gr37WV61WRBtqVmpuMlGcfNdZjLqoEcSwqDFg+bsokcTSP5Hnv13IEPtPmCIQ==
X-Received: by 2002:a17:902:b718:b029:d0:92cc:a449 with SMTP id d24-20020a170902b718b02900d092cca449mr5475481pls.9.1599891568219;
        Fri, 11 Sep 2020 23:19:28 -0700 (PDT)
Received: from [10.5.18.26] ([103.2.198.70])
        by smtp.gmail.com with ESMTPSA id m13sm3380917pjl.45.2020.09.11.23.19.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 23:19:27 -0700 (PDT)
To:     linux-media@vger.kernel.org
From:   Garry <knobbage58@gmail.com>
Subject: Startup error message
Message-ID: <6bcd6d6a-ed7a-f814-d804-3e72f5a8ee61@gmail.com>
Date:   Sat, 12 Sep 2020 16:19:24 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Desktop is running Linux Mint 20, Kernel 5.4.0-472009090909 and when 
starting the computer it shows this error before getting to the login 
screen.

WARNING: You are using an experimental version of the media stack.
     As the driver is backported to an older kernel, it doesn't offer
     enough quality for its usage in production.
     Use it with care.
Latest git patches (needed if you report a bug to 
linux-media@vger.kernel.org):
     6f01dfb760c027d5dd6199d91ee9599f2676b5c6 media: cros-ec-cec: do not 
bail on device_init_wakeup failure
     0f879bab72f47e8ba2421a984e7acfa763d3e84e media: rockchip: rga: Only 
set output CSC mode for RGB input
     ded874ece29d3fe2abd3775810a06056067eb68c media: rockchip: rga: 
Introduce color fmt macros and refactor CSC mode logic

Can you assist by telling me what this relates to and what I can do to 
fix this.

Any assistance would be great.

Regards

Garry

