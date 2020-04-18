Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF0E1AEECF
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 16:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgDROjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Apr 2020 10:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726398AbgDROjb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Apr 2020 10:39:31 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C59BC061A0F
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 07:39:29 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g12so6019919wmh.3
        for <linux-media@vger.kernel.org>; Sat, 18 Apr 2020 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=/XM7D8/7XhwSvcHIYzl1pU1WBQ38qKEnXn4Q45Zjmjs=;
        b=ULmZfJo9mapZTe+vhjOkTNiElb3rH6q3Ti/y51lN9Dg4r6WAwOjbDXXG9ja63eJ2/O
         1TT0DGFLa3sSFYcJBPfrzFlNFETbjV/w0oGLrMcc1R2uRKiJrvDOFy3zqEzrp3VTDK1y
         VuR4hC2aSdTAASi7Dh3QsdLdj08UL04xprxEkDBr/SNy/OUDFEFBrEWwQ5JwvXkopGu4
         SEG+xlZ1vm6L8//p+ctPbLJD2j8hcmivyB8SRVGVNTD9i0mLpbxhLWtN8wAeXzqbU31E
         9AVdAGR89IwkRw8yyDXmVi2KGeiYSpLgb8Hi9utJpAi3QHowpfzPvLSROifyBzk2jWIt
         m3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=/XM7D8/7XhwSvcHIYzl1pU1WBQ38qKEnXn4Q45Zjmjs=;
        b=dJUe9qUPE4nwpRqXUAbP344A3i5Q/0lh24hMSYC8iboFEWvBqQHS9vt389pOB9aS9r
         iLtKUQY9KuJY6MYChMMIAAf1EyE6IeKhvyN/julXHhJWTIGCp7Tw+fgjRFiOrxVzsWXo
         tXD8YJUf8cqUQ1SdxX7oupSggDSfBQaPaXb+bVtOTyqmsqILB6FZzr1Wbl4CeLb/2zko
         MRiQGmolFkVLgY1kPvGpbK+nWZq8p+qVYbA2lKy4w62XdIxVbSYVE9KbfgnXpS9z/z4+
         SHm+Q89zpEFDiL/Ag+9aOy3uxMamrOZ6eAfXv9Yx+FtkgqC1trVHYwwse2VDrlA5MIwc
         agCA==
X-Gm-Message-State: AGi0PuauxjGaoEDLQqYmvIP36nbcjCiNoDNrUj4d5dU2kWbIa86+jNul
        KMyd3b1t4wUT35Y/QT0zgMG6L1FeeB4=
X-Google-Smtp-Source: APiQypJw7V6hQ0tykrXuW3Q4f5rmR+bLZQb9kbT3TtFrj5idEat4ROr+8IBEpD8yc6TBLRjsV+Vxfg==
X-Received: by 2002:a7b:c456:: with SMTP id l22mr8202691wmi.148.1587220767851;
        Sat, 18 Apr 2020 07:39:27 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id r17sm25118628wrn.43.2020.04.18.07.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2020 07:39:26 -0700 (PDT)
To:     linux-media@vger.kernel.org, mchehab@kernel.org
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: atomisp kernel driver(s)
Message-ID: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
Date:   Sat, 18 Apr 2020 16:39:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro et al,

I've recently switched to Linux, and I'm very impressed. Almost 
everything thing works out of the box. Only the webcam on my device does 
not. I did some digging and if I'm right an atomisp driver would be 
required. Is this correct? Below the output of lspci:

00:00.0 Host bridge: Intel Corporation Atom/Celeron/Pentium Processor 
x5-E8000/J3xxx/N3xxx Series SoC Transaction Register (rev 36) 00:02.0 
VGA compatible controller: Intel Corporation Atom/Celeron/Pentium 
Processor x5-E8000/J3xxx/N3xxx Integrated Graphics Controller (rev 36) 
00:03.0 Multimedia controller: Intel Corporation Atom/Celeron/Pentium 
Processor x5-E8000/J3xxx/N3xxx Series Imaging Unit (rev 36) 00:0a.0 
Non-VGA unclassified device: Intel Corporation Device 22d8 (rev 36) 
00:0b.0 Signal processing controller: Intel Corporation 
Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Power 
Management Controller (rev 36) 00:14.0 USB controller: Intel Corporation 
Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series USB xHCI 
Controller (rev 36) 00:1a.0 Encryption controller: Intel Corporation 
Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series Trusted 
Execution Engine (rev 36) 00:1c.0 PCI bridge: Intel Corporation 
Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCI Express 
Port #1 (rev 36) 00:1f.0 ISA bridge: Intel Corporation 
Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series PCU (rev 36) 
01:00.0 Network controller: Qualcomm Atheros QCA9377 802.11ac Wireless 
Network Adapter (rev 31)

According to the history it looks like the driver was removed from the 
kernel in 2018 and replaced with a dummy driver (to make sure power save 
works).

Is there a chance that the atomisp driver will return to the kernel? 
There are quite a few older tablets and 2in1 devices that would benefit. 
Unfortunately I do not understand the removed code (my coding skills are 
very basic) and can thus not help to change what ever is necessary to 
make it fit for the kernel :-( (does not sound like a beginner project). 
However - I would be glad to help out to help testing an ISP driver.

However - even without the cam it is a very impressing operating system 
which I enjoy very much. I would like to thank all of you for your work 
that benefits so many people!

All the best and stay healthy.

With kind regards,

Patrik Gfeller <patrik.gfeller@gmail.com>

