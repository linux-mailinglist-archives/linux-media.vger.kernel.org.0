Return-Path: <linux-media+bounces-58506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC4fNdy92GlVhggAu9opvQ
	(envelope-from <linux-media+bounces-58506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:07:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 373D23D4801
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 11:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52510303A8FB
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 09:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6761C3B3BEC;
	Fri, 10 Apr 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LpGPoEYS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AC83AE18B;
	Fri, 10 Apr 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811993; cv=none; b=LYVKWCk6hPI1PLAhTS+QtIXkYovJpCy6ffrz1WKRPdnu2SrSR2EHn4QOSajXVatLw1bWALx50JBYvzJGAy91NKuoaBNP+Z/AUkJG0u10H4NA4Oif2Hn6laM86zPzaBSutdcC6gmVmBQEUYQILiA4iWSPoTtg3+vGrvTC6YMZF/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811993; c=relaxed/simple;
	bh=kVd/jbrOJqp7SDF4rPZZYYhOdZaRqGxgIREnoDQSbg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clBwvbpPbcGAJHJi5Ppt5M4hSOMr0rbjEbSWk25qv5fZ05W4XmRA6IPCyJnLWfY+SdGIHVZclyMqr6aK2dE884BXRJc3J2qvYXRn/WI3e0egyjrZwFofbRwaMbbg1LB9RudCtBYl96kO7jjtgEUmMeaEAL8rYINTZ4kGTsjS8as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LpGPoEYS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [103.176.47.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 492D5236;
	Fri, 10 Apr 2026 11:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775811901;
	bh=kVd/jbrOJqp7SDF4rPZZYYhOdZaRqGxgIREnoDQSbg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LpGPoEYSb+93Sl0bhGYcJo2CmVuFsRdIDjf9em43lCCKy7Xs1Crdgs61QbPrA1rk6
	 OFIT4YZAkf4DZSwDzyWphb5fvQ5bLSuXZLMV5gxSX8k9CKc5X19VMgkNGk8yntoSu1
	 U+AHE3zuyVGKfP523BQG/jzZtFWt3NluW9riolcE=
From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Fri, 10 Apr 2026 14:35:36 +0530
Subject: [PATCH v7 01/18] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta
 formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rppx1-v7-1-43cfc6b44f1f@ideasonboard.com>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
In-Reply-To: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Jai Luthra <jai.luthra+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2351;
 i=jai.luthra+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=kVd/jbrOJqp7SDF4rPZZYYhOdZaRqGxgIREnoDQSbg8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBp2L1419npQ6XK99S7ZuzzK9F3KTPnZpqnqNdU7
 RJ5EkQFk0qJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCadi9eAAKCRBD3pH5JJpx
 RXseEACnsLKr+MkhClY9nXSJ4WhaICF5sD5Us1WpVMQlxca7wChw/gpzzI8JUhuRBxqpvzHUQoZ
 JohmByES4/aosIqKgVpD6bbatnUZjqNkx7Fy2IkNq4Ih4T1yTz5nq/1GljIacvD4bQzf7am3Bi9
 tWUtz4RmEL1hsz2RLo15xTPetZRBFmdJ49f5Dad2SKzUNd9w+aL7HsHQCTtxwtn/LnF6uBuw3/t
 FvknOU4Uzl3w8Cllgy3JtrDwpgdE67buWQpRVKs47rJ/EjNPnnOgUNMOd46nQoh+xq3i/c2fAay
 SYbstj4N3nmF/au70ebOCNiJvDaSysNn8EfGH/M7LQ2wxj6M5r6LUhyVRFXl4cBCjJxMriqmjbZ
 wZfQPVhi23Q9vIkIw+o6k+BtFfDoJS6KsGE2geGwMN0GXqkvZNiQISPxIOK1qWmmCVzvlso9yvD
 qdVDoG+3rGv65EQesrNt5gZJBT4IkBfRLIXrQOSdW3d/KO+bmJJjcUw6T7n+mHk8zrxQAOr2EOw
 39QgS09TakqRM/7iNgz01hbYIkFNOGp67lQmCiX+t3e2tU9t2Os7nU8eio1andVWYIrF+3tYSLZ
 /y77zrPR528wQYeamnFXfnlNnzoQ6qTpprERgqvYIZxPASTPT4zM9Nzd0B6zUbIDkxynV4x1Wbl
 iJKQD6+1LDLTw/w==
X-Developer-Key: i=jai.luthra+renesas@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58506-lists,linux-media=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 373D23D4801
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
parameters and statistics buffers. These formats are used by the driver
to exchange ISP configuration and 3A statistics with userspace through
the extensible parameters framework.

Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c32a4883521f34fb51eed13c71d76..cd3f4a86e27f22a0108ad2932cba755295af9a98 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_RPP_X1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
+	case V4L2_META_FMT_RPP_X1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc14a90a230601d8e23b0e13845d34..1f78b5378b3bde31a5ec464a6a609fac94e6d0d6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,10 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Dreamchip RPP-X1 ISP */
+#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
+#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.53.0


