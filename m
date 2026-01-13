Return-Path: <linux-media+bounces-50564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB66D194E5
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 15:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DA19308F172
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0962392B93;
	Tue, 13 Jan 2026 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VjB/GM71"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771DE392B8E
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313102; cv=none; b=XyioSUeCUUQAh0d0In0k95iHlCekz8T+oHDg5e9jxWDiK+wyTvn/wbfjNUySScAMXldHzhKEhzUwWDZJnYdteoE4LkzTSvm2BY49O4jcyEMPZpkJm+1+SHptEq/jysTsMSlKdmwTZitFYpEgiro3F2UDNW22YYe5spabE9tyJqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313102; c=relaxed/simple;
	bh=BtF8M5GNbyGfVQK6YPDvinM4wdUKCO9L2UbWnIhUM9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XtvurBrznGRb7dM+agx3n5frCxhvhaCG26fWj5bcDNpqy4XHh5GZ/iL7+sIB5V+cQj6aGRp8pqBOiE6F9riQ7AyJxR4e836OGqK8Av+5wL5xjDmVXRyZz6KL4aHTMcFfkdLr5RxOobGBUtQ1duN7vvChiZlleC6fbWGID9PDUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VjB/GM71; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so72858235e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768313092; x=1768917892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p84fI36fdNfKK4nFeHfATGotDZ4IBurD5TkPYZOWVOY=;
        b=VjB/GM71Gh/2Ba4F9EOFVlDeinsukcJJYUiet9TBldbi/zMZTbne4o4nk33iH/86Tl
         fP/ZMTl7jC9MpB/ayzyfzL1t8NkxHFTR80X7PoafSpfC6cxrgIymWSlw2IGOZbqnJT+b
         xZwjJLUVFhRCm5yq0Lm3qYdPjZym4w6v/By01FmMbftgHxctIFJ+ZLceJCbXIplZOuFf
         vmTSkWTKz4bCDA/WPQurDzGd15ArJ8regRP86nPRAkhVkxCWnKAcvBbTQa7kLzM1Gzwy
         +7Q2jWsg42BPSnCFk84z0IXhg3P7zz5YZvk33tVOPDDv9J22uPnG1rtDcr3Fv6eFZwdX
         7sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313092; x=1768917892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p84fI36fdNfKK4nFeHfATGotDZ4IBurD5TkPYZOWVOY=;
        b=Mog0q9I3USKI2ApfaGM2suK6DUeQs1wG9IAHd0oUJReoVdjw+PPh6pvMtfYvidyDk0
         2YUIwI93APOshrQducY8HfJxY62VEP5BNdVybjp+AFSu/QQBrINaY6UwbZijEkwBMLnC
         u5nOAX7NagJhf6vFNorOiax7hXnZfmwcAI7j1ouB3EMGpFxjsUn3g3RWnOLb9eibnQPC
         Jx0zR0n+qz9thG6q6rzUvjEH21vexEY3z4WQQ2a1mA6LLpA6ThrQ0Rw3xpRuUtO2Dbjx
         dfWXP8PZXy5V9Qv3FHLLVMb6Tlubn6XYaKMRj6rTsCav+Epuc5sF2HBYb2TUiIruXqdZ
         16lg==
X-Forwarded-Encrypted: i=1; AJvYcCUDThdQkfiHQqTjzHCrbYQNqjFjV6DHSbVuJywD7WD1ATd8J838JJliZuN09kY3pIZLm+CeVlEAOG7J/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9xpYiDfRk81nHc0D5dzSWeRBn0aMbdsEPCQzDQNEPtVBTfaU
	4+TDcXvR84CNOK7GfEhWKHsglaR5unXdZEt0ENZQabxYokWAlcO2uxCs+I1G+1mvrlA=
X-Gm-Gg: AY/fxX5pkfQqbM4w08/ykcW25xVr1ewJMtbSqB70wuFxUC4D8IUdGb3+441+n92XA2+
	RxsNBRmpvRJquO56eyIEqtIrOmSDc0ovlkaoE0G3qikZJZfZeohDCpRQIOF46eLhIvMOwajEaKl
	n0YBfjwCkvrK3e6TTw3llBf8cFg2ETooRbtvt1YF/JfApQQAoNag6BhD7Qj9vVLh2wfptOqvh4j
	1AGG1NQWAnFzFzCys96bYUIZpB8WSwdpdhwLpM361IutToEpo2WaeUMebZVWFJqoEmsUqqDpnps
	6PgTj3+OcYeNvGM+JXgxC/ZgNrj/PytDrtkjsBRIR0XzORhE9q/tw9ICGJvhHUHLzelDb2NMmmK
	MVp9UBkACkoL/v7Z/wJABXxqWLszpj7ZIUeWNkm3cN+rimT9YbOyAD5vkcDuq+CnEWKOyedaHYl
	WcVUSMQxS5YVYiz+UhPaMBNuc15ZtbZM0wXVo=
X-Google-Smtp-Source: AGHT+IFy4jTuYvAbeRYENjCXYaT+C8Fdb5qR7XUNs3xUqAIMubhbGLVu9HHf26Og6SEebDy9K4MJFA==
X-Received: by 2002:a05:600c:3114:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-47d84b18954mr216480705e9.2.1768313092453;
        Tue, 13 Jan 2026 06:04:52 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0b45b8fsm1421975e9.4.2026.01.13.06.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:04:52 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: platform: Add WQ_PERCPU to alloc_workqueue users
Date: Tue, 13 Jan 2026 15:04:46 +0100
Message-ID: <20260113140446.196930-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index 799453250b85..e3ff0482a84e 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -445,7 +445,7 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 	INIT_LIST_HEAD(&ivc->buffers.queue);
 	INIT_WORK(&ivc->buffers.work, rzv2h_ivc_transfer_buffer);
 
-	ivc->buffers.async_wq = alloc_workqueue("rzv2h-ivc", 0, 0);
+	ivc->buffers.async_wq = alloc_workqueue("rzv2h-ivc", WQ_PERCPU, 0);
 	if (!ivc->buffers.async_wq)
 		return -EINVAL;
 
-- 
2.52.0


