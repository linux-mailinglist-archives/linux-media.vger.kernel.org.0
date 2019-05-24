Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E72F62A084
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 23:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404266AbfEXVlD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 17:41:03 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:51095 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404176AbfEXVlC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 17:41:02 -0400
Received: by mail-wm1-f46.google.com with SMTP id f204so10729390wme.0
        for <linux-media@vger.kernel.org>; Fri, 24 May 2019 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=w81muXWzv+7Dmya4JHvGxnU3n79eYkC6APE6DuwLSE4=;
        b=HfrlsY+t4H/F1VBuF9X+43F/GElxd7KRfsNYuO7430UUNJ9fEHaz+MVMtzmRunB8AB
         ztx8/4dbqrzU4pXIn+Gi2QprKtherqosLdN2qitWcO+419VCeixICh/zd2I+jPA650uI
         xDgD6/PtjR5vStJxuFimKVxeLUM/nk+96fEU4gVKB9a0h4Lq1fZFv0RssHLgaTFY5NUx
         19beWNjcnrk1XyiJDFYH1Qzl5JleJHPtOieCQSJkUixphSWHr042w81WSLp8gplw7eOQ
         3HDn/p5LNxtAYoZK1dBFjjg8A7OMWm72+x+k4r7aPDBcHOiq8g3bMLEjpohWEac9sTXD
         1gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=w81muXWzv+7Dmya4JHvGxnU3n79eYkC6APE6DuwLSE4=;
        b=oPwuEz6mxlfoafihue3L+yWiqD5nRQkV5whl+W9Z+bgCMW6BvVQQ5rUS6snyuzotO8
         azot5wPJqNlr3ymRcEgm2ueqvozmTDHIHe7vsMm+5f3dbR6P+QQXaD1qWtQKjBRaNioe
         2fciratUPAx6yWzB1DQ1Dvp3XtKhMp4apN9eQpO2scUU/MkeMwzl+bZL5G2SlvmzLVn4
         v4NOWLGqNfE3fhhj6lbvcAZdTees7/m142RNHhVuYsCl2rR0E13AVrlynj9ZEIOqaVX6
         fxiDdLbzk8+ImBARAVEsUuIQjIKfLtSXPnOc+5xGPiiACBs8UJbGYzvReKSIBLEqHlD4
         Dg4w==
X-Gm-Message-State: APjAAAWYYkvkrdtOUpdYx4wb1zAUj7aUaOraNJblEvkRfmvlgbBBfL8i
        7UUOusON/nqQz3/Jf4+0kaQIH5bpQRHobQ==
X-Google-Smtp-Source: APXvYqy7sQldZWGiuADJ2JBiQFxF8WDwHfW3r6xICf1hksjfvs5QuBb4ildxjW+wUCcklmQ8rK6Yrg==
X-Received: by 2002:a1c:1947:: with SMTP id 68mr1301168wmz.171.1558734060802;
        Fri, 24 May 2019 14:41:00 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i125sm6923345wmi.2.2019.05.24.14.41.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 14:41:00 -0700 (PDT)
Message-ID: <5ce864ec.1c69fb81.501e1.8aed@mx.google.com>
Date:   Fri, 24 May 2019 14:41:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc1-55-g2c41cc0be07b
Subject: media/master v4l2-compliance on vivid: 236 tests,
 0 regressions (v5.2-rc1-55-g2c41cc0be07b)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 236 tests, 0 regressions (v5.2-rc1-5=
5-g2c41cc0be07b)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc1-55-g2c41cc0be07b
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  2c41cc0be07b5ee2f1167f41cd8a86fc5b53d82c


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP=
  =

  =

=20
