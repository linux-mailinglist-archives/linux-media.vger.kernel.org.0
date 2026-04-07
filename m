Return-Path: <linux-media+bounces-58141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAh6J5hX1GkgtQcAu9opvQ
	(envelope-from <linux-media+bounces-58141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 03:02:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782A3A88A8
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 03:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57BD03034A1F
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 01:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D967117A300;
	Tue,  7 Apr 2026 01:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjOLlmtf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F2A1E4BE
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 01:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775523720; cv=none; b=Hc02t85b5PHhHVEfvNp/VYEU5xpcIfJ4GZ0bN6qblxUfg1paRpjOLbHCLZ7D5fptvbb0FIWeWpk7Giw2YOadA1ygVsIbFdo1yTYv846PSBdThwIZYE9MCW1NfAcX7kkUXmQU/2w2JcBThAP8E5rajq3n+LEgh1SqkVPtY/NUdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775523720; c=relaxed/simple;
	bh=ldVkH82Ogb1CKzMVpqM/V/WVuLz1cIfwYBAeg4IRBJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LUTzIh3Ij67VnQPH5k+QfQD6yAd/PvjuWD6A9YrDyfq9hQ8Mgifvyv51ocqOL5WTDwIyCzgiXKLCOaeIXGXQqSMefhXPH/1ZTibiFvQJ328wwAFEVIt9kQnDBP5ZMJbLibPUtnF+W78qXXjFhJaqXXLOsXBtHA1Z6m06/tHP8rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjOLlmtf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b2429f98d0so28660745ad.2
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2026 18:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775523718; x=1776128518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtZf8qslJlc/Qs5L5CsqmY7NGi+VR5R6jMYyuK26CRA=;
        b=AjOLlmtfxw0+0QfSGdRB9VMleQoHQv9YEk2/92cZArjSutajN5cTGqcfOXcvYA7TCL
         +TY+ydstEJVBxK3mDUztJjkd19VD2CkEzUHdUndc/VwARZYi/5hKwGaN6MdzjVTMUR9b
         4JHRAlEkHZlIHTypd8ZQ7Dv42uJpAsglxarDdYJ9oz0ha3Lln+KiTniEwRDhyJPJMr5y
         uLdrxla38CIwFaUj2eDcLromrVYKWWm/jos/xjkNIbw3XNsZehJaQuC2kuBW1BfqZMBf
         PgqmVBk8WQpn/FWlblRAQtko408rAnTI7KQVmvrJ8eJCwIk5CAVC0rvGCO9LkbF0lDo3
         uq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775523718; x=1776128518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtZf8qslJlc/Qs5L5CsqmY7NGi+VR5R6jMYyuK26CRA=;
        b=h6+M8hSBfzOzAEu2LKAp60fuPJJiJIY3PWLpKG1zLSdTYkZ+lA+eBzHTHQjZqOx1yX
         2mOTrdPfNCu7/xD9P91jGfmEMSCAKyn52kiDWLP+w+5OaaFQPbU4U3R9wCi+eE2c/3vY
         k2hwYK5mwKWOxgBlrdcmypY+z+Nf0IwHqpRECjbYX0o6PDy5pyPXSTzHr6VLApVfa27z
         U+HsfI9C0rEFtxb3ezHodWHRz8GGRm1PyCrg+Zm4EC8Hv6NhGGqCqgpDzisPPVMB0uId
         ZZeiY7WOtt7W4eLQkI9BX0Idt400Z6P4tF50wqSpfArc62guu5X6d6u+zNiPcZ2t9IiH
         ioQA==
X-Gm-Message-State: AOJu0YzZciZzZD/v6j11VSQNVZ4M5dRvUpQLp2Cz0xD17N0UzfCINBP3
	wa427CmtMKBH2gPlF+3FPPYYow+3eVvx6dY/QZ+ay/tIkPS+G1bJ/4LT9dx/5g==
X-Gm-Gg: AeBDies46+GWS6+LvvzK+tIHjc2eU9NW12IOPmmT1kEkNQYsWkVKdiK6H8rUbXvIdMa
	g7yySDb8X4DTtlcDBHI87Yv7ZEEHJOqXHPowDUbT671u7FLFIZwMDSOZWUuGz0SB6PGTxN1m405
	fAkUWGRFaLCsrf3H5R4wgB6ZruiypK/UslphIOzFLoU34gl0+awJNmnO2SF7bdN6Jwz3KB8vfJu
	KVKtlmVJPcfO6bjyfpmbgF3Ocl9s+mLe5MIFMXY4V+K+SwTtdvEdqLxrrtYXaRWT0qsb4My/hoh
	xgbbb93PyqJrx3x5HcQEz/GqCkYBN6uwdfFDzOCnryvmMMOnkqg4BlqmbDhCy7+qIBSS5Pn47Or
	rY8b8wii4EwPWyuefdW2LU5qPCDLAJ5hU1pc0lk7mRUjUFHJRBtr2x9YkUxgJuO6kVPZ5MDlN7f
	XkuszmN3We4ZIzYd8dxWSg2v46La/bP0SvlkoGXoyp0ns3kjam1R/iNR4=
X-Received: by 2002:a17:903:384c:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b28176a464mr150754885ad.27.1775523718187;
        Mon, 06 Apr 2026 18:01:58 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm153194735ad.3.2026.04.06.18.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 18:01:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] media: dvb_ca_en50221: simplify ca allocation
