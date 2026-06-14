Return-Path: <linux-media+bounces-64835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dvgjO7jyLmqr6QQAu9opvQ
	(envelope-from <linux-media+bounces-64835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D0681E1D
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TAMYJurp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64835-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64835-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E90EF3001A4F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E79C39B482;
	Sun, 14 Jun 2026 18:28:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E21B78F3
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:27:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461681; cv=none; b=YKTlNat8/3wUDFVF2R60fKnHCTH7yjjlBJXPaQ2YJy6QxZLtomF4w6BC193T+4g6Ek8budPB8ObRCA4oME6b/U1iyFouNsP06Dzr/yyDjQm7KTUJwVuIQJrl/DSqaJd3U/oRUWhrBx2kCaXwKb5U0fF1lvdMriBYpEWyGfmfQKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461681; c=relaxed/simple;
	bh=3q56jea6IOBi0hmDJwPKOKOmrU/jW+5qhWqpcFffP1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqS4AMC9mZaZr2GCAWu/JM2Sq0wZ43wMBGcXP+cccRy2jpn/g5dwmjHfo+n6z3C0xbzJIXFNs/iiBcMBr7FSi2nmfnTt0WLx4MFU/JuyxdfT9bBTr24i3W7Uv9WzAHkob9M27T8i5B0MO7jCZEbrm0qjAWBkHZXjV1SVpUp9vlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAMYJurp; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0b944f6edso27987215ad.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461679; x=1782066479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8J5sWL27P2xSeVt7z3c8+kwAG/j8lXj7L6IdpNXA6Q=;
        b=TAMYJurpfzcmLXtg96SLOD26T32zXCVXb4VibdQqZxj2GUZWTLCT3fAm4I3PSwAtF3
         UsrToorbqPVB6Q7IvjNPVOOMR2cSFPW5GVXtAFodQp982oCV8jSRIzsutFaoT9Eid1Qw
         h66E7EZGVdsV59hg/R27xOqS+sus+ALSZyS8swxWqGMev4hyJbE9kLNuP/SbpD5o/eHt
         dyB9D82gmqHRTKNPBqIAjXd0VkjqqOr1tFjiqnt8GBgYDUY2bAYkXLPjXd0bxdnHQwqY
         ihpCtWyGIwWQ2prnczLo1U/ycAAXqLH6jQ3RWBZXI4IfnzRRSdQkp6Ud2kzjdhimhekE
         2U0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461679; x=1782066479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8J5sWL27P2xSeVt7z3c8+kwAG/j8lXj7L6IdpNXA6Q=;
        b=XwDnfMFjQO09YwvMEoy7zwWhTXPGeYTU4YoglaIbTdH54mUWmOsPnjvRFgJmB25/TD
         VSbPIn2XJqzs2JGIuOa5z2mXbvTW+nRbL7+SEwjsbxwqHDnrPxxxEaHXV+1Zj9tg/MKL
         XtmyMqUa0X4XoxjxnhfU+77TJvg2WykgNgoJPHSAQvbTlsJgUpzv1njPtL29/oYIFYc8
         5RKFjqB48Owt8amvCpyGuuBPtyjOWYxUzUFKHt/PLXvbSUnn5mugIbrAB513C8V0F6bp
         eSNWkgN3jyj82W8AxwQDb99IDWET0hHdEbp5sr6n+tdhn5UXo+EEU/QaGglrALFt4yzf
         7hqA==
X-Gm-Message-State: AOJu0YxgQitxcjIGRS11xnOIBUH1eKBdBjFjlJEPfvgmj9hO2fwo1diJ
	zrfjwix2ZItM1LW+V7oVKSl3wHaY37LyXXG3jI0IRYo0GIi+W3NGyvRTLKNzxw3e
X-Gm-Gg: Acq92OEiu8VHrSUaXFgRZ0CN9aCt9/cpnBEY2YU/NqrnRgeu2n1KJSeRBYRd+CbWQIW
	K3nG2oqJI/M9kZT09zDX1ID3fib5D/DJdq8bMzw+nUsV7QCWjwlbo1TOLcRmN3aOxgP3FdpJTMJ
	pKK3OP2S+1Q9gNJG3gnW5pt5fEGmtT+z2KF2cGWrfW/SxlqskxYTo5Kwf/nmBZKaenZvSwhzWtC
	SFn6f43LGN/rSKbUCMxi+Ycop6QVuJRlw8V6ZqgVQ0GqNPnSiuXg9O/MBirFd7JtU1KLZ59bCTf
	ulY21ef2VR1WwY9t6nPhVR7R7xCe/9WcwgS502LyQI0qOsqciExAFhTyL7rX6AjVdUvGYOe8JhB
	4+PNWX+Nv6/8rh0X1bFEtmPFejTzn/HP0uYTfGEkauRD4wAUZ5hzI53j+XRAo2Otu7gT5osBNPv
	Sjp1ZlVPLF7dFcvF4WSeGbOmJgcOaMYEEsBpBnnEWcwFrgmRlzlEz/
X-Received: by 2002:a17:902:ce82:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c6641bb17amr83493035ad.15.1781461679355;
        Sun, 14 Jun 2026 11:27:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.27.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:27:59 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 10/22] media: platform: rcar-csi2: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:06 +0530
Message-ID: <20260614182714.7999-4-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614182714.7999-1-birenpandya@gmail.com>
References: <20260614182714.7999-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64835-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC1D0681E1D

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..c4e35cac97f4 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2634,6 +2634,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	return ret;
 }
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


