Return-Path: <linux-media+bounces-1439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AA800082
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 01:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E42161C208F1
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 00:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61FFE15B2;
	Fri,  1 Dec 2023 00:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BlUKgCH9"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D1610D0
	for <linux-media@vger.kernel.org>; Thu, 30 Nov 2023 16:47:04 -0800 (PST)
Received: from mz550.lan (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 56D4D660737B;
	Fri,  1 Dec 2023 00:47:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701391623;
	bh=1R/f0e2ht5MPqjpB45jAhHpxK2agH/JF+zu5W9fc/Nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BlUKgCH9BgFLnpTJwv7zdRjNWqKqxOMNS2OIWFi+Gcb4e0jD8HAe9oD6AFZhcs4kL
	 TyJK+OF0x3ZYA+bCV4Xj/sAOQ0KYzM28mNL9iM4M/bMNemZ6nMgaD6z3dpy6LpSY9z
	 jFHvT38F4BYsBp1m7aF1BUBF5coG5a21SIpTcsoauIeWj9RGQ2niDqn4tDXbbeYyuY
	 sPJRYACKVCdfEq0YnutO2yV03CvZY1pBgnhl9L+nsYM1cC+7msh/r5O4YSLGVZvZte
	 ZGZexz27/FF3YWXfG7kw3AKEIOevImGr6USBcb443cmaPirjCYy8PFG+dhAO9rsXpM
	 VGR9464pz3O+Q==
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: linux-media@vger.kernel.org
Cc: hverkuil-cisco@xs4all.nl,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 3/6] v4l2-tracer: add re/tracing for MAX_NUM_BUFFERS
Date: Thu, 30 Nov 2023 16:46:31 -0800
Message-ID: <d4105a75a4e40024b96a9057e1795a1c96074b1a.1701390439.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1701390439.git.deborah.brouwer@collabora.com>
References: <cover.1701390439.git.deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the last sync of the kernel headers, the autogeneration script failed
to pick up the new flag V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS, so add it.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer-gen.pl     | 2 +-
 utils/v4l2-tracer/v4l2-tracer-info-gen.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index 7b4f859b..b0ec9d6e 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -943,7 +943,7 @@ while (<>) {
 	}
 	if (grep {/^#define V4L2_BUF_CAP_SUPPORTS_MMAP\s+/} $_) {
 		printf $fh_common_info_h "constexpr flag_def v4l2_buf_cap_flag_def[] = {\n";
-		flag_def_gen("V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS");
+		flag_def_gen("V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS");
 		next;
 	}
 	if (grep {/^#define V4L2_STD_PAL_B\s+/} $_) {
diff --git a/utils/v4l2-tracer/v4l2-tracer-info-gen.h b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
index 332e271f..b103b9bd 100644
--- a/utils/v4l2-tracer/v4l2-tracer-info-gen.h
+++ b/utils/v4l2-tracer/v4l2-tracer-info-gen.h
@@ -1518,6 +1518,7 @@ constexpr flag_def v4l2_buf_cap_flag_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS,	"V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF,	"V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF" },
 	{ V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS,	"V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS" },
+	{ V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS,	"V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS" },
 	{ 0, "" }
 };
 
-- 
2.41.0


