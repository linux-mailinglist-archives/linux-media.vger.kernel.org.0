Return-Path: <linux-media+bounces-62900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNiCBOICF2qz0wcAu9opvQ
	(envelope-from <linux-media+bounces-62900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:42:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD65E617C
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA98F30421C7
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 14:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20546402B88;
	Wed, 27 May 2026 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="D60zGYmk"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDAB3EF0BD;
	Wed, 27 May 2026 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892866; cv=none; b=Su3Ytgi3DytfiFQAy+RRvx9hZmzjcRRZif++a4JcjGgXLIinp49O6hJNIhnx+Zz7pyosZZGpT9JkP5g7qmvELpWlNpbpfxYf/JxQjmjxUcNSEYBtJ0Vh+DFCr9k3RRCBBWDd6SdajiPAUJpVMPAPzHX1jQ9jVKE2j1FKTGfo630=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892866; c=relaxed/simple;
	bh=oE5mj4rGsyYfvuPNTQPgc1MpWW2/Njp+jQxWihFclGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FCI6SK4gdUVgMlo/cUNdeP7fi4ykauWmH9hV/6DkNfI9UEv9N5NK9HRuFlvWbVLdTTIYwK9Y7sQwvirsi63yc+sB2X/m5G9/DnHFZHWynyh6N3MSC6ykcnAcMa2bfy4uSUaeelPMZzaJ5KeznKk9Wjix1oza0WcNcuWYU3/O0OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=D60zGYmk; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779892866; x=1811428866;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oE5mj4rGsyYfvuPNTQPgc1MpWW2/Njp+jQxWihFclGw=;
  b=D60zGYmkuRVB5+HEsgSFMaMHCmvgGKJaesAjxUO7ddjVjo3RaYsjXz0T
   UtSHgTRCuoqjTxq2vucx4PW5QZWlQeVTB2Uu/LaSzJfjrwDr1CVMLzhNf
   13vF5YPOUwQTWUX1BZpASX6AtmTHY1p6X8rwfLvCMMluVQAuefnpTa8gq
   zlfBpAOwnzmpk7/+zs0hls0r5IToexevtiRxML2AXXzv5arX0+T5C33er
   QGLiGvho3p7+8syIMXvRwl1+X5qDUSxEOtn9h0KNWEFDCgF2jtlu0Zm2E
   HU0sn/5KbvP+MkTHL8jH0V1PNE+rVbfbd9KQZKlZpOPhWeK/ymq1r4uS+
   A==;
X-CSE-ConnectionGUID: I1rlg2WKSEWH1y5tIre4uQ==
X-CSE-MsgGUID: lC1VCca1QAmayBZzWtSSsQ==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="58122884"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2026 07:41:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 May 2026 07:41:04 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 07:41:00 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 20:10:51 +0530
Subject: [PATCH 02/12] media: saa7110: use string_choices helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-cleanup-string-choices-media-i2c-v1-2-e8f7d2284288@microchip.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62900-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 69AD65E617C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded boolean-to-string ternaries with the standard
helpers from <linux/string_choices.h>.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/i2c/saa7110.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
index 652058b8f..d4b205db7 100644
--- a/drivers/media/i2c/saa7110.c
+++ b/drivers/media/i2c/saa7110.c
@@ -14,6 +14,7 @@
 
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/string_choices.h>
 #include <linux/types.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
@@ -310,7 +311,7 @@ static int saa7110_s_stream(struct v4l2_subdev *sd, int enable)
 	if (decoder->enable != enable) {
 		decoder->enable = enable;
 		saa7110_write(sd, 0x0E, enable ? 0x18 : 0x80);
-		v4l2_dbg(1, debug, sd, "YUV %s\n", enable ? "on" : "off");
+		v4l2_dbg(1, debug, sd, "YUV %s\n", str_on_off(enable));
 	}
 	return 0;
 }

-- 
2.34.1


