Return-Path: <linux-media+bounces-63350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL0xNDyXHmrPlAkAu9opvQ
	(envelope-from <linux-media+bounces-63350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:41:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 521BC62ABCA
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CFBA301ABA2
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27763C988D;
	Tue,  2 Jun 2026 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="No1riZtV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923593C819B
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389567; cv=none; b=c2zpFCwcRO5LDoosj6p8coSbK3EOMMjXYrko/+CmGlWiXsHLj3l/htQBFBVcOuHjRml9gvGEJohkSLF/uvpL9SgDtIk0q7qnrnEMtTOwAJOIQK97XvG/qCjeCM+uHejB5NdR5BXc6gZ6rc8vAwilCH94IWfpvaL9rLk9T4kFULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389567; c=relaxed/simple;
	bh=8QQGtfLgtdUXMNRLEDAdD0G9n8EM0L6VfE19GU/xjBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9euu0yFsYwWIdf2FwUVRbBLpdscwh4gXr8KY2QtQxfmUbx5SeM3vY9HFEqFMW3MjLO67mEAcq+yBfgMWSjZ6K8hZ2bTpepDI20zZb2cN+Hb+2f/7lSUmXdoQNfFxtplKHYbcj4ACeTYDMqMDhu59nS8T0c7HKoTMQhMTqhf8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=No1riZtV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b0eed380so7013975e9.1
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 01:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780389562; x=1780994362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWyzGB/0xUFPPIwYqt4ljUuRWgwAyuAeLbCuIJBQLG8=;
        b=No1riZtVXJ7D596fdUI0A0EgLIupFBbe0OykNgis+/0Qrz+j5i84VW7lhFZQ3m9pK1
         +5/2CCKxOMtbT7xa5GKb1CgGD0Xxu4jQuolR9nTHFpneE1pNuTzSjnSALJa5r3j+hcjX
         7m+M+ChodY7t30D9jBhO6Figwx7/uepfmOxcBhP28rXDFFQt/pHal/NBM77pNAmvjpCQ
         0iC8mjS7CgH4t/SSxSwZJS13e0NFvq7aEOQYynbQoANSaeULKU1a9ltXlA9/EQpQRwFw
         7IGkNae/tX1LbZgpy/yG4iinAWOm6F4hy5FRt7RGM/vd21sIJnzRHbq6arTUiuzJ6fX0
         +Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389562; x=1780994362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OWyzGB/0xUFPPIwYqt4ljUuRWgwAyuAeLbCuIJBQLG8=;
        b=Nnmnp/lQtKohqdw4XzeIeYWlTlG+pu1XKB6DAGGGZQ3JdEW9hXue7CEnKMp65wZ++M
         Cd+5V9RhmYxiaq5MgStqFHt6/YjUNRsJ4tWZnlPda8hUklBBPLFSAtgOH6XM73tGWRYv
         tI9m6faqhr6eWhcqRqA3KnmGq8Dhzepkk1ha5Jzppo3mW+atH0Wpk49lyH7l2n1c6ySg
         8gBk8VXneeawR/cPgf/8DEXsPl9TnxK8qANrHdO4AflpNaiLbl+ie7GT3fLoOM/Pj09h
         SprRipyMOFdu32PC0ktdyDXRH7vHKDzmsChPjlGYNVPqOp2u0e/P4YTM2DXO5YQ4gP9Y
         5f5Q==
X-Gm-Message-State: AOJu0YwDAoM3KjDZzouiT96LDG9Y+PzwYfBuMSTA8iRRDxI+19pO8v/U
	tTXO6RjSSGJ3GEn461HRUJ7osTsFxKA2rp/RY9gvFU63vH0xfrhYftCMfSWnVLxkXF++XN9xJc0
	+IfLZ
X-Gm-Gg: Acq92OEnZU2vIJwBUZWHJZUwW6yYLE9vpsWz1IRkSHBxTg3wiiRnj7Sc9FqkIsW3aOA
	M3QC7XEEgjP3CA/aesPE9lSQg6xe8nhQcPaKv6hzT2yE3QRFlDv/qTRTHZ6j0lehLXM+qzDWdL1
	TgJmGg1iYA7O1Hk6xDOP6zejtEV7uFLv4TuQK/uWVkeWjzBhZXo1JTyVJWoIPnf1ggXlmuBUQd3
	CtT1kqukff9z3YNFT9Bs2oW6TTeqS1IzgRYfOgP71EpGBR0qBxjltHx7iSF+s8PFiIyP8x4fi1S
	gTzxcOB7TsGaIhgPGIE/6v9dlt4sIOtmIUOjaG6IGpqy01GFpRgqQUT9GiJP1yI0jvTnnyTcPt/
	Lq9S7mjdIGmlJp87L2sNoMMpnKZmImS9VWcmsSIzMAg6CJYBxUq9YQIT15nzYofpS9/sUmvw1pG
	QOwkoJ/W4uwZsz6nzR/v1lRcK4l5u+Jsx30kDPS0/VoGjX3/ayt2C5Aao=
X-Received: by 2002:a05:600c:5697:b0:48f:e6de:1cba with SMTP id 5b1f17b1804b1-490a2958f75mr197204615e9.17.1780389561744;
        Tue, 02 Jun 2026 01:39:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e26050sm43879425e9.9.2026.06.02.01.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:39:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Jun 2026 10:39:16 +0200
Subject: [PATCH v5 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-topic-sm8x50-iris-10bit-decoding-v5-1-c2b32474ed67@linaro.org>
References: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
In-Reply-To: <20260602-topic-sm8x50-iris-10bit-decoding-v5-0-c2b32474ed67@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8QQGtfLgtdUXMNRLEDAdD0G9n8EM0L6VfE19GU/xjBk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqHpa1RsRBPFP1x0RR1QphpYuDsiSPKUnplCmWpDtt
 ArA3S5eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCah6WtQAKCRB33NvayMhJ0cDEEA
 CHZOBd59MEu8ENeyENBKx6SVc3sSHwu1WOXPVnDIPPn9ozR7jfkswfyGjyZevczGLhS6QqMuxh7j5W
 GoJbcC4a3np8lRkFoDkzABpcNDR0NLxoO2VyFU+1lp/vMkWtY+TfpwHG9nwUx99myJRsT0ZKfpxmZn
 Jq9hCDnlce/5u3Op8lW+V2+7Q6EY5MJNG4gljfJkRfE0Elw641lI/BL5cZfYszR9X81Ru4PbhKPCry
 EUsHXKpsD7w/pL4dctIqXNl7HkeP9dsJRPBkl//b07I+ufI/YwY3fqzKLXsAYQGVB1hAOXeNeJrN5j
 8S7Ky7Vw2NCEoAOn1gyFAjtO7+LBlK4tm6m9tsf/HpR6sLXaqkwAHzZ1WhmW87bNWuNcQSelt5aiuI
 Z21h4j5Su1M6pWzhXAsLmK+Uc8f+g2dKrGTShiSzu54rYWSDzTytIkKR8GTp4tm2488joWe09SmqLb
 TmlseN4QQeIbE281fWtsAyJb2OpktOCXhdyHA25FfZxKORIAmRVnJKCVqGEQ9DHVTnlsdBFi2DgYfZ
 i7fUGm/41LlyfB8IJBaKhjys5Qzdp7RgTZ9DbT/WfGBXKOrSBukkU6T68C9KPxiBwbgX2TIu2E8aMq
 uUW6ecJ01JbER+19JiodWR8MgIM/8embCt5hZxHqpF7iWodjfev+XFbzzJXg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63350-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 521BC62ABCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To simplify code checking for pixel formats, add helpers to
check for 8bit and 10bit formats.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 29b07d88507e..085665cd74ff 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -38,6 +38,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
 		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
 }
 
+bool iris_fmt_is_8bit(u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_NV12 ||
+		pixelformat == V4L2_PIX_FMT_QC08C;
+}
+
+bool iris_fmt_is_10bit(u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_P010 ||
+		pixelformat == V4L2_PIX_FMT_QC10C;
+}
+
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index b5705d156431..228a5f963812 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -45,6 +45,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
 			   u32 ref_width, u32 ref_height);
 int iris_get_mbpf(struct iris_inst *inst);
 bool iris_split_mode_enabled(struct iris_inst *inst);
+bool iris_fmt_is_8bit(u32 pixelformat);
+bool iris_fmt_is_10bit(u32 pixelformat);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state);

-- 
2.34.1


