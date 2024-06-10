Return-Path: <linux-media+bounces-12811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 835FB901CA0
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 10:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ECBBB2384D
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 08:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EE45B69E;
	Mon, 10 Jun 2024 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpuNgKS2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4E7711E;
	Mon, 10 Jun 2024 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007046; cv=none; b=QvpMUopmKY0eNPXQqot3DynP2CSPu1mQQideC6bpiER/lT7LTMWIo8kQb839cjC6lSaaBSlvdc18l3JIxXi1zsBuSgsENPlVLWTiZGyzp7CP8zPRCoMPrpRgJYB+du7A342jwr11BSWbnG6NiCCvUkeF1L64qdtk9OGDeAMiFYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007046; c=relaxed/simple;
	bh=c2977yba0TG6X96B71/Clg3bcOXbpkBblsYZNCGLaKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a5mE7SViH+ZN48++FnFcq5We/x34iwa1bJkfP/fHGG1LukT3ptNDdYfKpra0eqPKYyEE0v0Ay+vH0IgKayBZaI0n/HBuPE9UcIx5Se0BDJEJZtzLIrcUFmjtek+y+paGtxnmjyB0YDO7w+mUj+Xr8Gt1Xxzm3vdlqByKDjLeP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpuNgKS2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42178999284so15499495e9.0;
        Mon, 10 Jun 2024 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718007044; x=1718611844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlv9ZYXfNn+mQvOemwskGWbmtcaerN5i2uX0MFOZBs0=;
        b=ZpuNgKS2n4lXEynoY7hQvB6VAi2Q1C3B7K3OkIm1B46W1K4m/QuOPebCSDgpYEgmpG
         gSmTXVztjYJUt0k2U+I07fqFu6XFy3W3qDPsDQDh4n/9XLyIlz62Y2YE0WlHg7SJyOzl
         PT5CwbyoPFSR6RFM+dqiFH6vb2MAbM6nB0SRSvuryHGAVXi4L+1cPkduM9/3+OaGl9K+
         jOBj1Y3+gGaZPwhv7a9eTuBKdlz/lX1qRIsi4vRadRMGcgsL8NZpmCh3qdnrlRCWjQLx
         cojtybshmZGxk1ii76uV55mzYjNCesoqemRb2KJs7k36rP+LPNLifOkwHWuvbRzHwQte
         gdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718007044; x=1718611844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlv9ZYXfNn+mQvOemwskGWbmtcaerN5i2uX0MFOZBs0=;
        b=sPXjRVOfExHF+Zq/8mUApdSfSNCZvWqgaqXK5ihtHHYGam3Ic+Cf4rjaOTU+jEn9r1
         21I8/saoBuSfzjr5sZMldjDLmfFlm5rlMnCb/cWRl1n/I8Tnk1qMa0iDpd79PZqEggPg
         MSRe14sCwcpxw+3Pktq/xAdib2Hgdd6Klf0KEq1HUr0mcKoP7f9usEC64F6mhHQDXEQk
         Mpfyiq4y298XOF1l4lL2dVEl6Y3ks+Xs4ThdMWDDj8sIp/YzvmAXPvfaKfoR3u4maqd0
         mDE/oLy2wMOJrTtan/Fo7CvC0hb4mj3hbVsAD8mLopWTZeKvxHnZULrkhMrAxW0EhagG
         IMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHMkwLNAE2LNNXNKOJgm8I1QvjOt5kZq6wZUE6+7sgASLpNPcv9/BH6NVcNkBXO4breOJAwOPQdk7y7rsxcqlkdWtQj0rGASAYheW1c9IRJ+1X1Vdp2ytWBFtj3Wd7LWopXiYmoOi/DcE=
X-Gm-Message-State: AOJu0Ywhre2ZHaNND+atXxehGcR7/MBtLv1k3/zPc+sclmyxFTxGvn6U
	cEQuL8crEDXS8qizj7tjBmJrMx2+3HA1/sq1eQe8VIj+SsfL8b+L
X-Google-Smtp-Source: AGHT+IGRCu4k6uCwzHvbUv838CJMTmaigO0So6zzsejGPi4lIkiC0mFwlB/NAHQnfvbcMHdfk+lfrw==
X-Received: by 2002:a05:600c:1c10:b0:41c:2313:da92 with SMTP id 5b1f17b1804b1-421649ec7b1mr72604725e9.4.1718007043637;
        Mon, 10 Jun 2024 01:10:43 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation.station (net-188-217-58-5.cust.vodafonedsl.it. [188.217.58.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421e91c47b4sm18021315e9.35.2024.06.10.01.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 01:10:43 -0700 (PDT)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: linuxfancy@googlegroups.com,
	sakari.ailus@linux.intel.com,
	martin.hecht@avnet.eu,
	tomm.merciai@gmail.com,
	michael.roeder@avnet.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] media: i2c: alvium: enable acquisition frame rate
Date: Mon, 10 Jun 2024 10:10:32 +0200
Message-Id: <20240610081034.1195523-4-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610081034.1195523-1-tomm.merciai@gmail.com>
References: <20240610081034.1195523-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alvium camera by default is in free running mode. Datasheet say that
acquisition frame rate reg can only be used if frame start trigger
mode is set to off.
Enable r/w aquisition frame rate and turn off trigger mode.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 7a38c424ea48..a88809333e56 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1189,6 +1189,20 @@ static int alvium_set_frame_rate(struct alvium_dev *alvium, u64 fr)
 	struct device *dev = &alvium->i2c_client->dev;
 	int ret;
 
+	ret = alvium_write_hshake(alvium, REG_BCRM_ACQUISITION_FRAME_RATE_EN_RW,
+				  1);
+	if (ret) {
+		dev_err(dev, "Fail to set acquisition frame rate enable reg\n");
+		return ret;
+	}
+
+	ret = alvium_write_hshake(alvium, REG_BCRM_FRAME_START_TRIGGER_MODE_RW,
+				  0);
+	if (ret) {
+		dev_err(dev, "Fail to set frame start trigger mode reg\n");
+		return ret;
+	}
+
 	ret = alvium_write_hshake(alvium, REG_BCRM_ACQUISITION_FRAME_RATE_RW,
 				  fr);
 	if (ret) {
-- 
2.34.1


