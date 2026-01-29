Return-Path: <linux-media+bounces-51763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A6iC9oLe2k6AwIAu9opvQ
	(envelope-from <linux-media+bounces-51763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 08:27:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6BAC957
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 08:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D608301D338
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 07:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CE937AA6A;
	Thu, 29 Jan 2026 07:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="a0GblCtH";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hsDGf2TP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2B0379994;
	Thu, 29 Jan 2026 07:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671615; cv=none; b=Hxg6169gR6q+tNzhsugAoogsIjT7a+b6zLGtXmh0kqDZj1+9SKN9s8YIFY6Zze2JuiOqbTf83nc/sSy3kUkDxMrV8MFt6ryGRQjR8hLSaCLXn3SH6SuiaYd6L6xwGfTfVG1PrmF3JIyBQJTrMOD6u8FxpY4ens/XeLZpwIj7/Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671615; c=relaxed/simple;
	bh=zwuni1NIWLOUNldNum/29rw5wXcipncI+6TVU+dBqWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=io80jjqgF0BPziWTIuhm0UZBGYeDCDKSYURhIKRwh3RS8wuhLjEwm7T58tS6BXV1jgE6a9YaeeCf9lqNPUZ1L2+dtUe/fTGXNrlNuJB3AG9HqCTLJjDWOz73YaHlQ7nKEYcBzYlqy3RriHT/MQxu8pHs/h+/3WjldDYya11IjHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=a0GblCtH; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hsDGf2TP; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769671447; bh=Y8BIl+9hJvYS8GnIBuao9nC
	fnKSCoshmBlhJepfvE88=; b=a0GblCtH7y5x5Lu/BN3mDIkC/XKNh6+Q0V0oLRiK34jBcoBfs9
	O917E64yn0SX0QhcnxJ5Mk/w32IC4TZmWmPH9Y3VRnIcN027yyt52DZvFJHD+1z6ecsfH7+3ClB
	L/GYAPaEi0wzExVftOzg24jzllTvL9Od5fAkDUccxYcw1dMBfxePTz/uLXX1GOq3mYmK6y7fl1y
	yz14YtkRBkLzozBMmj+i8FDqr1A8BPQHzJmfKWE4HoC5+JxZXv1d0mKv74Keqtcb35IMHJP/eDz
	qVxDM/RQjhDT81qeA9IjC5HSOuF2yy0Z9tzc1aJYxPSG6ZASI7Gb3zxaZWaAajZf+eA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769671447; bh=Y8BIl+9hJvYS8GnIBuao9nC
	fnKSCoshmBlhJepfvE88=; b=hsDGf2TPwVtVsSdDadxMDpJXWljSAbjl9KvzP4fHHviEuodXbG
	0YXuV/bkOyGKxsfTP6L5nhk0wQVZi+oQu8BA==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Thu, 29 Jan 2026 14:24:02 +0700
Subject: [PATCH] media: rockchip: rkcif: Add missing MUST_CONNECT flag to
 pads
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNL3aLs5Mw03bzSnBzdtKRkg6RUE8M0C8NEJaCGgqLUtMwKsGHRsbW
 1ANmOIxxcAAAA
X-Change-ID: 20260129-rkcif-null-fbc0be41f81a
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769671444; l=2767;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=zwuni1NIWLOUNldNum/29rw5wXcipncI+6TVU+dBqWE=;
 b=wIYtmlfqWWg2ZFw0aeA6yi4Nwjk2B1O9WhYjf/CXk8eUng2Drp7i2s187kErrM01VmJ5gVnz9
 6oeeruMSQDpCIkM7O2k1A3nI+nAQs3f90h+rjygQO56JG64RmvqZnnX
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51763-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dang.huynh@mainlining.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:email,mainlining.org:dkim,mainlining.org:mid]
X-Rspamd-Queue-Id: 8FC6BAC957
X-Rspamd-Action: no action

The pads missed checks for connected devices which may a null dereference
when the stream is enabled.

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000020
pc : rkcif_interface_enable_streams+0x48/0xf0
lr : rkcif_interface_enable_streams+0x44/0xf0
Call trace:
 rkcif_interface_enable_streams+0x48/0xf0
 v4l2_subdev_enable_streams+0x26c/0x3f0
 rkcif_stream_start_streaming+0x140/0x278
 vb2_start_streaming+0x74/0x188
 vb2_core_streamon+0xe0/0x1d8
 vb2_ioctl_streamon+0x60/0xa8
 v4l_streamon+0x2c/0x40
 __video_do_ioctl+0x34c/0x400
 video_usercopy+0x2d0/0x800
 video_ioctl2+0x20/0x60
 v4l2_ioctl+0x48/0x78

Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
Fixes: 85411d17bee9 ("media: rockchip: rkcif: add abstraction for interface and crop blocks")
Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
The RKCIF driver missed MEDIA_PAD_FL_MUST_CONNECT, which causes a null
dereference when the stream starts if the links are misconfigured.
---
 drivers/media/platform/rockchip/rkcif/rkcif-interface.c | 3 ++-
 drivers/media/platform/rockchip/rkcif/rkcif-stream.c    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 523103872b7a..414a9980cf2e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -378,7 +378,8 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
 		snprintf(sd->name, sizeof(sd->name), "rkcif-mipi%d",
 			 interface->index - RKCIF_MIPI_BASE);
 
-	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					MEDIA_PAD_FL_MUST_CONNECT;
 	pads[RKCIF_IF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, RKCIF_IF_PAD_MAX, pads);
 	if (ret)
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index e00010a91e8b..201542b55f00 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -555,7 +555,7 @@ int rkcif_stream_register(struct rkcif_device *rkcif,
 	vdev->vfl_dir = VFL_DIR_RX;
 	video_set_drvdata(vdev, stream);
 
-	stream->pad.flags = MEDIA_PAD_FL_SINK;
+	stream->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 
 	stream->pix.height = CIF_MIN_HEIGHT;
 	stream->pix.width = CIF_MIN_WIDTH;

---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-rkcif-null-fbc0be41f81a

Best regards,
-- 
Dang Huynh <dang.huynh@mainlining.org>


