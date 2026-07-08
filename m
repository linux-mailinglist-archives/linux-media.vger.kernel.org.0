Return-Path: <linux-media+bounces-67059-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DWsuJsGFTmoEOgIAu9opvQ
	(envelope-from <linux-media+bounces-67059-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 19:15:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4F729149
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 19:15:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="pg/+X1vK";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67059-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67059-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFADB30711D3
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 17:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB7B4A2E11;
	Wed,  8 Jul 2026 17:09:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9F42B32F
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 17:09:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530546; cv=none; b=Oqfc4Lmt/Ayq1eqc/5o9ntzwUDR7FX84JVMOt2zODntHbK7qTizp1zpqNWd3ODmdQSxM9LP464DTh52bhmgHMOTtc1FihAjdzJY2feOB78FoxHwAIZOKgVKKD8H1EwgcrkRNFl8EwxqBnb9NT1ZmY8FE6Dc24eMgVfhjdnEwXWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530546; c=relaxed/simple;
	bh=rXJvQMnSWQxobBun6vz3L+Ik111O0wnn/SkTaHJJElM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWNZYKy2VcigUZFhPGa2+HRpxXkjKUMfcCg6gLYvt56vd8dRIUnj5yezTrvY62CJgBzLtU8LJyFPHiW5PSQgqlwlEkovlem77NNbdr9aVMK5BjJnTf6ngDdiDw8kIKb5MVi4s1JmoCUTI0EhmzqjEGIxGxTEiqzbIUSx/5BtLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pg/+X1vK; arc=none smtp.client-ip=209.85.215.177
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so585077a12.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530542; x=1784135342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULPGWoabWt4C2dncnPEuY9DeqKuYkLPNtOiVYZB2zC4=;
        b=pg/+X1vK9QR0/4cvaNV/ZR2SUID5uDcuK7sgrUFOTFfTYCpHRYhR8l3Fa00sp2qFqk
         WrHm1FLFIRFNpPWxXXP6KVz2AWk4iYjDUZ8rE7HfhekILYYF2xrbhaJL6PlK5znYkKX4
         thU6TspORuMXcCMxJF4OG8UwVaQmN+NcaV9X27HgoZoRR3Z60pXtc2AbVWiBUYc7PCQl
         On/GWe78LSMPUyyGmvkZDDTGjni7L69P4mZy0/RUbDW5iaQksxVa9USHjSljnCnPKBy4
         QLQqBPDGRPbr1kE7nWE+DeFZgiKfztt6l3IJmRB9t2tiTHa/QPC2vE8pV/1zpu9QH0h0
         /D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530542; x=1784135342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULPGWoabWt4C2dncnPEuY9DeqKuYkLPNtOiVYZB2zC4=;
        b=KPzCWpFK2dSbLdkk6cDPq+FFBQE9wk9r7OcXwMfdIqZmSHsM76DOVn5cOOuGbR/Uc1
         VgPIg7ghMjlVGoWKqGFiK1C57XMIxryonvKU4m1jy71F0rwovTm2V8BZPcKK9Q6gZYBA
         0W3sR2+N2gOwqnKAzLKnRdeMg9SzvuYkyweYOWUhihbmQa9ZuMq5xFlhMVWX0zyQvdDR
         vlA7CbyATtfh6l4xcozcBrvEdlCmAOV5uajLl3jBIWC2Ursz+27Bx97/R+WyVi7JZrCJ
         7ZS1z4RrSHTCzK+q4gR5CkLucUNQZ6dQ7/iVW1SBR+c0tFZgqNFxv629GKYuOMws803U
         o34Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp9kiuXpxnaBdYyIyoOl77SdCATyEVuGN0kQDq5JRZvcjJbwF6uZilfp09tE7RacHLzxsi4e3KFRilp+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzolj2QZcq9r2e+zg6HHK5oTX4NxBz1zX5WEVKcfYHd4SzqAUV2
	66EgZS9HVp4yUVidUmAi8h7H3Cx1vnMSTYa/vFHhR27GMarMGVeAdnpL
X-Gm-Gg: AfdE7cleTl5yj+pFQzLV+ECyuQL0o3iiYY1IWSF7vfgwp0435l/hLBSH1qk7evXnV6i
	Uz9zl48lj62m2XchT5wZATfIH2oiw54kpoffwaljUsgEumOEwbG2psuG3Lyb2Xaxbrqs1XtMSIv
	kMJrR8x5AySaraDXh9tEc5u1k5aa336/dieibeXT1M4FU9BoqssPXFgUZpv13+geHvByIYYRsPb
	9ydDPymrr/W8TeftdeAfEIBcJ7oMY5t0LSQZZkpnsQ/lRvZxE0B9ZDYjGx78y86uVs7HIS9y6ul
	Lpcns4JvDHbJ9jv2FIocIKMwPy+SkaiTgRsEWv2Ga3jwlOhsu5ctlXghMpmdyj4xqdlHTR5bjG5
	h4/sHlCwsDFbke9ppQ4dt/np4KkkCWjdQPpUPOAsc7TCb282vm581jqvK23Rejg1k1MG/35Ut+V
	mReCMdnbGzSuQe8j526/euTWlJQyM1Xbt7xkO38xiiC8E=
X-Received: by 2002:a05:6a21:4e02:b0:3bf:c126:bb02 with SMTP id adf61e73a8af0-3c0bd0f8fdemr3778858637.47.1783530541999;
        Wed, 08 Jul 2026 10:09:01 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.08.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:09:01 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v5 2/4] media: renesas: csisp: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:46 +0530
Message-ID: <20260708170843.55076-8-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708170843.55076-6-birenpandya@gmail.com>
References: <20260708170843.55076-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67059-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FB4F729149

The probe error path and remove function fail to call
media_entity_cleanup() upon teardown.

While currently a no-op, calling media_entity_cleanup()
is an API requirement for entities initialized with
media_entity_pads_init()
to prevent memory leaks.

Add a dedicated error_entity label so the cleanup is only invoked when
media_entity_pads_init() has actually succeeded. This ensures that the
teardown logic properly mirrors initialization.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 8fb2cc3b56503..199b70ea841d9 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -539,7 +539,7 @@ static int risp_probe(struct platform_device *pdev)
 
 	ret = v4l2_subdev_init_finalize(&isp->subdev);
 	if (ret)
-		goto error_notifier;
+		goto error_entity;
 
 	ret = v4l2_async_register_subdev(&isp->subdev);
 	if (ret < 0)
@@ -551,6 +551,9 @@ static int risp_probe(struct platform_device *pdev)
 
 error_subdev:
 	v4l2_subdev_cleanup(&isp->subdev);
+error_entity:
+	media_entity_cleanup(&isp->subdev.entity);
+
 error_notifier:
 	v4l2_async_nf_unregister(&isp->notifier);
 	v4l2_async_nf_cleanup(&isp->notifier);
@@ -569,6 +572,7 @@ static void risp_remove(struct platform_device *pdev)
 
 	v4l2_async_unregister_subdev(&isp->subdev);
 	v4l2_subdev_cleanup(&isp->subdev);
+	media_entity_cleanup(&isp->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


