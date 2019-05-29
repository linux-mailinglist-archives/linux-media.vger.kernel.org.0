Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B240C2DF8E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 16:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfE2OVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 10:21:40 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:37562 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbfE2OVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 10:21:40 -0400
Received: by mail-wm1-f46.google.com with SMTP id 7so1750385wmo.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BkPD20+R6tVba14Z18wEnrIbV8NRX5RIOD8JsONMYWk=;
        b=eVmKtFwvDosWJ3UunUJ95nUzc6pKrS8dB55z6JysChIC6WiEfJ01ztqddPIJTZMkcB
         iE+YYpzWtWG6W/MHi56LtSzwjqnitNsnIoDrv6whpYtxo1PxyVpBi/WXSiIg/F6XSZED
         ZiLJTI6hErlM7g2aihZuv6YP0AS7rrs/as9KHwYPyMN8F5URO+bYUiHD3bh/ErOz6x7B
         bhF8jPll5h6JxeXtEMk4x4BNmA5XbXvfCKFsAsF5WJcvWh8tu7V9Nelaxw3UmJ95MxXi
         9j31/zWyTV8HZBrZXHApsLH8uYErxrSx1lHkP//8l7ReA3Idt+U2F8vxnpSr4z29f7d1
         K9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BkPD20+R6tVba14Z18wEnrIbV8NRX5RIOD8JsONMYWk=;
        b=mvaBzwinIoatz0ThnCmXMQBw91SRLioOS12/HrB4PGjZXrxZ/un0dPgj9Hv7bZ9z2n
         gqKpWslbomftZ+27W4P9t+gSZlpafYL35EkL/sfgPDo1XhEP5nqLLcn8nr88otsgDL2V
         aKemANFub5kNByIFhXe8ShUEXhr9GsRaKTMNc25Ffe1rvGouwwBqm06n9zIqzqd70sUH
         wFYJHrt82zPbK/zIkQGeqpcJ9xjG5dgd1spWHjgE4MXXxt2HUYcUA/bPEhv3wfAeb4Wr
         /0F7YmBEqj5ERhxyMWUgsAOzOrYcYFaXVImzThwltsbRzr+3SNS+9bkKyVskeZOvF6nB
         pMSA==
X-Gm-Message-State: APjAAAUFaUnQLuTTMVsRd8vFqtaQacZde6TPwYBLdD6f4NlCA1xj01eQ
        x4IQ5G7bxZxI0am3cNateT1UruVWq0WQ2Q==
X-Google-Smtp-Source: APXvYqxFQ7flzNSRJahX+8XF5dJk//6JjggcqXkec+JbimJuzWzQZVvg75SLPIpeQO0omLNw6v9Smw==
X-Received: by 2002:a7b:cb94:: with SMTP id m20mr2963628wmi.144.1559139697915;
        Wed, 29 May 2019 07:21:37 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d17sm17150144wrx.9.2019.05.29.07.21.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 07:21:36 -0700 (PDT)
Message-ID: <5cee9570.1c69fb81.82c85.f77e@mx.google.com>
Date:   Wed, 29 May 2019 07:21:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-121-g878344de61d0
Subject: media/master v4l2-compliance on uvcvideo: 52 tests,
 0 regressions (v5.2-rc2-121-g878344de61d0)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on uvcvideo: 52 tests, 0 regressions (v5.2-rc2=
-121-g878344de61d0)

Test results summary
--------------------

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-121-g878344de61d0
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  878344de61d0d5f351a1b84fce009a321be3eb45


1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP=
  =

    =


Test failures
------------- =

1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP

  Config:      multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Lab Name:    lab-collabora
  Plain log:   https://storage.kernelci.org//media/master/v5.2-rc2-121-g878=
344de61d0/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk=
3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//media/master/v5.2-rc2-121-g878=
344de61d0/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk=
3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/stretch-v4l=
2/20190510.0/armhf/rootfs.cpio.gz
  Test Git:    git://linuxtv.org/v4l-utils.git
  Test Commit: 0d61ddede7d340ffa1c75a2882e30c455ef3d8b8
              =


    Control-ioctls-Input-0 - 6 tests: 4  PASS, 2 FAIL, 0 SKIP
      * VIDIOC_QUERY_EXT_CTRL/QUERYMENU: never passed
      * VIDIOC_G/S/TRY_EXT_CTRLS: never passed   =


    Format-ioctls-Input-0 - 10 tests: 9  PASS, 1 FAIL, 0 SKIP
      * VIDIOC_G/S_PARM: never passed     =


    Buffer-ioctls-Input-0 - 3 tests: 2  PASS, 1 FAIL, 0 SKIP
      * Requests: never passed   =


    Streaming-ioctls_Test-input-0 - 7 tests: 2  PASS, 5 FAIL, 0 SKIP
      * MMAP-no-poll: never passed
      * MMAP-select: never passed
      * MMAP-epoll: never passed
      * USERPTR-no-poll: never passed
      * USERPTR-select: never passed   =

=20
