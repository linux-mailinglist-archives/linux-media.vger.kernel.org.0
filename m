Return-Path: <linux-media+bounces-58277-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG1DExGG1mmwFwgAu9opvQ
	(envelope-from <linux-media+bounces-58277-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:45:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F913BF089
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A37F93007492
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203883D813A;
	Wed,  8 Apr 2026 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MW51CFWV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB313D6462
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666648; cv=none; b=hTir4VYtA2zCRVSTT00rvdnndiVBWya/g4IQv648ft9A84/bVTMn9UtcRpJyKzxwSfszQaU+V24TVffNPG1QbQqzX5/tbPPwV6909R3Ho6IP9tkJax1/MwE92oQ3zu7mqv/AB0G85B17HQ/odcFDcnSayc86TaxGu97l/R/xAiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666648; c=relaxed/simple;
	bh=xazSD4Yv245KY37BgsFnQAh7f/tkJkVNCQUA5pHRtr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Djsm5CKaj3BKuJPCUKKuqrPRowMMNnVEVbpcAjzlkSfeewGuKkS3npMdE0DtqMQzRdlhcgJcVYvhzjMFApTfsjt9MhtiPnSBJnfYp3waWFyAyeTUyRRL9cTwpdBGyGHqHJrUvyovOaAkz9JzRrQN8GXWDBkpq6/rgiNWvSb9fQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MW51CFWV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso13410245e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775666644; x=1776271444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tt80I13WEAfrEdUiW4NBG/10KMkr7uGie5ExwRhd8cQ=;
        b=MW51CFWVjnoVg77gqmcE1ZBb9UsBRRnbFHaqvZlbuCu+fMPwxEkn3u/Hh8jrxyYFad
         RbQqSUlTwC6e92r1OVbCLNQ+ir6lm1unD3MxAIDxk7gkx0BsQd0LIYbdnGozt2PdqBgc
         9+NF8J3cX5bDCXZTDGvgwhDp0ST/6cnmnJC9OpEU8kDuG8VkFXCKm5jY8BD0sXQzw6s4
         dPjDB1wMHSwcFOKQ8iHZF/ZBE3I+zzWxpZBRFvTf9HVgCVQi95yksN0bXqrAjHEpYRsg
         iTC3ZkGAkcPH07qItobIGYzBYCAA/z24K1CpToHKn+u+9LwSAllbJ2p+XhnIpM1sdk4K
         2A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666644; x=1776271444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tt80I13WEAfrEdUiW4NBG/10KMkr7uGie5ExwRhd8cQ=;
        b=JdiwDHmOnJv+P+aweChPqMJmozOP8lbyqtazaBHGFLcKpipDthe1lCR5INsBcv7lq3
         NWxGgMgPU5AO0+1TmTFP6t9sO1uLmC1+DGJrPBh3N3e3gQd4Kgd1A6MVrRaNc8JoAR89
         RHEysyKNXCg2fXkh+OVArbrmeFBCwpYbu0y6U1BzyIx9mjjuFUNA0kDaQixUfbwVdO3I
         A/corMATorVnOTN2hjHXxCwfb8OXWQHVM4mjBQGVaDSTvpd67DRic3axjVvIWnuAzY2B
         yG+wDk6t3SVQvglGlGmjLRLI/lbPUqYaTGSlwl3/XRh48OU7iLvjSjOafvUxu8JqKljU
         3Bbw==
X-Gm-Message-State: AOJu0YyK1anVtWuIEpARIPwQdoYN3nCWxLSX3j2ldio4FMdLWt3jIEtS
	JbtYsDpVYAfuCLtE6b0KMjAUA2OY7zOhKiY5WeZH7GYSxzDtwFpMz7dVDA0u47UfBZI=
X-Gm-Gg: AeBDievalLoH4URkiaCnSV5sIuntXUkaBW9rj+peaCfNFKhXwxc7WIfCdKnJMMnuhpa
	/7xp0ThfwWsB2wCKzSVd6oYuL3DFaY+b5MRHmOU2CjwfxyZEQ5pdHBh8oODQR4qEmOOZgujmIPD
	a2O1FWnxmAtryTxDJMo4SSD7jnmFnxA3QiNrxb2EkaciUcFCBeFodCf21MlVZwTEJKXlSihzVnD
	RtDYh+bI2Y26Q1gqELi4S87knKv7rY7dxPVRc71NuOCywsMo14/c9JddUZ0JO6VBfJ3KVQMK/F4
	VwIvMxsruvXy7eMlcMbJvIWjq9DxHJLEJ7pUu6SMfmvMxs7d8KXYPfXl/gB0Jkbu5wv8xeDVcQt
	1PwBJmnl1dquDHynVjpZv/I/Bx//O4ASzrsi6TcI1BoE08j4uNY3fZ5aRWNwOsjwgGVfvSLGw9Y
	rETxwQR1bbmFH8xFuXJ1n8O08tmXNHea9s+qDgr+XIvuxj5YQOL1xIFvc=
X-Received: by 2002:a05:600c:3f1b:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-488cd55c1a2mr2530945e9.10.1775666644286;
        Wed, 08 Apr 2026 09:44:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17be0csm1388065e9.18.2026.04.08.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:44:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Apr 2026 18:43:58 +0200
Subject: [PATCH RFC 5/7] media: qcom: iris: vdec: forbid g_fmt while
 waiting for first source change
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-sm8x50-iris-10bit-decoding-v1-5-428c1ec2e3f3@linaro.org>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xazSD4Yv245KY37BgsFnQAh7f/tkJkVNCQUA5pHRtr0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp1oXOe6GwBBtHt9CGgF65M9VjaQ1YjU6ALN9SLCST
 PIXxzyCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCadaFzgAKCRB33NvayMhJ0YsdD/
 9kdRLESFBv4hAsKR/DqBDpEyMqzVHCOKboz8zLA1yDEW0HwOigNOBy8SNAH/z0ttuj6+FwPjzaHMWf
 s1lOF6GUZB3Gbr7aJ7Uenc9YcYlYmviQpKzlYU8QJxvFh2yj8r4qPDfYPs5jCXwpp+eDhw2cwsickZ
 YvH0EwwS314VT+a2KVnybIEPoBxNN0VyWhhCM8EhsY4REvl6/2Yso9P44Dcs7GSVusMX1Uyh3pv+lJ
 1Z1i4q5KC2oZqNzY/Zjq1t2j0JTE7hN+jwSvtyW34hdhA7jGHWtVX83O/sgCZ5wodKPtE5K2UIlfE7
 JLROVsYLt4mq8YQ25nR5Rhu2GyWYnh8HliN47lbv0LnKNXLox8Di2XkQpLmP+fF+lbrX9Auvjztx8q
 ZuKzZB++GrBH61ENmlFauOJBy9b9YgMckMSTGYTJCduGm0ZikhEkQnlDZ7b7ViwzbOpviI5zibalgJ
 WodHTkGMwSlS6awOTmtTtWYK2q5PorJHNlKoSRnOwJwbPY+V1nyrq0ae5erHRhBeehL+9haqwLdXLX
 DCtzCI/NGkeEuCnvwbT3dhXulSRq2N/qVBXc6r1d/1ccwFIq2EPLubDUfMfGd3pVudTz1RBy0YqHL4
 oGHLfynvhSnIHPzEroZKrdQziyv9e/wfyfz04qP6GbI8OHj17mOGmfnx70DQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58277-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35F913BF089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When decoding is started with only the OUTPUT queue, we're waiting
for a source change event from the decoder. During this period,
the CAPTURE pixel format is not yet known so return -EINVAL.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_state.c |  6 ++++++
 drivers/media/platform/qcom/iris/iris_state.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c  | 14 +++++++++++---
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index d14472414750..08e51eecf1b3 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -258,6 +258,12 @@ bool iris_drain_pending(struct iris_inst *inst)
 		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
 }
 
