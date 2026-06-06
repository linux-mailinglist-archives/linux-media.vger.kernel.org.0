Return-Path: <linux-media+bounces-63997-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ax0WGXbXI2pazgEAu9opvQ
	(envelope-from <linux-media+bounces-63997-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 10:16:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7B64CE5B
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 10:16:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Zw1q/T7f";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63997-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63997-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1995330219A0
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 08:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3292F9D85;
	Sat,  6 Jun 2026 08:16:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3D27FB0E
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 08:16:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780733804; cv=none; b=eLLo+T7f3dsRnJEutKrdJj9OlKH5PbLJCNGPDam6WkjYHnNBvwjePteAO41HcAdf3AdbrYRVMQ42/cLrxFOvOmQPmUql3e7xhgH/QeJF1uqnuL/UNOnluUrNLSBJ3nuVBzxX5Xy0gZw78h+pyoyeIibNiKZ52Lp0MX03jZFUUXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780733804; c=relaxed/simple;
	bh=XRLsF9m/UswY0c3AinlYQkni5aTuuuboCKSYyhRwQRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqtacoeO4qGa1MgbsYRHn0wRSW2/Yc3ofaCNtZXt6yL08ry+vd32kmeQNjkzfX0CcskqozDl8SzWkSXyutj9SUbsjPo9ZxueztgqBao3yjIr1a5WiObAreJlMIajhFM6m5KR4fJz6Lm2Sx1AlWEWb9TeCPXHdBPIKv8DlEwNYxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw1q/T7f; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso24488175ad.1
        for <linux-media@vger.kernel.org>; Sat, 06 Jun 2026 01:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780733802; x=1781338602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8qChUGYgELG/aZ1nAOZ/r8X2US5HdwujYtACOKdC8M=;
        b=Zw1q/T7fLrAz6a61EssLqYSAiLDUi+Tz2NDCNw849dVZ83soemKzBkgH7wskbMbFF/
         SMgqqZHn2mvSBo2/R+4Jv+iSBeRXEhaW/XPv2sXRpmzUOHL6GOMYqTQTlCDxnjGUDsyM
         riI3RZWbcSirCNNxmHaOu42swk2i21TBwugsfTxA1vlbqkf3hS5Oy4M6nGoAJySEYawb
         uQuy8WPnUtwFaU3YV1F/HED3mfBxmdoHCoeZyOqmVuVHbxo78u/gENbJjJhxLObJGPZq
         PqBZigvhALNY8rq8mg6FO8oF4FY2EzLuHbiVT5KvJ7fJ9GH+o54S4k1CkDm92Zy/XmCj
         xc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780733802; x=1781338602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g8qChUGYgELG/aZ1nAOZ/r8X2US5HdwujYtACOKdC8M=;
        b=N3J5NXCW1lS2y8qAe2T94MRuX8Os4aXnFfee7dB3UlLfwjdQuD8xegObcxlwTflX7e
         qq3liIb8OYTPPVmIO0Idb31+4Ft2MORFjFxXVWJQ2rxCwEXnh6CDRuwUvSas36BVekeE
         7xsqhKjD27ih5cP1+vgRFxLMIy3oFll2CRPZVDtcoFJaNiRB+DO7PhzkIlI604T24kWW
         krygVdIakTZAxfs0JsRe0c1sC4x8NYwFX0BLngXq6CG8e1oD2N6HGqEt8BPvcy7Iu+5I
         +0NtP7+1qTnXlqeR3q3QcJiPHTZAT5tCnShQy/qvR4w/8pOWSh5wAmYnKqGSJ/vRqXXK
         xeug==
X-Forwarded-Encrypted: i=1; AFNElJ8zT89egs7kXhDzlxzYllhJLLYGJzdfk/GkZ5PL602ybCG4fC8qrM67PdlkAgPNPnGSzYRY0l4U3qKSvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyiOPr2hqiGTCxSS/f6jQsLg8yxCR5cZJ0v/it9xEfavR7DRUp
	5e67MeIOmd4xLU9dkK/fxsWalOIfWh6SSm5pfUvJmCShjPa2gz5jk2p5KrqSM1DcxZw=
X-Gm-Gg: Acq92OGXnM/6dY8MV9J6Rx99Yg0PmGjIxGncOhd0kRCLtTjal1TJB9dZsMpvk75tl/M
	WQLgDuUQwvF9ti++3bt2q5KzNbikx+1ZtpStUwDWkWAuBaU/oNtfjfRUSlZGOi2sC33gWI10hr3
	SN+89w3/PA3vCP8Qdw+qiK7gcWBopSK7fR+MZtsJc8lxH2Wro07EXX8n+fcLWMLPVW4GkurEigg
	c7oLz5cMd+uSxUqZ4cb7meigwYGfp9DrUYpgAIv646MuPcL2kpfLJTrGlxY+3XaS9+fCqXS4duu
	knFGzCSyBXF7+Ob76O28PsjhOEJhRoMdZxFSfxpTyEV7BD9Bn7VH0VFwyyR9aQ4OJoiWsSZJYUv
	W5+uWfRtwb7vuBkdAUsufdQnzi8/hZHwtwJwe/khSw+xa9i4hUiyhTPetg/BAXFAYj9fL1ZWl4z
	dvmFzAd/lgxMNYRZ8LI+dTkrAfEhuo8pfFA/+VY3y9KaMFXo735/2CfA==
X-Received: by 2002:a17:902:c94c:b0:2c2:33a4:aa8f with SMTP id d9443c01a7336-2c233a4ade9mr7285325ad.13.1780733802479;
        Sat, 06 Jun 2026 01:16:42 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:967f:7ce4:ec98:f08b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d55esm116375565ad.63.2026.06.06.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 01:16:42 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] media: iris: check decoder format allocations
Date: Sat,  6 Jun 2026 16:16:36 +0800
Message-ID: <20260606081636.3-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260606040736.13-1-ruoyuw560@gmail.com>
References: <20260606040736.13-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,linaro.org,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63997-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ruoyuw560@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruoyuw560@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8E7B64CE5B

iris_vdec_inst_init() allocates source and destination v4l2_format
structures before initializing their fields. Allocation failures would
leave the function dereferencing NULL pointers during instance
initialization.

Allocate the formats into local variables and check each allocation before
assigning them to the instance. If the second allocation fails, free the
first allocation and return -ENOMEM. Store the pointers in the instance
only after both allocations have succeeded so the open path can unwind
cleanly.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
Changes in v2:
- Allocate the formats into local variables and assign them to the
  instance only after both allocations succeed, as requested in review.

 drivers/media/platform/qcom/iris/iris_vdec.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 99d544e2af4f9..837f29f403bb7 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -19,10 +19,21 @@
 int iris_vdec_inst_init(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
+	struct v4l2_format *fmt_src, *fmt_dst;
 	struct v4l2_format *f;
 
-	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
-	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
+	fmt_src = kzalloc_obj(*fmt_src);
+	if (!fmt_src)
+		return -ENOMEM;
+
+	fmt_dst = kzalloc_obj(*fmt_dst);
+	if (!fmt_dst) {
+		kfree(fmt_src);
+		return -ENOMEM;
+	}
+
+	inst->fmt_src = fmt_src;
+	inst->fmt_dst = fmt_dst;
 
 	inst->fw_min_count = MIN_BUFFERS;
 
-- 
2.51.0


