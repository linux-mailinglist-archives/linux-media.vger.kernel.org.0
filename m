Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 118E92E533
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 21:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbfE2TWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 15:22:04 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:56310 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfE2TWD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 15:22:03 -0400
Received: by mail-wm1-f43.google.com with SMTP id u78so2404117wmu.5
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 12:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=i3MPCYJ4CE17GCAtNKXZfc4IGStgeweCqFcdrYOSM1w=;
        b=2SqwlJ/VLAJg7iKVztJ9+7py+7zpAptDpW81FWWT1VVjrlOoUu3oSAoAoe9T3Fq2Kz
         eOcC9o9xHacP1+utDmcGYeis2Z4SyegdIDmxYo3MaMQzyCMuVOxhq3k2I+dDZLuoTxAQ
         HDpCD48Xq5+i/uN1nTStM8FopWFGOUuzYqLpdVM8+qNpZK5PM8p4kiaVnVm4xvhwaAY1
         TQkJrXesDS41S7LrJapOkwN68PbqLGukREszHBGiPwCsDTWa8vpZKI44fQzVw9K/hXeB
         o0SEm3KcPeqENdAUJCR1GWFDpVx7ys3tibWgP1Ll15pYUmadtLmwmlD16ewinWFmJL0N
         O0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=i3MPCYJ4CE17GCAtNKXZfc4IGStgeweCqFcdrYOSM1w=;
        b=HE79S7Ja7pkbCPdbkK9JSA8vpw5xYxWIcKlpqmZxzq2QcfzxAOVBEc2foVtDnVJdgA
         aafyeHqtTfnfM0Qg5O5AQpS4X/HZtwYyOYrQ3qMPWmCWB+foBLl4O64nUdc2r+BWgB8S
         qKizCw82JNgNypiPB/ZiicGZBavNPc//reMbvnX+/Qf0TwWtgxOsAe2vBVtjILU5l0IT
         cNhs9jSMsTXMVPyfzxkkhvMGTFMQfNDnEGR1h01RbvpO2agX3HLGvvHNTcIyILqYdC5k
         Y1NIupEfdLV9IRRtFSmCxMR1KEhMPitnEIcD+JI5BDdkPePTS/v5JgY8u55sYVQalhNb
         Y7XQ==
X-Gm-Message-State: APjAAAUK4gVuhuWt5lI1oJGv/Faf4jQ2SCCJg11q0AKsSgQHMXzL65tE
        76DsHyR+HSIwKdpG4/2sJzxr2888EuVMaQ==
X-Google-Smtp-Source: APXvYqzBWh9mQx22Ar9c7B0KShtGiYiD1kO8WQDU3hFYlFlsAj7c/BRiBWPDKwO6zizlebBYlQ8lPQ==
X-Received: by 2002:a1c:51:: with SMTP id 78mr8225741wma.9.1559157720991;
        Wed, 29 May 2019 12:22:00 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 205sm162036wmd.43.2019.05.29.12.21.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 12:22:00 -0700 (PDT)
Message-ID: <5ceedbd8.1c69fb81.df0fc.0d5e@mx.google.com>
Date:   Wed, 29 May 2019 12:22:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-133-g64b42d8eee9b
Subject: media/master v4l2-compliance on uvcvideo: 52 tests,
 0 regressions (v5.2-rc2-133-g64b42d8eee9b)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on uvcvideo: 52 tests, 0 regressions (v5.2-rc2=
-133-g64b42d8eee9b)

Test results summary
--------------------

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-133-g64b42d8eee9b
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  64b42d8eee9b57d1329eeb338c3c30171a14cdbd


1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP=
  =

    =


Test failures
------------- =

1  | rk3288-veyron-jaq      | arm   |  52 total:  43 PASS   9 FAIL   0 SKIP

  Config:      multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Lab Name:    lab-collabora
  Plain log:   https://storage.kernelci.org//media/master/v5.2-rc2-133-g64b=
42d8eee9b/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk=
3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//media/master/v5.2-rc2-133-g64b=
42d8eee9b/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk=
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
