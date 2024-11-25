Return-Path: <linux-media+bounces-22040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 134169D8CC2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 20:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55A42B29F99
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8CF1BD9DC;
	Mon, 25 Nov 2024 19:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ89HJ8E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B8538DE1;
	Mon, 25 Nov 2024 19:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732562305; cv=none; b=AO02QFW2CXoYuJ04Z+b3NJEoO9jHZSDkJKs1bMJcyj00C9rtg3YBy1d3k4rb8z2G5Omxne0n/ZJLsDP72hp9JZ67fVTlTm/RrIIJPChV4+nMHHc2FCz2fHpVC3Y9dWOfBFzCBj0EgoK05vDd6MMz9dGTj5P5fbhDzBtZXsQ6AiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732562305; c=relaxed/simple;
	bh=S9lNBdOz+fyWtttvxwI71Sb5SqCDucavC8LeLhcrfS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tke42WSuE2fgUlUXZH6/HzHdJgL1UNbjAwPc++dMBb6G4Ar7lzhgWcAMrQv7+Y4WIF3z2rXMBupwJMFu+besS7UNd/DhAf/yRFTkN54T7OWGAfaVSi4cXyUPTFPqF4nUS/atOrOIwGTroZHiJoJVbGnqqlu54q+BwQ2nDklWnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ89HJ8E; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4669eecd88dso5135411cf.0;
        Mon, 25 Nov 2024 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732562303; x=1733167103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=;
        b=TJ89HJ8EX9B2XOMrmq0Ff8guHbI8M/9LqX4XtBSIvy4SyrbbYCXZXx+jmyBXqbMYMG
         nqksR2+JrNzqgUfE96q6l3strOkvMd+Wi5uolshQCYXQFGxlj/xyUNOENhjBfnUL9VxO
         YJRQAkf2HqSTqJ0qWEYD8/U+EuE8m3Vx6ymJkPQAOd9hZV/YGOh50ptFWlBgqTyBiqmw
         Sgao0+2lgfibdFugH9WAJCt/aAofONwsSTLGzYDb/FzgOVE09DI1k4RHD9OwHg/W7xrC
         UaqyLJqVCPcWa0IHAdu2ZA33/nnkelTIhp7qQXnLGXGD1necC6YkzH9i3D3vV/IZQBqY
         D1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732562303; x=1733167103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqUmrgUyN7wLvObgizlW92PtLkKJTPkx4qrgq2LwcbI=;
        b=tLfcD9fuK43PUUOI3p5Zyns6m3rwxrTNiIPVfkFKqXHD8TqbgWGNAy3tdIq7P5GhTX
         u9uB4mazshwOxNLKhwD7IG8QljRCN3HG6lC5KQABuisvFB2yI67KaaTMgCMx5TL7rxiq
         +Xqitct1OY1zDBmwt2SfB1q3Dii7ZEiYJ7gnHTxpW1lsQ00UeSk/FgR2XK8hlA/wtQoX
         pvr/hMCrh/EYhryhJaXbtM5xkYvfpdkqwlPV/PUI0aET/g6EepJg9g+xLH9H22fD7U0u
         FUQdIYjWSKp/EFAIYcd2lKDHkYA4nD/ktOE83DC4EYqxZX8VX7+YIw+NitlaH8fyGLbB
         DhMw==
X-Forwarded-Encrypted: i=1; AJvYcCUYnNeXjlMfn2oKkdT5DjWA48qpY7IgYF8HfFNCLCvHpp7ZmkSkdTeG4rKdVORhVgprrtJott6DcR+/Hg0=@vger.kernel.org, AJvYcCViex+1KR6EilUcvrRV3n/IA4PJDYig0VfsBm7/sxqgyH393suLdfVDTO6hfnS1LAcTK7MWkk6GMhaCo1wg4Js5XYQ=@vger.kernel.org, AJvYcCW6qG2NTpc565+Tau+DGs4ZcDU4xsTfbZGdWDjcVvvcl2HAo8AmGBH4Svki9x1Gr7BW+LCO0AnlPK2IQhI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4O0zTNsBvdXxLTKn3iGj84H0479VusteOe/BJHNLIIQbDxoor
	BsoMzFcTutU7hYXcSRUvcZWD4tYusUOBpdY97aWIRQXqxbv6qoBx
X-Gm-Gg: ASbGnctUV228d5IQpE7tDIcVhzELpjgqcmO1+AH3rJ2ow47V70X/pg1WA8PsmKt1U9L
	tNvDw3GmKDQ9TSv0x7JG1z4JCUpf82+XrACUDq16vedLCH/0TLnB7EVojIY9aiTYC4ZEsaQR37B
	cYZifG4ZCfjJw+63J+2tw6vEXyeyGJH8jmi54Vh/WRc9tcXz1Bw5Nd7YVENbfJ3ieQBn33RwLqu
	/ano7YMA66zTwVM2TUe9Qju9mC0NR/8FEDT7qxXs+wHghUW8gxjzVMa5kk7wDR1WkO2V4nN
X-Google-Smtp-Source: AGHT+IG58OQhLBaPrhh2bJX4k9J0UG4UvxEIeq3Wd/sphHg+BCvjNpTkmqCSn1tq3goDjKzewrs4qw==
X-Received: by 2002:a05:622a:41:b0:458:2b7b:c45c with SMTP id d75a77b69052e-4653d6280c6mr235109651cf.39.1732562303245;
        Mon, 25 Nov 2024 11:18:23 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466a41010dcsm1193741cf.23.2024.11.25.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:18:23 -0800 (PST)
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
Subject: [PATCH RESEND v3 1/2] media: mipi-csis: Add check for clk_enable()
Date: Mon, 25 Nov 2024 19:18:18 +0000
Message-Id: <20241125191818.30708-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241125191818.30708-1-jiashengjiangcool@gmail.com>
References: <20241125191818.30708-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: b5f1220d587d ("[media] v4l: Add v4l2 subdev driver for S5P/EXYNOS4 MIPI-CSI receivers")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. Correct alignment to match open parenthesis

v1 -> v2:

1. Power off the phy and disble regulators when clk_enable() fails.
2. Remove a redundant space before the label "unlock".
---
 drivers/media/platform/samsung/exynos4-is/mipi-csis.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 63f3eecdd7e6..452880b5350c 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -940,13 +940,19 @@ static int s5pcsis_pm_resume(struct device *dev, bool runtime)
 					       state->supplies);
 			goto unlock;
 		}
-		clk_enable(state->clock[CSIS_CLK_GATE]);
+		ret = clk_enable(state->clock[CSIS_CLK_GATE]);
+		if (ret) {
+			phy_power_off(state->phy);
+			regulator_bulk_disable(CSIS_NUM_SUPPLIES,
+					       state->supplies);
+			goto unlock;
+		}
 	}
 	if (state->flags & ST_STREAMING)
 		s5pcsis_start_stream(state);
 
 	state->flags &= ~ST_SUSPENDED;
- unlock:
+unlock:
 	mutex_unlock(&state->lock);
 	return ret ? -EAGAIN : 0;
 }
-- 
2.25.1


