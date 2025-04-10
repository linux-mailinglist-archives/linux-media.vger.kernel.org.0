Return-Path: <linux-media+bounces-29934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658EA8471F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 16:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 157D81B832A9
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826CD28F947;
	Thu, 10 Apr 2025 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WONdSUJ8"
X-Original-To: linux-media@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE928D85A;
	Thu, 10 Apr 2025 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296805; cv=none; b=BFn8shiaWYuZJQlwz+/kzpBJgZQuIZ/GdpyRdWixHL+GlbFkFC/1IpWCtckF20Z0qAwDhcgSDiiz5JVIbEmrBNNs59Z2asYkTX7/19zsVGKYNBaRXqEuNJhVkADfFLGqL4GVxIPrEG/X1Oea2uobkz/ylJ4ZPtWEdsBHdgGTlLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296805; c=relaxed/simple;
	bh=FpIZhlP8ULP0B25MCE8nJ+5mq3B1u7rae1SKoMTHdrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTq9YeJ0rFDCBTG50zbhP2B2EiF+oNEFu8glpUZz4fm1Y+qRQUtSuczmx4Be/O2AXzVLiXVcOj3unQnXzTpuGQC2KyvGd8JJ9czHZLfTFtGTUptvcln7JpJ9BOl9OqnoTDSO+9CsouSP9rTQbCl6C9FeRKP4WxEVnT6z6bv7tXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WONdSUJ8; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B06944340;
	Thu, 10 Apr 2025 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744296801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4BA7fAejlBY9PaU8OYnulpA//8kpOAI95crSo0/NRU=;
	b=WONdSUJ8hAGugdtpL9o6dJ72PwX4ERue/6AhJdlPgrdf8BZlwzcP7lHvl43EWtwWNe7NKf
	CItQ6N5oWCZBFZhVTd3eWTa50iQeviBTw5mc1XgEVijV7HhvFAI5CUWxvZRD3lVwAkp9AI
	U89xIk/qFghdV8dJAjt8Wuefj3ddKtC6RVffHEO9Wg5ZtOqOPo+mkW3eTNVt3A0T217rJo
	rF4rGJe2f/+QDIoRPbyYrQGiYnQBhCnty2xEmXjZDzUn52m2l3wke/BQJyOrZhqWV83kzo
	HxsTAhOkOb1BIHp3+LBjUA1n7Nv1ikRc8Vn4m2nITwrQypcRJIf7U4t5y1/4mQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 10 Apr 2025 16:53:18 +0200
Subject: [PATCH 1/3] dma-buf: Allow heap that doesn't provide
 map_buf/unmap_buf
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-uio-dma-v1-1-6468ace2c786@bootlin.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
In-Reply-To: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepuegrshhtihgvnhcuvehurhhuthgthhgvthcuoegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtvdehfffgjeduteekgeekuddvffejueevkeektdeggfetkeeghefffeehudethfenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrheegngdpmhgrihhlfhhrohhmpegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomh
X-GND-Sasl: bastien.curutchet@bootlin.com

dma_buf_export() rejects the creation of dma_buf that don't implement
the map/unmap_buf operations while these operations aren't needed if the
buffer isn't shared by the user.

Allow dma_buf to be created even if these operations aren't implemented.
Add a check of their existence before using them.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/dma-buf/dma-buf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b855156516a0a766bee0789b122473efb3..398418bd9731ad7a3a1f12eaea6a155fa77a22fe 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -631,8 +631,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	int ret;
 
 	if (WARN_ON(!exp_info->priv || !exp_info->ops
-		    || !exp_info->ops->map_dma_buf
-		    || !exp_info->ops->unmap_dma_buf
 		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
 
@@ -796,6 +794,9 @@ static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
 	struct sg_table *sg_table;
 	signed long ret;
 
+	if (!attach->dmabuf->ops->map_dma_buf)
+		return ERR_PTR(-EINVAL);
+
 	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
 	if (IS_ERR_OR_NULL(sg_table))
 		return sg_table;
@@ -1002,7 +1003,8 @@ static void __unmap_dma_buf(struct dma_buf_attachment *attach,
 	/* uses XOR, hence this unmangles */
 	mangle_sg_table(sg_table);
 
-	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+	if (attach->dmabuf->ops->unmap_dma_buf)
+		attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 }
 
 /**

-- 
2.49.0


