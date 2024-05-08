Return-Path: <linux-media+bounces-11126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F388BF84E
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 10:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57B701F25DFA
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 08:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB23645BE3;
	Wed,  8 May 2024 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gt3HJsS2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20EA3FBB1;
	Wed,  8 May 2024 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715156238; cv=none; b=anq8ZTjZXJOgPndMr+f0qdv308blUanrEMy2iy8CVKepM1G7HrNsFKikR+Ocp4FiiWHYicg4nTjns/mKdGTz/aZVVYex8TPJU0gGBe5HpmVmjoex9Psvjwujjh3oUnLhuLNZutL4YvbT70eer42GTzOa5ZF9NfzSFPcAlfZEjoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715156238; c=relaxed/simple;
	bh=90DPNvTKk/61EKaroqF5/ctsM6XMfjDkwTO+ek1k5Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=O7HqbgnUxndbPA0i3eIyRtufDuLJ+4hP7WgfSqN0Im80atEo+F4FvGsJyOBgBWXqmDL22Am8Ps5ElLZcZfjqj+Nze5EwacOT5q4Z1IFtHUT9fvYMeEACrGmhwxD5eAp8eJWtoMplOKypPdib058GzfUKqbOMzCFKWsELbGAudJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gt3HJsS2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41bab13ca81so42295795e9.1;
        Wed, 08 May 2024 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715156235; x=1715761035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kKiaeh6idYVV5u3iGDfXnjpgKpmSWJxA9vCD2GpJnM=;
        b=gt3HJsS2F3TSLEhm2XkEiDCBS5YDepdEqg06QAz6hmjHVYZ3ZLkUqBFrDcsOaH/kjo
         aVTb60qRQrU25V2YSDN+0rAN6AqOEjV+mwKoY7DQ3EXWfENuBwdZB9Oxde+nDVL1P7yJ
         fDkdqJ6HjUyFsvat3lDkKpsHsOmRFJgWEj0NtUYnN6NG2GaNQoOmtK4dsDadrT+P/RLj
         RbQ9A/aCqWSVD+jDRBJ1RyML/7ncKmodRpM/lGv9Fd6u3lpAg6uWphHdRZMjWmwG3h/n
         g9oJTeOwS33cU8a45HyZ8wjytSwvLTIxGm2Z/saF5lY3LrSKU3dDp+ibAh+nxla/O5oa
         IMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715156235; x=1715761035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kKiaeh6idYVV5u3iGDfXnjpgKpmSWJxA9vCD2GpJnM=;
        b=FI3T6WJjjdhgiLLH9fa3WSFJBwgHIPetjuF4D7cyiNqpg+mfmv036Mea9xZkYLWMze
         f1F3KeVgTDnPzhjB9EYv2qx3JfZwFR6Jb4FH/hvR6BC+Xjq1SL88+DwgXkT7puHg6FRi
         IGCqEc+BWy/ak4Dcctln4plyoFYvSR252Lyy1efN41slP3xzleq5IeRVRg71maaMg3tw
         UeLeEQ7azf1EMhPRkomzxoWP1mIOyR7yshT3zSDahxhzTrG6+jMMZ9VpqRPy8FBhZu0g
         5SjfJ6FtKqEWcsBoxFgzbVG4HWjKdKBT4XHWZ+wNGLYePTDf18cKB/qnOoN27eJmNHKW
         IxoA==
X-Forwarded-Encrypted: i=1; AJvYcCVAb//MzhulEdK75wOqn3DJMSeQoaDHERpgZr1Uzx0DWZtqty9z//HO35x5XmekRFv7zjnYJ8gis4h+5BXBD7Qvcrbamns/owbAlHfAuQxKJUDTFAJfUvmanlpxuib/q5b80jsusLs3o2w=
X-Gm-Message-State: AOJu0Yz/90JYbWgXHYPn0X/BVizCW3YkYqWFjav2qgQ+kANi6zIQy3ng
	y1RO44QGN2cce2i9sqdsDAcwyI+IhZxNkLX/21UGn1JvDGVkPyc+tI+kHQ==
X-Google-Smtp-Source: AGHT+IGahfijjEz447rKpNw9CltyPhLlHKfTOAF556oy99EfklwoqHsljht2OrI3ywXqY9k9v5FgyQ==
X-Received: by 2002:a05:600c:190f:b0:41e:a90d:1216 with SMTP id 5b1f17b1804b1-41f71302e7emr21788915e9.3.1715156234933;
        Wed, 08 May 2024 01:17:14 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f882089cbsm13845675e9.48.2024.05.08.01.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:17:14 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: intel/ipu6: Fix spelling mistake "remappinp" -> "remapping"
Date: Wed,  8 May 2024 09:17:12 +0100
Message-Id: <20240508081712.2868257-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 2cf04251c9e7..d2bebd208461 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -530,7 +530,7 @@ static int ipu6_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	ret = pcim_iomap_regions(pdev, 1 << IPU6_PCI_BAR, pci_name(pdev));
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to I/O mem remappinp\n");
+		return dev_err_probe(dev, ret, "Failed to I/O mem remapping\n");
 
 	isp->base = pcim_iomap_table(pdev)[IPU6_PCI_BAR];
 	pci_set_drvdata(pdev, isp);
-- 
2.39.2


