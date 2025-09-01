Return-Path: <linux-media+bounces-41464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C90B3EB66
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7FF0189D69A
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632AF2D5937;
	Mon,  1 Sep 2025 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="lE5xbrB2"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251F419CC37;
	Mon,  1 Sep 2025 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741436; cv=none; b=ijcPdSRZj63qev5OlgLSWIbrdJ55QgFRUJlEdtkzal0d4OULCRgtRjxR+i9dy0nTutofH1lWhLNhKRGCMReZBPXWBtOMW85oD7z+UVzapejpxuijmHcYIbEmZ59AS4JkNUpISgCJHolvSDyZBpLj0K+PNbSZLatquG8zFA+jH3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741436; c=relaxed/simple;
	bh=am4bL3m9AU3nNCPWaO6cdfHt55wwlOiuU308mgqRkQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNTMoWBilnFMk6oiaCCEsP763G86Fo3RHjT1k8+qtnk1QvMH4EE1lgMsrTeUIL4CjKFvkKspKLXaxdkUClxmoaPSEdMQJa+Ue2zkOQYnOxzGoiaCa9KwgD1lNpXC/Va0bjZYSn4nk6ZYsdGj05+ZFVF221OQzvU7BLxW6gHlzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=lE5xbrB2; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wzd0Xe2NufD57luvKvcTjx6X7hryM1+600ih+eNfwKA=; b=lE5xbrB2FQFeNfasHfBCjFAi1B
	J3n+QDAzSIPOGNCHmxx8ENwSWmkPCvP2IZSjwBukeS9MofF+OvYEV62QeLwA9fbj/NNuHhLDDCDXw
	sHyGHY0n+Wa6tgwhztjodbluKura3BddKtduJzsqc6NC59bT/C3N61i1dSXGKm3R0ucU=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:61156 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1ut6E4-009YyN-Kz; Mon, 01 Sep 2025 17:13:45 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 01 Sep 2025 17:13:38 +0200
Subject: [PATCH 3/3] media: allegro: fix race conditions in channel
 handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-allegro-dvt-fixes-v1-3-4e4d493836ef@emfend.at>
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
 
 Content preview:  Under certain circumstances, not every message written by
   the MCU to the status mailbox may trigger a corresponding interrupt. This
   is likely when multiple messages are generated in a very short perio [...]
    
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 Local_hs1_NotHoststar  Sender is not from hoststar.ch|de|com
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

Since the channel list is used in different contexts, it must be ensured
that it is always consistent. Also, the channels contained in the list may
only be released when they are no longer needed in any context.

