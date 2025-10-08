Return-Path: <linux-media+bounces-43946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F43BC4385
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 11:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133FE19E136E
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 09:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA35C2ED14C;
	Wed,  8 Oct 2025 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NyufwLc5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43092BD035
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917330; cv=none; b=JZoZKqTImpgCHf8FpqpyaojbFmHUwo53Y3Ygpn+3KnagfLxEHKn5jRY+J9seDDgXHxPeNJphN7SHE5Hwxs+finffJv2x3j2Tj9aoEe72iP3TG0tVOi+QYJI2o6u29K5zE9msqQyQgiVUBOChn4jO7txAgHVc+3nzXdAWBhO/q/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917330; c=relaxed/simple;
	bh=yAPQFScdkemAi74z1fCGIx7wAUu+JOFcrFBMSirymGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXJwfZuCXwleuySy/Gcr0e9MrLkyEjh3QbZNc7EZ1fVg11NptKb1+fj0508CWESjYQwbdn/dYSXUNEZJ9Dz0JARbJseyaf6NeefOvwXG1ST5WBzg+Ie26K6ir16yUh91KYDFlHCspPtl+NB68ZbBHpEyY8kasjs8DOcrin+yGUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NyufwLc5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C2C7B19C4;
	Wed,  8 Oct 2025 11:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759917232;
	bh=yAPQFScdkemAi74z1fCGIx7wAUu+JOFcrFBMSirymGA=;
	h=From:To:Cc:Subject:Date:From;
	b=NyufwLc5XQNuvi1UTE1a+CTf42dCRhTTrpfOVANt7ORSHlfrnvj4s9TfhBZKfzyn7
	 NMbEh2IXR4M0K9VCHQ/jFShZ8I/UToJlUNPruV8E2Zp24U97ERFEaIHhLGAKZejrmz
	 DpoegVvJKChShMlAVLWmFKPQ2foZZ9RFBYbaCmvM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] media: v4l2-mem2mem: Fix outdated documentation
Date: Wed,  8 Oct 2025 12:55:18 +0300
Message-ID: <20251008095518.6257-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit cbd9463da1b1 ("media: v4l2-mem2mem: Avoid calling .device_run in
v4l2_m2m_job_finish") deferred calls to .device_run() to a work queue to
avoid recursive calls when a job is finished right away from
.device_run(). It failed to update the v4l2_m2m_job_finish()
documentation that still states the function must not be called from
.device_run(). Fix it.

Fixes: cbd9463da1b1 ("media: v4l2-mem2mem: Avoid calling .device_run in v4l2_m2m_job_finish")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/v4l2-mem2mem.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 0af330cf91c3..2e55a13ed3bb 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -192,8 +192,7 @@ void v4l2_m2m_try_schedule(struct v4l2_m2m_ctx *m2m_ctx);
  * other instances to take control of the device.
  *
  * This function has to be called only after &v4l2_m2m_ops->device_run
- * callback has been called on the driver. To prevent recursion, it should
- * not be called directly from the &v4l2_m2m_ops->device_run callback though.
+ * callback has been called on the driver.
  */
 void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 			 struct v4l2_m2m_ctx *m2m_ctx);

base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
Regards,

Laurent Pinchart


