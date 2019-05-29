Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB5C2DF8F
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 16:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfE2OVp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 10:21:45 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:44314 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbfE2OVp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 10:21:45 -0400
Received: by mail-wr1-f50.google.com with SMTP id w13so1904989wru.11
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RJFYfEJtpR6qgYPchPgw3he/eri+sizHYkgNyy+eCQw=;
        b=YCFnC3bX0HhQvcypn7r3yOH5RMYvb6pavBcBjyAd6CIbREupLOVo9udg4MsXOiE+yV
         1jfO2++2jQdwyHjKFaW5sf6EbrsEIz1lWIV0sfYqCsnsWrm/kQy/VeaCCDbC+kr2WRzZ
         XS3hXTygtBvqNVzAwCrr1cbGQ9HDiZuRkMh2GieHk+i4LgCg+wkKTMl2sGMUwdFB2iih
         e0o6INFztxJPepD5Duh0541scBMl+1V72rM2W9OJSl7lcoBk0FJ20+KtPe7EdTqdhEVt
         Zydwt3Kk42TesXF9T9iv7bphQfy3VzRqqfZpZdM1a2oaePnqKWa/4bXtZUdQZgo1W4vi
         ivqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RJFYfEJtpR6qgYPchPgw3he/eri+sizHYkgNyy+eCQw=;
        b=Tbg1zDG6rSJBxJCBMUwg7Uym2D1tAEKc9bklgXPJs/7QU0ycP3URwAzMG4a1q9sB5R
         lRYemnKghVAF8K1Y+r4j0H9+rRCdEYuBB+KbJ9C4h8sfXF0huDwOqbqtGt2xq2n7gEZw
         XnP5656beKRFEP8k8E6Id8b2pafYE9R3tq5So+AMMLQgP8riJnSDW+FzcldN2818JIqM
         R8LdKehlGVYcsKvK5a0p8YvBs9pXzJq26l8GkwJw6uvYVOzhacNJ0GZupg5t47QFvp0X
         PEPKN911U7gxufHaqN2vsLw44e0zTrgyT0XgPOgU4qTnYNV7sgZAVqzIkDEFFJLVY548
         YxfQ==
X-Gm-Message-State: APjAAAUyXhMEoj6mo5/I3wScCpRrKXhGZE6UfiKizZapVKrhwy5qHkyV
        1BhX052TD2idJA1pR4w8BZlRjtXAVkQHHQ==
X-Google-Smtp-Source: APXvYqxsvkWxCiMDcoSYSeqWmElUmPfculKKvGdWmED5Tv0ChHfq88LsOlUVjaw93KVNq2A0vzmyWA==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr78895642wrw.56.1559139698507;
        Wed, 29 May 2019 07:21:38 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id r8sm1316986wrt.92.2019.05.29.07.21.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 07:21:36 -0700 (PDT)
Message-ID: <5cee9570.1c69fb81.68f7b.80d6@mx.google.com>
Date:   Wed, 29 May 2019 07:21:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-121-g878344de61d0
Subject: media/master v4l2-compliance on vivid: 235 tests,
 0 regressions (v5.2-rc2-121-g878344de61d0)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 235 tests, 0 regressions (v5.2-rc2-1=
21-g878344de61d0)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-121-g878344de61d0
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  878344de61d0d5f351a1b84fce009a321be3eb45


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 117 total: 117 PASS   0 FAIL   0 SKIP=
  =

  =

=20
