Return-Path: <linux-media+bounces-58975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNEVNEbx4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:37:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1229A418C3C
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42450300B528
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0863AE71D;
	Fri, 17 Apr 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jx8lBGJJ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99663AE719
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414758; cv=none; b=rimdb7dmQ/MjW1UtvuKrsx+6kvYHoGGVhbHUp2s0TXxh8LoJHnt6xcGBR/IWzpxf+v96Cn4ELjems9E2LdZRd1kddt560ygvOmUtDgRsV1oeIovzy8MWDNxRRlMjRp8xlvnlGlioqToNWLWWPUIbVJskQK5nT90gfZ1PvI0CMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414758; c=relaxed/simple;
	bh=+f9G1Q91WCd+wEtjPmDBoBpuy1mIZLdcAnw7K+PZiDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMhMdcahFSYtsialvR4gwBxAAm9jBuc2V7dYYxp1DY3nriYeNnfj6RrXno7wAhSSDmd/1sVZyGdnaPlEy/Q6OeTZNQVk0ntA83t7pGWAiZhr0gaOayQKNRFYU/Wy1qmdn5lvcUQl7mJkAy/CNnIw3pnor9QWt4S4yoB6KiduVus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jx8lBGJJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776414756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6XPSGkaGvzanb4MBRw8LZJldFMdoaajjsKIeJ6Hcqg=;
	b=Jx8lBGJJFoZ4XS9sIrxt+E/+UxhrOAS5eacl8oOVrxsQPEwOGsh7ziymp7Jhcw0aknc9jL
	rx4jkM82D1+HqKxcXXlJCNGOQKrubnt4h83pcm2c/uI3wqlVykywrb/ypvtzQvd7Jc2Uj+
	1/indJ0RfVvcF4qe96qkUK7rI9fAWFM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-UfsvzzRnPpaSCNa4q6i8DQ-1; Fri,
 17 Apr 2026 04:32:31 -0400
X-MC-Unique: UfsvzzRnPpaSCNa4q6i8DQ-1
X-Mimecast-MFC-AGG-ID: UfsvzzRnPpaSCNa4q6i8DQ_1776414750
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40FE81956048;
	Fri, 17 Apr 2026 08:32:30 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BA6FD195608E;
	Fri, 17 Apr 2026 08:32:25 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 1/2] media: ipu-bridge: Add DMI information of Lenovo X9 to the image upside-down list
Date: Fri, 17 Apr 2026 16:32:13 +0800
Message-ID: <20260417083214.222189-2-hpa@redhat.com>
In-Reply-To: <20260417083214.222189-1-hpa@redhat.com>
References: <20260417083214.222189-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58975-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1229A418C3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
was displayed upside-down. Add the DMI information of Lenovo X9 to
resolve the issue.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 32cc95a766b7..7b5b0dfc0190 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -118,6 +118,38 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		/* Lenovo X9-14 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "21QA"),
+		},
+		.driver_data = "SONY471A",
+	},
+	{
+		/* Lenovo X9-14 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "21QB"),
+		},
+		.driver_data = "SONY471A",
+	},
+	{
+		/* Lenovo X9-15 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
+		},
+		.driver_data = "SONY471A",
+	},
+	{
+		/* Lenovo X9-15 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
+		},
+		.driver_data = "SONY471A",
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.53.0


