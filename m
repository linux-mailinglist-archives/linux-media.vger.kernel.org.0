Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E780E16EC74
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 18:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731256AbgBYRYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 12:24:46 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43409 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbgBYRYp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 12:24:45 -0500
Received: by mail-pg1-f195.google.com with SMTP id u12so7185438pgb.10
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lfotpKjLU7BxU2unCoAL0OLP6JpkqZvfhxJOwfxAYmg=;
        b=ltTXZwDqi3bj0f4va6iSNa+noIAQ6niJVSGeslx5czOaMstk4QGvtQQBXCIA5DdolR
         n4MHGW+hII0IRLuu5vH5+ECcXvVBUIxDWvuiepyhTBqQbzFDKU5Eg6L51TGu0NJl6T2d
         4Aj3Fnggf+FTY9ad5BqpOrZyLPt3CvCy1aEd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lfotpKjLU7BxU2unCoAL0OLP6JpkqZvfhxJOwfxAYmg=;
        b=EsoAWt2ZLtVICByHUwbA0512Y3i+LYq/ZrbbZZk3Xg+TPbLIKrmmha9miXTFZjKG6T
         O4YdXw7APWtULduc7j6J+rpSaVOD4yEkOyTxh7vztB+9rukw+9O7921nzPIOVe8T55QR
         Wnxh0JEuiBFCo4on9O0cQ8T/PNK4yBq6MWCxG9Ma35nTziepPlw20QtJUqs7q34NqkRV
         c4quMIf6MfelinuDZ+HNnJjk69ZtP7knCvYmQC3B4jWq2ruGsU67to4Yf9e41358gR7b
         CkYI5LbG0mYIVUX6X/BfVmXX6U9EYxC0cjaOVXD3+Pj2ifWr8UMgA6n6+ii5zHZ4tL2D
         VHsg==
X-Gm-Message-State: APjAAAXXwqlPiZqYRh1CWdqTMXFlgT93GoOC1ESXwHD0IP2bqxnJUbfd
        LlHoj3qXxtUwi4Vw9zbqzo6XBA==
X-Google-Smtp-Source: APXvYqwArngtth7ItH3EpE8LH8S4j/eVAVVg6AqEvqOu3xoUF1RjeEXBYLVRxkXdit5VDdriBk3z6w==
X-Received: by 2002:a63:cf06:: with SMTP id j6mr39603191pgg.379.1582651483432;
        Tue, 25 Feb 2020 09:24:43 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id a17sm11099378pgv.11.2020.02.25.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:24:42 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: mtk-vpu: avoid unaligned access to DTCM buffer.
Date:   Wed, 26 Feb 2020 01:24:37 +0800
Message-Id: <20200225172437.106679-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
Tightly Coupled Memory) buffer shared with AP.  It's not able to do
unaligned access. Otherwise kernel would crash due to unable to handle
kernel paging request.

struct vpu_run {
	u32 signaled;
	char fw_ver[VPU_FW_VER_LEN];
	unsigned int	dec_capability;
	unsigned int	enc_capability;
	wait_queue_head_t wq;
};

fw_ver starts at 4 byte boundary. If system enables
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr

Copy the string by memcpy_fromio() for this buffer to avoid unaligned
access.

Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change in v3:
- fix sparse warnings.
Change in v2:
- fix sparse warnings.
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index a768707abb94..e3fd2d1814f3 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -603,12 +603,14 @@ EXPORT_SYMBOL_GPL(vpu_load_firmware);
 static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
 {
 	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
-	struct vpu_run *run = (struct vpu_run *)data;
-
-	vpu->run.signaled = run->signaled;
-	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
-	vpu->run.dec_capability = run->dec_capability;
-	vpu->run.enc_capability = run->enc_capability;
+	struct vpu_run __iomem *run = (struct vpu_run __iomem __force *)data;
+
+	vpu->run.signaled = readl(&run->signaled);
+	memcpy_fromio(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
+	/* Make sure the string is NUL-terminated */
+	vpu->run.fw_ver[sizeof(vpu->run.fw_ver) - 1] = '\0';
+	vpu->run.dec_capability = readl(&run->dec_capability);
+	vpu->run.enc_capability = readl(&run->enc_capability);
 	wake_up_interruptible(&vpu->run.wq);
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog

