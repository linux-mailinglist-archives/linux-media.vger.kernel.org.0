Return-Path: <linux-media+bounces-58988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHUPF5kD4mna0QAAu9opvQ
	(envelope-from <linux-media+bounces-58988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:55:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9814419AB1
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8AEC3272B6E
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 09:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3EA3B3BEB;
	Fri, 17 Apr 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hKn47pmP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDBF3B47D0
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 09:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776418676; cv=none; b=hQ2yLUCzyAtLOjYhp78enu1cirPoEwxf7kA19SvcqG+II28J3xepjBbi9lkMRlovQKTjMNC2UbZUKBzH5HT46DpWipungi4Qj5LnOmoGnoydAWxpWAg/GIYEuZLyvL+m6QW9RdqjPxrYKx8yjRwp9b+DAFc67ny6wtuzOip3PAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776418676; c=relaxed/simple;
	bh=tK9kidjyUePjkt2XPWz0LurMs4Gb/ujh22R0YE1LBJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aR2y1fXpB+P5bY+GGRIDCuBCZoth4Y+wDtAgzoushrR1gWLra54zHFts+bfb3OusrUGMxxCFCmuBx7ACIjLhbs+BeI+GjNL8CglpkCq2Tamf6i92OPfrOqnSkG+jHdj0z0jRtCLnL/y850Y5vPZ1ozYFc7Th5OlVb35jQSNCnao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hKn47pmP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so5785175e9.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 02:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776418673; x=1777023473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TOp9gQOdq82VI4oe3G6KbPjn6R3y1zFltcXTzoUHVU=;
        b=hKn47pmP5ApVUHbDxlaqiKPFWjlLxnpQbvhh/bA94tFfjVYFH8TB3Eid7CXmLj4kBi
         Ehk/DwFt9t8vHJAN2wJKZt2xv7ypAD2gkpN/5MUojarioDhOEJVH3cjuo5uoaC566+ek
         z01AXksYQLPpKEotvQUNAWADaWhXp8a0GTi0EhMmpPNfdvRcZOE2mcU25jPGxjkyXmW3
         VM2RQrsAhEJrLhJZIXPw+0xHukvnGDj1RYxXneOvONDnDqNea/SlXfVmbG/VJUxz/JBk
         qYxLAaCoQC+ZJTeqyBNGnII+jo0P8Et/s08fawVs94IAqoIbSDH6eRqGUezbSGQBCFoC
         +6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776418673; x=1777023473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TOp9gQOdq82VI4oe3G6KbPjn6R3y1zFltcXTzoUHVU=;
        b=YCSRrPcceVZCtHje8N6+xo0bcD4FN1ovOc92hct4lTxymwPTZyfkQH/mYCPF8j1sYl
         E220HmKfx1G8hCgWY4YFyVGKAZUiRMIpujl2k9yzDFw82ApKeqkYyB58QAvHmXu+A5P7
         OPOMghu9+PI9Xl5qme8EdEJH69cCeE+etnqq6pmHHOtJhF+Kn/ExqJZMyOSheZmk6pXE
         5Yzl6VBr7Xr8l1BrvQErEqHCVo0GTWl6htUIIUDQ4wxad4B+qJB5d+470my6N6W/8NTT
         VVkKtHMSBRzHsCxg9Kh9BPRCHRNls8jD/jD38rnXF4tRHja4XG1oJRFO678MomzXqwoU
         LW3Q==
X-Gm-Message-State: AOJu0YwKXob+pe8hocZ0MIxwIvC5tOLPy6FzOPHyqypAWCnC6g1WJRyr
	pj4MT/kCJrqIFFowrNJlfPmjPlCeFnJJkF8cGfIwOuuKlrXI3FsAx1gDyTXle2gSWqM=
X-Gm-Gg: AeBDieuhMQdNKQ+r1HRWSoCh/Lq3Y40mbc8uHQ7aCi6+78Pg/hqCEU7KsLT17cvAgBk
	M5Q2yUQWq4W6427jVizbSAz2A8EXdco9LqMsKVK00/tp+TCFf8RhlU6UdcYY0dL49WwGCCJgVQO
	Oh73a+ygr6AuzwfjUxRj4vyCh8sr2Z7SZCsXjUXN3iCmaEM21+yKpPix957FcztFXR4Lzir4QH8
	WTGJOa+4ugcX0qbqiS933yyaeC/E3/Ct01A1es6ZLlNQt9GakvFqqdtVTq4/4Y4ax7FnIP6PkPC
	XG+WyeVFvPhI5dQocoY6yXrBdeDVf/VdabaiOQ2IbVQ+Ah0vsCjmw6vg2uY2rB/Fk+jArQAi6P/
	VSw7onrjKbu1nzqfhGnh0y4qxLwDjZV7AEsTan0DGPpqA1TzuFBN36KdHWAQfXdXKX0yZAixA8k
	yAhq64I3Iv95IgbUyMHV89t5Rpm6RDd733MiZUCA7Zy9fM7Gd2G/mDD/k=
X-Received: by 2002:a05:600c:a309:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-488fb78a4d1mr17953235e9.27.1776418672878;
        Fri, 17 Apr 2026 02:37:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm12915435e9.28.2026.04.17.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:37:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Apr 2026 11:37:45 +0200
Subject: [PATCH v2 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-topic-sm8x50-iris-10bit-decoding-v2-5-c987b65a31d5@linaro.org>
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
In-Reply-To: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tK9kidjyUePjkt2XPWz0LurMs4Gb/ujh22R0YE1LBJw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp4f9qQRvg2bjcxW/lnpfPet7WxhN+voL237r+ut4u
 yYJs5MCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaeH/agAKCRB33NvayMhJ0aQHD/
 9Mt0ZeI+lS809cX7PEoebxSr/Nw8Y6cqlQG0+SQsi/63oVAqyCZxYus8UbwrDfrGsZqCb72+pVaJrb
 0jWsffvub6DgiOKKzYODhphHH5ArXVP2L10bYdC3EkQLtmvO1rbRMIQS3SNKCt8pYIaRshbWrW96uZ
 WYburfEw5vugM5KYQjWny95dfBjDhM4EHrnpG+EIGApLmr+E6LBvy3aOqF1auHv8NylXIqXmmmSmIl
 msoI6yTQ7vMzG3NUerl4TTm6F4QKJUULGkRteSmqISfdtEwZamPtg36wcC2ua/TtWWtRXfdTN2bEQT
 9eAE9zZuPBfbCD/QKPs7HjOC9WoSPV6HGDGR4Rl925G8FMkChFGNKzaabS7/ELtUn6WUeRINhHIRbb
 UPlr4MfRP5KEdCuCEzXfKNc3BNJXYOeU99svHvqZlIkzhqM3FV1Wbia4VzNmSC2KgfVhaLNTTPRaXn
 2HMDIX+MOTCUUpRw/qS5yweQS4JpArlS4kcQ4X/qEI1Q38SHLaKDlxSXecRyz54ghj9Dqgrhs7ICy1
 vAZQiBIYhLcWbXVWqVne9aDlUYXX9sQuCKekBRH7nliZkmfZI8WE5Jfgv4jeN/FzDb0e1DrC8T+oBY
 qhHVouK3h0TsQywrUY5XUl1j4j8OHs3HQJ91RMcClw0lhJjdZFtVnFK2+fyA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
	TAGGED_FROM(0.00)[bounces-58988-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D9814419AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 10bit pixel format can be only used when the decoder identifies the
stream as decoding into 10bit pixel format buffers, so update the
find_format helper to filter the formats and only allow the proper
formats when setting or trying a capture format.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
 2 files changed, 11 insertions(+)

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
index 32cb75757f2e..55c4acf1aba3 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -105,6 +105,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	if (i == size || fmt[i].type != type)
 		return NULL;
 
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
+			return NULL;
+
+		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
+			return NULL;
+	}
+
 	return &fmt[i];
 }
 

-- 
2.34.1


