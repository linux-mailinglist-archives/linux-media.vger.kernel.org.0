Return-Path: <linux-media+bounces-27680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0328A5442F
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B94816DDE8
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E481FC7D9;
	Thu,  6 Mar 2025 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="UIBJvsb4"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F201D8DEE;
	Thu,  6 Mar 2025 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741248432; cv=pass; b=CeMLLRxnUCPqOisyVKGL2Vigx0Ss09tA6EHFteUHVxYfdLwYzlUDR1My2KFGz5LGr20XJxZIGrE2ZfEE2LR0pDsrWlEJvywjN8ad6PxGErlzlnQruyE2aKAPPVkU5cP3SAAJSUHJ1VahKe6zj5B3Q2vaV9/47fWIL3ShUi1UUOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741248432; c=relaxed/simple;
	bh=sdzFA1XPcTdD1mFV8fJzGTCHQgcCMG0g7y5On+C/zAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+aIK/xyshwvxj5339lejBxj4WImdy7mlGgjoKuczTHFFqH76Ck7SZzho/SRTTnfan90tslpv/p39d0iEYnK83gxzEaph1aBePZSxF6ogOyiWL3e+937AhYXQUnVM1j102Tm4aUej2X78FOkd5++1VDUMWhIid3Nsy8AO5Dz8FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=UIBJvsb4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741248399; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fhCIQ++H+H5gB1rpJTECvK8Dk6oQPZ9QiQoDGYbmObaSkFYqI0SUOrW2lhmrHz39/fyRBa2QbG6qxWT4PeBikqKjHqAt0PveX3uBPKBi5lEm30t0fgEB257rGItBr9Xfh0X4oLwdoymHrLgxvB6Ng4AqfVDkcdxXXP1Nv0hegw4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741248399; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WlAgz/1QpV2kZXdNieTjab+and/nPvcU/9gROcEfjZU=; 
	b=RC19bOxkkzwtuPDTt+PGW/po/nZ2UClzsq55qCK/Lb31i249WycO2gHNlYDDpIZpkUuMVOjKwsrFlSik7asYRwA7Hyy77dYW/It/RMH41yPMb5yBGRvGKtvXmNNKibTXkoL2PCxSNvT1mCeIzi5wrJXZjgYiKQlQXQMBcHqaRGM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741248399;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WlAgz/1QpV2kZXdNieTjab+and/nPvcU/9gROcEfjZU=;
	b=UIBJvsb41FcCim0XUZZAGqxX/G5lqPMA4gYjOl/nQJmvXUAAI4coTwv10fKDqYRN
	OHAxbEe65Z4E6v0hgWciD2yll53nE1iXaQpOV2uAHvVAcDUhlMkI8SWC9t1xBlYzQK1
	ZxSjil0DjOnhj1t+pt0iKR89t3Uy1oLvjwskZ4w4=
Received: by mx.zohomail.com with SMTPS id 1741248398426801.4470698537392;
	Thu, 6 Mar 2025 00:06:38 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 2/3] media: platform: synopsys: hdmirx: Remove unused HDMI audio CODEC relics
Date: Thu,  6 Mar 2025 11:05:32 +0300
Message-ID: <20250306080533.294964-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306080533.294964-1-dmitry.osipenko@collabora.com>
References: <20250306080533.294964-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

HDMI audio CODEC is unsupported in the current version of the driver.
Support may come later. Remove HDMI CODEC bits that were left out
by accident to keep code consistent.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index f161fd6712b6..981ab96cda3c 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -40,8 +40,6 @@
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
-#include <sound/hdmi-codec.h>
-
 #include "snps_hdmirx.h"
 #include "snps_hdmirx_cec.h"
 
@@ -122,7 +120,6 @@ struct hdmirx_stream {
 
 struct snps_hdmirx_dev {
 	struct device *dev;
-	struct device *codec_dev;
 	struct hdmirx_stream stream;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_ctrl_handler hdl;
@@ -158,7 +155,6 @@ struct snps_hdmirx_dev {
 	u32 cur_fmt_fourcc;
 	u32 color_depth;
 	u8 edid[EDID_NUM_BLOCKS_MAX * EDID_BLOCK_SIZE];
-	hdmi_codec_plugged_cb plugged_cb;
 	spinlock_t rst_lock; /* to lock register access */
 };
 
-- 
2.48.1


