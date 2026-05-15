Return-Path: <linux-media+bounces-61639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLsqJyjmBmoHowIAu9opvQ
	(envelope-from <linux-media+bounces-61639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:23:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F6A54C5AC
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 11:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AFE3030E3B95
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 09:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6EA436372;
	Fri, 15 May 2026 09:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiYmuv+1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38FD42E01A;
	Fri, 15 May 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836338; cv=none; b=RCaC8C6yVTTfgFIowzx4t6mP5QVJe2DOvm2SuxpA/mACOlXK/CdmGOmS7294vXIZpcToXXFMgpzFe7VUvelAvpRqCxXMS7MWyT5VeyimIAggHv0Ag8SxUucNY/KQS4nQQ0UHhzCE+jvWCJ4BgADA8eg4UU3Jrwwf765wk8AM8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836338; c=relaxed/simple;
	bh=XVR3ojhWkkxsLCom5Bq0SC+fLWXsPrYwVWwe2bgRWsE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F32z+mNn7lDJzXA7WzXCBvb3pxDCWg2xpex1aLwyCqYc+0hKcnnZtlJJ0YJgpnWKaEq4M7k85RKMWpGs7I45Q9EaetSG8kndUfpb8mrAWvRr9qJGhLuEOosagHDkhBcVjlbVZ/cEqqcD3HTKjf/ABw8f0Zzxh89FAGKGBWMo93A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiYmuv+1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778DFC2BCB8;
	Fri, 15 May 2026 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778836337;
	bh=XVR3ojhWkkxsLCom5Bq0SC+fLWXsPrYwVWwe2bgRWsE=;
	h=From:To:Cc:Subject:Date:From;
	b=HiYmuv+1L1CeTy9Xiuv2hCGHbHza2zJneMRA5dprt+1LPI4War6K24QhCL5nIY3CB
	 wey4qRBXYup6FrQXfzx91PYNkk/+kUit3QjOLIXLHLUc2aOrBZycf4/bXn5q1B3eBx
	 nerubRkubruJ7qStPHkRiZ8AhtFV9EmY1XMNdmE8EP043GcLgWE3Gm7HojumRoz8fw
	 678ABvg4fsxhcxBjn9OiGdk5INDz5b/xys2B84ZsK425iIXlU5tBUjGqYOyrz/bQLi
	 kQywVmKcFzJgkk++o6J3aAtBYIR2729AEj/RR11Td7xnmNFPbgLHjxzaC3H4lphgS0
	 +33G6p7ugFEZg==
From: Arnd Bergmann <arnd@kernel.org>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: amd: add DRM_AMDGPU dependency
Date: Fri, 15 May 2026 11:12:06 +0200
Message-Id: <20260515091212.581789-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 39F6A54C5AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61639-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

With DRM_AMDGPU=m and DRM_AMD_ISP=y, it is possible to configura
VIDEO_AMD_ISP4_CAPTURE as built-in, but that fails to link:

aarch64-linux-ld: drivers/media/platform/amd/isp4/isp4_interface.o: in function `isp4if_gpu_mem_alloc.isra.0':
isp4_interface.c:(.text+0x1d0): undefined reference to `isp_kernel_buffer_alloc'
aarch64-linux-ld: drivers/media/platform/amd/isp4/isp4_interface.o: in function `isp4if_dealloc_fw_gpumem':
isp4_interface.c:(.text+0x26c): undefined reference to `isp_kernel_buffer_free'

Add a dependency on the tristate DRM_AMDGPU symbol in addition to
the boolean DRM_AMD_ISP=y, so this can only be built-in if
the ISP driver is also linked into the kernel itself.

Fixes: 9a54c285630c ("media: platform: amd: Introduce amd isp4 capture driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/amd/isp4/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
index 55dd2dc453a2..9d1927af1cb8 100644
--- a/drivers/media/platform/amd/isp4/Kconfig
+++ b/drivers/media/platform/amd/isp4/Kconfig
@@ -2,7 +2,9 @@
 
 config VIDEO_AMD_ISP4_CAPTURE
 	tristate "AMD ISP4 and camera driver"
-	depends on DRM_AMD_ISP && VIDEO_DEV && HAS_DMA
+	depends on DRM_AMDGPU && DRM_AMD_ISP
+	depends on HAS_DMA
+	depends on VIDEO_DEV
 	select VIDEOBUF2_CORE
 	select VIDEOBUF2_MEMOPS
 	select VIDEOBUF2_V4L2
-- 
2.39.5


