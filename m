Return-Path: <linux-media+bounces-64619-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oR59NskdK2qj2wMAu9opvQ
	(envelope-from <linux-media+bounces-64619-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:42:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D25036753F0
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 22:42:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=OveDqoj2;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="E JKDbqY";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64619-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64619-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 695C83019DA1
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 20:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91093369206;
	Thu, 11 Jun 2026 20:42:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B1E478E42;
	Thu, 11 Jun 2026 20:42:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210532; cv=none; b=lzPQvVQYLIXt5n8LCL0zgQ7SxnYpa9oRGWlF1LIcuxuJFUb9yYXQdDleAgIq9R6Cn1N/5seh8WDVUGmtveb9RxQZOiEU7NQfCfaUilsuIa4sgZcOYfM7JLw205LOoM/gp/QBXHLioP4rUdS056q7dXICp7CYHKmWEk7aAmJtFVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210532; c=relaxed/simple;
	bh=2po5MNQe4FhazArDZQpg2kJVctrXXhdjJim8Xqnjbzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emyAIIzFb/bhOIsWs997tOrNzCTK9mER7zVC8sYCMIG85UZ3OrP/LjZa9IMohICKtOzJQ3aFtQ5PTAh/DC1O6UbSk1q/upeQBFKMhpsfcfW/+1m/+mNcr2KtD/7+8XfPk8G5JCuXb7tey0PK/wqj/Q3w/wSZ+FNhBgWNb7g/UvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OveDqoj2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EJKDbqYE; arc=none smtp.client-ip=103.168.172.152
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 56AED140002A;
	Thu, 11 Jun 2026 16:42:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 11 Jun 2026 16:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781210530;
	 x=1781296930; bh=FnIi3Ncih+zZW50uXtdrhI9gG/WpRnYF1yE9ZHXf5xo=; b=
	OveDqoj2wFEWyy92LwQEycUwXphKFsaBljbBXHiBZRaIJJnHKAA9M4hRqxF+A/K4
	5kWUZ1ebyj0LR3ZVHZksm46E3eBjy/E2kfrw6ZP/efNMTmZURa0sCYE2sM42IJn6
	zIpg/rdWm+xNMFm7mUHM0/oBnXgOF/TlNPVA7KYkBABSy038hE6D+RBZifs5Dj8d
	nGcGTQ8kLBpkCvji+QI/wo1Kh8WU/hTQJLUoGk+BlRPDxbFB8A46nCZBaQbzLaBj
	5WYw0YnZgH9arLizG/0jmrIOmIi0p/Yqf2PtPNCnJ6r98CS+Cx7cMczGKTGVwBbE
	D5kIOLX0DHk8y3YWH2dxRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781210530; x=
	1781296930; bh=FnIi3Ncih+zZW50uXtdrhI9gG/WpRnYF1yE9ZHXf5xo=; b=E
	JKDbqYEXjs+v+6rYAgeNm6p2SQ+OdslGITvuwCy9H1tYdgDVTlDqRKG9ILGJf7ap
	yoYHlxNRPSi3s0ldliyD9Uo0oAmoZJglWK7zz98klA+XE4RTsNKPnS4otXSqZ7SN
	kcdpkj5wflnM6eGUMHy+bJGMtu0ym/4JuS5G8nMwIJdsoE4dPvcAjhP3qKsoxUjJ
	ySembWLZhps/Z30Y/5Ks6u1x86Enha8C3919eU0eoxbeICkocdYVCnyqVqSeh+yq
	1/FdhW4d+ib5AxwpmpET2bgbfMrOCT0MWo5RxfD/ixZgGrs05hx43vZZ8EzXjLWt
	gl7OUrDJ7Zm2oroP+sPHg==
X-ME-Sender: <xms:oh0rauG8kd_LqdKGKpS-Io-Btikj8QobGXb5vvy6DRhctJVZTMbJwA>
    <xme:oh0ralUJLjebHwRqnt_onDELS8rkg6J-ll0fsmsivWQRHxeHN65k_kPwV_u9YDysB
    oZENw3yQhbVp3UkxWAjgPZoERq_-cYiE20pJQK6nOqubzoYOHOnrg>
X-ME-Received: <xmr:oh0rai_AGL_gKFIYyeWYFYZ3A0_O9xLkNYfD-ufU-XjPoqD9KpvLWEK4COc0NxlKFBNbjul1YFOYtMmU0qTWpErAm82h>
X-ME-Proxy-Cause: dmFkZTFYdccW41AHMwatnXGUrGJhL3NZu4IP/Z8xjV+naQRr97nL+nahEk4GbaanSevPwK
    DlBZemf8+exrrv7Le8se4hPUCaEK7ML335MFLfKMKMVk9ltvltejoY2h3e5JIUTgbA66gg
    wG0qu/9w1VRlOCL9G9RnJAr+DBADK+wqUWI8LQpEfbvSAVomJvR5lVYokcW2wpB8vkI7vH
    onI4AdWPP17CtIXu+vC8p4OqtcgB4G4HzDuUPDlKvG5m44UslQPWDXS+Oy4eGD1mj5lntG
    sPjzzTvGtdYlfQT+DIvO7QxkQLeMSE/MCq8Eo3DXfD7FlP4D8cK3pKN50ysueWOsBm1DTS
    d/5dUAUrvtGkpVMbRPP7FGv5Hn1YOx+fEiwPSrwYk2QEvAB/CyNnK6hNBVRNRJd2E82r/Z
    tQJOCV/zNM4IgzMTyV+Lp1+PDYTeOK9j2DbOICRxO/mTKkwcEqaGRZHEztRTYLEEWEXDSE
    4vxNpmqq2qGKTMctgK3YcbKViW/hMrfMgcGfr5Swa40ZVdzKBbeJTL0nS3A3zMcUhwM184
    ME7qQmbcQn5Lc8luQBp3xMccS7ywfsiObzJXn2zVxMXYDDoeZyobhP+efDqzOtaXJ9wyVA
    z6/mCUJZKubQ0epgYkE/9tjWIu+WFuy8+W5aLv5RA3Xb9qIdUVrshD8im+cw
X-ME-Proxy: <xmx:oh0raq4e-kkfoL0plQ3zmLFNwF7PLHiIzHoFTFUbCfpIz5rbsSBVOQ>
    <xmx:oh0rajkm8uyJ-mhWNCQK0zoxA_S238bxxsWFy8jK13MgiSAyrufaUQ>
    <xmx:oh0ralECdn4lG5EdsSuva376yjbC1hAZUwpTI_ae8xJjm8__66nXbA>
    <xmx:oh0rai8GTjYaLF47WNTDFLH_qRHxWK8HZ8uPRF2hEuX0p6aX-rRFXQ>
    <xmx:oh0rajLMm_wb6bGfU08JfLf1rEINSO5jI-ErvukT4rkrT1BKDigh4yP6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 16:42:09 -0400 (EDT)
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
Subject: [PATCH v10 02/13] media: uapi: Add extensible param and stats blocks for RPPX1
Date: Thu, 11 Jun 2026 22:41:37 +0200
Message-ID: <20260611204148.1423192-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64619-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D25036753F0

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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
* Changes since v9
- Drop linux/types.h include.
---
 .../uapi/linux/media/dreamchip/rppx1-config.h | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 include/uapi/linux/media/dreamchip/rppx1-config.h

diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
new file mode 100644
index 000000000000..1f2548db73ad
--- /dev/null
+++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
@@ -0,0 +1,69 @@
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
+ * The same ISP block might be instantiated in multiple pipeliness and operate
+ * on a different bitdepth/precision. For fields of varying length among
+ * different instances of the same block, use a data type that can accommodate
+ * the larger bitdepth/precision.
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
+ * The same ISP block might be instantiated in multiple pipeliness and operate
+ * on a different bitdepth/precision. For fields of varying length among
+ * different instances of the same block, use a data type that can accommodate
+ * the larger bitdepth/precision.
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


