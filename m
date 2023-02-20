Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1300769CFC8
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 15:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjBTO7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 09:59:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbjBTO7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 09:59:47 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F271DB9F
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 06:59:39 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id b20so734037vsu.5
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 06:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676905178;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2EAsGyZAvm6u7RebXhNM4OstmhJzau/0diJUFrUURCA=;
        b=knB3hT1duc1MTs0iknQypTc/pO26udEf2033nsquaRLESS+79t7qjfrPeuZQCT0Tej
         OtmuoZ2rrXAdEnOnl2vDvoXC+zg6VaaDyz/awt8YVx3OjJRiep5hg1yUbdm0KYKyvgLn
         DEhG/sTtb34ObEyUdnystXBdAJrThhvXHkk1SEpQz6LrvU4LZlaY+ArBNpujE0ZrTxdE
         Fm0B9Kk6NEgTBf2+1gx68vxEmoBLNFVqERhiM7l7nUvsfucnqIP7K7bGsfv8Abh2ZEf6
         vhi6oOpmIUvgZ44Ml+53uK91yJfoh2mANts9s7Evo5k2yvc/WM87/aAhMLTRvJnQtfW/
         e+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676905178;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EAsGyZAvm6u7RebXhNM4OstmhJzau/0diJUFrUURCA=;
        b=ZdCSaFLOLT9HXRod+jIBCYKLCEHjyT65OGA852A7Ln0ep6utCN2sB84lMn51Y3obL2
         o9tXqouoFOt9vtPuLtS6T4E//3Es9Z6rPc+7R7RwOrr7DsiXN9kRI9A534ovyiuhZFGe
         rzh0wih6svhfqY+pmvuC/LyPnt70dtGikciiAJNZqwjLxaLsBsb9MRz8cOSqZREKSv+s
         Gd+AgERCd31o8QtEUe15qMbiPT3EI2TrX6+jeVNBQY0t4gstTBQL+M/Q89T0Ade2PzgD
         RmQSED70aXDKAnTOAD9I84ygYstSI+U9MAPv3ek1nCOzuj/YAr+oytfwPsYW73Zv2J1x
         GAtg==
X-Gm-Message-State: AO0yUKV4UF0S+03/CdGzJfOytoG0NFh10oL0mJhQKaDFak6PmIvmYOa5
        RfjVjpENLDoucbM1jyaHpMTxfa2BagSgGDoUXCuc5C9g6uXkMmtX
X-Google-Smtp-Source: AK7set+++EUPmQLlCLmCPgXUxyzMvrtxfaiJJYKJlRr3HPWDYe4wgU5/IM0rTx3xz15k0zKKoKU/sN8+67Fmz+ZO2Vs=
X-Received: by 2002:a67:d61e:0:b0:414:4aab:3c73 with SMTP id
 n30-20020a67d61e000000b004144aab3c73mr192421vsj.71.1676905178358; Mon, 20 Feb
 2023 06:59:38 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 20 Feb 2023 20:29:27 +0530
Message-ID: <CA+G9fYs4JsmNxX4+W=wijfSPdDsOy=SWLBSitZper5ncPpdxqA@mail.gmail.com>
Subject: arm64: libgpiod: refcount_t: underflow; use-after-free.
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>, warthog618@gmail.com,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Following kernel warning notices on qemu-arm64, qemu-arm and also on devices
running Linux version v6.2.0 while running libgpiod tests.

+ ./gpiod.sh /opt/libgpiod/bin/
  [INFO]    libgpiod test suite
  [INFO]    117 tests registered
  [INFO]    checking the linux kernel version
  [INFO]    kernel release is v6.2.0 - ok to run tests
  [INFO]    using gpio-tools from '/usr/bin'
[   10.499036] ------------[ cut here ]------------
[   10.499656] refcount_t: underflow; use-after-free.
[   10.500264] WARNING: CPU: 2 PID: 291 at lib/refcount.c:28
refcount_warn_saturate+0xf4/0x144
[   10.501306] Modules linked in: gpio_mockup(-) cfg80211 bluetooth
rfkill crct10dif_ce fuse drm
[   10.502364] CPU: 2 PID: 291 Comm: gpiod-test Not tainted 6.2.0 #1
[   10.503229] Hardware name: linux,dummy-virt (DT)
[   10.503883] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   10.505331] pc : refcount_warn_saturate+0xf4/0x144
[   10.505723] lr : refcount_warn_saturate+0xf4/0x144
[   10.506115] sp : ffff800008983cd0
[   10.506391] x29: ffff800008983cd0 x28: ffff0000c4c4c100 x27: 0000000000000000
[   10.506961] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[   10.507533] x23: 0000000000000200 x22: ffff0000c4e66800 x21: ffff0000c7734640
[   10.508104] x20: 0000000000000001 x19: ffff0000c7734600 x18: ffffffffffffffff
[   10.508677] x17: 3d4d455453595342 x16: ffffcf0234432020 x15: ffff800088983957
[   10.509424] x14: 0000000000000000 x13: 2e656572662d7265 x12: 7466612d65737520
[   10.510003] x11: 3b776f6c66726564 x10: ffffcf02365db580 x9 : ffffcf0233b20138
[   10.510575] x8 : 00000000ffffefff x7 : ffffcf02365db580 x6 : 0000000000000001
[   10.511145] x5 : ffffcf023655f000 x4 : ffffcf023655f2e8 x3 : 0000000000000000
[   10.511721] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c4c4c100
[   10.512294] Call trace:
[   10.512494]  refcount_warn_saturate+0xf4/0x144
[   10.512971]  kobject_put+0x164/0x220
[   10.513224]  fwnode_remove_software_node+0x44/0x60
[   10.513554]  gpio_mockup_unregister_pdevs+0x54/0x70 [gpio_mockup]
[   10.513970]  gpio_mockup_exit+0x10/0x328 [gpio_mockup]
[   10.514322]  __arm64_sys_delete_module+0x190/0x2a0
[   10.514653]  invoke_syscall+0x50/0x120
[   10.514915]  el0_svc_common.constprop.0+0x104/0x124
[   10.515277]  do_el0_svc+0x44/0xcc
[   10.515541]  el0_svc+0x30/0x94
[   10.515788]  el0t_64_sync_handler+0xbc/0x13c
[   10.516126]  el0t_64_sync+0x190/0x194
[   10.516419] ---[ end trace 0000000000000000 ]---


Build and test logs,
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2/testrun/14856342/suite/libgpiod/test/ctxless-get-value-single-line/log
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.2/testrun/14856342/suite/libgpiod/tests/


--
Linaro LKFT
https://lkft.linaro.org
