Return-Path: <linux-media+bounces-21790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3716F9D5B28
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C7CA283255
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA6D18C913;
	Fri, 22 Nov 2024 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="W1yWkMS0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com [209.85.128.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13018787D
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264927; cv=none; b=e0pNnr/zECKokTVTUb94Hcr4hitxL/LZvetRPdlnBSh8WIIyrwsWg5fCmi9+M+nWiZkhmTYOQ/Yt8tShU9zLemzEZPRKuEtQ6Wb/e8TgR51038xdH1nZYMTTMpSSSAVOLm2U+0Pfaj8YMqqG6AZtRtQemaOC8KXUC/dSgoCSylw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264927; c=relaxed/simple;
	bh=sP+4letafPvxfukJYV0UOYRRFVIebSXD/aQphVIz7qY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vq6gLg7CNc/bJrZ+/j5/jo/BOamAG48JIWVxMiTD61OlzlmfyoMnNbV/SqX1QsNuVoli5orqzQwHxxwwyc0nPIsp1uX4rlo9zIzRMQ+Qw8Sj38TRZGnHF47rV2PJPMk/8akkuyDwBDgCL8YxijPHBG9wfN+anstsyddMDb/BJUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=W1yWkMS0; arc=none smtp.client-ip=209.85.128.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f99.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso16847425e9.0
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 00:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732264924; x=1732869724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su6tsEJry4BzuFP65MpXpBH51+aHQ+dE9vL6DxTxUwA=;
        b=W1yWkMS0SYWzQ3zoKcv8xeYylwxBCCcQ84wuqbjQXHN5S77VQj8YbvVze7OCqOwrhj
         WRuhrjreTn0/oh+2t8DzuqNR2RjovzsYUdxFVF2ivjeezmSCp0DxK5PqMicoWAyecVtd
         6RI3GfpJtkg3OSLmSdwgkdfEjMNaEigDx7gDBQCvWHJoUrEF4XY6vNroke2WC8y51dhq
         xxXPHb+RvgykV3IOwMmapN0u3aQe11Nyhhp+bol7BybuHdhwpAqrIGKqd/QSQUaxpLPm
         gSwRFoZDvwq98ZV7MPM6MGr1xHeGK2dwj6At+m5u0YIhMsHnABG9bQOeIP1+BjgrIXPt
         51NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732264924; x=1732869724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su6tsEJry4BzuFP65MpXpBH51+aHQ+dE9vL6DxTxUwA=;
        b=fFmyj8IccLpajGUEy8gjgV0Q+uBQs69qxRKWKZRAs0Wm7CFyGmG4D0PqlUX9wUe1sy
         q54dCKUYG/8j2mi13I1Ii/ZBHkhxALQSkMiW8OcO0Gx9nQ2T1W2nlmLlnabWnriaLx2j
         7WI7AaXGKMAo7FQDs48eUKi/tiP7xH+4fY1b6Ptvg3tl8isGCcbgDtzlgXdDS0tsiAFp
         D97f4nUOGxwSZ9T/13w2qUTvgCrUbZ+oFdooUEg/92S/yj51Fyu4QJtdNzX4YQNfDLQg
         b7ugxEJQ7Owx8NEAxTQtj7luPuPOVsxPu3xyCPBY5sSLyIjKVBYON9E+mUNn2IzX7AD6
         f4zg==
X-Gm-Message-State: AOJu0Yxjs+DwdtaZqzFVq+Ogw80rG1CZE7KXlPJCeH8yS8Qd+xRKZPOe
	bXrExabbd53u1XAGSCIGYMEcuXANlOEL/yEwCqw0Cmg9wogmWKztGKNhfrQMNZ1xDlhavW+tozW
	gjZZWWBn83+DONQtAKORWYn68pixs4KEv
