Return-Path: <linux-media+bounces-51416-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB55Cxhnc2mivQAAu9opvQ
	(envelope-from <linux-media+bounces-51416-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 13:18:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F234E75A5B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 13:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E438C3052601
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 12:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E7D262808;
	Fri, 23 Jan 2026 12:15:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F548CFC;
	Fri, 23 Jan 2026 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170533; cv=none; b=CLTwy2yc6CAk4G+ptQ5lF4BUfeE3lQt96l5dc3cXDk0y3nzZ8Fvpm9cmMuUoFFZaleuYOPp3sD/6Ju4mpQoJIMFbpWG0N/SOEUnySrSHdqTY9Sn9+LkiWJrfHrTlZlEk7LAIf3HmfGAiV+l0K+fEX6BRSOblvq8VDWW9YTiBCq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170533; c=relaxed/simple;
	bh=fosqJpAoVJIXdTyyPlGx0wrUxhTpuA6bSHikge2lsvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YWTzfV2FhWgcGTH0ASXL3PoGllclkRQYE0jwzBz0t1dcs4dAbsTSaeTuua4rz606pSaxe05VpNKYiWygExSvpK9RnoavJnX5k1iLi2GNe9RnAKRNgUFw/ySiMKB6y+M6mz1/bDD9C/WrSZepu6/hjPhO+tttkTFsEfx5YafKH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 37F50864BC;
	Fri, 23 Jan 2026 13:15:19 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH] media:pci:mgb4: Fixed negative hwmon temperatures processing
Date: Fri, 23 Jan 2026 13:14:58 +0100
Message-ID: <20260123121458.3612-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[gpxsee.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl];
	TAGGED_FROM(0.00)[bounces-51416-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tumic@gpxsee.org,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: F234E75A5B
X-Rspamd-Action: no action

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

The "magic" temperature formula must be computed using a signed integer for
negative temperatures to work properly.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index a7cb8dc50b53..0fd6c1c95abc 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -84,7 +84,8 @@ static int temp_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		     int channel, long *val)
 {
 	struct mgb4_dev *mgbdev = dev_get_drvdata(dev);
-	u32 val10, raw;
+	u32 raw;
+	int val10;
 
 	if (type != hwmon_temp || attr != hwmon_temp_input)
 		return -EOPNOTSUPP;

base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
-- 
2.52.0


