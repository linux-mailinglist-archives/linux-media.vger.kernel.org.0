Return-Path: <linux-media+bounces-57777-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMtgNZ+ky2mhJwYAu9opvQ
	(envelope-from <linux-media+bounces-57777-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:40:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4B36829A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AABC30D0CF9
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B36C3F87E7;
	Tue, 31 Mar 2026 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="beRnUmXf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8F53F7AA9;
	Tue, 31 Mar 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952897; cv=none; b=RGEE0q5U6JQRWBtk9Z36rZLp8dk7yJp3DsovLSF1VVSjFZ+/YxqNi2gpjxw1VojuFSpodFy7vGDh6rrvDT7PVV7Uu7MC+l74zmKLa2y3J4q0qJSAClubgo9M+nv1TbRduh0Dn3eQqCOm1n88AXp8dISEcZoLKh1U5xUb3vEmax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952897; c=relaxed/simple;
	bh=87fafp0Vs8fZ27geephEAz0Fiq02SSizNzQI7pKZJgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlRoU4WN/2+ojnvJycxK7F1PBD/ERzje3kh4SiC8YgM4o8+WM1zSLWDzlO5/uLSLKwjN9kFSJNE33VqU2aNU46btrSgv9LQCb+s5Cgr78xSmYm2bPnGaaKM5ptJNueSK7EAwZ7Ax2U+8eNJ2uAp1l8PuASjNMZ6vscvAqFKn9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=beRnUmXf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [100.93.44.16] (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D66FE1E29;
	Tue, 31 Mar 2026 12:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774952802;
	bh=87fafp0Vs8fZ27geephEAz0Fiq02SSizNzQI7pKZJgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=beRnUmXfQf+ciqcEmkRimyoIg+QLIF2Hus7c/q1pQ3K7C2CC8TrJcQsNU7mVy8X93
	 lp7h/DJLsw6iAyADSzXenoZ60A41PAswaUJRPpAx9+Tas6b99ce6AX+DHj48ID7uwW
	 tgPHEHTVJDlKRgoAYwqAcZpaM0FsFFp8yHN4ILZ4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 31 Mar 2026 12:27:44 +0200
Subject: [PATCH v2 14/15] media: rzg2l-cru: Remove debug printouts from irq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-b4-cru-rework-v2-14-f94b238b35d4@ideasonboard.com>
References: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
In-Reply-To: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=87fafp0Vs8fZ27geephEAz0Fiq02SSizNzQI7pKZJgY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpy6GpvldPIgS+xTJ7wqWEQkM3y7iVVzhcFovSB
 pzItrRfu/qJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCacuhqQAKCRByNAaPFqFW
 POKgD/wI1TrMF3NGne+61Fsjm+uF8UrCjBTCaNR6XJQM9E4cILj0Poz26ZFNYW+O/2ftz+n4BVh
 G+2s8EVcRv8wAkCrJq7rtVhqMS0M12fCprXHqAlGH/6up347AYTuv0SQevlS+NLiSKgc7cPTO0t
 +xm6OlPV8mPifU0p9aNhGRHb9EHgKnDVPvaJFEXfxIsBECFqlJJl4dMG+DyIvzvfvsCoB631SpP
 tSWhicn7Jtszv3fEoOTYSH+8ylMN3UIdvocogu4mVT5qm+63UsIIr/EvDbZbzpxv6lVtXJSiRGD
 V+I6E2Dg0A4gzlhGbYyVVNZzVvWvhvF5o3qePxYa4z6iFALVnFlAYLd3fG1Ps5z3sOLy5vCTqQp
 VB2BuFzHeXYe+z3CfbpUgZvU+sq3EHqz9J+wOSqO6Lo0BdRZiLOmwB97LcekEnEAxmzMeELLd8m
 hWMmQAdpj+1f07yweUccMkyhk90zhLO4rpee8JX5KFKKijxY99cZP86XmWXnKS9pSOUXsJOXZki
 yiIKPU6L4shzNA6EUjmpPi7pGVE1gdnlHUGXJBwKZORB4Mw8gtA4OSHh29dObNmBAfo0ep0Zddz
 P2n1QlnSMV4Ny7Wd/MvAUwj/ByATsCl9gW3Sg/SvDo+KCIU1gRnPk9jEaOT9F+QBEq3sRP9CDqr
 WLezk9D2CBD3TaQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57777-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,protonmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32E4B36829A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using dev_dbg() in irq handlers to debug per-frame events is marginally
useful and possibly not the best idea, as using printk-based helpers
introduce latencies that impact the drivers operations.

If any tracing/debugging has to be performed around frame events
in interrupt handlers, the tracing subsystem offers better alternatives.

Drop dev_dgb() calls from the CRU interrupt handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 721057edca6b..e2073cc1afc6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -627,9 +627,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
 				VB2_BUF_STATE_DONE);
 		cru->queue_buf[slot] = NULL;
-	} else {
-		/* Scratch buffer was used, dropping frame. */
-		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
 	}
 
 	cru->sequence++;
@@ -656,8 +653,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 	slot = cru->active_slot;
 	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
 
-	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
-
 	/* Capture frame */
 	if (cru->queue_buf[slot]) {
 		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
@@ -667,9 +662,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
 		buf->vb2_buf.timestamp = ktime_get_ns();
 		vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
 		cru->queue_buf[slot] = NULL;
-	} else {
-		/* Scratch buffer was used, dropping frame. */
-		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
 	}
 
 	cru->sequence++;

-- 
2.53.0


