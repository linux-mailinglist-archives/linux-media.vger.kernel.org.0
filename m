Return-Path: <linux-media+bounces-21774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E707D9D53F6
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 21:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8929BB237F6
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 20:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2D11D363D;
	Thu, 21 Nov 2024 20:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFHtNl8K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B721BF58;
	Thu, 21 Nov 2024 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732220711; cv=none; b=I53uYZXd0ugSVjw0rphPq7kwDR1Su+2oXkwKan2v2LM6/dSz7XXDiuVI0WON9BED+cNItDyDHS0UIpUxswUEmxIW6BQsqQt9aBedwrkY2eNwwmZhoQEwrg9BfHnLO9p1WdA5OpPOrh3Mdf6LKRTr7xZ2lrgBZ7Zbk7HfAuQXugs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732220711; c=relaxed/simple;
	bh=CXqPNWbVPQ8qT6s7kSXjnP4nRBSsQDswLyOy90b73Aw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dLFSUJwz0KTmfFV0KtWIUY4aT0gWD6OtKIMVCCY39hy0ITd5MOoUK4ZWY2nUPolnnqseagtjSiXXGjJU+VvkwDsbkWKX7RcXMZLBV6rrFtZWnRf5DHX3os0oK1EiJ47N63glJFngM+EFTjNVro4eiY72b3grT6Ehh+hXlegmZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFHtNl8K; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d40d77aa97so9404086d6.1;
        Thu, 21 Nov 2024 12:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732220709; x=1732825509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/e+krLYjREL99mp3bPy7rS+1YPiak3kADaJAnlhlvS4=;
        b=aFHtNl8K6OTH5Eyin57i1Mhp8rT8g6uEoPGbLqhCBeXd6dOUPTAInNWJtaq2ZuOW9S
         s3fHKNjeN5y9lEid94KjRULSa8OsHE3yshdO5flmJRfpdP4rULI9YMu/zpq23X/5aUJu
         O56mZLKrTCa4tk9wGGGGC9CqjvHKhVO9zac+clYFrshkAdpHstTE0UTNNf6ikgTKCFA6
         OGL51l7K9C91gujmfATklu8Vw1+jR/Gi1tEGwfVDh/832BDi4I+KEdRNcb0fFawQBuV4
         Vz+4HmjnzLovHGW+NKjliDVlpziI4uI4uZo7pcwhCYMc5qiuI3K7xQUT856HqsjwS3zO
         kxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732220709; x=1732825509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/e+krLYjREL99mp3bPy7rS+1YPiak3kADaJAnlhlvS4=;
        b=rFDEqRvczg5en0cCrQda8/I2D6mzrx1Twpdi1sJWegZX4QghXuuHwn0X5HSJKgxEE7
         fgCXvuaDGhBcVcQ290vwyj2dwSM8mI9WiTH+PnSjTbKBMa8w7Zkcu10DxsZg6YO9QI6f
         t8udvLorZhXr0bYMYO/5pDQ8PbZ14imyUb0MLE+pynJZMlrkbSMVReIiP8M3R/Q1OErQ
         30Fs+a4nTmYv5xjKtRYA0fGFV6vyMwJiI5vaOAW2/od7ziqd9iKwulrz5xCvU4i/a0n0
         +1mP7Wx9lMWYv/UV+lwxNP177AziYVvJ822aDTOMjamyFw31kSCxqw7/qvOIo2Jq+jJt
         FM+g==
X-Forwarded-Encrypted: i=1; AJvYcCUXAyzkazYtnAM+PDTSYprr07YlCqooCRBEgiRykJtz9+Tv4AG/sI3ZKfUtv8JeqyXcDIuy6yMZT7JFYYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtKhKZN1f9m8VTgIESnNYhclbTLQiRGOY6WiQu8GAexuUZkB4P
	Ke6BPwDlm9sMDqL0wGqR8q7zmWSePWSitdWlTjZo15viVUQ8zXyn
X-Gm-Gg: ASbGncskcS8/ctVj6MPbYl8i+VHbPPRFVDADQfpuFNmA9ycrwCtrwVkB37sgl4pWjcE
	uKsj+UlyBNvVl2X27iD/XosrqgXn2bsmVP7l75/vAkUFfblA/9S7NQpbaoB2dSJ4oHEm4aKKWcd
	QY1+XIWO/Gi8rEe9sQ6zF+0TlHHDDbQ1aG72xYwwUxV1kfmuBZvm3D+IK2onLwr18HF8NFVnZxU
	Fp1DpBhhPOZAYbwStT+mfTLe6HcCsp3Zuq6aclq5QAeV1aA4mRZZ4ZlfSOT5xUoxZjv13Eh
X-Google-Smtp-Source: AGHT+IGoqyMhCm2tIV9WwuFSmLxkCZW2uuRBj/mFnPxUkD6XrOuBVQl0XTh18ZzItq7FZGSgcrZV4A==
X-Received: by 2002:ad4:576e:0:b0:6ce:26c3:c6e6 with SMTP id 6a1803df08f44-6d45137a320mr8333316d6.40.1732220708846;
        Thu, 21 Nov 2024 12:25:08 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451a96c4csm1397946d6.28.2024.11.21.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 12:25:08 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	andrzejtp2010@gmail.com,
	allen.lkml@gmail.com,
	neil.armstrong@linaro.org,
	quic_jjohnson@quicinc.com,
	lkundrak@v3.sk,
	sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] media: marvell: Add check for clk_enable()
Date: Thu, 21 Nov 2024 20:25:06 +0000
Message-Id: <20241121202506.37602-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to gurantee the success.

Fixes: 81a409bfd551 ("media: marvell-ccic: provide a clock for the sensor")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/media/platform/marvell/mcam-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index 9ec01228f907..47023e701e12 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -935,7 +935,9 @@ static int mclk_enable(struct clk_hw *hw)
 	ret = pm_runtime_resume_and_get(cam->dev);
 	if (ret < 0)
 		return ret;
-	clk_enable(cam->clk[0]);
+	ret = clk_enable(cam->clk[0]);
+	if (ret)
+		return ret;
 	mcam_reg_write(cam, REG_CLKCTRL, (mclk_src << 29) | mclk_div);
 	mcam_ctlr_power_up(cam);
 
-- 
2.25.1


