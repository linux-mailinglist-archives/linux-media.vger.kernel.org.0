Return-Path: <linux-media+bounces-29394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76794A7BE75
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B63E3BBAA8
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6C11F4703;
	Fri,  4 Apr 2025 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bdj+967Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74E1F2BA9;
	Fri,  4 Apr 2025 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774848; cv=none; b=Cfjdxbsv0E8hFt2mUJjT0olfGp+vqDDbeXfEx4I0W3RTtJyyj5M/+TU3iZgYPuwQ4zBxNTUOulJm9PSGc4hLQOrNe3lhUOkUd+voT/tuDAk/WRprel45th0KnHit7GF6hCA2NDmxQq0HDIDVc1jU2/r6gpXN9YpgbCb8JYoIxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774848; c=relaxed/simple;
	bh=CLplenXM0KPfFaxZUpLNedqikRzDMW7yNpWq4mZVXhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZen7zok7/nptl4dmVvGnSnTfs+7qY7tfCH4PK+dktIMRziGcXI0BGXZsNC+J2GBaQPf0rmMTlNOVjwwyP///J92nx9AhMe6JZCBjS9vZN+eu6VOUiXnUDKXsIHiuM+jJwFP65NuxEk7YvMj2BkytqDjCLOq+sHLwx2aDoVUNAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bdj+967Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBE6C4CEDD;
	Fri,  4 Apr 2025 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774848;
	bh=CLplenXM0KPfFaxZUpLNedqikRzDMW7yNpWq4mZVXhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bdj+967ZEIWakpSpD+2lzKJnrIqeFqqt2lWyspgi7j3+36lMoJs4NO1XiStNMQQyd
	 hPbv8N9nSnxfSA6pSkoQXS7LrpYl06ShGm9JhO3GdNnRVJ37lSyFsU/5Mr7M7LjClx
	 7up2ejG/nM0gH4yorvCa5sobpbiWrID861Zj04tvGxL0onwh6wSCT8fyoFN2JqafFk
	 NqIBL3Fl0m+DzaMn6Tgg+JYnVrg+2nItUu4c1x3S3ncArtQSwq+QCwkbTCpeSdoxAX
	 wWAnJ5rGUcHOKmtcxSOG9ruOkxMlVEP8WCHYv9ztTbG3AobvQ9ekYZ/79Wp8R0yW5Y
	 Sj3CAl2DrxeIg==
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
Subject: [PATCH 3/5] media: intel/ipu6: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 15:53:43 +0200
Message-ID: <20250404135344.93241-5-phasta@kernel.org>
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
Furthermore, the "name" parameter in pcim_iomap_regions() and its
successor, pcim_iomap_region(), should always reflect the driver name,
whereas currently it is the device's name.

Replace the deprecated functions with pcim_iomap_region() and pass the
actual driver name.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 277af7cda8ee..345662542a64 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -525,11 +525,11 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	phys = pci_resource_start(pdev, IPU6_PCI_BAR);
 	dev_dbg(dev, "IPU6 PCI bar[%u] = %pa\n", IPU6_PCI_BAR, &phys);
 
-	ret = pcim_iomap_regions(pdev, 1 << IPU6_PCI_BAR, pci_name(pdev));
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to I/O mem remapping\n");
+	isp->base = pcim_iomap_region(pdev, IPU6_PCI_BAR, IPU6_NAME);
+	if (IS_ERR(isp->base))
+		return dev_err_probe(dev, PTR_ERR(isp->base),
+				     "Failed to I/O mem remapping\n");
 
-	isp->base = pcim_iomap_table(pdev)[IPU6_PCI_BAR];
 	pci_set_drvdata(pdev, isp);
 	pci_set_master(pdev);
 
-- 
2.48.1