Date: Mon,  6 Apr 2026 18:01:40 -0700
Message-ID: <20260407010140.3229-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-58141-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5782A3A88A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member to combine allocations and simplify memory
handling slightly.

Add __counted_by for extra runtime analysis. Move counting variable
assignment after allocation as done by kzalloc_flex for GCC >= 15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 1b91ebb8f667..a792feb076ef 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -125,9 +125,6 @@ struct dvb_ca_private {
 	/* number of slots supported by this CA interface */
 	unsigned int slot_count;
 
-	/* information on each slot */
-	struct dvb_ca_slot *slot_info;
-
 	/* wait queues for read() and write() operations */
 	wait_queue_head_t wait_queue;
 
@@ -157,6 +154,9 @@ struct dvb_ca_private {
 
 	/* Whether the device is disconnected */
 	int exit;
+
+	/* information on each slot */
+	struct dvb_ca_slot slot_info[] __counted_by(slot_count);
 };
 
 static void dvb_ca_private_free(struct dvb_ca_private *ca)
@@ -167,7 +167,6 @@ static void dvb_ca_private_free(struct dvb_ca_private *ca)
 	for (i = 0; i < ca->slot_count; i++)
 		vfree(ca->slot_info[i].rx_buffer.data);
 
-	kfree(ca->slot_info);
 	kfree(ca);
 }
 
@@ -1880,20 +1879,15 @@ int dvb_ca_en50221_init(struct dvb_adapter *dvb_adapter,
 		return -EINVAL;
 
 	/* initialise the system data */
-	ca = kzalloc_obj(*ca);
+	ca = kzalloc_flex(*ca, slot_info, slot_count);
 	if (!ca) {
 		ret = -ENOMEM;
 		goto exit;
 	}
+	ca->slot_count = slot_count;
 	kref_init(&ca->refcount);
 	ca->pub = pubca;
 	ca->flags = flags;
-	ca->slot_count = slot_count;
-	ca->slot_info = kzalloc_objs(struct dvb_ca_slot, slot_count);
-	if (!ca->slot_info) {
-		ret = -ENOMEM;
-		goto free_ca;
-	}
 	init_waitqueue_head(&ca->wait_queue);
 	ca->open = 0;
 	ca->wakeup = 0;
@@ -1904,7 +1898,7 @@ int dvb_ca_en50221_init(struct dvb_adapter *dvb_adapter,
 	ret = dvb_register_device(dvb_adapter, &ca->dvbdev, &dvbdev_ca, ca,
 				  DVB_DEVICE_CA, 0);
 	if (ret)
-		goto free_slot_info;
+		goto free_ca;
 
 	/* now initialise each slot */
 	for (i = 0; i < slot_count; i++) {
@@ -1939,8 +1933,6 @@ int dvb_ca_en50221_init(struct dvb_adapter *dvb_adapter,
 
 unregister_device:
 	dvb_unregister_device(ca->dvbdev);
-free_slot_info:
-	kfree(ca->slot_info);
 free_ca:
 	kfree(ca);
 exit:
-- 
2.53.0