Add a lock to protect the list and reference handling for the channels.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 64 ++++++++++++++++++-----
 1 file changed, 50 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index d3aea46b7d1d9854307d61d2f1647eaa340d504d..adcaa4f877df1c58807d62ddf3eb21848fb08520 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -177,6 +177,7 @@ struct allegro_dev {
 	 */
 	unsigned long channel_user_ids;
 	struct list_head channels;
+	struct mutex channels_lock;
 };
 
 static const struct regmap_config allegro_regmap_config = {
@@ -200,6 +201,7 @@ static const struct regmap_config allegro_sram_config = {
 #define fh_to_channel(__fh) container_of(__fh, struct allegro_channel, fh)
 
 struct allegro_channel {
+	struct kref ref;
 	struct allegro_dev *dev;
 	struct v4l2_fh fh;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -427,33 +429,55 @@ static unsigned long allegro_next_user_id(struct allegro_dev *dev)
 }
 
 static struct allegro_channel *
-allegro_find_channel_by_user_id(struct allegro_dev *dev,
-				unsigned int user_id)
+allegro_ref_get_channel_by_user_id(struct allegro_dev *dev,
+				   unsigned int user_id)
 {
 	struct allegro_channel *channel;
 
+	guard(mutex)(&dev->channels_lock);
+
 	list_for_each_entry(channel, &dev->channels, list) {
-		if (channel->user_id == user_id)
-			return channel;
+		if (channel->user_id == user_id) {
+			if (kref_get_unless_zero(&channel->ref))
+				return channel;
+			break;
+		}
 	}
 
 	return ERR_PTR(-EINVAL);
 }
 
 static struct allegro_channel *
-allegro_find_channel_by_channel_id(struct allegro_dev *dev,
-				   unsigned int channel_id)
+allegro_ref_get_channel_by_channel_id(struct allegro_dev *dev,
+				      unsigned int channel_id)
 {
 	struct allegro_channel *channel;
 
+	guard(mutex)(&dev->channels_lock);
+
 	list_for_each_entry(channel, &dev->channels, list) {
-		if (channel->mcu_channel_id == channel_id)
-			return channel;
+		if (channel->mcu_channel_id == channel_id) {
+			if (kref_get_unless_zero(&channel->ref))
+				return channel;
+			break;
+		}
 	}
 
 	return ERR_PTR(-EINVAL);
 }
 
+static void allegro_free_channel(struct kref *ref)
+{
+	struct allegro_channel *channel = container_of(ref, struct allegro_channel, ref);
+
+	kfree(channel);
+}
+
+static int allegro_ref_put_channel(struct allegro_channel *channel)
+{
+	return kref_put(&channel->ref, allegro_free_channel);
+}
+
 static inline bool channel_exists(struct allegro_channel *channel)
 {
 	return channel->mcu_channel_id != -1;
@@ -2183,7 +2207,7 @@ allegro_handle_create_channel(struct allegro_dev *dev,
 	int err = 0;
 	struct create_channel_param param;
 
-	channel = allegro_find_channel_by_user_id(dev, msg->user_id);
+	channel = allegro_ref_get_channel_by_user_id(dev, msg->user_id);
 	if (IS_ERR(channel)) {
 		v4l2_warn(&dev->v4l2_dev,
 			  "received %s for unknown user %d\n",
@@ -2250,6 +2274,7 @@ allegro_handle_create_channel(struct allegro_dev *dev,
 out:
 	channel->error = err;
 	complete(&channel->completion);
+	allegro_ref_put_channel(channel);
 
 	/* Handled successfully, error is passed via channel->error */
 	return 0;
@@ -2261,7 +2286,7 @@ allegro_handle_destroy_channel(struct allegro_dev *dev,
 {
 	struct allegro_channel *channel;
 
-	channel = allegro_find_channel_by_channel_id(dev, msg->channel_id);
+	channel = allegro_ref_get_channel_by_channel_id(dev, msg->channel_id);
 	if (IS_ERR(channel)) {
 		v4l2_err(&dev->v4l2_dev,
 			 "received %s for unknown channel %d\n",
@@ -2274,6 +2299,7 @@ allegro_handle_destroy_channel(struct allegro_dev *dev,
 		 "user %d: vcu destroyed channel %d\n",
 		 channel->user_id, channel->mcu_channel_id);
 	complete(&channel->completion);
+	allegro_ref_put_channel(channel);
 
 	return 0;
 }
@@ -2284,7 +2310,7 @@ allegro_handle_encode_frame(struct allegro_dev *dev,
 {
 	struct allegro_channel *channel;
 
-	channel = allegro_find_channel_by_channel_id(dev, msg->channel_id);
+	channel = allegro_ref_get_channel_by_channel_id(dev, msg->channel_id);
 	if (IS_ERR(channel)) {
 		v4l2_err(&dev->v4l2_dev,
 			 "received %s for unknown channel %d\n",
@@ -2294,6 +2320,7 @@ allegro_handle_encode_frame(struct allegro_dev *dev,
 	}
 
 	allegro_channel_finish_frame(channel, msg);
+	allegro_ref_put_channel(channel);
 
 	return 0;
 }
@@ -3079,6 +3106,8 @@ static int allegro_open(struct file *file)
 	if (!channel)
 		return -ENOMEM;
 
+	kref_init(&channel->ref);
+
 	v4l2_fh_init(&channel->fh, vdev);
 
 	init_completion(&channel->completion);
@@ -3245,7 +3274,10 @@ static int allegro_open(struct file *file)
 		goto error;
 	}
 
-	list_add(&channel->list, &dev->channels);
+	scoped_guard(mutex, &dev->channels_lock) {
+		list_add(&channel->list, &dev->channels);
+	}
+
 	file->private_data = &channel->fh;
 	v4l2_fh_add(&channel->fh);
 
@@ -3262,17 +3294,20 @@ static int allegro_open(struct file *file)
 static int allegro_release(struct file *file)
 {
 	struct allegro_channel *channel = fh_to_channel(file->private_data);
+	struct allegro_dev *dev = channel->dev;
 
 	v4l2_m2m_ctx_release(channel->fh.m2m_ctx);
 
-	list_del(&channel->list);
+	scoped_guard(mutex, &dev->channels_lock) {
+		list_del(&channel->list);
+	}
 
 	v4l2_ctrl_handler_free(&channel->ctrl_handler);
 
 	v4l2_fh_del(&channel->fh);
 	v4l2_fh_exit(&channel->fh);
 
-	kfree(channel);
+	allegro_ref_put_channel(channel);
 
 	return 0;
 }
@@ -3867,6 +3902,7 @@ static int allegro_probe(struct platform_device *pdev)
 	dev->plat_dev = pdev;
 	init_completion(&dev->init_complete);
 	INIT_LIST_HEAD(&dev->channels);
+	mutex_init(&dev->channels_lock);
 
 	mutex_init(&dev->lock);
 

-- 
2.25.1


