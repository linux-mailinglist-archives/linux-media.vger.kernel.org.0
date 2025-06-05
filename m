Return-Path: <linux-media+bounces-34109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48783ACEE3B
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DFDD1735FE
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94C3225401;
	Thu,  5 Jun 2025 10:59:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3F2E659
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121168; cv=none; b=YoJcil5xvkbnUbjQp3BLFQHo+2QwBqUuI6y/OM1U94MvJz3Wy8r/yh3BqSsIGMmFLj0qIQMysD78bGX/6ymoRi6/+r0+O+2vEQsEYPbqDp6tt8b3dJKHTGrKUPG44RqPDqlCM9Ny8X5YcxJe4SjgI313NGyBVAsxSN6/kwffAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121168; c=relaxed/simple;
	bh=I4SO2pKeDXFwywdWmhMe0GLrxX4jGrYGYds1ro4k6Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=co8QcyoV5C5EQ72uCUALoBZKmm2ga1ofEp85lh4UR7XRGIUK3N3l3u1O7BNgHcX7bjbGV0n0cXP8tnsWKly024HHcE3KfB6V7K7sdirDURA7gdpbW+z68jKB+BHj/g+HgKTofojtHWww6WOenSIR+xYp0zfuqcHTvZ2cVIACg58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33B4C4CEEE;
	Thu,  5 Jun 2025 10:59:26 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 8/9] libdvbv5/dvb-scan: flush any pending bufs after dvb_dmx_stop
Date: Thu,  5 Jun 2025 12:58:31 +0200
Message-ID: <0a2be4d76599ab91907189ab0352cf68c5e939f1.1749121112.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749121112.git.hverkuil@xs4all.nl>
References: <cover.1749121112.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After dvb_dmx_stop() is called, and we are using streaming I/O, then
flush any pending buffers. If we don't do that, then those buffers
will be dequeued next time we enter dvb_read_sections.

If you are not using streaming I/O, then this isn't needed since
the kernel will clear all pending data from the read() buffer when
DMX_STOP is called. But for streaming I/O those buffers are already
queued up for the application.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 lib/libdvbv5/dvb-scan.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
index afe3a4f0..f07b1306 100644
--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -427,6 +427,15 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 	}
 	dvb_dmx_stop(dmx_fd);
 	dvb_table_filter_free(sect);
+	if (parms->p.stream_ctx) {
+		/* Flush pending buffers */
+		while (dvb_poll(parms, dmx_fd, 0) > 0) {
+			struct dmx_buffer b;
+			if (dvb_v5_stream_dqbuf(parms->p.stream_ctx, &b) >= 0) {
+				dvb_v5_stream_qbuf(parms->p.stream_ctx, b.index);
+			}
+		}
+	}
 
 	if (ret > 0)
 		ret = 0;
-- 
2.47.2


