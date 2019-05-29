Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDFD02E3D3
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 19:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfE2RpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 13:45:03 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:52463 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbfE2RpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 13:45:02 -0400
Received: by mail-wm1-f50.google.com with SMTP id y3so2252895wmm.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FvXkW9wYZSnc8D3b6nEQY7IzflOwooygPq7HjXp2wu0=;
        b=wbE0LsV7TVLkKgD8P/C7whMSzJZEJ74gAEAlP6o9AAws0JQFRU88CBah9tVR4/GVGy
         qRy9fSEAYYmOXTN1Q7M1quSZM/6Vc4AoWPOm46mtgMohm+LeyeAl8Wam9myOBimU9PVN
         1jEHd/riv2QWD1oTYMPUrSbLspYQFr4vJ1npWcUHCG4YJPAktx/tdYdexGo00Qx8S6Th
         apXQww6UghdmwZuapI9hJ4P1Utb2yy/Cf+JAh04xBojpqru6ZuNc6DjRDEjIXO5xp7Ht
         w22a1U9rudfKuBOPkbj+hIPAdKqV7JHy1nQIZEACzeCmM9wNCZOwesjr3PjcX9cJP5mu
         qncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FvXkW9wYZSnc8D3b6nEQY7IzflOwooygPq7HjXp2wu0=;
        b=KAoT8gToGVF5zkKFBsBooyi4vOAU7hli4blS45GSZ67rhMHSJzebU3PiMgrg0NEy5A
         sxe+kpgQqN8ihNJwQFWizPJ9kVrEX5ec8QkZLpnFBi+ObuFpvQbbqShLSSODh7QGWeXm
         k7QWGv9H7rzEKiNsYZhJ7nWFQXckbUqPSzJ7OyktjQ3xULIpKklc/Pvf1vaHCADU3mGG
         h+u1Yd0Pl0F0TooAcWnBaG6X05VtYO9+VoTJ0K6CgRri2e2H9Kr6cqC6P1IRbYzpYHd3
         cYBgOdBUFMd1wap5kC5pTeo6PwlX/RkfOlfcJ7eK6U9MjzMe3wwqaRJH7sXX7Bi9YWRe
         JoxA==
X-Gm-Message-State: APjAAAWDepXTjMp0PvpeSYqH8i7DoHZXylk1HO4F9uOUmeDqwmMP2Cij
        wOdlftChbraxaf9rASSOyITgqFkUZzQTYQ==
X-Google-Smtp-Source: APXvYqxWXStW1ihP7AEQmYsXx/fgYPd4iOBCAT62doh6fU5A1LLku/hQLroNsI90CghgwZaQuWaoCw==
X-Received: by 2002:a1c:d10e:: with SMTP id i14mr8121511wmg.161.1559151900973;
        Wed, 29 May 2019 10:45:00 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r16sm46000wmh.17.2019.05.29.10.44.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 10:45:00 -0700 (PDT)
Message-ID: <5ceec51c.1c69fb81.9b356.0394@mx.google.com>
Date:   Wed, 29 May 2019 10:45:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-123-g578a3ab12705
Subject: media/master v4l2-compliance on uvcvideo: 52 tests,
 0 regressions (v5.2-rc2-123-g578a3ab12705)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on uvcvideo: 52 tests, 0 regressions (v5.2-rc2=
-123-g578a3ab12705)

Test results summary
--------------------

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-123-g578a3ab12705
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  578a3ab12705aae0101f590d3a77ecafe22f9453


1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP=
  =

    =


Test failures
------------- =

1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP

  Config:      multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Lab Name:    lab-collabora
  Plain log:   https://storage.kernelci.org//media/master/v5.2-rc2-123-g578=
a3ab12705/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk=
3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//media/master/v5.2-rc2-123-g578=
a3ab12705/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk=
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
