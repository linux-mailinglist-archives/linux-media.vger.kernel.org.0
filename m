Return-Path: <linux-media+bounces-12246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75D8D4CA4
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 15:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A726228449C
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 13:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B682F3DAC09;
	Thu, 30 May 2024 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="n3DiY+cH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46418308B;
	Thu, 30 May 2024 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717075592; cv=none; b=iPSma48upFqrtYyoiktowUNdPXhUK6u/gdjZd0tKy5IRjYhxjh9DsDEMC2lwa0oRC4RHgzEG9v94uvlZneW5pCTJZk8zJwUkJCN/oSyVrhsdPi7HVaToJZy3K92+kHcjTVexzXQHQHM8tPxanhS+oCBeKS+9lPYJo1a74Yq3NQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717075592; c=relaxed/simple;
	bh=bSwQD465yawUp2Ku5ElftWNIaNiaph6MbYQTiNRtwbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzQtr1BgAF+6yNTyinZISFDxuA8hiM/PJWe5BoY1eRr7tbtVMIwKrWZ+89ZrQFmMfLxM/vslSkxF0ASX9gAUZ4wLy4jQ9A/TiRVkezKqVK8ceSyAGAbPyr2GY6KhMR3TPJWm4wQCeHOUurNaqdkfoZn3IrYuvRW5o1bUzBE9RXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=n3DiY+cH; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=dXVsEkPZ0UFXZmXC4+4qcKJ7u4qPqtek4PZ95zexCqw=; b=n3DiY+cHSQPHJfqN
	bOENLVaHSlVmGlF9DYpFTubE5G1PSX4/4SNkgtwbK5e9DSi4938GB5Y4x2gwpJYxKNoCxRUc0C3R7
	CPku7blsq7gHXPJEOXdOJF03zvMNPH6azyQ27Hc8NOEBe7uG4Pb5AZJVy2TcY3kFQvWbyOvlDe9mx
	tj7rqLoEA/MMvTvfzTCE27jXqLyaoNdia/exfLJYyDd8pvF1qwWI8lqA+OnnjpgEw3M/M5oA9yh0O
	HrtR6rM6k8otj3bNRIUbQHTNbTLgRwnY4v8xi/zJERljeTrRm7sl3diJ54ga4HjF3qNvqj8cIy6cS
	AswH+98j3IECTfxp5w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sCfnV-003N3v-0x;
	Thu, 30 May 2024 13:26:25 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	digetx@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 3/3] media: tegra-vde: remove unused struct 'tegra_vde_h264_frame'
Date: Thu, 30 May 2024 14:26:19 +0100
Message-ID: <20240530132619.71103-4-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530132619.71103-1-linux@treblig.org>
References: <20240530132619.71103-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'tegra_vde_h264_frame' has been unused since
commit 313db7d235a0 ("media: staging: tegra-vde: Remove legacy UAPI
support").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 5 -----
 drivers/media/platform/nvidia/tegra-vde/vde.h  | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index cfea5572a1b8..d8812fc06c67 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -19,11 +19,6 @@
 #define FLAG_B_FRAME		0x1
 #define FLAG_REFERENCE		0x2
 
-struct tegra_vde_h264_frame {
-	unsigned int frame_num;
-	unsigned int flags;
-};
-
 struct tegra_vde_h264_decoder_ctx {
 	unsigned int dpb_frames_nb;
 	unsigned int dpb_ref_frames_with_earlier_poc_nb;
diff --git a/drivers/media/platform/nvidia/tegra-vde/vde.h b/drivers/media/platform/nvidia/tegra-vde/vde.h
index 0fbb1f3d2c88..b2890484b7c3 100644
--- a/drivers/media/platform/nvidia/tegra-vde/vde.h
+++ b/drivers/media/platform/nvidia/tegra-vde/vde.h
@@ -47,7 +47,6 @@ struct iommu_group;
 struct iommu_domain;
 struct reset_control;
 struct dma_buf_attachment;
-struct tegra_vde_h264_frame;
 struct tegra_vde_h264_decoder_ctx;
 
 struct tegra_video_frame {
-- 
2.45.1


