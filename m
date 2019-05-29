Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 315812E532
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 21:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfE2TWD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 15:22:03 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:37576 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfE2TWD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 15:22:03 -0400
Received: by mail-wr1-f49.google.com with SMTP id h1so2566097wro.4
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kKwO6ezezAVjhE5wd22dmefBkU1HN2iup5aQg0SfIGQ=;
        b=oKI5PsyCT0TtmVqugS7Oi73da4399nqjPuvUrmEGSGEgFCBGLWE2HClE3LzD9U2cDx
         qJiemHUohP1GOeGjlIZPEWk6s+DJYtFH2LRgjDJ4RvTQRM0mnzFQBH+3k8BiORwHCXd9
         EAZp8WBQVFfHhPA9KV4NPwiC1sulAYb/4hfPu4smRyXR0FJKBUVJRHb6IrubYfkxPDYe
         +JpR+p/VSKAxflCpYkzEaxot5DDwwXYLXSqW/R/JYynW/QBEJ245c9R3wY+FH8DnEKeN
         IcCIEa+eAnrCflfX+Y/QJFxZWDJw1RZsRfnUzqESRFrRRSBFPvypE5VBOaicPJfYDJcG
         uIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kKwO6ezezAVjhE5wd22dmefBkU1HN2iup5aQg0SfIGQ=;
        b=Yd+1P9XrOX3FK6bsQwLyEys1tyAwqfXL7SVEPFNPtVNWrufCP1+ov4+yXvXqYPrEBR
         77nUnCIehfPCahkN6boTCK3Sdf0swalWo21qkzNT64nTM+k01AGohbjRT4h5ZmQgEl6r
         4fkreo2F6w1wtw6aRT/zTQ1iH8E/65BiTLK1nun3LibyNogTUy3/WrNbGspzdI7+Pte1
         eNHH6CjCpDKK2tEeiNjXAeGvJL85IP0aUJ8n9sDTpH751l3SI2n+lhHpRTJH/yQd9UqL
         +T1kiP+YWy76c8RMVeW+TgwSdtSzUjtBhhxEW4sg/UrLGnw/Rjm1oT3EhOI/xERtpO90
         SzGQ==
X-Gm-Message-State: APjAAAWN0KHJ6rPp/CpxGCKXomdduLIhpDl3SuVmVU+8B6Mi6RehnAVX
        1ejTV8Bi6fGm2a+YJ3X4v/gxTEBNUfDGPA==
X-Google-Smtp-Source: APXvYqxTRHRWGWpJ/b/+aBq54mw7EvM9htub8/HPSOo9tchASH9Trg71v1FfIaJGw11LdNC2Pi2GNQ==
X-Received: by 2002:adf:978b:: with SMTP id s11mr25657018wrb.169.1559157721427;
        Wed, 29 May 2019 12:22:01 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o6sm208271wmc.15.2019.05.29.12.21.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 12:22:00 -0700 (PDT)
Message-ID: <5ceedbd8.1c69fb81.5274b.1083@mx.google.com>
Date:   Wed, 29 May 2019 12:22:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-133-g64b42d8eee9b
Subject: media/master v4l2-compliance on vivid: 236 tests,
 0 regressions (v5.2-rc2-133-g64b42d8eee9b)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 236 tests, 0 regressions (v5.2-rc2-1=
33-g64b42d8eee9b)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-133-g64b42d8eee9b
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  64b42d8eee9b57d1329eeb338c3c30171a14cdbd


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP=
  =

  =

=20
