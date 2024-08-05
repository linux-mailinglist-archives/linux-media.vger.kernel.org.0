Return-Path: <linux-media+bounces-15809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC733948512
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 23:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F98DB21F25
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 21:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678CC16F8EB;
	Mon,  5 Aug 2024 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OJZSgzvK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162416F27C
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894701; cv=none; b=Fh6F94fpug/uL1I7aKrDPyDUzhNipQsRSl6cG+w98d9451Rz+64T4APSJoFiG8afCkdQFRswkq5y/8kOqXSrn85stB7cjZFSC6UZq7bQK430zwPngzeNNMAL8KqcxXutaY1C2HEVrPeAVY2/M1bQu5aHdL248i00ojKzsj0/WaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894701; c=relaxed/simple;
	bh=n3lVtU3TsJ9RgnXcF9k2JvkgGtZTXwHab5x3eepwbQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phFXJBud6Fs1BQQQgAKgDfJtd/hFhXLpNAVjVSqWaa1QitIDQzMIP06IK8aA54l96kJEC8+iee9LYDFpaCFZQU/l1lSo24Zo3NvcxHARazd1ejLrLR4wvdpPWyGfhVmQAI+3/1U6MpqwSQig/YEM5uhAEYiFtdv0yDABKVTSYf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OJZSgzvK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=E/3ioNezHUDYgNs61qqfnlIbtvEYJa+0YJNcsKODcPM=; b=OJZSgz
	vKGmNkLvQELOXXXhUimvOutMQyI6wSlDp5wE1qbovJvDTTkKGdX1TrX4bEWd0VbM
	EVORFF5WQuNJFZtExVd29jNSbsT3sNEg4PpPH21ioPusvQaJcwHFlfSmSREupXW5
	4eEbiNFWgowg16uMt/vTKZxU/bad/TJxbyN32EW7y8sclIqq/VuKy5IdrdDRpgei
	+BNZiQw50V0O6hTA4oMNWpNiMFbMQea7h7neH+PvNQwr3y8NglM6C7dudsinZtcr
	Q3bxccwtsSkg6hVVWgZsSPEavdCZFnrMpeXiVmFuh6YiNTWwd/EUw8a4fZBHmka1
	Y0MeE/gSPE3ZQXww==
Received: (qmail 18235 invoked from network); 5 Aug 2024 23:51:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:30 +0200
X-UD-Smtp-Session: l3s3148p1@6a8FrvYe9ppehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 6/8] media: solo6x10: use 'time_left' variable with wait_for_completion_timeout()
Date: Mon,  5 Aug 2024 23:51:19 +0200
Message-ID: <20240805215123.3528-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
References: <20240805215123.3528-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named
'timeout' to store the result of wait_for_completion_timeout() causing
patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the
code self explaining.

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Ismael Luceno <ismael@iodev.co.uk>
---

Change since v1: added tag

 drivers/media/pci/solo6x10/solo6x10-p2m.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-p2m.c b/drivers/media/pci/solo6x10/solo6x10-p2m.c
index ca70a864a3ef..5f100e5e03d9 100644
--- a/drivers/media/pci/solo6x10/solo6x10-p2m.c
+++ b/drivers/media/pci/solo6x10/solo6x10-p2m.c
@@ -57,7 +57,7 @@ int solo_p2m_dma_desc(struct solo_dev *solo_dev,
 		      int desc_cnt)
 {
 	struct solo_p2m_dev *p2m_dev;
-	unsigned int timeout;
+	unsigned long time_left;
 	unsigned int config = 0;
 	int ret = 0;
 	unsigned int p2m_id = 0;
@@ -99,12 +99,12 @@ int solo_p2m_dma_desc(struct solo_dev *solo_dev,
 			       desc[1].ctrl);
 	}
 
-	timeout = wait_for_completion_timeout(&p2m_dev->completion,
-					      solo_dev->p2m_jiffies);
+	time_left = wait_for_completion_timeout(&p2m_dev->completion,
+						solo_dev->p2m_jiffies);
 
 	if (WARN_ON_ONCE(p2m_dev->error))
 		ret = -EIO;
-	else if (timeout == 0) {
+	else if (time_left == 0) {
 		solo_dev->p2m_timeouts++;
 		ret = -EAGAIN;
 	}
-- 
2.43.0


