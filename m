Return-Path: <linux-media+bounces-11727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B408CC12D
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 14:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83A8C1F22DAC
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 12:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79818287C;
	Wed, 22 May 2024 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="HAL+jQ5B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7F13D623;
	Wed, 22 May 2024 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716380687; cv=none; b=DW5phyaz4qsXByP68FyKbRNDD3YjNq6QB+1Lvzwog+l3p6OppM7HNCUXx05XxMV/gDgo5Rk1BqUwNznvKxlNLV8LT/gTtO62JDUqmB+lpU3zAsDYmYWNmqzZr6c1MTb2Y7ZgMe/X10o48CDH+9evVgmHovKbaiYNCmVzzjFfVYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716380687; c=relaxed/simple;
	bh=SbgR4B/8IUmHI5DK+/2w/6ZWjC7dExfDIqXUiYTONlA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cg9riUT0vAfeE9gQA1AjdDVvTGxS3l9iegO+DnZAmLwzETioHjBNv7pySOBZtiExgKIfykly9zyxKZ/ltP5EVT9oZYHNAKVZbEF613udFX4woKDzHhgcld/evE07dz/qPCJJIfYNSTxH+oUg4e/IKTnvEjI70p+gJf3TR3jo/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=HAL+jQ5B; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from fpc.intra.ispras.ru (unknown [10.10.165.15])
	by mail.ispras.ru (Postfix) with ESMTPSA id C31C74076723;
	Wed, 22 May 2024 12:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru C31C74076723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1716380681;
	bh=rUu2N2ra3UJOVujeAUs8p16HRSJ3CxlvSQFgHAEciJQ=;
	h=From:To:Cc:Subject:Date:From;
	b=HAL+jQ5B00d6NN5gqADYkmUDvs/AwYoXznpBcLvjjuk5ceUT40KCjExf2AMX94rWg
	 qJS4NzODO20uMm0SQfeqo5JHLEPRZfgfR40ez2S52YcR7YBOMm5qqqT2XIVCQvqsQB
	 d5S34/eA0XruF8UaVr57Jem/4C6SHQTdM6IMHHMU=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] dma-buf: handle testing kthreads creation failure
Date: Wed, 22 May 2024 15:23:26 +0300
Message-Id: <20240522122326.696928-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kthread creation may possibly fail inside race_signal_callback(). In
such case stop the already started threads and return with error code.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/dma-buf/st-dma-fence.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index b7c6f7ea9e0c..ab1ec4631578 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -540,6 +540,12 @@ static int race_signal_callback(void *arg)
 			t[i].before = pass;
 			t[i].task = kthread_run(thread_signal_callback, &t[i],
 						"dma-fence:%d", i);
+			if (IS_ERR(t[i].task)) {
+				ret = PTR_ERR(t[i].task);
+				while (--i >= 0)
+					kthread_stop(t[i].task);
+				return ret;
+			}
 			get_task_struct(t[i].task);
 		}
 
-- 
2.39.2


