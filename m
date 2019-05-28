Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DE62D24D
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 01:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfE1XO7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 19:14:59 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:51218 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbfE1XO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 19:14:58 -0400
Received: by mail-wm1-f54.google.com with SMTP id f10so253283wmb.1
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kZICmG/0sro/VjRvQHQJzt2ngHPWXASQ21/Ozm/0To0=;
        b=RrENI9h64+QVzD6fvS/CPRfzMZMpmiLMYZ0lkpG7r9U0JDFYmiDfqHti8CrHGVDWk/
         HY26c33DAtz2T3x6DvVI7Bx9kim7qNB6aLgMCbB/KHaaM7Y5S3ZWgUkqtDr1icA6lcG1
         NPcK5jlYKAdWlgp8Yk4qDqYDE6vKePrp6zkS7HOo5mqnrbdP20cpLJE1f0SJy1aSbRDp
         G4y8+5XgQX2YvKFKw6jdkfB0oI0M0yATM90lvoSTEAzY2eBFcTiRh09P8wUA3QSc7lPn
         4AtJa0ehqG8Hvlh4cy13hQRk00jnbtTL8LIbwhUa8ayHgd+CPWoVPFxPFf0MSBlxp8Eq
         MF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kZICmG/0sro/VjRvQHQJzt2ngHPWXASQ21/Ozm/0To0=;
        b=QYRNBr3qfxev9rEJz2QM/7kEE+Hjoe19Me/Z496XquxB8BVdbeus4aDMxlHLs4j1qc
         GFGVE37L1pNmEuf8M4BCsnfQuxSZuBS6W/1UA24DfjPDTkD9yNWzXHV1Y+31BT3Brbil
         GDlqtw8Lj4rqSsiM9ga551bl6DhCT5UuQAru7UZdlaBwemmbdHnpjjLnkBe8xjiX2Bmf
         NLmLqY1HDDQ38t4+wTdQ+vXSNYmgpRxqNLIJqESONjb3dpfgy313mi+uRf36eHORJI5N
         PmMOEaG4I9uhAtcmlC58a5lrPs5zILXPqmHPqonPadfLNWUOKiuizWk5qJHesyqUb2Az
         1eoA==
X-Gm-Message-State: APjAAAWV9IwK9jpmLpuva/2wrNGYOAStFlxWVtmrTtfYZjralqdCTzLz
        hQnBkdszpct1eM5B5tzZTlqPaFGeAnc0ug==
X-Google-Smtp-Source: APXvYqzF7LVYPYRo+4VERv//O5Ag2aINNgAkex0hjIwfI5ck3I57bJGXPOY2o8rTUW4lhvNM+AueQA==
X-Received: by 2002:a1c:7216:: with SMTP id n22mr4947314wmc.111.1559085296396;
        Tue, 28 May 2019 16:14:56 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f2sm6681822wrq.48.2019.05.28.16.14.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 16:14:55 -0700 (PDT)
Message-ID: <5cedc0ef.1c69fb81.dfad1.5fce@mx.google.com>
Date:   Tue, 28 May 2019 16:14:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-82-g9bec226d8c79
Subject: media/master v4l2-compliance on uvcvideo: 52 tests,
 0 regressions (v5.2-rc2-82-g9bec226d8c79)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on uvcvideo: 52 tests, 0 regressions (v5.2-rc2=
-82-g9bec226d8c79)

Test results summary
--------------------

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-82-g9bec226d8c79
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  9bec226d8c79fcbc95817b082557f72a79d182f5


1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP=
  =

    =


Test failures
------------- =

1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP

  Config:      multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Lab Name:    lab-collabora
  Plain log:   https://storage.kernelci.org//media/master/v5.2-rc2-82-g9bec=
226d8c79/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3=
288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//media/master/v5.2-rc2-82-g9bec=
226d8c79/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3=
288-veyron-jaq.html
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
