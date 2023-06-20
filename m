Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3428473604F
	for <lists+linux-media@lfdr.de>; Tue, 20 Jun 2023 02:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjFTAEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 20:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjFTAED (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 20:04:03 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E2A1AD;
        Mon, 19 Jun 2023 17:04:01 -0700 (PDT)
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E4FC56605992;
        Tue, 20 Jun 2023 01:03:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1687219439;
        bh=dRdASRjcg3gh8xdvmAjk5IeDVNUJ5py/Gpoxgpqy9mM=;
        h=From:To:Cc:Subject:Date:From;
        b=c2E96qafu1qO5q5VvpdtSbfzvaJQJ/BYXbg1YV3/zV3XEg94ANjku3aPaOBpd1VNu
         FFyr9eVuYPxoASrBzh3WqKv2UAM6PdEob2sUpK/3SB1U0X3I7HCw54DQj6XY6kL2VV
         mGVjV4ql2soeAUhDL17nF8CvAWe1LBUiHVWpe1xO/2vhAVddRSiUNx+ufQn2p+A+Zq
         EzvU0M/VewaI8oUYn0PQv9+1/UygIABJNvE8I45ZtE862nBPhGcvkychinTaIoE1J3
         JqEiP1yBVjLxZVHcKSaPyrodhKXabm7jhhE2ugQb/ozFLhtNf9vOAOH7ZEiLfsopJR
         WiZIlby23js5Q==
From:   =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/6] Enable decoder for mt8183
Date:   Mon, 19 Jun 2023 20:03:33 -0400
Message-ID: <20230620000349.2122191-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


This series enables the hardware decoder present on mt8183. At first
glance, the only missing piece is the devicetree node for it, however,
simply adding it as is would cause an address collision between the
first register iospace and the clock-controller node, so a rework of the
dt-binding and driver, as well as addition of a new syscon phandle
property, were needed first.

Tested that H264 decoding works with the hardware decoder on
mt8183-kukui-jacuzzi-juniper-sku16, giving a fluster score of 98/135 on
the JVT-AVC_V1 test suite. And ensured other SoCs (MT8192 and MT8195)
still work as usual.

Changes in v3:
- Switched the handling of the VDEC_HW_ACTIVE bit to use a syscon
  instead of the 'active' clock

Changes in v2:
- Merged commit 1 (media: dt-bindings: mediatek,vcodec: Allow single
  clock for mt8183) into commit 3 (media: dt-bindings: mediatek,vcodec:
  Remove VDEC_SYS for mt8183)
- Further constrained properties in dt-binding
- Added CLK_IGNORE_UNUSED flag to active clock
- Reformatted reg-names in DT node

Nícolas F. R. A. Prado (5):
  media: dt-bindings: mediatek,vcodec: Allow single clock for mt8183
  media: dt-bindings: mediatek,vcodec: Don't require assigned-clocks
  media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS for mt8183
  media: mediatek: vcodec: Define address for VDEC_HW_ACTIVE
  media: mediatek: vcodec: Read HW active status from syscon on MT8183

Yunfei Dong (1):
  arm64: dts: mediatek: mt8183: Add decoder

 .../media/mediatek,vcodec-decoder.yaml        | 69 +++++++++++++++---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 30 ++++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      | 71 ++++++++++++++++---
 .../mediatek/vcodec/mtk_vcodec_dec_hw.c       |  4 +-
 .../mediatek/vcodec/mtk_vcodec_dec_hw.h       |  3 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  1 +
 6 files changed, 153 insertions(+), 25 deletions(-)

-- 
2.41.0

