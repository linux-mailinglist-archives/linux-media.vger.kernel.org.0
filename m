Return-Path: <linux-media+bounces-21565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D1A9D1FDA
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 07:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63A5B1F22495
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 06:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B933154C17;
	Tue, 19 Nov 2024 06:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2dIkUvt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B5D153835;
	Tue, 19 Nov 2024 06:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731996152; cv=none; b=tzuMVLRwgJux0rmKOBhwbAL+HWyKgiVMI2Kbjx+F8skZWcqP54jsy03Bk3OYYpofqBgnHflVxnivk/wKhdVJngeZcVouW7i025ZHwo84oE9pOUNzEXUuuYPME5x7s1YP0WhtCEHCnHkSNBzibG/qlbuvj8eVt6a0Npjh5dMsw8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731996152; c=relaxed/simple;
	bh=BxWWlSp8/odnk6deaXxyriA8cAwiMaatrXns1gba5AE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TC6ZBjlXx7eYkf99m/5Q8s/74kMZaKUajV6SvqKKeMPnnfbmLjP5tcADAJOK4P4O8pL1c+GdPaQcCT+9DHbaO+Gadg02jrxY0gF1Hdv/OKU00MzCBR/uJvzn9U2CEN8SW/xFT3dP/AQe+H3SYGqbd8B6wSKUDV9bFHWn/QXxI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2dIkUvt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ce5e3b116so24244425ad.1;
        Mon, 18 Nov 2024 22:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731996150; x=1732600950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OOil3dDH7JITIShOoBOkpe10yL+drWis3x4DtHVQ2HM=;
        b=N2dIkUvt2Ya7lmZvMpCBF633Qr2K2Wbw/inpbyrmwZ26Ie88ZokslieMAgjdizS+9J
         WhU4rfavywTRzZkFidn4csjn1echLHwtqasw8w8GxYZWDpsURgLm0+J//lAt8Zlsd7Yc
         EzwQRL7Pnt7/gk1hOMm8VYTlL/u7B4oQSCwxUxyxKPu9JHbzKewL85G9kErz8MDsolEj
         5ruVqm5S+soNevA5CNtnK0AEpgZzYs+SkrRyziqK4kK3YJnyVDc+Kq1hMy5T3nLCijbr
         yi4RfLkYTJKgQFbY+ogddCOiVbnF9ZN5OngScIWmdUCcuHjso2U4CqrJ+d3ykQbC8kWf
         o4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731996150; x=1732600950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOil3dDH7JITIShOoBOkpe10yL+drWis3x4DtHVQ2HM=;
        b=gn+gPXQUoMoZJUjLzNRevdKUO7I47QZtDo7FThf8ADTtI0MtkbRaIqEvbvUj5S3fqJ
         JJYRvkB+5eSni4knZv3IPsnzgqiEnvkvkdGv+/sFCp/c27gWLPDvH7j4Az/OVTjuWiYB
         w45fX91os12bnf5h8wB5CkU9iyOLvRBEXjWj27bfSS5EURF4irpMDrPqHXOz86BUyarh
         9boOp8Jj/XRObKTbfSGRYShLq94EhPQAkKYYzlFPVI+2C8DzAEH9uhRjntsUJRhF2KFI
         Zhj1aqt02Gkrf/nqXs4xMSsYDcSvhZgYVtLCTaJ0/lj5s/DbRc8NKEtrfjEMFIJzJCU/
         /PCA==
X-Forwarded-Encrypted: i=1; AJvYcCU0r8X93oK7tr6/7G7MKRDGK4TXWdHuCVA60TUr1E0iwIozZViixEhvlBv1Zr8fPs0rdNz2x+5tiOllxXo=@vger.kernel.org, AJvYcCVdIHgIradWyhwjzIn2YaQiHXivym0c2n44blKED8+Oq0S9JnOKtlU06Lpsuo6im2DzGu1W5BcTdnFknwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9xUiBDMN9HAv3b6HITj/tzsPqLYIF/VkhkzErUwCI4CGL21R
	dxQgF/eDG/cb3jXLfDn+4xBIsMS+wOqG2+F8PMEGVpQgMePHw2TJMrCYPC5S
X-Google-Smtp-Source: AGHT+IE5jczlNszr/hQVgAIIjjWV07/Qlwho1T5W1FaBWG5/rSEd2Kg3I1/DhgwJESlr9Ah1FPEpJA==
X-Received: by 2002:a17:90b:3c0c:b0:2ea:4150:3f82 with SMTP id 98e67ed59e1d1-2ea415044a0mr10785886a91.22.1731996150372;
        Mon, 18 Nov 2024 22:02:30 -0800 (PST)
Received: from HOME-PC ([223.185.133.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2124e973ecasm6588835ad.14.2024.11.18.22.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 22:02:30 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH v3 media-next] media: rkisp1: Fix unused value issue
Date: Tue, 19 Nov 2024 11:32:20 +0530
Message-Id: <20241119060220.70124-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes an unused value issue detected by Coverity (CID
1519008). The error condition for the invalid MIPI CSI-2 is not
properly handled as the break statement would only exit the switch block
and not the entire loop. Fixed this by returning the error immediately
after the switch block.

Fixes: 7d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
optional")

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index dd114ab77800..9ad5026ab10a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 			break;
 		}
 
+		if (ret)
+			break;
+
 		/* Parse the endpoint and validate the bus type. */
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 		if (ret) {
-- 
2.34.1


