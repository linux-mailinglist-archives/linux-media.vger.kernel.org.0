Return-Path: <linux-media+bounces-28251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4EA614F9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911E31B63B0C
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935A2205E01;
	Fri, 14 Mar 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+6VWQBe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA2205AB3;
	Fri, 14 Mar 2025 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966213; cv=none; b=oI4S7D1vLPwNzpxVbhp4G5BLtVxSeqAOY2aybJJ+y+ylg/UwTwOG0kEq/a4tJo4j5ZZLMzZoSfSwnaS9/BVXhZAhlvG0HEMjvrr0x4cwsUu0k5oufH8u8INnhm/FMVJ46+YC0VIIHu74upO2tBxsWXfqMlSjKXBL95p5CIoHNr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966213; c=relaxed/simple;
	bh=+Ee55UAKk5zrbEA8ErCkGjdHBczjoD5DmzPAU62qWQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YMKf7lp0lcmSlvadDsqgcsumB47uzU7MG3ev2nY7PEEDOYeSZbQBMMBT0pIbEdAeotn/2J3EX//tZaqXsU4+nFc66uMPxysrLTn+MwkEex/NyJfaGg/WzJG0zTOrfUQsNVuo5R1/UUtMSsrcouGstLFTpZv2vSzVkbCDeUyqCrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+6VWQBe; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307325f2436so21483591fa.0;
        Fri, 14 Mar 2025 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966209; x=1742571009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ce7ZcVdU8F9ZhytWxVKTsWW21I89t3dHhwkZN9/rME=;
        b=Y+6VWQBeIbNLbdtoc/cnQbRFWIgaTQ6/qnC1D9eCYskJJcee7u7N/Ye+jen//YMn3J
         ryU9vDSjbnO5ZukWNtD3gw6jzeZeT//S0xWok/hxw/caVWv+RDJSClvdvJTCLd7isJd5
         fUfBPj0aizxLA1VZy8h24yEotTltE6DzBHEEFECqVB2K3NQmnPdfxB1YIPhP+opOQuzV
         RXgUQDMVwmvMcKoGqk0EGoDwVMhau0xGlqtYbW7S14RMqLp1xnFUBp6w9OUqnxS2QjSv
         /9JpbNT5x6mIu0X3aH3cxjQIDgrmDcHa5IOPbYk40rnoku2U0EYWvtGggvLm0Jp9MO4W
         GCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966209; x=1742571009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ce7ZcVdU8F9ZhytWxVKTsWW21I89t3dHhwkZN9/rME=;
        b=onbCnRpagcA6CrXIVnvGrUvMjbVJIgKDMTLRJn8CAs8Yax1nXVa/mnoZPeOTid8hS2
         7GbJ5dnTJNnYdTUyO+TUI7VfLS/aZIkpaInGS+oVIxncxd3j0+dxuCo+wt9dieDW8Coo
         oaiFWsjtrCJmaGJx0PWDsPuCkb8hw+7vW7VsNBghlG76zhOsarR4xYVSZMbAkatjaK65
         K//DurBPGpmxSWN4wrTntXFphaaiWnqoPyPcywrIMAaegpq4eMEDh5Tt9eJiWgQ1f5Ed
         JLHFODB4pqfR8TSE9O/BEla9mLypIqoEZqFPjXynGtnKaD9/TCd8W53poxeaDWFqkn1p
         Qefw==
X-Forwarded-Encrypted: i=1; AJvYcCVtNl+iEqlVuBIO3MH9bh445yT56JtyXJWeaQL7F6swv27Ry65gcBKPvdcMLusqSRTr7enuYCwFqZ0Tr6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7eO4yy7HiZ6RFJuuliV+WWS6lH9ibERsMZtH0BFowJ58V74Ad
	/WTjMMyvLEM/53h18RatHwRfYX9lxNrXf3Ort6dbMtenQyDKLof58ILXneJZ4nI=
X-Gm-Gg: ASbGncsXlzanx9zKbH30oI9LgqePs0BR6XY1Qj7tR1a1abMoUmxX/0XrgXPZ05dYv6P
	UtvkA8YSAgSPMjOw7ytyrHIafRCiqzUh9LJn7ZCZj1Wsu47x1vkUKwZDgJGll7G8n+S7ud77Bzl
	Hlqm32lM2Ywu6FCrODGMTzWMvRa4LNjCz/ljERV0U7MFV3KuPOE1ZdoQi4z0aclrM6fVi2HvFfc
	0YicjZwYMFi6ddTbRDPTr9uR+pMPMbF6LFKKDixqsQMEV6n1CrHqdOUbH+BOWTk1HSrboggGQZa
	k0ApQi3rfuwNB0mXt9Bdn5CjqjRDMywytkS8WzBhj0rCmSnTkafh9FKIB/dSHSYW9YwTF3FOJ5X
	p0MU=
X-Google-Smtp-Source: AGHT+IG2WaIUdbtUdDQlPOnd8dCw6Gy5P/QgElJCsSHT3I1U1RAJxRriknPgx2mG3XMb86XbYMCEpg==
X-Received: by 2002:a05:651c:198c:b0:30c:1441:9e84 with SMTP id 38308e7fff4ca-30c4a860201mr11330141fa.13.1741966208483;
        Fri, 14 Mar 2025 08:30:08 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:06 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 14/18] media: coda: Fix handling wrong format in coda_try_fmt
Date: Fri, 14 Mar 2025 18:29:35 +0300
Message-Id: <20250314152939.2759573-15-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

No need to print BUG() report when received wrong format
in coda_try_fmt. It's enough to print log and return an error.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 29b01ade8829..9b443ddabeab 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -644,7 +644,9 @@ static int coda_try_fmt(struct coda_ctx *ctx, const struct coda_codec *codec,
 							f->fmt.pix.height);
 		break;
 	default:
-		BUG();
+		v4l2_warn(&dev->v4l2_dev, "Warning: wrong format=0x%04X",
+			  f->fmt.pix.pixelformat);
+		return -EINVAL;
 	}
 
 	return 0;
-- 
2.30.2


