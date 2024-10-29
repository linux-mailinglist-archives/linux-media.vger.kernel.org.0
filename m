Return-Path: <linux-media+bounces-20528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D5F9B4A18
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019AB1C227EF
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE12206953;
	Tue, 29 Oct 2024 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TTmcaCek"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F809205E24;
	Tue, 29 Oct 2024 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206046; cv=none; b=XgsEBNTB4dZ2gb3JEi9ZszaQWMR1m0YM+cEiU1Ssju1qeWNIxgKws23xCyCTgqhVs728/f5Kk9Uay863V8mwgJI0+GJTXT8vbyggidJTi76ByS2oJb6PC7NCV32d4K2mfrqWn6CWBDEkeoc6E+vlqhEMu+iY0GaO8nRXjHt8yvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206046; c=relaxed/simple;
	bh=b7xJkOE//Vp3vaIQy1pLV0TNulURIj4a4ZlfWYe73S0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=caI6vnUbzkz+WEjeNDAb3fkWvC4mtpSOOTeuC80Y2/mg/lI3DKWbNSNRixPTrFgZGaUbx/VzQdlw75tY9sOoO6awHL0806qkM8paDHORcI5p+BMkRzZeLQ5IKH1Le1ZSWmJkYwaHzXs/ZcGbT5UPgBWF1LbeOyCkc2K2WwdqXtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TTmcaCek; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 228A8AF3;
	Tue, 29 Oct 2024 13:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730206040;
	bh=b7xJkOE//Vp3vaIQy1pLV0TNulURIj4a4ZlfWYe73S0=;
	h=From:Date:Subject:To:Cc:From;
	b=TTmcaCekGbWbKFStwDNEeYBf9fe1HUg6S35qvpMI+ccJdyq775g1iakGJrZV/LJ43
	 npZ7GC8ubBdTBk21gB9tpv/+cqr0FHQ08OeLeY1aN3E3tDaiCUy5rZX3Xx66YQbjDc
	 xv6UxJTRc//zi/r1zzQZZPF83XcQJ5xBXS/+XrvA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 29 Oct 2024 14:47:05 +0200
Subject: [PATCH] media: raspberrypi: cfe: Fix min_reqbufs_allocation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-rp1-cfe-fixes-v1-1-49f04cc271f5@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAEjZIGcC/x3LQQqAIBBA0avIrBvQSQi7SrQQG2s2JgoRiHdPW
 j4+v0HlIlxhVQ0KP1LlTgNmUhAun05GOYaBNFmjyWHJBkNkjPJyRU2LdjR7is7CeHLhP4xl23v
 /AHvacJJfAAAA
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=b7xJkOE//Vp3vaIQy1pLV0TNulURIj4a4ZlfWYe73S0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnINlWrR/eAjTlsUaqmJrF5eKC6qW0AqzC/UCQg
 XmD+reWQYCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZyDZVgAKCRD6PaqMvJYe
 9eBaD/4gRy1ykIiT9zE7t8pxIgj3p9RbSB0kW7jYb8iqaG/Efv769oxRw0DUVOb3mz64oPU1I7s
 TT75twqZo3Bg+h80Pi97YSs7N8u8MMUL4zSvr814/ZHE44HWOfU6VnV1JI0JssBQTiZWt+Qwnsn
 HGry7e2vSMRP3JpYQYtS3QVhIp6xw7j7x7Rago8rBe0BEW7qoqqI2YdN2LM/7gtd81F/lcJLn8W
 rXH9EQfaUHj1QeW+aTDxAFTd6RRPg67QfPU3zNcZ5TWBRYN9JgC5PdcOo3DteFRayLh1M0YJAmv
 jQDnhSh5yGpfQj/RMW5CV/ZdPyuziLlLv0lS9KtXf4VhS5SXM5WDZqd6hWmlWxO7ETMLJ9z/7xj
 AuTeB+oQNDXq/75DUqNJfWLH7xIgPXvYYd5pdgVn4rQytg37jwIjjvGV4BXHikxuWIGNf5rn+7u
 4lXFi9lEgMbykzCvLDxpAxyBPKVfb266IAgB3sKE8C/28D5HT9LaulvhL13X6YanuwQ7XfwVVvl
 qyHiHn8HAKvrlm10o5N1N79ZhnTL/x2+n6vCkc8DUbDNaSt1EqyUmR/KztM4VGe+P1bIY/JjgHR
 4dSRAZjiqzV9NPQN5RL+6GMDW+mpMdXFMw9T4o28AphlZ/PkKFDQV0v/UMmfGJTsv6EODLktblg
 3G4PmfCUk2d5cNA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver checks if "vq->max_num_buffers + *nbuffers < 3", but
vq->max_num_buffers is (by default) 32, so the check is never true. Nor
does the check make sense.

The original code in the BSP kernel was "vq->num_buffers + *nbuffers <
3", but got mangled along the way to upstream. The intention was to make
sure that at least 3 buffers are allocated.

Fix this by removing the bad lines and setting q->min_reqbufs_allocation
to three.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..65e9c6d23416 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1025,9 +1025,6 @@ static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
 		node->buffer_queue.type);
 
-	if (vq->max_num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->max_num_buffers;
-
 	if (*nplanes) {
 		if (sizes[0] < size) {
 			cfe_err(cfe, "sizes[0] %i < size %u\n", sizes[0], size);
@@ -1999,6 +1996,7 @@ static int cfe_register_node(struct cfe_device *cfe, int id)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->lock;
 	q->min_queued_buffers = 1;
+	q->min_reqbufs_allocation = 3;
 	q->dev = &cfe->pdev->dev;
 
 	ret = vb2_queue_init(q);

---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20241029-rp1-cfe-fixes-0270923a2f94

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


