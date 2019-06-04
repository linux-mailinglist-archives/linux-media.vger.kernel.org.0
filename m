Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2DE634353
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfFDJhx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:37:53 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44492 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfFDJhx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:37:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id n2so10012680pgp.11
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 02:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7TVSYqt0AsB7YJ3Xxm3mitaiZCuCIy+XhLVxFHTQpdU=;
        b=TtcFDUOJBTX4fU2GOjsgZOopz/xtxGVoz+Nwp22m4PeQyBKJ/joM9EAJNiIaRtoJ7H
         oKJ7hUmAgn59md500Nmzbpi8IoyMiB2Iq0+TXblIz4ZaTZKDAJSWjm7DG1PdYmhTUcj/
         j0dio82Tr0LUwlE4i2DbfXKQLb0EWq1oljcJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7TVSYqt0AsB7YJ3Xxm3mitaiZCuCIy+XhLVxFHTQpdU=;
        b=pbiNUV49lcxhSVmgwQSmcHNsW3GHJM3Zlo2HYDfSn1DQV6ypjAN9+iaavMKUO6RgXF
         319gSFs8kYXu/eUFwIKQCC3NVHA+i1DIy0Qyp7cfC8kwBrTxpnA4ffTmP55q494ciPcV
         CDGVbH6rrWAQf6rCrVVmVesQeDzvvt448WnMg+2MhAQpmzB2zhtgu0grWHG+6zM6Rh6Q
         7M/5318SAA8Y3Gb36hkQ5J0NbCdvNh5jXbQiR/KiTZePzhZIRhn3HmFbxrfNRiqQwNLE
         /MqeibvhwesL1EeuOt7DMaV5uu4/Sxz9xQrQJrGlN3J0JNMYpyZpi8y+tdZbB/JmpAzG
         oJDQ==
X-Gm-Message-State: APjAAAWnKsFYrHlrLlIeTpC6LQT6SaCwsgXiGKlOGiLLvV2VpLlAmPTS
        cq5Z5VavVIF6E2txiSp9wE+XpA==
X-Google-Smtp-Source: APXvYqygJscPGYv83kU8NoDlzGvEBMrfVK4hfkmv7ZiRjnzxo6G3Ih+KPMJupDZ/zyViHMve6I+sDg==
X-Received: by 2002:a17:90a:dd42:: with SMTP id u2mr35787654pjv.118.1559641072459;
        Tue, 04 Jun 2019 02:37:52 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id j7sm17431588pfa.184.2019.06.04.02.37.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 02:37:51 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 0/5] media: mtk-vcodec: cleanups and fixes
Date:   Tue,  4 Jun 2019 18:37:32 +0900
Message-Id: <20190604093737.172599-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series extracts the cleanup patches from the RFC of MT8183 support [1] as
these patches can already be merged. MT8183 support will be sent separately.

[1] https://patchwork.kernel.org/cover/10963769/

Changes since RFC:

- Replaced all GPLv2 headers with SPDX

- Replaced EXPORT_SYMBOL with EXPORT_SYMBOL_GPL

Alexandre Courbot (4):
  media: mtk-vcodec: replace GPLv2 with SPDX
  media: mtk-vcodec: avoid unneeded pointer-to-long conversions
  media: mtk-vcodec: remove unneeded proxy functions
  media: mtk-vcodec: constify formats

Yunfei Dong (1):
  media: mtk-vcodec: support single-buffer frames

 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 45 ++++++++-----------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      | 19 ++------
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 34 +++++---------
 .../platform/mtk-vcodec/mtk_vcodec_enc.h      | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_intr.c     | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_intr.h     | 14 +-----
 .../platform/mtk-vcodec/mtk_vcodec_util.c     | 15 +------
 .../platform/mtk-vcodec/mtk_vcodec_util.h     | 15 +------
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   | 35 ++++-----------
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    | 36 ++++-----------
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    | 37 ++++-----------
 .../media/platform/mtk-vcodec/vdec_drv_base.h | 22 +++------
 .../media/platform/mtk-vcodec/vdec_drv_if.c   | 29 ++++--------
 .../media/platform/mtk-vcodec/vdec_drv_if.h   | 15 +------
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  | 15 +------
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   | 14 +-----
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   | 14 +-----
 .../platform/mtk-vcodec/venc/venc_h264_if.c   | 36 +++------------
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    | 35 +++------------
 .../media/platform/mtk-vcodec/venc_drv_base.h | 25 +++--------
 .../media/platform/mtk-vcodec/venc_drv_if.c   | 27 +++--------
 .../media/platform/mtk-vcodec/venc_drv_if.h   | 17 +------
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  | 17 +------
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 15 +------
 .../media/platform/mtk-vcodec/venc_vpu_if.h   | 15 +------
 32 files changed, 114 insertions(+), 562 deletions(-)

-- 
2.22.0.rc1.311.g5d7573a151-goog

