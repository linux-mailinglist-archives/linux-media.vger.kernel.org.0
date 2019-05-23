Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 881412733E
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2019 02:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729519AbfEWAW5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 20:22:57 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:40544 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbfEWAW5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 20:22:57 -0400
Received: by mail-wm1-f54.google.com with SMTP id 15so3935978wmg.5
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 17:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1yR+/DcWPjwvSYea0DSVe94caiPKtW89stICL1YQ8rg=;
        b=VmRa0cbnR89MA3xWIpiZyJ/860bpRRPl6vr5J/N/zTkQmKATlwblpFftHmWhjFg3MN
         pKisG0rTwswarJQZXzYbeikhhZpg11Y2HEx83riaPBiMrnDfwW06k6uRbxmUp41+bCKD
         Cz4Cmu6aTy5vMeI2+i5F/rQX9NbhL6I+dQrgBe18DVHWKmaFkUsce+Ymia1TsaWBfJmF
         H/U9LBKHZGm8NqjCVZbryEEeVK2IMJvu6AplHeNptRQmoamRP+1dG36czZG3FNolE4sm
         Mvhw4510Mc6bBnYqtvoIVGKcg9mSXbrHGIlzJxmJNBQuJpIf9sdLYjbIYPwSSvPSUALj
         Diww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1yR+/DcWPjwvSYea0DSVe94caiPKtW89stICL1YQ8rg=;
        b=Tag0+NgfpQqtNFdYBjbo2VxA2vgH01Zc3u/5QQzqOdZ5bBA+muhEUNvBdARzzWe53i
         Hux2mZvjuNpEEpn+6odwbe3TZthKkbL6TABwrFrgo1XzIxaxbYxNYbpmGswS0db91E4h
         WhRFes7RZdSMz44vki2u6xWfJzdVvFSlRCSePzsM9HTI9jX1p3qsk4HP/p1Tl1PWePyF
         1okzyo1qx+Bm5H/H7SVaavHDX2vZXu77PB1ZAaWMNwnVkcbS7GA0x5KUbNS3CKjAwIAQ
         qVkE9gVjh5/jAOP9f+nqNzHfDT82gVu/QdXSHndN5z5yueh4vV2j/u1e3flhw9S9fo61
         /r9A==
X-Gm-Message-State: APjAAAV7JOzJxTPOl5IKqzaPWtRMBdMg1/DMB+A8I0vp51dPyPvNBp/d
        Pq1bpAoKTNVwAYJngWKh+3BqtOS+ZbGhHA==
X-Google-Smtp-Source: APXvYqzry8sKN7qxHtf9X6wQki8W64q88R5TCVIVzWwNT729CXOvWvw9x+B7y+/DhTB0VE9SGEMZqg==
X-Received: by 2002:a1c:4486:: with SMTP id r128mr9823533wma.90.1558570974947;
        Wed, 22 May 2019 17:22:54 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u7sm17651372wmg.25.2019.05.22.17.22.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 17:22:53 -0700 (PDT)
Message-ID: <5ce5e7dd.1c69fb81.78e2f.4cbd@mx.google.com>
Date:   Wed, 22 May 2019 17:22:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc1-23-g9390467c2d3b
Subject: media/master v4l2-compliance on vivid: 236 tests,
 0 regressions (v5.2-rc1-23-g9390467c2d3b)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 236 tests, 0 regressions (v5.2-rc1-2=
3-g9390467c2d3b)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc1-23-g9390467c2d3b
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  9390467c2d3bd19778ec23b39dde5424151ec37d


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP=
  =

  =

=20
