Return-Path: <linux-media+bounces-58278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KINZLV6H1mmwFwgAu9opvQ
	(envelope-from <linux-media+bounces-58278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:50:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 144893BF186
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2663B30B07B8
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C787E3D3492;
	Wed,  8 Apr 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4ZhVRee"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57E3D6CB2
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666648; cv=none; b=kPl0JLricpTAXdbic6L8cNJ57zHcVno4d3q37S4HPtuneB+mXGcscYSeM8a66+kyaRiqNlAZ3x72o3GIjYa7mCR0GPtTLEdTbOeKWFckc02xKwb2nCsvphfRi4Tz5SAuCLsf32dnmCG3Kzi6gO7Qsxz3qThnnEVLOMzY0hgMyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666648; c=relaxed/simple;
	bh=jw5HajDz3YEg2SFQeuiFYM+sWNKJy4d/wOy+1zDgBrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6mZtvJqvvpsccFuJPr8wZX2OfMJhSBtcr3Fe6N9nShJKiQnNyGD6sVgoPCyPaL0x6dWMnJkm24ddtjJ1eLpmlN1LzAJNPhywrHiVfZeTzzm4G84EPHGmozOpbkGzoUhAChnrjMkgZwfh+1bRPHCvT1HoxvOkpv/SqsgyJmFb40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4ZhVRee; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4888375f735so208255e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775666645; x=1776271445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxT3LZZl8z0JUtBRxRhLlC7OhmjiZSeL9O80F6EgJiY=;
        b=M4ZhVReepXnZxHQJkCWMZKedUhQgUvpvLEi5X3uLfCSWbEu92dU5Bn7RxUresWY3VP
         Cktgze/yUcd/beDQCDX7Pzk/telle9j37H1R3gIMI9NZuijQIzj/yQCfU3mQ+VMQTg5/
         Eg/ufBfrNNIs4OV+Rjyeg8lDLRY81aG18/EMchXxu6tlDFv+8mpkl1Wsk9y9oEGE8OkJ
         mcNrVeyRhrMP5HecxPlFcCrj6dbQ6EU+3a9rwBIGIthXGN3wh4aDnIuGSr4hIYMt+O4k
         YamaSLz9gtpKKCFpR8wBKajoVNcGReQSG1WPM9koxJVMMDwSZJ2J00LsxBPz/gnwW+//
         y6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666645; x=1776271445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OxT3LZZl8z0JUtBRxRhLlC7OhmjiZSeL9O80F6EgJiY=;
        b=JOEYQ8Ub1oNXwaBc60e5u6DQQ4af0T0uabOCSyzdAAzkV9d+mDBw5RAxiNemaeCXT9
         uRnsMt9HoBwsF7G/zDM+FR/cRsLvAZofmI/g/m+8AHuWRQ9Nys+Ux1rXOvZYQb2PBM0b
         cAK+GH9Mz1OBKRExtsC4sXMWIMlUYGdbefdNyNbKkAUD9NF+IV/SN8K6W3Zb1V8Awnwc
         pFNGffuxiRPkXyhzDRIOJkOW6ptYoXh7COeSFRmcbjYTFmHMeYgcaLvtHQPs6xC4sb+3
         x1eqrnDfw38KYnYvajp+I0W2aRjC+yZ9mm2nSKa2ZXcRPydcQQVMjPs0hf2BGss1BrO4
         4jmQ==
X-Gm-Message-State: AOJu0YzBv0YTOT44xOXCDsiDEaSZRS2+5VeLxsxJlch0zGlqhad3meJC
	oiBMxYvZ++x5B6gHYhcAlV5TezgMyKGJzz+0DRUnMCDwpbQbwecy9K9YNCXhXNKoTcA=
X-Gm-Gg: AeBDievQcDWjB8tVhFvYfNWlGeHMuCGgTUm9Ag9unrj0e2SuO/gj8I1CZiKEyu5eVcN
	xwiqa+h4ZEV8D//HAhhk/6+s6sty+QZDbzUVZBGDo74wFXp7+FE7OdlZyQ6RMEk1BVg6EUPirHj
	hjWkY3OUxXifgdk4pHHPSkUSMf2tWHthkWnR0Hi94kmr8oR9q0R2S/NJ5XJ/QD+LYnwaX2g4tDa
	EDjhBICkooNT8FyCt0mKOIILcZ3k9KzkxSxXk52UgbVLwXmNdb3Zy0cTAHI/JjOEyDvUMAAPnWa
	tdpo9x6XZxcOFK+IuWJdiN5AZdFFM5rcUTr7dZVv3zgGhSPUZGQrk58ik0yZzPETfcBt1xFdarz
	ATs9Nd/eAD24ZSSWdOsSDEIoDk0N7+EcfrG763BpZcOqvN+n5fBcQkWsehtxn2Mh0DDhaB6DY59
	aK8hEoxA71ELM0wIn1ww3u8bNigsbMp2yO9JN5IQurotUhWAinreWeVUQ=
X-Received: by 2002:a05:600c:1396:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-488997d10ffmr303650735e9.20.1775666645049;
        Wed, 08 Apr 2026 09:44:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17be0csm1388065e9.18.2026.04.08.09.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:44:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Apr 2026 18:43:59 +0200
Subject: [PATCH RFC 6/7] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-sm8x50-iris-10bit-decoding-v1-6-428c1ec2e3f3@linaro.org>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2960;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jw5HajDz3YEg2SFQeuiFYM+sWNKJy4d/wOy+1zDgBrg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp1oXOX5pyFezRGumt1OnDVkkSs1lT7WJ6xd9W/pc4
 KtrqGtCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCadaFzgAKCRB33NvayMhJ0XHCD/
 0W9vutsMJDgW5v0Ig6IfkKEsVPR4PKPYTAdyJz8QVApIp1Rdj7ObtJkTBAYZwa6ZA4Zmssu+mtofEH
 d9M8ByzeZ5cevGQ4zAaZArvi47DbJJJTT3rBgOgu9EB+wwx4AhNPrZpu6nGgZEnau/XpInqf7uXRn+
 DlIusxEx0HwoYeNRJ8QEvR4L96WeuRDBu3yxO8z7iWDTQJMNW38GfL1SjL6TFcdzR3YpGUddXd0P/V
 xdXKbXokp7ABNKfeai0P0ITyd8ouopaxKiUhyxcKzQDg6SU1dhA5BkcEMFBH5w/w7SlA9sD3D5Dblt
 hj8se28fKEoFI9Ki6ync1QbC9kdjzyTh1cMs/JgvOAv0pjfnt5oMwNH3tH2kIr+zcq9OBVrTdUJGeN
 l4OwMuvrPQunfFo8IgkDTqSOEDVMH8DBbiN6coY1FHCIUbEjvN4vB7ROKHr1gr0TdiAmsDomQTuRpA
 2AoQDZRa9Ns9JWORMY0VI18B1cujAGnVtc8E7p50qWYqtDNHCngjFYHHuzOnhv+i6nMOG1S/kRJrJM
 SOF6xJual1MS36kNKyI9lj42LGCue14ITAqOteQ3ujMLOqMjgi6LwN5zftnRRVI64BR6VZFXzVfzbC
 TAUcU0+6X8/OHwv32/LpF4nDCLcAXrjrIabbaRSzqjqhvPpilj+Y1BHPgs6w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58278-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 144893BF186
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 10bit pixel format can be only used when the decoder identifies the
stream as decoding into 10bit pixel format buffers, so update the
find_format helpers to filter the formats.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c       | 41 ++++++++++++++++++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..cd3509da4b75 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -18,6 +18,7 @@ struct iris_inst;
 
 #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
 #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
+#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
 #define CODED_FRAMES_PROGRESSIVE		0x0
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ca0518c27834..bfc13c1044c7 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -105,6 +105,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	if (i == size || fmt[i].type != type)
 		return NULL;
 
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_8)
+			return NULL;
+
+		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
+			return NULL;
+	}
+
 	return &fmt[i];
 }
 
@@ -113,6 +123,7 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
 	const struct iris_fmt *fmt = NULL;
 	unsigned int size = 0;
+	unsigned int i, k = 0;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
@@ -127,10 +138,36 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		return NULL;
 	}
 
-	if (index >= size || fmt[index].type != type)
+	if (index >= size)
 		return NULL;
 
-	return &fmt[index];
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (fmt[index].type != type)
+			return NULL;
+
+		return &fmt[index];
+	}
+
+	/* Loop over the valid capture formats and return the index */
+	for (i = 0; i < size; i++) {
+		if (fmt[i].type != type)
+			continue;
+
+		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
+			continue;
+
+		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
+			continue;
+
+		if (k == index)
+			return &fmt[i];
+
+		k++;
+	}
+
+	return NULL;
 }
 
 int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)

-- 
2.34.1


