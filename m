Return-Path: <linux-media+bounces-65495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HjHNK6dQO2ojWAgAu9opvQ
	(envelope-from <linux-media+bounces-65495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 05:36:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 007986BB1D2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 05:36:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=G4Q3EMWq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65495-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65495-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8ECF03023654
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 03:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FD130BF52;
	Wed, 24 Jun 2026 03:35:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E6309EE6
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 03:35:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272145; cv=none; b=P5uR0hfP/htkQRYeEy5GlXtSkAKCk/DkKJh9OXsGepQv7qxvPcB+CdJa7J6jH47l9+0xW+5OZ6/R9k4BoAx7MHZ5DTQjx4gT8rBO4yxkyFH6Z6xRwygWLKgPyoyu1hl7TU1MvfgGjwREn5UAeLFzIxAv/12JKf3pZuTC2VEQsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272145; c=relaxed/simple;
	bh=LmCfoAfqTzaypii7UNkAlnh3r+PDzWTSrj9G9wDOSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEHYvIrcDaDsJg3hi1nYM6Zuvza5FneJJ3hD9apxw8uTz7LbJF7UM2xbuZsqd7v7L0qzQPZvwLVhFpPQ36b+XEb+apQpLDNcqLWM3FLIg7jXHsh7da0dbBtW/0wV+Dwy2ajJ6vdCzUjChLhvmGZ1XS/FcrooV1llSM69oZR5IiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G4Q3EMWq; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782272143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y76BXjB6jF0TQ2a3vQSuyC3iw7Y3ehjGpmne3lURBRk=;
	b=G4Q3EMWqTkbIzQg6vv32m6SkcwUUjeGxOO5qNclnynSzxAuW3S/H3RF+Ec+QamoABQ25R4
	Ur34SrVxcCiipSlBXfNwpvoFmK8sUgGgXH0qEWaVI0lM+5qmW9kG7OX9FJ8ln4LNbjFGcR
	LgjaikJsv8yQ9662e3xvo7G5/1VbzAk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-nt55DC1rPdSBcPU2U3JIxA-1; Tue,
 23 Jun 2026 23:35:39 -0400
X-MC-Unique: nt55DC1rPdSBcPU2U3JIxA-1
X-Mimecast-MFC-AGG-ID: nt55DC1rPdSBcPU2U3JIxA_1782272138
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA073180025A;
	Wed, 24 Jun 2026 03:35:37 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.90])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 842FA1800351;
	Wed, 24 Jun 2026 03:35:32 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v5 1/3] media: ipu-bridge: Add DMI information of Lenovo X9 to the image upside-down list
Date: Wed, 24 Jun 2026 11:35:06 +0800
Message-ID: <20260624033508.27391-2-hpa@redhat.com>
In-Reply-To: <20260624033508.27391-1-hpa@redhat.com>
References: <20260624033508.27391-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:gdamjan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hpa@redhat.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65495-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,siliconsignals.io,gmail.com];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lenovo.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 007986BB1D2

The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the image
was displayed upside-down. Add the DMI information of Lenovo X9 to
resolve the issue.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 88581a4c081d..2474452b3015 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -134,6 +134,45 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	/*
+	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
+	 * machine type/model. For example, a DMI_BOARD_NAME starting with
+	 * "21Q6" indicates a ThinkPad X9-15.
+	 *
+	 * Reference: https://psref.lenovo.com/
+	 */
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
2.54.0


