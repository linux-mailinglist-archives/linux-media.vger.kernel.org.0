Return-Path: <linux-media+bounces-15803-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CF948508
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 23:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DA12837D8
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 21:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728AE16E877;
	Mon,  5 Aug 2024 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DHLVoPAo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400A815CD7D
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 21:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722894697; cv=none; b=mdCTHputwMBhSv5p9i/k88UDSj2rt1t/gfkGr5FlRUtKE1DVqFD5LyB6MM6ty6XNo6gjJdGfkfd1VgaCBNL6zji/+/lNCfNEyL8y7JfZAkMPAaW4skSSA4tDgRDS7+duVCZ71tMafos85rQE1GZqhOMYi+w8IZvgaXYWH1XieDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722894697; c=relaxed/simple;
	bh=1BuPzu8VD/zUyF4FZmBltGkSc6FmT/9fdSLZIAgjdl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8owbPB9A9aoRsSdxWUUEPVfmpbH6oEe4gLShUAaJf3/q5XDGSSxTnBmQ/BKhCgSIL1EqoDgvCNMmuCno4aOQE0Faamd2XUpFDaOkDxxUon8xd3jcLuB+bC3GZCgiBmcP+I6eFwSJyIAnS3DcBFxgHrEfA/rI6tRkPu5N2VIez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DHLVoPAo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SrhVEbjx9gkbi4ohYgYEDx9IsxwINCJckP5iaY5Xll4=; b=DHLVoP
	Ao2rhyJ15b5Sip306Yq37wUfChPR9bsoMSPb44bjw82jGOl6yPHuxvADPGe3DPMo
	DykYEcjWLeqcvJQJCsIc5FW4ljDu3VnvN7t1Li5TGTN71RR29h6mV4kTYRzs+c2d
	nUE2SKPy5SO+KtXOyOf9YWzILYr+ywHpIRkFHXkT8UmayTXAjhvKnhhV53VOo5oi
	pnkU6B0k7p+938Dh7MaR1KdUFllAR8N2xCsglqOWiybPY4YpJlOe4mwuz2fDcGLm
	Pdn6wl0ATgz+hkxivl5zfbpn1ogdJRg7dOkN8ePPBET0lGGdFZBWGjDvgFG42JHo
	hZPRAzKcSP/ru80g==
Received: (qmail 18099 invoked from network); 5 Aug 2024 23:51:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2024 23:51:26 +0200
X-UD-Smtp-Session: l3s3148p1@/iXBrfYe5JRehhYC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-media@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 1/8] media: allegro: use 'time_left' variable with wait_for_completion_timeout()
Date: Mon,  5 Aug 2024 23:51:14 +0200
Message-ID: <20240805215123.3528-2-wsa+renesas@sang-engineering.com>
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
code self explaining, also for the code path using 'tmo' as a variable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* fixed the 'tmo' variable as well

 .../media/platform/allegro-dvt/allegro-core.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index da61f9beb6b4..0142ba175198 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1415,11 +1415,11 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 static int allegro_mcu_wait_for_init_timeout(struct allegro_dev *dev,
 					     unsigned long timeout_ms)
 {
-	unsigned long tmo;
+	unsigned long time_left;
 
-	tmo = wait_for_completion_timeout(&dev->init_complete,
-					  msecs_to_jiffies(timeout_ms));
-	if (tmo == 0)
+	time_left = wait_for_completion_timeout(&dev->init_complete,
+						msecs_to_jiffies(timeout_ms));
+	if (time_left == 0)
 		return -ETIMEDOUT;
 
 	reinit_completion(&dev->init_complete);
@@ -2481,14 +2481,14 @@ static void allegro_mcu_interrupt(struct allegro_dev *dev)
 static void allegro_destroy_channel(struct allegro_channel *channel)
 {
 	struct allegro_dev *dev = channel->dev;
-	unsigned long timeout;
+	unsigned long time_left;
 
 	if (channel_exists(channel)) {
 		reinit_completion(&channel->completion);
 		allegro_mcu_send_destroy_channel(dev, channel);
-		timeout = wait_for_completion_timeout(&channel->completion,
-						      msecs_to_jiffies(5000));
-		if (timeout == 0)
+		time_left = wait_for_completion_timeout(&channel->completion,
+							msecs_to_jiffies(5000));
+		if (time_left == 0)
 			v4l2_warn(&dev->v4l2_dev,
 				  "channel %d: timeout while destroying\n",
 				  channel->mcu_channel_id);
@@ -2544,7 +2544,7 @@ static void allegro_destroy_channel(struct allegro_channel *channel)
 static int allegro_create_channel(struct allegro_channel *channel)
 {
 	struct allegro_dev *dev = channel->dev;
-	unsigned long timeout;
+	unsigned long time_left;
 
 	if (channel_exists(channel)) {
 		v4l2_warn(&dev->v4l2_dev,
@@ -2595,9 +2595,9 @@ static int allegro_create_channel(struct allegro_channel *channel)
 
 	reinit_completion(&channel->completion);
 	allegro_mcu_send_create_channel(dev, channel);
-	timeout = wait_for_completion_timeout(&channel->completion,
-					      msecs_to_jiffies(5000));
-	if (timeout == 0)
+	time_left = wait_for_completion_timeout(&channel->completion,
+						msecs_to_jiffies(5000));
+	if (time_left == 0)
 		channel->error = -ETIMEDOUT;
 	if (channel->error)
 		goto err;
-- 
2.43.0


