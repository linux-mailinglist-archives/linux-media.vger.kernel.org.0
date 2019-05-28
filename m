Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3149B2D15E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 00:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfE1WMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 18:12:36 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:42789 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbfE1WMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 18:12:36 -0400
Received: by mail-wr1-f53.google.com with SMTP id l2so217265wrb.9
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 15:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3BAvhvw23316ZWmj65OmQD7AQf4lpHaTThJo95U/uYo=;
        b=PEz0GQUeQc52yP6RrckpaM/4Jyn87d79/cSgo5jmYAiuClhrDYJPVJ8UHhhZ85hjzV
         xlPaYXQaBlO2BJeGfgZ2F+zHAWSrQB/srN33YNSqRqjWaho2TmHAniXLyRLJMnJOGpD+
         CeQeFn1xfLqk89u6MO605PvtqQn3AvNBb2Tpn1NHiD0Ro/A85gTivRpDIDTyN+LDdQF4
         UPm33VgFJvD9FjGMdmmJR6dIkmFGxTcmp88t3wv062TQd6j5K4v7sfVs/K6BsjaFMthI
         2HHa1uC/kx5/RQSpt6mjDFIdoL2OM/K6q7uzIpFUFqQPrJhSp1vbJ4Yvx93KA6rDkmVn
         i8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3BAvhvw23316ZWmj65OmQD7AQf4lpHaTThJo95U/uYo=;
        b=OOKXm0sRcHttbU6uZkpcEdvhAhjEpa7vOgAwzTGtNzoRASCyZ6jx0YNiTLTW/p2+Lx
         bmi1V4u7NoMRnw8DhDTQHvrox00LVujri4QgUfKGdxPKATpbP6nZveDKS6AQig2Zihml
         Ky9epgr8IIVCFpA+MvJP08AjZVnSpaIhouQX3Y57Zceeq0OMZp2+haXVFpmx6dXgVJH4
         T/XeePQEtFFxll9CTiQmE4FM91PFtUk6dSmLmsjPL31YPRq6nj7eM7Ojtwy4qdEpa9IN
         2Ekc7/MIsk8uMG1Z2ZzB8oXrvyv2rAmubqfw+0zjeCiLOToiVZ6wiPBtlI6jOhyIQN8y
         b4MA==
X-Gm-Message-State: APjAAAXEe1KMXoGwkPxBJ6yPSCxkJOMMXfgNZICZiQPJNix70Tnpl5WT
        ewxK8uZjPsP/KAmELkaM8i8sPGuUL4YlAw==
X-Google-Smtp-Source: APXvYqzdz3hsFGnSz1uC7FyXSa2Nwm92zeYS46y51zQAVm0cEmJrODuI3ozd2Whjf2ux0qoXx1tJwg==
X-Received: by 2002:a5d:658b:: with SMTP id q11mr61916121wru.130.1559081553883;
        Tue, 28 May 2019 15:12:33 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y2sm3164914wra.58.2019.05.28.15.12.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 15:12:33 -0700 (PDT)
Message-ID: <5cedb251.1c69fb81.b8317.279f@mx.google.com>
Date:   Tue, 28 May 2019 15:12:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-56-g1e0566fd4a81
Subject: media/master v4l2-compliance on uvcvideo: 52 tests,
 0 regressions (v5.2-rc2-56-g1e0566fd4a81)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on uvcvideo: 52 tests, 0 regressions (v5.2-rc2=
-56-g1e0566fd4a81)

Test results summary
--------------------

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-56-g1e0566fd4a81
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  1e0566fd4a81bac04aed6af818e6938e6c71d389


1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP=
  =

    =


Test failures
------------- =

1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP

  Config:      multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Lab Name:    lab-collabora
  Plain log:   https://storage.kernelci.org//media/master/v5.2-rc2-56-g1e05=
66fd4a81/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3=
288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//media/master/v5.2-rc2-56-g1e05=
66fd4a81/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3=
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
