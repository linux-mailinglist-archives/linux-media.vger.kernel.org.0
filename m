Return-Path: <linux-media+bounces-29392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F0DA7BE6E
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 991407A7C29
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E581F4186;
	Fri,  4 Apr 2025 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIGco+PL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A41F099F;
	Fri,  4 Apr 2025 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774841; cv=none; b=hTTwBTg77eAPv1mPqEwyMffUEaY1k42dvpaBgWHyvytZOmW09eCQ1kCCWg8Zb4yco/gd/x2jYQxmyom5j8MRtPAIHoFkLs48xlCAc/UgLlUXxtjLXXJImH4g3btjecS1WctfgqVbwYRp/kyvrw472Cwl/V4Ie4/S34oej6QY7z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774841; c=relaxed/simple;
	bh=NEmMiNLJ8sW+fz3Lof0eXQpG7r7OZFQB5oYeF91Zy0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoMmUFP76SNQt6NKi7vhsFJN7U6vKxckrSyLt7OdyLh/Weat2XQKs/QuZRxJMaVnrD/sEPCqyKXm35EV1EIxo16RPwkg9uwFErYrePCJrp2hppqBG8B1omaPo8Voa1+qPP9dxrRORrHqR5aDajx87tEC1GHeKbNMtsJxVJdhPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIGco+PL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F35C4CEDD;
	Fri,  4 Apr 2025 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774841;
	bh=NEmMiNLJ8sW+fz3Lof0eXQpG7r7OZFQB5oYeF91Zy0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AIGco+PLDA9e/gQTH0qRCJqwDt+KNwhodeMpNJ6c6N0AKtyuHBv6qFLkHUxiU8gSp
	 pstaXQWqptS6cMBer24KTJ2+87tTgIXggBn8nnjCN43J0NqiUiR9NcpESzwf75ATno
	 gvd/S7K7vZrDNTecvC1fowKalNklYZpvt77ZGoT0lGI497l1cjss5JEyfXjj43IaG/
	 TScJwbvfRFUFnnGjJSCNzVy4N2QApGQjbf+jbPApYHMQvEcHKOHDhAe0mNVCE/4/Uf
	 oGNUsc46qS2ZkTCz+nmtlxYyPmQZ4T71yUxkxi8UJ6yxIaDxsnhW4Kf/CF8d3sOZ6R
	 9dRMVqmPf537Q==
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
Subject: [PATCH 1/5] media: ipu3-cio2: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 15:53:41 +0200
Message-ID: <20250404135344.93241-3-phasta@kernel.org>
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

Replace them with pcim_iomap_region(), and pass the actual driver name
to that function.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 0c365eb59085..16fde96c9fb2 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1702,14 +1702,13 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	dev_info(dev, "device 0x%x (rev: 0x%x)\n",
 		 pci_dev->device, pci_dev->revision);
 
-	r = pcim_iomap_regions(pci_dev, 1 << CIO2_PCI_BAR, pci_name(pci_dev));
+	cio2->base = pcim_iomap_region(pci_dev, CIO2_PCI_BAR, CIO2_NAME);
+	r = PTR_ERR_OR_ZERO(cio2->base);
 	if (r) {
 		dev_err(dev, "failed to remap I/O memory (%d)\n", r);
 		return -ENODEV;
 	}
 
-	cio2->base = pcim_iomap_table(pci_dev)[CIO2_PCI_BAR];
-
 	pci_set_drvdata(pci_dev, cio2);
 
 	pci_set_master(pci_dev);
-- 
2.48.1


