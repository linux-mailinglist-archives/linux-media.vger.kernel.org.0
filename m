Return-Path: <linux-media+bounces-61825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NwwO23eCGp09AMAu9opvQ
	(envelope-from <linux-media+bounces-61825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:15:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168F55DD39
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 23:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E77D430277F5
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 21:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B25337CD25;
	Sat, 16 May 2026 21:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="wZJwkh6b";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lX/x4utp"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0A137F73B;
	Sat, 16 May 2026 21:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966050; cv=none; b=Kb65kbH5+V2LLtmL1PvdlRD53BEs4DUNtcGwuNE6Krs6zadSvzUTwaWoAo4Qpi0i2zerPx81iXBqNs6XaWvwf7ZjgTMBg/ua/TeeVGphdJmnVKy7ZX075DLttQ2HZM59GNvW+Rly5/9sMeUWjtB1fO8vt6O2E3f2BkNytaM4aE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966050; c=relaxed/simple;
	bh=oqcEPT4m5GRh9ZclzR5uvQ6GVwL2PdN7l8dwblbW6U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oay4aM7bDSsILYy+Djq02f3/m7rJxA6QK12ZLd2UUe+A9B0vwwrmqlH7v+1Bi/fSDWFFhSYjowKrbSm757pBlwXq4twrMdJLEb6wYLStgC+34YWnX93ICKQHfhNq9q//xL8LW69bhVLpYjhHTSKcEPzSkZtzVBjrs3MWVL4x+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=wZJwkh6b; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lX/x4utp; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3AD82140003F;
	Sat, 16 May 2026 17:14:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 16 May 2026 17:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778966048;
	 x=1779052448; bh=A0llwZt7uGfMo9oGX492BIEZ2boaj5i0UErBKH0eA00=; b=
	wZJwkh6bKoKXep0FwOw/0RFFDNqKTxlq+dhGDka+GSPStvA/UpNqhZbCvH/UnXq9
	OimSXgyQl7qtPfGnbhCPqo9RSgjnLiRASxkZvzXdmA9kF4nDYc/nDmIcSHUHqIU5
	XUvW8pjcGySetAxqiJYQibKoxIbrzFVafamva202O/mLT4AySC3k4jDnJJBtsJWC
	+Aju2dW4YOif4wh2qTK5L7lu8qL0nyLv7yF2Viw6wLMrYtssEXqvCn0oGVuVfgmk
	/M4E6iPmgCWXVKSHC3BLN7sMPDIFLHEUZ0pjsOWxPlCSe3IEvT8eNeDwFe0cjPcB
	DgHnhj06qAxnFFcKdK6d1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778966048; x=
	1779052448; bh=A0llwZt7uGfMo9oGX492BIEZ2boaj5i0UErBKH0eA00=; b=l
	X/x4utp2Fpx+/OpwPrLwH90z7GOU8uiYGYgWbyB8d5bsJOdWFiKMNR/AN5QgW2aG
	fSYBUQa5jLpEjIEJkIoNJMgcwUZ2VKqim8+gsNJsHbhDYBQfCC7/iw2LgycguZEn
	fP7Q4RPrlMn4DiWmdUUcfUREpqwTFNgZPpqRKy4jMjHkPKzp08dRr5/qlz3TGSMf
	XeGlyjab0HcPFOxUX0QUH3nziqUCBvl1UDyRQROdXEFywRggxIEk/Z49eU3DEuf3
	a6AYGM77TS6RQPD+eBzCn3IX1G0Pxib98hbhGCkVpUJARDK62Zpa4VxcGfMsuiyL
	75EenoTw0/DmtnO8p8/nw==
X-ME-Sender: <xms:IN4Iau1qxPFuZ2_9EAwbbp1KgMOl2jelWMB94jfcu72wAFv1TCUIBA>
    <xme:IN4IanHsMFoxNg_06Bxew60mIMxo3o_BBTL2E8PE4-jWMeUMqSJlMPgwSjOhxbCL3
    ISF3xYVU1Auesw0r_7ctgKjibulb_ZKgj8eP_uNIAZIpOGhhQesklY>
X-ME-Received: <xmr:IN4IahubLuWIZiCTDQluwPan8V-QDqqAZHUE_aPKHie7sY_sdz23wf01Iluyx5sFsKebqGa_6xkRueaee9W-k6X62ZvDApYm6NUP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehjrghirdhluhhthhhrrgdorhgvnhgvshgrsh
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrgh
    igsehrvghnvghsrghsrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgr
    rhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvg
    guihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgv
    nhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehj
    rghirdhluhhthhhrrgesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:IN4IaipdiJ1ev5soSJVyaub4jjrHc3EYh4dt0D2J9CiOepDoQooN3g>
    <xmx:IN4IagUp9m7VIaZ4qEuVLYbL3KqQkm5PVP1Mqm7XpB6tg2jD5Cgc8g>
    <xmx:IN4Iai17vvCtjuyIZvDBgCDuvmMoyvdUrddH8OUi2EJeKWUX9O4vVw>
    <xmx:IN4Iatsjjy4DGhygJBky30Q7cqLsHctmeoN-0WXvY3lAcHkh_mdhjw>
    <xmx:IN4Iap7kgZ6cDFMeKmgHnEy3orZ0mKpr0QQd2suGDlFQjukgmweSJiiy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 17:14:07 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v9 02/13] media: uapi: Add extensible param and stats blocks for RPPX1
