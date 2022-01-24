Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3337249863B
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 18:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244162AbiAXRQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 12:16:35 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:51168 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244654AbiAXRPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 12:15:11 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4JjGnq1F8vz9vFC8
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 17:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UgAyOibvZvAY for <linux-media@vger.kernel.org>;
        Mon, 24 Jan 2022 11:15:11 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4JjGnp6FrGz9vFBt
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 11:15:10 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4JjGnp6FrGz9vFBt
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4JjGnp6FrGz9vFBt
Received: by mail-pl1-f200.google.com with SMTP id p5-20020a170902bd0500b00148cb2d29ecso3681255pls.4
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 09:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=390Z369C1NgAVDfHVFd06GPqJvUJJ6Covz6dC4YZpPs=;
        b=bImcnXy8fZy7F4dnGzUsw02MV9/8DVIGzU96NqOUAJi+y0l/xzshbFH+OUYSHiuoWM
         b9TwMoxjDBZjPQkqJ8p0HknNru4OYBFFbF7CmZ4ZRKIzBkSlX40S1pG7eEMu2lcBJF01
         b+/yhpSulOi4tu6iTtBtXdWdnHCpCWziYn876IfwP2dGmmKLI2ANAdUeVC7SIQRk4zO9
         9MZ5jaWkVw/OuhErY6Pve9OTyAufrUuaOC/89woviuBHLIkM6P4BLOaxrIvY+3rWWS1B
         GPdm5BRDlQnlelJ6RAIEDHiP+bweofWbwrFc0cFBAspGEf8dE0nfzw6kdKCpYRlF44AA
         I4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=390Z369C1NgAVDfHVFd06GPqJvUJJ6Covz6dC4YZpPs=;
        b=xehh8zcJK6ca20GbEuoVW3P0ijN89o4ZNocnQh/n55CROqvznqIj+vfkiU2kjquV/b
         M8YBilrlH3rfCqvkAUT6vzycw0glHhSeNCN2CeLqIWBQRuHioiaVYen6q4tWbhNT8SuO
         AbJmTeJqtJ031E9whTjlQqueUlCvcd0Yv3Q/un+j7BhPfm0NoyPcursYTPq27AYzzrI+
         cm7xNAdFACXeiabcdWKUsSH6a2FawQtgv+TpJdQCpvbMMtj0Uj8oOUAPjyy8b88YytZ5
         3VpeZGG6KfmkucwVC6VD1o5LZRhWiwvz9ESdDcF/gHXeLFXYdt3MjT7TyoqqLZlJzq+T
         4fMQ==
X-Gm-Message-State: AOAM533eWfcnOmeQEf8EtiDRpGHGkNr+lwrB1SSsG9S5EoPmYLkFQDeU
        acun8XmPCiszpTe3Z3g9s9PA5weM7ilXisePclieKD6MF9Pi9AuJ7aWuRtP1OoMC/IqfQjmL2pO
        o/GCIAX3mx9KurMx11ly96mt80fY=
X-Received: by 2002:a62:e210:0:b0:4c9:1cff:15cc with SMTP id a16-20020a62e210000000b004c91cff15ccmr2439277pfi.55.1643044509982;
        Mon, 24 Jan 2022 09:15:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx84cDfl3K1Yzlm2R96/QreAAV4PPWN7pVVziLRsV/a1l3TVNWg71tyUX9SHuxKcq+2egH2Mw==
X-Received: by 2002:a62:e210:0:b0:4c9:1cff:15cc with SMTP id a16-20020a62e210000000b004c91cff15ccmr2439258pfi.55.1643044509740;
        Mon, 24 Jan 2022 09:15:09 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
        by smtp.gmail.com with ESMTPSA id 197sm462785pfz.152.2022.01.24.09.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 09:15:09 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-vcodec: media: mtk-vcodec: Fix a NULL pointer dereference in mtk_vcodec_fw_vpu_init()
Date:   Tue, 25 Jan 2022 01:15:03 +0800
Message-Id: <20220124171503.61098-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In mtk_vcodec_fw_vpu_init(), devm_kzalloc() is assigned to fw and there is
a dereference of it right after that, which could lead to NULL pointer
dereference on failure of devm_kzalloc().

Fix this bug by adding a NULL check of fw.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 46233e91fa24 ("media: mtk-vcodec: move firmware implementations into their own files")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
index cd27f637dbe7..33ae88a9f9da 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c
@@ -102,6 +102,9 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
 	vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_handler, dev, rst_id);
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
+
 	fw->type = VPU;
 	fw->ops = &mtk_vcodec_vpu_msg;
 	fw->pdev = fw_pdev;
-- 
2.25.1

