Return-Path: <linux-media+bounces-58274-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANpEO2KH1mmwFwgAu9opvQ
	(envelope-from <linux-media+bounces-58274-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:50:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AD93BF18D
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 18:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69E9A305E115
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 16:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6C73D6CCF;
	Wed,  8 Apr 2026 16:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DdPzXxwi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749213D3498
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666646; cv=none; b=rRdVrJGZwPRVtsU3yPQsN7hpCDXYiTs1nHi+ywVetPAkDoF4h8a+MJbU3wPFZVzCm+B4aYmleIK/kumqL8QXom3XnAUk/KpHps5H4E9rlQCXX5JFsDnxmR4wuoPnlhxvaiKO8fG1FqrU869M9RbxPRJDpAXpy3+P5n5jHw++Oyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666646; c=relaxed/simple;
	bh=iKi7TWSPAcDpk+ligDyHGES5lhOh+3q0bJO5uJcl3nI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obEvqyofcM0bpUkWFPxXRtPvIHFnjy8TPJT/l7NTlC/nqhaZyDgvYV+fD5kz9UCXw7CynXLAvLySTpD0dAaAJY9Io+CEeN2IkpmTVoVK7Fr9f9V9aW68Bz29sSCoxN19FcfUEVv+PiYqsjT3QqKTcNZvUiHiuj97SyeMJSVjX5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DdPzXxwi; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488c21c636dso101545e9.2
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775666643; x=1776271443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rg9pB3aOuDW8Qzx1oWzCiWsvOqiQ1Ol75UriDwggpec=;
        b=DdPzXxwiQ9Uvr8ruAnTsxiDeoUA/EiVcd+4yAaZM2Yiwo1RzHphVftuvCZT6nZfW8n
         EmoZeuu80Hhl3/GtVTSI77QyP2p2eyHT4fk1sAk/i4Sa6qLscM+3OJ2gYb8ibkZVN8Jt
         5fH0wGKxVu+nBhH+U8jcckEAOG4gT321sTVFPXCLwrusBuXqYgCwIpzVC3FY5FvLVSIA
         lAIESetyGZe2jTguyCSc0jrRYTdSqT60V8DMgwel7ikSeoI61uNSYciNS3uxstXT2MW+
         0GWCyIOs7pcotp6O1xlRPK2LxjorPBLpr2yHLSpFcdGTkgzIX9ZK7KSvOAbtH2UBNDAs
         wj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775666643; x=1776271443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rg9pB3aOuDW8Qzx1oWzCiWsvOqiQ1Ol75UriDwggpec=;
        b=jOXh5kqwGhe1cO+A1ZjQZgZXzCE1JTKy/DRix5fnTll5P53DpxLJbY9J6FGE9Hp4zI
         0S1xbDYu0Rn+rMLYfZl28FC2AcXA+BptrZw+7/toNj0xEDBetGHnbiqNod2MyiEZC7Bw
         hToiByEGG7n5PzkR85lixNdYugT5jHYMk7FixIl/YzhRjfcm9sOLPiH0POpojzF58STN
         ai0IkbyWGbTF7D9BlynjEf2FtqvZcfoBszUz4c1teJ+ZllAXkg98HCpXUcGg5rdq7VbL
         lB0BwQ0IeY3zHOMwjU2d8nIAFMoFKkhuQHCuUaas8CCT6iJJmpM6NyKLodLWhebFKooV
         VmbA==
X-Gm-Message-State: AOJu0YwzhTz1lmL+ilXf91nCjcLXwqdE2Zb0ep4+nM23L3DjxPE0kdSG
	3q2DZc5Epe33Bl2FeXEQfz/HzVQx+PilXYBEXkMKcM5rbgfN2XtS+PB8CAsA6RNZc/E=
X-Gm-Gg: AeBDieugkC/of5p+NTfRLnZsFWTjXdbjJj/gpfLJjwXH8dryf07c/GiZjWraabWALOj
	3CjBjIsKrwollvg6UM622VrgBS5WnQGO3SiWyQGg8V6Bpqk3R7QHjdETgN7ETVv67gGqCvPpAYD
	tIyCDbcvmkMO5D84TDDP/sk8lBGBQ6NEp2GFuTFZhMtHLbSt3nq/PkzoFSsEli8b49dOfSKvdOV
	0rO3SiT+65q7YPGIU/4R3N/FkcJknW6zQOxzs9ic3IKYgbV74h9P1y7RN1sIvT/LPg2gI41++qO
	QRDo2Mw9nEwMjk5+XXSk97PactWnmOM6IiCJru0voEwAVQ/11BZ1Is4PzACXj5DVDLGGuzHLHGv
	BsDcM9iTvRm4e4Yvj1eYa1qDZ//NyZdyPsth+pEUrgDFIEZVzdTiWxEncvlFKcC+QLcl5D1W3FB
	yXkrHZ+CebWtVmunaX3G6O7kZWVr52utP2YDIm6ROc0Mhx
X-Received: by 2002:a05:600c:5292:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-488996f08f5mr335335745e9.9.1775666642816;
        Wed, 08 Apr 2026 09:44:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17be0csm1388065e9.18.2026.04.08.09.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:44:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Apr 2026 18:43:56 +0200
Subject: [PATCH RFC 3/7] media: qcom: iris: add helpers for 8bit and 10bit
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-topic-sm8x50-iris-10bit-decoding-v1-3-428c1ec2e3f3@linaro.org>
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
In-Reply-To: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=iKi7TWSPAcDpk+ligDyHGES5lhOh+3q0bJO5uJcl3nI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp1oXNQ4DoU/f9cTIzw3Zjk9DmLesZVkIfgyWgWDAE
 +72+T9yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCadaFzQAKCRB33NvayMhJ0fZZD/
 99o19TbE4D/gFQ/FM6ntLAihUWjAw4DA8q5FwvJkL6T8pbMB/UpqGQDFg1pfhksqCqpyb2STYyd9yl
 DMKGMb5Tb+1lbitkP1GSpscdOeUXg5oEW+eVR33aL75iw9dr39CDBAfTPYHVX/hx9OSVkSULgPTTiR
 o2B3oDlleXDdATt4GKIdXsHa9Ho7Uhmdr4DOGaGaoT2SKgHHNN6dHVQjq7sk3R+THRfMe4mfkXUhNx
 O4SMZ6K9VLSsERFd8VzTIl4EELDxVb0h5VRsI2Y9bB0iKHJltQCNuYSC/ObcxvpGH/A3K92c1lGp8m
 RRJp09fma8Q8D9EeWWEse3Ih8Lo0AndafKqy4KXe8tghxCqzb+GFqBIfq+tD5ZEANtvS9E6NN6GQkW
 1RPA9nTG1L5BMaoEfzKUUnj7ZGgKRzBfbQTawCqiGlpCF3KKtlqPA4fyV7Jx5QkwQ14Gr0W3nF8k28
 qAQs70Io536hQOlbh5OWw7qW7oa3ejTl81XB1V2xLNe1foEp8L9pQnHVduKp9JMhbqTAlhS7pk9Hu+
 KD5u+xvM4zrmwgoKaWwlgqC1nfTwIVqAIKJqEkUGvPi82cN+rCmJ1vX74ol/ohRBk306DReqkEr6zG
 Efj9V/sMPl70FvLKoFSTywiXTh5PwuI/eqAyVji61pal1VHMnWUSACIdQE4A==
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
	TAGGED_FROM(0.00)[bounces-58274-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 97AD93BF18D
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
index 26f51a0ccd04..c75dcb8e671e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -40,6 +40,18 @@ bool iris_split_mode_enabled(struct iris_inst *inst)
 		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C;
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


