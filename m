Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D154216113
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 23:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgGFVye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 17:54:34 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:34375 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgGFVye (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 17:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=5txQuAYNmGaU8Nd4lJkjbzMqb30VPI9NYZ7MC6DEj1w=;
        b=j0Ml1RuAt+c/U6xC0bWI21e1cYRXKqaZoxydlpSUDj0SOTWSGz9MlgjYUfpEAFOwoXuv
        guGFshEHJTPM7WNL8x1iW1MlBlwwtT6KQ8CJM7IJARPd7GVUuBGjPCd7OZFtXuWZ0+PpLo
        vl8AKTewiMO/YYLeYhkPumE0p2g7d4ZLw=
Received: by filterdrecv-p3iad2-5b55dcd864-v6r54 with SMTP id filterdrecv-p3iad2-5b55dcd864-v6r54-19-5F039D99-5C
        2020-07-06 21:54:33.767276128 +0000 UTC m=+881107.614285949
Received: from bionic.localdomain (unknown)
        by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
        id OHp0ZKomRAG6VTmnegSU3A
        Mon, 06 Jul 2020 21:54:33.516 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 01/12] media: rkvdec: h264: Fix reference frame_num wrap
 for second field
Date:   Mon, 06 Jul 2020 21:54:33 +0000 (UTC)
Message-Id: <20200706215430.22859-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200706215430.22859-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200706215430.22859-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h+NCRrAaiddgiZamr?=
 =?us-ascii?Q?HL+cGPmHoqntE5sMJmmMqzxuYqSmGLayo0XcIwD?=
 =?us-ascii?Q?38=2F0P1dX24xvgtJBcr4hYEb8ZS=2Fl6VKVUKCC01F?=
 =?us-ascii?Q?FK31QwXdKx12xczepSC+cm9FnbEGwscznU8Dcxo?=
 =?us-ascii?Q?p4gmAG7rYcHWiqrDpCABkOIabxjYL=2FwtkVOUmWb?=
 =?us-ascii?Q?SEKP5jWfPGqZMYN8zI=2FJA=3D=3D?=
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When decoding the second field in a complementary field pair the second
field is sharing the same frame_num with the first field.

Currently the frame_num for the first field is wrapped when it matches the
field being decoded, this cause issues to decode the second field in a
complementary field pair.

Fix this by using inclusive comparison, less than or equal.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes in v2:
- Collect r-b tag
---
 drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 7b66e2743a4f..f0cfed84d60d 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -754,7 +754,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			continue;
 
 		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
-		    dpb[i].frame_num < sl_params->frame_num) {
+		    dpb[i].frame_num <= sl_params->frame_num) {
 			p[i] = dpb[i].frame_num;
 			continue;
 		}
-- 
2.17.1

