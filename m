Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7F9C680FF6
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 14:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236762AbjA3N6d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 08:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236705AbjA3N6c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 08:58:32 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DB83A863;
        Mon, 30 Jan 2023 05:58:13 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:e655:2335:9172:6e39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 24D9A660036A;
        Mon, 30 Jan 2023 13:58:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675087091;
        bh=RPbrmCUOIpq0gVkbEtOzsq+cJcNZI6nEsp8J93mhhRM=;
        h=From:To:Cc:Subject:Date:From;
        b=O1obHAzzOK/iWXu+eBJKrUtSNcZeWHgz5T2utiIzExkU2uY3tluYHkrziFb2u5goD
         5I4vjaHMcm/Nw1+7wKGK69YhjILTeRd+Lv4kAgk5kck9syu5yzpNsVSIj7v93l5jg9
         ewq7HstHhmAK1JPdlymOlsbYiv0uDaeSZ0wm9F2qxS3u7U0cdDp1AQLsT0LOX8nFJF
         wAcaawpcUztz3ocYw5PGFca9ZjVU87mi1YJExMDQokjR6AXvVARtckEgqAuzF8Qoe6
         Al62crU80k5NAbFqhAoQdXiVoxav0PAsCphys3yaAT56w9xitilv/Er4RFtKRDNK8A
         /s2Z96W1vvn5A==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.co.uk
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v6 0/5] media: verisilicon: HEVC: fix 10bits handling
Date:   Mon, 30 Jan 2023 14:57:57 +0100
Message-Id: <20230130135802.744743-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When decoding a 10bits bitstreams HEVC driver should only expose 10bits pixel formats.
To fulfill this requirement it is needed to call hantro_reset_raw_fmt()
and to only change driver internal state in case of success.

Fluster score (140/147) doesn't change after this series.

version 6:
- Split the patches in multiple sub-patches.
- Rework hantro_reset_encoded_fmt() usage.

version 5:
- Add Nicolas's review tags
- Add Fixes tags

version 4:
- Split the change in 2 patches.
- Change hantro_check_depth_match() prototype to avoid using
  ctx->bit_depth
- Return the result of hantro_reset_raw_fmt() to the caller.
- Only set ctx->bit_depth when hantro_reset_raw_fmt() returns is ok.

Benjamin Gaignard (5):
  media: verisilicon: Do not set context src/dst formats in reset
    functions
  media: verisilicon: Do not use ctx fields as format storage when
    resetting
  media: verisilicon: Do not set ctx->bit_depth in hantro_try_ctrl()
  media: verisilicon: Do not change context bit depth before validating
    the format
  media: verisilicon: HEVC: Only propose 10 bitscompatible pixels
    formats

 .../media/platform/verisilicon/hantro_drv.c   | 39 ++++++++-
 .../platform/verisilicon/hantro_postproc.c    |  2 +-
 .../media/platform/verisilicon/hantro_v4l2.c  | 84 +++++++++----------
 .../media/platform/verisilicon/hantro_v4l2.h  |  3 +-
 .../media/platform/verisilicon/imx8m_vpu_hw.c |  2 +
 5 files changed, 79 insertions(+), 51 deletions(-)

-- 
2.34.1

