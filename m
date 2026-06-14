Return-Path: <linux-media+bounces-64815-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8VDKOnvdLmrx5AQAu9opvQ
	(envelope-from <linux-media+bounces-64815-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5876819AA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:57:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=esCn879c;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64815-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64815-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4177300D93C
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B95239A04A;
	Sun, 14 Jun 2026 16:57:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66B83CAA2E
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:57:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456240; cv=none; b=Tp2ATX9IfT2H1OvsqQwpaF85zyeDKPXV0PNOGMP/4z+IA9LfMjsfVPED+iWmnAYrJSPeGd3K/FyoywxnxdUB1ZqKRTxX2KiNca1+JvMvOpBMnDRrAvzEyliQpR5X+IhvlS8mq5Clqb/7KSYWL4Zy2T53gO1hW8o0vBqzcAusVb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456240; c=relaxed/simple;
	bh=IiYX+xfOvL/8nDCMu1aMBxtS0ShoGyFUIXfBMYFkr8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWophsvApFVCsbe0FlyTWYuhha9eQk41eFz1W2FeJJoU8MqINwGe3NvqfIQ7GA4pkk8dG/7Xqh+OqP2AXP/ZE26mxHWfNI14Y6uzn5GZjEO8B6NBnRWSF2TIxj3JBWiaKCCf3oqajl1MCP1943PLxJXqZ3h2FoC4uACG+T8KYmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esCn879c; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf1f074a12so25967085ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456239; x=1782061039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyKNpNYox2jOy517hnCtER37lzbKjwzCWy2Qtx+nOpc=;
        b=esCn879c0K/80v+MZ2gLqkcq6MjPFFs6G8QLMS85/T9F/QQ1Mm+gITqGCb0OMI+hIR
         gZMJWT349LMxato9+sJfk4ZU5GtqOc4CyHKq25s2dlgf4rpbyAvTo/beuI3EYx675vGH
         mb32ne6UnmhtbvhGsyGzGIezG5NYwbXvTTLsTeT69AYUz5zLRDj91j3x/gLWQib4b//+
         x8udM+SRhYNkTo4x9qPjz2NN2YAELoIj++IVDu3heGIPKgM5ehI2b5anuO2Ob54gFP0x
         PY7onkznDqE/GOcfxWMrwofmaXA4OhQpUO77c9Tj2tQWt5SpkhBuplZ6aZcvL/gacEmt
         EtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456239; x=1782061039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lyKNpNYox2jOy517hnCtER37lzbKjwzCWy2Qtx+nOpc=;
        b=N3umXDNGP0LUr/N00es/7JeZOgaSsD6z8l8dLbrf/KqOVWIE8qG4wyAj7JWXLCJViK
         +zL7HVBhorIyv7+FXR9ftJkjyPPwIm42lvXEfoLohWPm/56kd1PcwURFZSF9c6c6EKph
         7z4TbK1I4eFDocVYPJXULjh3GOFGUmhrZE5Ufhd457iGKCvgG9uuIHAf4W8z/nzmzKqC
         2WkAnBpUVv7IgHNkElAiAnnbhCtwwi+BDgyJGc1RTnESO1T81T1FM0mvpaO1GpOyy2gu
         sX8YNMWb+nml/veAkBxw9brn6GflLsEejpSl2iHJMhLSZLliE7P8OkR7Izt2luiQbyeI
         1UXw==
X-Gm-Message-State: AOJu0YxHc4Cv6+1HAAOthzy+5xbDtEA/K1R1cOn7wRtKpxOYHy6mq8Va
	Tr9VYxfjtd1VOq/MzeUD3QAJhUwy01y/ojhEdNnzXPXdQAvn/sxk0fbAJeZVSOIg
X-Gm-Gg: Acq92OELb2NGEr268RNQGwcmpE1BMW+MsF1GqMwcl7A9OJocPNRPb1qnA99OFQbxqP2
	HN995UkD+qFIf2OdQsWDw+QZTSNGH7dR6i0h35CuFy9firQVYm/fvlq4kypiQAqOkMexPgy1UBU
	ojzau2SjB9rNsO4x4LIKPAZ9XurEmj5tNkEM6MHXkY0GEXCY6135Fim8jgzf96U4gGwngSTxeLX
	OImQLWdASt+r6bKsJoVKp2yJ7zdI+DqHXWQa0rrFlZjq6oS+9J4RWXgNUQzkjAqpyq7pf9OiqVn
	yckZnyR2QXtdlx3gyIXrOOn6XBWWP0xnlgP0GCgqSE5gDEkumw4AyVdjqHeXhIvxvJ91nNwtZSO
	qETjWTEVRHIaNngANcAR/G/t1oi6pOQVGleK8QTu9psqSSlBV9LNSBvsxxIiInAm0yctwQnhVdE
	W2NfL+TS+v6/znBVSkrX8CvGEAHXYAegOmZZN7FkERN5cjFSyJdv87
X-Received: by 2002:a17:903:b0e:b0:2c3:5683:9acb with SMTP id d9443c01a7336-2c412e2203emr116757265ad.32.1781456239152;
        Sun, 14 Jun 2026 09:57:19 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:18 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Benoit Parrot <bparrot@ti.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/22] media: platform: cdns-csi2tx: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:46 +0530
Message-ID: <20260614165630.3896-10-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,ti.com,ragnatech.se,linux.intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64815-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:mripard@kernel.org,m:bparrot@ti.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F5876819AA

Fixes: 6f684d4fcce5 ("media: v4l: cadence: Add Cadence MIPI-CSI2 TX driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 629b0fa838a2..df1598091d57 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -620,7 +620,7 @@ static int csi2tx_probe(struct platform_device *pdev)
 
 	ret = v4l2_async_register_subdev(&csi2tx->subdev);
 	if (ret < 0)
-		goto err_free_priv;
+		goto err_entity_cleanup;
 
 	dev_info(&pdev->dev,
 		 "Probed CSI2TX with %u/%u lanes, %u streams, %s D-PHY\n",
@@ -629,6 +629,8 @@ static int csi2tx_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_entity_cleanup:
+	media_entity_cleanup(&csi2tx->subdev.entity);
 err_free_priv:
 	kfree(csi2tx);
 	return ret;
@@ -639,6 +641,7 @@ static void csi2tx_remove(struct platform_device *pdev)
 	struct csi2tx_priv *csi2tx = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csi2tx->subdev);
+	media_entity_cleanup(&csi2tx->subdev.entity);
 	kfree(csi2tx);
 }
 
-- 
2.50.1 (Apple Git-155)


