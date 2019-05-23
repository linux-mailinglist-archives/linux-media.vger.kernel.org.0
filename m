Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25E4928DE2
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 01:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388177AbfEWXfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 May 2019 19:35:54 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:36886 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387758AbfEWXfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 May 2019 19:35:54 -0400
Received: by mail-wr1-f50.google.com with SMTP id e15so8040398wrs.4
        for <linux-media@vger.kernel.org>; Thu, 23 May 2019 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cG+rQwQR2lF5W8tPjecA+2BQC9Q0M6xcWT4n883TbOg=;
        b=uXTlcuu4M4zcbHPalelc1p1HRQP/JS15e96k/2R8P7FsH/NliOFYGt7NRSvM9LNoEE
         2YlHWF8Pd+HSEX42XLRNYKx2joEk8DrqLB8J3TU8wKma1/vWH6k7o3MKYHPWRW+/5WkW
         ihD8Ip2asQOWROhOPeAPMHaI2AzmcqCYjxrbIExx/AJq2dpbqyZvgfx3AZpd2h9S7qB9
         0poZKHiPDktA0Rc4PNwjiL8xouenic0imaNgdrGXZ9qdtIsZ/kWBpUz93oSR+XMGEmZs
         xQE+8GpheCwiiwAmTNfW7Q8f6PzBLhosb9qHuQ+UWgNQ5g9wUoDeCQGbCF5WhBqtNiYl
         ne0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cG+rQwQR2lF5W8tPjecA+2BQC9Q0M6xcWT4n883TbOg=;
        b=JudjwgoDBG+cR0ZmuByUOi50jzVzbZfuiCUgjRI4P8wa2K6R7l+YgQ9Mjtdabcm/S6
         G5pAHyDxiL8cWOpPWUdXiRR7gADTXvHDyojBESByeQOjbz2dz8lHlDGDbCRjC8HzKm/k
         7SJ5NLM+MCiZdDYVspbZIeV7rD9H9gBwymoyGOrZBXXmr8eCWpH2RyPK+rOmSKqMPyb5
         TNF06YG/LK5OsFG9i2YSlWUwkQjbhHZwM7SCuktxIklmZ+tmP7JjtwQeGFh/SbksZCF9
         GyAEUAuq1sOFeHwMspzAm1FozqyFZcOaQ4k72jB4N0RvSczZIs7k4UfcXtp8cdG8loM+
         +TkQ==
X-Gm-Message-State: APjAAAXT6FLEnrbDbvka7zSsaaGPQau3k7eBxJnvqlb7T+/W4xKwWGXV
        x0gWcnsJYajLzHXHpYbPY0ZUPVTsZ/+84w==
X-Google-Smtp-Source: APXvYqzTvInwZ/uPX/y+I5GWL2AnKWuhyDG2Sjwap2eE73FnCV4tk1pWKC/brGlQYduGVva/5OkF4g==
X-Received: by 2002:adf:9bd2:: with SMTP id e18mr10058656wrc.210.1558654552676;
        Thu, 23 May 2019 16:35:52 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f6sm788647wro.12.2019.05.23.16.35.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 16:35:51 -0700 (PDT)
Message-ID: <5ce72e57.1c69fb81.94eab.4ac0@mx.google.com>
Date:   Thu, 23 May 2019 16:35:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc1-52-g3d3515312f97
Subject: media/master v4l2-compliance on vivid: 236 tests,
 0 regressions (v5.2-rc1-52-g3d3515312f97)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 236 tests, 0 regressions (v5.2-rc1-5=
2-g3d3515312f97)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc1-52-g3d3515312f97
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  3d3515312f97582136644a7327ed262c7bb7ea31


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP=
  =

  =

=20
