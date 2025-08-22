Return-Path: <linux-media+bounces-40739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 675A2B312CC
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 11:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C8A1D006A6
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 09:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA462E3B18;
	Fri, 22 Aug 2025 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VV+A+wDW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A3214232
	for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854407; cv=none; b=d345FJ01L2GLCqYsTNlN3YzeMNPL+1t77lx/yW/cfTXUCfjh2Jz2HKcuwXpspRcE1O4cnSIfQvJPeCSXTIQg6wRNTJiLp3svAe/A9brHOv9JtIQZQfr7ErbYLXyPcVio1bVV4qgRs3Q6Zug4fFMnGcvVCNel3ZgmA933Tl9P8ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854407; c=relaxed/simple;
	bh=iM0FAlXoDiAnqKjE56cTuUMYBOH6AEfWAW+iy6g2ImQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uR7CXs4kYmkcoL1ybEsRiEeE/vZvRv7BVzOO+W6MWMb7BbfVJaP5iEVD8oX1uGHbC1IApVotn7Bm0tOdvxWvB5wQAIBo5Yc6AI0P006ShNDrQLDHN+t82TMpbBsj8NiuLo6oPXiN/FReLHohPRMpuMx/SyfKKbp7rIALxnVmBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VV+A+wDW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c380aa1ad0so1018233f8f.3
        for <linux-media@vger.kernel.org>; Fri, 22 Aug 2025 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755854404; x=1756459204; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0/+9yqFoKIvAVObRIwLOna6zmCwJTMEn2vAw2VG6Kg=;
        b=VV+A+wDWSMlmDbrmBpKpKfwi3sfKXPPgYYehKKbA8Kjxknwf42WHS9ia/n2RnFurie
         AwAOZwEiaJMa62tApB4kFB77xJ9D3MRGpq03f/4szcbxcYuehHbSHWW3G7YCJagkXDqW
         /Jzd1vFDA3DureXWaYH1IoWG8OuW23FhvxdaDQku1SfU2p+vCVpFx5qvU4N4keglCtKf
         4dY47luSBLn4r97XqzqvQRR18v+YiUweD+tR42tcPFG9mCaToJnOML5i3sxjgRuUJ+U5
         8PEgz+20rsgHe1yhn1w9Om/DEH0dPI60M5pqvv5BxkerZgKsvGZFUJpIzPmS38A45HQi
         Az1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854404; x=1756459204;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0/+9yqFoKIvAVObRIwLOna6zmCwJTMEn2vAw2VG6Kg=;
        b=U7edRZImFdRZO0C2b3ohiVIG7AjleK4z/e9Pm+6FFpI2+/jNNR2wn4LCAxcvy8WCGX
         MOXqxlkpN42GDgD8slrHr9yij4FeHg/5U1GGxKWuq3+FfrsEPPVWkQEEeDf9kJJZiWMB
         YdHv+ymYSbqWai0vlFWHvHhFTZ/ciXgR2ucrq4dhLkUUq9x5/ZRCC54u/XkT9t7pg4AC
         ZsiT9CFBJbrWqmuwnGIxylzbCA/dHMi3NdwUIvYTJtDLh3wTpcutkpWKGTQexnqM2nsX
         bbdOSinf8jE5qyt5JWMoBCOLEIqLrmL950tgkysLtcooEBKYs0a5qWf9t1Z2n8vgtYi0
         XUgA==
X-Gm-Message-State: AOJu0Yy9m39kEzFO7U/s1e5j4BQ+UH29G9TtAzkmCg8eDVB4r8jrFMBa
	UWKf80ll2Ij5q5aRO6a6HvjjtdTnMJzZHRsBisQ1heyyDnKauPZjUnKIiHOYwGc9GWw=
X-Gm-Gg: ASbGncsPQoTR0lEqETHqKdiwiz9uHVAObtDRV+B9kvhcuLvukl0r5fdpXXp0yqAse8P
	T9KR8X7GN94Vm6AqNNmvjhfVTk1ooNwXBifc5i7H7qBADsFhi/XHjKIw8rRgfc2iMk/EnkXriNZ
	n7ktQbizipRTC26T4z4Ia8m99S8+xs94LDkf9ql1BmvYf7Ma3Wz1mqX+hTyxfNn4sKF5Tco6hdk
	fD7W/8MDKzmxNhsy5CY40QiSI6yk2B13rSzazyzEexpqziyrg9bYjFrmlyOrxm0XudRMxF3AuGE
	SDccYLI4a1VquEBpXqqp/FX+DE+6Ma2qoWSTiMXLQJGMiqeUbcmm8BKuLRKK8OxtCzs8VZo6bhz
	DNhesgl3jWc7pAEt0S/EtWUHJlj+4A5+ffa77NvUnfiM=
