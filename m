Return-Path: <linux-media+bounces-58987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFPACCwB4mna0QAAu9opvQ
	(envelope-from <linux-media+bounces-58987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:45:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3541981D
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0B90C3098FCD
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C85F3B775E;
	Fri, 17 Apr 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXRBSbYY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF983B3BEB
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418676; cv=none; b=Cgjd+NgS8Sflg5KydLqhfMsWexWJm3TDnJJi/U3+2Rnor4iqroh/rg0Fkxza1GgcWzjmtO6IFEU+wAoI22zr7PVTih4SeJDVM/Ww7hAmfJQxSYfIvu1OGPg7JMh4O+1ai9b0kf4r6ce1AtQICQxCcNpKe9Apz/z70O+/LVhrcGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418676; c=relaxed/simple;
	bh=vYjJMDeVg4k6fo70v4ABD1udotMHtah4iQLNpwwmOk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grPFsPEmZY7f3XtUWnNddS4p5sbKcLQNKIYU9urPc+Y9GCVwCotiKfwJGCedzPn7QE6Iqc2lbETpdSuMbpo6tEiEfxQjbWtZmVQVhPORoaWrMT47j65YUDEvfnEtV3f/qH12b9D633KflmXDc2fE4lKzO/VyTmm8QGK+TUWSQS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXRBSbYY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso4301765e9.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418672; x=1777023472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+/dGPO0kAxWU1/3ix/1Osc2H8ffG2NBMmISaalGLB2w=;
        b=GXRBSbYYEYSrTiuJwqjTpruZz11QAi5nLafjLSYpwMlBkjVMGFQWEBz3bL1I8fyYI0
         FmsbUaxHB/C9Bx93bO/n1eRzuPdL4z2MtUfseGOTMSn0IFbwxRwTGdUKt0sLarmR5DRF
         aVu1/gBiXQYlrjeoN7fMvGgibG6hdEuPGLcN9KPwOk7tcv7paAHyEiLRL3L/JrL9ZtnI
         vBWyt7t3PvhtH4MgElIz88qbbYHq1cH6mXerQkpHSA8+Yi4iLD/wuPlODxQ12iFo+MBP
         ezhvGJhJQj0paYAlI+7EkJl8des/Hhhfg9+7eQEuF8cHbvSC4oVhNa53LrGdlJlLuNln
         O5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418672; x=1777023472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+/dGPO0kAxWU1/3ix/1Osc2H8ffG2NBMmISaalGLB2w=;
        b=LCfJnCCwTwlAQFb1rbnX+3NWjyY4W6kzyDgElB4Wsy4BVKfj+bnGGxUrnNdY5q2qrM
         MQRqHAsimhTNwbtBQYUlwh7iMoujRgkFgHoJY9USd9wxVjuzP0BpGGupIs9jojSoRhMg
         LTgJKzemK7ARd4AhMNrPUAoV13W0rRZ4K4WzF9BETsE7BuQ5aDIk4h8fA9FAaav9dOTF
         hUaupmJFPPNWZa35pslZoh2D4oYtIXrZszZqIyyMdv29v6ABi9tsq9ozskfdTOWaWTN4
         rLYDr4w1zAONRFG61SumoxzWs74CruFyvwGZ5cp/nFs2Wh91cnORI+k+CNGmiwqHMH+V
         D9vQ==
X-Gm-Message-State: AOJu0YwXZXgNo9qMaxxoE5p17RphfrGyqfQjU6Ktq2XKm1I/YEm4mFlf
	kKAYMjvNoRlF5MLyC2D0GHG0R7TeVkJDarH5r5zWwGbon2WSn5apcO/wcR/NmImuRx4=
X-Gm-Gg: AeBDievyeMU9VnyWSFoIdckydgrOyCxDV5iMK6K311RnkuJI9sulCtXa1tjoRgbKfrR
	LySM1cGX0wCALushnKHlPvgKd8V3c/tGygcN3BeS5HyllD1lgUnr9eFnVlFWBD3feVKEeu6owaI
	liXTq7YgKVTrLkdlAmM0XsuRA/wpxTZlcApAgLxhPMlpPiUDtX03kcq0bj2B/lsN9qGp8equPVt
	00YbbE+ZGB9IGyXjdQUa96dGCAXDPXm1w6TSD/hvLxCBVFxFCFA52XiEi7PLsDmhH95YJJkzuNV
	4n7loP/yjIGEeVezWWuCTY6Eey2J0u41aqlC3tEU2boh+oq+bTNz2fEPoGZpsBmoON0zduTsm+f
	ocnODawfDOJ4E7iq8WNfPCrTknxLmlVQ4OZkmtdftMs3w2aDD4yyKKLLKyMq314UAU85j9xB84S
	x4sWrbu2HbX4qSIWnAmAxN73GxOd568DuyHdgS3akJ87/lqm3r7XYqJL0=
X-Received: by 2002:a05:600c:8183:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488fb752e3cmr26432275e9.9.1776418672054;
        Fri, 17 Apr 2026 02:37:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Apr 2026 11:37:44 +0200
Subject: [PATCH v2 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-4-c987b65a31d5@linaro.org>
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3607;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vYjJMDeVg4k6fo70v4ABD1udotMHtah4iQLNpwwmOk4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9qHQh9uuMQ+tI0lky+eapxI+LIuRRk+JQavqgB
 tmu7XMuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/agAKCRB33NvayMhJ0fMeEA
 C9bAkvPeznT9/pbzj5ETL3cuHdqOaSSVUVTBmg8NF0WEQqbrnT/O6J9jGp3HqIulQdzPY762hyjO+S
 7+wlgzB/kq8pVpbLWThGmjzF7/I+py3SmYfNPFN65wxnCpYU2Q0wofLdopwyRpaw20NQxJeVwPgbAb
 AB/YqKjIY0oznudse94P0HCxNWpBaKtGqAykGV8yqUY0t6C/OEUYevIbU2qMV0oOQuOYh9EXgAySZC
 jQQqavIyNimjeGzJxfg1ih2RuMn60vBlDuKjdUVDqxr2iYyIw2o964Gqd60z2ccqJA8Dp9cPTGJaeO
 LoDm2PseveNw9zn18fVVqYj87Xjn43q+6a4eQXNm4xyw7AYWT4eFiA272oYc96KrPcKoq+0CappLCR
 pgY+Bl0oM6P3bZ+1AggKX4BDcA5o/OY4jDu+xLHM/cIHu3ZqukJANhJNxsQ8sWBbPQL6v/GS9GD2Mq
 lXpZC+c2BM8n58iSNPM+bssXfELsOOjtd6rGtul70sjdT6ux6ZzjyQX/O+OZeUkxb2sWREcqCZBg0O
 GJJf4zohPnELVSer5ZAsNzbVaQiVFmWqtiEHKDZwxQAml/DAUT4C8FXGy2jJcnKQ1sS9zp9OhMRk5c
 9TrsAg0v9lxTSjPLSjugEPq2qS/0ah0R44uJ1njZXW5TRSl2O0L8dpLSQBTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58987-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 9FD3541981D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the gen2 response and vdec s_fmt code to take in account
the P010 and QC010 when calculating the width, height and stride.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
 drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8e19f61bbbf9..0541e02d7507 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -542,9 +542,24 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	pixmp_ip->width = width;
 	pixmp_ip->height = height;
 
-	pixmp_op->width = ALIGN(width, 128);
-	pixmp_op->height = ALIGN(height, 32);
-	pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
+	switch (pixmp_op->pixelformat) {
+	case V4L2_PIX_FMT_P010:
+		pixmp_op->width = ALIGN(width, 128);
+		pixmp_op->height = ALIGN(height, 32);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
+		break;
+	case V4L2_PIX_FMT_QC10C:
+		pixmp_op->width = roundup(width, 192);
+		pixmp_op->height = ALIGN(height, 16);
+		pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width * 4 / 3, 256);
+		break;
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_QC08C:
+		pixmp_op->width = ALIGN(width, 128);
+		pixmp_op->height = ALIGN(height, 32);
+		pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
+		break;
+	}
 	pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 
 	matrix_coeff = subsc_params.color_info & 0xFF;
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 719217399a30..32cb75757f2e 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -272,10 +272,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
-		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
 		fmt->fmt.pix_mp.num_planes = 1;
-		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
+		switch (f->fmt.pix_mp.pixelformat) {
+		case V4L2_PIX_FMT_P010:
+			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 2, 256);
+			break;
+		case V4L2_PIX_FMT_QC10C:
+			fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
+			break;
+		case V4L2_PIX_FMT_NV12:
+		case V4L2_PIX_FMT_QC08C:
+			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
+			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
+				ALIGN(f->fmt.pix_mp.width, 128);
+			break;
+		}
 		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;

-- 
2.34.1


