Return-Path: <linux-media+bounces-40464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05FB2E2F3
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 19:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881371687B6
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3805533470A;
	Wed, 20 Aug 2025 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zraZ3qC+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EDA32A3D5
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755709584; cv=none; b=e/NWXfUFNVSxruIeyQwGzJ9xg1sB/HDmbF3DaVmOaZ0ooqLgV3FVDmQTIoRyzw8acU1E10cAOQiA1tJbhzDm1AV0R+eks+SYiAkaXSOxT2XHCSwTibFynCEAkfowsxzHfIGqc/xHR5kbslB5QbS7uSBKT49kJ67PtUUfOuVCZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755709584; c=relaxed/simple;
	bh=5iUUGbp0UEqA3sYC7B+A5Qe7tp8RdReahVomvnfNEyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TLPNsIEooC4O0Cm3OGocPSQlGU8VCtAsq+kJ0y1x1OJkXLEkPf1NdA0VmCzirFHwV6ou7C6kpkz7WYEM7oSIv9/h1zyi0o1epAvfLFsK/QzKah2rnUKwKdDbDJqObng9rvowvw2KmhKwtImqxm3AMs9qL/rPZGzc9JNVWHJca+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zraZ3qC+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9dc52c430so114105f8f.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755709579; x=1756314379; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTDrNslUzosAJ4OswUc9P9uVR9h2bZ9JPrOTDIuKEL8=;
        b=zraZ3qC+eGZI2eHaK/secVvubFtkad2JIE3169iqXzuv5PN1ZiA1/rc4uVe4Otp5Kw
         o4E2sJ4a9rGwnH3d0IHkVmDlArFP7AXBEsZ5NQ1l37+nyG5/jngyUQjozdQDEz6U0gM/
         LYfxOWkuMuL6n3wJyN11MXjOtD2/pPtn3aegjrTOU+bbPUzm8t0J1QvJrcmmIHFx41Qs
         2+wtUTUuM5oLLyl7rdAKCl4tr9eDqRDU1BP9tgzqDXCpPEr4RZj1j4gm9YIP6rnJL251
         Py1ViMSY5stvDOItUXL/9a/J6tDeI7x+yOFo/QaolvuTXdKglY/EGmoxXF7ulObYZUN1
         x9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755709579; x=1756314379;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTDrNslUzosAJ4OswUc9P9uVR9h2bZ9JPrOTDIuKEL8=;
        b=MWE2BJry9m2PPHuPjBktmit8TlwCWcR+MW3B8VUbPxPDRmhCXsTQlvH93jlf+DTFW/
         0xbRq+xMkBzOQiPVCZEIIpQ4AA2mlCZ3KrI7Ck2QKXnNUPYXiD7jMF349jKm9D93Nyqj
         Ggt2RDUsB3lfwe0hgQosGFPo8n5Q17kOQWryozqeoFX3c/ZbqBZX/UVW9gTS+9WV79Ht
         wH/DAH8YExaFAACdt7Vo/l67f3jsLHbAOn/pPED5puSrA/jXp87/mP+upb35PFVqTBv5
         4IpoPzIwtL2s2UBNcCrCnwgBIxn3/YDVv26QEiGH/PDlzpyvLTiEDeKnTfqA65dtCBIQ
         El9Q==
X-Gm-Message-State: AOJu0Yxz+ME/sljv8ljbMHc6Mi4HkfBGZ9Dx1JWVjTXULtAA3fqzoEBG
	DVsoPQ0iWTNaS+0J0tFlhdgJRyXsSBTmJDhDNqP3VT0NONU/YULBIqvHpSG09hHTU8g=