+bool iris_ipsc_pending(struct iris_inst *inst)
+{
+	return inst->state == IRIS_INST_INPUT_STREAMING &&
+		(inst->sub_state & IRIS_INST_SUB_FIRST_IPSC) == 0;
+}
+
 bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
 {
 	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
index b09fa54cf17e..761e6c4dc36b 100644
--- a/drivers/media/platform/qcom/iris/iris_state.h
+++ b/drivers/media/platform/qcom/iris/iris_state.h
@@ -142,5 +142,6 @@ int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
 bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
 bool iris_drc_pending(struct iris_inst *inst);
 bool iris_drain_pending(struct iris_inst *inst);
+bool iris_ipsc_pending(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..b741cf15beda 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -361,11 +361,19 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
 	int ret = 0;
 
 	mutex_lock(&inst->lock);
+
 	if (V4L2_TYPE_IS_OUTPUT(f->type))
 		*f = *inst->fmt_src;
-	else if (V4L2_TYPE_IS_CAPTURE(f->type))
-		*f = *inst->fmt_dst;
-	else
+	else if (V4L2_TYPE_IS_CAPTURE(f->type)) {
+		/*
+		 * Do not return any format when waiting for the firmware
+		 * to send an initial source change
+		 */
+		if (iris_ipsc_pending(inst))
+			ret = -EINVAL;
+		else
+			*f = *inst->fmt_dst;
+	} else
 		ret = -EINVAL;
 
 	mutex_unlock(&inst->lock);

-- 
2.34.1


