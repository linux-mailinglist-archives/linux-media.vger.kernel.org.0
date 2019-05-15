Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21AF51FA4C
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 21:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbfEOTE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 15:04:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41951 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfEOTE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 15:04:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id g12so385810wro.8
        for <linux-media@vger.kernel.org>; Wed, 15 May 2019 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ydT69e3qZMHIkiBfI/YoTeciyQCI8pZzMxX+D3yPi00=;
        b=XdPuVnBA+0fr7ac6B5KzDK3lQG8nLaVmi2tJymtt0UAzwiDfU1r0Qj3GD3oX9jAcEF
         mqZXgKgvf8byIhYa+MSkcT0c2Gjmxo068yKG4AH9qrLU2+XVOEyUV8gbvswNpqWY0uKo
         vYDHjokBkur+9eCmSMZCQccz7yh44piwSIQu952j2BPAPBvqSBDezGPw7Z1FUKKeWN8J
         9UgnlNkTJLHvocbeZfqQdrhBifIwK1YVaP0q7Md+JpDyTF8AxGS58iv3zSkTvbxFt5aP
         B23TZh7rDMiaMqR7lD/xiicGxv+TYa51FrJCwPSqG+q7rLpD9q2eEFyinOOEh/b91lBs
         UenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ydT69e3qZMHIkiBfI/YoTeciyQCI8pZzMxX+D3yPi00=;
        b=XAlarCuQM0sxV4DWv4u8yUUdiK47kBwsd0w5cl7fbtkUhII9HqljxaKoQqsHo2Bo38
         JQzhvnSnWNNoTV5tqi/gW/lrx8yvqurjw2IH51HUm8QRPiY7Az2FmYKRKgSfJFc3LKm5
         FBVredqBKPvM5ITjqTpAZU4oT2vU/FvSdKrt8Bz9fTvhZmQHeKUYbI98Jdh//albYMxH
         brZn7KE5zzfqw+X8ZSTBKZLOZxWpp0MxAelNl95TLH4XcXEwGw3+HBx8xsJX6paOB2jw
         wMoAmVRxLVgJCGBZG4AywPCX9UMsp8M3ufaRUAeNIP2JCMR6+ConFtX1sWi0zQUDY/Fe
         kqgw==
X-Gm-Message-State: APjAAAUJmo2TJjtnuqKbq04PHoSt7P8nW/0kiWM2n7GZCzw5jQXwiBKp
        KjtV0WvGW7Wp5yGn0HEIrfq2bRbl1svH3A==
X-Google-Smtp-Source: APXvYqwAKE2OCa+FKsqwLs0RdJO++JhgQOwomZ8QuIBlyPZkS2peS9NnI/HuOCWnmryDEBz+ZD9mOw==
X-Received: by 2002:adf:afcb:: with SMTP id y11mr23504871wrd.97.1557947094778;
        Wed, 15 May 2019 12:04:54 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l2sm4113300wmf.16.2019.05.15.12.04.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 12:04:54 -0700 (PDT)
Message-ID: <5cdc62d6.1c69fb81.50fe6.849a@mx.google.com>
Date:   Wed, 15 May 2019 12:04:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: media_v5.1-2-16-gfc8670d1f72b
Subject: media/master v4l2-compliance on uvcvideo: 104 tests,
 0 regressions (media_v5.1-2-16-gfc8670d1f72b)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on uvcvideo: 104 tests, 0 regressions (media_v=
5.1-2-16-gfc8670d1f72b)

Test results summary
--------------------

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  media_v5.1-2-16-gfc8670d1f72b
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f


1  | rk3399-gru-kevin       | arm64 |  52 total:  43 PASS   9 FAIL   0 SKIP
2  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP=
  =

    =


Test failures
------------- =

1  | rk3399-gru-kevin       | arm64 |  52 total:  43 PASS   9 FAIL   0 SKIP

  Config:      defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Lab Name:    lab-collabora
  Plain log:   https://storage.kernelci.org//media/master/media_v5.1-2-16-g=
fc8670d1f72b/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//media/master/media_v5.1-2-16-g=
fc8670d1f72b/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/debian/stretch-v4l=
2/20190510.0/arm64/rootfs.cpio.gz
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

  =

    =


Test failures
------------- =

2  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP

  Config:      multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Lab Name:    lab-collabora
  Plain log:   https://storage.kernelci.org//media/master/media_v5.1-2-16-g=
fc8670d1f72b/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//media/master/media_v5.1-2-16-g=
fc8670d1f72b/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc=
-rk3288-veyron-jaq.html
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
