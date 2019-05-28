Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3522B2D24C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 01:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfE1XO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 19:14:58 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:53944 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfE1XO6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 19:14:58 -0400
Received: by mail-wm1-f44.google.com with SMTP id d17so246395wmb.3
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 16:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RXmKUUbCNPo4lF4wCNX+nAAtKTgjKh/v2WSwOssaHRQ=;
        b=rTeIkvqejkqDarMBVls/kpvmGyenVBIsPzT99lEsRc4q2BS4nz11Tta0I/MTjN1PdE
         pwMHawxj8JVdeh40hXFkos+1q0wrvk4hB9CI9i7Q+ql2orET3KMz2d669gR0odOZAtUy
         TDcU6JANbOBdUFOGBzXaS8arXXTKSAam26qmAsVS5bdu6S0Grnb+kLt6Y2hLJL7fi7u+
         L6V3hskE6Gv58vM37mN9lV6n3YaGyYrw1eLjIqCJFUZ7JxBE4AO0bz45/OJBHKelXKIq
         ZJnRZ5lY5VK0bB765d3X4ZRwU87eCHvp6kv5ZZWWzFy5zt0uBLAIr6QC4EpD1xqAhUTF
         0LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RXmKUUbCNPo4lF4wCNX+nAAtKTgjKh/v2WSwOssaHRQ=;
        b=cuN8KyO+0R6rK2uyCrxBZDNZDn4nf0cPAGoqddUys6pF/t9XiUz1wJslyFtU0qGnCa
         zqvUdnIxexLoBw/Tmzwmt820QQeaBXzH+B46pQp7JgHcj206dM1USb4vlW5622wkUnug
         eGf9PvPiufAIu7Lvdj3qchza9wB7K9UDZfbCub4+oc4cmK5D5rmK0REDIE5zZaECuBsq
         +CkcmD701rzxGc98OmC8HmtUzmg/p1kVq+tvnS+Jyg6DmSAjGZB7KLwWZMFcHXRS44/l
         N3Y+gRxhb5GkFZJHyPe7Ol/TO0e4tgAFula8q2nHt+Ad2EZkiz93fFm+wleG2e0YjnmX
         uVJQ==
X-Gm-Message-State: APjAAAXn+pDI4rPYc8DAq5dAXPiDPcdKMNQULiXDtlrgo+p7pEYsNSj+
        VHi838HGmDhvSxAtOwkSB+yzbpfKVBaZzg==
X-Google-Smtp-Source: APXvYqxakFl9eLHieRjoAaUSU2zOBUi34dFLJm/gSSoffPHUig/VzRi5rvqQMDwocJO4LGRiZoJURQ==
X-Received: by 2002:a1c:9e92:: with SMTP id h140mr4588656wme.82.1559085295535;
        Tue, 28 May 2019 16:14:55 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k2sm376779wrx.84.2019.05.28.16.14.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 16:14:55 -0700 (PDT)
Message-ID: <5cedc0ef.1c69fb81.58922.207f@mx.google.com>
Date:   Tue, 28 May 2019 16:14:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-82-g9bec226d8c79
Subject: media/master v4l2-compliance on vivid: 235 tests,
 0 regressions (v5.2-rc2-82-g9bec226d8c79)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 235 tests, 0 regressions (v5.2-rc2-8=
2-g9bec226d8c79)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-82-g9bec226d8c79
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  9bec226d8c79fcbc95817b082557f72a79d182f5


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 117 total: 117 PASS   0 FAIL   0 SKIP=
  =

  =

=20
