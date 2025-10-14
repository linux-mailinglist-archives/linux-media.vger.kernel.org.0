Return-Path: <linux-media+bounces-44398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D270BBD8DE0
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 413CA1924E82
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064782FF14C;
	Tue, 14 Oct 2025 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mf9AQlgT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3E2877F2
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439631; cv=none; b=t4IMJcuX4YjB42HRihEqoYs8UGvFBWfIrMv2zNF00pKg5qC1r08eFxh3XllvtvZsbdfW2rCIjDZDzWNbGFRwuExF5tIXv7Ju+mEdPlMTucEN3qbOtk1ONNb5kEmaVnjS8r/6w2QzBTNtO074WEEdefv3k5mN6/7q0MFOm6nppfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439631; c=relaxed/simple;
	bh=xcEHefptRm3q+B/7MsjmtDUbajTynS8kek98wtLXEzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TI+tCEfn1ZgjoS7YZs7oYpBAF1fY917cznVJuB9R4bo+QlTmrP1znRhK7RjS23niFG2q4EtMqFalfpzaLLcovqq05u0N+lxgS/SsIu+WA4dG2NDb4/4pGo9BVxYvcnlPA/lEaFRy1Bmw0focBnGCWv3MA8VoP+69ZI0vXEIvWdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mf9AQlgT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59070c9111eso6343298e87.3
        for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760439626; x=1761044426; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jjAPjhv4d448Try5P0FP2VsI1UmiEtL4eWhCUt/f9q8=;
        b=mf9AQlgTA4U5NsEiNUucZFru0M7YYsnkzqo5Pz3G2gxIpBuWwJ3eWvXNvUYowOQ/P8
         3Oe/CUenCD8YilSHzT1EIaSrJieK4XT9SPWVEdgY1b1+7YAg0KSCu/oTVCuUtQI+215H
         x2AXSG1teaKrW51tZsBbFbNAeyWvDpUPuAjSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439626; x=1761044426;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjAPjhv4d448Try5P0FP2VsI1UmiEtL4eWhCUt/f9q8=;
        b=qU3ZruZVwdU6DedHGICKqdH/wNcaY+J1FQnkimUt9IEJxU216rSB+UI1r0K3pekyYu
         pUjnDDPporvxc7y+Z6RzbwXHmxIxELhL9kmkG3VjwYcxGYuhs/WsKMNmyiVrqmvT5keI
         yc383IGM2Jy2hEoPkvTv3qrogQSvGpiECIjaBr1ZG3Amr7OygFPujT/n9vA6wu1M5vVZ
         SbIYCksRMAUuvMqEehCnVELPBE2kx6T+B/6FVtImdzO5E9PwhJ+etXo5EgvAzRdXZimG
         65vC2doTHpRqD0w06Qe6sLdH3pXfImzL0dfyskx3m8fVSt+A2zZAJmLakuFBQ4w4rjHz
         l5Ug==
X-Gm-Message-State: AOJu0YxoR5L4rBEpX4cqTvKWjHfaDDvD1EJIyce/7i+bwasmDkCknKr5
	/xh5KoHhFNEWcyaQHdgOUBTRNNrMZDF7bfQ0DF1hAkxv9A4CliME1LqnJef8dF08O62D47NHoO3
	sVamd90eD
X-Gm-Gg: ASbGncuoGlqH+ZHYz0LakK0XuuHgbZHpmcbcX3kYFLoAxCIZ19tlR2twuDewPwqdF2l
	7wi9oya+foOmKDKSpfHsF3zuXQ0AzkHrsZfboPwL+nXmRUyOLlOFBhFqD7C/9kNQeoU0hG8psmw
	7O0rsqBZFME9IxQf1cnaaWXGf2IkwFVhvIOvQWGgVP1R56XVRL2yX2J0gB9YTImFyYjCG1jjOrB
	mtuk5kHH/GMTMmz44k/S64AcgCY8OcIIG40ltcw/qSn4FbeuxmYKJPBTnOsJdVE9cOIUP1FGx9N
	6mPsOFIrYrav0rfHO8CFI1L0ekxRI+Nd1qIFx+iAnrf9EHzBmYFYWtGJPwkJSFoetYzCLRU9IoZ
	mtVTuL7mSdujuuKVEAl9nj8iUpbxCXe9+4J2/gOwIl1HGmFkpchaLsbcLNkk35Z561bGrH1uzF+
	UE0PzYpb0vfNnVDcYsx+1H
X-Google-Smtp-Source: AGHT+IFGWJThrVzinUTUKLlvxn1wPB2/v9XNcpskq+s3lKiZ/x5AJ/mF4Gm9gftYdVHKyFf+eUCPIw==
X-Received: by 2002:a2e:beab:0:b0:36e:4481:9e89 with SMTP id 38308e7fff4ca-37609cf6b00mr66565701fa.11.1760439625479;
        Tue, 14 Oct 2025 04:00:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77c9f9sm39153191fa.5.2025.10.14.04.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:00:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 14 Oct 2025 11:00:17 +0000
Subject: [PATCH v2] media: i2c: imx214: Exit early on control init errors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>
X-B4-Tracking: v=1; b=H4sIAEAt7mgC/3WMwQ7CIBAFf6XZs5iyBUVP/ofpoQIte6A0UElNw
 7+LvZt3mpfM7JBsJJvg3uwQbaZEYa6Apwa0G+bJMjKVAVuUrcIbI78hFyz5YdWOaWHqrgKVkVC
 dJdqRtqP37Cs7SmuInyOf+e/9V8qccTZ2hl9k9xLKiod2MXh6+3OIE/SllC9kAj1orQAAAA==
X-Change-ID: 20250829-imx214-smatch-c4d4d47428d5
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Now we try to initialize all the controls and at the very end check
ctrl_hdlr->error to check if one of them has failed.

This confuses smatch, who do not know how to track the state of
imx214->link_freq.

drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)

Fix this by exiting early on control initialization errors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Right now we are handling this with a quirk in media-ci, if Dan cannot
fix smatch in a kernel cycle we should merge this patch.
---
Changes in v2:
- Fix typo in commit message commit
- Move error tag where it belongs (Thanks Hans!)
- Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org
---
 drivers/media/i2c/imx214.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..c66f0e18726c3fc15df91c37888a797bcea82134 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 						   V4L2_CID_LINK_FREQ,
 						   imx214->bus_cfg.nr_of_link_frequencies - 1,
 						   0, imx214->bus_cfg.link_frequencies);
-	if (imx214->link_freq)
-		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (!imx214->link_freq)
+		goto err_init_ctrl;
+
+	imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/*
 	 * WARNING!
@@ -1099,6 +1101,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
 
+err_init_ctrl:
 	ret = ctrl_hdlr->error;
 	if (ret) {
 		v4l2_ctrl_handler_free(ctrl_hdlr);

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250829-imx214-smatch-c4d4d47428d5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