X-Gm-Gg: ASbGncvJsyaDNLjZgp9Km2iOWkkUfoNBbzQF263RQ1SGXEX8ofWdYuWcd1U8P0H3RTK
	gxgwXFXJ4EkmoVKaFDp9hW5OaTUu7vDvitNCAATTu0/aOjYJREm3DluDpv20caj8Jo4imV1oQmD
	Qkp22eQh5FGXAzkXxf5VQa1xhEKgCEWKrBJmpHlAh5IRhF1oJqNu/37EUp1ad02k7TOSsgya3IE
	/FtwwA738RVnkNjKoKEF3+e5+ZZK12a93xiuiqKYPhxuyRNyLMgyMVwYZPOroiQRg==
X-Google-Smtp-Source: AGHT+IHzC1eCRwXGViTOOLSFM/PDCwUqY6DKBuYcoiYSQl4qaaz1QaEXL2O6o2F/GfgoK5RmaU1tu7qT3rGx
X-Received: by 2002:a05:600c:5105:b0:431:15f1:421d with SMTP id 5b1f17b1804b1-433c5ceeb38mr52428355e9.16.1732264924132;
        Fri, 22 Nov 2024 00:42:04 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-433b45c428asm4064825e9.23.2024.11.22.00.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:42:04 -0800 (PST)
X-Relaying-Domain: raspberrypi.com
From: Naushir Patuck <naush@raspberrypi.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jacopo.mondi@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH v1 1/5] drivers: media: bcm2835-unicam: Improve frame sequence count handling
Date: Fri, 22 Nov 2024 08:41:48 +0000
Message-Id: <20241122084152.1841419-2-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122084152.1841419-1-naush@raspberrypi.com>
References: <20241122084152.1841419-1-naush@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that the frame sequence counter is incremented only if a previous
frame start interrupt has occurred, or a frame start + frame end has
occurred simultaneously.

This corresponds the sequence number with the actual number of frames
produced by the sensor, not the number of frame buffers dequeued back
to userland.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 .../media/platform/broadcom/bcm2835-unicam.c  | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 3aed0e493c81..36fb186a0421 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -199,6 +199,7 @@ struct unicam_device {
 	/* subdevice async notifier */
 	struct v4l2_async_notifier notifier;
 	unsigned int sequence;
+	bool frame_started;
 
 	/* Sensor node */
 	struct {
@@ -742,6 +743,8 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 	 * buffer forever.
 	 */
 	if (fe) {
+		bool inc_seq = unicam->frame_started;
+
 		/*
 		 * Ensure we have swapped buffers already as we can't
 		 * stop the peripheral. If no buffer is available, use a
@@ -761,11 +764,24 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 			 * + FS + LS). In this case, we cannot signal the buffer
 			 * as complete, as the HW will reuse that buffer.
 			 */
-			if (node->cur_frm && node->cur_frm != node->next_frm)
+			if (node->cur_frm && node->cur_frm != node->next_frm) {
 				unicam_process_buffer_complete(node, sequence);
+				inc_seq = true;
+			}
 			node->cur_frm = node->next_frm;
 		}
-		unicam->sequence++;
+
+		/*
+		 * Increment the sequence number conditionally on either a FS
+		 * having already occurred, or in the FE + FS condition as
+		 * caught in the FE handler above. This ensures the sequence
+		 * number corresponds to the frames generated by the sensor, not
+		 * the frames dequeued to userland.
+		 */
+		if (inc_seq) {
+			unicam->sequence++;
+			unicam->frame_started = false;
+		}
 	}
 
 	if (ista & UNICAM_FSI) {
@@ -795,6 +811,7 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 		}
 
 		unicam_queue_event_sof(unicam);
+		unicam->frame_started = true;
 	}
 
 	/*
@@ -1413,6 +1430,7 @@ static int unicam_sd_enable_streams(struct v4l2_subdev *sd,
 		if (unicam->pipe.nodes & BIT(UNICAM_METADATA_NODE))
 			unicam_start_metadata(unicam);
 
+		unicam->frame_started = false;
 		unicam_start_rx(unicam, state);
 	}
 
-- 
2.34.1


