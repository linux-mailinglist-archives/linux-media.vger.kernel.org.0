Return-Path: <linux-media+bounces-32574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16972AB834F
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 11:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16FBF3AEFD4
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 09:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104D42980A7;
	Thu, 15 May 2025 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="I94lSW7e"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E802868B5
	for <linux-media@vger.kernel.org>; Thu, 15 May 2025 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302631; cv=none; b=o/dyL2lfMHa8q1e9S+1639UJg8JF4Imm/KlVewD+w/DIpRisFm8CvUVZn5gJsA/TRGM4ayr7tsfZTgxIJ2DgYDZNKKP5uUR/5eKVAnXHQYxmd394X8ZAjPk4At6+400NBJ2ZUP/kZwwwTcjZGE8GlJHEmgJ93ee/ztRQiiGTwP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302631; c=relaxed/simple;
	bh=yJBE/0qDD9ST41lYTH/1LCULg4ix2ROZ8UTAefBmQfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S98RHQGS85GgdJ3bNadDzjj38EvEUeXbRdl/Q8/C+mIm8iWvIJCTA53KLn1sjpVEGB0u+s2zKRdtbB/p33ETEnMJHwjw6FJgXSFo4dJAKFom7oJyuexFX1Z/liyqh8/EG2Sr2RygV8XAxl5jCl5+2UcsgV78XnxGwBW5cvFkPQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=I94lSW7e; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QAQu03T+0Cw7dpCbcuwxezen/s/XSrGtmte1ESndrNA=; b=I94lSW7eO9pM4kQznheSZbdFP3
	ltXbmyborzLHNXgEnJyI4SvyrlK8Je1ERSESG3WQ1QQ5irVXY/Bv7Vg2NiZmtxVbenFszj8qJkRu2
	1EcnfFfWldy53MqD5z2aw3T3rMA8xj9yi8DKCr9dY0H7vxwDrbow/JVgbby0TpgrFQSQ7FXV1YSRX
	R3gQWbcgW8vcplpXHdhGwVgciawiiYaenacqPgwRn6RC1iYFTH7YLi/Ykb/VA/QhibnLHPbSOIOjy
	Iv4j7HiTS7kKodrJY0mxpIt/PCPoolF/kLUBNIiow1DvvecRzh8X+JXJMrIthHScWJZJO84hb4gNr
	7LgTJ2sQ==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uFV8T-008ZRS-HT; Thu, 15 May 2025 11:50:12 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
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
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v4 7/9] sync_file: Protect access to driver and timeline name
Date: Thu, 15 May 2025 10:50:02 +0100
Message-ID: <20250515095004.28318-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
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


