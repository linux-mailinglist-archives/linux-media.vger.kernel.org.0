Return-Path: <linux-media+bounces-22573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D869E2E19
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2392838BB
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B390A209F41;
	Tue,  3 Dec 2024 21:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8XDxj0K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D9D189F56;
	Tue,  3 Dec 2024 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733261347; cv=none; b=T0Px+/YALznOtVnG330Y1lkSH04tv67cCzIYdE/xBdL7xPMwdSceL0sqkA5agNYO3dGFRZV9yWnDmoHrkZL/TDJ5jYtZ0LehIbNubeG0Vj2NGCN1GYPnPjPw6gi3kj8Am0KJyqODi6CntqK6jWUsCEwcZVXjzME7NDPuCgBqUQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733261347; c=relaxed/simple;
	bh=e/iMXErW/iZMIekKWnZKp8xRj8/rK/L+kixlsBNqhwI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r9ERJEv0u4DW4zipIOnryV9idvR0itfSmBztItSNMm04D/ucdqKrMgItYCFxhgzCCwSmt7JISiUH7d0Fo0f2Yv7anQ70qee0FXcSuVmGLHD8dL3OL+B5lprnwYhyFIFfvG7MugABBqwJfAx3KIC1OWW8iSDHJV0mj4wyLIVLLpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8XDxj0K; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b673cb2708so403245385a.2;
        Tue, 03 Dec 2024 13:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733261344; x=1733866144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yzaU9WbXWKSmehPViJwiD8qzEdE+I7D038C8G0+WbuQ=;
        b=R8XDxj0K4UMGQM91gSXBIrT3XRWjkAcgLhdH1zEUL4MVk1NpoGsA6DiQK23TbYMWxi
         aCnQZ562o6g7TCYNUzmCz+14GQSV3ixhNsqhQJQAN5xt/9rWxyARgQzwjLAKKLoi3Frz
         IhG26iTZL7nt0w0O6scekvgKyV7irRTVxf4eDWellFHWk7EEjLF3CiDeL9z5IO7sKCxS
         9pyf5okuaP3BL3mLTEsiUc+KPQVcaC5vgfWDe3w4GFTHjIqjVJMkt80sUiSOlqIz3WE4
         i9h3qE+p7UmtQ4pu2qSXCjixhdeC5AwmMHJg4BViK0fsjDIYGYqf5Twp2FXlFdC9PjaM
         djsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733261344; x=1733866144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzaU9WbXWKSmehPViJwiD8qzEdE+I7D038C8G0+WbuQ=;
        b=OrxggKyf4c5CZXBwWVmmM0vI72k7UpsW1syZZlExHvC39QpHD9ts5LFE+OnHTJ+aVc
         FX1Kx9lp8u7WtsbaxbCRUd/+qtYvbnOlRgl6sbHffF7UAnvRzXDeREYIIBTyA/11HZZS
         6hFS7TSSEyeoelY5BV0jq4lL4tgysuWDWt8Cmqyzx8tFvr7DRiZWk4iw6wkp32/S9opK
         8rjFk8qnXVixmNN5pW9Ht4q8zPjIzMhkp9SGqRbI3zO+XUYt6AvCqZWc2cPU9bQuFYK5
         okWS19T1WxqI1ex3J3d+/J8y0isqY9VOFYQMqMQ+u8GCLAiCEuIP2REjELWXd/k+yp+q
         Bzlg==
X-Forwarded-Encrypted: i=1; AJvYcCVer+ZgKzXYw+4m4Vv8EGEqbQPLZW6yTH9PF1hlft8ai0JBwbCtSaFZthWcto079VTTGfYSmLNWBXKxwCo=@vger.kernel.org, AJvYcCX2vqOoXqe9RhFxQs/8A4dHyYwZrI0Qo0Q0IAZXdFyAJtd5g6LTRU5azt4g1ZfH7nWHo+OKPfKPO20Dk9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA1DkydLbS/y5l7p9r8ux+1ML6ZQiVn+bWEi7QIlDzZv5zyGxC
	LRTLnX3lO7r7JMXi66POW6T7MPAnAvjpvNkrsZS3Tqm9wo1bBXAp
X-Gm-Gg: ASbGncuii9gN7qxNdZBwflvjS4iIcgCWfIZZuzLqvHrn4tU4/WDeBmEDWXTYcVtDLOF
	7MHLss0grEdkC2YbjHC7ABnkPP4Z0nUhcJ6W9y1ld1mD6iDzsGE23Pv0WaG1piTDZ+KW/Y5caPy
	kk1nlKZSGd7yEp2aZeh0bKwsokhCccBVNi7bpQwhuu3s/2wrkeL+jt7ch1h+JzlgDuK37kTi9dE
	3BvMN4e+YE6zOQg7K3Jrf898bF0fxmu0Lp67zLvfM6OfsVwebMeV+VpDRGqLax7I13uMx8O
X-Google-Smtp-Source: AGHT+IEVedl7M7CWEEciMUVASAAqqGWxX9IbmEr5YJtEzctnTGC0cfsxZ41ZYPdpvgVXmNIpVgbB3g==
X-Received: by 2002:a05:6214:212b:b0:6d3:b636:eccc with SMTP id 6a1803df08f44-6d8b732cd14mr53760666d6.21.1733261344623;
        Tue, 03 Dec 2024 13:29:04 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d88cca0e06sm49942396d6.105.2024.12.03.13.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:29:04 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: hverkuil@xs4all.nl
Cc: mchehab@kernel.org,
	andrzejtp2010@gmail.com,
	allen.lkml@gmail.com,
	neil.armstrong@linaro.org,
	quic_jjohnson@quicinc.com,
	lkundrak@v3.sk,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2] media: marvell: Add check for clk_enable()
Date: Tue,  3 Dec 2024 21:29:02 +0000
Message-Id: <20241203212902.38116-1-jiashengjiangcool@gmail.com>
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
Changelog:

v1 -> v2:

1. Add pm_runtime_put().
---
 drivers/media/platform/marvell/mcam-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/marvell/mcam-core.c b/drivers/media/platform/marvell/mcam-core.c
index 9ec01228f907..b8360d37000a 100644
--- a/drivers/media/platform/marvell/mcam-core.c
+++ b/drivers/media/platform/marvell/mcam-core.c
@@ -935,7 +935,12 @@ static int mclk_enable(struct clk_hw *hw)
 	ret = pm_runtime_resume_and_get(cam->dev);
 	if (ret < 0)
 		return ret;
-	clk_enable(cam->clk[0]);
+	ret = clk_enable(cam->clk[0]);
+	if (ret) {
+		pm_runtime_put(cam->dev);
+		return ret;
+	}
+
 	mcam_reg_write(cam, REG_CLKCTRL, (mclk_src << 29) | mclk_div);
 	mcam_ctlr_power_up(cam);
 
-- 
2.25.1


