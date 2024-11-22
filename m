Return-Path: <linux-media+bounces-21854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0DC9D6593
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 23:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA187B2250F
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 22:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CDF19F410;
	Fri, 22 Nov 2024 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lfhdpcwe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4F41DA5E;
	Fri, 22 Nov 2024 22:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313634; cv=none; b=qlwS711IkmlIi4omYmH7OEI6lhGlO1/Osbx/lzIxJ+U/cFjs5p6iNCgJdSyDHtHuM01mj/ONEwH27qrqR2B83aCqlKqF1+IY+Rs/aeuFLHaTNc7APhKKj2XHVgPlizDS7jwrwzab/v2+CBea0W+VXPnTLpiPwpfnv0cy61a+2jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313634; c=relaxed/simple;
	bh=E/5sdOL/jkUCbV3WEL3b/0KOfVk/fXbHHdo2d90g7Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rf8BC/uHRSuxRrqiNOigCiLTbpkAhlMksO1NEeGCy/oMfZ5lKMK05xZEjoVthZMoUf0dSgGrgtEnVTb8HzyrPB2ZM6MnqYgZRRp+59Qoaor0RpGr1Xl5f0I7pvZjW86WsxuhYNl4LKKb5x7IpVBdvxB8J+LPTd4XeHGWGjIlvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lfhdpcwe; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b18da94ba9so223586885a.0;
        Fri, 22 Nov 2024 14:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732313631; x=1732918431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=LfhdpcweOaQ6W4aNXbMBMw6uBNCXKVwUfO2hNxPJ9Qik3K9OdRVGm+8qB6fDsiJLZn
         7r2qw810AeNVCsEcCD1L41A1iq47RxTJDs/997a0c6U0YEV2K6c+u7qOfq5F2Mdj8C8o
         ZYvAEaa7t87IFqt0fzmcM9Dk+yKi8yu2+f0r/ool+EFGrZOHFj90Iem+fYdQh9RwEqxd
         qIw25ey1ZsYvRcRsMpXYhNtB7L57v6lvQO4A95Nt7niumKHMW/tbncrMm6Hv+MV+mbf7
         fULiWKPRRigal8u03u5s8otj7lmCd/vJNt5lK6Ibphikr08q3RnQ6TuGAOJnf2bPHPwI
         q7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732313631; x=1732918431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8k+BU9sp4jwI3J04BZciS+UktHrfNJa8h5d00+WG0I=;
        b=Xx2A2V8MjZGUNnbocTekPAvnbt1QK1SJaesCHnL4/rDyyPuFeAuawz8SgQPWhEAuLh
         +dwnIqm1pB68o6Befg0ej60orCUtqb3pTTFcO00ZLGRyh+EaR2PfZRbnPLJmkgKknnFL
         4i1oXnEBoxj/Pq+O+u6XVx9o6/CdeGdDwjK3V7AlkeBfi9cVzbnn/VVPTfpi+cobe62B
         M/qTPJYIfNhYw1v+0LAZLgUnodJMEvi2lmemgWHE3KxXVZ1bAZMOyQr4tLXEbpk6g4zb
         7Gn2sQvgxEc+3zKLK4Aci7BTjPowbzP8xIKI1lkg9TCB2R/TPQt4NyIawjb543qzxkwc
         Y5sA==
X-Forwarded-Encrypted: i=1; AJvYcCV6PwF3M6JsXjhoCNFcEnJBgl4dpNqudhtGoz97yj3IfCtwDS1bb7OLhRhYxtPGG42qjFNj+KI9YR9mnSY=@vger.kernel.org, AJvYcCWhy+zJUgg3aOL8UuLXJ/ji7Wov/Bb8qf7CggGHIEAxPgiuHZ/VwOFZuJLCChWIfe65jOYKlI/TjaaiITs=@vger.kernel.org, AJvYcCXYx+zsvgCM5Yv13h/ZRP6ItBaQbykhobxbKz35sI94EKRV5LSeXd3td93ZJ5Ztm25wxhn2YB1hAI13mN4Zo8eYqdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxS6b8DqnHKj2BHVRX0ibswizfNYo6OMUkiFTENYbCmS7kNbxU
	Af1Qedsz55PUldw0IVnlH6ZZJEoMQACTg7Z7TqE0zynznZtlixtz
X-Gm-Gg: ASbGncsibr/aJbi1PnoovBVw6IzbB7nM4cuff4xAoA43HiVhcAmyRWjsmfOBxMOn82o
	Kk3KrrqIvNVDNdZZKfnu9+zJsKptPRKw4SSCsbv18fzXDa/d3fDrh8bAXCrdqMTY1zv6OgTllBy
	/GnlXGvKqMzZREuUC6Nn9rPAGqfc4BXBoGpUwWEWnZ88nK2CxZzY0+mOrpAphpjRDecBZnPsJnf
	w88f3EzNrE11xoE/nGAXanWlvQdCyKulEuv4HT9YzihcsKDQgNqoV4ZyJk2A49cKDq/F8Qb
X-Google-Smtp-Source: AGHT+IEzJaoN3aH6zpKSzv+lhJWHLO6tx485UfeoF/qternotp83Yq1ZBtdBH+mLh7LqABjxg22dlg==
X-Received: by 2002:a05:620a:2b9c:b0:7ae:310a:75de with SMTP id af79cd13be357-7b5143eb019mr779680885a.25.1732313631490;
        Fri, 22 Nov 2024 14:13:51 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b513fa5feesm130646485a.30.2024.11.22.14.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:13:51 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: krzk@kernel.org
Cc: sylvester.nawrocki@gmail.com,
	mchehab@kernel.org,
	dron0gus@gmail.com,
	tomasz.figa@gmail.com,
	alim.akhtar@samsung.com,
	kyungmin.park@samsung.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 2/2] media: camif-core: Add check for clk_enable()
Date: Fri, 22 Nov 2024 22:13:47 +0000
Message-Id: <20241122221348.3998-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
index de6e8f151849..221e3c447f36 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
@@ -527,10 +527,19 @@ static void s3c_camif_remove(struct platform_device *pdev)
 static int s3c_camif_runtime_resume(struct device *dev)
 {
 	struct camif_dev *camif = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(camif->clock[CLK_GATE]);
+	if (ret)
+		return ret;
 
-	clk_enable(camif->clock[CLK_GATE]);
 	/* null op on s3c244x */
-	clk_enable(camif->clock[CLK_CAM]);
+	ret = clk_enable(camif->clock[CLK_CAM]);
+	if (ret) {
+		clk_disable(camif->clock[CLK_GATE]);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1


