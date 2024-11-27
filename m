Return-Path: <linux-media+bounces-22161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E69DA6A7
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91AD9164267
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C5E1F12E5;
	Wed, 27 Nov 2024 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="GvFlc/eV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f227.google.com (mail-lj1-f227.google.com [209.85.208.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46D91EF099
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706123; cv=none; b=jDRlROsl9Zskgf29cVcEE++m7XhTTYl6O5pVyMTiLFPnXZJK1JRO4DKvEdPzUOFmqtyd90wvw53v2uV4eh2XCorKpgG0iWMmJDzfj+J+u5LeqfhgAYrM3cMdILh0Y2PMcNmzvmfXeErelCJP1+pkuKgXfkB4DnTSB7rDtgm9VdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706123; c=relaxed/simple;
	bh=wnthNX/wVIc0cJrqj82UcQ/NTxF5OCTEjQVgalgz04g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8PH+OctdP0K4wGU1yrBmtCplSs0D8XE4Lg2Nj9B0W2WcuI8x+8fEYJgdgj3v0wKOhtEwAVOYWvvuorVgb4N3KROB6tYSZvRqsrs1XQOr6uagQW9hgL/+vUJngFeAuLioFOitZ/WXYGGb0FLxqlkDAmc0QzoCmyiQHrFmGf6u+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=GvFlc/eV; arc=none smtp.client-ip=209.85.208.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lj1-f227.google.com with SMTP id 38308e7fff4ca-2ffa3e8e917so67315351fa.3
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706120; x=1733310920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDLmlhfFf3fKmWcDI3ja5XlaBhDY7yQ7y51lLCUjcJ4=;
        b=GvFlc/eVExxzD77pgreiWaDXtUAgGU142RVCehNvGc0t4aDDdxIFVb88ix1QtkxYvK
         696J2bvfQKFeEAcuANqlUOjuXJlRd2Mud49J0n5Scw2U/pfAu/yZggLyZVxGHSrNsoK5
         pvYA5UAJhGgLlQeWFjt0X2m8MMHaQIIZfHp7GHketMHBUEGgp3bQ9iVhVozj5TvF/tSN
         hDotuKg0s5R91uS5smnboBCAQRI3UbErGrGQnHen9rylmsFhdZKAGjlorhFVlhltmfDK
         VCJixSdP0Nq2/MdMnNsBcdrIB5E/viMmY+jKTwLB7rOO61cs+EAj8dS3VrC3hsHaLTry
         +hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706120; x=1733310920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDLmlhfFf3fKmWcDI3ja5XlaBhDY7yQ7y51lLCUjcJ4=;
        b=OE80oMiyYj++YAKS0xZtOB4I53Wb7n/DaRbpQv5OAq6o3ZDiLrd/GkiLlJFVhUYtze
         0YY4u9hlFtNugoozZLaMzoh6pdck0NqD/5+xNw24IHNC2NPWx8xBYOiePXNzVemBOEmW
         g8+D+W/VvwsP0mLCXJWzFbm2+h4WhHhcRsPsQxANOIQLSMCF5N6eR8hR6ZaxSlYPAqql
         4ZOQBmLr0wLaNmoHYOS8zjcn72hNd+bP3iMbCm/HAtyTWbiy5sotmXYxJ0qj+kHmzKgg
         zdlnVPHCrPv7onngRnalpFlm9XzhmDvh+tJgwx5kmthz9h4H3qnAx60RgTyy53AxjH5b
         hLTQ==
X-Gm-Message-State: AOJu0YxXwjGVhssw4iPFfrFWbfvp5oATzNN4TVyyAnk784Coq3vVvV/B
	oHkUvtNwrKmyjUD17ib0MP+K4atg5K1dbZdA/yPV2Gu5E+BG7X97A6RjOcpHNwj8GIL0Hbb5BKK
	3NtUnWAnJQDESLq77EPAnVsT/MnG+tOcF
X-Gm-Gg: ASbGncsux5bl+ZhJMRe2KMx6Iq/RM8WjsstAP4MfFh8sFakmMmIIdscLi8J2BJ5NhAo
	BSgraGOpitNpPQ0WevZ3HBV8KFTnaR9H5GTRgogehTjNllXpiJ9mqojz2/R0in/fnN/wBGzadzi
	Bu/cWFdnOYzCcUHKV+mwmSyx4VtL6IPifhHyTTTFaRy3SSinOykm3L6yzzRLmFYZxSnuknaL8gD
	oDId5F7Dm8Tp90Pc8u8DrgfkhkyAfybMMUfHTfkdELxUY72X1EjpLa5Qzxo0gK9tg==
X-Google-Smtp-Source: AGHT+IGTwoCSNs5BBDwFG/AtnZDnL6h+6Oxq6PET6Ihsy3bf1ZEmlnpsnNPW65FRF37uJIGFAM/fVa2LEDdW
X-Received: by 2002:a05:651c:211a:b0:2ff:c67f:5197 with SMTP id 38308e7fff4ca-2ffd605a257mr12586081fa.13.1732706119878;
        Wed, 27 Nov 2024 03:15:19 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id 38308e7fff4ca-2ffa5eddedcsm1274321fa.59.2024.11.27.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:19 -0800 (PST)
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
Subject: [PATCH v2 1/4] drivers: media: bcm2835-unicam: Improve frame sequence count handling
Date: Wed, 27 Nov 2024 11:15:12 +0000
Message-Id: <20241127111515.565992-2-naush@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127111515.565992-1-naush@raspberrypi.com>
References: <20241127111515.565992-1-naush@raspberrypi.com>
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


