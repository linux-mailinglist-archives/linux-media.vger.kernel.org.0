Return-Path: <linux-media+bounces-67500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vH8SCkYjVWqTkQAAu9opvQ
	(envelope-from <linux-media+bounces-67500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:41:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7170874E195
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:41:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QiNo4quQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67500-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67500-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31AA0307F013
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 17:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55D134A3D9;
	Mon, 13 Jul 2026 17:39:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CB634C130
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 17:39:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783964345; cv=none; b=AKUFAXVoXSpQUoKyfnaLQlZMUrfO1CQgPBfJjYEVsSOZQ0+5HnGBRpZGMGuITZE4/T3YmZHts8CoHHg30kA33Vso0MB01DmbRyOMpwqCAJGTvhb1i631QRXrjYz2CStIOb1iBXouWTM+Uqs9RpOsUxUzPOCyvJF1dNW6oMzRmyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783964345; c=relaxed/simple;
	bh=+UfnnAywhWfDmMFu2HtpjxsWcBfvg1aF8Wh4AXz/GD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgPWLD6U2b1bewLfIvyXuET4MoEC/ZUEoFJyyyDvVSwom8j+zrPbMnX1KvuJxLGTEZcqGWG5mX9QtU3nNzmk51IxegewL3SCsZO/5Cp3g9WRlYrCVNj/0jfU8sVa9y5fvIs1IfJaO5EV2qm2tJ9lsxJi+vtrZnD8pARoAit2F2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiNo4quQ; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so44282815ad.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783964342; x=1784569142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJTXKcUVPMM2q094v4fU7tfA4D6n06AAOLUKvX0e/q8=;
        b=QiNo4quQttG7y6nvcUJ4EBqLbRbRmHKkrdvK6xEAzmAWZiVYvLoy9mmh+mX938+7j7
         0iJvjjjExIKKehLDpLrHSsX9Tcc+f1RBLLBueKhpjLH6mwUjLdT1oHsq1GJMe7A3JZ6u
         mzKqd8s+C6eEJI61zxDqHuBumIjN/+h26VSX28d6UUfVrmtbwCUMcz0PMYD8TAkf3P1V
         rF9FBQfK6MGplX6tdOKCEERc4B92hsfQ8p64APAcoly16xKCKrX5gf3ZZ/KYc/VAR4N1
         3UkVEHXVmgQl2OxY5zL7yqa5lQ3RG/2I8vbqlIVl+taZ6GMIf40PJu44GccOD/7eIyRT
         a6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783964342; x=1784569142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJTXKcUVPMM2q094v4fU7tfA4D6n06AAOLUKvX0e/q8=;
        b=DLMhE+sFW8qChKAGSo2L5JHG7YeAbv4vjif+XXA67siMaxNItOCqxoJbpPljq2XYI3
         ApwcdfDxY5BHnyEh0uLXyIWwyDtynRJBrJPADEs5cVs5IoOSaBfOMs6qGyUB5VWQ/srS
         2dO2wgAnQTFmcstk2Jz46H6QpxjN2pTZYF8Pf+H3q7nemr1iaael9JRpI9gV9UXC97qq
         cxxOWmHcd5JCapeJS538gq4Xyj66iLT0g+YSs4vpjTVfYa2g38oglcVv1n78TIsozzOV
         H9pzxUH3aUQZAyRPzQitlyl9doNEjwEZ1ohMNdXcnTo79+2MnE4Ww774xOPe/OuT9Pni
         O5JA==
X-Gm-Message-State: AOJu0YwcisvByOvdPsq3D+dJ886Oz0/LTMIbeB4CAiXhqhM/FRxURs6u
	4Uo9RfYJDGQ0Hjx0WEFnaJ270cIbHQ/w41val4lb1t0NGNl+GWCH18Ss
X-Gm-Gg: AfdE7ckcJqKKdKQ4sTgpPdttw9t4yR4nhCLOifD490mAW+mB1irmGvtzFvIaQf5+zMg
	3MBnWU9kugz5gst+pIwBN0bH8yFPkY18cia8cVhckypx95WrmjT06d6S2kqABlVk2MTId9fx7e1
	t8+Zo2S+Jh2sLkMKg5WXDAL9pLf+8PzPSopOaVAQ6TJmqldZgZxzLqtWwY4rUTmQP3MYSnT38DX
	6K6IooLLzzSNHHTmvDHkZRjPVBLwgGhmRtzSVPLIwk1c2z/zjOmwMEZDzozlUQUGZTeCFVOrJdr
	RMv2DDEUsmqqs8+YC2ldZUBLXBOHv7SgD2KGiAxM3adkBDxZK5L2Pj3VwlRHY5gUyh3NC6Wieuh
	WaxCkN1qWUUH+DXt9OX5qg2tlAcMFE9pIuVrsSiYOlLeOYCkYVH7R6l/SaVQ+4vSPv1v3zDqVFP
	gdlPd9LSe3neof+6rcsJ5oNCsQGPlRlv4rzFgesOEXw0LWPPV/okrOJrdZuJry/SlK5ABsdVk7N
	V5tHyIF7g7HtEFOkU54kkgOl+860pPsZwf8VbVK4Z8Gbw0=
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr175439a91.19.1783964341727;
        Mon, 13 Jul 2026 10:39:01 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm48273547eec.26.2026.07.13.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:39:01 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: media: meson: vdec: fix UAF, memory leak and NULL derefs
Date: Mon, 13 Jul 2026 23:08:59 +0530
Message-ID: <20260713173859.643-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67500-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:alfievarghese22@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alfievarghese22@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alfievarghese22@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7170874E195

This combined commit fixes several pre-existing issues identified in the
Amlogic video decoder driver:

1. Fix a critical Use-After-Free in vdec_close() by synchronously
   canceling the sess->esparser_queue_work before freeing the session.
2. Fix a memory leak in vdec_close() by freeing the session control
   handler via v4l2_ctrl_handler_free().
3. Prevent a potential NULL pointer dereference in vdec_probe() by adding
   a NULL check for of_match_node()'s return value.
4. Prevent a potential NULL pointer dereference in vdec_isr() and
   vdec_threaded_isr() by adding NULL checks for core->cur_sess.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..b794ad53711c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -926,11 +926,15 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
 
@@ -953,6 +957,9 @@ static irqreturn_t vdec_isr(int irq, void *data)
 	struct amvdec_core *core = data;
 	struct amvdec_session *sess = core->cur_sess;
 
+	if (!sess)
+		return IRQ_NONE;
+
 	sess->last_irq_jiffies = get_jiffies_64();
 
 	return sess->fmt_out->codec_ops->isr(sess);
@@ -963,6 +970,9 @@ static irqreturn_t vdec_threaded_isr(int irq, void *data)
 	struct amvdec_core *core = data;
 	struct amvdec_session *sess = core->cur_sess;
 
+	if (!sess)
+		return IRQ_NONE;
+
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
 
@@ -1020,6 +1030,8 @@ static int vdec_probe(struct platform_device *pdev)
 		return PTR_ERR(core->canvas);
 
 	of_id = of_match_node(vdec_dt_match, dev->of_node);
+	if (!of_id)
+		return -ENODEV;
 	core->platform = of_id->data;
 
 	if (core->platform->revision == VDEC_REVISION_G12A ||