X-Gm-Gg: ASbGnctYSaXMCaE2AfWpYMNjKRS8f7TqqykzAeOEBqtMP8bSy5S4FQhjP3Vv/mk7nAc
	kj1YHCWNOCmPSy4e8+/5XGiMXayz4JBO2lkJrFRL0mRUMEVEHlsB02lK39iRwSTeTEMYb872UWe
	6Ht+KItbxOlHAhkzatxo2fFxyxvg4eTfqSFxAzP1dDhkK/KLICcqPT/GekkcQEE1yHi1xsMUE95
	s7ioJ5flMmCml94pZX1hNY+l28/Da06tRTiKHTIJIbUZxk9IzxEkMLQku6btpAm+ocTMGHFmAIL
	9jbI6+8px7U3xGfYI5bmHrbxHZZB6xWuQ4WTKsyGrC7i3Pmw3FMcZH3FqZ5Vf6QhThNzH35cfBZ
	0qB1f5EjL/SFe/GE3PovT3OAg76EyFzxvXiwKmA64X50=
X-Google-Smtp-Source: AGHT+IFJwyODGkZR7lyWiHT3k8+qVTuyLmko5x5VPCzv77rUklSw+eaI+mTSJDBYV4fzQCGFCOfQuA==
X-Received: by 2002:a05:6000:250d:b0:3b7:905e:2a32 with SMTP id ffacd0b85a97d-3c32c434671mr2808528f8f.12.1755709578915;
        Wed, 20 Aug 2025 10:06:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0748797acsm8085516f8f.10.2025.08.20.10.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:06:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 20 Aug 2025 19:06:16 +0200
Subject: [PATCH] media: iris: fix module removal if firmware download
 failed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-topic-sm8x50-iris-remove-fix-v1-1-07b23a0bd8fc@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIcApmgC/x3MMQqAMAxA0atIZgO1YC1eRRykjZqhVhIRQXp3i
 +P7w39BSZgUxuYFoZuV81HRtQ2EfTk2Qo7VYI3tjbcGr3xyQE3+6Q2ysKJQyjfhyg8ObvXO2S6
 6JUBdnEI1//tpLuUDFiEBUm4AAAA=
X-Change-ID: 20250820-topic-sm8x50-iris-remove-fix-76f86621d6ac
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4334;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5iUUGbp0UEqA3sYC7B+A5Qe7tp8RdReahVomvnfNEyc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopgCJ91L7+RPvPhE4YwiK5+meNevOZjvfkx86kLqN
 f8vrL9SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKYAiQAKCRB33NvayMhJ0a3MEA
 DQy4aIePCaQAZRp8hTs3iLR1/MZae95DXA53KZ8oEbr7izD6jrlq2v2J2I4D6sn79sniUmBlv7Zl03
 dlXnoBC0EXfXSSX91YW54v8/w/KberFcrk0fk2fv17rvN9a4TTYd+W94ddOK0iQStR2M370zVQ95Ch
 ID3iHoWzCgCbw9Opd0Ryk3/RZLGo5rAft1yIO9mnYFoyUhd7HwSKg3CZF6ZuIEdLbKz2Es9mqxS7WM
 JwbfhYM9LC8OacAr1xCh8ocQzpI6o0cn7xM+AA5fDnbnPsY/aPEJFAYEMfOkafi+wJaaOGZe7Qi3gs
 SVCpe3lIO5c+y6LmKtgrhc2T69emF8+eCRi7o+OzYwRrZkN0LLNu7Ac3pFX9be2NotODks4A0Dki9f
 gdDuDvfr4z8h+1ptiR7S2MC/Xa22ZtBJ+W7Z8Fm7/+P9UTz1bxJ+12t6NexXzXmNGIxujSyIakBzf1
 O0WWQVD3IKhN5Q2vp6YS4vVx/puD1gnS0mhPiDL/8E1CNRTLbXfm64awXOYtM3cQHtZ43hpyWaQrbr
 E8CzXSE6RT4CoTtqPo/wW8bk39MOcTK4rvQUOI3iVt1p5okWCpXeTyKe/sbG9jMIrsvr8St4veAL0E
 i5B/lGPkdyuzC9UhR4MvER4pHilGdyb6Gd6HQLmx3uVn4xw1egpiuKZS62Fw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Fix remove if firmware failed to load:
qcom-iris aa00000.video-codec: Direct firmware load for qcom/vpu/vpu33_p4.mbn failed with error -2
qcom-iris aa00000.video-codec: firmware download failed
qcom-iris aa00000.video-codec: core init failed

