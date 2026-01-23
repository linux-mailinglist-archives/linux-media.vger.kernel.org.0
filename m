Return-Path: <linux-media+bounces-51415-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JkHG5lec2l3vAAAu9opvQ
	(envelope-from <linux-media+bounces-51415-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 12:42:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA907540C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 12:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80C233027C45
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 11:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1119D37F10C;
	Fri, 23 Jan 2026 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uNZGBqF2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dkAtlJcA"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8CC35B64A;
	Fri, 23 Jan 2026 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168248; cv=none; b=PYU3S8EC8JQlP6O5/J6jvxJ0SrlqHoxW1BspoAiTSa8tW80xtU6X1FW+P0pMbjGKtJRmG9rBTpiNQQNKvknvRsWSoNGWNVU5iAwzdjlxiRWvj8GFmFPV86V0hgqUJ1WHPIjrm75Fnl0s2BSQDDsOlJGrr8n5sGBiD+Nm9p76gm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168248; c=relaxed/simple;
	bh=yvzDIWWhEANEW4PbM7NkDFVfHEP4kbyT4pI78b1eorY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K17B5rC01DJbI5X5gP5jD1Nv9s7jF7VP+pf8VX7vcAM8wARNvX3piYt6qxSSzeMBv+AX7xuCMucxn71wydpjQ4zrWOMgSVVRDwnp6veS4zQ1UM997y+XgBHYzKWs4leuhO2mjRNoG+6IESSub2xfgxVS8O9+9yGSFUU2VJb7g9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uNZGBqF2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dkAtlJcA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769168241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j0rNXMOI7j3rGJB/+4/ynkZTe41c0CB08LUfoR/1ch8=;
	b=uNZGBqF2HBQ4IjF5XXI4RozcvOK0eDbvgtmfG3q71PLU6NCUkKEFNjV8fZeR8a2qh48Yqm
	Ie1qPqfVpsX4Bzrc5tSyeendqZ+wX/WNbfLfSYYNBBRqGyHlc6ZF4X3NUwz67joHp9fWnw
	W/1YqLxQfVzOx/VINgiFFmJqa/vJEi296otWYOVvFYI3DxlBnO/S+bOWlAXDvkBMKiuAb9
	vuTdLx9BNZPVwtaU9PG6DhDeRAJ6UgcGHPdtf2iZOKBMkw0xtMVUAZoNheQdMTiY1fQIOe
	sUAZc9vBp5+kUeeP79j9jUeGLP0IySpLzlhzdala4dONB5ckgT/SLQgOxx2wkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769168241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j0rNXMOI7j3rGJB/+4/ynkZTe41c0CB08LUfoR/1ch8=;
	b=dkAtlJcA7fdbuGNJCEXB5q7Mg1SR+dw/uCacVMHfsWwoydSrUM9TZgaDLaMNF3c4rMzVbJ
	FMLVSwbz7y0a9zDg==
To: linux-kernel@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 21/21] media: pci: mg4b: Use IRQF_NO_THREAD
Date: Fri, 23 Jan 2026 12:37:07 +0100
Message-ID: <20260123113708.416727-22-bigeasy@linutronix.de>
In-Reply-To: <20260123113708.416727-1-bigeasy@linutronix.de>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51415-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAA907540C
X-Rspamd-Action: no action

The interrupt handler iio_trigger_generic_data_rdy_poll() will invoke
other interrupt handler and this supposed to happen from within the
hardirq.

Use IRQF_NO_THREAD to forbid forced-threading.

Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Fixes: 0ab13674a9bd1 ("media: pci: mgb4: Added Digiteq Automotive MGB4 driv=
er")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/media/pci/mgb4/mgb4_trigger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_trigger.c b/drivers/media/pci/mgb4=
/mgb4_trigger.c
index 4f9a35904b418..70cad324df608 100644
--- a/drivers/media/pci/mgb4/mgb4_trigger.c
+++ b/drivers/media/pci/mgb4/mgb4_trigger.c
@@ -115,7 +115,7 @@ static int probe_trigger(struct iio_dev *indio_dev, int=
 irq)
 	if (!st->trig)
 		return -ENOMEM;
=20
-	ret =3D request_irq(irq, &iio_trigger_generic_data_rdy_poll, 0,
+	ret =3D request_irq(irq, &iio_trigger_generic_data_rdy_poll, IRQF_NO_THRE=
AD,
 			  "mgb4-trigger", st->trig);
 	if (ret)
 		goto error_free_trig;
--=20
2.51.0


