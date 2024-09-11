Return-Path: <linux-media+bounces-18146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC87974997
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 07:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1539C1F25AEE
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 05:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8293F142E9D;
	Wed, 11 Sep 2024 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WPScN9Z8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1EVEp+Av"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379C513AD33;
	Wed, 11 Sep 2024 05:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031639; cv=none; b=VGIN10LM6fQ8jDqKk6on3hGFlc5SN51jFMUkAZfvXxe4F7TobRDrmjmqNDSg/P2VED0IQc1g/8gNrEdBsxjltuy8/Uyv7ZY10BqypZU7d156hnmc2GTs6K/8T31V4yUF8prOcSICZe8VZkiqQL5Htkof7upaIt0NqsKS7tHFrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031639; c=relaxed/simple;
	bh=75n5UjPAswXizo2Gb+4Lf6s8hs9mh1+0oQvxojBGbbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NlyeVwq7lSdz9br3lVb62qF4l6uUYiHNU24wGsCS8p27msPihk9uIxnPdRUVhHM5FdNk025EQ5cPf2fh7OlCWDvijEavca5NmF9dxPIoxzvCYyoGXKhnqIm63SjFCzwFABpwQZ/A1Xoy24ouBvPLIsfeWPrLoytQ9H1SA4VnxzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WPScN9Z8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1EVEp+Av; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1726031635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v75l3ZYBbsP13asMW41FuZtAe9X+N+Ak4ZgbeSG9nK0=;
	b=WPScN9Z8IeSAv86lO8Bw3riaXLVV7NCUdbYsICok0sZPVj2SPuzytHiR8iMdQs5TTRh8K8
	lGFKvr9Sam2D21YLhSzqESLtPqls4QFpbiYNw3vIQgyidc1W2hkfWLEdi9xNwMY7FnNSne
	nwouI20sH0u9hfpOCQOLLvIfUX7TU85zvnVwr1c3i806CA6d5eI+C0MfOG1yp/yoPKWMK4
	WA2WhRmSu+VPd8fOgLEw2yc6huOoymZR9VOFjzi+1Xdj0BW8bgXEQbz2tF6HFiMCulSb3T
	MUkRlbxUP9fGf97RvHvufeoTUmUxTp48FbKpUqHtEco3QXmArGqay+mbUNPp5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1726031635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v75l3ZYBbsP13asMW41FuZtAe9X+N+Ak4ZgbeSG9nK0=;
	b=1EVEp+AvXwK1t9YRIjQVMvmqiYRDTEOToq6hHQI2KuI7Zt2eigi3WEYv5lKj1//dT/V+MK
	uRTztjD6Kt030fDw==
Date: Wed, 11 Sep 2024 07:13:40 +0200
Subject: [PATCH v2 14/15] media: anysee: Fix link to outdated sleep
 function documentation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-devel-anna-maria-b4-timers-flseep-v2-14-b0d3f33ccfe0@linutronix.de>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
In-Reply-To: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
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


