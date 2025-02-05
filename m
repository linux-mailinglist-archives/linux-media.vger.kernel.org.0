Return-Path: <linux-media+bounces-25673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D06A28991
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 12:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A00041883F3E
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 11:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D567A22DFB8;
	Wed,  5 Feb 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIHrV976"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E3F22B8A9;
	Wed,  5 Feb 2025 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755639; cv=none; b=rtB80M4c5gamtDFs05D4n0MydUVrTrRo/iiO49j/42qQngdTZgH+jcY6J3C3zl/SAJR/9wpdeOFaO6Hoor/vVB19TOPJon68dgT6UVeQ8IOFPp2tJaQqI3N3Xp9RsOJnBOKOoq5/VWG+G6FTze2hE75zt1OdS+nztvvtndNoP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755639; c=relaxed/simple;
	bh=lywC6437MdtDYM2KNdfgpCysF71jZ0EotoRamL3djaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=reu9+Whrm8JEeAAi76LqPO/ZXAu2NKCiq6JcvLgNCEp82QQ3lkIrjFkR4hZHzyjpczc3APWAxq3mt/TbJmZhqKNkwvDX5fZiWxowuuQkUie+CJzF8aEFDM4CwoRKv7V9oHC0/AWP+Ap445pXOdGBQEnq6KIbRiIWZJrS+FiAONY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIHrV976; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso77863045e9.1;
        Wed, 05 Feb 2025 03:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738755635; x=1739360435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1QC03WY0ZxDXP++ZhpQVDGRulTf4NzIieyMrSi1EQa0=;
        b=nIHrV976hYE7lRtVNGdHQ+TaPlGEfIHTs5uP5YpxZqAWJ57oFSa+dry7RotDtax1nQ
         Q/7qwRgTNk3u76WoBBNxIDhcmUGeKPFycS7jrcif1aGGjf44IytrlN49Oc/w1CKHt6IJ
         RQO9y5RSfO0joCJthf3sh3OOeSQ7IAeHIj8/4QaA2iF3+Jzo4HbIwC+MuJEhB1GNKjOz
         Hd5QCYNmkZN1haYKniLnOMuyc5xWZyY04g68sBxhnw+2lggzohQxJnKCCgUfjW1U/HpF
         sBZ0aeEZWX5mrbq7DYJRsD6cQSC20oyrBxJZBs2tZ/+pcOaE50I5Z4G/zYWw6DCOSmDy
         aeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738755635; x=1739360435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QC03WY0ZxDXP++ZhpQVDGRulTf4NzIieyMrSi1EQa0=;
        b=NPFVg9i9DoiFsRXpY9R7gMdCiLKmJb4AzMWkJtXkT0jdlNwBMkArNcebWDwxOq0mZk
         1wxlBTRs97V1K3sJTxfIpJLTACHI2ln58tgelAczq98O2P99vi2v39yd7lhCqKVjHeVA
         WKKgrHJNFK3lRtxI7S5jJjqK1obTQyQdXgdLoi7QIsT9sPiu0NzXFAiKtOaMMYF0iiKG
         xWw+f3vkedsSdpIb4tVIGKKznKB0MreGz/ucCPljd0jQNwxE3ScC2rvE8EYtWTXV3Q6z
         gv70oX/5D36DWZ+RPTIHGy1B2eg8JfFQTrZ2UYZV7AF006onYM0QOh2HNEwJJGE6fBTz
         10SA==
X-Forwarded-Encrypted: i=1; AJvYcCV6IIyeomj1KA+cL+MPnzGphbIeoOhre8OwbD6VKaaWP+uFvwwRY7+Yr7yXZ0NaMkokXUz9Gz7+G3c/29I=@vger.kernel.org, AJvYcCW+hdq6mhOSRhwAgxBbhZBMvAseUqktVGZULaZyxZqdor0NuDSjLBKEc81C6wZBhd1qQoGuhtXW7OyoAGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+rGn//4itB2ve4VWr2cflE4+wnLMge+g0VwtMMpT/B2JVLvUh
	OhASsWiMzWl3tA4oDpikTboaVR/bATnyBrnYFG3Mdbf/0fLHVTfsDVpq72soVlsoxQ==
X-Gm-Gg: ASbGncvi7M0hmIr8BlReFU+SiwLRBr3Mg8ysPxhXAhsbGVFfr+HOSxHr08oHJbPOGNZ
	7fpAxfvqGOGv5+5ePq+28DEydAUq1gUiAvvSFMkuR5fd4KsYUVHMwX3XjTLTOcPlgquCoiJQCfe
	s4zZlZEMm1DvbH2jbz/Pj5ZiHmsxKbC85MLLi7ALoEkIkSBYWqFjD77FB5zfAB4rmO0ompC7q0O
	8wxvs6f7c25FkWvZUlpbFM13Q1SZnPWMhZFzm+Lm+26VeDDnQXuj7XRkZsOONLSF/7uJE2y2Qh9
	fCZyxpG2O2kXYlUs
X-Google-Smtp-Source: AGHT+IEBSCcV5L7D1VNEOPgA7NsmqJl5ZSNasvTwbnWmUrVUQg8rPs80m/aDPL3T2mGjcw8AAXETIQ==
X-Received: by 2002:a05:6000:1788:b0:38d:b2f2:668f with SMTP id ffacd0b85a97d-38db48a027cmr2023949f8f.23.1738755635361;
        Wed, 05 Feb 2025 03:40:35 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c102bccsm18197247f8f.27.2025.02.05.03.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 03:40:35 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: hi556: remove redundant assignment to variable enable
Date: Wed,  5 Feb 2025 11:40:08 +0000
Message-ID: <20250205114008.878390-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable enable is being assigned a value that is never read
afterwards. The assignment is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/i2c/hi556.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 3ac42d1ab8b4..a7bc86eaadbc 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1053,7 +1053,6 @@ static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 
 		ret = hi556_start_streaming(hi556);
 		if (ret) {
-			enable = 0;
 			hi556_stop_streaming(hi556);
 			pm_runtime_put(&client->dev);
 		}
-- 
2.47.2


