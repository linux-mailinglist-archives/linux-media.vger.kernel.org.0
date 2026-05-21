Return-Path: <linux-media+bounces-62436-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oF96Ie/QDmrOCQYAu9opvQ
	(envelope-from <linux-media+bounces-62436-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:31:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3445A2616
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA3043088C21
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFE4347537;
	Thu, 21 May 2026 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jq7osm9F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA65836655B
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355505; cv=none; b=s7EGKUxyrbYxEdlkWb4NfMazJ4/bkvsgpnSSwODFUYCHWGfRA2zB3HpWaPojPQJ8x9G0EF8uwxS36JICzuEhnKKtFFhrOJETCydG3CtJH3umRv05PYC55NiAGvxQo4h9LlDz963TUuaH5ZAlp8/aCj/0S5J23IWverZZIMEvp5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355505; c=relaxed/simple;
	bh=ZCk+J4g24plDJu1Jqy1cbqmqbJkUp4JW+dFod0WTtNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTsIXMryxxAcJ1JUCxuFBuLvM3UwIJMWIYh1Y3WsSiqNPEN9/5KzzrmjPYZDwtUtAjFbZvWzfJMFHDzhYiWmvj0MP0qpOsHgo+nRdyUP0DBxefGyHbwnjyU4gwaaqRbaL99nnCiiFWW3ABNYTFt/wAlUDgnW1S8b577NF0fdMDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jq7osm9F; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso69288885e9.0
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779355501; x=1779960301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NlukUVuN+EDZ32q8KcVk1YwnxmllTh0MP2KcXJ/bnM=;
        b=Jq7osm9Fu//Yb6OkPHMtml4Jk2uBR15W7CBWVdFwn/0MIuiBiU9HCNoMXhAQ07V/ob
         gUjPvJtZ6sIQYkNu3YhQwP0V+vwGKC8WgzihmoxVmqtaPoRj3ntX7PUSyThiIvxAqylR
         5FJjWl3BwWG1UUsP5Pnx2y8HPIpzzbx9QCdtRHszuswZeOvE1Lv3KRRPXhY63pZH0yOs
         8PRpcXLPz486+Qgt6cutXo+MfxKT7u2TcHS7MNZKJnK6uirSyS8FkgEgCY1US7heBpss
         +cHcMfuvfPNYMGTdqoNkEEBg4gLMHC9iW3TKaLp5EfSWoV+5jOQKYJYDIUZFTiln1B7g
         wE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355501; x=1779960301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NlukUVuN+EDZ32q8KcVk1YwnxmllTh0MP2KcXJ/bnM=;
        b=QSTmqWyMSmrdrnb3Kj6Zor17uKhw/0JXA4H/hqQtIs+PAun7C6aSRj9bFxPlChdXvT
         B0u/pxMQPlb1f9D41bNgU4ok4lKP1uBVQHBQDRLYqYnBjnOmJc4G84klgtipQ1MZCC6I
         wmZjnfzfp1sqmKsykMViJTBtQwi1EuvhzJ9WSpGUnhKK+gRwHC6MRPJQTtjFD6VBg7JW
         LZI3qfucesiKcHj7xkLzzT1Qg3Dj46wrQ+OsWHChcKdMK+EJg88SMStRd8O0SlnCH2Cs
         7sb8hk+dL5wIYbapPt4h1BvfQEOr6AdxmkpKg8zffcUWBQCMs9IU7JFXQFC9fcn0ShyQ
         F4xQ==
X-Gm-Message-State: AOJu0YzRG/wCK4QzbuXCwCNXeAKZSl+S789fM49Qd1Hwt+Nkz8k4Wqu4
	g1A94AgCE8dKKcCP2gYt74iktZYh+aQmlbthWJrXhIin3Iv6g01SZ5YOVywKEine61Y=
X-Gm-Gg: Acq92OE7NHgX8tPBy8yi9KAVs7RBWS7Hr5tIDGQ+jNkgJXMdfd40CaF310ZFNmOpWzz
	TGuufWlyu8eIKO8QVFtN0IKf4oI+P3PimJ4gLvRS6Fg2FeIbsYa/SNuVjMAAEbDPq0ZqnzY5pTd
	WLDyRRCk2J3CIOEt680kwNr9ZFbJwAaCKmp1PQ6kHvXHuwySKMJXFUYEIdENnoKEDiudXUVaw2r
	258oTB8NH+pBX+NSzbjKbR3jDNEHFGx3pDsuxh0m3HkLM/z1uxuTE/EW9xNp0pSjTKqKddZO0gx
	92YFLbd0dFbkcUASPcRW9zlg20ukexqK1ojGIgb+LERiUxrSGyZtu5gphvR5VaDADVtXW6MTlf7
	bJDQNNR9U1fkQ81plUXcgVAOFEQqkpF6oKmg14aNr4VL04x4r1jnc+7FKkyi7Al8rmpGcQdb2T1
	2SVgEm2r6f8hTiW+EHegBev7jML+gr3+LpXnXDqmsVW5fi
X-Received: by 2002:a05:600c:4649:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-490360e68f6mr15793835e9.29.1779355501368;
        Thu, 21 May 2026 02:25:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm54945595e9.11.2026.05.21.02.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:25:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 11:24:54 +0200
Subject: [PATCH v4 1/6] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8x50-iris-10bit-decoding-v4-1-8ff8fce3f904@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZCk+J4g24plDJu1Jqy1cbqmqbJkUp4JW+dFod0WTtNw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDs9o8TkCfX8EOqYXTwQuNcVLtrplIQcQK2jzTu9a
 8L8beL2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag7PaAAKCRB33NvayMhJ0XFoEA
 C7GHWYqKzeRD6C7Ti5fLWXu1iypOByttwNm9eVAit6A/mWD8NcTpmsbs1SardNJ52v3bRn9PHyUOKg
 WjfLjEdCv9XmhrQPTLVAhBMlidpT/RgO6vw6qPkxSKXXMKcfQxe495Bailq7G93+W4GPrXflOCJHXa
 3FHAimJttx1AqGjHwYdBJqVw1pXRQ74sKS29WrEe+pswZDvRcFx42UDa947GKl7ZAW+v1aidizf8m6
 omLkWDd4hbT70TAiMgub0YjypkZXaNhSqv0IjCTct0QtLHe5zeA/GYZaK8dDNlBiCuZ/q/ofCCL8K9
 0OQut8JfX92v5BF+MCtu66MqhoaiuybHovrh4DqhAhmQTsaaPhEaaBodYvOUu1EVv3wGdph3UMwOD0
 XpriBlVpdm3X/vUQFo2eZy+/4V6uIFc+P2wq2OwefXEsoSVkM19I7q0GbhSKVyVHWSvNp53fJnYVn0
 Pw4W8qDFm3UpsWC3ewnHG3cIFlUEzu2UKiYhYO/cP1fJMutCxsngW/DdedGZyzCj9+jNGKIj1Lp4jX
 AR+RFnqRGomcCkRoZut7gNY+dUAvWKtaLJrGpZxsvg6COdxVmGaXePL8sGAt4iqaNWothMdKKDpxvD
 01s6ZuzJDeueUDcHzyY3VaZ9u6o9dHdwmViE8Rud5kNnuqG1NSinMNGy9EcQ==
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
	TAGGED_FROM(0.00)[bounces-62436-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: ED3445A2616
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To simplify code checking for pixel formats, add helpers to
check for 8bit and 10bit formats.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


