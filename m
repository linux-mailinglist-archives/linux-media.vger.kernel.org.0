Return-Path: <linux-media+bounces-27681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC2A54430
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 09:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916FA170158
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2EA1FCFCA;
	Thu,  6 Mar 2025 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="AQfvAzEn"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51861DDC1A;
	Thu,  6 Mar 2025 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741248432; cv=pass; b=Ioy9RKmLCMeV64eMBQqbve+apRIeAUY9Qeq2pKX2VeD5159ev9+MqFNyEFRBaLQn6jf06V7xbdG865rJsVOLRtl+qW3K4VSqg2WmGV2OywPcRqp6FmGw5oNvA2xNiiedydtBrZdC6eSrhiqHWdfV6QyJjdfI2M28X8QXh4IItqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741248432; c=relaxed/simple;
	bh=bXOVbMc53/iHjNxOayA7gUsgrF2slBoIlqdrCBXwXGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WX3QjXOrRwxfPYEHkulCjmXHnbVkNWmFHFR5r4IAh2koIA27lnabaGXS9eMlq/glT2OtwcKI3HhKpqxKEXSQcLHzEIRYo7IxVwJmB9j4ZUp9WRU0sOKjrAQ6DgzvC0N3wljpWb+kQuQkBN+o0wIobztxQpE5MIPyBhX0Fff7YNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=AQfvAzEn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741248403; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QVijENwYyr5utMB2yus9zbeRHi3GT24Lp5nxeIe6DlV4umTWmitkjSa5LRTFwC4r9n5maRBY1SkDj3KjK1yOjtjdF/L7bmIARpP2IWreeHGmek14hbCpS7MVtQGh/EO+ZxJOKvDwRJHAX2fS7T1Dk2ryS5Pht+XGGN21rbDIWz4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741248403; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=whersDX4DEkG04Z8xgeBcBNQwsmhyrxWaqfS9ESwEKg=; 
	b=X2HS75TtQ+mKwItAj/LkGMkPGPga42Rr20KjMoKCK9bn1dFcqtPxxLteEJxoIFDbEIjacoAX9QrbVbEWyFxIqnEkC0cUenHNQC+9CSi9jiYpmZZcJqt7mOLffPkFDeNbOe5AxIbXZeIGmNdBeb/Qux9F1R6rt5ENwDU7phV6tJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741248403;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=whersDX4DEkG04Z8xgeBcBNQwsmhyrxWaqfS9ESwEKg=;
	b=AQfvAzEnmiNarr2We7sc3PQ63m5qMSFHYk3ovzhPaMFLywIrVCo3l9Do6eIl0olc
	CnWGAv6w8wQD7lX/HVSoKuJydFI7jZqd2aUSLHRKkLClhu5BzBRpYG9tg50pRykt+as
	hA+1taNNwusHkXU2NdRbyjnCm0GCrsClndJfUQ20=
Received: by mx.zohomail.com with SMTPS id 1741248402849409.8127398309143;
	Thu, 6 Mar 2025 00:06:42 -0800 (PST)
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
Subject: [PATCH v1 3/3] media: platform: synopsys: hdmirx: Optimize struct snps_hdmirx_dev
Date: Thu,  6 Mar 2025 11:05:33 +0300
Message-ID: <20250306080533.294964-4-dmitry.osipenko@collabora.com>
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

Move cached EDID that takes 512 bytes to the bottom of struct
snps_hdmirx_dev to improve CPU's cache locality of the struct.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 981ab96cda3c..4d42da7255f3 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -154,8 +154,8 @@ struct snps_hdmirx_dev {
 	u32 edid_blocks_written;
 	u32 cur_fmt_fourcc;
 	u32 color_depth;
-	u8 edid[EDID_NUM_BLOCKS_MAX * EDID_BLOCK_SIZE];
 	spinlock_t rst_lock; /* to lock register access */
+	u8 edid[EDID_NUM_BLOCKS_MAX * EDID_BLOCK_SIZE];
 };
 
 static const struct v4l2_dv_timings cea640x480 = V4L2_DV_BT_CEA_640X480P59_94;
-- 
2.48.1


