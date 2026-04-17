Return-Path: <linux-media+bounces-58984-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFIBInMC4mna0QAAu9opvQ
	(envelope-from <linux-media+bounces-58984-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:50:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF5419938
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3791A30BBB29
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449483B38AB;
	Fri, 17 Apr 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rPFm15lj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB034A786
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418672; cv=none; b=mXnIrUq9m1bFzXsShAPrDPGfZRI6axSrKlBvEmPsT2Bwg6I8YkGqmujV8nW1dFjEY9eUqoWo7eYxzcISTdOowsk3Gcs+I4BvknpkamH64nVyQXc0pRVlfbjO5bAQoiscjSIbBATI8Yp5v2/+b3UYXLVcmciKwOoz7fsJ+6vjqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418672; c=relaxed/simple;
	bh=5sMpVnJbX4Wo0wpTQlrFG0+qE1K2lYr004iW/zPD4sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIZ9wSQdjrswvlKI+CX8uKR0WgTi3xdrxlUXqnaElafaF/Nov2arW6ZAD6jbRJ0Zw9WSK3PDizYM+uh7v5VGG/a0wuCC8GfYilmal5AzweKJvbz04C3XsjqpnUblFqO6IPZK9+Gu6RU00GjsLjqGhXA4SC2pq5zWHmmCmOPrrDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rPFm15lj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488c21c636dso2922305e9.2
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 02:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418670; x=1777023470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdDC0tucHeP1WgDsxGwA3dfuw3FF32FYs5RhFEaWcZg=;
        b=rPFm15lj/5QjqFkqxchTW+73EAFfDw9u/qZJ6DZkiFnaD5B6Pp00i+GtmYGtWQXNAV
         uWzMaEHM/fjTvF6eB6uLPM5ZPvlCnT55ivvM5o9R1+poEbmOzUOFWtUJahodGXNpLd68
         Fu+xtDcPW3wTlru7l6vp/8GL+KjG0f/9opsWOwMkv2wC+TiODam0xwomE9h6v6AA8AK7
         dL/9iAsk0pa6dc6YSHN87PmOQuPn2n+bXC8ZJiD9CXvUsAx50jXrSwe63oT09khQ2hMX
         l8llom4u0e40vtABPlYXzW6tGdZqvwItGBymbzkOMEmHii7S2XedoII1yjQebIfOfYqY
         +IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418670; x=1777023470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdDC0tucHeP1WgDsxGwA3dfuw3FF32FYs5RhFEaWcZg=;
        b=qqrfpF6sVU3TfqzaHDp9y1x8ZXiMYUKIo+FuMudeZ44iXw7ahVO2UZa2Ah6PEFWwAb
         q5XFDsBH/q6NJw03kF61Ww7CWsDXWtrPxU+XZCpC/xR1hdBJw4Majm14fYPBItMLfpg3
         7B0WfJjBQXCQTaJGY22lYMa1u7tv43XsudhCv2VXlJUgnn5pwW2wHAagxbFL2VCvqZoK
         9WAgUSMhqY+mPE4roEtKxFRBYFN6WE7ePThaqX7QaW68lLHl5qCDdowswtlyDBFZoR3y
         krxpdz3KX7hENfcPy2Jrb7neR60lS7URrNHsWN8fa7bb2+wenomC9iFFGxG5uGI1GU0W
         9kGw==
X-Gm-Message-State: AOJu0YxbtrUnuTCfEr8xuQKqecG4udUzwcUedcmBAJramRJQDisBAUxD
	GK54plZ27EzwD66RMIYFWwwzIr0lfoWH/PCQnEDltAuC0qXYc2tlZjAtfAc6exIIR8A=
X-Gm-Gg: AeBDiev6cOY6Ogg0Ch+KbxJ6ER35VxXgdQ9rwY5VjF0YsjHOFQSKH6QkPmScXrXQNDU
	Sufh6cX0Ju0Ml8EI7iHM4ANPEcB2+Kl5S71zYlFu/vQs4YFObLTSw4pQmTV5SDhp7xmLQyz/qJI
	DrTHj/bvpkYr5Gp2O+yD4lXftdZesV6Uq9HEajYaOx5BZ8KQ22KiWprfxhaSY0ymSt0h4LHF5Q0
	+fznfoNgtYW8gkD8Hj8KNwgE27cYyVQ+/DaC0pZyfC93kO6RGyarm2iLGbDy6W9f+iKrTlbl1Nw
	rSqVsVEAn1lrjgXcHpr+YAv0Qus9RGXaVPJ+TMOnSnv7qKDCRgFiqxJQ90JSvray/rwqe0Y5vOU
	3sdyOfuOp73cwOy1ZVn07CcFPWQMkxywziazQOTG4NCR5wWP1Z1K20haSHYlb6gXL4j14iSYerf
	M1eARAGKjpJ3zI/FborWLK5aRoQXoxHdUG8Q6zfWuK5wfvgO5VYLZX9GIvdS6b4b4dDQ==
X-Received: by 2002:a05:600c:3411:b0:487:1c2:6a56 with SMTP id 5b1f17b1804b1-488fb74529fmr18448995e9.3.1776418669542;
        Fri, 17 Apr 2026 02:37:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Apr 2026 11:37:41 +0200
Subject: [PATCH v2 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-1-c987b65a31d5@linaro.org>
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5sMpVnJbX4Wo0wpTQlrFG0+qE1K2lYr004iW/zPD4sM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9pq7EsOKRwmM19h8c7brWZsEhPwCymO40/gR5Z
 kmUPyM2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/aQAKCRB33NvayMhJ0R7nEA
 C9ywtf6EX6voCeoW4IT7BiqXR5GZcWeQoLS7nf1gK1bQYL7XLtOBCc56G9gzfg6OQ+yB9Z0aywsBNx
 ftPNbF1LLskJQDk5nAiUtb7VIfDKv2luXqPlUCO0RptzSlDwJGjopZKVZkAK2ZtcoFO43MH+FaujTT
 H1pCeJjLJtELgjI11++3qmqOFuczS8Ws+Zy7iU0hRIhMYpWalEvl5K9wFKvOZTkoMHga1RemzB4emT
 b7WJN6vNZ4JjdQa2XfS5/C0Z2hl3KXWKYx0v2QolV9Wfk5X9jBJde4n3yJiY5VJUXuVQ/BDB/ngp+w
 x0WbyJgfIAv3QMAHcbmHkSs8yrPEgZqZl4CB5qnsfdDMGNLPSsguzn71D/PZq8ojbTV0FdYazGv8Xa
 hEkC78Gv5eFX4M+fSLlkpXvXvUkbe+NvDPdGHQt9u9QmapVt8QqBNi/QtZx+dmhff9Gpd7AalpcDrQ
 t0Ae7qsx4ouhCOLH/psZhAxirtivv28ewYuaxtJyh5BGxhrwHineDDJdytH8oWVCxF5KmUFtWXAjOC
 SqeI22qPvsrlCYJvuqJnQ8JkxBpRd+4SAyncNBRTrTyLODthi4dmC2NXc1VFUjj7Ee3adZPNdXLQZv
 YQwAVZfoCXYFpywp5I0PVbtnC50+g9ns2nSY9qJmQDGsb6Ff8VG0OlZMpz3g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58984-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 77FF5419938
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To simplify code checking for pixel formats, add helpers to
check for 8bit and 10bit formats.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_utils.c | 12 ++++++++++++
 drivers/media/platform/qcom/iris/iris_utils.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..bdedd6bfa87a 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -38,6 +38,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
 		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
 }
 
+bool iris_fmt_is_8bit(__u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_NV12 ||
+		pixelformat == V4L2_PIX_FMT_QC08C;
+}
+
+bool iris_fmt_is_10bit(__u32 pixelformat)
+{
+	return pixelformat == V4L2_PIX_FMT_P010 ||
+		pixelformat == V4L2_PIX_FMT_QC10C;
+}
+
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state)
 {
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index b5705d156431..35337c5da005 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -45,6 +45,8 @@ bool iris_res_is_less_than(u32 width, u32 height,
 			   u32 ref_width, u32 ref_height);
 int iris_get_mbpf(struct iris_inst *inst);
 bool iris_split_mode_enabled(struct iris_inst *inst);
+bool iris_fmt_is_8bit(__u32 pixelformat);
+bool iris_fmt_is_10bit(__u32 pixelformat);
 struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id);
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 			      enum vb2_buffer_state state);

-- 
2.34.1


