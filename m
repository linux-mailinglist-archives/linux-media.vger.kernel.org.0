Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD912D198
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 00:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfE1W2o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 18:28:44 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:40807 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbfE1W2o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 18:28:44 -0400
Received: by mail-wr1-f46.google.com with SMTP id t4so250126wrx.7
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 15:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2keHTMI0tR3BpwKPvlcxzZppVbFWziiLopjzLRy/T3o=;
        b=0W5OrofrkPZpB4/kW2VfVCTNDvkQ4H1QuJG/MNIY0t5bCCG1iDpusrLgYzgFgaS008
         l3BV1pAenxDq5QH1yX8rR/+LjU/gELymYWPUEo5ur1P8oVBBZG91JBDjVrvL35i4FEDN
         2jgQtY03WBj3SgDs2yX2H/ckFbLFKtDZDU+T0vXiH+3flVw3HaFq8IvEkfmzrKsddkXT
         atSSOgEkW+QS4ggn6ITIFJyCWb97OzNhrXzdsPKD6i8PRi8op6uFIJL5BSVb35o+h0Hs
         vEePLg1NlEDSW+15FxQueR6WQgJ8praeSSP4Ot5gJHcIygIpFwaVCRvcHvUkVH7RXXTM
         qkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2keHTMI0tR3BpwKPvlcxzZppVbFWziiLopjzLRy/T3o=;
        b=jNvf6wQSW0gmpGpaBJ/i7AOTEETczb0Pt3GW8AOa6FDZgmD7uXXx9Ti6p3wW/zOSx2
         rorTs/AOFtu/kX8nsK7bZOJj1vH372eBxVJKquOThgAKRsqXHN6ROFALwMEgOQV5s8Ll
         Cr9Lv3KAGWTFNhMjnqm7qahb13sfJpqvcAMQIugfsA+bAp+CH/gAul44jRtGUXNsheCy
         /EpwLm5xhOd+kVYwWAqOJEvmTU2L4r0p2SYiQPZ0yhJ2tIollVt1KyLfQFgEc6CsiSJS
         MXmn9vKv/AUnJj6t6Gb2dDdSFGHlYRqnCYhZQUOvgVX3U1POv2JTh38/nOKw9qtOd+iZ
         aUeQ==
X-Gm-Message-State: APjAAAV6uZMNDQUegFybn5tqRmzef+VnYqouaI0nKcqYBrSaoTaYRQ23
        vLAvQDVTRPJcMCzjexTWt3/vqx2AwTZ1NA==
X-Google-Smtp-Source: APXvYqz8ASdm/yoy/2FVUY7W6v44BxYztqBob+Hma1tVp8PPg+3MXx9tJqA7ypXh21Sf8wFiezQtVA==
X-Received: by 2002:adf:e94b:: with SMTP id m11mr714075wrn.133.1559082522497;
        Tue, 28 May 2019 15:28:42 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c63sm4466717wma.29.2019.05.28.15.28.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 15:28:41 -0700 (PDT)
Message-ID: <5cedb619.1c69fb81.6f18.8ba2@mx.google.com>
Date:   Tue, 28 May 2019 15:28:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc2-98-g39cb46751e2f
Subject: media/master v4l2-compliance on vivid: 236 tests,
 0 regressions (v5.2-rc2-98-g39cb46751e2f)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 236 tests, 0 regressions (v5.2-rc2-9=
8-g39cb46751e2f)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  v5.2-rc2-98-g39cb46751e2f
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  39cb46751e2fbb72e0698f80e339db1fd4e1f50e


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP=
  =

  =

=20
