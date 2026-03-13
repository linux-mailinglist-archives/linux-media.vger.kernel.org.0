Return-Path: <linux-media+bounces-55658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKdKOjzys2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:17:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B4528216C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88AB431B16AD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52273890FC;
	Fri, 13 Mar 2026 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HRDm9dhy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582FC38A716;
	Fri, 13 Mar 2026 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400457; cv=none; b=tlS55bj9Bqk1TsdXuKd3+HLEMwMO+dYRG+9BhGc+tsZdLI2Axng3I0slQTKp5sVr+ZKDIArA96nyp21bWKNuSN8NXTt+r+NjMLszkWrVy251cNhNaPdQ1Pm/vvlHk8da2NZq8HQqzZAF/frTCeDz4lUuG+kN4lqWva+q7DqsA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400457; c=relaxed/simple;
	bh=yYQ4TjMGLnAAv3Zoy+v/DOI3B0qDLLqf+szWP7wTvHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V95HhnuqmR8Kmg7sSpv4K8YnAxoJuxsAm1jcwTUlhmjrjnayE8VaGU8A94Vn3BZSC6omN20yPnQoiuEkI0ly2nDpVoIdZlXzZxlgvwZECoDEKGUMf8xZZpibIDf9Q7u3qIhBvQmXWG4UikqpBSTxVTwhggfX0dud+FH+GZm1lvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HRDm9dhy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.92.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 400BE1783;
	Fri, 13 Mar 2026 12:13:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400384;
	bh=yYQ4TjMGLnAAv3Zoy+v/DOI3B0qDLLqf+szWP7wTvHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HRDm9dhyoCrI6ZKUBW5TS2tovnSZjTWTuusNfWo5gi/HfarejJubqoyI0iJDLB+L7
	 DNL8gXi64pYOLo+6+6RAIrqNOc4HnKRcaYrElpy7LLRDRODiUoDL/AyvEOx6tt3tC8
	 fFDjSH3FatZ/TyEqceAE4ZmG7s1Y8aTDRicYhw/g=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:13:58 +0100
Subject: [PATCH 2/7] media: rzv2h-ivc: Fix AXIRX_VBLANK register write
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260313-mali-ivc-fixes-v7-0-v1-2-cb0714cd1279@ideasonboard.com>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=u/qHvnWmPYnguu6xG+vN9zcv3t7ZQuZRHBXM6KPkyH4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps/GAxw45H+LXGdp6lWpJy0RJpevraTtpyjLEA
 9IDyL+7LYyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPxgAAKCRByNAaPFqFW
 PHOmD/sFxMXB1JrSctFTWnajjuIERwjowyJBmxQ7ccruT/qrzwZ6D6eWaQo4doMEfQNJOsJf8zB
 cXL4s0g6/ZY2K3nOIj3zNQAJ5dJgy/3rU7D0owSX1JSS21KUsuQQl8nTMnChW4B9J+34AU6JkpP
 UxqUfn7vPHfqx6ulIGI/xw9bhham/+WfFzvIk/rQdXVkJLe6xy/XdTCs55ztqx0u7oQwwrDeuMr
 dGcoLS/C97B/fq+mC6fIWysHGhJCzg9hxUqIrvKiZIE1sAGlscN9pG99k3/b6et5/AxaVAknJ9e
 J+7trI2kTabl338GtoYnRyf6csIZdSAUt0POJGv/6fV3GQrWPlc5avRMhT6EFzldh8HlT1VLwBm
 nvB+F0Z2AXPHeGBV6m/Bj08kEL9CUAxUB3BeKUr+QtCbKIwXit5WPJ5jMs2QYjl9QvePZFrlOVL
 12kiKaxs/PXfVa+rUuM0d3BrC73dMUj43FpNDuAQpzWE6Ya/ILV7Nt6Q1SF+OurLyCzBIui3ArI
 2NdPyHbOKnS+AU2KlFloP/NmdtB7ePOiKiwsoRqOq7741ZPOCVT3Cm8P6J+OfEqlD+YYQGhCd0y
 9iYfhkobtheg7j4Gn78uyPp5duhP6kS+9qzz4E+F1TuozbLVNLTA2iu8C4AgyOcbTyFYgFztcWM
 GCz+lDZev6ucVsQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55658-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 70B4528216C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

According to the documentation there are writable reserved bits in the
register and those should not be set to 0. So use `rzv2h_ivc_update_bits()`
with a proper bitmask.

Cc: stable@vger.kernel.org
Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 7 +++++--
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h       | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index 1e016b17dcee..bfe5b0c7045e 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -7,6 +7,7 @@
 
 #include "rzv2h-ivc.h"
 
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/iopoll.h>
 #include <linux/lockdep.h>
@@ -235,8 +236,10 @@ static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
 	hts = pix->width + RZV2H_IVC_FIXED_HBLANK;
 	vblank = RZV2H_IVC_MIN_VBLANK(hts);
 
-	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
-			RZV2H_IVC_VBLANK(vblank));
+	rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_BLANK,
+			      RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK,
+			      FIELD_PREP(RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK,
+					 vblank));
 }
 
 static void rzv2h_ivc_return_buffers(struct rzv2h_ivc *ivc,
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
index 3bcaab990b0f..4ef44c8b4656 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
@@ -34,7 +34,7 @@
 #define RZV2H_IVC_REG_AXIRX_HSIZE			0x0020
 #define RZV2H_IVC_REG_AXIRX_VSIZE			0x0024
 #define RZV2H_IVC_REG_AXIRX_BLANK			0x0028
-#define RZV2H_IVC_VBLANK(x)				((x) << 16)
+#define RZV2H_IVC_AXIRX_BLANK_FIELD_VBLANK		GENMASK(25, 16)
 #define RZV2H_IVC_REG_AXIRX_STRD			0x0030
 #define RZV2H_IVC_REG_AXIRX_ISSU			0x0040
 #define RZV2H_IVC_REG_AXIRX_ERACT			0x0048

-- 
2.53.0


