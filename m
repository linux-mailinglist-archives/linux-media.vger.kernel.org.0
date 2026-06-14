Return-Path: <linux-media+bounces-64855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k2QKJTQPL2p57gQAu9opvQ
	(envelope-from <linux-media+bounces-64855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 859FA6822B0
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GieHGvWy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64855-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64855-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E8663001A4F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258D13218BA;
	Sun, 14 Jun 2026 20:29:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B94319601
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468974; cv=none; b=OonkLItNdn8tgoPppjhyv0sYD3RLUH1NajSFB3qq7z/YqTJBTCJ0F5sn66yn29QbgILqZ4SBe7n/WinoOq61ryR4ehCqi7bWX6dIIpvjEAzGPzIgAjagXde/ICTKFGCOCWsb8ZfLACPoB3bttG22FgiGO1EqIssn6TMppzVPWJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468974; c=relaxed/simple;
	bh=xrhr+biUuh404J9mWA5SRbw+qFLDW/KLwu7StfQzCnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfhG7x44j1g8YX2y37Ex/bhtV98QbbEyjMLdvoUc7QPOK4aAUpv62p62SunGyYNPVqoIMY/ng/2xp34U/Kh7a0JshA1lt940F7ECwuuCK//jyvjQ3N24dqOnWjsVFn9DR10ROTC9tGlFM59E+ijn+rwwvLwlT6vhaMpcmP2XEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GieHGvWy; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1583474a91.3
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468973; x=1782073773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTccDA1s6+WVlQksPuaHuJ7apC0b6czbNSqROaoC45A=;
        b=GieHGvWy/RzRt1cOrcwCqUjUI6I5fwbZeTzPpZdAnSq40U2aDZrsTJUPdHthCxNik1
         x/mXJv0Mhjx00Vf/lp58qfHPXY62xEKXSdMvorLKNIzNaROXCPC06PnAYTHkfJjACCDv
         u/+exrTfOuvEp/8+ahFYVRUymIRu2Og7h3cBOc7XWId+iuO6A9Iit4LTS6imESnbzE6L
         gwRRPjRiyACRNaHQRPF7VaxkgwMlXnVHIxH6F5xH3SgGWDXdZHly5yGJnOHQyHVPN+dz
         LKddyW8ajP5f4mGf/eN3QEt4Rn1hmzPYRrxnZNUJaAQJouK+RFBGbuYUEjRRKbvrU/iK
         Mxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468973; x=1782073773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UTccDA1s6+WVlQksPuaHuJ7apC0b6czbNSqROaoC45A=;
        b=nGADPgvIrws0oxYQw5PkKktI8Hop/rMBQhXDqKh84aK5lbEYNO6lVKLfQTwZG2oAEd
         EwaNwKUNpUTTu7QekrNVy6QWjj+hlVLP1E5p9iTlN7MYELdO59Jgi6yOevpHDq78wtXk
         vio/CE2UGt7QXHBpVaMg6MUuEZX/e1Hbi149lOv3WnjXLeTmttKY+l/ZWsRGw/hT4wlh
         RirF4Fm64il+YbXor9LXDsuq2UiXzmMhZr63LLLOIz90FMn68AIzuf+XImR/jpk9nWLi
         4PiDq/xHcalTqCRBUxbtcdfoWgdL+PthgoGfPdlKyfpwSTbCzSUjKDbwE6SMv5dLY7kR
         k7Bw==
X-Gm-Message-State: AOJu0YwnQoaMroXO2Q9L1+7B43E29q5DcIb2/zmci/fk2AgXLiqNvtXT
	KxY4VKwUfKbsxXo+wSq6uakBauUwSdt0JMn7OvLfJ/lF68WKix3Bys8HvMfAu0+c
X-Gm-Gg: Acq92OF6RiBgI0sFbog/tRg4xpw0Bvkq/2hQG8iPf+NX/+X2mkreaB1xkXsjBdlAx5S
	F+fp7+8pFw/md88N6UEdKHWglbNvHh4hngvi/Fn9cflZWFUw8sU4sjlv0ILY/bKFdRpqfsrKc2o
	bnmD1tKMNGlr1qNv2j1N7Jt6H2KVZS/iv3qyblix4YiekS6dGkU5cuK531WR8Zx0YOAVxGLCAJy
	BN4lleJNSmeS3F2td341Fv/+ZKMQCK84bSo4HroUtsuGpOx7m7seu/BiooSS3NAN//aJd//cFod
	W/Pa1mey1x3rDZjEhRIA2qV1R7SUM6wQGo7kZd5OgBvnNG9ABaqsW92k4O4bw2Bmo1+ZzgSD8i+
	NZ5bvX6mm4wNgWNeO3rT+a/W16jmVTz6yJ7KdZkn37UR6dG/EvTjY1hjXPpK41Mrq1mttMtQ9fs
	KlEVWoLXWE8N/prxOlCQgwFeOs0950LtaRHICkfNek9HwT+8jqUl0D1t/htgq0n14=
X-Received: by 2002:a17:90b:1c09:b0:36a:d6dd:9fee with SMTP id 98e67ed59e1d1-37a034f7242mr12117276a91.12.1781468972983;
        Sun, 14 Jun 2026 13:29:32 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:32 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 12/22] media: platform: rcar-vin: Add missing media_entity_cleanup() + fix UAF
Date: Mon, 15 Jun 2026 01:58:12 +0530
Message-ID: <20260614202835.11977-13-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64855-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ragnatech.se,kernel.org,glider.be];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 859FA6822B0

This patch adds a missing call to media_entity_cleanup() in the
probe error path and remove function to properly release media entities.

Additionally, it fixes a severe Use-After-Free vulnerability in
rvin_group_notify_complete(). If the registration of one of the
video nodes (or the subsequent link setup) failed, the function
returned directly. This skipped the cleanup of previously
registered video nodes and the media_device, exposing them to
userspace.

If the probe function then aborted and tore down the parent
structures, any subsequent userspace access to the stranded
/dev/videoX nodes would result in a Use-After-Free.

This patch adds a proper cascading rollback block to unregister
the video devices and the media device before returning the error.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..b8e4c8be431d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -219,7 +219,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
 	if (ret) {
 		vin_err(vin, "Failed to register subdev nodes\n");
-		return ret;
+		goto err_unregister_media;
 	}
 
 	/* Register all video nodes for the group. */
@@ -228,11 +228,24 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		    !video_is_registered(&vin->group->vin[i]->vdev)) {
 			ret = rvin_v4l2_register(vin->group->vin[i]);
 			if (ret)
-				return ret;
+				goto err_unregister_vdevs;
 		}
 	}
 
-	return vin->group->link_setup(vin->group);
+	ret = vin->group->link_setup(vin->group);
+	if (ret)
+		goto err_unregister_vdevs;
+
+	return 0;
+
+err_unregister_vdevs:
+	for (i = 0; i < RCAR_VIN_NUM; i++) {
+		if (vin->group->vin[i] && video_is_registered(&vin->group->vin[i]->vdev))
+			rvin_v4l2_unregister(vin->group->vin[i]);
+	}
+err_unregister_media:
+	media_device_unregister(&vin->group->mdev);
+	return ret;
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -1250,6 +1263,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	rvin_id_put(vin);
 err_dma:
 	rvin_dma_unregister(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 
 	return ret;
 }
@@ -1274,6 +1288,7 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	rvin_id_put(vin);
 
 	rvin_dma_unregister(vin);
+	media_entity_cleanup(&vin->vdev.entity);
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);

