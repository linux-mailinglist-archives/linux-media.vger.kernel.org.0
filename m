Return-Path: <linux-media+bounces-23511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D19F3D37
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 23:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3740816C8EC
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6446C1D618E;
	Mon, 16 Dec 2024 22:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="fN6jiyDz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1A9BA49;
	Mon, 16 Dec 2024 22:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734386795; cv=none; b=g8TyK6Z68KKo1f6cUmocdr6oxy8baslfWa3fFm5YWXqCFgHMJiHjAp21/K0/uL8VNtUjNTiLQogC6BhEaftpKtSLifVbTAjLQ2LvpX9TjKP0ekk+vCd0oCCwsw/vKHNBju8qK1JHwI6/dz84/QVHnzsQDvzKVH5GjZIje0aleDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734386795; c=relaxed/simple;
	bh=icMx43hRgyr1P9e7gUKFaT43mFWrxQOOojFprXBGmNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g3/7FMJ7O8TKM049ob3rCmGHDoq8AVXBBF9hX0O8Nnd1wv3/gOwE/UzF+9HUS6B9yPdQ5o31b5r1vX/78v6F8NYAs695/iOGDjcty5d+bCzBEDnCTxbCoWX8TM3ebsT1EM+9mOJkzQorJKu8Dxg/Y9N/13H1WNmEy8J+3NjH4b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=fN6jiyDz; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=OhYB5xvUHbZKoooV6q/5gst0XnhfPdQEMwD+Tskq1s8=; b=fN6jiyDzcAhxiDEB
	MW8IcNSWcO5BCynIAyiG1bnDrAE/TwiKr36rWJMRNf18F+9LPWr4On9Kpp1w+OsvgGPxQSN1rGEJq
	zE83LVoc6rMbL6P1lRcor6JxIaK2nf6kEQ1avdbEV1m2oydnIWZz9mJGxhVDuC8Doqrsj8Eb3m72B
	H0k/HNj28TYqsWif/LUqethGPDmVZmVq5U0G5KX7KxvgaUu7GYuzN+67OSHEF6/xh3UdPF0urNaHZ
	ygv8hCR+WPZs16qOOpXXfait2vV55LmVLvR0AI+Hx6G9h0wUa2G9a/pDGrOkOv3+AZXI0njSDUKQN
	4DcfL3ADNtXY9mTybA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tNJES-005jOo-2g;
	Mon, 16 Dec 2024 22:06:28 +0000
From: linux@treblig.org
To: stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: venus: Remove unused hfi_core_ping()
Date: Mon, 16 Dec 2024 22:06:28 +0000
Message-ID: <20241216220628.1018633-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

hfi_core_ping() was added by 2017's
commit 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware
Interface (HFI)")

but has remained unused.

Remove it.

It was the only caller of the ->core_ping member of hfi_ops,
so remove it, and the venus_core_ping that it pointed to.

Note I've left pky_sys_ping which seems to be the lowest level
definition of the command.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/qcom/venus/hfi.c       | 23 -------------------
 drivers/media/platform/qcom/venus/hfi.h       |  2 --
 drivers/media/platform/qcom/venus/hfi_venus.c | 11 ---------
 3 files changed, 36 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi.c b/drivers/media/platform/qcom/venus/hfi.c
index e00aedb41d16..675e6fd1e9fa 100644
--- a/drivers/media/platform/qcom/venus/hfi.c
+++ b/drivers/media/platform/qcom/venus/hfi.c
@@ -138,29 +138,6 @@ int hfi_core_trigger_ssr(struct venus_core *core, u32 type)
 	return core->ops->core_trigger_ssr(core, type);
 }
 
-int hfi_core_ping(struct venus_core *core)
-{
-	int ret;
-
-	mutex_lock(&core->lock);
-
-	ret = core->ops->core_ping(core, 0xbeef);
-	if (ret)
-		goto unlock;
-
-	ret = wait_for_completion_timeout(&core->done, TIMEOUT);
-	if (!ret) {
-		ret = -ETIMEDOUT;
-		goto unlock;
-	}
-	ret = 0;
-	if (core->error != HFI_ERR_NONE)
-		ret = -ENODEV;
-unlock:
-	mutex_unlock(&core->lock);
-	return ret;
-}
-
 static int wait_session_msg(struct venus_inst *inst)
 {
 	int ret;
diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
index f25d412d6553..0338841d5992 100644
--- a/drivers/media/platform/qcom/venus/hfi.h
+++ b/drivers/media/platform/qcom/venus/hfi.h
@@ -108,7 +108,6 @@ struct hfi_inst_ops {
 struct hfi_ops {
 	int (*core_init)(struct venus_core *core);
 	int (*core_deinit)(struct venus_core *core);
-	int (*core_ping)(struct venus_core *core, u32 cookie);
 	int (*core_trigger_ssr)(struct venus_core *core, u32 trigger_type);
 
 	int (*session_init)(struct venus_inst *inst, u32 session_type,
@@ -152,7 +151,6 @@ int hfi_core_deinit(struct venus_core *core, bool blocking);
 int hfi_core_suspend(struct venus_core *core);
 int hfi_core_resume(struct venus_core *core, bool force);
 int hfi_core_trigger_ssr(struct venus_core *core, u32 type);
-int hfi_core_ping(struct venus_core *core);
 int hfi_session_create(struct venus_inst *inst, const struct hfi_inst_ops *ops);
 void hfi_session_destroy(struct venus_inst *inst);
 int hfi_session_init(struct venus_inst *inst, u32 pixfmt);
diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f9437b6412b9..a9167867063c 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1178,16 +1178,6 @@ static int venus_core_deinit(struct venus_core *core)
 	return 0;
 }
 
-static int venus_core_ping(struct venus_core *core, u32 cookie)
-{
-	struct venus_hfi_device *hdev = to_hfi_priv(core);
-	struct hfi_sys_ping_pkt pkt;
-
-	pkt_sys_ping(&pkt, cookie);
-
-	return venus_iface_cmdq_write(hdev, &pkt, false);
-}
-
 static int venus_core_trigger_ssr(struct venus_core *core, u32 trigger_type)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
@@ -1639,7 +1629,6 @@ static int venus_suspend(struct venus_core *core)
 static const struct hfi_ops venus_hfi_ops = {
 	.core_init			= venus_core_init,
 	.core_deinit			= venus_core_deinit,
-	.core_ping			= venus_core_ping,
 	.core_trigger_ssr		= venus_core_trigger_ssr,
 
 	.session_init			= venus_session_init,
-- 
2.47.1


