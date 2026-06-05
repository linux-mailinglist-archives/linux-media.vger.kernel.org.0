Return-Path: <linux-media+bounces-63933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CBxnDzHnImoGfAEAu9opvQ
	(envelope-from <linux-media+bounces-63933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:11:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C679464927A
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=dt8wiBik;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63933-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63933-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8589309B648
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DF8413638;
	Fri,  5 Jun 2026 15:03:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86DB3FFF9E;
	Fri,  5 Jun 2026 15:03:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671798; cv=none; b=OVciqlnuE7PUz58XyBrWRqPTuCcOZsbLNbo+6HWOcrTezJIjuY9O8jAEo6Pf5TQJEgvkoXPlTwi3kNUPTy8y8UQjrsKav3/t+H13dBNPkMH7Gp7/OsEyyONzNmgqGXIaLFnnn+ShhOCDtHU8+JtZTsIVgzLK3knTGXR/Acizt38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671798; c=relaxed/simple;
	bh=zJuqCg2/a6OaQ8B9lQxLJf7/4v3jsjpOtrRiHeWBB2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkOA4o7jWncikFycLDl3tXkR5Cwgd2kN5cl/ifdQrBsU/sSrp7KsS1B319YgSblAF4cM8Kv+gAcPa9eDF/I+MX3rwAOJ368hv+U+ZVMq8ai92R2TrRboH5MmBrWcYrXhDUNT3Jv1woNEBX0ExPUzPYBVjqzON6SRbNSr7tm5y0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dt8wiBik; arc=none smtp.client-ip=213.167.242.64
Received: from Monstersaurus.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA5AF20EA;
	Fri,  5 Jun 2026 17:02:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780671769;
	bh=zJuqCg2/a6OaQ8B9lQxLJf7/4v3jsjpOtrRiHeWBB2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=dt8wiBikJLFRHMKsEPf/1LKS6zX2sw3yw6XuqZWMmfYjFhijLC4gq2HIUyTCMqVzQ
	 ag4zb00v/e5+m1DjRE8JL0ibA9hMWFGpT2hkz9i2rTl/irFKLc/w1vnMdh5X9h+liQ
	 gd7Vuif6FNxgoWOaiFD6pIr3pZSVNk0AW2WJPy5o=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: laurent.pinchart@ideasonboard.com,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] dt-bindings: media: Add macros for video interface devices
Date: Fri,  5 Jun 2026 16:03:08 +0100
Message-ID: <20260605150309.2451456-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63933-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C679464927A

Add a new dt-bindings/media/video-interface-devices.h header that
defines macros corresponding to the orientation enumeration types from
media/video-interface-devices.yaml.

This allows avoiding hardcoded constants in device tree sources.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/media/video-interface-devices.h

diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
new file mode 100644
index 000000000000..d2340b457292
--- /dev/null
+++ b/include/dt-bindings/media/video-interface-devices.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
+ */
+
+#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
+#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
+
+#define MEDIA_ORIENTATION_FRONT		0
+#define MEDIA_ORIENTATION_BACK		1
+#define MEDIA_ORIENTATION_EXTERNAL	2
+
+#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
-- 
2.52.0


