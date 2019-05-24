Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1786629D52
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 19:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731913AbfEXRkN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 13:40:13 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:41512 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbfEXRkN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 13:40:13 -0400
Received: by mail-wr1-f42.google.com with SMTP id u16so6924098wrn.8
        for <linux-media@vger.kernel.org>; Fri, 24 May 2019 10:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lWnSuaqVPjgN2snJdj1wTjpvQKQgx7BiruKYoDjOVqk=;
        b=YypSgLag1k240N3INrDq7aLpwzJiQqArWehKADntOYXCDFLXvbkHVJm8TQCAw3IgAe
         xjhQYDAF5qTvcpP+lNNV6+ZjR0CtKRPFHBwjBjJ95pvQWq2YPizvwIPWbGwt1cCfoDv1
         0SDT5May+Wt3v/0rpOUq2QG2b/uLFXrUSZMrYiU/ynbTqLEWiHn+v8fTaBXMdbIgI0Px
         ACz39b+3dy+iHjqtvMWyoSFpN4OwqL7mjOsczwTGW08hlwuLYnw1GAoLm1ggfAYOBvTR
         DucZs8AcEcKYPGrrHCrhPwJQK8Yj8zLclrKBYzaSKBhjU+FxKYTYO4CmNsKjc3Mh/bRt
         FDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lWnSuaqVPjgN2snJdj1wTjpvQKQgx7BiruKYoDjOVqk=;
        b=loyidLoAjFA3hISGs4wLb2BT9lf4eJQ4Soq96hcpOKHS+PuGRlJvceBw1shHYgmTOr
         aN0giQIcaWiZxIZKUkW0cxxdlnv38uftZLQZH5qOdcAfuEYBMpqmA2lPFKlDj1D2p/6l
         kdDI/1PesMXjqRAaVebk5s/+dLlYlHY5azm2/YyKuDcYPW6pfFeGxF6Nrp/xtHoQAJvp
         zyCvyxCTaEKNBRTZI06ZxY/lWCFA4LLOfHyTvDOMreRZG0E+q3CuNEJZluqoyKZaT4uq
         2AsWcBeIGf0raVYICqlE2OtSVRtjf3RjIdyhR0g9G/r701QFJ3M5OHIrAbKv9eOSpA3n
         msWg==
X-Gm-Message-State: APjAAAWkSTTnhc8I/g3ZXw2a11Rb/Ib+W3Hy0ZjMT50WbxAf0nHK09QR
        yy+w7ovfwHP0cZKqVUAMNdu7z2u6ELQ+9g==
X-Google-Smtp-Source: APXvYqxK9XEb3uCvCEoRXN3TEkCnmzVKa8LqwTztKw1q0nLQC+xAQftuVLwyGctvTclbz+g9gfjXxA==
X-Received: by 2002:a5d:6807:: with SMTP id w7mr905623wru.336.1558719611745;
        Fri, 24 May 2019 10:40:11 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l18sm3438172wrv.38.2019.05.24.10.40.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 10:40:11 -0700 (PDT)
Message-ID: <5ce82c7b.1c69fb81.9f701.40f4@mx.google.com>
Date:   Fri, 24 May 2019 10:40:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc1-53-g2f39cce96363
Subject: media/master v4l2-compliance on vivid: 236 tests,
 0 regressions (v5.2-rc1-53-g2f39cce96363)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 236 tests, 0 regressions (v5.2-rc1-5=
3-g2f39cce96363)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc1-53-g2f39cce96363
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  2f39cce963637eee1c58740859c7c63356c29099


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP=
  =

  =

=20
