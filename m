Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8EB26C4D6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2019 04:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387589AbfGRCI6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 22:08:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44392 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387528AbfGRCI6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 22:08:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id b7so27232002otl.11
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 19:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fredlawl-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KL5EYZSJLlP/UyGEi8YioAUN6KupCQuW1EoBW+QTXck=;
        b=gi1oFFxSge0+MZ+ACl5ScTU7spRP8baRqRWbrQ50FlGZEbjfp1o0CFaoQWk4I2OV/G
         tMYLnPEtEJaBLY5ortUEPHvwQLXnxdyYJCrFOMFjSjBGID0rzsNzpiuQmibBrlOPiHYe
         hy1eE7tiNAdYUut5OGzIA5VEMOd8UtRlZ922RqSMu56+YbBNHX3q7qGosYmHNINmaU9D
         O9K/wo4xVAtBqq4G0eiU0Pn5ePeo86rXzNWAHU6pi5r7M+ThzB0EbY5Wmsm+FD1BkWmN
         7fqKj5mzEL7JplqOiZgt7FClK3MKDpLCArA4BOMLCE8NMM1HkzKENdvSNFSIKoFssso4
         YLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KL5EYZSJLlP/UyGEi8YioAUN6KupCQuW1EoBW+QTXck=;
        b=QoL5odZ8Ey3BqDGJ8hr5gqKlBfnfH8/wXBKO2ohC9EObDyTF6EvHcGn6JRcPlkefTP
         ZqW5wh83/9IfBqDICJShviVp/8iheS8Pk07LOypbaYrhFCsrxczAI+Sbh0VhIQ6u8LkH
         45S3tNhJyyjv+eALPiGTF/DHlSzhl8Ro8jcQaWYHbP9JxlIdc2F7uJwS7kEqK1mGWI+M
         B53bIUgDS1CPMHOHinpOSvbFq55Pmt270YQf9y+HYX+v565Ror5gWkpZ4cBIUr/Y+xqi
         vg9hQxWEaX3ZQRt/oGFZbfjrq0gVi7EmlbX+/CJsszZEPBtWx2yB55fwH6dUmwn4vev3
         gquA==
X-Gm-Message-State: APjAAAWrGCb8VWTsTOLzE0itVTBRDN8BIXkvk3ravgZOSQf16uvmQiND
        u66AWe1Cm2v63p9cWV8y69w=
X-Google-Smtp-Source: APXvYqyIP1BXKfzqYCwBMRv0BIfuVJQLcLUKZ1AxiO7m46zDIwfz6TxKRf1SBR+rfKVYWnCVmz71fQ==
X-Received: by 2002:a9d:7843:: with SMTP id c3mr25709653otm.1.1563415736958;
        Wed, 17 Jul 2019 19:08:56 -0700 (PDT)
Received: from linux.fredlawl.com ([2600:1700:18a0:11d0:18af:e893:6cb0:139a])
        by smtp.gmail.com with ESMTPSA id p126sm9127410oia.10.2019.07.17.19.08.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 19:08:56 -0700 (PDT)
From:   Frederick Lawler <fred@fredlawl.com>
To:     mchehab@kernel.org
Cc:     Frederick Lawler <fred@fredlawl.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, bhelgaas@google.com
Subject: [PATCH] media: cobalt: Prefer pcie_capability_read_word()
Date:   Wed, 17 Jul 2019 21:07:40 -0500
Message-Id: <20190718020745.8867-5-fred@fredlawl.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190718020745.8867-1-fred@fredlawl.com>
References: <20190718020745.8867-1-fred@fredlawl.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 8c0d3a02c130 ("PCI: Add accessors for PCI Express Capability")
added accessors for the PCI Express Capability so that drivers didn't
need to be aware of differences between v1 and v2 of the PCI
Express Capability.

Replace pci_read_config_word() and pci_write_config_word() calls with
pcie_capability_read_word() and pcie_capability_write_word().

