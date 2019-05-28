Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE43E2CB8A
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfE1QO5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:14:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35573 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1QO5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:14:57 -0400
Received: by mail-wr1-f66.google.com with SMTP id m3so20903454wrv.2;
        Tue, 28 May 2019 09:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t4fNuHNyNd5YWtEhF5ffcGp/LQDSV+yF804x4uNxMPE=;
        b=dpSBRvHt0/ewBa230CkxQ60kS10EXTbLJLifOiTz4RZTmmVQM2vRxd8unWYqDmUSp1
         EWsPKepGFokj30p8xyfx9N5JbPdIdmzXmtwJ5yCZzrVMUzKYIAwT/jiF01HS8hw4eLWr
         d0NGjVfDfY4kil+Qc6Fdv1HRNLbyoU3Pq6Pi9O1CbkrNKQnOdbhOmnP5dkgmvqh/nsQV
         /JnIjF9xrxK7zJogasjEBQQLi/HcVDwlhtzjYOKAL3boLxE9eQHAtEKwMZboHXbe9ceT
         J2KmGaSgXRZDu6/jnLSjhSkwUmHBOYmKcAkK/mj9QzazUi0O6ts7tYwxfYK6ge5prHq5
         dlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t4fNuHNyNd5YWtEhF5ffcGp/LQDSV+yF804x4uNxMPE=;
        b=VDLuMsxVMaFoLDMDphgNBTE5CNfIF1A6aj5IYkKrNMtS4EEYuS2E36kgSCC56PlK4i
         XvUWgwYbdxx3pxbPzNM4RjSlraV/a87dTH/XvKmjULc5kO7sJYgK7xO9XsOxDTRAwBmH
         ewWUdWRNTldLgrHCe9k0cQfZFRHRH1W/gx3VvdHfKe7wv5a52BDxwBZf/jl6aL3vu+I5
         rASPvL5tUgVIfK/6fojYcEO+/GuEP+5SSE9gmgFGLYz8K2ZgVDpKC7lXJ4trC6ZYfmeS
         q3ug7gvjrU7PPwXXPVuB+MQCt4dlUwFxkzpEALWxyOA/1klM9WojmhC02vL9Rs5/2KE4
         tBVQ==
X-Gm-Message-State: APjAAAU853ghIiHAdIQhEa+bNAu0snXpR/n7vobLvKuyA5aD472C3SYa
        2/qk8/CSbQs4S/FqiKsWcMQ=
X-Google-Smtp-Source: APXvYqwz2aW7Eu9zLK7jrGuM0szO6rQV52q6NbuzpwC4zNuAynJd1LRd/HFIVRILdoCmMC8bYpqUyA==
X-Received: by 2002:a05:6000:1285:: with SMTP id f5mr9066145wrx.112.1559060094876;
        Tue, 28 May 2019 09:14:54 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net. [37.60.189.18])
        by smtp.gmail.com with ESMTPSA id l14sm13678787wrt.57.2019.05.28.09.14.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 09:14:54 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 00/12] Allwinner A64/H6 IR support
Date:   Tue, 28 May 2019 18:14:28 +0200
Message-Id: <20190528161440.27172-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

A64 IR support series[1] pointed out that an A31 bindings should be
introduced.

This series introduce the A31 compatible bindings, then switch it on
the already existing board.

Finally introduce A64 and H6 support.

I didn't enable the IR on other H6 boards as Ondrej reported an issue
on his board[2].

Regards,
Clément

[1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
[2] https://lkml.org/lkml/2019/5/27/321

Changes since v2:
 - Disable IR for other H6 boards
 - Split DTS patch for H3/H5
 - Introduce IR quirks

Changes since v1:
 - Document reset lines as required since A31
 - Explain the memory mapping difference in commit log
 - Fix misspelling "Allwiner" to "Allwinner"

Clément Péron (10):
  dt-bindings: media: sunxi-ir: add A31 compatible
  media: rc: Introduce sunxi_ir_quirks
  media: rc: sunxi: Add A31 compatible
  ARM: dts: sunxi: Prefer A31 bindings for IR
  ARM: dts: sunxi: Prefer A31 bindings for IR
  dt-bindings: media: sunxi-ir: Add A64 compatible
  dt-bindings: media: sunxi-ir: Add H6 compatible
  arm64: dts: allwinner: h6: Add IR receiver node
  arm64: dts: allwinner: h6: Enable IR on Beelink GS1
  arm64: defconfig: enable IR SUNXI option

Igors Makejevs (1):
  arm64: dts: allwinner: a64: Add IR node

Jernej Skrabec (1):
  arm64: dts: allwinner: a64: Enable IR on Orange Pi Win

 .../devicetree/bindings/media/sunxi-ir.txt    | 11 ++-
 arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 +++++
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 +++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/media/rc/sunxi-cir.c                  | 70 +++++++++++++++----
 11 files changed, 115 insertions(+), 20 deletions(-)

-- 
2.20.1

