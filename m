Return-Path: <linux-media+bounces-62540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPv3InNKD2ptIgYAu9opvQ
	(envelope-from <linux-media+bounces-62540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 20:09:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 318075AAD68
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 20:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7560D3006781
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 18:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E739C38D406;
	Thu, 21 May 2026 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9ohybIp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291CF36A027;
	Thu, 21 May 2026 18:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386983; cv=none; b=FY1ltPy4tRwhRSkeLxt9Qze+0ssvOQQCkSlBZa6rFHoBXBVZAbSk1ZyPl6nWG2VG+AALI0TQ8XSLQnBTsK8spInHMskQeZM5RcbfrSrVDJHPXe9ICxBz/IWIqGKG5c2KmlhZ6sB2Pw2f9WvSL5b88DJ79XCJn+MI12DWz5upZZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386983; c=relaxed/simple;
	bh=B9Y3iYDFYanKro3mnipAL97LUIUxW+HOKXTVG5bBdW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OyKNbA9HPPtndm8sf457PZgdZbrqKrXRMzV5VW5pGTclnheYmskJkRdQqeQuQBOwWShrSSf+y3BxEz9u638Y2mUnzM1ixxfFdoON5xEifM8b+D27xbLVoKPDdQnAKpwJzUwzj0Lk+3jqGKYCQPsnp4wf783scFQp+jmLfETNI8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9ohybIp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486C91F000E9;
	Thu, 21 May 2026 18:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779386981;
	bh=vNhgED/fw/SK99O+jaKO3SdY5UdvEE4bnqv55Pa92lg=;
	h=From:Date:Subject:To:Cc;
	b=n9ohybIpzkoxAqCZYqAqkKisCgfsJUjcPLKpv4xw4dridRQKi86wgC+HxMfpTw6KJ
	 7w1iuoFW8oS3nq6yTVO5isu5t8B3AhuLizd3zTgdwhc60v/PCRXsjQCOuUe1si/utU
	 ctP4c96HWd0foNpiillhSkejA6zwoWIYooWEa60t5ioZBi+iSNWIQyrSg9NlheAdZo
	 p1u2f6nEXJxAxuRUsyPBpJAdNSI1746fF2RQ+MOwOdQeJW0lfto+9rwMaHPvvJlbg3
	 c9cDznCg5dhAgJfUYsdskb3HtESYj0ClOCJA3kytz89Ua5CObXDiXa5zE2LphmBDSI
	 r95PC3gmY6wAA==
From: Eugen Hristev <ehristev@kernel.org>
Date: Thu, 21 May 2026 21:09:27 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix log status runtime access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-bcmpipm-v1-1-3eba88d88045@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFZKD2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyND3aTk3ILMglxds2RTc4tUc2MjY8tkJaDqgqLUtMwKsEnRsRB+cWl
 SVmpyCUi7Um0tAE5alClrAAAA
X-Change-ID: 20260521-bcmpipm-6c578e73239c
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=B9Y3iYDFYanKro3mnipAL97LUIUxW+HOKXTVG5bBdW8=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLL4veL9zhRpnF4/f23gnTmugiyFM7xkpp01rOIuMehkL
 gg6Oyu3o5SFQYyLQVZMkaXa5F+tcP8O95Ouliowc1iZQIYwcHEKwER+TmVkuPlJ+FvqcZFjAjvL
 zjz5vSpWeFLLvav9CZVan69tVNuT8YThr+gi2YhNnZNnaBhpGS3l8tIO/v32lVzA962rZt25Msl
 kPy8A
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62540-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 318075AAD68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When requesting log status, the block might be powered
off, but registers are being read.
Avoid reading the registers if the device is not
resumed, thus also avoid powering up the device just
for log status.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..818694f007e2 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2052,6 +2052,10 @@ static int unicam_log_status(struct file *file, void *fh)
 		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
 	dev_info(unicam->dev, "V4L2 format:         %08x\n",
 		 node->fmt.fmt.pix.pixelformat);
+
+	if (!pm_runtime_get_if_in_use(unicam->dev))
+		return 0;
+
 	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
 	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
 		 unicam_get_field(reg, UNICAM_PUM_MASK),

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260521-bcmpipm-6c578e73239c

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


