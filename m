Return-Path: <linux-media+bounces-48916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F12CCC404D
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687CF3074CF0
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374F833D512;
	Tue, 16 Dec 2025 15:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B/HC9NIU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494E8354AC5
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765899752; cv=none; b=YLb1kxuYKQhSgr4Nu8vWdFEwufYyLJlo3YX67TUibbtWao5a6Jwpo40i9bevfpzdLCarE6JEvbAfeQ4imrKaHM/9sPfdWH5/l3M9rNwejTx9fO/uAcyNl7OFVjnbayz9cGhcbZysYVPyLTGybqI2nChkQ1GmCQYbCoaJcrS/jrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765899752; c=relaxed/simple;
	bh=4muiAjHuAD7dYIfr73MQ3yyzrOuuTQnuoe/uC/hHsIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWDkW6C3YcUZitHH9gpDJoI4dIwx8030toJl5W4FLb4TCwBhnEFFn+MHaWKkuZKI9u24CRKN3NEu2owsr5XLLsaUC29eXhrOvSpHINWPDalK/8xosgaXNwZovap25PAPNkqCuXGm5o4PKaq08qQB+gANymVC3WNIJAwOZfbWUwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B/HC9NIU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-597d712c0a7so5619723e87.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 07:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765899747; x=1766504547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibUqxEEeYAT14DRs/j/XBVBOJBPbCX2lWNH1mmAv5Jc=;
        b=B/HC9NIUdh1wRKaBzYMX2S5UMr7hU5Tgc69VRyDFxvEij9t3byELs0Hq0t2FdbION/
         OCwgeSfN8UPajFlQGVnyFqQmJrAKv1QQNMOqrgYRg3LGG3EIKgapnYpkJ/5o0H/3PXp+
         ilBH/xRthzqeMS4ZfHHQeHN/P52NwhDgmNr84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765899747; x=1766504547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ibUqxEEeYAT14DRs/j/XBVBOJBPbCX2lWNH1mmAv5Jc=;
        b=w1ETFNYIWp1XfA3G/xgT/wmkhnxGGV/85V6MehfzTau4JKTHFVnbx1qC5AcTxrBSei
         D79zH9Cj/4jIY5hOMZutOJnz8fNDx6uCulyEJZn4OZ27sJiS5Tco6PS2LwV9CKDLK5YC
         w/ZEsHA0mw0V/eFXdQDYjndFS7gfo1V7mgWUaQSGgfFJ/0SZadPuy3KSSxaXTHYs/PmD
         u5PlOU3Pc8BQgiwMcy955RgmLGNpiGpyh9K8dyeEF0/c5KpxjeJNPPpcWV/pC36pUUnB
         ZnApl5s5m1/hn/6L/H/UxZlfZxuBwuTvcZU2MAHCWSK6Kx/TKEszx6A+KST+QWjS3CrM
         KhVg==
X-Forwarded-Encrypted: i=1; AJvYcCXwmUEt2UDUEwtBRKBT0SqynxbmT4AjGo3D9liNcTrZo7IAK5nnih5iAYdH7vK/Wvj0GRb6vusMnLQbYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQz0XBjw2Ihi9cRNxOe9TYDZioTa7+RJVnLLQiv55J5bxQ2n1z
	Xg6VqhmJ+witmi3RFr1lK/cZgEEAmQ4AChKGPU+pNi+dEwBbw14AtG5bD37/uz6/IA==
X-Gm-Gg: AY/fxX5ZkCuYhdpUi0UhDe9jEVXd8zWimyOQbBpoGXGweent8qH63SSVZApbZDTg/Ij
	TeuoRfWk6L3dvJ+lsCo7exXe0pzSNg4X4HnN/ZU1B8Hr6G4QuC3HRz4jFRDukHUxvix6hx+wOnx
	BZU3p03rxcCisfQ9cVaYZaXRxiRvI0uCy2ioVpEgM/HBzebRF1Q6BJBM4NL80qe6tuwY5NOzmcd
	wvH7PRFe3QuTVWyNFD82Ycd4+7cB4aEKRa8UuguvdC+y9xC2TnkV7+pj1CnoXDJOFPo0xpO/PDF
	lR/9b4c7tPnaFGN+NkSvKelVZ21VpBDQDvbNa+aykTVkjPOElBw48qjyHfrqnGFELv/LFbOi2ZV
	hk1DDa2ay/UCcwS6euHv/SBAD+uNUxtgoDalBiz4nwsBAjkg9+8B2fiy/c83ZrXPoo/mL0C+Iw+
	vFLJ0fPNk8qh1t0vRrecVhgWoDYOO93Eo88SJns/PF09FRruIkNBgE2q+WVyx0fbf+z7+kdJ4+W
	/2qnBuF
X-Google-Smtp-Source: AGHT+IEZ1MJ3LD/5MNrLllt28+1UFyOWGkybZY0pOHALDmg5lcghAE+VW/yCL7VugkHpkWECOWBwBA==
X-Received: by 2002:a05:6512:1390:b0:594:490b:4493 with SMTP id 2adb3069b0e04-598faa83effmr5186905e87.41.1765899747397;
        Tue, 16 Dec 2025 07:42:27 -0800 (PST)
Received: from ribalda.c.googlers.com (165.173.228.35.bc.googleusercontent.com. [35.228.173.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a4b8sm1003489e87.31.2025.12.16.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:42:27 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 16 Dec 2025 15:42:24 +0000
Subject: [PATCH v2 1/2] media: iris: Document difference in size during
 allocation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-warnings-6-19-v2-1-12075e3dece7@chromium.org>
References: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
In-Reply-To: <20251216-warnings-6-19-v2-0-12075e3dece7@chromium.org>
To: Keke Li <keke.li@amlogic.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

As we get ready for kzalloc checking for invalid sizes, let's add
documentation for the cases where the size is different but valid.

This patch fixes this cocci warning:
./platform/qcom/iris/iris_hfi_gen2_command.c:1215:9-25: WARNING: casting value returned by memory allocation function to (struct iris_inst *) is useless.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index f9129553209922fda548ca320494ae6ae797854c..c120ea3594fb5d0f40d6b9a7c67ffc28c42109f0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1212,5 +1212,10 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
 
 struct iris_inst *iris_hfi_gen2_get_instance(void)
 {
-	return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
+	struct iris_inst_hfi_gen2 *out;
+
+	/* The allocation is intentionally larger than struct iris_inst. */
+	out = kzalloc(sizeof(*out), GFP_KERNEL);
+
+	return &out->inst;
 }

-- 
2.52.0.239.gd5f0c6e74e-goog


