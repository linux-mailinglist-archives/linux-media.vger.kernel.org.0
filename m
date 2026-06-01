Return-Path: <linux-media+bounces-63241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMctDel6HWrEbAkAu9opvQ
	(envelope-from <linux-media+bounces-63241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:28:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA061F437
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B3803056947
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8013337755D;
	Mon,  1 Jun 2026 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPij0rd2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97D1376BE8
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316565; cv=none; b=T6WOMZEEwgF6aYU6hFGTbmsqiaMEryjctDds2gK9jlJC1MOFsvIQ27hNmZD+EK3MHjrIx6apObr+iMo0pg2IOvH+ZyNwyp4bwQApBF5OMseESDbG96ljNTPeSKDeoxZXJTNvmNcVuZ5HX9sXNqqg5hmnQBxassy5lRnclwkLn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316565; c=relaxed/simple;
	bh=raxceTIYuzE2TeLoQi6O1en5aSarMpH53lH056hoLZU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=FfRQw0YDVY3idgTxe5+Y+kAgE38QLIOnMICb+T2+NpA8hD8O/1Un2sLCs7dGgYbIdKR6O0+6aQsIAdCUJCy/uL93Beh9X2d0QNpO+GyP+7r2MkndC/zXYFuH+rQL3x5ujzwgIO1ZRrbE+UA0m8raEZxSnrj67MI4UceX78u09sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPij0rd2; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7e2cb01a974so14266887b3.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 05:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780316563; x=1780921363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+CXfiZafGcocIFXV4Xc1RLvbSqjNNLEx0Fi1Oy/0mQ=;
        b=nPij0rd2jyy8fW++G3QzmEg0+8Y3BJ0tPD0WWPP8cD5Q/PaRZtfCbkKVxTSPwr+AlC
         EU9OSvmcCr7NyQEWGHWSGyekHYGqOw1FaVbbSe+zZl3arrRFAUmzBiYnIUKIBWLN+wuc
         J7qHxCq1TdsArWAUf5AMTZGc7jIqtIWo9ZbWABo0guPqjSG3QfDUvYEqBO2jC19uY1Sq
         jCOExqU1sb6isdsJmXIYbmXpMuFKQ/MAo3l5CossWXt/D69FKCeM9tMX3Wk+axuhwc95
         TLAeeSpHPKHF2h+1zxPuvayDuvAKodOZmpsxJEKGNbYt3UddTRNnSYJ6rapXttoEoB2p
         0fMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780316563; x=1780921363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+CXfiZafGcocIFXV4Xc1RLvbSqjNNLEx0Fi1Oy/0mQ=;
        b=gYPsh3ENlPoXbUfpAutlghyvfs3ZYvIaG9JazvwZat4CxXSAC0Yz+jFm7HM4vH7ZI2
         9vpfzfOV+wl5laYO+gr8O2AnxuPD7Sl/6uMltyQ+f4zhwqm/Us3LOcwt/7hdeDgjbB1O
         /nig7TmDhOuC0M6Vai4P6m4UfVWsOwr44WztaF9hN4sXKil0sNnq251Ho9z6ujpbSEFC
         Ie0IZ8aTMQzo+uXpqQK8B6yuKFPZhJMYRIgFsL2glFKK6bT1aju2tUkehgjygeiRpH9s
         n+IhQ+DUpCyMT43v5AO3+7TYnlU3efslBQKyWvX/Wwk3FMsJc+ivTN2j/jbMZx9eNPZj
         L1/g==
X-Forwarded-Encrypted: i=1; AFNElJ/+voyw3vm3BYElfZEpv2BvQnntjEnQv1b5sOadCktzljlw5X/M3ev9o/1ex6g7NZxJ2+C8/MklCkmuBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOErnWdccmmCxB50iiGWOZrofQgoxeCZHDndzZ57HH4HmVTboy
	1kkXcvyiA1npRsPqm66czuZ3NO8cmd4RCUAjxEVW5VZ7M58S0/vWfCWM
X-Gm-Gg: Acq92OGl8tQHPzt0r8mzJZec/8z2hipoAeE+fjVsdV1kw9DAuxCSBdRyZWkApqWbQ1H
	/5hlq1mlOe7nZRoEelzokbNzkb9ZHAEoy+SeIz4RqRwTP00O5WsfGN1K+G8Vu+1mwAEKTtozzUK
	E+aXcqJxOlnD3nnI3I+8OY0UcCLe6FQ4/3wocl6k7Vwygv6orNk6Bp453T59wyCDP8ivd25XX1p
	68ObE2aawVFRt7g2dq31tf+C5J6/S0Zh/oIpzDN8wJTrrMw4HHPTAaopPuvkFOlqCMosRt5JcZW
	yYI8wu6Cgm20hySs9u3POTT1LQOfLOy93DUBXy5Db8W5oZolmLiULRXBqKk06lvCIyuC27k4ulU
	uanMBfer9AScykZNX33meUyDeuNUdFcH/osun7x5iN/lj0H0R+jXuujjW7GZtsgbycW/oecbMVU
	EtZpBjla8sNUV/dgNfpoVT7tkcO4CsYTWENkxa25u0Xg==
X-Received: by 2002:a05:690c:6a87:b0:7db:f8b1:cd89 with SMTP id 00721157ae682-7e058b3cf8fmr97514447b3.10.1780316562804;
        Mon, 01 Jun 2026 05:22:42 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17ae7e328sm38856657b3.23.2026.06.01.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:22:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeongjun Park <aha310510@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: as102: fix memory leak on probe failure
Date: Mon,  1 Jun 2026 20:22:15 +0800
Message-ID: <20260601122215.1330897-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-63241-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9EBA061F437
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

as102_usb_probe() initializes as102_dev->kref and takes a
usb_device reference before calling usb_register_dev().

A recent change stopped falling through from failed_stream to failed
after usb_register_dev() succeeds, so that as102_dev is not freed while
it can still be referenced by an already opened file. However, the new
error path deregisters the USB minor and returns without dropping the
probe's initial reference.

When stream buffer allocation or DVB registration fails after
usb_register_dev() succeeds, the initial reference remains held forever.
If userspace opens the device in the short window before the failure
path runs, close() only drops the open reference and the initial
reference still remains. As a result, as102_dev and the usb_device
reference held by it are leaked.

Drop the initial reference with kref_put() after usb_deregister_dev().
Also use the same kref release path for the usb_register_dev() failure
case instead of open-coding usb_put_dev() and kfree().

Fixes: 8bd29dbe03fc ("media: as102: fix to not free memory after the device is registered in as102_usb_probe()")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/usb/as102/as102_usb_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
index a11024451ceb..dfe5a6b3f97b 100644
--- a/drivers/media/usb/as102/as102_usb_drv.c
+++ b/drivers/media/usb/as102/as102_usb_drv.c
@@ -405,11 +405,11 @@ static int as102_usb_probe(struct usb_interface *intf,
 failed_stream:
 	usb_set_intfdata(intf, NULL);
 	usb_deregister_dev(intf, &as102_usb_class_driver);
+	kref_put(&as102_dev->kref, as102_usb_release);
 	return ret;
 failed:
-	usb_put_dev(as102_dev->bus_adap.usb_dev);
 	usb_set_intfdata(intf, NULL);
-	kfree(as102_dev);
+	kref_put(&as102_dev->kref, as102_usb_release);
 	return ret;
 }
 
-- 
2.43.0


