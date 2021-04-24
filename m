Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFEE369E48
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 02:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbhDXA7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 20:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244294AbhDXA64 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 20:58:56 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC00C061238;
        Fri, 23 Apr 2021 17:52:11 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id c3so16337986pfo.3;
        Fri, 23 Apr 2021 17:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N2woOalQeKHSawx5nbGb6OzNBKaNOdG68Dymcml4HhM=;
        b=ExrpsinU0EU1btJ1yQ2K46y0VWIHSbK0RIk11sE59AAMMyS9L6Ra5tnnvsVAGjTUJn
         NTNCQ7Hmwr+5jzMgpFpHOXQ3ectpVi3QtVFOkLCtok8HCHfUfQGVd2JrRCrTAFSgPNkd
         Df3UNbfgBRD75Y0KGNoPSfNU+iW+2zJsTs/HOPGC2BDt1yeaFce+XP6+4+d043rQkUHr
         wd97rCcMEoyOBvLlUqCuEWkHKAlQMZLd31m91D6LlRIjvi1Dhizv3GmoT9qKpSxFseBw
         anAhXNWKKEM5nwrfjAV1hRwMhaRPlMzTFr7heAltg2vqhftO7g03sJmzvofrGl5a7aIy
         su2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N2woOalQeKHSawx5nbGb6OzNBKaNOdG68Dymcml4HhM=;
        b=E5JzZFhmbr5kmBppbB58kc7SN++BMTpDmepnlQ4MvbZrE3jmvM679jdyut+P03K4jO
         pIam5N8cxGQRR2XSSHmH6lxpYMd7F0NiiAxFVQ8l+2sWG+BpBOYvrpSTWpeYA2O+ay+q
         u7OO15HzQuFrHMShIynAxnATSC2PKzPq6YJ6bhYP8Ywv6yMJHwJz1egtMZbnieMV/WRh
         u6klwYBscUNB9Di+Ki2ImSek8csVlhG4GEhUau0AR6JmoPNs0g++iwRIlJ+rCa74XDSu
         RZnWm+TF0WDdmHyYnTvqWbJ+Ch7MIBDHGSIF05CJF0RgKdo+1GV2f/L5Qg298l/R5nE4
         +wGQ==
X-Gm-Message-State: AOAM533lVFBBloAkzocEJxb8G4Iycom++eYayn2OGDHFAumYvSsHkVss
        kXvt3MqG5Ffkvc5H395AnTQ=
X-Google-Smtp-Source: ABdhPJxNoAyWK4D49rzoFj1F4/s7/obtXcVV62pW7F47/PMODw3BJItS9tHZzSKHi76rB8KeG8wKtQ==
X-Received: by 2002:a63:e00f:: with SMTP id e15mr6208389pgh.317.1619225530745;
        Fri, 23 Apr 2021 17:52:10 -0700 (PDT)
Received: from tong-desktop.local ([2601:647:4200:13:9d7:3e7c:d3c6:83e6])
        by smtp.googlemail.com with ESMTPSA id r11sm4996150pff.192.2021.04.23.17.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 17:52:10 -0700 (PDT)
From:   Tong Zhang <ztong0001@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tong Zhang <ztong0001@gmail.com>
Subject: [PATCH] media: cobalt: fix null-ptr-deref when there is no PCI bridge
Date:   Fri, 23 Apr 2021 20:52:06 -0400
Message-Id: <20210424005206.261622-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

the PCI bridge might be NULL, so we'd better check before use it

[    1.870569] RIP: 0010:pcie_bus_link_get_lanes.isra.0+0x26/0x59 [cobalt]
[    1.875880] Call Trace:
[    1.876013]  cobalt_probe.cold+0x1be/0xc11 [cobalt]
[    1.876683]  pci_device_probe+0x10f/0x1c0

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 0695078ef812..5687ed4869ac 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -189,6 +189,8 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
 	u32 capa;
 	u16 stat, ctrl;
 
+	if (!pci_bus_dev)
+		return;
 	if (!pci_is_pcie(pci_dev) || !pci_is_pcie(pci_bus_dev))
 		return;
 
@@ -247,6 +249,8 @@ static unsigned pcie_bus_link_get_lanes(struct cobalt *cobalt)
 	struct pci_dev *pci_dev = cobalt->pci_dev->bus->self;
 	u32 link;
 
+	if (!pci_dev)
+		return 0;
 	if (!pci_is_pcie(pci_dev))
 		return 0;
 	pcie_capability_read_dword(pci_dev, PCI_EXP_LNKCAP, &link);
-- 
2.25.1

