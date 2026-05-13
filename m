Return-Path: <linux-media+bounces-61331-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CdFMqgiBGoZEwIAu9opvQ
	(envelope-from <linux-media+bounces-61331-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:05:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A91A52E661
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C45053018AC9
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE493D5671;
	Wed, 13 May 2026 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRbtAcGu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A113D4128
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778655782; cv=none; b=ER5zwQc5b0BfSSjsSpRZ4MVjn7BW7HFv10qxPFOi9loGRpFVrywsfYKpOu4/muLL3ILHSJkSlZOlwzhMH7idgnFC9ELaMcSaId6bc6k0SO7tH3lA3YxDvH6YaKdXUJzwiESkB1ckTVgjFmFCJjYuKmQb2lbH0vWfN/FhaXVQu9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778655782; c=relaxed/simple;
	bh=eOOYOcqT3op8hwOvsAG2awwbAC9YwaQbYCu+tWEDbu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hIdgJBRmJMFnIub1jSf4xC0lI84OK6zgq5OwDmhQmjYnEn+QzxSKYrbtej7gqq+y37ktulaLwENhJyO38nxTOIIt1JpKugX32ZUnqzwaJ9beEYh8GdzMnud4GSCKICIYa/MFqW8FIAjJT5JZoML88vV+1x7RwTEKuR3smVnSS84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRbtAcGu; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8354461da74so3089522b3a.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 00:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778655780; x=1779260580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GaH9g17uem0QR3nAcOAHHOsv86hTEnX1C7NUBwFlEN0=;
        b=LRbtAcGu+iIDHOSJxA1Bl1LRZpQwh/GKxKs5DYwhMxmbKwOa9MTZSb4JimKkXGqh56
         xivUS2+SspTXjQIhYKD72Xyttbkr1WuvZFJUGQGnQGKiUFqNKKJlWupW8kTelNTPGl9k
         DqnYg5Irhckl5W6+402d84PjmQkpztfWgHU1A3J5pfae3Nzt59EySeL2SgdoSVCcz+Cq
         e5NIXuXNJmZoBVRs3BF+u9qV9plcbTUQbOF9+MvNGH7vqFJI6krqZThCIqiZ4U1vQdIC
         +l3WO5q/HNfB9r9FoWwbAjhEJmrC5941cEyyUXUJVLOQVD4afs+2grL09xtqYU6WpUPp
         e0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778655780; x=1779260580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaH9g17uem0QR3nAcOAHHOsv86hTEnX1C7NUBwFlEN0=;
        b=SOX15yyNKBGs9HDUXXE4tlWezSrRxwZQd/zg847lxBg7Fe5tiCkid+pACIQg+nGp1U
         +S7YwXXFMuE+iycqKKPl+OfmIuiqziVZLlKtBW6t53qaXto3wLYfNjFchn1JWClVySbj
         8aAiz91g0gjV4ynAXMzaZU3ITh8AYLJSCn52a8Z5twUQ4FmT53iP0v+/77fLHWTh2S5j
         cKDLZKnGb7m39Q/AO9nQ+b5dKYdtlS7T8/EH+LBLcK1i1G+mUf3bimUwINcbZUXPufrj
         kIgaJiQKJWcoBbjqnkfcHXlpF314EdZ/bMkwTCDLsucxpgUxt80jkRGN0fo04/qO/QdM
         atzg==
X-Gm-Message-State: AOJu0YzB8ylV2cMaCW/qR9LvP6Tj5zNrPC0DUHwG1Wscx2mxfoAjfFf/
	+53XqobEmKHVDAN+9+7lbGbFusvHB2/gLBhtudTIk9J3u5c4Fhd1Cmw=
X-Gm-Gg: Acq92OFkp7I2M+XTzD9tCIt81bZec5LcbjsxblQqs0av6n/Jr3zhWLcMWaXP6j8Zgqg
	CgKJb85Q4+JK2qntU1vQdxy4nGcJvH7Dlfg+UmQ3TKsXxjtsBE4KMPR+ezCCdd8eLdc8aVzUBJE
	gPYVS4FYCdiN/1zy2QB1gpagTwqJYCRXvHcrunSFjYKOXHNpj3OzWqrBunF8w9pj/xj/zhZ9DJ6
	RykTOvvjvtAFkttYlScJfA91u1x2i8n0nfY5Zf2WIFsRrJ6GSt+PsSJwaBj/wHSAwMT2JaCDT3j
	Uq05ffO7deD6ZU4IHEh1R8XBZMAz505GozMwbUOcPXj2/Eb4rYR0+5NEjnxtT8WYBDMD+YBYAFg
	0D9IzroOLwqya0lbqj1v4582C8h9jYAng1uvi86gp112SL0fb5mnDzM6oU7RCVCOA1aqPL6O2p7
	JT8VNg2n4UAa0HJxMCp+KRuhn8Qrn15/wkwdsZRCITN5giVrS9ChQ85EyHVQ6ZbVVsE6mjnpcmV
	0wIOFW5FRB356gcrd5/+siLa7j+hGaydOQZpus=
X-Received: by 2002:a05:6a00:4615:b0:83d:c0dd:62ef with SMTP id d2e1a72fcca58-83f042d4afdmr2101496b3a.45.1778655779889;
        Wed, 13 May 2026 00:02:59 -0700 (PDT)
Received: from localhost.localdomain ([211.198.234.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbdfb0sm24906420b3a.45.2026.05.13.00.02.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 May 2026 00:02:59 -0700 (PDT)
From: "=?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?=" <mhun512@gmail.com>
X-Google-Original-From: =?UTF-8?q?=EB=B0=95=EB=AA=85=ED=9B=88?= <pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Myeonghun Pak <mhun512@gmail.com>
Subject: [PATCH] media: radio-si476x: Unregister v4l2_device on probe failure
Date: Wed, 13 May 2026 16:02:37 +0900
Message-ID: <20260513070254.29870-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2A91A52E661
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61331-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bagmyeonghun-ui-MacBookPro.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Myeonghun Pak <mhun512@gmail.com>

si476x_radio_probe() registers radio->v4l2dev before allocating the V4L2
controls and before registering the video device. If any of those later
steps fails, probe returns through the exit label after freeing only the
control handler.

A failed probe does not call si476x_radio_remove(), so the
v4l2_device_unregister() there is not reached. This leaves the parent
device reference taken by v4l2_device_register() behind on the error path.

Unregister the V4L2 device in the probe error path after freeing the
controls.

Fixes: b879a9c2a755 ("[media] v4l2: Add a V4L2 driver for SI476X MFD")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/radio/radio-si476x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/radio/radio-si476x.c b/drivers/media/radio/radio-si476x.c
index 9980346cb5..bfe89782dc 100644
--- a/drivers/media/radio/radio-si476x.c
+++ b/drivers/media/radio/radio-si476x.c
@@ -1493,6 +1493,7 @@ static int si476x_radio_probe(struct platform_device *pdev)
 	return 0;
 exit:
 	v4l2_ctrl_handler_free(radio->videodev.ctrl_handler);
+	v4l2_device_unregister(&radio->v4l2dev);
 	return rval;
 }
 
-- 
2.39.5


