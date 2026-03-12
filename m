Return-Path: <linux-media+bounces-55492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFt8Ia2usmlGOwAAu9opvQ
	(envelope-from <linux-media+bounces-55492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:16:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F8D2718A6
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32D0A305D4AF
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 12:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE4921FF21;
	Thu, 12 Mar 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Af8fjYJ+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231331DF26E;
	Thu, 12 Mar 2026 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317764; cv=none; b=QhZeWnKev3H8Dyc6sEgg4fryCsBpvpJzKxuQrn8EE3G6jm4XMKDU9e0e0ND5urekt6yFLEjjVpJ6DJnduZGp+Kfifpsi28Ok39ynsjWezIdkyS/dzbtcV+7J3m3xPQiWSVgzQY5ZOeUkJi8t1cQ3lK8tx5Al5H9sOPbNu70ooE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317764; c=relaxed/simple;
	bh=DPJnDdvkcI71JEwM7xlgTPDTft8Pz27VPtqaBDtOAbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipx9FmUgV5l8xny8CA4++BMPiD+RJbtn+P4K81XsZRnEPMEvbh1O3johbHhsTplMrjAblIt8/tBi7R8ThWYOPrl2p2UAi6V9CGAEmwsRmQxcJdEdh9Eq8rl7z3mZZ0Xtw/M2oI6xbwNsJwIRhso/6MHaHWVY1j5C7+VJiAnCyXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Af8fjYJ+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 769CE594;
	Thu, 12 Mar 2026 13:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773317689;
	bh=DPJnDdvkcI71JEwM7xlgTPDTft8Pz27VPtqaBDtOAbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Af8fjYJ+X24m5jCFTUyNjgJVVC5ayyFUbckFB3JCAYLYfPASJqPWTKvC1NH9LWEji
	 BqOON+Odm3rE2KPru9deLdah7wuo/V/Qh9WNUGdF6FRg7+n04cT6lGlr6zX00q+m93
	 sF6k+almTcMkZOw9ELC8wsaKuHvJGsCTgmwn1OJ8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 12 Mar 2026 14:15:28 +0200
Subject: [PATCH 1/3] media: subdev: Improve
 v4l2_subdev_get_frame_desc_passthrough() kdoc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-frame-desc-passthrough-impro-v1-1-30f64d637a3a@ideasonboard.com>
References: <20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com>
In-Reply-To: <20260312-frame-desc-passthrough-impro-v1-0-30f64d637a3a@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=DPJnDdvkcI71JEwM7xlgTPDTft8Pz27VPtqaBDtOAbA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsq57XXIe3jTwGWFasRFcNyNKJ/eBuTGdl2xs2
 uKyIDwf9WmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabKuewAKCRD6PaqMvJYe
 9RaYD/0efLv0qqzqvV/bfTtXaG1JSmbhfDk4GWvsm35uNzRvwsF3MFEu2a6roiMHk0VNsBtE9F9
 rpxWqHSjMvMkqQasiuSHNVZkFP0A8tGLf++F3vQ5nGy3cweeDw4yn/a9asSkO5f/n5e3eh5Gibv
 nd5uvn5ptJDzatbYx9gnKzG6xINPakXfNXdIcKVaLHV0H4Q+OyVvXDyZ9gC0FbJzmnMdIDC/Krz
 bfnSBvcgx6za3hDImhAFBimlj2ZIJ5FwH5A+gj57nlOU5/nm0qcdPAOyWCjJIuaANm5NLBeoGBr
 23cRMRy6S8nYsadCza7Fwcf5Nx+yXDHycJWc7zU6GPtSSCjisMDzUf4qYTJ/QQEwI15CxQCOtyn
 lPvn6asXbPLpEiMEmGnUN61Zkh7hMgL/vnL9SIlB2ALcvGm1OjXeS1opnDKFLrKgF/I0EcBg5B0
 VodjUqrjhahbsqIBBg7GZJj98a/GVS82g2xxI49It8KAWFrAxdQMlHZzcXmuDgyn45jT7XkArLf
 4xSxQgoOovaJYGoZ5CkC4BI/NZW8F9dPG/8uwUxUFvLYoJ2v6LrFaH8iONg79/W/nli5lqwDfDE
 +wFEauXdnXnClFqthzrTGMGScrQlpnyib4eQMnSKhMO3lWQ8nRcQH3habbV3ZX4CpF90eWkFYna
 wjqVjm5qimaHaQQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55492-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45F8D2718A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Improve the v4l2_subdev_get_frame_desc_passthrough() kernel doc:

- Fix 'v4l2_get_frame_desc' operation to 'get_frame_desc' operation
- Rewrite the body text to be more understandable and specific, and
  specifically mention the frame desc type handling.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 include/media/v4l2-subdev.h | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e754ed3421c5..23c03ba7f84c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1724,19 +1724,25 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
 
 /**
  * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
- *	v4l2_get_frame_desc operation in simple passthrough cases
+ *	get_frame_desc operation in simple passthrough cases
  * @sd: The subdevice
  * @pad: The source pad index
  * @fd: The mbus frame desc
  *
- * Subdevice drivers that only pass through the streams can use this helper
- * to implement the &v4l2_subdev_pad_ops.v4l2_get_frame_desc operation.
+ * This helper implements get_frame_desc operation for subdevices that pass
+ * streams through without modification. It can be assigned directly as the
+ * .get_frame_desc callback in &v4l2_subdev_pad_ops.
  *
- * The helper will call get_frame_desc on the subdevice's sources, create a new
- * frame desc which contains only the streams on the given source pad. The data
- * for each frame desc entry is copied directly from the data provided from the
- * calls to the subdevice's sources, with the exception of the 'stream' field
- * which is set according to the subdevice's routing table.
+ * The helper iterates over the subdevice's sink pads, calls get_frame_desc on
+ * the remote subdevice connected to each sink pad, and collects the frame desc
+ * entries for streams that are routed to the given source pad according to the
+ * subdevice's routing table. Each entry is copied as-is from the upstream
+ * source, with the exception of the 'stream' field which is remapped to the
+ * source stream ID from the routing table.
+ *
+ * The frame desc type is taken from the first upstream source. If multiple
+ * sink pads are involved and the upstream sources report different frame desc
+ * types, -EPIPE is returned.
  *
  * Return: 0 on success, or a negative error code otherwise.
  */

-- 
2.43.0


