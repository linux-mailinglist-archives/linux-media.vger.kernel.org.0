Return-Path: <linux-media+bounces-59108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPzxAZ9Z5WnCiQEAu9opvQ
	(envelope-from <linux-media+bounces-59108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 00:39:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C0F425B5A
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 00:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D101E30060B9
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 22:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFA9314A84;
	Sun, 19 Apr 2026 22:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmn186nE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE402FB965
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776638353; cv=none; b=S8Lz7j55nSS7lg0n/Cfi6t0BEA2Piur78a3zKn7Ko+AM3Ik5+o+2dSKvaQvprH6X129ZqHFCgCviFwm/MKiz4LucL5EPBc3xCG3FhzyRSts4QVVWyHahefAgsah52JmXZ74Wk2JAQsJerGAk82XrqVtgycGeOPEdfJi38UkaduY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776638353; c=relaxed/simple;
	bh=22Lj690Gzt9GJNADN9EbtC4X0CbXbhABySU67c5PTv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EtXjkeO5VUEV1qaRDOvDR4XkimKXcVw4tvTa0QKT/noA3gdMM5lfZNQMKmMS46Bl9kxGnvuFZM8pKA11RxBmiNRef3NDhyqdz1PCHV7rW1RPrUPJCOUOndjQngs0O5HeWTaoT7Dn3S1ZHmKhmdRYO5/3gDVX7t85qvc6q2g/MI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmn186nE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1498586f8f.2
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 15:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776638350; x=1777243150; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQhdJsnkr0r1ZwZtJ8Tk3lop3elWReVVZAk8IPtXPWU=;
        b=dmn186nETOcsIMnL7sU3Wf/XSxap//F0ppIeezrpHq3OUkTa+vVn+Vb1/4mVjPYIwj
         q1UcukVAl3tOWKalP2IrEiOC+DzHBTvhuYTNM6QJG42iWNtT1FE/115rj3cTyC3VF0mO
         3YMaOT7n+LArjUEvSPuO4K37ZAKwgGkqKEEx0BBTaWBOybvH+xD4QSUqCACkrMOmc7Qj
         xGNDauTqZL+p5DNSfejF84WkKVQKJjPZcuAoqpAl6wA+rYfYiFGpkpz+CB7w73GqFEn6
         sI4kDieGtoR3gut7xo2XTDaPGEWEIWkELkPrC2gY389a+22vlqnM3FhZwhf/ClAurFcX
         nYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776638350; x=1777243150;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQhdJsnkr0r1ZwZtJ8Tk3lop3elWReVVZAk8IPtXPWU=;
        b=fr1ML7Wx06irihhptq8Md01GhyiJgORr/9DJsrW0UX6b/XCvmdf/aXfTidB9PwL7C3
         tRPxPcELBLRjaq6IRIPgcGfHmUszPfGejC/PBU/vPXcaDY663yZnA9cdNerPyFyG5tip
         c0oncEhH0ZSSoPmB5KFqPzyjATqwPGGZU1/33heiSyJN9d0En3m73wj1mg4Bn4ctxxBN
         acykRw8kXoR2GEvvziiVWSgvaiBaBfJ3jRdg20ksHJfzMODZn6NynMQ2kNm81Fqepobv
         Tsuj09mojOaiRljd/QWQ35VBXM8eLUOC7gDOcZRyEOjgtoLBeVZnRsX5ZwHZXCFHpBEn
         9I8Q==
X-Gm-Message-State: AOJu0YyK8+7gtyKj37isr8lmGxrKvVRGjgqwwAWl7Y2kAj4jxUvXauf6
	lT/ZA0gVqfcy7RdVYOjLwZ11Z5iUK3M4HTIMTyi09/hThpeXvt2gEezZOBmNKjF/QgILTro8euI
	ppMjS
X-Gm-Gg: AeBDieuXCe9T36YY4nlWjE4qovaTY4tVDtwX0kdgcwXC3fMhp/ZDJ1AyxlGRlvo7RK8
	9gsFKdAZ+rzY3JEK9wWeye6qIz4l4JgPUdEDQZMc9Uys5/JwKCQ5pJ+k+shFi636AgV3Lecaa3p
	PRQnyWkCIoLICcqV591bsnLQd1BJpGE0NqI6c83/lw7qKa4hcLp7kFVWvqsTzME3sr36niB4jvS
	wAOkTjB6JyF/hkLEHXn2Y/6XDS/cp60y/36DbdaAuFDkTGjTPjaLQaUenXC/V+5aVKPmTab5uEC
	k03alN0pIm56qCTEGdjCbewChhhZwDsxnVyxPniABuWmHh1znxeG0MTivHi3TJCY9Tx+rZ1fCoS
	gxB2oV+c9nFoImpAQbt8sfp246VDhBm1+BozG7Ca4MlpGR7fHmlHLA8dV0ufnY/jwHW/ynlc6vm
	vSqrqz0DXCPW2/rSTmqZkoEnGuS2hhnB+knBQFbCxyE3pyROxnY/xjHPd04BnjqUIqwjLziDN7P
	cMOHsyB5bm1uzOBZJ7pzZc=
X-Received: by 2002:adf:f148:0:b0:43f:e413:f6fe with SMTP id ffacd0b85a97d-43fe413f7b5mr11668013f8f.0.1776638349661;
        Sun, 19 Apr 2026 15:39:09 -0700 (PDT)
Received: from localhost (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1682sm25088519f8f.1.2026.04.19.15.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 15:39:09 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 19 Apr 2026 23:39:00 +0100
Subject: [PATCH] media: venus: declare firmware files via MODULE_FIRMWARE
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAINZ5WkC/x3NMQ6DMAxA0asgz1gKoSC1V6kYnMQUDyTUEQEJc
 fdGHd/y/wWZVTjDq7lAuUiWFCu6tgG/UPwwSqgGa+xoHt0TD9kwOUcaPH59WrFw3DPOoutBykg
 uhH5wZiBroVY25VnO/+E93fcPSK7RlXEAAAA=
X-Change-ID: 20260419-wip-obbardc-qcom-venus-firmware-abdd35b05a22
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=22Lj690Gzt9GJNADN9EbtC4X0CbXbhABySU67c5PTv8=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBp5VmH3F7n6CA1KM9RB//pKQblvm1Q0iLJgVD4t
 lm7KZCZJJGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaeVZhwAKCRBjTcTwaHBG
 +DOjD/4tpb10t1YhrA+qs7WvJq0/OXQhNa8zxjbhM9pG6sDeEwBIOO2bY/QNJ6YyW5W74AV6teo
 OwOsD7HtGruOJ0g9XuAhEwNII0APkxpKnzfmG+1N/k1QIZTUEW0tzDZSF5D744Rlos65dIQvDnz
 PNGdJXDBJTyuYDVG63JBOQLaN+F2KFqEnxYblLzZEIcKC1e4HX36AHtC+6iByQEX3rHRVds0z86
 AGb9rrCUBHCCUJoJj0lzvbr0PRv1Q2DxU+S0OhHlCMyaTQggxmgJivIB/VGidipTqrfGY/020FW
 ElhA38DSTT9hZKQOsTRzaJ0bXIKm2/dwcm9AJO9WqvXPBux26vgDsqth3Shofrpqe8LJnVn/dJ4
 qvRurr+QoIlquJtFGank/D4+51jOdZ+U8iMSxIxTG9jsjBTYGICTDICYkYpW2ucYdKWNlglY+UN
 EI6TnIKwEbgrfpVi0un6gUwEcP5GLIApQ+Ii0J0xTga7Gv5knnnOTEOhIAq56n2waJdS6EoyzC5
 7nIbGXffJ/5j8nAm38a9fwNPS3v2AU5UlxkfIlskfYwRJIIXo5F7JyFGkTmeJwnNR/egUT4YZlY
 zHTx0P/3iS+ea19zUsK9AMx2ckt7SlGiraM68NWTh+I6h1MJNLgroUsjH14HIL+fenGMUE2i+96
 2QFbgKHsE55Wu7A==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59108-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 42C0F425B5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver loads firmware blobs at runtime via request_firmware()
but does not currently advertise the possible filenames. Add
MODULE_FIRMWARE() entries for all known firmware variants so they are
visible via modinfo and can be picked up by user space tooling.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..7ed7cffb333b 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1119,6 +1119,16 @@ static const struct venus_resources qcm2290_res = {
 	.min_fw = &min_fw,
 };
 
+MODULE_FIRMWARE("qcom/venus-1.8/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-4.2/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-4.4/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-4.4/venus.mdt");
+MODULE_FIRMWARE("qcom/venus-5.2/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-5.4/venus.mbn");
+MODULE_FIRMWARE("qcom/vpu-1.0/venus.mbn");
+MODULE_FIRMWARE("qcom/vpu-2.0/venus.mbn");
+MODULE_FIRMWARE("qcom/venus-6.0/venus.mbn");
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },

---
base-commit: 4f5b4b748ac75683d61c304ee3ee0db235e8f312
change-id: 20260419-wip-obbardc-qcom-venus-firmware-abdd35b05a22

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


