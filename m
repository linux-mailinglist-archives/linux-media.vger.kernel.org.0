Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B805C459500
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 19:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240443AbhKVSu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 13:50:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240412AbhKVSuU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 13:50:20 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB69C061714;
        Mon, 22 Nov 2021 10:47:13 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id x6so69111395edr.5;
        Mon, 22 Nov 2021 10:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dss9UiKF+k7Po25DwSiusMM9IdCzuECfyUd1tTdrRbg=;
        b=Bhz5XvT0o10O8LdIN/VUhQiHJnLca2FPbI8x7F6PqhoK3FZcFJPU/UYdTpzylMMRg+
         6z0CYvdyYJZlEuRD5SbYMZ9PnFBhr9dY35NCq1Kle7ytd23z+8cMqeCungXc3aWTpMz0
         tb/czpATqWjnJdXSqa3lC4acLd1TwR8YAE9NFCSJwVh6IamtDXMmdvRaLe46ALA2iPte
         hh5UB0gbkaQW2zds/Y7XTpR7YGJe687hrvfuLO1dbcALrHS3HAwf0r7phkTVz0Nbdnbh
         Px1PyTlCdNoFDo0FZH6V0UU9F2llZKSKuBSBkF4HYP2Lk5fjiETmJ3KibLlgEawJZdLA
         Uv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dss9UiKF+k7Po25DwSiusMM9IdCzuECfyUd1tTdrRbg=;
        b=Bm2TKYbSceeJosx8jFmMHm96+QwvBLAzGrZrzoWp8OrVZgPvK0zENw+uiKGQanlK2+
         V2V379/TNujuv5B88DBFEUHxZrnWB/xsgq+w7tQnx2DM1vAMus32fXdvNgOlBT4pLaf3
         hc85IjdPByAad6qNnuHRWqtgyUctCHQzmN/z/HQYddRIiIHJaH/+Q1Sga7fgVNMNLpuu
         b0qwDO5h5RZoc3wuBFJ4F75Y/pprZuHRmuAhKvaI/Z7usDAmv8UpPgaKYiSmNRL5VagZ
         Z/outrvco1voODZlJb+vnESuv0xFDYq+n+ABu03CyM/0fci0SN+LQI5Kk+lYGkMg7B9k
         4L3A==
X-Gm-Message-State: AOAM531KYxqRKdiC//iTmhkz1gE/VsUpbnHDHyz7kkt0BG2jZOdp2C4W
        jSgTmOpFLAwwzKCL/DCUGU1KWBg2x4DIfg==
X-Google-Smtp-Source: ABdhPJzgdosbksPZCqL8fKg3cjtQpo/DXX2+PosZpuL8FSxSDz2AVuG1NfXCsxT1xLP2AzUNixo0fA==
X-Received: by 2002:a17:906:a215:: with SMTP id r21mr27612192ejy.21.1637606831875;
        Mon, 22 Nov 2021 10:47:11 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:11 -0800 (PST)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/7] media: hantro: add Allwinner H6 support
Date:   Mon, 22 Nov 2021 19:46:55 +0100
Message-Id: <20211122184702.768341-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone!

Here is patchset which adds support for Hantro G2 core found in Allwinner
H6 SoC. It is slightly older core, so it needs few quirks to be
implemented:
1. It uses slightly different register layout in some cases. However, those
   differences are small, so it makes sense only to add quirks.
2. It doesn't use ring buffer for bitstream as newer variants.
3. It needs double buffering to be enabled in order to work correctly.
4. postproc must be enabled at the end of the job. It seems that core has
   some issues with latching register values if postproc registers are set
   at the beginning of the job

legacy_regs quirk could be split into 3, like legacy_regs, ring_buffer and
late_postproc, but I didn't see the need for that. I examined vendor
sources at [1] and it suggests that legacy_regs implies no ring buffer.

It's also unclear if core supports HEVC decoding or not. This can be
implemented later. VP9 10-bit decoding support is mentioned in manual, but
it doesn't work at the moment. This will be addressed later.

Please take a look.

Best regards,
Jernej

[1] https://github.com/CliveLau1990/imx-vpu-hantro

Jernej Skrabec (7):
  media: hantro: add support for reset lines
  media: hantro: vp9: use double buffering if needed
  media: hantro: vp9: add support for legacy register set
  media: hantro: move postproc enablement for old cores
  media: dt-bindings: allwinner: document H6 Hantro G2 binding
  media: hantro: Add support for Allwinner H6
  arm64: dts: allwinner: h6: Add Hantro G2 node

 .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  64 +++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   9 ++
 drivers/staging/media/hantro/Kconfig          |  10 +-
 drivers/staging/media/hantro/Makefile         |   3 +
 drivers/staging/media/hantro/hantro.h         |   7 ++
 drivers/staging/media/hantro/hantro_drv.c     |  27 ++++-
 drivers/staging/media/hantro/hantro_g2_regs.h |  20 ++++
 .../staging/media/hantro/hantro_g2_vp9_dec.c  |  76 ++++++++++---
 drivers/staging/media/hantro/hantro_hw.h      |   1 +
 drivers/staging/media/hantro/sunxi_vpu_hw.c   | 104 ++++++++++++++++++
 10 files changed, 301 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
 create mode 100644 drivers/staging/media/hantro/sunxi_vpu_hw.c

-- 
2.34.0

