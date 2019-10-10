Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52A59D2A80
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 15:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388063AbfJJNL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 09:11:58 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:34775 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388048AbfJJNL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 09:11:57 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:bc04:8998:8ec1:1871])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IYESijV5zop0AIYEViU37h; Thu, 10 Oct 2019 15:11:55 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 6/8] media: cedrus: Detect first slice of a frame
Date:   Thu, 10 Oct 2019 15:11:50 +0200
Message-Id: <20191010131152.68984-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNehpzSLnwlvZCmgg+1Ed3QLNwLhTgLyDEARzq26bl01ROW8oYfQHHZ8iaPuJ+C4VvD8UsQDPTP2OcGQcAjep1uSm2rhnnnyWj7aCfT41PisMe6yi5zC
 jFpxptS8fR0CFoPZ752VdOautT6W1W6gW5bwyjrecdsx7WAoJs0JFx8GHQMJOgE36du63az8K4GLmowr0/tPp3YW+O1TaJAsyvKpt7Cn8o9JS0Q3lOTj8VK4
 hqBn6LE51yvKPcDe0aXTkwU512mAtM8u5hnIS7X5+Wp9H1SE8spYhqmcjYp1J2v75kw5nWM3w0Q57JKq+sNaO6O3D0PxiNKJK11380XoGPDlGN6sVidhpaeV
 biFASR6JUdRJnsFaP8eXo0AS2bhQiXamfkDsHiM9Kg19fMnPVKeqr1CrdrE6yiEdM4Rax9Rr9m6xz9ccjsot0k25uQxeT2PmNgN1yDST68yCXZe9myZvysxN
 Wdm3BtkEK2M7RygO
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

When codec supports multiple slices in one frame, VPU has to know when
first slice of each frame is being processed, presumably to correctly
clear/set data in auxiliary buffers.

Add first_slice field to cedrus_run structure and set it according to
the new_frame boolean of the context.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
[hverkuil-cisco@xs4all.nl: rewritten to use the new_frame bool]
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h     | 1 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 2f017a651848..32cb38e541c6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -70,6 +70,7 @@ struct cedrus_mpeg2_run {
 struct cedrus_run {
 	struct vb2_v4l2_buffer	*src;
 	struct vb2_v4l2_buffer	*dst;
+	bool first_slice;
 
 	union {
 		struct cedrus_h264_run	h264;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 56ca4c9ad01c..7d3dd31e8190 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -31,6 +31,7 @@ void cedrus_device_run(void *priv)
 
 	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+	run.first_slice = ctx->fh.m2m_ctx->new_frame;
 
 	/* Apply request(s) controls if needed. */
 	src_req = run.src->vb2_buf.req_obj.req;
-- 
2.23.0

