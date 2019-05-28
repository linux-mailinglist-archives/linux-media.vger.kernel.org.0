Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B54B2D15F
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 00:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfE1WMg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 18:12:36 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:40027 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfE1WMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 18:12:36 -0400
Received: by mail-wm1-f43.google.com with SMTP id 15so164752wmg.5
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tvpbBKCFA0iHdiXCaD8m1NC2ikKvmh1UgH2U8VhPy+w=;
        b=aftkgqjovBU4TZiXOSzDApY9oWYCkDnIekYpY5clc4y1AVYmia0q3mYhKEstGB1qhq
         AwryAsXSVW9+a8Gr1KjPc0SyIcEHc7JuCwyFxEatTIe3lQzK5DxQpxq7g6ExypUJ/FAO
         fzhuBryjDID++C/L9ZxZSzlbtm8//CtXq6Oo+Blz+bjC6uVqbgRF/LzgZaYn3AmP/FI6
         gfZ2UQmY3fTfjYWvNQTkBIftuPvKExPuKnmAzrBFpP9h/qLPihWKnLbrHn/U1D1LPR8o
         dH4hbODPWRo6TofcHNUnBz9dLZRqXwjRMCBXPgcNN+yhwlu1YaTD0+ZwAhkshE54bjbh
         AAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tvpbBKCFA0iHdiXCaD8m1NC2ikKvmh1UgH2U8VhPy+w=;
        b=bS5DZQyKd4ryXg+kpUK9O2hg3GkQw+BigytqyXSj2r9Zt03IS9871cj2zT8dpTFKFp
         6ct9y/Jrxn1ur0nQV2JX4O7mA89BHaY5Hmy1gJP2UqlR6vpQgdjRZ7Cl60tpr26H8s4a
         JZlfs9Dr6kMn1whYuV+7LtF0ByNOgBTO+yGCiwNZY/BwRP6mSW35NmkXXa5FX1c2wGJK
         Z7UO4lTE7KybA9yEDijLfeF96rwiMuTzuPj7KknzcMtcqXB7Jd+uKRwvLPrqV6XiHjW0
         FHHmz5WaXmq68K62s0xpsVtUEH6RHrFJqWZpFiNLx2gBLdOPaI96aCf1uxxjl6L8Z3Pl
         QxKQ==
X-Gm-Message-State: APjAAAVQ2e36yHDic0wHWKprFYELGt3WcxJO/qboikIX7jvjfmLXX8Ic
        grz0dePwL76bmSpcexvFIScLAsJMrrV8GQ==
X-Google-Smtp-Source: APXvYqxI/B8YjnPOGC5QwoWHV75PjF/y1gHrY+CgVb2zaHExQczxkK/FWOxzEHFTpXvimQid52/hJg==
X-Received: by 2002:a7b:c8c1:: with SMTP id f1mr4265114wml.159.1559081554325;
        Tue, 28 May 2019 15:12:34 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z16sm3175796wrt.35.2019.05.28.15.12.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 15:12:33 -0700 (PDT)
Message-ID: <5cedb251.1c69fb81.29411.109d@mx.google.com>
Date:   Tue, 28 May 2019 15:12:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-56-g1e0566fd4a81
Subject: media/master v4l2-compliance on vivid: 235 tests,
 0 regressions (v5.2-rc2-56-g1e0566fd4a81)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 235 tests, 0 regressions (v5.2-rc2-5=
6-g1e0566fd4a81)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-56-g1e0566fd4a81
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  1e0566fd4a81bac04aed6af818e6938e6c71d389


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 117 total: 117 PASS   0 FAIL   0 SKIP=
  =

  =

=20
