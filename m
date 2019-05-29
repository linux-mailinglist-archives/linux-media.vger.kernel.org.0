Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 633C12E3D2
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 19:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfE2RpC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 13:45:02 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:33546 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfE2RpC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 13:45:02 -0400
Received: by mail-wr1-f47.google.com with SMTP id d9so2425815wrx.0
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JLc1HQbqKW4ih6uUunq2FkRgilJt0UY0LK0uaWKzifA=;
        b=rOQgdbs/30IzpSEXB/zq87PMDrdNJlu5uf+U0DQV9omTmsn+VBY5IPZQkvxvb1ex2i
         zsAersUnfvm99J4miV0D8l9CjA9XW17BkPJCRYKflscnFJ2vxMhqv3wNaaQJTTPvSMD6
         ZltntOxYWamFvIWV3eJ1JhPCgjl97W/UU7RRBYLzZpDsrKMvBya74ERYG+vBIw53BNOI
         0YcfHWEpQBt4gf/sFBPzR2yuMg3nD2/MwuQ8v3uKnUpGUxXQ2nBAMMUMQ9r5DJy8THrC
         S6jI2lgqf/RsGpygzaHjvBwTTLo7awPzpGoEeZNlGyyD5QFbZGcwUjlEzxi8tJDkVMzd
         O0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JLc1HQbqKW4ih6uUunq2FkRgilJt0UY0LK0uaWKzifA=;
        b=mWCppGH4GEjomaA9QnhUTDjSEPSFeX6FuFajFAOPH6xoCFS59rfAj9DKLnagf+i/au
         9cuDcddtLnutTPjn62ztGb9/iM1tYleE9m7q1ZKpPSTGx2VyQg7yk9GapgcArYAZ47Jh
         5E173ZELyuTQ+LTYDX5rVjftBQjlzzTlsVStgMctxzA59Sxm6MLay80QoaCWV6e1Wyzw
         3iionFLC7soKzGhF9nyGHQsf+2AGVtOST4zp7bpA99Ay9kXtjbEvpTaoq9A28sIRfcFF
         gL6PM6TN4XrfqLmzhgCWERBLULjKDCFtIGQyRO3evpmCLnOuBqDI+Y9s0hk7M0XVNWzl
         jiLg==
X-Gm-Message-State: APjAAAVp8H8AKIC+pxNhF5J8boM3v7AEry5LcZvoHJf8LImkD5aHzoGS
        8nkQj4JbM7gSB0riBb597AX5zk83Ki4PnQ==
X-Google-Smtp-Source: APXvYqwWXxyEpF/+IMTh9DOUNZG3nzcYud5zuLx85rvlnDVYoOP2sSOmpRqjWq46BnsL59dEodlYxQ==
X-Received: by 2002:a5d:610e:: with SMTP id v14mr999436wrt.343.1559151900569;
        Wed, 29 May 2019 10:45:00 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z16sm90849wrt.35.2019.05.29.10.44.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 10:45:00 -0700 (PDT)
Message-ID: <5ceec51c.1c69fb81.2fffa.0777@mx.google.com>
Date:   Wed, 29 May 2019 10:45:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-123-g578a3ab12705
Subject: media/master v4l2-compliance on vivid: 236 tests,
 0 regressions (v5.2-rc2-123-g578a3ab12705)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 236 tests, 0 regressions (v5.2-rc2-1=
23-g578a3ab12705)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-123-g578a3ab12705
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  578a3ab12705aae0101f590d3a77ecafe22f9453


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP=
  =

  =

=20
