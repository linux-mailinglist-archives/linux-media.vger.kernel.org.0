Return-Path: <linux-media+bounces-56054-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ep7EvhFuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56054-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:15:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88E2A9AA5
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1407130E2A4E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEE43BADAF;
	Tue, 17 Mar 2026 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UgLMpIDw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CB33B6C0F;
	Tue, 17 Mar 2026 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749398; cv=none; b=ipuu9aa55GXNDYD7aq6hUQbQ2fySbgCeF4j43iDPlS4yT2vb5CWiJhW009C+ZndZ7gUfGMddBi6t6XHumaf67iKaZtMjP+FDIM59bBDJfDoJ1NKCwfj7zPu/HckmT81aMoV1d5qv32vg5ot4Raqj/UV5ZE9EEkhPBzrNO+b2LHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749398; c=relaxed/simple;
	bh=DPJnDdvkcI71JEwM7xlgTPDTft8Pz27VPtqaBDtOAbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vz/04rNOQw4KI45MThCDl1xUtddTRx4njGf8kRazp1Rg1/tieRj1I0GHFli69b/BiamCKk0HyDg5dDNqLCNfY1rh4l2R4Flc9hdxYkzAwgTIr0I4y1oLX2jYXkQuqV0tJAcrwT4PZVppke5CVDwaRb2WsrdU5MfDVFJBWFVGbj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UgLMpIDw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBD8B98A;
	Tue, 17 Mar 2026 13:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773749323;
	bh=DPJnDdvkcI71JEwM7xlgTPDTft8Pz27VPtqaBDtOAbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UgLMpIDwgWVPipn5/ZKC1TajoAC/++ZXvOa9SMg9SlG3QWLRPtSCs5njYAqu9z3fx
	 I2c0emUJkWSOxk9TcMON26kyG7JeU3nz3rQJ87qPqB3v3ICWdyb6V/46fDqvxS9MVx
	 L0bLm9vboIEOU5qMWxQF/1LiYeL/ULgKEGxNDx6E=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 17 Mar 2026 14:09:40 +0200
Subject: [PATCH v2 1/3] media: subdev: Improve
 v4l2_subdev_get_frame_desc_passthrough() kdoc
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-frame-desc-passthrough-impro-v2-1-0c93b437d85d@ideasonboard.com>
References: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
In-Reply-To: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpuUSQinFWxcl14dI2A/kQqWKZ/kZDSSixC690w
 P9pMOdcT/OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCablEkAAKCRD6PaqMvJYe
 9cWoD/wLkqDHUOh//2O+/9on2sJMnyg2yTOrUoltSjjfbiMrJEBFVJGTclxIQ6lUH5LeGHV2kiN
 C4HPhVKOjxHD3IV84KUfRuS3cx3E163/ZBDOhEoQrzCErH3M22J+Rultx9VGK3TiUXjhBdZyOfg
 SgXv3VPmZy2rzoXCo/rwxjzvCJ5iV8hE6JRHIxctdeM7h3QpDrHYOqdkYnQ0LYdW+oYVGeouhod
 Dy8w+SOQiStgiSdqvFChY22JvtWx24j2COV66ubjc+zf2tkTslYt+4uZGEpOarISS6gjoArg4BL
 Hy8/8qoYxNUUn2neYWdTFcBmNwrh2gtUFrvS2HepuAQu2VH2IWANzr1Mix+UXMUvv3xfMkYf1JH
 CgJk5HktWz1FL4eMm1LLns5lEE7NNJ+gDGAgYB3tbGBnnYS4gByCXIAcp/RT3CGR6cF8fGJZclt
 js0YB57mVPYqssbfnSzl/Q9SaEJGdtzofNphBPMMCeJrgAUaaL/Mn9VYirDGKKIzuXXpBb3U7y7
 iUHGNB2242roIg6Ftv9fvhVsW+96BksX5DiQN76Gw6tfFdnswGnErwlDgsrw8QVsnA4chVelLoG
 is9oJbgGNtDHSSqFXyUw/vtu5nWh1NqzUV+CtRPtGnCgTPDfnLmZIvA3XdWAohilysQxXi7FP+7
 nTRmZRh9CM5g/cw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56054-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F88E2A9AA5
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


