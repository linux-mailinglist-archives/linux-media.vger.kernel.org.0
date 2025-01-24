Return-Path: <linux-media+bounces-25249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E2DA1AF4A
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 05:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3F9716B757
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 04:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29D71D86E8;
	Fri, 24 Jan 2025 04:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StgJ7NRf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6523B0;
	Fri, 24 Jan 2025 04:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737691614; cv=none; b=KphZfhKkg1W5YQF6eZwFS4xm1E8uYofpYvIkDo3juIWeUkbMtZfBMDjqeaaBjsDgludg7tA1B0ynwRv0J8BvZFw2EAAVNVayJUPNYcqC5leT3uJ5Ycz1ylFN4Ximl0U3ViKQNk+TGYOr9gmuKRiDvEcmdtiZczAqVcKWvxtfTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737691614; c=relaxed/simple;
	bh=ea0+XODqA4zgxKtAhQAQx7ZqtBm9OFkMPPtrp7Ln3+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=njpwXvRWc+SYD6B8vl07r6Ps0HBHfti1GDf6HHAfqVndR2Lpja9GipdB0vVYgO1Yra66g3nsz6jUUIl46PIp9NB5SWBPIZiJGJbpmKTBtY5VKEXvYAXLG8367AnoNxoGkMXmB9/f5OVpsCntgtm8ZPBDETWudYD34PjETdiTQKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StgJ7NRf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21619108a6bso27484995ad.3;
        Thu, 23 Jan 2025 20:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737691612; x=1738296412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj1NaMTUsVA57ckq/QD9h243Rs/TkZbkHkyDFlhTqVQ=;
        b=StgJ7NRfU+idm/DPdWTZH+xR5eSxrZ+aPXBjmsDrOmn6UMMpgHlZgNSDU6u1mPFfmk
         +L84nZT1JgBiITXo/M5xWsYGOr6QldSP+u/WLYGt+WA7Cm+ZRHpEZRXVs6GzBE6zG33S
         1SYyajChUh5TQwfG8uf+3ntseLIVgImIphnzWBBirSWm56WpiCInDdRMjxU4Au8bVg+t
         /tufCMUaFu/SFQ4JusQlIPi7ZHv242UA/ulkSUb8x4NOr1AW14jqgLVGVkWDCiKBZC6M
         nfLvKo03Gdo/tYr7XSLKE1X8oi0j9mzoQ3+rtZ5W2FJO2iBMADMR9L2T4SIvyAtycRJr
         qThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691612; x=1738296412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vj1NaMTUsVA57ckq/QD9h243Rs/TkZbkHkyDFlhTqVQ=;
        b=THQNdmBud/xAOE80JiMpgnhhMcS8yYjBtyC9aDUNCIiE0aBBHjT4iQowroa7fH4A6a
         FDVH4k8YS4auj/qEkhhVuzIf9bO5zeBitr9I9LMiIUhjMsfO4LqAyZ1CGYnZ2Ky7RatO
         gtsgyoKzodDN1b48KMAX8PlOr/iqaMaocXjNFLqm9UcdaXEAPjnWVDNG36HlCf8P71BM
         YghPGQtc4+ZGwHrAB0OOWfogaeak2svLUP5DURw20Tdtq7EbjnEuuXYfWhkMxbbhPcNA
         yRlntqHI5DacFd5M4PCVdsSNoZ6F4huVOa4p7MrfXb6v/MR9ySva/goOcDHy4RIyh7ZS
         tCDg==
X-Forwarded-Encrypted: i=1; AJvYcCUZFDR4Zbuf37fk4F0nq+B/xDiDYys0E54B79Ln8zubehChv0SDhgddNHcfTjJKvJ6+rFlUGLIf44Pe7H4=@vger.kernel.org, AJvYcCXfV+vhxq+w6bWP4RmHuGp1i1wclHXatj1TCeJLYUJGlBJetvSYFpNY4QTeBa/A5clVVC6sb+5OQd1lUBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3Vz0iST+BsmhW1tDKS9tSvSULvqsYZHOW64SYuXnIXF39C2B
	sm+0MT5c8cy4ylfM4aMXPAaFQyRGyluYnCbMHwdlq/gsP3S4rqikwU+ARcNrXgI=
X-Gm-Gg: ASbGncs89OM2mROtrgZ+TfRszuApZ1cGcE67NxjK2LsDDOH+Jh16fY9VWoJ2Ayuko3/
	lA5/XTKgQKP9g52QZgBj7zFfE2XYa5Qa5EKV2ygGSiHDWP3iRPLKtDd7HOw2pgSq9Ht26YAfHZZ
	EShmXtMK+F843dZVR2VPwnMdYTA61pc1NxQlyFP8scJURgQuIveui//AfhdO6bhZrTj/yuYajYu
	bYEKus2C3zOjRwFB3ck3b19PgCI5BwaB3M9WFjYLlj5izNA+yPcjZbcd4weMtiFYxwNKMWgnRm2
	Cym7MiFggJdXnHFQSLdSX7RrExMfgA==
X-Google-Smtp-Source: AGHT+IF3SHS7uGw6j2HUHGRc2o6x9hUUGZICmg9DQKSnpjYz1OzyDi2k9jgSfX5GniU24Huia3n0zA==
X-Received: by 2002:a05:6a00:a2a:b0:72d:8af9:bc64 with SMTP id d2e1a72fcca58-72daf9ec17dmr31990363b3a.9.1737691611690;
        Thu, 23 Jan 2025 20:06:51 -0800 (PST)
Received: from jren-d3.localdomain ([221.222.59.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78f145sm795398b3a.167.2025.01.23.20.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 20:06:51 -0800 (PST)
From: Imkanmod Khan <imkanmodkhan@gmail.com>
To: stable@vger.kernel.org
Cc: patches@lists.linux.dev,
	mchehab@kernel.org,
	fullwaywang@outlook.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Imkanmod Khan <imkanmodkhan@gmail.com>
Subject: [PATCH 6.1.y] media: mtk-vcodec: potential null pointer deference in SCP
Date: Fri, 24 Jan 2025 12:06:41 +0800
Message-ID: <20250124040641.7431-1-imkanmodkhan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fullway Wang <fullwaywang@outlook.com>

[ Upstream commit 53dbe08504442dc7ba4865c09b3bbf5fe849681b ]

The return value of devm_kzalloc() needs to be checked to avoid
NULL pointer deference. This is similar to CVE-2022-3113.

Link: https://lore.kernel.org/linux-media/PH7PR20MB5925094DAE3FD750C7E39E01BF712@PH7PR20MB5925.namprd20.prod.outlook.com
Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
[ To fix CVE: CVE-2024-40973, modified the file path from drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
 to drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c and minor conflict resolution ]
Signed-off-by: Imkanmod Khan <imkanmodkhan@gmail.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..27f08b1d34d1 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_fw_scp.c
@@ -65,6 +65,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
 	}
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.25.1


