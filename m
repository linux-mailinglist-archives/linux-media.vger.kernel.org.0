Return-Path: <linux-media+bounces-28246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C32A614F2
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 634098836BB
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76278202C2B;
	Fri, 14 Mar 2025 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+34aM4p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E177204878;
	Fri, 14 Mar 2025 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966203; cv=none; b=HPN7okMUxnqkHVR8cndgnbsLNDH4No7+ovpRJPl6lcjxy5gn+qXttfu7yegMt9i4uqYxmQNPcDi2xKibMOl2aHi869JHw7u8Q0WS7qvhCuowPGt+LDLu2bpyNnUeloF/gJ2gei/GLIrBZkozrCMnJLmXu05CXI1LEXNfdeFQ0eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966203; c=relaxed/simple;
	bh=JPs95P7qvX/qFz5WsWKK3n3NUUKZ6s2zBvn8J8WqHVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PtsFJdZeBMKQbo8fGrGQSqa1jGGg4rzvBVCkvZ07L2YCzoLHq0EacJuH7xROqn7/ul1xm/zhywnckpAYp4XT6+LsbS+2W5l1N74iqTIKuybcIxdVvrbBD5s4iQwIm+cAPzJTahWUKbMSNwb78qVcm2VGYYxOLPuZNSHKu9QKtUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+34aM4p; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30c091b54aaso20478241fa.3;
        Fri, 14 Mar 2025 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966200; x=1742571000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKH3xVYSpPOpJIjUR/N4nEe7ND+fn1lAzizapSf4YhI=;
        b=C+34aM4pXfPplsV9+sYH58HVTMcNc4CkePwAb/68zm1d5ctin3Zh2PrXoGpTkfHvAf
         U3IoDU+jYgLxHxDgC7q7tkh1V5WRV9B1T6IrkCSYxFcXqR/Kix0HXhoGs/+eymDFNcw/
         /n2ukX296YRQc7A+ENgMCDgXQaoTQaJEaPhwaSbXqlHDaKp5QiMAQwWDDe5vLHocYXRC
         FUC+TNDjgA3VUdPByofARNWm5J1zOOGpY+mn/WsncP72qIp7sK7nIYo+cWtFL9FIpZUC
         WsrkIjWOfHfgcMz70A4/iI8fwn8diurQxwW5KNAVqsaT5fn2618gXKPGH2fWG6D0ePq6
         t10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966200; x=1742571000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKH3xVYSpPOpJIjUR/N4nEe7ND+fn1lAzizapSf4YhI=;
        b=crnUVHhnh4zBSSIgr/CbRXalC1MzUS+5MS0prI1CUo+obf7EpLjt7fUrloObo3N7/v
         j7kXSxtSSDiTkbEhOpaML0tSkaRrDNKO8wDNVmEFIINrrOV13m9rOpMjFaEYh6LVcMpU
         TUjwlBL2RXYxNY628EUREyNb6CTuhmfwcUViJTa0thxtYBo/BRGJGxy3igZU9FbKLZxY
         5MqxFKewp0CucAASJA4k7AfHlWf+ESGtScZ/d+BHyU4ocuXDT67+YVECOiDAOyNt77Ti
         uNMsSVADpv3kBv9aXMqNIswGXa8kBH1NxcUyMLPAJTnnTo0whSG6SMQFT6L/G/yKRor/
         NenA==
X-Forwarded-Encrypted: i=1; AJvYcCUPjTgUcK52AloC00Z3738TrascDT0V0IG2W8EY7Yogd7hCLJiVZu/A/kfA2H3TdUjXT03TCxCBTu3K6ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt+5T9vK9sRT+q6CrjSj78/WYgxw6X7lSSvL9LoxA3u17BLLQD
	fOeFF/B5y/ls3vZ4lT8i9qFsnbEXrUQ8/vU/0XBKBYL0S0D1ge1HltEj1pPMAlY=
X-Gm-Gg: ASbGncu5vUXDe4KgGWcMRLn32msuIlGPcGXxJzlugTcyarDxhkySFnAPcGMvcFm3RG/
	mEFgQI5LC/3jhLYRt9zfCTTb6XrreKjDMkAvZoS0Zie8hwKrtIJ6+/LkYhEDFWpHLzFTvE31trF
	0ZDvniqbprGd8s3UcgPdTIiZjJWlWt6FGf/nuiCpnD6g63syenGMDzJmyxP69onpJ4MNu6OgRLW
	LlqsH7jd0NtCGXuWRXZf5tQuazbKGsyepuQ30sN22U8V9mUivrMHH9v9GNOh5zuiaV3M39s2osK
	t6vCpatkcV8uQQH9RVtYyvftFq5bMGkIJ70sEm0z3tWWZhLHZX/7Ix9AZhmTH0M7E5W4
X-Google-Smtp-Source: AGHT+IEpMlGIGU3WJ4ajdiFf6dboPCoZO9zDyRpfdZ6iR2pH1veBmqUleTEpCrOhFfmWzrP22oby6Q==
X-Received: by 2002:a2e:bc1d:0:b0:30b:b987:b6a7 with SMTP id 38308e7fff4ca-30c4a64ead1mr11410261fa.0.1741966199540;
        Fri, 14 Mar 2025 08:29:59 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:29:58 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 09/18] media: coda: Fix max h.264 level for CODA_DX6
Date: Fri, 14 Mar 2025 18:29:30 +0300
Message-Id: <20250314152939.2759573-10-serghox@gmail.com>
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

CODA_DX6 has h.264 decoder but v4l2_ctrls of level wasn't setting
for this device.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 33c7e8398f31..555b73816952 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -2440,8 +2440,8 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
 		max = V4L2_MPEG_VIDEO_H264_LEVEL_4_0;
 	else if (ctx->dev->devtype->product == CODA_960)
 		max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
-	else
-		return;
+	else /* CODA_DX6 */
+		max = V4L2_MPEG_VIDEO_H264_LEVEL_3_0;
 	ctx->h264_level_ctrl = v4l2_ctrl_new_std_menu(&ctx->ctrls,
 		&coda_ctrl_ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL, max, 0, max);
 	if (ctx->h264_level_ctrl)
-- 
2.30.2


