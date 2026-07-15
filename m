Return-Path: <linux-media+bounces-67642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GPB2ETlTV2pLJQEAu9opvQ
	(envelope-from <linux-media+bounces-67642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:30:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F9275C834
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:30:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=Mw5cpy7x;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67642-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67642-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 805293007AEF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2EF42B30E;
	Wed, 15 Jul 2026 09:30:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CCF429CD0;
	Wed, 15 Jul 2026 09:30:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107818; cv=none; b=d9FaaBG0C6yefNrPeKHoOIrIaQeczBNxUnSeCK2UyofqHtzgmIOndh7+dlk4dccIXecy/bChBZQ5pwE/wXW7VDgOsrQ1ZgcW2q8WUNaAoP727CKnmCon+YTHGI7i9x/i/+6B7wzmnACybultUkgX50pPEvV6IFoEoMBfyZGSJ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107818; c=relaxed/simple;
	bh=KPk5JABxy1SNrqHAewf521Zhrukm/8D6QG14DHr9QVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uvLcG+6qMSMSQx2kCh4qvnmMtaAXGdd7+Jn3UBlkTR0PcAhmTjcM1oExxyT9IdJx6P+WOD+llTkacH+qCN8q2CxRDJ4wzR4LVQbqW7n1l+REiZfmPaqq9JMMFZr2Db91oaS1PVyupsqGZ9+CZne1P+aH6X8qGNX2cW3AM8NcOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Mw5cpy7x; arc=none smtp.client-ip=220.197.31.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=XA
	kdVsg4hrUdoqtefoG6o30kCJvysqeJTtxqG2RwEKE=; b=Mw5cpy7xFw5/MQdDW+
	tSBxYUkwRkcXHsMj5t8DXGDyTmkyI1z3ZXfSQZ4eh1dIzO5dwSkn60IOznVxgfmE
	yRVuiReX4JLW82SPP4dt2LbYvGIGrxzdJ0kUwosZ+u5dgfSYCGfKxs9+ktDz65RJ
	frR4waQ3sF5Il0hDhTedkKy+4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXXroOU1dqRkKLJg--.52959S3;
	Wed, 15 Jul 2026 17:29:55 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 2/2] media: s2255: check firmware size before reading trailing marker
Date: Wed, 15 Jul 2026 17:29:47 +0800
Message-Id: <20260715092947.772768-2-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260715092947.772768-1-huanglei814@163.com>
References: <20260715092947.772768-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXXroOU1dqRkKLJg--.52959S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF13Wr13Gry3Kw1xtr45Awb_yoW8JF4xpF
	WjkFWDKrsrG3W5XrWxJa1Uuas5WF1rGFWUGFW2k34DXrn3Jwn7Zry8ta4DZ3sFqrs3A3W7
	Jrn0gry09FWqqrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwF4iUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9BNJQGpXUxMzgwAA3j
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:johan@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:huanglei@kylinos.cn,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[huanglei814@163.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67642-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huanglei814@163.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42F9275C834

From: Lei Huang <huanglei@kylinos.cn>

s2255_probe() reads a 4-byte marker and version from the last 8 bytes
of the firmware blob (fw->data[fw_size - 8] and [fw_size - 4]). If the
firmware file is shorter than 8 bytes, fw_size - 8 underflows and the
access reads out of bounds. Validate the firmware size before indexing.

Re-applied after the CamelCase cleanup renamed the error label from
errorFWMARKER to err_fwmarker.

Fixes: 14d962602c8b ("V4L/DVB (8752): s2255drv: firmware improvement patch")
Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index f22f6ad4e8ba..64140b780e63 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2277,6 +2277,11 @@ static int s2255_probe(struct usb_interface *interface,
 	}
 	/* check the firmware is valid */
 	fw_size = dev->fw_data->fw->size;
+	if (fw_size < 8) {
+		dev_err(&interface->dev, "Firmware invalid: too small.\n");
+		retval = -ENODEV;
+		goto err_fwmarker;
+	}
 	pdata = (__le32 *) &dev->fw_data->fw->data[fw_size - 8];
 
 	if (*pdata != S2255_FW_MARKER) {
-- 
2.25.1


