Return-Path: <linux-media+bounces-34345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5173DAD1C2A
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 13:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1248C188DAFB
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 11:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361C0253956;
	Mon,  9 Jun 2025 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="l4Lt+8ws"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4611C8604
	for <linux-media@vger.kernel.org>; Mon,  9 Jun 2025 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467051; cv=none; b=RmeVJk1qlnqxql8mDNESbPGUG5UeryRzfsnDAJG8/Z5ImUKVrb73LIWOaVodaNWxoZPuUZ+0pysDJoYOqBafHplqvbY2YXldkB/bK2FRmh8RotOzG1kQl9bWjTZUiSgZ8IjzpJqNnM4ZN3G7Kqu55PBsckp2ek4JdchorsDOpvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467051; c=relaxed/simple;
	bh=yJBE/0qDD9ST41lYTH/1LCULg4ix2ROZ8UTAefBmQfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLuF/k5TUNE87MtkMZzttFhME7oQgMN700oqq6PfvKB5uH/U8MdHHJX5lx0eHI7mry+dr+QvFOpau6WrXjPFN9RNfTS9GYGzG5icxrrlVyBdNqZNb5UNNtra7g6viG4qFW829A5kU40EGK0AQshouGjUZQSh8Pt7ylBwpji5AiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=l4Lt+8ws; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QAQu03T+0Cw7dpCbcuwxezen/s/XSrGtmte1ESndrNA=; b=l4Lt+8wskp/HEbS1bv9EVJP9e6
	8kk4clDkeg070aI7/R5hBrYnxHmrbQFbEyufgh4H9s0YE7Z6XUWKtp9bTdSejR9wOD98QB9P9k5uw
	EoZ72SBY0mq/VUSkqSV7D0dIdXjJfBuQslj5xtW72txmwBYDYv3u80Cx/9Pm0cMWfTcPML0R/iB8y
	dhuKZEX7jaGriKpLu7Isj6g68vMZlzmqp9iZ1It8yl/ZypCRi+4zyrs7k7IIQabAPLXHyIg3KaIM7
	FNEBZV9y97Z0NsWD+vYlFTjKR4fOtMguWFpGglIl3Yg6bMwAfxN47AwKO25KoiiNec8vk1fFE1B3U
	AqX9vYWA==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uOaI6-001NxH-EL; Mon, 09 Jun 2025 13:03:46 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Rob Clark <robdclark@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 2/4] sync_file: Protect access to driver and timeline name
Date: Mon,  9 Jun 2025 12:03:28 +0100
Message-ID: <20250609110330.74705-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
References: <20250609110330.74705-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Protect the access to driver and timeline name which otherwise could be
freed as dma-fence exported is signalling fences.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/sync_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index 212df4b849fe..ad87116baa24 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -136,11 +136,13 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 	} else {
 		struct dma_fence *fence = sync_file->fence;
 
+		dma_fence_access_begin();
 		snprintf(buf, len, "%s-%s%llu-%lld",
 			 dma_fence_driver_name(fence),
 			 dma_fence_timeline_name(fence),
 			 fence->context,
 			 fence->seqno);
+		dma_fence_access_end();
 	}
 
 	return buf;
@@ -262,6 +264,8 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
 static int sync_fill_fence_info(struct dma_fence *fence,
 				 struct sync_fence_info *info)
 {
+	dma_fence_access_begin();
+
 	strscpy(info->obj_name, dma_fence_timeline_name(fence),
 		sizeof(info->obj_name));
 	strscpy(info->driver_name, dma_fence_driver_name(fence),
@@ -273,6 +277,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 			ktime_to_ns(dma_fence_timestamp(fence)) :
 			ktime_set(0, 0);
 
+	dma_fence_access_end();
+
 	return info->status;
 }
 
-- 
2.48.0


