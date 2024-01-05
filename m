Return-Path: <linux-media+bounces-3236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD91B825383
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 13:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66E002810CD
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 12:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2CA2D605;
	Fri,  5 Jan 2024 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="zIpB3Es+"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C22D043
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704459282;
	bh=xo0d7PBDqAeqbmn+eEWG9NhNshjmWVA0KYru1crbOHw=;
	h=From:To:Cc:Subject:Date:From;
	b=zIpB3Es+6Rnbrd7csfSxAOODksjIpcEH+X4OTjYrXo+SPS+UyAT62OhTig65ex54v
	 8zOhJpPScEt/kiw9z+48pafkXIgXpha+V2naXnzwRDzH3gaB0k0FuMAjSznxVHWS8J
	 o1BNkPe+f7ng65CUso41kB/3C0xVK2iZ5n/RC8IgiX7Alu1hOyCbf2n1e0O3A2jKuQ
	 CxWr0jG6QN35geto4t42qsWryTksKhuADS3kT+nCiQV2IO0EdKBCjgcvxmPBQDmbUh
	 KG52riSCvO+3rnIFHZRnBbe3LUrFK4Zhb8vLGh05f5m1g5+Q2HluT7nIPeVT+tDoQe
	 XXrvoBVRPpoTw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A6B53782002;
	Fri,  5 Jan 2024 12:54:42 +0000 (UTC)
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	kernel@collabora.com
Subject: [PATCH] media: videobuf2: Fix doc comment
Date: Fri,  5 Jan 2024 13:54:37 +0100
Message-Id: <20240105125437.30926-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documented struct member is called "planes" rather than "vb2_plane".
While at it, make the comments order follow struct members order.

Fixes: 2b1413245550 ("media: vb2-core: Improve kernel-doc markups")
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 include/media/videobuf2-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b6a9d2ea372..e41204df19f0 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -271,11 +271,11 @@ struct vb2_buffer {
 	 *			skips cache sync/invalidation.
 	 * skip_cache_sync_on_finish: when set buffer's ->finish() function
 	 *			skips cache sync/invalidation.
+	 * planes:		per-plane information; do not change
 	 * queued_entry:	entry on the queued buffers list, which holds
 	 *			all buffers queued from userspace
 	 * done_entry:		entry on the list that stores all buffers ready
 	 *			to be dequeued to userspace
-	 * vb2_plane:		per-plane information; do not change
 	 */
 	enum vb2_buffer_state	state;
 	unsigned int		synced:1;
-- 
2.25.1


