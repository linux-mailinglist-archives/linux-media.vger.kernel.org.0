Return-Path: <linux-media+bounces-66712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lXG0NeNrS2qCRAEAu9opvQ
	(envelope-from <linux-media+bounces-66712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:48:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7A70E48B
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 10:48:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=inspect.it header.s=mail header.b="PRo/MQbK";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66712-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66712-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19B363062AB2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 08:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA723D88FA;
	Mon,  6 Jul 2026 08:07:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from imap.inspect.it (unknown [217.61.62.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C13E8C44;
	Mon,  6 Jul 2026 08:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325273; cv=none; b=JFM+1u2NVdgTTHtmv+++MNK+XiR8wnW8CBwd+8/BYjgqcsfbAgNI8Rm9DWWpSAJTdETz+JcXSK96ABDMLiI94a1XT9/x/SKvSNYi/amqCmahR3tj2+67Pg9aDZtX1MdZmkNssS5ZS+A3khtjt2U1Qcd3fw5WARY2LAzLIgJZ0iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325273; c=relaxed/simple;
	bh=NnROPNoisibJ6JlFSMFWkhqPL9qpz+TJuiToSOYg4Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version; b=BHoShlP/027yr+PN7HH74v1azdSVs9O9HpVDcRskosi35dXQ0zVbF8aL+zgbXNogKsi4i/VwYKRb1tNFWDmKuURnmgpV4hbyCnhiWeo4BsMaxPQow0u50NdQk1GOYZtuMH4CILhB85ZbbZClLHx/O/T68u8wl8N6YZeMhDm9BjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspect.it; spf=pass smtp.mailfrom=inspect.it; dkim=pass (2048-bit key) header.d=inspect.it header.i=@inspect.it header.b=PRo/MQbK; arc=none smtp.client-ip=217.61.62.188
From: Samuele Angioli <samuele.angioli@inspect.it>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inspect.it; s=mail;
	t=1783324837; bh=NnROPNoisibJ6JlFSMFWkhqPL9qpz+TJuiToSOYg4Vc=;
	h=From:To:Cc:Subject;
	b=PRo/MQbKWA1HlFICS4/zD5sFzY8QKhyMxFNu2aETR99xdSSTnPocm/YbNrldjpi7P
	 lJy7Fwr5Tk83238mI0tCge3+aKlZPCAMiag97txziY/bWoNr2vFms0VdnKej19ROXR
	 KcrVx4fVfLjw/udp/qK9rYGyhu2R0g5cCCq/hddJ/xt//HPAoI4V2gaU55hlMMjUJP
	 +L2ioGF0v56rFF52D2jlVsfCBtRCxkY6soYRlcBLihEwKG3HmgULVHuFU639XTJ4KF
	 /95jDU8VIB4sgHXYPSDIsEtflc5vq8U04zIdugve29dC5z6ltnhYoBDu4aI0uUufR0
	 EMNjhZK5ox3BQ==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuele Angioli <samuele.angioli@inspect.it>
Subject: [PATCH] media: ipu-bridge: Add DMI quirk for Dell 16 Premium DA16250
Date: Mon,  6 Jul 2026 10:00:02 +0200
Message-ID: <20260706080002.16812-1-samuele.angioli@inspect.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[inspect.it:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hansg@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:samuele.angioli@inspect.it,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[inspect.it];
	FORGED_SENDER(0.00)[samuele.angioli@inspect.it,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66712-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samuele.angioli@inspect.it,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[inspect.it:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14D7A70E48B

The Dell 16 Premium DA16250 (marketed as XPS 16) has its OV02C10 front
sensor mounted upside down, like the other Dell XPS models already present
in upside_down_sensor_dmi_ids[]. The rotation is reported as 0 in both the
SSDB and the _PLD, so without a DMI quirk the image is presented upside
down.

Add a DMI quirk entry for this model so that a rotation of 180 degrees is
reported for its OVTI02C1 sensor.

Signed-off-by: Samuele Angioli <samuele.angioli@inspect.it>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..3c38981c3 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -134,6 +134,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 16 (Dell 16 Premium) DA16250"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.54.0


