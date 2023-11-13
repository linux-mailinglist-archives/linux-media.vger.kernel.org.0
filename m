Return-Path: <linux-media+bounces-266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E607C7EA048
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06E5280DF6
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3399F219FA;
	Mon, 13 Nov 2023 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z1weaegh"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D4219F2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 15:41:18 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B64172A;
	Mon, 13 Nov 2023 07:41:17 -0800 (PST)
Received: from arisu.mtl.collabora.ca (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 398E66606F5E;
	Mon, 13 Nov 2023 15:41:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699890076;
	bh=Kpz4GbzKraVfywCJCP/gIgyjQGH1m53lANmGVN3Ca1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z1weaeghfmY+NVJkA9VNXL4CfAxbT7HnnnxSm0tKoVxkI5OpG6mN99k83y2d7MXHL
	 fkKKoFRy4BrNV20P0NGv95mgca6N0nyqdSJC8zg/LszT7ML78hAhHJ5MExAymCFXZt
	 u8zVLNsHgrNQ/JBoDZdtVr26HO336A5/YBRlz1lCnrmskyhTfsSxNV0Qrbpq3Ra/Yt
	 1ejVsP7Gq5Bl20kS67zFW5jCO9LyPIAREU3gmyeryGQNbhhigswKe8MRmlCtfgYGdJ
	 XdhEwVJ8apVmhs6ky6l8oEV5JLQzzwO/+ZMcCXoc5WfbCXI9FZaGiqyqKi/+QwvykQ
	 3NGd8qo99wN2g==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 2/2] doc: visl: Add AV1 support
Date: Mon, 13 Nov 2023 10:39:59 -0500
Message-ID: <20231113154109.114488-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113154109.114488-1-detlev.casanova@collabora.com>
References: <20231113154109.114488-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add AV1 information in visl documentation.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/admin-guide/media/visl.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/admin-guide/media/visl.rst b/Documentation/admin-guide/media/visl.rst
index 4328c6c72d30..db1ef29438e1 100644
--- a/Documentation/admin-guide/media/visl.rst
+++ b/Documentation/admin-guide/media/visl.rst
@@ -71,6 +71,7 @@ The following codecs are supported:
 - VP9
 - H.264
 - HEVC
+- AV1
 
 visl trace events
 -----------------
@@ -79,6 +80,7 @@ The trace events are defined on a per-codec basis, e.g.:
 .. code-block:: bash
 
         $ ls /sys/kernel/tracing/events/ | grep visl
+        visl_av1_controls
         visl_fwht_controls
         visl_h264_controls
         visl_hevc_controls
-- 
2.41.0


