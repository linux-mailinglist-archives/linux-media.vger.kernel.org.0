Return-Path: <linux-media+bounces-64533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KXmxDUpRKmoLnQMAu9opvQ
	(envelope-from <linux-media+bounces-64533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:10:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8FD66EEAF
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:10:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Cq4TRXsJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64533-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64533-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DDCAB300CF03
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102B534EEEE;
	Thu, 11 Jun 2026 06:10:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146E1A0BD0;
	Thu, 11 Jun 2026 06:10:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158206; cv=none; b=dfbcflk7YKjp2SZyRPVMPubIhsWDilMc9u5XY8Il2QXuf8x8narmbUeqepfIBQJ6HKLwKHluUPjlatYawZ47Ihnsi227oXJvcl83OqfkdL9ZtYf77PN2w+eMQxPx5faqNu2IbzlTF7SWoZSTqIq1m2JYr5C0b1M8XZ4yFN4jRX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158206; c=relaxed/simple;
	bh=ElaN3MA+r7gbV2oGehvuhfujvcI0kDw9G1DVXIYDWoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y9H+04ORzNuVRg6NpINjFq6hfHkNTUmOGcs18gVINymtY6BWe6F5ioyLfxBGKxuZwhS8mCRApccdREBBDgsDHNJgrpq7epo/6A98w4MhtOHuy3bWGLM5YI6r2lu+YPiV/hldFyJ85/JNNSDajRM4fE+++7h8Kz+7zv209nG27lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cq4TRXsJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B3D1F00893;
	Thu, 11 Jun 2026 06:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781158205;
	bh=QMwju+bF00fDRWgD6aFjamUkfyRvkUx8XZMI5aZiZ14=;
	h=From:Date:Subject:To:Cc;
	b=Cq4TRXsJNrWHvMYJo5W7d1NrCYcnm28ETJ1Z1i6euJUPMcVxTTi469wALxVqBI+JQ
	 Xa9jp8kC6PtfqIcIKs0hGGn5HauYqi+2aDTaA0cpLzs79siGdr3MmBERskBCw0zOQ1
	 CBGqcnyuHTkutUaM35s/O9jNyrYpLCkMtGmGRGqLTXfVLezrOBEOyWWhRVbBfBILi2
	 7Sl8h9ynBKCXylM3JE2GRRUR6ON8PeHJ/fBAjn73nu+lt83pZGa4cxHp/4WvOpRe2M
	 vYBU1Vefa/CFXXtHq8QhRrIThH638nSfQtZpafJmoVlGbSRiMSNAmmE0d6VbLseaFJ
	 yiev1y0YEVTZg==
From: Eugen Hristev <ehristev@kernel.org>
Date: Thu, 11 Jun 2026 09:09:51 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
X-B4-Tracking: v=1; b=H4sIAC5RKmoC/yXM0QpAMBSA4VfRubayKZlXkYuzOTgKsyEl7264/
 OrvvyCQZwpQJRd4OjjwMkfINAE74NyT4DYaVKaKrJBSGDs5Xi060ZU6R02oWtQQe+ep4/N71c3
 vsJuR7PYO4L4fqiXti20AAAA=
X-Change-ID: 20260611-bcmpiqcap-f893a9ea2da9
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Naushir Patuck <naush@raspberrypi.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=ElaN3MA+r7gbV2oGehvuhfujvcI0kDw9G1DVXIYDWoM=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLK0As2FhAxepPjJRsg4WGn1X9vGH7rok6+nTc3+2paE9
 fv//H7VUcrCIMbFICumyFJt8q9WuH+H+0lXSxWYOaxMIEMYuDgFYCILZjL84dNWXXt8ywfNiQk/
 wqfpCNfss+LtKnt1+2CdocGO/zslfjEyrFco5av/VRmnuORq+a0ZLb8F3Tc+6+hSPMDEy7RIlle
 ZDQA=
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kernel-list@raspberrypi.com,m:mchehab@kernel.org,m:florian.fainelli@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:laurent.pinchart@ideasonboard.com,m:jeanmichel.hautbois@yoseli.org,m:naush@raspberrypi.com,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ehristev@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-64533-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B8FD66EEAF

The unicam exposes two video nodes, one for image, another for metadata.
Querycap should return the right caps for the respective node, not both.

video0:

Capabilities     : 0xa4200001
        Video Capture
        I/O MC
        Streaming
        Extended Pix Format
        Device Capabilities
Device Caps      : 0x24200001
        Video Capture
        I/O MC
        Streaming
        Extended Pix Format

video1:

Capabilities     : 0xa4a00000
        Metadata Capture
        I/O MC
        Streaming
        Extended Pix Format
        Device Capabilities
Device Caps      : 0x24a00000
        Metadata Capture
        I/O MC
        Streaming
        Extended Pix Format

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..4bf36ce80047 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -1833,7 +1833,10 @@ static int unicam_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
 
-	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
+	if (is_image_node(node))
+		cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
+	else
+		cap->capabilities |= V4L2_CAP_META_CAPTURE;
 
 	return 0;
 }

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260611-bcmpiqcap-f893a9ea2da9

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


