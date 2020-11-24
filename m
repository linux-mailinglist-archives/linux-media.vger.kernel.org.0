Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B0C2C23D2
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732532AbgKXLIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:08:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:33788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732396AbgKXLGe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:34 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D86CF2087D;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=LPkeR/qG2W2eIVXvr9zXEat7TJyfsb0x7hepNAhfTaw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UScstHOwwtThWTYv7kUNKTZRNcFgRmFygdzFbkjsnSR3L4BQHv3Fuv0T+I/C2shTS
         Wr3AoM/BVnzcc0imRGPSwDQ/qFNtIYIq8F1WRS7noWt6QIgCryP1TjflcJZIrj/vGO
         2YQBwspPAzTax77sM9odjEeXGkg860qmrHVxzlf0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZW-Md; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 05/31] media: vidtv: fix the tone generator logic
Date:   Tue, 24 Nov 2020 12:06:01 +0100
Message-Id: <4421cda35fe8d3d80687f27030108b9dcdc924d1.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The tone generator logic were repeating the song after the
first silent. There's also a wrong logic at the note
offset calculus, which may create some noise.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_s302m.c | 14 ++++----------
 drivers/media/test-drivers/vidtv/vidtv_s302m.h |  2 +-
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
index cbf89530aafe..fdb3d649c516 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
@@ -253,18 +253,12 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
 			ctx->last_duration--;
 		}
 
-		/* Handle silent */
-		if (!ctx->last_tone) {
-			e->src_buf_offset = 0;
+		/* Handle pause notes */
+		if (!ctx->last_tone)
 			return 0x8000;
-		}
 
-		pos = (2 * PI * ctx->note_offset * ctx->last_tone / S302M_SAMPLING_RATE_HZ);
-
-		if (pos == 360)
-			ctx->note_offset = 0;
-		else
-			ctx->note_offset++;
+		pos = (2 * PI * ctx->note_offset * ctx->last_tone) / S302M_SAMPLING_RATE_HZ;
+		ctx->note_offset++;
 
 		return (fixp_sin32(pos % (2 * PI)) >> 16) + 0x8000;
 	}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.h b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
index a0101734e758..e990b755bb20 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_s302m.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.h
@@ -39,7 +39,7 @@ struct vidtv_s302m_ctx {
 	u32 frame_index;
 	u32 au_count;
 	int last_duration;
-	int note_offset;
+	unsigned int note_offset;
 	enum musical_notes last_tone;
 };
 
-- 
2.28.0

