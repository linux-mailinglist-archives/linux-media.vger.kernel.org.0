Return-Path: <linux-media+bounces-62903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLp4IIwDF2qz0wcAu9opvQ
	(envelope-from <linux-media+bounces-62903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:45:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E75E6220
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85D8F308CC24
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4648C425CE1;
	Wed, 27 May 2026 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="kYFX/2Qn"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C624014B2;
	Wed, 27 May 2026 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892879; cv=none; b=pQGG9qKLKLUYNncFzqaIGAk8wAqZ+PZQdjfv4tqYDuIuw7vUfNu+f4fB5CMlFdc9/hvSO6y9RLE9ZePsomUcChzEMjDNAVMorOuRG2VxdNikMwZK8SmjIm9PgLC88OdxwxcyC19KpgeZtrtn0F2n0X9eE5TQ9rhjcO7adMdq7hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892879; c=relaxed/simple;
	bh=syYAYwWLcKAglC7BMCTOhMVncEhqXuo7fInXwJfLQ2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ninnBEZv8iu5qWx98QaFJK64h1tq1cJSrGUhQTUZyLmK7AVuG5poDLfgw+IBct2H23WP6BjiZdnomaQb9c93uFR52fLVDTfZxrIpJXAztH/YREUp/SJPqeraR6+mnL7plRQIqFOJwik7aGTjI3yZ55McBdmKIvnO89nRYU1fnvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=kYFX/2Qn; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779892879; x=1811428879;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=syYAYwWLcKAglC7BMCTOhMVncEhqXuo7fInXwJfLQ2c=;
  b=kYFX/2Qn8iPHw8Kmj09rak/y4pcWHYKKm9fhDeglxfH/9n9GDYeqZtd/
   eUUtNJi9wx6SOFBODrbP0NcT0zTvd6cHiXww0QyBW7Vv+VhbGyM+STwcY
   mxmZLip07kWENoUDGUk3ituzt9Us0wjw78pScXZBVHPZwdyJu5GkZqMNZ
   GBa2VfBBQAJT/5+iQLFN7nu767fGu2T+xc9H5+3Ff2cFHOo9B3L/xUkQx
   Pbdk7MM3csqzbhuFXzpB+aqZxDnTV1OZB/fa1kPfj4z3JuZtBDbOfAxgf
   rupPUbI8gJOtAPk14aMN6CyEGl05WjTid+Xk/f/asShm/Je6jaZIPFGhu
   g==;
X-CSE-ConnectionGUID: RqOWIvG/QvGZQ7RtiasKVw==
X-CSE-MsgGUID: /aRN1AQPTgiNq1WrPDxwCA==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="289515129"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:41:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 07:41:17 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 07:41:13 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 20:10:54 +0530
Subject: [PATCH 05/12] media: msp3400: use string_choices helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-cleanup-string-choices-media-i2c-v1-5-e8f7d2284288@microchip.com>
References: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
In-Reply-To: <20260527-cleanup-string-choices-media-i2c-v1-0-e8f7d2284288@microchip.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>,
	=?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tim Harvey
	<tharvey@gateworks.com>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62903-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 218E75E6220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded boolean-to-string ternaries with the standard
helpers from <linux/string_choices.h>.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/i2c/msp3400-driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 413cfbc2d..88952e7e2 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -39,6 +39,7 @@
 #include <linux/i2c.h>
 #include <linux/kthread.h>
 #include <linux/freezer.h>
+#include <linux/string_choices.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -338,8 +339,8 @@ static int msp_s_ctrl(struct v4l2_ctrl *ctrl)
 			val = (val * 0x7f / 65535) << 8;
 
 		dev_dbg_lvl(&client->dev, 1, msp_debug, "mute=%s scanning=%s volume=%d\n",
-				state->muted->val ? "on" : "off",
-				state->scan_in_progress ? "yes" : "no",
+				str_on_off(state->muted->val),
+				str_yes_no(state->scan_in_progress),
 				state->volume->val);
 
 		msp_write_dsp(client, 0x0000, val);

-- 
2.34.1


