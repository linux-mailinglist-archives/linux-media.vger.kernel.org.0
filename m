Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2684025B3BA
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 20:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgIBScZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 14:32:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40574 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726858AbgIBScV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 14:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599071539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=gKQVxnmrdXoDRcqTsKCqsePqQgbOzr2qN7RR0j1e0AI=;
        b=aCJD4nhsg4nBQFZTqS2eQvkd4FWu43uYp7OFHV5Mx4ODwMSKXuMdvfV+jKi0NdcwDX6nrw
        l0jJqJHPD8UhglNX0JnDGvY1xzjjbVmNb3KeZzqJcvAxPZu3jLZY+jNYZnE2cnM/l6wv0c
        Y59OqsL0WW/w746vyHlp9w12amkDu5U=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-cUEUkP79PtCgTZrB6wwmmA-1; Wed, 02 Sep 2020 14:32:17 -0400
X-MC-Unique: cUEUkP79PtCgTZrB6wwmmA-1
Received: by mail-il1-f198.google.com with SMTP id o18so378460ill.20
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 11:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gKQVxnmrdXoDRcqTsKCqsePqQgbOzr2qN7RR0j1e0AI=;
        b=DNlCIvElYvZ2wqHo/rY8BFGx5sGiim9ImiJG7cWvC9tZTPT0VN6QXGuA8/W1tY2cXn
         ku5HGTnSKklFtzHFu2EOPu4diz8ZcTPlksoUGzhger0PhGNrfZCZQPTGlqhJV+eBdo3Y
         WDzzNvck9wLOe85HT7gltv2PTfP9H8ohqIJlVyL6cuOuMWxzXD7/IwarAmsYQ934z0l2
         BzVrLFAXt8JN7fVph1EAJ/ArgyUlzHZsNqN8pVYwJ1kq82AczAc9D93Ye5mCzFHJklOr
         E0mGFCBuaret576VZdAkBJldvSgXdobfx2y0xCHbvm08PK22g5kufTuOsnV+9w2QwQIW
         b3Wg==
X-Gm-Message-State: AOAM532rERjtYjVCJIWacLGWDn7rLqQxTOVkiv8Da8Kx3KGlFwqt+F41
        IPF1t0UMlB0Y7a+QgKjAGrFi063YnMDdS1qJmP7JGoILGUHWNiQZtasoBpfz/rzyBltAKURQrPK
        WrDgcUHU6ZIObX3JyYjAAptk=
X-Received: by 2002:a92:79ca:: with SMTP id u193mr4424868ilc.185.1599071537170;
        Wed, 02 Sep 2020 11:32:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbsSh65NZyl23MQQOOAFCbv5TIj4Q3cfW9MNhhkXAXwk+L+YzhAPkdEYtz/FbZR1w9HlhA8g==
X-Received: by 2002:a92:79ca:: with SMTP id u193mr4424848ilc.185.1599071536926;
        Wed, 02 Sep 2020 11:32:16 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id o17sm162399ila.35.2020.09.02.11.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:32:16 -0700 (PDT)
From:   trix@redhat.com
To:     matrandg@cisco.com, mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: tc358743: cleanup tc358743_cec_isr
Date:   Wed,  2 Sep 2020 11:32:12 -0700
Message-Id: <20200902183212.4928-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

tc358743_cec_isr is misnammed, it is not the main isr.
So rename it to be consistent with its siblings,
tc358743_cec_handler.

It also does not check if its input parameter 'handled' is
is non NULL like its siblings, so add a check.

Fixes: a0ec8d1dc42e ("media: tc358743: add CEC support")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/i2c/tc358743.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index c724bd1591de..831b5b54fd78 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -919,8 +919,8 @@ static const struct cec_adap_ops tc358743_cec_adap_ops = {
 	.adap_monitor_all_enable = tc358743_cec_adap_monitor_all_enable,
 };
 
-static void tc358743_cec_isr(struct v4l2_subdev *sd, u16 intstatus,
-			     bool *handled)
+static void tc358743_cec_handler(struct v4l2_subdev *sd, u16 intstatus,
+				 bool *handled)
 {
 	struct tc358743_state *state = to_state(sd);
 	unsigned int cec_rxint, cec_txint;
@@ -953,7 +953,8 @@ static void tc358743_cec_isr(struct v4l2_subdev *sd, u16 intstatus,
 			cec_transmit_attempt_done(state->cec_adap,
 						  CEC_TX_STATUS_ERROR);
 		}
-		*handled = true;
+		if (handled)
+			*handled = true;
 	}
 	if ((intstatus & MASK_CEC_RINT) &&
 	    (cec_rxint & MASK_CECRIEND)) {
@@ -968,7 +969,8 @@ static void tc358743_cec_isr(struct v4l2_subdev *sd, u16 intstatus,
 			msg.msg[i] = v & 0xff;
 		}
 		cec_received_msg(state->cec_adap, &msg);
-		*handled = true;
+		if (handled)
+			*handled = true;
 	}
 	i2c_wr16(sd, INTSTATUS,
 		 intstatus & (MASK_CEC_RINT | MASK_CEC_TINT));
@@ -1432,7 +1434,7 @@ static int tc358743_isr(struct v4l2_subdev *sd, u32 status, bool *handled)
 
 #ifdef CONFIG_VIDEO_TC358743_CEC
 	if (intstatus & (MASK_CEC_RINT | MASK_CEC_TINT)) {
-		tc358743_cec_isr(sd, intstatus, handled);
+		tc358743_cec_handler(sd, intstatus, handled);
 		i2c_wr16(sd, INTSTATUS,
 			 intstatus & (MASK_CEC_RINT | MASK_CEC_TINT));
 		intstatus &= ~(MASK_CEC_RINT | MASK_CEC_TINT);
-- 
2.18.1

