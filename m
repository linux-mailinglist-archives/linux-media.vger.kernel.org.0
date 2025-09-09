Return-Path: <linux-media+bounces-42089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B3B4A8A4
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E553016A3D0
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB0F308F1B;
	Tue,  9 Sep 2025 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rabe3sKe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F21307AE8;
	Tue,  9 Sep 2025 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411119; cv=none; b=M+qZHKF3hKO3I5/+aE0Jqm8jd01n+AFUCErFoAfJLjVpH/oZcEBWYWahuUtyI+RLQJnI5aSIx98ZMQqg7xHnAuCabOaR5qNJ3paoqlFXsSxzTwu//rAUgHesp2Pf/A63pTWN5VCVxjp/bmMnhmepFqP9cX6Yuv4hK0ymaNiDyy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411119; c=relaxed/simple;
	bh=I/zaQuiydOnPj3WHLpsr9AQZAAZHX0ydNtE3jmZgP4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYhLFWLvGZb/11R0VBXWmARPJZLBEU8JdUgEtn6HedQIuEin2jT8R7TmVv0jS1mNczfERT1Yr+RIOt0CQMszMZygQTs/IFPSrANhJK22adPBhVBMzc7p6nwErDihH6dBhrLLKes3Izshb9lycU75CJoMFfKcZjLTxgVfW4X03/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rabe3sKe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b047f28a83dso901694666b.2;
        Tue, 09 Sep 2025 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757411115; x=1758015915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUfOzEVUIAt9xbGJYoEDPOS8APbEF1/hSIJ/+d4b0B0=;
        b=Rabe3sKeswZr/ULg4aPXNSLCGu2O/Ccdvjg4HU6gDDRy1UVjK0omDI5/wZJ95Piof7
         OQSxnEg96uYfEpXKchKY+waBe/VWdorykXOwwrs70qEE9q4uKmx2+dCoLF/w6959fjXX
         JNV3fO5BSicx777Gd4f22EpjInQ3YUsaqJAAcN3CA1pWr6lx2h74dcbDKMMmWT5qgGxk
         P7Ob/xfPl9eiXYl+S2+uDRie3ZH6KMV5qHJy3Ejxa9dZ5dOX+d0lcC5+YDgU90Aqai3G
         z69aAZj9tU6rozV++ykSDxBcs3093jBnlTSmvGlZcHz5cUMMQgcW7giVVLCLhS2XSVgC
         NfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411115; x=1758015915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUfOzEVUIAt9xbGJYoEDPOS8APbEF1/hSIJ/+d4b0B0=;
        b=ly7VSAzaP2eNHR8x4oevRONAno6frETAjRc/PZxmKFSefAtJz1B+ujx4A1wQyq0UgZ
         FuPyRSLcELM7E8MvBmev7pj8XhTbyXQ7JXDu7zlFzeZzwJ/ogtDI0gu937oVAofo8WQx
         I8SKH0jyo20yRnJfhdILKCCLQD77+PVV9SGV2qj7ktE9KYG7opdkJW6vNt5Fmnn0muXH
         0hwAodhhFOwocn5hBZqKJlXq7KaEr2E7WQxKzaKNrIDJnuFo6SYSr19EWvF887sOMRj4
         xYXE5Q+4d4y7XRD+WmMw0WTPTDf6QVqAQgpiBzS39tzW+KsDdxWPMowrDkxpGSeK/hqH
         5H/w==
X-Forwarded-Encrypted: i=1; AJvYcCVqMCHUNEj3dw5O6UgVOCzb/ZNKIJxHH3G1240tDcZSAEw9kiZAt51mSgljtwhcOLLrfEzlQDBJXW2z@vger.kernel.org, AJvYcCWP50OxwYKvhCiHUuzfH4JjhqXgR6SeAS+4y2JpThoyGipvSN4dSQ4/j96X+i8oAakuIcBKxVqzewyP3NAL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+q2hj2d9JHmhC6uPpWrnRxd6AhPCgodqAfzX278Z/dsvhEThY
	4cT9Sl3a80cjRopQ33NuTDeYwX0DeGC5/x+2SyCL6N5eq40CFr90UMUD042fM6Dt
X-Gm-Gg: ASbGnctwDMi3syn7ynEYNUpIUcahKagMvlXAKzjtj2cRwarWwrq15OHWINxTqo1/rkh
	RbfensRbihqNpII5Byayc0ojyjeGQXeAVFudvabuRkbcxrxuUL4syuusRsnVqnwhFkHnD/l71/9
	nge0vWnf2kRiRfAgGAGdNpD4770i0p8/9/3cfubPIH3sJtM8rPFMgTcSI6Y39S2argBkRVDAP7p
	3BN/NEw6ss959xUo3iegu2RlW7JtwVbVey1I/p7PccLKMGX84T9gS77PP/b11EuQGSMfOLwe73K
	ymezCsXc3oPkQsBWLepBU/J9QyaQGVM3F1avlxZkQB/sIWXH8JokZtgkTFSPKy91OZDzlPA3gda
	9Cw1nhc+FhNxoZNPTon6pEAmbwzTYPIqtKQqeWzMmC0o=
X-Google-Smtp-Source: AGHT+IGqRpZbnvDr0ASgkHkU3BytdQa/XsYhhV8Qcf8kkHOkBn+2OJFwAe6ZOVHrgcTxRl7F4HfRFQ==
X-Received: by 2002:a17:907:f497:b0:b04:3f7c:409a with SMTP id a640c23a62f3a-b04b1403496mr1083970666b.11.1757411114726;
        Tue, 09 Sep 2025 02:45:14 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0971379esm2568706166b.102.2025.09.09.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:45:14 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2]     media: i2c: alvium-csi2
Date: Tue,  9 Sep 2025 11:44:50 +0200
Message-ID: <20250909094451.2262445-3-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909094451.2262445-1-mhecht73@gmail.com>
References: <20250909094451.2262445-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change from my company email address to gmail.com.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 drivers/media/i2c/alvium-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index 05b708bd0a64..5c1bab574394 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -2542,6 +2542,6 @@ module_i2c_driver(alvium_i2c_driver);
 
 MODULE_DESCRIPTION("Allied Vision's Alvium Camera Driver");
 MODULE_AUTHOR("Tommaso Merciai <tomm.merciai@gmail.com>");
-MODULE_AUTHOR("Martin Hecht <martin.hecht@avnet.eu>");
+MODULE_AUTHOR("Martin Hecht <mhecht73@gmail.com>");
 MODULE_AUTHOR("Avnet Silica Software & Services EMEA");
 MODULE_LICENSE("GPL");
-- 
2.43.0


