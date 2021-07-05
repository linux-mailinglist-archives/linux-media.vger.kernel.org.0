Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7BB3BC2AE
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 20:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhGESeN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 14:34:13 -0400
Received: from gofer.mess.org ([88.97.38.141]:40529 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229757AbhGESeM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Jul 2021 14:34:12 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id AF7BCC64A8; Mon,  5 Jul 2021 19:31:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1625509893; bh=B0Vwzu3OBCSHvYIhvOuQSZWXyZ01Ql5G0JEOj4NNMzQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NP4Nj2PtGaMGoPZuiRYAg8AxdJx58+hZCYzXTh2VwuPmkMQt80rIqNCg9ATfiLWXc
         MsjaM5pNptKMdvGXJXrcBYKxs06WVF6epKnKqfEKlK3apXu05iBjxbgu/oGVk9OccG
         uyqlFIgJooLR35fsYsXRdsWBx3yoG+q49CZvPkV6p4vxBmVjsbelrprXPE6gGA6ITF
         XzEyHgRFjFxdWYVFor7JJVp5AzGqdIq6PSm4fIqXHreZQwGHeHsQCp9ZIW066zNwNv
         m0D5FBeONr0F2x7veRxudzHy0zalFFeQoat/CI9JPrG/I0EQpVik0QtA9Zf3iW0YV+
         XRh6+fBtfBbqg==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 4/5] media: rc-loopback: max_timeout of UINT_MAX does not work
Date:   Mon,  5 Jul 2021 19:31:31 +0100
Message-Id: <d99d035cdfd7f1a9992338445b88f8a0defc4cdd.1625509803.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1625509803.git.sean@mess.org>
References: <cover.1625509803.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Any timeout larger than LIRC_VALUE_MASK cannot work for the lirc uapi.
LIRC_VALUE_MASK is about 16 seconds which is more than enough.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-loopback.c | 4 ++--
 include/media/rc-core.h        | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index 67782dd7ee4d..40fca1226b09 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -222,9 +222,9 @@ static int __init loop_init(void)
 	rc->allowed_protocols	= RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->allowed_wakeup_protocols = RC_PROTO_BIT_ALL_IR_ENCODER;
 	rc->encode_wakeup	= true;
-	rc->timeout		= MS_TO_US(100); /* 100 ms */
+	rc->timeout		= IR_DEFAULT_TIMEOUT;
 	rc->min_timeout		= 1;
-	rc->max_timeout		= UINT_MAX;
+	rc->max_timeout		= IR_MAX_TIMEOUT;
 	rc->rx_resolution	= 1;
 	rc->tx_resolution	= 1;
 	rc->s_tx_mask		= loop_set_tx_mask;
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index a1019c4ab5e8..64b43d76f7f0 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -313,6 +313,7 @@ struct ir_raw_event {
 #define MS_TO_US(msec)		((msec) * 1000)
 #define IR_MAX_DURATION		MS_TO_US(500)
 #define IR_DEFAULT_TIMEOUT	MS_TO_US(125)
+#define IR_MAX_TIMEOUT		LIRC_VALUE_MASK
 
 void ir_raw_event_handle(struct rc_dev *dev);
 int ir_raw_event_store(struct rc_dev *dev, struct ir_raw_event *ev);
-- 
2.31.1

