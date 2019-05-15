Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD11E1FA4D
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 21:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfEOTE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 15:04:57 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:32894 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbfEOTE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 15:04:56 -0400
Received: by mail-wr1-f41.google.com with SMTP id d9so718084wrx.0
        for <linux-media@vger.kernel.org>; Wed, 15 May 2019 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=10bPrjJ+9qtZ8ostHG4PSwQG20zt6xAFMl33SWMzHTo=;
        b=rkZJ1NO7xAClB1r3aUt19VPoDnQugQFIoTQ2hF3bAYrpfGpqku0HN7gXwYz3kFj9YT
         R245P/ry/yhAVNQet/DkFi+TRNJ8zVcsxzUMm5n7ysG8JRmH3Wi+IrKCNENyAq11H/n4
         T1ei8wMzLz1IEGIEZCGkc1A8MKvNvK/ZNoNNNddqTfMuGmWSU5c/jDWylNi2Ay3fQHtC
         yf5BOaqivHdAfKh6gWicCZ4nH2Dokzr4kImDVVxgcj+h/kr1Uqm4uxm4NvJwwgpx5d0g
         4BVI5VHeAozPNMAcJ5sx5glXY3fZ75kolTCDICus9ukm3HSULuldb6lMiNLdeJcaCYET
         +Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=10bPrjJ+9qtZ8ostHG4PSwQG20zt6xAFMl33SWMzHTo=;
        b=lAMC/wvRmTh0LuwycgfL+MrwHTYTbn6SqZ/UoLGTSrhJpufAg13ySxX3dESoHizwKP
         N1qjUvNdXo6DcUjngTyf3D4xh0J9oKfot+pIeYZ84B3fBCsZtBxu5X7252DiUYvnjzox
         9XKpYj693OzauBxeOADVlQ7at92PEX0/wMdfc471Z0UXTpen30R3qKqyHZVKLd20dQYz
         LXvSgSfr8uLeSgJ+qMZJz+eM0nKTBPD33T+K3q7tpK4M15J4zbRXlrWZUMg5/kLphgV3
         mjpT+wLcdxL6QKlqlnht2QNJ0Hao3/Qjay26LmMf+Su/Uo0miqZI8BtoP30NrHhiQTrB
         K6/Q==
X-Gm-Message-State: APjAAAUTV4r6ANNIOgPEfxo6wIptHZPpbseAmVCss1PwoYGdU0QLE+g/
        7xr7zwYyPtqO9ap02OFhfhqJ8Rhh7s1U3g==
X-Google-Smtp-Source: APXvYqweQI3H59u7b2FatJiQ3F9Fi3BLS3ohAqxA9CbF3NxMs9Ss7KYdPwCDmnDpvrV0ALJZzxIHaQ==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr9211137wrw.261.1557947095137;
        Wed, 15 May 2019 12:04:55 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f6sm1959258wmh.13.2019.05.15.12.04.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 12:04:54 -0700 (PDT)
Message-ID: <5cdc62d6.1c69fb81.31322.a901@mx.google.com>
Date:   Wed, 15 May 2019 12:04:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: media
X-Kernelci-Branch: master
X-Kernelci-Kernel: media_v5.1-2-16-gfc8670d1f72b
Subject: media/master v4l2-compliance on vivid: 236 tests,
 0 regressions (media_v5.1-2-16-gfc8670d1f72b)
To:     linux-media@vger.kernel.org, kernel-build-reports@lists.linaro.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media/master v4l2-compliance on vivid: 236 tests, 0 regressions (media_v5.1=
-2-16-gfc8670d1f72b)

Test results summary
--------------------

V4L2 Compliance on the vivid driver.

This test ran "v4l2-compliance -s" from v4l-utils:

    https://www.linuxtv.org/wiki/index.php/V4l2-utils

See each detailed section in the report below to find out the git URL and
particular revision that was used to build the test binaries.


  Tree:    media
  Branch:  master
  Kernel:  media_v5.1-2-16-gfc8670d1f72b
  URL:     https://git.linuxtv.org/media_tree.git
  Commit:  fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f


1  | qemu                   | arm64 | 118 total: 118 PASS   0 FAIL   0 SKIP
2  | qemu                   | arm   | 118 total: 118 PASS   0 FAIL   0 SKIP=
  =

  =

=20
