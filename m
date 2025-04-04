Return-Path: <linux-media+bounces-29395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8A6A7BE79
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E4917A678
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879EB1F4E30;
	Fri,  4 Apr 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZ9ZvOKu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB71F3B87;
	Fri,  4 Apr 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774852; cv=none; b=AQ5ywoNWLiwkz0UbkjZNF2H5hDrsS+Gx1aJlSX0I7606DJrYHC+whQaedjVfn+3s/WVX6qVpb6UyHgcslX/lTlpd0gGht9zDlE+RwcamePfiwJ9lQZ0I52YbtbHjHFhBERfeqKXriuYeZBRmzVigO6A1ACQvyplHZTWW8T9DCnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774852; c=relaxed/simple;
	bh=3g1kiruXd/1vYGMd8zg8tiToBrR00gAQSaRMjlzmpRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIIEvoMS4UzYUkVIWAZFU3D4QCwlCGNYe+rBbVmZZDYEwuIMXHB0A/s7UfUZ2iNflviqbq7U2nbBEr5q1VVcj4WhUtN/iwAlCVCiVKSDc3LVGjRjIcamY+1bRhpZQ0LZrnIJYOJY9dqqcL0KMKJxRt3PhUtNG2ShsCXCLdgmDl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZ9ZvOKu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85906C4CEDD;
	Fri,  4 Apr 2025 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774851;
	bh=3g1kiruXd/1vYGMd8zg8tiToBrR00gAQSaRMjlzmpRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZ9ZvOKuY3FSXrmx9JHEy+JNBOt2sDmWNDceP28zPuTU1rKJ0X+XCX55JezDj+gj7
	 wcYqE0cEycQ//4ehceFe+jNbPGkf9blhzYBTDdR7JPhGg+NJJHRtsGOSVab0Eblt9N
	 xjW1LHjK2VOAwv+YjLph6S14H3ZKuDdoj42JMl5OpzzSx0SvVibGKYIk3Yi1K8F1Cn
	 3n1+WwEj/OLkiH6HuZRKfP5xVJcf4ULNzN3uDpwqE4eONvw+zu1ZR2+gGO9eL/Qbdu
	 OBIcQ5stNICX54OIWG7CLlkkpXvaYcLDEQq9CuesgPdve2kQ7isCiGNg1HAZ6Bjf9g
	 d+8X5grX4PtNg==
From: Philipp Stanner <phasta@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 4/5] media: solo6x10: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 15:53:44 +0200
Message-ID: <20250404135344.93241-6-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250404135344.93241-2-phasta@kernel.org>
References: <20250404135344.93241-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcim_iomap_table() and pcim_iomap_regions() have been deprecated.
Replace them with pcim_iomap_region().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/media/pci/solo6x10/solo6x10-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
index 6ec1480a6d18..febb2c156cf6 100644
--- a/drivers/media/pci/solo6x10/solo6x10-core.c
+++ b/drivers/media/pci/solo6x10/solo6x10-core.c
@@ -477,10 +477,10 @@ static int solo_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	pci_write_config_byte(pdev, 0x40, 0x00);
 	pci_write_config_byte(pdev, 0x41, 0x00);
 
-	ret = pcim_iomap_regions(pdev, BIT(0), SOLO6X10_NAME);
+	solo_dev->reg_base = pcim_iomap_region(pdev, 0, SOLO6X10_NAME);
+	ret = PTR_ERR_OR_ZERO(solo_dev->reg_base);
 	if (ret)
 		goto fail_probe;
-	solo_dev->reg_base = pcim_iomap_table(pdev)[0];
 
 	chip_id = solo_reg_read(solo_dev, SOLO_CHIP_OPTION) &
 				SOLO_CHIP_ID_MASK;
-- 
2.48.1