X-Google-Smtp-Source: AGHT+IErm/G1H55TuP6+Hp23h4l7QjnCdC3Jl1cv85GdjdCTkLgA8VEUKXNV5pq6R+jKnhruCClfnw==
X-Received: by 2002:a05:6000:18a3:b0:3b6:1630:9204 with SMTP id ffacd0b85a97d-3c5daefc7bfmr1455599f8f.19.1755854403564;
        Fri, 22 Aug 2025 02:20:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b51589647sm24913475e9.2.2025.08.22.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 02:20:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 11:20:01 +0200
Subject: [PATCH v2] media: iris: fix module removal if firmware download
 failed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-sm8x50-iris-remove-fix-v2-1-5dc41c9b2731@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEA2qGgC/42NQQqDMBAAvyJ77pYkxRh66j+KhxhXXahGNhIs4
 t+b9gU9zhxmDkgkTAnu1QFCmRPHpYC5VBAmv4yE3BcGo0ytnFG4xZUDptnttUIWTig0x0w48I6
 NHZy1RvfWByiJVajoX/7ZFp44bVHev1vWX/tnOGvUqJrO3LzqejeEx4sXL/EaZYT2PM8P7gr0j
 8kAAAA=
X-Change-ID: 20250820-topic-sm8x50-iris-remove-fix-76f86621d6ac
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4854;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=iM0FAlXoDiAnqKjE56cTuUMYBOH6AEfWAW+iy6g2ImQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqDZC4mw5gAKtCiSvzJVE+Ed40X375bBKxYiy0J0z
 UgVUPCOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKg2QgAKCRB33NvayMhJ0dcYEA
 Cs6CJgNrTjFuO6/KNaIJ+m5Vmki9Hsi0CMsahoKALp0hWfYmoQAsj+Vk7WpSt2DAp4THnzJOsECaq0
 3Gl8y/vrVRNCmPqtWcySN4lnGGmt1FBjbM362eMDK57SAR8frQIy5undxpJPmPPbFc7HIfIMiEbZF8
 oGnftnIWJiCTSp6M39/nXiEBKfPODYlxvr8j3mlr9SYBjMfgV71nR8JwFU/qZw+PgHKpMWEb4omfXa
 quPQaDmuZOOfwM3EnoOI/lb+hC52MCCvnLSWY1E4AbQa62wC+fAuurHifGdW6JLjQqVpO1OL8g6iBD
 AZqVH8mTypTGGRxxuw9XM5At/EP0WMz9Pg6sF1HYvXP1O/aoQehwDLBiFqhRGpAze+jRgLXlGI7tjQ
 llurkVFOOgl4R3cB6Rxz8BrNkbF0KxrR2YLH8KOuiqcvx37729AeWy1nzSW0xwLxRSA3HBU2bqFGPa
 K4L2UQC7M6Q/588gGtSWHfr4WpMLs/hknDclWnESxsIBEbXWmV8BzWJsV0XnTpYPydAZnKbQwx8HV8
 MBycLq+p7E6kkkUZtJm3AjhYefudyPEtdUhwRHVyzf+REk/H6/+BGYLpVeDxZHOF5hQwNl/OQV6/4J
 GD/HrhdPVtMKBMe4rnRRBSdvDJ+/DLz5P67MSCfhIqOq64i3+Lw+/f/lXQzA==
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

Fixes: d7378f84e94e ("media: iris: introduce iris core state management with shared queues")
Fixes: d19b163356b8 ("media: iris: implement video firmware load/unload")
Fixes: bb8a95aa038e ("media: iris: implement power management")
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added fixes tags
- Added r-b tags
- Link to v1: https://lore.kernel.org/r/20250820-topic-sm8x50-iris-remove-fix-v1-1-07b23a0bd8fc@linaro.org
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