then:
$ echo aa00000.video-codec > /sys/bus/platform/drivers/qcom-iris/unbind

Triggers:
genpd genpd:1:aa00000.video-codec: Runtime PM usage count underflow!
------------[ cut here ]------------
video_cc_mvs0_clk already disabled
WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#1: sh/542
<snip>
pc : clk_core_disable+0xa4/0xac
lr : clk_core_disable+0xa4/0xac
<snip>
Call trace:
 clk_core_disable+0xa4/0xac (P)
 clk_disable+0x30/0x4c
 iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
 iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
 iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
 iris_vpu_power_off+0x34/0x84 [qcom_iris]
 iris_core_deinit+0x44/0xc8 [qcom_iris]
 iris_remove+0x20/0x48 [qcom_iris]
 platform_remove+0x20/0x30
 device_remove+0x4c/0x80
<snip>
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
video_cc_mvs0_clk already unprepared
WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#2: sh/542
<snip>
pc : clk_core_unprepare+0xf0/0x110
lr : clk_core_unprepare+0xf0/0x110
<snip>
Call trace:
 clk_core_unprepare+0xf0/0x110 (P)
 clk_unprepare+0x2c/0x44
 iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
 iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
 iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
 iris_vpu_power_off+0x34/0x84 [qcom_iris]
 iris_core_deinit+0x44/0xc8 [qcom_iris]
 iris_remove+0x20/0x48 [qcom_iris]
 platform_remove+0x20/0x30
 device_remove+0x4c/0x80
<snip>
---[ end trace 0000000000000000 ]---
genpd genpd:0:aa00000.video-codec: Runtime PM usage count underflow!
------------[ cut here ]------------
gcc_video_axi0_clk already disabled
WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#4: sh/542
<snip>
pc : clk_core_disable+0xa4/0xac
lr : clk_core_disable+0xa4/0xac
<snip>
Call trace:
 clk_core_disable+0xa4/0xac (P)
 clk_disable+0x30/0x4c
 iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
 iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
 iris_vpu_power_off+0x48/0x84 [qcom_iris]
 iris_core_deinit+0x44/0xc8 [qcom_iris]
 iris_remove+0x20/0x48 [qcom_iris]
 platform_remove+0x20/0x30
 device_remove+0x4c/0x80
<snip>
------------[ cut here ]------------
gcc_video_axi0_clk already unprepared
WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#4: sh/542
<snip>
pc : clk_core_unprepare+0xf0/0x110
lr : clk_core_unprepare+0xf0/0x110
<snip>
Call trace:
 clk_core_unprepare+0xf0/0x110 (P)
 clk_unprepare+0x2c/0x44
 iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
 iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
 iris_vpu_power_off+0x48/0x84 [qcom_iris]
 iris_core_deinit+0x44/0xc8 [qcom_iris]
 iris_remove+0x20/0x48 [qcom_iris]
 platform_remove+0x20/0x30
 device_remove+0x4c/0x80
<snip>
---[ end trace 0000000000000000 ]---

Skip deinit if initialization never succeeded.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 0fa0a3b549a23877af57c9950a5892e821b9473a..8406c48d635b6eba0879396ce9f9ae2292743f09 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -15,10 +15,12 @@ void iris_core_deinit(struct iris_core *core)
 	pm_runtime_resume_and_get(core->dev);
 
 	mutex_lock(&core->lock);
-	iris_fw_unload(core);
-	iris_vpu_power_off(core);
-	iris_hfi_queues_deinit(core);
-	core->state = IRIS_CORE_DEINIT;
+	if (core->state != IRIS_CORE_DEINIT) {
+		iris_fw_unload(core);
+		iris_vpu_power_off(core);
+		iris_hfi_queues_deinit(core);
+		core->state = IRIS_CORE_DEINIT;
+	}
 	mutex_unlock(&core->lock);
 
 	pm_runtime_put_sync(core->dev);

---
base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
change-id: 20250820-topic-sm8x50-iris-remove-fix-76f86621d6ac

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