Signed-off-by: Frederick Lawler <fred@fredlawl.com>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 38 ++++++++++--------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 4885e833c052..b92833f3d464 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -186,20 +186,16 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
 {
 	struct pci_dev *pci_dev = cobalt->pci_dev;
 	struct pci_dev *pci_bus_dev = cobalt->pci_dev->bus->self;
-	int offset;
-	int bus_offset;
 	u32 capa;
 	u16 stat, ctrl;
 
-	offset = pci_find_capability(pci_dev, PCI_CAP_ID_EXP);
-	bus_offset = pci_find_capability(pci_bus_dev, PCI_CAP_ID_EXP);
-	if (!offset || !bus_offset)
+	if (!pci_is_pcie(pci_dev) || !pci_is_pcie(pci_bus_dev))
 		return;
 
 	/* Device */
-	pci_read_config_dword(pci_dev, offset + PCI_EXP_DEVCAP, &capa);
-	pci_read_config_word(pci_dev, offset + PCI_EXP_DEVCTL, &ctrl);
-	pci_read_config_word(pci_dev, offset + PCI_EXP_DEVSTA, &stat);
+	pcie_capability_read_dword(pci_dev, PCI_EXP_DEVCAP, &capa);
+	pcie_capability_read_word(pci_dev, PCI_EXP_DEVCTL, &ctrl);
+	pcie_capability_read_word(pci_dev, PCI_EXP_DEVSTA, &stat);
 	cobalt_info("PCIe device capability 0x%08x: Max payload %d\n",
 		    capa, get_payload_size(capa & PCI_EXP_DEVCAP_PAYLOAD));
 	cobalt_info("PCIe device control 0x%04x: Max payload %d. Max read request %d\n",
@@ -209,9 +205,9 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
 	cobalt_info("PCIe device status 0x%04x\n", stat);
 
 	/* Link */
-	pci_read_config_dword(pci_dev, offset + PCI_EXP_LNKCAP, &capa);
-	pci_read_config_word(pci_dev, offset + PCI_EXP_LNKCTL, &ctrl);
-	pci_read_config_word(pci_dev, offset + PCI_EXP_LNKSTA, &stat);
+	pcie_capability_read_dword(pci_dev, PCI_EXP_LNKCAP, &capa);
+	pcie_capability_read_word(pci_dev, PCI_EXP_LNKCTL, &ctrl);
+	pcie_capability_read_word(pci_dev, PCI_EXP_LNKSTA, &stat);
 	cobalt_info("PCIe link capability 0x%08x: %s per lane and %u lanes\n",
 			capa, get_link_speed(capa),
 			(capa & PCI_EXP_LNKCAP_MLW) >> 4);
@@ -221,15 +217,15 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
 		    (stat & PCI_EXP_LNKSTA_NLW) >> 4);
 
 	/* Bus */
-	pci_read_config_dword(pci_bus_dev, bus_offset + PCI_EXP_LNKCAP, &capa);
+	pcie_capability_read_dword(pci_bus_dev, PCI_EXP_LNKCAP, &capa);
 	cobalt_info("PCIe bus link capability 0x%08x: %s per lane and %u lanes\n",
 			capa, get_link_speed(capa),
 			(capa & PCI_EXP_LNKCAP_MLW) >> 4);
 
 	/* Slot */
-	pci_read_config_dword(pci_dev, offset + PCI_EXP_SLTCAP, &capa);
-	pci_read_config_word(pci_dev, offset + PCI_EXP_SLTCTL, &ctrl);
-	pci_read_config_word(pci_dev, offset + PCI_EXP_SLTSTA, &stat);
+	pcie_capability_read_dword(pci_dev, PCI_EXP_SLTCAP, &capa);
+	pcie_capability_read_word(pci_dev, PCI_EXP_SLTCTL, &ctrl);
+	pcie_capability_read_word(pci_dev, PCI_EXP_SLTSTA, &stat);
 	cobalt_info("PCIe slot capability 0x%08x\n", capa);
 	cobalt_info("PCIe slot control 0x%04x\n", ctrl);
 	cobalt_info("PCIe slot status 0x%04x\n", stat);
@@ -238,26 +234,22 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
 static unsigned pcie_link_get_lanes(struct cobalt *cobalt)
 {
 	struct pci_dev *pci_dev = cobalt->pci_dev;
-	unsigned offset;
 	u16 link;
 
-	offset = pci_find_capability(pci_dev, PCI_CAP_ID_EXP);
-	if (!offset)
+	if (!pci_is_pcie(pci_dev))
 		return 0;
-	pci_read_config_word(pci_dev, offset + PCI_EXP_LNKSTA, &link);
+	pcie_capability_read_word(pci_dev, PCI_EXP_LNKSTA, &link);
 	return (link & PCI_EXP_LNKSTA_NLW) >> 4;
 }
 
 static unsigned pcie_bus_link_get_lanes(struct cobalt *cobalt)
 {
 	struct pci_dev *pci_dev = cobalt->pci_dev->bus->self;
-	unsigned offset;
 	u32 link;
 
-	offset = pci_find_capability(pci_dev, PCI_CAP_ID_EXP);
-	if (!offset)
+	if (!pci_is_pcie(pci_dev))
 		return 0;
-	pci_read_config_dword(pci_dev, offset + PCI_EXP_LNKCAP, &link);
+	pcie_capability_read_dword(pci_dev, PCI_EXP_LNKCAP, &link);
 	return (link & PCI_EXP_LNKCAP_MLW) >> 4;
 }
 
-- 
2.17.1

