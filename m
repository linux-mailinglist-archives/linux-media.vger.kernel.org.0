Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C94A48D4BC
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 10:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbiAMJID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 04:08:03 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.167]:62014 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbiAMJIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 04:08:02 -0500
X-KPN-MessageId: 382692cb-7450-11ec-9a2e-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 382692cb-7450-11ec-9a2e-005056abbe64;
        Thu, 13 Jan 2022 10:07:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:to:subject:from:mime-version:date:message-id;
        bh=6JFElnrkVrsOTDPsRRkYa5iuHbLbXNq51RJzEh+pER4=;
        b=dhIXaNB8e4lXp+EzqqIWUaMkUIzc7nSi44vTZa+zLCp4YxBchlhBMyl9iB0ixWIt5MDXuiP5OlDWm
         fDgwoksX4WKtCQlgZnX8DU1ldhNYncYnUC6WCiVoh/Tl4gfOHvI2o3RPl55YPylgXDAqfCAmIREqP2
         THF8F9HeRJ/1fsASd5QSWfUpAk8Ugs/zl6Mg+VybQHQBa3bMN9j7OqRIR1wybcoYXTiP2hrX/uAxGr
         HC62TC7RwVRhUIyDMKnRG38q64ZRJDai3uECsxnj8djNUQXO1y3tdzu8AMjB7Di1SznlKPKjPAzPyv
         wWJyde724urMIIRF0bKSS2AeK/2idug==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|efs5ySV8AQNXhMYAwhqPSDYPQ/EKtBZLAez2bTIipgW5Qd+gNqzSWS7CTBjK5yd
 Gsgc7LyeX6b4UmhQgkO8SUg==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 4dfbb0f7-7450-11ec-81f5-005056ab7447;
        Thu, 13 Jan 2022 10:08:00 +0100 (CET)
Message-ID: <bcc30b33-9ff6-6802-c2f4-440131b161dc@xs4all.nl>
Date:   Thu, 13 Jan 2022 10:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Content-Language: en-US
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.18] Support multi hardware decode using
 of_platform_populate
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:

  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.18d

for you to fetch changes up to 844e00f95147ff0c81e1d31a89ca5df25d1a983c:

  media: mtk-vcodec: Remove mtk_vcodec_release_enc_pm (2022-01-13 09:31:10 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Yunfei Dong (19):
      media: mtk-vcodec: Get numbers of register bases from DT
      media: mtk-vcodec: Align vcodec wake up interrupt interface
      media: mtk-vcodec: Refactor vcodec pm interface
      media: mtk-vcodec: export decoder pm functions
      dt-bindings: media: mtk-vcodec: Separate video encoder and decoder dt-bindings
      dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
      media: mtk-vcodec: Support MT8192
      media: mtk-vcodec: Add to support multi hardware decode
      media: mtk-vcodec: Use pure single core for MT8183
      media: mtk-vcodec: Add irq interface for multi hardware
      media: mtk-vcodec: Add msg queue feature for lat and core architecture
      media: mtk-vcodec: Generalize power and clock on/off interfaces
      media: mtk-vcodec: Add new interface to lock different hardware
      media: mtk-vcodec: Add work queue for core hardware decode
      media: mtk-vcodec: Support 34bits dma address for vdec
      media: mtk-vcodec: Add core dec and dec end ipi msg
      media: mtk-vcodec: Use codec type to separate different hardware
      media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
      media: mtk-vcodec: Remove mtk_vcodec_release_enc_pm

 .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml          | 176 +++++++++++++++++++
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml          | 187 ++++++++++++++++++++
 .../devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml   | 265 ++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt         | 131 --------------
 drivers/media/platform/mtk-vcodec/Makefile                          |   6 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c                  |   4 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h                  |   1 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c              | 178 ++++++++++++++-----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c               | 201 +++++++++++++++++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h               |  56 ++++++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c               | 105 ++++++++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h               |  11 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c         |   2 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c        |  21 +++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h                  |  74 +++++++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c              |  21 +--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c               |  10 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h               |   3 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c                 |  30 ++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.h                 |   5 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c                 |  59 +++++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h                 |   8 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c               |   2 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c           |   2 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c                |   2 +-
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c                |   2 +-
 drivers/media/platform/mtk-vcodec/vdec_drv_if.c                     |  21 +--
 drivers/media/platform/mtk-vcodec/vdec_ipi_msg.h                    |  16 +-
 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c                  | 290 +++++++++++++++++++++++++++++++
 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h                  | 153 ++++++++++++++++
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c                     |  46 ++++-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h                     |  22 +++
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c               |   2 +-
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c                |   2 +-
 34 files changed, 1818 insertions(+), 296 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
