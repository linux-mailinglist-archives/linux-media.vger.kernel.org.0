Return-Path: <linux-media+bounces-64765-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +cNpH85ZLWrefAQAu9opvQ
	(envelope-from <linux-media+bounces-64765-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 15:23:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98967EAA1
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 15:23:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G95o7wOt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64765-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64765-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31369303AB58
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 13:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D903E3DBB;
	Sat, 13 Jun 2026 13:23:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF58E1547C0
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 13:23:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781356995; cv=none; b=iGzoNrP0VbzPFLfwoGNogx+W0tF7T8rU9/aXaLVbphvMRUnZWksfzjhr8bGv0KFHNTH6hGc/oaQaJjxrvrPO5C5l9d2AqiXqb0uGMaOFf0oHOVpn7lkfwhoo3XVkhSD2kFcH5rRwpxg+bdFkKhQ4zzD5NlOXUN7NJ6a/ts2YZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781356995; c=relaxed/simple;
	bh=latppLkXW+Z9Eii9nMQdTqCwSMkjVFnaKbnuHoAVXNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OI6Wr3x4S4ywsOHur3hqrAHIktgOnRQuq3DtNWjpxh9dQiXzaJBpkwczT2eOLUL07hjSTEtuhE2JSGTbuI6T8OyhPsMPt/7q/KS/CL29+BIcZ7Mm6Y287Ao/s8MVR2J/Nmg80d+6xo3zGOPY3E5jbjgQkiftXekDKxEC52b+bL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G95o7wOt; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c35980fdso19106955ad.2
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781356994; x=1781961794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nh5EVU6hXhADCRgNUvrfU8TEsVskYZBUVfjSVvb7e7c=;
        b=G95o7wOtVHkNyyZe7WvBjM1kWFMjpkNInWDFQF8sEqNLjA42rO/MpqGcPxZXK5hARz
         FMCwUmr2bIN7a0DY/Dp7dMWGdD3dqWTILiHzN15U7t+BFt1bmpRZq7PZLaJgU862c7hf
         3rjoZRZp++sQbTMCKchnt5fJIkKT9+/jNKhK+u1GkCOUgsHa2BHGUgs7ulbzGDEj7Tq1
         NKAG04O8mpJZJbIxDPTM4PZM1YajoXJltEGiuU5szXvgc8GTgFss70E0FNvEMgCsEqBM
         qN8FqgHTGvj4A9ghaqvMcn0lDzvefjdCVS4+Eb7ZvcGzA5AX+qRacvVX8ixhMwO3c331
         vpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781356994; x=1781961794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh5EVU6hXhADCRgNUvrfU8TEsVskYZBUVfjSVvb7e7c=;
        b=hZC22uEELJHccuhXy4eGrwg8kTXzrSV2d1BN7dvzdbRo7blMd8AsOdzEKNvwFNqUEU
         qewIxfj9BPGBc2vpbE0frg+bvxiaJoDM5yvWbV/QYskhighJioTwZu6yPKwcAIcVM7xe
         m7O7z6Ds9pOvWvyVFU0UOEniVbJKW95WARQW/45ZR139ZQemk83NSXvGlbzjQmn/wSNa
         KvUHYZ9WjuV1o/Y7hUnvU8SQ6NUdvFIDGe73rF8qqCn/A2CmI5Klf5KL654I5xXP4Hte
         nsEYD8zpVyLvE5ASabf9UDSveps1e8wPCVCiLM4hjtx8B2adTBXCqsPk9OblMgHtL4g5
         ZfIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3OIEbn3Of7fWOCQNyeGh7F3yJWRHRaF4RgLMb8XDeuCSAN9ReB0sloSZg9idnpywgOjU3MU1KrXuuDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRYcBLpob8GbuB7tN8nmYxp5kP+TWOEVybxuipVhmRCmawlxkc
	BQzZIIaAlWvmWxEImtmUqBhHpkfC5gq0j6BeZe6NEOVq+xGpT/VmvILA
X-Gm-Gg: Acq92OHqJlOZM5322WOD5BHstiIObTz01pg/R2VGMnseDA8518He77v+b5Tm6pjf2F1
	aXoTekauSq+grID2XuIRq1BRa4q/sFEsNPytrXtfba2C94tOnzzag6xCueNRE65316oz58Vx+wD
	hyPA/zYacqCGlo1bvmDZe6O2z728jjX1jlSC64t4pd8OlzJOGcld2qKOL4e+A1lAk1jzXSuQgDq
	8OUmLn6R3mW8bowFP9r1SgrS6x4PrVhMXFErFHuBGOVFmLS+ry2cHu8S8fhXN+DoOrAVNeOZYFp
	dArIpZkW0iMiooQc9XwtCdHey6E5lqhHkkYcrc8j4SNU+tapEAu/Ce2mTTxKrf9xLwby+0EcRyh
	+V938A4Oop9Ndm3OdSGrDATatcpGabLFSihpGQvV6nNIqdB4O8FpkSv9n4klNzpz8mErFRJk4L/
	TBU/LMGbbS4XHrpSxFt2+g7wi4vvw44chK7Pq5PmaVLmOLTGTZjJn4
X-Received: by 2002:a17:902:e84a:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2c412d2854fmr89259485ad.31.1781356994078;
        Sat, 13 Jun 2026 06:23:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb50fbsm48323475ad.34.2026.06.13.06.23.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 13 Jun 2026 06:23:12 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH] media: i2c: rdacm21: Fix missing media_entity_cleanup()
Date: Sat, 13 Jun 2026 18:53:06 +0530
Message-ID: <20260613132306.69394-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-64765-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jacopo+renesas@jmondi.org,m:sakari.ailus@linux.intel.com,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF98967EAA1

If v4l2_async_register_subdev() fails, or if rdacm21_probe() hits any
other error after media_entity_pads_init() is called, the media entity
is left uncleaned, potentially leaking resources or leaving it in an
invalid state. Similarly, the remove path misses the cleanup.

Add media_entity_cleanup() to both the error path in rdacm21_probe() and
the rdacm21_remove() function to ensure proper resource release.

Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
---
 drivers/media/i2c/rdacm21.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index bcab462..26088eb 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -595,6 +595,7 @@ static int rdacm21_probe(struct i2c_client *client)
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
 error:
+	media_entity_cleanup(&dev->sd.entity);
 	i2c_unregister_device(dev->isp);
 
 	return ret;
@@ -606,6 +607,7 @@ static void rdacm21_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(&dev->sd);
 	v4l2_ctrl_handler_free(&dev->ctrls);
+	media_entity_cleanup(&dev->sd.entity);
 	i2c_unregister_device(dev->isp);
 }
 
-- 
2.50.1 (Apple Git-155)


