Return-Path: <linux-media+bounces-19302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB5996285
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 10:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F5E282DEE
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 08:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAE818871E;
	Wed,  9 Oct 2024 08:28:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F86175D4C
	for <linux-media@vger.kernel.org>; Wed,  9 Oct 2024 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462489; cv=none; b=sbIKx2eZpkqzRVjp6neTjakypgYLxLr6hAuQYyUL1UGh1s7Hh5ZsfgDnuieYsxqYKjMM0ubaGabjyjX1Zi02F/cmzrfUPuRQh0/pSkAVIZns+3qBRMjLysEKr5M8nMGEEqS3rxsPSzOHeNQPhOvVvnecaw//ctduJO0SpZGUBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462489; c=relaxed/simple;
	bh=LdNObbUbbVq6E2QAvWkSVOrYBNOpjK3ADbvIjx4bGf0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hBfPXj69z7ADADzJMbg6XgebO+AGN62RgX1lIPQ7hSjnpj0nA8ak9IPBEVEGf4hiN8NNCQkIwPCwM14n0ubVx19q6xZoxMk6E/bf6lwxiWKdXBQpRVVlwv+alp0yHAvToJFmb37UiowOYDEA24BOi6K6s+XmcE/T+kjYY5+towc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XNmGR0v8bz20pbX;
	Wed,  9 Oct 2024 16:27:27 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 8976B18001B;
	Wed,  9 Oct 2024 16:28:03 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 9 Oct 2024 16:28:02 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <m.tretter@pengutronix.de>, <kernel@pengutronix.de>, <mchehab@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <cuigaosheng1@huawei.com>,
	<wangweiyang2@huawei.com>
CC: <linux-media@vger.kernel.org>
Subject: [PATCH] media: platform: allegro-dvt: Fix possible memory leak in allocate_buffers_internal()
Date: Wed, 9 Oct 2024 16:28:02 +0800
Message-ID: <20241009082802.1587618-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The buffer in the loop should be released under the exception path,
otherwise there may be a memory leak here.

To mitigate this, free the buffer when allegro_alloc_buffer fails.

Fixes: f20387dfd065 ("media: allegro: add Allegro DVT video IP core driver")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 73606cee586e..88c36eb6174a 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1509,8 +1509,10 @@ static int allocate_buffers_internal(struct allegro_channel *channel,
 		INIT_LIST_HEAD(&buffer->head);
 
 		err = allegro_alloc_buffer(dev, buffer, size);
-		if (err)
+		if (err) {
+			kfree(buffer);
 			goto err;
+		}
 		list_add(&buffer->head, list);
 	}
 
-- 
2.25.1


