Return-Path: <linux-media+bounces-41461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE53B3EB3F
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43CF72C0E62
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F572EC081;
	Mon,  1 Sep 2025 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="nE+8j4aU"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDB22E6CC5;
	Mon,  1 Sep 2025 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741156; cv=none; b=B2nZeB9t1qyRxgIX5aJ3bvc6FP6T/xbSJg3VCj2ny1LR09bs2rScKGcs39b5kKkzSDnQflyXQGoPEdQ8U2RSChZpIKsaxuhZ3OYUsyn2LcCtL69fsnac1Hww33o9jZv7TdVlGSH1fZgWTl5d0yelNJXqVM2bnoZJHM/rOjp3tfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741156; c=relaxed/simple;
	bh=pzCAYpcZ6TRuPnvynWB0NnbgVoLcpBe58CdI+qoi7L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVDQZLB593epD1Mb29ff4GqjZBG0AbIvZr+o3i+AtqT4c1J8jNS1qSFoZoaBIaAItgzamt22glwLPC8Tpeh0vNk0qMbE6CZeZUbSt6M1SwXnegAqqtTIemBmydis9ny3AnIpcb4QoaTW3bGqvjP1UdXkBmhiXEPnqg+BHKWZYC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=nE+8j4aU; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lAEGMtMrINsBBz6MI0IX+Lwhx6wj87W77gHBsxw581A=; b=nE+8j4aUzAse7w9JricNCKIZpX
	DT1grMqUsWWx3jPTq+H9cEqEOdSetK+8m1Y89w9IoTmaFvch+YOhVueqcW1bDhAaFWOQ6hhAa61mB
	iMqDlgQ8xdKnhzEdR9Wds+sTiNXPCvajxh+h2BWeDVrmyIapGdur5RiAVsKVHy7/7+O8=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:61156 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1ut6E3-009YyN-3e; Mon, 01 Sep 2025 17:13:43 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 01 Sep 2025 17:13:36 +0200
Subject: [PATCH 1/3] media: allegro: print warning if channel creation
 timeout occurs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-allegro-dvt-fixes-v1-1-4e4d493836ef@emfend.at>
References: <20250901-allegro-dvt-fixes-v1-0-4e4d493836ef@emfend.at>
In-Reply-To: <20250901-allegro-dvt-fixes-v1-0-4e4d493836ef@emfend.at>
To: Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Several fixes and improvements for the Allegro DVT video IP
    encoder. These relate to race conditions that occur when multiple streams
    are used simultaneously. The problems could be reproduced on a ZCU [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 Local_hs1_NotHoststar  Sender is not from hoststar.ch|de|com
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

This message can be helpful for troubleshooting and there is already a
corresponding message in case of a channel destroy timeout.
Add a similar message for channel creation.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index eb03df0d8652745ef533b9b7aa6c105a140ad022..4c5c2a7fe5426aa81ba341aba046ef166c51f664 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -2599,8 +2599,14 @@ static int allegro_create_channel(struct allegro_channel *channel)
 	allegro_mcu_send_create_channel(dev, channel);
 	time_left = wait_for_completion_timeout(&channel->completion,
 						msecs_to_jiffies(5000));
-	if (time_left == 0)
+	if (time_left == 0) {
+		v4l2_warn(&dev->v4l2_dev,
+			  "user %d: timeout while creating channel\n",
+			  channel->user_id);
+
 		channel->error = -ETIMEDOUT;
+	}
+
 	if (channel->error)
 		goto err;
 

-- 
2.25.1


