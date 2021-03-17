Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791CC33F38F
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 15:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhCQOmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 10:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbhCQOlz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 10:41:55 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A96BC06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 07:41:55 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id v3so1704195ilj.12
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 07:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CqZq6sfvF60QWpdBkGXpgLa6vaWXsbkk8QzAc+CIlmU=;
        b=kPGjKvcDheqsMF2UBj7etqIzfn80A5dCkK6ENejJdjBMQSyVtQELLXwfAWazoY0oWD
         zg551kRiIAZiYJeNwPuiJodeSpUlSwkmn+EbjXAwr76SzX9loNxbA4gS/e9lxxkRZU0C
         E+In4EzoMC2Ac9qFmX/452LO4F4CFAH8aTgUNhYVS3AnXU6IbXiGrdu4WHWCBzLXCtM9
         P7eY5Ei6UoccDto6BfQjq/NU01LCtFi2t2tuIJhDIP/Yrz7S4htcQDLk+XGyPiapCoF6
         RwyfxzJkkMiQPXyjl+eaIzpbm/eTWI0prqD+Ur3IZTZjb4YysD/QeYwkVZTNETJm8wX5
         5Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CqZq6sfvF60QWpdBkGXpgLa6vaWXsbkk8QzAc+CIlmU=;
        b=kOR73DCtwxTRb/WucfoIMZedoI0dn8kDV6YugmM2rAG6LqS2ozMP9ZGd61GQF6VeH9
         BteKo96NIxLlHhOA/7r7XySbcU6QwBHh1RGEt8n65Ha2Gm6zB5Y9yTrn3wXx3SHJw61W
         lp9BQZXsZYeWf+gZrAhy3PSLCmgkCMXaisiQwYhdBDbDxrbkc3N9mep9hFf3fUhoVDH/
         kyHchQH12lrbWg1jtbM4FAQHytMNYStoTO6WqoJSDKGCROx7Gb2HWLXytGfoqbOjj8F2
         dfXKSZ5sWZjY1Mg3rMB0NOqaqaYnXFuSvgAMazH6J0QZv3RO7WTx2E0t37SAWqGDWJZx
         90TQ==
X-Gm-Message-State: AOAM5329dnnUFCv1HeTYHfBl+Yn/aEvUqjeYkRt3i+3TYsnlfHRCM3am
        jxoJtqs4f2nhXCBUGxnPyjmRrqEhr9AGIJ30V3/32aNOhQ/R7Q==
X-Google-Smtp-Source: ABdhPJxMcDSP9XQ5PzN1G8jVZVgsWT5y1O0vA7prg8+V+AeBIpOmgDvMjZcGXj1M8ia3UYramTH7Oxk4blTg9PaKdyY=
X-Received: by 2002:a05:6e02:20ee:: with SMTP id q14mr1544551ilv.223.1615992114347;
 Wed, 17 Mar 2021 07:41:54 -0700 (PDT)
MIME-Version: 1.0
From:   Nikolaos Beredimas <beredim@gmail.com>
Date:   Wed, 17 Mar 2021 16:41:15 +0200
Message-ID: <CAMbLOeCCwrfoGvaV4vWPfF7tHnE-b4sFUNmK8v=ekRZAtjA-4w@mail.gmail.com>
Subject: Revisiting ITE8708 on ASUS PN50 uses a 16 byte io region
To:     linux-media@vger.kernel.org
Cc:     sean@mess.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
There was a thread on this list last September
https://www.spinics.net/lists/linux-media/msg177724.html
about the IR module on the ASUS PN50.

Even though that discussion never fully resolved,
it did contain the solution to get the IR working on the PN50.
I have documented this at
https://forum.libreelec.tv/thread/23145-asus-pn50-challenge/?postID=152207#post152207

So, what I had to do is edit a single line of drivers/media/rc/ite-cir.h
and change IT8708_IOREG_LENGTH 0x08 to IT8708_IOREG_LENGTH 0x10
and the IR module is now recognized and working

How do I go about submitting this as a patch?
I am a little overwhelmed honestly.
Do I follow https://www.linuxtv.org/wiki/index.php/Development:_How_to_submit_patches
?
And which git tree?

--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -406,7 +406,7 @@
 #define IT8708_C0WCR 0x06 /* wakeup code read/write register */
 #define IT8708_C0WPS 0x07 /* wakeup power control/status register */

-#define IT8708_IOREG_LENGTH 0x08 /* length of register file */
+#define IT8708_IOREG_LENGTH 0x10 /* length of register file */

 /* two more registers that are defined in the hacked driver, but can't be
  * found in the data sheets; no idea what they are or how they are accessed,
