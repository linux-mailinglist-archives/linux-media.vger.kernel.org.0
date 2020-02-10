Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC74D156E1A
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 04:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgBJDyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Feb 2020 22:54:11 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54253 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgBJDyL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Feb 2020 22:54:11 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so3595293pjc.3
        for <linux-media@vger.kernel.org>; Sun, 09 Feb 2020 19:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XGTENEjJ0+z+1EMrz+JrOfyO1gcPOMBNtUwze/u53KI=;
        b=He3CPtJv9IthCFqDIfd5GI3rJaw5+1kbpKBDyO7Wh+3kXUrMjKjh0CrcU+HW+xzZCr
         miz1L40jFvrEay6sQy8PjEMqFuo9NyFaimnfRq1NeGccaMAhHQcmx/siFCBt7B0SexUk
         /PZeCvkoEg7mEk1YNJcZ5d4a0eFn7hI/WNdyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XGTENEjJ0+z+1EMrz+JrOfyO1gcPOMBNtUwze/u53KI=;
        b=nV9YXM3SycDDJNQtXotwoDLrw1oQD8PermNd0cq6oYmEEQpSWDavNxW2gd11eIKcuB
         fcvwGy+4jW3Wi/7koU9R11IPtR4aJWzk7nyQ5c6VCeHmKEPGVuJ6cWkcKqF4WMRFtvG9
         ZrDeNKRCiaTvt+gql4IJmF/3MYQncYPIvvEtqcPvOJSIga/r0njjqX67HmBPO5PMJLko
         D9pLiQGB8qFN5kHd6KqFQTfY0O9pAhQIqd1DFmzH2m1dJge2a1ys52K3FLtvgbnchxAI
         Fi+LUXXkkuhqm7+zmFzfsyQtowBtCSvKK7U9wtAg97VT4aURcJMjf9H0kPQlnHNcdctu
         gs+g==
X-Gm-Message-State: APjAAAWFXGshBY4Gn3DhiEqN7ej4GHzQRioIX6MdTgwmYrQpfVbjRGmZ
        v4q4FiNohkCVWWdlvVGBN9grbw==
X-Google-Smtp-Source: APXvYqztMKtN5f2EXAltVefsi/KgAfmMtI7mmcAMBhBpCsFWH61jBs7TaCyvdwU2IC6/picaXka25A==
X-Received: by 2002:a17:902:567:: with SMTP id 94mr10741617plf.174.1581306848902;
        Sun, 09 Feb 2020 19:54:08 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id c26sm10568151pfj.8.2020.02.09.19.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 19:54:08 -0800 (PST)
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
Subject: [PATCH] media: mtk-vpu: avoid unaligned access to DTCM buffer.
Date:   Mon, 10 Feb 2020 11:53:52 +0800
Message-Id: <20200210035351.227499-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
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
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index a768707abb94..e705e85d6f5a 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -600,13 +600,16 @@ int vpu_load_firmware(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(vpu_load_firmware);
 
-static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
+static void vpu_init_ipi_handler(void __iomem *data, unsigned int len,
+				 void *priv)
 {
 	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
-	struct vpu_run *run = (struct vpu_run *)data;
+	struct vpu_run __iomem *run = data;
 
 	vpu->run.signaled = run->signaled;
-	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
+	memcpy_fromio(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
+	/* Make sure the string is NUL-terminated */
+	vpu->run.fw_ver[sizeof(vpu->run.fw_ver) - 1] = '\0';
 	vpu->run.dec_capability = run->dec_capability;
 	vpu->run.enc_capability = run->enc_capability;
 	wake_up_interruptible(&vpu->run.wq);
-- 
2.25.0.225.g125e21ebc7-goog

