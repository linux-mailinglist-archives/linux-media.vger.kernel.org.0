Return-Path: <linux-media+bounces-11748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EA88CC62A
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 20:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A2E01F212FB
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 18:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A15145B20;
	Wed, 22 May 2024 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="PwQLBlMz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1DA929;
	Wed, 22 May 2024 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716401658; cv=none; b=Hvyp4wCcHqBqeNqbMIqbdmyX22KTIScnN+ZAF0C9twf4rr7nCLOrt6DWgnpf5VL7pYK5/SGRGh3CQro/3aKiSmVIMBYvnocfbP6KG4LzpV+M7fBBXv9abdddGTDsk7J42L7DqpzTDDHEeuKu4HCehQ+EhYSq30aoKDqiswvLLrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716401658; c=relaxed/simple;
	bh=RvVkosRpeyj9j/AnzllgMBKI6qNAPpxdxuaRh0mQIMs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=snA4ZSSxHFcPwsRbWzsZ/UXc9IjDOc42rMPSo7lXy/M/SRJtfDZzbDayHF6OFMz7P2jCB6o5lnxT6pkFCEedjpUr+bf6H7CXoFdpnqcuNXGBOIzEUnbE5YKxAyE+e+7lT0gi4aCUQUolgRsO8VZb3I2glVLQ6XMhEtPl73mQDSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=PwQLBlMz; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from fpc.intra.ispras.ru (unknown [10.10.165.15])
	by mail.ispras.ru (Postfix) with ESMTPSA id 000114078505;
	Wed, 22 May 2024 18:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 000114078505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1716401651;
	bh=Imz5WELE7gK/KIIyH94s3uVtNby+XXwDNZ6i3Up+9+0=;
	h=From:To:Cc:Subject:Date:From;
	b=PwQLBlMzotLiAng0Y2FrLpGSywzTylbdpLcYvuBEyzGO+5gnFrxHojCLr7ct+78VE
	 BzFqINVtD47vCYbX4L0MHhj+7MhSAVZOhRfwwYypmZcnRco90zR3GmuWErKqL3kiit
	 uPz6LmvIw3lrJaC0BWvQq+ZfGf9IAoLr+hDtmHC0=
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
	"T.J. Mercier" <tjmercier@google.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] dma-buf: handle testing kthreads creation failure
Date: Wed, 22 May 2024 21:13:08 +0300
Message-Id: <20240522181308.841686-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kthread creation may possibly fail inside race_signal_callback(). In
such a case stop the already started threads, put the already taken
references to them and return with error code.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
v2: use kthread_stop_put() to actually put the last reference as
    T.J. Mercier noticed;
    link to v1: https://lore.kernel.org/lkml/20240522122326.696928-1-pchelkin@ispras.ru/

 drivers/dma-buf/st-dma-fence.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index b7c6f7ea9e0c..6a1bfcd0cc21 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -540,6 +540,12 @@ static int race_signal_callback(void *arg)
 			t[i].before = pass;
 			t[i].task = kthread_run(thread_signal_callback, &t[i],
 						"dma-fence:%d", i);
+			if (IS_ERR(t[i].task)) {
+				ret = PTR_ERR(t[i].task);
+				while (--i >= 0)
+					kthread_stop_put(t[i].task);
+				return ret;
+			}
 			get_task_struct(t[i].task);
 		}
 
-- 
2.39.2


