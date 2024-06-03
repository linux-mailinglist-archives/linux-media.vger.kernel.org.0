Return-Path: <linux-media+bounces-12440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3EB8D7E83
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DB5C1C21486
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304F182496;
	Mon,  3 Jun 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T070ACYu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9547E777
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406931; cv=none; b=vF7YoOvvycmB478QKRrKE6uy8/nAkm3G3Jvm4jkEyoeyXrTaMau2TmlJrxXqz4ue3TKBDZPF7PL7GWEz+lqcjsmICQpjC2RmgSBQ/iLS8eSjl37mR4KlMwCZViliXUjb6vEoyj2BW94mANM+Qu9XA9F1VlCmgCfzZrRdtdjmpvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406931; c=relaxed/simple;
	bh=x9r0dvx+56ChurBzQtcPwM6yk15IGheGZCWCnh6mNHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7uvIgVRfFd/bVd+w3aQ1NOixJ4CA1XDCVniOMv+scPA6C73rcbgKCE2cz68zfxvdVpJymPlEXcOdFpVIbj4rOywpOYQSD+lYbrmHaLhLrEhf0kOmlPLY9EtMLb8Uj7CB1ctIL9T7S5+kj7RuxDNVuholX93xFIBODrf6N76/9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T070ACYu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=iFHQTiqeEFBKGd3rXHXp+vfm+qP+/anhPmfCS1jdQd0=; b=T070AC
	Yufs91XsFUkr/ELMMEqHsbPILzNjkR7rWGeS6jHFW4J7rl+9RbDnsxxuH8uGxbtC
	ogmYFstDR8L4X7Sy5UWLlEUtBRChLRqeqOa5ent6sg/tX2bKV3PztASsPY7wiDYC
	Z13IVD81ZU9dYRl8a3XS3S9/mJr2ty2UF0nqt6TWrkOeE1AduhRMFH1DcRgdgKhK
	r09nPqP7eV62Q9NzevD4OzPPGLxT2M/5ljWjCxTJqel0cZknO0gFPVbjmozH7EPP
	bhFJ8nBbeWjiZi1/iKO9uJheZKSevpsJhrDkVYtNNkHDGHafRnkafnJFZIzshKhb
	L215QOyW1KOQk7Zw==
Received: (qmail 1903109 invoked from network); 3 Jun 2024 11:28:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:28:47 +0200
X-UD-Smtp-Session: l3s3148p1@nYzW9fgZIpEgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/8] media: allegro: use 'time_left' variable with wait_for_completion_timeout()
Date: Mon,  3 Jun 2024 11:28:32 +0200
Message-ID: <20240603092841.9500-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
References: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../media/platform/allegro-dvt/allegro-core.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index da61f9beb6b4..4016aef5fdb9 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
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


