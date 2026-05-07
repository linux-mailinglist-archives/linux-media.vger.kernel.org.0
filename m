Return-Path: <linux-media+bounces-60700-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPIvEcbw+2lfJAAAu9opvQ
	(envelope-from <linux-media+bounces-60700-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:54:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B40744E21F0
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 03:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56B58301E6E8
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 01:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DAB2820C6;
	Thu,  7 May 2026 01:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xv42ZOKs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E16418C332
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 01:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778118823; cv=none; b=IGM0d1b6B5E93xqFODXWm3v0GT2T3eT5DRLkGXl57kMPPlULQbEJz6lAnCq6xlM9y4Wu5VyP/SE2LbJ8wdUGpReryS8AMLTA1/IZAQXPFq+udchrBPunTxg7e+/ALD4uy/417gfyFbsv1MFQMKBWlJWtKdvhrUXx/ngZBWG9YEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778118823; c=relaxed/simple;
	bh=TU5engt07Zb8KgM7S/6yRl6f5zyq3D61N0nOnBy0HR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eVc/DcQ/424ZMsR4Z1RWMjO2TWSgSvvN1h8SqQAtgpr5UNQFPIWbDncuRiYXcs2oxp6D4zPW/4CzvvB17ap2dXy84dQdflqycL9uHEsUKJzAHO1qsLeFOGp35N3mKRp7Y2v0ljkXAGrHEMxjP2mFTPJe28Dlw2EZmcgT0tuIQ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xv42ZOKs; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-365e20fe3b8so142810a91.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 18:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778118821; x=1778723621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVzi3AQ9uraGdNsOvoIDMySBhERHTOJ47Qd92pnrF9s=;
        b=Xv42ZOKsMK/Z2UH0QEb7f+DBQMyRc+cOfH3BbushblY+rtUvcxK7Dri+86B+FIJmWC
         6ZHyYleh9VnnnOkaNkxwZTYjokl5t0qBNOHuyluTU0n/kK6stdtv8cWZ02r+wQQCE87Q
         KmBdQOOyxvXkfqG8v4WrsJOBNM1U2ml9YlT6bXTGNfdNLPgxgYcFK0vmLa3SW3hTzZG+
         NBmvREs/VPf/LH2rZCh3jCMko0ZExrY/Zo6nN32rpVFStvvdPidvM7sbpV7dB7AlLhL2
         XFZk4AFmbcfiYyvDgOJ2E9IiP0guyQcs/TcuUTJeaHzgy+E6LQK1hy2bLr9eqnORTJtV
         O47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778118821; x=1778723621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVzi3AQ9uraGdNsOvoIDMySBhERHTOJ47Qd92pnrF9s=;
        b=W4YK2bMyW5lTGIvCFvvaAHDB6sPI0Gl04LCDuVHWrH4/TDuM30ldnZWxs567g8V4e3
         3cOJoc5huVeOlYKK4JwVzsyyPI4TFG+t07dANEfGRjA3bo422VEDQSo31OrC34E/AvKU
         MacfvhoNM2uzY9F9ESxxoV7Q5lUkjawK79Vd3vjBee4wh+BEuN14zaTkEOWEJEgfjcHZ
         8W7yPWb5GzKKRm+v0fcBxZ/w6S4un6dhwTqJQH3+EqznCs/reFiXCed0wpMkAiXyhoV9
         lhNAvnP9bGms3H5/T1CPYw1GDOeOUgKd5V0xOu31fsZMlEwhcHv4NGshQ26tSMJVLe8Q
         I7vw==
X-Gm-Message-State: AOJu0Yzk6xeuu7qt3v34F64MYvGtE59ABvFms3BbLDK4/B5YQ6nHaeL9
	VaJlsmaYbapli6hCmHFUx1EulmnOkQeITjBbzyBmAzjxWz6K8+4syQ2B2tAc8atq
X-Gm-Gg: AeBDievqa6I1kKMrMuMFy7zJ1qK16IgRcT3+HZwfjqlqkghE3xFv9mYjhvyuG7JhCnQ
	2JbPPElHe+Xh7rood3ACsPmoxCGjJAvW9YgS2ZjMrsS/y4g04j4bHkg+ZW2GjsPyXs4nBTZygvl
	f6BvfjrFjRePdk7jCaf9n1KEzZ7pUa57I1jVtsL5l42z1O8Jej5gzbAGqTpVSgYbq+pL1EqrEZ0
	8CLNwbiG6uibRVwrSeO0WS+nqFLDOwHW/TCfMMf1QzGbnsxEYRBuR/Fs4sfd3x/n/is/Ubg+bDo
	eazjTGz6+Cj+2fxMnDhIpsD6qfYajRdoh85JpO+ruIEKWP/bAy2sSySpTgtF9zanXSiKfn2d/h9
	eyPfJkMI8tA2SSX90BbWe7RDinDEn5atqq0lvHEQy7YRp/ZxuYFHQTy5Bw3lafVAWkihUYbj3GG
	sX+YYzhZrXgI1zt9iKmdy22dRxf81FSyKiyIKmMYslMX+QiNzFVJ3eO3misnFkuLWWMiURWBrf8
	MNggqzv81zenzAplGRA2EEJhrDFqEpRMsafxK3PCJUIMQ==
X-Received: by 2002:a17:90b:568d:b0:35e:5a24:3c43 with SMTP id 98e67ed59e1d1-365abadcd81mr6105274a91.8.1778118821149;
        Wed, 06 May 2026 18:53:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c87678sm5439465a91.12.2026.05.06.18.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 18:53:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] media: gspca: use module_usb_driver()
Date: Wed,  6 May 2026 18:53:24 -0700
Message-ID: <20260507015324.238577-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B40744E21F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60700-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Nothing interesting happens in _init and _exit. Just use the macro to
simplify the code slightly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/media/usb/gspca/touptek.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/media/usb/gspca/touptek.c b/drivers/media/usb/gspca/touptek.c
index dde311c25d9b..734644d928ab 100644
--- a/drivers/media/usb/gspca/touptek.c
+++ b/drivers/media/usb/gspca/touptek.c
@@ -709,19 +709,4 @@ static struct usb_driver sd_driver = {
 #endif
 };
 
-static int __init sd_mod_init(void)
-{
-	int ret;
-
-	ret = usb_register(&sd_driver);
-	if (ret < 0)
-		return ret;
-	return 0;
-}
-static void __exit sd_mod_exit(void)
-{
-	usb_deregister(&sd_driver);
-}
-
-module_init(sd_mod_init);
-module_exit(sd_mod_exit);
+module_usb_driver(sd_driver);
-- 
2.54.0


