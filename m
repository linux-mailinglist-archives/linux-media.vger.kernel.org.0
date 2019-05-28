Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED732D197
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 00:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfE1W2n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 18:28:43 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:40810 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfE1W2n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 18:28:43 -0400
Received: by mail-wr1-f51.google.com with SMTP id t4so250096wrx.7
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 15:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EXo8hniocFVuY4PgqOqHmytC8S+s3/hO4O+NYeuUUOM=;
        b=vn5+33ujcp5iFMM9QuNkKEU614iVHZqqrqs5RuiaKITN4rB8OoifR6Pux1TSdhvXAU
         MA/rEs7Rk1MhUmVA8vrEBiZ0fflBq6x3dA13XLensJ9aDEoxl+8F/q9a5dTNT5wDFQ9q
         ssgxkzF4dmG0DI+/s5KO8ROGE2DGc6eOB6u5EAM3sfx+P4T8WLEm4ecUo5FnPZPE1Nv0
         ndRp/Saw4zK8HP1mqtUJcOqI6SBWLOVOTdsThFe5TFx716rDTLqroKLauPFzU3TjUr2P
         ae+GuB75bltrwlfOksVXSx61mt808fMNPDj2OZfOeahmYRUqKbeAC1AzR6QtGoDS071T
         L05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EXo8hniocFVuY4PgqOqHmytC8S+s3/hO4O+NYeuUUOM=;
        b=bWEqjx4OnXGW1L8KvWCxDuNKHoXusDMFWqRPH8DJMEg4rHAzmPI5ai0cuu3ky9p2T3
         mayM6RJdPKyuAzYl2YDnRJbnScR4ctpOmyKAOt4+zXUhW2e7qrRGr55u7Glf1Mmt4M4m
         ZQ8dajhwzMTeDBS/+Ml4lEfdEAATExLqV9faQ8eEjhBF7+ZBpjZ6heUIT2HzYVCiOClH
         +iv4RFdeCN0h7WLU2sfO1LKTRHGPNWs+6BE01q5XgYpZyUySMexyp1nR5qQyxOF0ShUu
         Ul5Ixb7UZIr/EPs2z49oGXldj/f/xNP+wsOmRRfNiKhujTOm/n2pCK/CBxt8fFN7QcOd
         lFJg==
X-Gm-Message-State: APjAAAWul/1i9iLxd9O2OGg/WBAyBYAeMZem19p0j4PmPXhEFoP7s1H7
        IdhgXPw79ITGLkJxprWyMpUfW5+GGosReQ==
X-Google-Smtp-Source: APXvYqzFxuqziG7ER7UPbOSnsIt8udi1n42fufECif6ruafP35fA7f6avKnluWjR14osb+7DZXe9cQ==
X-Received: by 2002:adf:dc0c:: with SMTP id t12mr67286580wri.101.1559082521339;
        Tue, 28 May 2019 15:28:41 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i9sm3703212wmf.43.2019.05.28.15.28.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 15:28:40 -0700 (PDT)
Message-ID: <5cedb618.1c69fb81.2cee3.49de@mx.google.com>
Date:   Tue, 28 May 2019 15:28:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-98-g39cb46751e2f
Subject: media/master v4l2-compliance on uvcvideo: 104 tests,
 0 regressions (v5.2-rc2-98-g39cb46751e2f)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on uvcvideo: 104 tests, 0 regressions (v5.2-rc=
2-98-g39cb46751e2f)

Test results summary
--------------------

V4L2 Compliance on the uvcvideo driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-98-g39cb46751e2f
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  39cb46751e2fbb72e0698f80e339db1fd4e1f50e


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
  Plain log:   https://storage.kernelci.org//media/master/v5.2-rc2-98-g39cb=
46751e2f/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru=
-kevin.txt
  HTML log:    https://storage.kernelci.org//media/master/v5.2-rc2-98-g39cb=
46751e2f/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru=
-kevin.html
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
  Plain log:   https://storage.kernelci.org//media/master/v5.2-rc2-98-g39cb=
46751e2f/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3=
288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//media/master/v5.2-rc2-98-g39cb=
46751e2f/arm/multi_v7_defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3=
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
