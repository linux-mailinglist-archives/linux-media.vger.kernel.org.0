Return-Path: <linux-media+bounces-19548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A590D99C310
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 10:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B1DD1F262EF
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 08:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC1517ADFA;
	Mon, 14 Oct 2024 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sTMTFJFG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YiXTsO3q"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4251158558;
	Mon, 14 Oct 2024 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894174; cv=none; b=VeDxXFnY/g1RtXQh1ruTKp0zTyblqlLgP6i0TXPCRbuO0XTlnRxS3V3wbqzPngHX5GulkhDbsDJQcsC2jjl3cxU3wYuMn77XCaS5tgvp7zVcG5jUi/N4tvwln/6N3NYh00bFI/A25GJ6u9Nc3rn8qsqJmvhxmtpdriJitHreSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894174; c=relaxed/simple;
	bh=bzBoPBXvgGgBceKCBKqe7YKjn85sRsKmpKifY22AX2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVLMmM7TY5epvz6OunAVuQTZ4vVxHgRLqYXSXHO8UTCy2blbyDGbklhlEq+3naR7v/fIqUMNdQtRY8BQNSRMssJ2jcGG6SPt0AYdaZ+wdaWZ7iUzO7jNa9svuFuQOAOirj0iFNaldowkL+PjVQvr7Qadqnk97ySA7EfozjhUXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sTMTFJFG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YiXTsO3q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728894170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kNRLICfcMX53Pl818PecpUhWq4UAyd0n3QQSNiHMS0Q=;
	b=sTMTFJFGvylVpObZzdv1qmknTg52pZ48YWiroJTZicX+jQy1Mlt0Nwy4njse3ScvsitBPN
	AarLq6u0hB7vf/sWLsDpPRUwWhPjaaUfsKuxH4QzSlaIYa2GRhvZ8jn7lX9m0aadfwvU4/
	r/swaKR5jNTOAIjSbgs2jtN8WnxgN51MlifUV8KxK0Sf+2qxEOIiABHiYuqRWNqNoFXcpJ
	5FbJ0AXPMhESnvenWqkAtuZ+/XiP4TvWNm24LGiK4v7SFBWPjXkoMFT80ibjuPZpjjNx3S
	990cpnZFVbHZmQZJpWxuwnUePpRA0XkSpRYeXyu2gyUhOoYw2pgWgfACEt8fQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728894170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kNRLICfcMX53Pl818PecpUhWq4UAyd0n3QQSNiHMS0Q=;
	b=YiXTsO3qLxn3vTSHXPfgV/b1ytZOM/RZ2M/bSg5i6/5WqHxHq3X2mwyl7+SxU5Ckqvkxyg
	waDWkAxliFM0VODQ==
Date: Mon, 14 Oct 2024 10:22:31 +0200
Subject: [PATCH v3 14/16] media: anysee: Fix and remove outdated comment
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-devel-anna-maria-b4-timers-flseep-v3-14-dc8b907cb62f@linutronix.de>
References: <20241014-devel-anna-maria-b4-timers-flseep-v3-0-dc8b907cb62f@linutronix.de>
In-Reply-To: <20241014-devel-anna-maria-b4-timers-flseep-v3-0-dc8b907cb62f@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
 Alice Ryhl <aliceryhl@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 linux-media@vger.kernel.org, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>

anysee driver was transformed to use usbv2 years ago. The comments in
anysee_ctrl_msg() still are referencing the old interfaces where msleep()
was used. The v2 interfaces also changed over the years and with commit
1162c7b383a6 ("[media] dvb_usb_v2: refactor dvb_usbv2_generic_rw()") the
usage of msleep() was gone anyway.

Remove FIXME comment and update also comment before call to
dvb_usbv2_generic_rw_locked().

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
v3: Remove FIXME comment completely
---
 drivers/media/usb/dvb-usb-v2/anysee.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/dvb-usb-v2/anysee.c
index 8699846eb416..bea12cdc85e8 100644
--- a/drivers/media/usb/dvb-usb-v2/anysee.c
+++ b/drivers/media/usb/dvb-usb-v2/anysee.c
@@ -46,24 +46,15 @@ static int anysee_ctrl_msg(struct dvb_usb_device *d,
 
 	dev_dbg(&d->udev->dev, "%s: >>> %*ph\n", __func__, slen, state->buf);
 
-	/* We need receive one message more after dvb_usb_generic_rw due
-	   to weird transaction flow, which is 1 x send + 2 x receive. */
+	/*
+	 * We need receive one message more after dvb_usbv2_generic_rw_locked()
+	 * due to weird transaction flow, which is 1 x send + 2 x receive.
+	 */
 	ret = dvb_usbv2_generic_rw_locked(d, state->buf, sizeof(state->buf),
 			state->buf, sizeof(state->buf));
 	if (ret)
 		goto error_unlock;
 
-	/* TODO FIXME: dvb_usb_generic_rw() fails rarely with error code -32
-	 * (EPIPE, Broken pipe). Function supports currently msleep() as a
-	 * parameter but I would not like to use it, since according to
-	 * Documentation/timers/timers-howto.rst it should not be used such
-	 * short, under < 20ms, sleeps. Repeating failed message would be
-	 * better choice as not to add unwanted delays...
-	 * Fixing that correctly is one of those or both;
-	 * 1) use repeat if possible
-	 * 2) add suitable delay
-	 */
-
 	/* get answer, retry few times if error returned */
 	for (i = 0; i < 3; i++) {
 		/* receive 2nd answer */

-- 
2.39.5


