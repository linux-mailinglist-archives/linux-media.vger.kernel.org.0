Return-Path: <linux-media+bounces-41463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C1B3EB4E
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16FF316AB12
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 15:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39071F3B98;
	Mon,  1 Sep 2025 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="Ms48I5P+"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F8C32F772;
	Mon,  1 Sep 2025 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741431; cv=none; b=Jyr0h9TgShOYjx177AUs+wwkd09l1kwdDrjkRB7Oflih0kj1kZmD+tUQvMroRqiZlLLqWlrZ9cCFDF/g60EIl2+fXFV87GO3JAEGmyN2UPYYQ97+CwJyJzQ0IPG9m88TSUJEcsPerzoeXIj4VaDQTSYIZ6tV4QDlug5SBuqBUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741431; c=relaxed/simple;
	bh=inglLfU5gjsaZCpx+FkdLCa8PO3vi3J62HKV+6JkDAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odCRAUnAffDv/7abAq5ifGKpit3VIKXCEBNMFJKYn38gT4hvtPJoNdPG72uen9EtYEP2kvxjlwJZRGnWRIAnaNuiVbdnQSFu9ZyXymeYXO/vqG0OLYRJNr3usjbg9aaZ2YQ8IeprfVX489vXUAsLPrh3sgsHLExkPDEgcxzcItU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=Ms48I5P+; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ywncx89NF7pFbZJ1GzTfJ9q/DxkEWttcK9TGbAeufeA=; b=Ms48I5P+r9Oa7LE4AIKdyg+6HF
	DFWTI2HA3sC4nTjqHl6PPXwAcRhipRjcYNGcBj5BU21MITR5IVaY0/ZDT75N/B0FJn9u7h9ZW2pFT
	waDRgVdUZpSixLM58f1Kwi/QMiLOU6SOhoiZSharq4iJ7CuglPiAcEnJot2M/Y61Swc8=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:61156 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1ut6E3-009YyN-Mb; Mon, 01 Sep 2025 17:13:44 +0200
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 01 Sep 2025 17:13:37 +0200
Subject: [PATCH 2/3] media: allegro: process all pending status mbox
 messages
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-allegro-dvt-fixes-v1-2-4e4d493836ef@emfend.at>
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
 
 Content preview:  This message can be helpful for troubleshooting and there
   is already a corresponding message in case of a channel destroy timeout. Add
    a similar message for channel creation. Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
    --- drivers/media/platform/allegro-dvt/allegro-core.c | 8 +++++++- 1 file
    changed, 7 insertions(+), 1 deletion(-) 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 Local_hs1_NotHoststar  Sender is not from hoststar.ch|de|com
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment

Under certain circumstances, not every message written by the MCU to the
status mailbox may trigger a corresponding interrupt. This is likely when
multiple messages are generated in a very short period of time. Since the
current implementation only processes one message per interrupt, even if
multiple messages are already available in the mailbox, expected messages
are either not received or are processed late. This leads to various
subsequent problems and causes the driver to no longer function properly.

The behavior has been adjusted so that after an interrupt, all messages
available in the mailbox are processed.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 42 ++++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 4c5c2a7fe5426aa81ba341aba046ef166c51f664..d3aea46b7d1d9854307d61d2f1647eaa340d504d 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -828,6 +828,20 @@ static int allegro_mbox_write(struct allegro_mbox *mbox,
 	return err;
 }
 
+static unsigned int allegro_mbox_get_available(struct allegro_mbox *mbox)
+{
+	struct regmap *sram = mbox->dev->sram;
+	unsigned int head, tail;
+
+	regmap_read(sram, mbox->head, &head);
+	regmap_read(sram, mbox->tail, &tail);
+
+	if (tail >= head)
+		return tail - head;
+	else
+		return mbox->size - (head - tail);
+}
+
 static ssize_t allegro_mbox_read(struct allegro_mbox *mbox,
 				 u32 *dst, size_t nbyte)
 {
@@ -836,11 +850,15 @@ static ssize_t allegro_mbox_read(struct allegro_mbox *mbox,
 		u16 type;
 	} __attribute__ ((__packed__)) *header;
 	struct regmap *sram = mbox->dev->sram;
-	unsigned int head;
+	unsigned int available, head;
 	ssize_t size;
 	size_t body_no_wrap;
 	int stride = regmap_get_reg_stride(sram);
 
+	available = allegro_mbox_get_available(mbox);
+	if (available < sizeof(*header))
+		return -EAGAIN;
+
 	regmap_read(sram, mbox->head, &head);
 	if (head > mbox->size)
 		return -EIO;
@@ -854,6 +872,8 @@ static ssize_t allegro_mbox_read(struct allegro_mbox *mbox,
 		return -EIO;
 	if (size > nbyte)
 		return -EINVAL;
+	if (size > available)
+		return -EAGAIN;
 
 	/*
 	 * The message might wrap within the mailbox. If the message does not
@@ -913,26 +933,27 @@ static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
  * allegro_mbox_notify() - Notify the mailbox about a new message
  * @mbox: The allegro_mbox to notify
  */
-static void allegro_mbox_notify(struct allegro_mbox *mbox)
+static int allegro_mbox_notify(struct allegro_mbox *mbox)
 {
 	struct allegro_dev *dev = mbox->dev;
 	union mcu_msg_response *msg;
-	ssize_t size;
 	u32 *tmp;
 	int err;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
 	if (!msg)
-		return;
+		return -ENOMEM;
 
 	msg->header.version = dev->fw_info->mailbox_version;
 
 	tmp = kmalloc(mbox->size, GFP_KERNEL);
-	if (!tmp)
+	if (!tmp) {
+		err = -ENOMEM;
 		goto out;
+	}
 
-	size = allegro_mbox_read(mbox, tmp, mbox->size);
-	if (size < 0)
+	err = allegro_mbox_read(mbox, tmp, mbox->size);
+	if (err < 0)
 		goto out;
 
 	err = allegro_decode_mail(msg, tmp);
@@ -944,6 +965,8 @@ static void allegro_mbox_notify(struct allegro_mbox *mbox)
 out:
 	kfree(tmp);
 	kfree(msg);
+
+	return err;
 }
 
 static int allegro_encoder_buffer_init(struct allegro_dev *dev,
@@ -2326,7 +2349,10 @@ static irqreturn_t allegro_irq_thread(int irq, void *data)
 	if (!dev->mbox_status)
 		return IRQ_NONE;
 
-	allegro_mbox_notify(dev->mbox_status);
+	while (allegro_mbox_get_available(dev->mbox_status) > 0) {
+		if (allegro_mbox_notify(dev->mbox_status))
+			break;
+	}
 
 	return IRQ_HANDLED;
 }

-- 
2.25.1


