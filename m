Return-Path: <linux-media+bounces-52323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HWHEKwthmnkKAQAu9opvQ
	(envelope-from <linux-media+bounces-52323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 19:06:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFE5101A08
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 19:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EC1E3026150
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 18:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A05426D1F;
	Fri,  6 Feb 2026 18:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B9ioeUFl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338E5392C51
	for <linux-media@vger.kernel.org>; Fri,  6 Feb 2026 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770401175; cv=none; b=Iec+WgVhdYETJfnFiobHMDEX6KT7fAPX0P63JsA+yOjQW+fWX8no7YNDnQ3H9Hls3VPUgJ843gNGT/PC80hJVXZPR7Y5GUwnAkmm3SVZ3kwjTWGTO6Y+bSETkhMx/97fS36EWOzjax3yECBs+fTJl2L0yWl5Z6EGDi8PcQgKBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770401175; c=relaxed/simple;
	bh=C+TfAnkwxVqTsDVT84puZfL0sBcDUrbQyEh/s62T/84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y4OfuLGglEYfZVkKaF8IkWY+lGyln+lnajtht5TCs9UmA4MP9smQsjELY8VQlI5rIyeRvmOw0vCkbc/3dbYqNWzpFlCTn0hmVi13TtoAv9jAtdgNJ38JwASbOCaKp0aveW6IwVC9EGF7IkQXPzysBmkU6Lr220xnH2JtFu9iq/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B9ioeUFl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pb-laptop.local (185.221.141.206.nat.pool.zt.hu [185.221.141.206])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17AB4596;
	Fri,  6 Feb 2026 19:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770401122;
	bh=C+TfAnkwxVqTsDVT84puZfL0sBcDUrbQyEh/s62T/84=;
	h=From:To:Cc:Subject:Date:From;
	b=B9ioeUFlu5gmddYAvP9AymQXJY5V9pYTgeJ8n1Wh+YUn23iAtsoZ1nTQF21ndHkAL
	 lcYwIzg7384gjfNmo8aCPWGuVV1SxusXK8TTc8KZYxBOlBq+Yg42G/Dg5ZgyzE4rzd
	 fMzjt0+HvYIIp0oMP6mvDG9psNJ7kb95RGtBsouc=
From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Subject: [PATCH v1] media: rzv2h-ivc: Fix concurrent buffer list access
Date: Fri,  6 Feb 2026 19:05:40 +0100
Message-ID: <20260206180540.3195294-1-barnabas.pocze@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.39 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52323-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.pocze@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FFE5101A08
X-Rspamd-Action: no action

The list of buffers (`rzv2h_ivc::buffers.queue`) is protected by a spinlock
(`rzv2h_ivc::buffers.lock`). However, in `rzv2h_ivc_transfer_buffer()`,
which runs in a separate workqueue, the `list_del()` call is executed
without holding the spinlock, which makes it possible for the list to be
concurrently modified.

Fix that by removing from the list in the lock protected section.

Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
---
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index 799453250b85..b714c32f72d6 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -152,12 +152,11 @@ static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
 	scoped_guard(spinlock_irqsave, &ivc->buffers.lock) {
 		buf = list_first_entry_or_null(&ivc->buffers.queue,
 					       struct rzv2h_ivc_buf, queue);
-	}
-
-	if (!buf)
-		return;
+		if (!buf)
+			return;
 
-	list_del(&buf->queue);
+		list_del(&buf->queue);
+	}
 
 	ivc->buffers.curr = buf;
 	buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-- 
2.53.0


