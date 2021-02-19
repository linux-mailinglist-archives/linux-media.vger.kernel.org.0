Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F159231F560
	for <lists+linux-media@lfdr.de>; Fri, 19 Feb 2021 08:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhBSHdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Feb 2021 02:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhBSHdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Feb 2021 02:33:51 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71729C061574
        for <linux-media@vger.kernel.org>; Thu, 18 Feb 2021 23:33:11 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id o7so3209499pgl.1
        for <linux-media@vger.kernel.org>; Thu, 18 Feb 2021 23:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=Tqte7oYMBTXiQMfoq9XswmEoJ3laET79y8vCsP5iY4k=;
        b=gYDgtNfUQgk/+zGfkmgaDzF+6TGIBeh9I4f+7zI6k1HhKh1anTZh3oEGoMw46Qp4MN
         bNlpxSZZYFJJB+Z8jm6ATElhE/37jzZMYI8RckkobVwDXmjebEwzPfn0DIokc+RCJ9up
         aw39QIunD641e9lFVfs5BgwfeE5IeGFxohmTRgudnbdsxxAHnPNAqavlSAg7Mg2CRvQi
         BhXx/OXPPrt/lqsfgQbcQtSDpuNgSavvzGlMKNOnoAWMV2kMWJhOI4tH1E6s7aPswb6F
         P9I2ooo8QDap1Vplrqsejx8ZV6Wrf9s8hgsN0KuhdwHO9TcvarXP5sJOmgFITN4QnM3w
         w8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=Tqte7oYMBTXiQMfoq9XswmEoJ3laET79y8vCsP5iY4k=;
        b=UtmfJNeG5Z6NELqdHn56A5Q+geG8Z9k3xyCaQum5po0Q+/BUM1dG9nsBshPmrw6han
         GOfICUgmbDE1BrRnPiQoaFkKU56F+bMcS2uMRV/prOGEyd/noAzaku7aLYVNqvFC02dM
         LwyGD574mwQPEkaLCiVsSlp50Tn7b7chcoHPtCFVYIqJhUQVLZjBT5dc5Fa4RK76DXiK
         a3VkAn7CynvC1jfs5jgzudAWWhSp98q4GYVW/1w8R/5lVLJWBZcT27RoAQNhqR/MiyZo
         EuK382MijTT8LlkjQG5lD++RHKY4glgDBuYDmFZe2XelBi2465f1ADLHfEe8O0Le7RAK
         dppA==
X-Gm-Message-State: AOAM531sw+pvoktPVftmB5EN1nfKticdGOHLzjOyQkAxfNwnLXtBz5ON
        73a7GQ/iuvDwRHtdWJdvZ7SI1qEtmZA=
X-Google-Smtp-Source: ABdhPJx1eFLhAmGwCtOMdQYxSHfuLOGPxev2XqLzPFuzMjTwvJITfVJT3jO4z8jfVmhLrxG1PuC2BQ==
X-Received: by 2002:a63:1354:: with SMTP id 20mr7444140pgt.21.1613719990486;
        Thu, 18 Feb 2021 23:33:10 -0800 (PST)
Received: from [192.168.1.7] ([199.36.253.174])
        by smtp.gmail.com with ESMTPSA id s18sm7194331pjr.14.2021.02.18.23.33.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 23:33:09 -0800 (PST)
Message-ID: <43e1dd699a37c197af4cb14919d2fa41b9c3cbab.camel@gmail.com>
Subject: Elgato Cam Link 4K
From:   glen <glenjo@gmail.com>
To:     linux-media@vger.kernel.org
Date:   Thu, 18 Feb 2021 23:33:08 -0800
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All,

I recently picked up an Elgato Cam Link 4K.  I have done limited use testing, but it seems to work.
I'm using Archlinux, running kernel 5.10.16:


Feb 18 23:23:59 honcho kernel: usb 4-4: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
Feb 18 23:23:59 honcho kernel: usb 4-4: LPM exit latency is zeroed, disabling LPM.
Feb 18 23:23:59 honcho kernel: usb 4-4: New USB device found, idVendor=0fd9, idProduct=0066,
bcdDevice= 0.00
Feb 18 23:23:59 honcho kernel: usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=4
Feb 18 23:23:59 honcho kernel: usb 4-4: Product: Cam Link 4K
Feb 18 23:23:59 honcho kernel: usb 4-4: Manufacturer: Elgato
Feb 18 23:23:59 honcho kernel: usb 4-4: SerialNumber: 00053D88CC000
Feb 18 23:23:59 honcho kernel: hid-generic 0003:0FD9:0066.0006: hiddev97,hidraw5: USB HID v1.01
Device [Elgato Cam Link 4K] on usb-0000:07:00.1-4/input2

You definitely have to be careful to ensure that you're plugging in and getting it to show up as a
Superspeed device.  I had the device show up as USB 2.0 if I went through a hub.  

It seems to work fine with the limited amount of testing I was able to perform since I was only
using it to stream from Nikon D300s and D700 cameras.  It only functions properly if I have have the
cameras not set to AUTO for HDMI output.  I have the cameras set to 720p and this works well.  I
have used them with OBS Studio and VLC. Good job!

If there is any testing you would like me to do - send a reply and I'll get it done!

Thanks,

Glen

