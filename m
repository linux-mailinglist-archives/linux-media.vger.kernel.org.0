Return-Path: <linux-media+bounces-22164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736C9DA6AA
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B546164BD7
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89381F427E;
	Wed, 27 Nov 2024 11:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZYOOX5Y+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com [209.85.221.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660781E1A16
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732706125; cv=none; b=uRYsu6080FaWX4VQWTNTJJqAMVJ1MT2R9hZSKp4u9Br86KE8RWe7vaLtufwkcDxurAUv/k3AMWWoSCKqThsz61U6STh2WNgm7myrZ81/Gobs0rERWviS5YUpGSSbDyhBeW5wRD28kr19zu9X079ccGs8w8MSBl+DDTdKhHMoqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732706125; c=relaxed/simple;
	bh=2NOMVN6qGPtVqsDC17KQHFq1EI6laocjfEVCvcsOBBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sp57WpJl6bkYgTetQOJU9Yuj47B4C+Rmk5GxH9q9ao6case7sq8gmUZeElAjesKeZe+aOJCbQzBtFAvleDOBTi/iUS0B4cjxRLTNjIoBRzzc//CkD+10o9m//gvVYCziK3sLZYqc4ogymAh4mqGB82+QJBmPZXKcLY4GEDv4Z2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZYOOX5Y+; arc=none smtp.client-ip=209.85.221.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f97.google.com with SMTP id ffacd0b85a97d-3823cf963f1so4236213f8f.1
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732706122; x=1733310922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OeHJ5VmorUPFsKfp3L5ZEPCj51aQDOtY3qfB7PKLqU=;
        b=ZYOOX5Y+se1tjjUYxEZHrGnY/yP9C2leTZbrej6Qztnuf88JZLSq6jFxCEpqfK1/KI
         HAsiLtv6QOtcmebU7wmnRx5SaxTVnyrasAw1siS0RAZFgkQrRSLsU624aD8HNa0lnxtO
         rI7A/8zC+6IonQy73W68FpT02Ol5uRLgt7clK6ZBeIRK/yhu2YS5JWSJ2bctiBDfjN89
         pltH5kCFbfc3GarmzUbPr5JFdJx7PoYvE4jJ3SqZX8TkRSBtBYCQaXtwoyZfwZwhMqru
         GXWTkcJhMQZ7Mp6MeTm7YtiU7/ftN4OKGzLar9kfpbxvRXZ9LBRwXjOmeNTbM5pLrAYn
         BFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732706122; x=1733310922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OeHJ5VmorUPFsKfp3L5ZEPCj51aQDOtY3qfB7PKLqU=;
        b=HUILbNc5t1c1qHt6J0OMteBpg+WvSEztbWSilsVMNNWRNWQF7pApWYH2GFD9tzdFaZ
         WoFgNoRdEEHwqHWwa2GBem5FoOstYYtgOZ57J2XmEvcQndYDfs8yTc7OHcmG60xS2cVc
         /+F2N6usSys1eVwPg+XnrU5o+H4IxYj9cg+KtOGH0zRNSNSBjabMh6tiJGpzSFctFE6E
         t8jNBx8Xxv41PrGMowk4vJMVLOxayDfrLvLhADTDpPjRJkUDBG1ukP7bEcNS0jFA1Tfx
         Mxl0WoUmJ+EO7wwsg1tPfEsSeDwM/qiIz7g28kt7C82P7Wtg7PeL9fIbgGKifGQ9Kt84
         YgbQ==
X-Gm-Message-State: AOJu0YweNsu82qbp5gNJo0FZ9sIw0yaa6eDUKCC8qjEeewoIHHeQ5Fbs
	O1BmgvT6PDsIcKpiXR8bQ6DbqrNniLGZj/nxGELoWWQ6pqKTIshdgyf4RIqptpc2O/l6Zl6Zoeh
	a/LWel496P4PhkKUjuG2EngHRQlmA9/OS
X-Gm-Gg: ASbGnctOvhWr/Mv9rDrdQFNMuA3jgzi7ety2q2wDw1F2w3tY86wHOsw3kzMd3IM6uTu
	6U6OgfnfZOqrdl1CAWfwh9rrvHL/Hq2ec6VIhVwjsEdumKUAoFKZztGtF20yiKjLkiuU6prQ5S5
	zOwjoLulsoEX+STFX/K4pc+BP2/s0jMtJhMFAb6GDXFqDkCprnHPiQVYDD+fxON9jjBycgAvBkK
	yEGwloWXHwH3ElN/6NRNM1auYuxRBQtO/YVIKq5Ia6+GyNvU6WYI9n3WvzxK/meyA==
X-Google-Smtp-Source: AGHT+IG8NIxF+WfvLMMyexhQ4F78Jja+ecK4xzKxkdy9lOD0O56mEG25LOMSGylsAkrpJskIxuI6TCXFkAK1
X-Received: by 2002:a5d:47a4:0:b0:382:5066:326f with SMTP id ffacd0b85a97d-385c6eb72bamr1917091f8f.17.1732706121697;
        Wed, 27 Nov 2024 03:15:21 -0800 (PST)
Received: from raspberrypi.com ([93.93.133.154])
        by smtp-relay.gmail.com with ESMTPS id ffacd0b85a97d-3825fae4853sm441870f8f.4.2024.11.27.03.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:15:21 -0800 (PST)
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
Subject: [PATCH v2 4/4] drivers: media: bcm2835-unicam: Fix for possible dummy buffer overrun
Date: Wed, 27 Nov 2024 11:15:15 +0000
Message-Id: <20241127111515.565992-5-naush@raspberrypi.com>
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

The Unicam hardware has been observed to cause a buffer overrun when
using the dummy buffer as a circular buffer. The conditions that cause
the overrun are not fully known, but it seems to occur when the memory
bus is heavily loaded.

To avoid the overrun, program the hardware with a buffer size of 0 when
using the dummy buffer. This will cause overrun into the allocated dummy
buffer, but avoid out of bounds writes.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 550eb1b064f1..f10064107d54 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -640,7 +640,14 @@ static inline void unicam_reg_write_field(struct unicam_device *unicam, u32 offs
 static void unicam_wr_dma_addr(struct unicam_node *node,
 			       struct unicam_buffer *buf)
 {
-	dma_addr_t endaddr = buf->dma_addr + buf->size;
+	/*
+	 * Due to a HW bug causing buffer overruns in circular buffer mode under
+	 * certain (not yet fully known) conditions, the dummy buffer allocation
+	 * is set to a a single page size, but the hardware gets programmed with
+	 * a buffer size of 0.
+	 */
+	dma_addr_t endaddr = buf->dma_addr +
+			     (buf != &node->dummy_buf ? buf->size : 0);
 
 	if (node->id == UNICAM_IMAGE_NODE) {
 		unicam_reg_write(node->dev, UNICAM_IBSA0, buf->dma_addr);
-- 
2.34.1


