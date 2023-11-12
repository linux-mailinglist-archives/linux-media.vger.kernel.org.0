Return-Path: <linux-media+bounces-134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818A57E9045
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993831C20841
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ACF8BF4;
	Sun, 12 Nov 2023 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4qsaB7k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31304D522
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC72C433C9;
	Sun, 12 Nov 2023 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795685;
	bh=2+86OKPanga/NWbOCWatOLotyY+VsROWMCRyS70g19U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4qsaB7ky+CjfYvZSXp+qp/Pfy6dtRJfaFQ9ydR8SrZgXbHUVwTbh6QYse+g26wJ0
	 +PbMzgV4cu+d8DXctb6wDQhGvYELCAhtwJe6auQqAfpb3OV8AfVvO16wiuziFLDZek
	 Fb9MRNRi2WUQIVu3lM4ssBjwSSiICvPbvXqL0D8+eI5ycmBriVR4TQnUbzAUsX82t2
	 CEca/7oIyS3e+dzx35xwnQzdUYGEzWVZBDtfM64Fsx99vJQAM5Sf15bjq+DrcJlJv4
	 7Z2Bz3huph8BD7NSI31sZ3eBXlCHNFXtG+ITVVC9FB44H4+5H35fvQPa+StT3vYlIn
	 Q5jM+0dUjyyIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	hans.verkuil@cisco.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 06/10] media: cobalt: Use FIELD_GET() to extract Link Width
Date: Sun, 12 Nov 2023 08:27:49 -0500
Message-ID: <20231112132755.175757-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132755.175757-1-sashal@kernel.org>
References: <20231112132755.175757-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.11
Content-Transfer-Encoding: 8bit

From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

[ Upstream commit f301fedbeecfdce91cb898d6fa5e62f269801fee ]

Use FIELD_GET() to extract PCIe Negotiated and Maximum Link Width fields
instead of custom masking and shifting.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/pci/cobalt/cobalt-driver.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-driver.c b/drivers/media/pci/cobalt/cobalt-driver.c
index 74edcc76d12f4..6e1a0614e6d06 100644
--- a/drivers/media/pci/cobalt/cobalt-driver.c
+++ b/drivers/media/pci/cobalt/cobalt-driver.c
@@ -8,6 +8,7 @@
  *  All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <media/i2c/adv7604.h>
 #include <media/i2c/adv7842.h>
@@ -210,17 +211,17 @@ void cobalt_pcie_status_show(struct cobalt *cobalt)
 	pcie_capability_read_word(pci_dev, PCI_EXP_LNKSTA, &stat);
 	cobalt_info("PCIe link capability 0x%08x: %s per lane and %u lanes\n",
 			capa, get_link_speed(capa),
-			(capa & PCI_EXP_LNKCAP_MLW) >> 4);
+			FIELD_GET(PCI_EXP_LNKCAP_MLW, capa));
 	cobalt_info("PCIe link control 0x%04x\n", ctrl);
 	cobalt_info("PCIe link status 0x%04x: %s per lane and %u lanes\n",
 		    stat, get_link_speed(stat),
-		    (stat & PCI_EXP_LNKSTA_NLW) >> 4);
+		    FIELD_GET(PCI_EXP_LNKSTA_NLW, stat));
 
 	/* Bus */
 	pcie_capability_read_dword(pci_bus_dev, PCI_EXP_LNKCAP, &capa);
 	cobalt_info("PCIe bus link capability 0x%08x: %s per lane and %u lanes\n",
 			capa, get_link_speed(capa),
-			(capa & PCI_EXP_LNKCAP_MLW) >> 4);
+			FIELD_GET(PCI_EXP_LNKCAP_MLW, capa));
 
 	/* Slot */
 	pcie_capability_read_dword(pci_dev, PCI_EXP_SLTCAP, &capa);
@@ -239,7 +240,7 @@ static unsigned pcie_link_get_lanes(struct cobalt *cobalt)
 	if (!pci_is_pcie(pci_dev))
 		return 0;
 	pcie_capability_read_word(pci_dev, PCI_EXP_LNKSTA, &link);
-	return (link & PCI_EXP_LNKSTA_NLW) >> 4;
+	return FIELD_GET(PCI_EXP_LNKSTA_NLW, link);
 }
 
 static unsigned pcie_bus_link_get_lanes(struct cobalt *cobalt)
@@ -250,7 +251,7 @@ static unsigned pcie_bus_link_get_lanes(struct cobalt *cobalt)
 	if (!pci_is_pcie(pci_dev))
 		return 0;
 	pcie_capability_read_dword(pci_dev, PCI_EXP_LNKCAP, &link);
-	return (link & PCI_EXP_LNKCAP_MLW) >> 4;
+	return FIELD_GET(PCI_EXP_LNKCAP_MLW, link);
 }
 
 static void msi_config_show(struct cobalt *cobalt, struct pci_dev *pci_dev)
-- 
2.42.0