Date: Sat, 16 May 2026 23:13:09 +0200
Message-ID: <20260516211320.3041412-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8168F55DD39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-61825-lists,linux-media=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Jai Luthra <jai.luthra@ideasonboard.com>

Add the scaffolding for the parameters and statistics buffers for
Dreamchip RPPX1. The parameters for each ISP function block will be
added together with the logic for it.

In addition to the scaffolding add a common struct that describes the
measurement window. This struct is not specific to any block and will
used by many of them.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
[Niklas: Commit message]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../uapi/linux/media/dreamchip/rppx1-config.h | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 include/uapi/linux/media/dreamchip/rppx1-config.h

diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
new file mode 100644
index 000000000000..26627be6f483
--- /dev/null
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Dreamchip RPP-X1 ISP Driver - Userspace API
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ * Copyright (C) 2026 Ideas on Board Oy
+ * Copyright (C) 2026 Ragnatech AB
+ */
+
+#ifndef __UAPI_RPP_X1_CONFIG_H
+#define __UAPI_RPP_X1_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * struct rppx1_window - Measurement window
+ *
+ * RPP-X1 measurement window. Different blocks use a window or multiple
+ * windows for measurement purposes. This defines a common type for all of
+ * them. The number of relevant bits depends on the block where the window is
+ * used and is specified in the per-block description
+ *
+ * @h_offs: horizontal offset from the left of the frame in pixels
+ * @v_offs: vertical offset from the top of the frame in pixels
+ * @h_size: horizontal size of the window in pixels
+ * @v_size: vertical size of the window in pixels
+ */
+struct rppx1_window {
+	__u16 h_offs;
+	__u16 v_offs;
+	__u16 h_size;
+	__u16 v_size;
+};
+
+/* ---------------------------------------------------------------------------
+ * Parameter Structures
+ *
+ * Native RPP-X1 precision. Fields use __u32 where the hardware provides
+ * wider-than-8-bit results.
+ */
+
+/**
+ * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
+ *
+ * Some types are reported twice as the same block might be instantiated in
+ * multiple pipes.
+ */
+#define RPPX1_PARAMS_MAX_SIZE 0
+
+/* ---------------------------------------------------------------------------
+ * Statistics Structures
+ *
+ * Native RPP-X1 precision. Fields use __u32 where the hardware provides
+ * wider-than-8-bit results.
+ */
+
+/**
+ * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
+ *
+ * Some types are reported twice as the same block might be instantiated in
+ * multiple pipes.
+ */
+#define RPPX1_STATS_MAX_SIZE 0
+
+#endif /* __UAPI_RPP_X1_CONFIG_H */
-- 
2.54.0


