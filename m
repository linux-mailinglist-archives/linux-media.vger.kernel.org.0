Return-Path: <linux-media+bounces-61066-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPJ0KZ6kAWrShAEAu9opvQ
	(envelope-from <linux-media+bounces-61066-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:42:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BE750B2B2
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13E2D3180C6D
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924C13BADA3;
	Mon, 11 May 2026 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6vOI74c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EFB3BB9FA
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491234; cv=none; b=LtoxB5t+q8nYRomivf2dV48u/bPXrthqL+NLftWp6psYlwwpzl8o8lfr8/D+pKsVAmCJz7f/pvmL9EiJCdl62Eri8KRtvRbRougsLFreCL1WTcYrdVSJLdWMXkAsacekbpjO32W6fw8US31eLf9Eqw7xaqzRRDCMnLnmg8P5Lx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491234; c=relaxed/simple;
	bh=f4Nq3WnEslse/Ujj95T0YlMIcxOUx5FiJpFStU/aLcc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJ/Ep9C940Uc4YmplA8Udbx7iHVqJGrz21tIQG34u/dbU6+K/laY6H8xwsI1UAu4RQ/OomeLV20QPNeeX1D2yZt7RMO8evgDov8O24GrgmMSn7nNPs1KzUK/xyWL+3kDuyHxtPrIQAb3GErR+WUoc53I84xSvKoJOaXaYJ2x+1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6vOI74c; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso47207835e9.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778491232; x=1779096032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CubxZ76p15MsLWO+D7OUNcZmLk+LktFGsM5YIDoX56Y=;
        b=i6vOI74cXPQu1R1/uQXcve0dKu+ZAUfcMRldiIj7qZPW0tUJ1mnWucoh2H0MGpjr5u
         fMtgX62pSqkiAY0G72s4tDprSyCTSSWqPCD9dFMbLoT9L7FBmR4mI2y2YzbPqeDr3t+P
         vj9t+G+1iboHC8WsKrjYFE21lcEx+Alo1/2mMGns/Epx8eCnNLv9ZkWbLTj0EouercHs
         GctjD7OTMPHVDYTV7N2QEBAsDZJhoM9ZTjjAH9NaVe7QONt7WEkedqnBq1gLOEUVYehn
         mPJWlWWhPINawX8bFg3xYEy9D9vfv8YopuaEOIgYZX4vwjSfuPDUWIzwsYQFCL/EkXwP
         Fwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491232; x=1779096032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CubxZ76p15MsLWO+D7OUNcZmLk+LktFGsM5YIDoX56Y=;
        b=a1KFRgB0BN9rg5ekCW+lWPzVgTTdDkE4o4vJLUKpaMuQjErnDnbMds7NQSL9IXK/C9
         I+gnulAFLv5+F44xcXVUqmbfeh0z82rOOz0dL2FC7eGfAinppyjnDJe/FcwWuUdnWiWc
         QqnwR7JoS5chtqXodBBfkEPzfImPnW78Ma3U2BaHAGPiHsrJqaS/Yz3eFecTxsf56uum
         /Ji+XWFMQoGWUi+9k796B9tDtjzXIy+qHM3Fu/JAQ0JxVbLKWnR3k0ZKt6BeAGd1rwpc
         bCiGu4k3nnZlcBS1EVpQXbkBTY8wlxNkGySs+XXaIpPzaNHb0wdmg/wE9IsdcJ69I7QO
         8QUg==
X-Gm-Message-State: AOJu0YwGnmsMUDt6cf7xjDXS5zzbS+KKM/wJ8lUdFWovXN01P2Q8zHHQ
	eMaUvYNgUjl0VjZM4kFEj0sL7/RcKVOPXhlU2ir1njWu9L72F49X9Y/CsKRW9Gq0HE4=
X-Gm-Gg: Acq92OGbxivbifz1qpzFt/k/VxBp2IrcaqSyGyBOyTuQZINa49Ml7aaMLOqq4qAVqbY
	CXBltfdtlJsx94WR2imdb3kKfCKqrULN7lReMCQoWigO+bKDsrJxXKXmBoTaubPkJivtVEgJEIs
	VhAwyN9n1CgPlo5ME10pnY5fKo4Hi7xwpS3/55EClvW22RPTk5cHMRf8XF9iuPbvKE/tSuUUPKk
	eHGs1tpC064BgLMPoh0fP5ys1ijS0vbz1KN0M8sP5GxPm25EhMdYvYkl7nsLWhySrrIb3pwWEQM
	Z3H1/MfP5Csj3J+q1dOuxiDNDGB1do3cQHR41wKV8bxGZvA1MUliIN4RmmMJCRkERRLmMgRVCxl
	/LyMAW9S787643CY03xRr2D1nqGsh2QVShbFkrjBRhUyJlS3WoCe0qY/Z8EF9j+5aGKjH0NZ9f9
	G2MG7PlNz6Qn4YzbmYLZqZtnG+jcYaQTRFYXEP0pl26Wn1
X-Received: by 2002:a05:600c:a411:b0:488:af48:af11 with SMTP id 5b1f17b1804b1-48e51e08ce3mr303186555e9.1.1778491231446;
        Mon, 11 May 2026 02:20:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120ec0asm23743240f8f.17.2026.05.11.02.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:20:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 11 May 2026 11:20:26 +0200
Subject: [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-topic-sm8x50-iris-10bit-decoding-v3-1-7fc049b93042@linaro.org>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=f4Nq3WnEslse/Ujj95T0YlMIcxOUx5FiJpFStU/aLcc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqAZ9bKiDYDwGUeoJ437lHi3nXZmikHepINN2wPupQ
 wR0a1SyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagGfWwAKCRB33NvayMhJ0XwTD/
 41f+P7LYfdY0U2EoL7Wn4adthTPh9LBgwmgHdrCIFbU9QrflWthsAgqSnIzT78CeDjpDOgXDxcSkxo
 7b2+P6f1NrqhhCBFpnahMxErqZD482PuH6kcYGHBQCTbgBAGQIo0e6qA/wUhmooXvvPKXZ0cu6arMs
 jAJy01RAkRhxDLXizViFDHU5EnJ8qNbMGw3hewrFoLiwduS9gcxbXHWdRt9Rb9Be5WDnYFXLuMAMjP
 IVMppWVoCBgEj1r96nz8irKK57OJFJAiHIscU4blVQsDfDz/QZTYudftZKc8B9qxeYK4Xr+7DQ79vt
 pB5RNvF5xkLZsZ7AxRVWU4P/BMviDZBqBehkjXiC3eP3ap0Oq0NzkOUyJXTixdcOHN7ubY4cvHdmso
 QX5M+gDu7FNKOqxy47SDTP4G4YWN+ALv4hqvZFgV0ozt6mz+ZA5IccPmoC2k9LMt0ev5cXJA+HgMsl
 o6p0AO2t+cnOQzJStZDQcZgKc1BicnFCkXuccfq5MHw2iyU9+CBl6hGiQ6MIRK9WHlkH3IiYKuzjuT
 PWpSWzqDxhHnPDtOGWykpgR/BcFxy+6pLkc4bD1we8rxCoWOFHiMH0z0mIjfABAtgxZayk7TI3uyGk
 m5YaeJCsENf26kedSsE0lWUgBBxeGOoa/AvI58MezS+n4CCsVdlUp70QUJCA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 03BE750B2B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61066-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

To simplify code checking for pixel formats, add helpers to
check for 8bit and 10bit formats.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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


