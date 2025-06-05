Return-Path: <linux-media+bounces-34108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF6ACEE3A
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FE801895AB2
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 10:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0216D224B01;
	Thu,  5 Jun 2025 10:59:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0932215198
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121166; cv=none; b=E48Ei6L3pAuPfSf8jqAq5KTEznaOXJZLdbDTeDj/LRaxkdEoCof86GS2XqQFtyceSbAVWmCUSVmsGEps2ElyVtLUdjqGPjQr0MlKpCse+hjRsHLh+2lX5J4FSYrMg70sdh6xzY1cW6pxFZAgPH8kbixzvBpTV+bdS+rVY+lRB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121166; c=relaxed/simple;
	bh=rtlLXi3fELkSRdmIM4pqCx8m0zAThLdH5XWx1eXLj/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AM7XzCOWBI5S/+aazVp3pY8yIPhtBMRk0szmF6NtEDSY3OMgZ67/EZXJuQZu/fWVR32OUFmbFQJGJmhlG6Xx6v5WtsrPFXW+FVYy9qGKQ8C0Z0U4K6kjrxptRt2hJf6rcwMInps4Mufc6K7kwtJTKfV6Vwwi3YHOkRVx3pdHMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07A1C4CEEB;
	Thu,  5 Jun 2025 10:59:25 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 7/9] libdvbv5/dvb-scan: always requeue after dvb_parse_section
Date: Thu,  5 Jun 2025 12:58:30 +0200
Message-ID: <d3680ee831a6638ca9f264966d4fccf6f2078df1.1749121112.git.hverkuil@xs4all.nl>
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

Even if dvb_parse_section returns non-zero, you still need to requeue the buffer.
Otherwise it will effectively be lost.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 lib/libdvbv5/dvb-scan.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/lib/libdvbv5/dvb-scan.c b/lib/libdvbv5/dvb-scan.c
index 3f52d140..afe3a4f0 100644
--- a/lib/libdvbv5/dvb-scan.c
+++ b/lib/libdvbv5/dvb-scan.c
@@ -412,14 +412,12 @@ int dvb_read_sections(struct dvb_v5_fe_parms *__p, int dmx_fd,
 		ret = dvb_parse_section(parms, sect, buf, buf_length);
 
 		if (parms->p.stream_ctx) {
-			/**enqueue the buffer again*/
-			if (!ret) {
-				if (dvb_v5_stream_qbuf(parms->p.stream_ctx, b.index) < 0) {
-					parms->p.stream_ctx->error = 1;
-					break;
-				} else {
-					parms->p.stream_ctx->buf_flag[b.index] = 1;
-				}
+			/* enqueue the buffer again */
+			if (dvb_v5_stream_qbuf(parms->p.stream_ctx, b.index) < 0) {
+				parms->p.stream_ctx->error = 1;
+				break;
+			} else {
+				parms->p.stream_ctx->buf_flag[b.index] = 1;
 			}
 		}
 	} while (!ret);
-- 
2.47.2


