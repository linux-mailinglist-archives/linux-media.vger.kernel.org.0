Return-Path: <linux-media+bounces-17596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759E96BDE6
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 15:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C8291F21B49
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF261E00B0;
	Wed,  4 Sep 2024 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CWxjpdZL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hQANh9H6"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF01DEFEC;
	Wed,  4 Sep 2024 13:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455143; cv=none; b=EWrmWYSBnbpK0Q0QqxWqVjHN6Q07BsJI8cnYzcPytQ/DS75T019ZS97CNwzKc8v4Ps23GWJjl/a1wwnYYaZO61JVCAjRxNAQVLnVUY7owvh6TUTfOMS2i6gZM2tyur6YPalFWAHPrwHRvybTxxuaWq8qIYTn5a7FZCjBVf0Gjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455143; c=relaxed/simple;
	bh=75n5UjPAswXizo2Gb+4Lf6s8hs9mh1+0oQvxojBGbbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJ2DZUvYpPUg2mVShg8fO9AcSKMnLyk3ao83HwAQLVnm+aLCrNEPHr5GCX5CQKn/i4kIc+PeBIJGOKxG6GyhhDcUxY6tm/VDHzT6SdwJ6BhiaT8j0vw+nEY66G/x91+apnjlm6X0O0UVqslBM2UC05+651k8uOB14fKpEnsuVPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CWxjpdZL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hQANh9H6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1725455140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v75l3ZYBbsP13asMW41FuZtAe9X+N+Ak4ZgbeSG9nK0=;
	b=CWxjpdZLIOTspIObzG4iJxNM1u6C5T2ZQHrYiEW4rEVJ2nRtzHsmkJKANPcWovynGNYgvK
	x7AGUwZNcEgDYR5mbJw7AZnvpGSUbr9a5tvZerpejqcBt/9lpHoR86Vf1h0TWg9xBGUM/O
	kzcIldoL+r5zBT5mxcMvOe3dDyMsIxip8si/4aD4sj2GinjQRIbl/rBkl9Iltpq0v6OO26
	2z5rZjIrEAyoTbRR1omxrIB1bG4Xs5N+q/0c9pVdtlJy0XbN0uFamrHGGPrIXyRffYQopl
	6p0OJTW6LgZlGiwXTBa7AQJ4XU3X6u9flbUsM9ke5y0uRqJhI7MlMciGXIY8PQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1725455140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v75l3ZYBbsP13asMW41FuZtAe9X+N+Ak4ZgbeSG9nK0=;
	b=hQANh9H6c9Jq9dDBCOAPDvB9UG3LUe7NZt9kLCYAREhOvWyAXlYDgIeM/lWhPE0EuSN/yd
	oL9cx2u9+QrrDJDg==
Date: Wed, 04 Sep 2024 15:05:04 +0200
Subject: [PATCH 14/15] media: anysee: Fix link to outdated sleep function
 documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-devel-anna-maria-b4-timers-flseep-v1-14-e98760256370@linutronix.de>
References: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
In-Reply-To: <20240904-devel-anna-maria-b4-timers-flseep-v1-0-e98760256370@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org

The TODO FIXME comment references the outdated lower limit for msleep()
function of 20ms. As this is not right and the proper documentation of
msleep() is now part of the function description, remove the old stuff and
point to the up to date documentation.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
---
 drivers/media/usb/dvb-usb-v2/anysee.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/dvb-usb-v2/anysee.c
index 8699846eb416..b2f5db961245 100644
--- a/drivers/media/usb/dvb-usb-v2/anysee.c
+++ b/drivers/media/usb/dvb-usb-v2/anysee.c
@@ -55,10 +55,8 @@ static int anysee_ctrl_msg(struct dvb_usb_device *d,
 
 	/* TODO FIXME: dvb_usb_generic_rw() fails rarely with error code -32
 	 * (EPIPE, Broken pipe). Function supports currently msleep() as a
-	 * parameter but I would not like to use it, since according to
-	 * Documentation/timers/timers-howto.rst it should not be used such
-	 * short, under < 20ms, sleeps. Repeating failed message would be
-	 * better choice as not to add unwanted delays...
+	 * parameter. Check msleep() for details. Repeating failed message would
+	 * be better choice as not to add unwanted delays...
 	 * Fixing that correctly is one of those or both;
 	 * 1) use repeat if possible
 	 * 2) add suitable delay

-- 
2.39.2


