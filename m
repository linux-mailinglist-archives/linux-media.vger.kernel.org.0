Return-Path: <linux-media+bounces-64851-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L+kMMjMPL2p47gQAu9opvQ
	(envelope-from <linux-media+bounces-64851-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1F6822AF
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:29:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KBJadI9Q;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64851-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64851-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DF7A300D337
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B38D31E855;
	Sun, 14 Jun 2026 20:29:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10F531AAA8
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:29:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468960; cv=none; b=bPHwHPVlhVf76swcNtzVKgQuFuUMxR90Ausu0qP2lLYrl8L+07nD9771GGkEhRm92D/PH8yj7fnYayCKImYJxBNoVr7oA8ttTv63N79zo+pKa2/wIGEkRboI7YyiZ6LWc5YzlPFCMbvnhfe7ZHLQasR7/5/2JjufH6JH44G/+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468960; c=relaxed/simple;
	bh=0SyvN8QlE3YqmUGwNDVGg4TCoxbx4wa1RTY6fSBHADY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uF/56p9IjsLb4wum43aQZza6nvYMYGCRfbWT3UJ6ZnjT1X3MRCXd4XsrtoIoDh439OuqAfAaaR0Px9ZuVoXZtxs8C3Un1UODBlZ/dbWwHAP+6kQ8iO0zNHGi7FpT02STqTrIDiPMPEUfq6t8Lfobx+6cUqosaCqjysyczzsM8bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBJadI9Q; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so1815562a91.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781468959; x=1782073759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fL8pfMxQlyPOKcZor4jT0jMhvasDcH2Y3Jz1nScWx1A=;
        b=KBJadI9QvKh/0zoqzSdMMEEH9xZhxwpnNn9zx3Nd0X/13xyS9J1u80Hr8+3AYb/G5G
         0pUexDckDB8PSYOVjyh2QT7GElv/nLzdCiE+34meeHskVIGW7QvHaeLP6bQKS7T83K5M
         IoLjlxEw2J34KuVDisOOq4bff19K3I6VRgCX7/xljxAZtC665WGKlkeLrn0vtovzswoT
         WUoag1bf7pl7vnYUkc1po1ynvwyrv2DpPLNGzIChJyiqPZIOXm8/wiTX/dmHQ8tUpVKx
         PGtPGIY6GF0mhNhCs9kWAV3vNBCr2ZDGgK28Q8Q/GcFnjzmB7kCBwlF10FLkwhz28d00
         RLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781468959; x=1782073759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fL8pfMxQlyPOKcZor4jT0jMhvasDcH2Y3Jz1nScWx1A=;
        b=slAbEboIw+rC0GRbPEPIjz5458NO8O9ogyMbjDdDki7XKi3KV55TJfwIYtAxioBNG+
         j3XOz09ADd13tfFWh7YPD+Zw+EnwGagONZNyAM8M8poeGqZ+z+y39uHFt/O/pQhhf5Dn
         dQwr4jN3frrlfZc7Q1iWCwpCqJvzNCQBzoMyeehkUR5DzjpOMr/K4eJTkWPkNEfdm0FS
         c1c1C+jus2lHht+ylpcs7YfqZ75qiDGMqw/QJwN7dFSX5H+kRy1akUwJK2c4E/FcHA/W
         dquRUEFQGXgmjJ3yUy8E/S40imBlQymg7kVDuGiItMGXCbbzb8plMb1d13w8FMSyGomu
         seXw==
X-Gm-Message-State: AOJu0YyErPB7XGcriSiDjlkmpugPG5QVaImIxVw+CJMdJvPNqdwgF6Tw
	jHcyfWvNTujj4X69RKRw+np4PPlqyB6G0dFneu9gjHbDLBYXK5PM31q/1OCaujTS
X-Gm-Gg: Acq92OEXWd/kvHf0bsCCejrf0+Nir5W1Q1sc9iMhapzHw/PRR68dp7oMDed2uwcXWl+
	Ai+HWFoFPiGOf9In+SgPSnRHa/jKRbMcVtZ2gSO/k/xS103ieV9rw5tgk/mmG/svuDuOdYSznFi
	FVjxv4mHpBJPk2Qoz4DOr8auZRP6TXoV1Oj+LizikDMAPAxtNbrufngdO5aaS14SRHYwfGjkDlC
	Or1LkSFISPTaxQH0qxSl9vfzZ7uCdc59/YCicTrr6JdmRgUiBrG004cbg5muwRRKwGk5E0KdOyv
	2xxeChZdhYK2NSyKxPMv0TP3PeUznDNgXlJJ+ynZ8sGwutE+DuPRKDtFKDwEUd/HnR6w4+IVnKL
	mdO2rp//ZlD0VBB54PJADsKiLx0uoN2g4k6u6eOkDHFpK2S23zWokCPgE82xJtWUpqVWboUoO7X
	HPcy64Hx1nPMvTDnLfZJoNe0cG9pG6iNN9izVOmDh+wER/J/4BQj+e
X-Received: by 2002:a17:90b:4c4f:b0:369:1dbb:4732 with SMTP id 98e67ed59e1d1-37a1ad440ddmr7822062a91.0.1781468959225;
        Sun, 14 Jun 2026 13:29:19 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.29.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:29:18 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v3 08/22] media: platform: microchip-isc-scaler: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:08 +0530
Message-ID: <20260614202835.11977-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,jmondi.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64851-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:ehristev@kernel.org,m:mchehab@kernel.org,m:jacopo@jmondi.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39C1F6822AF

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Fixes: 920b2665f392 ("media: microchip: microchip-isc: prepare for media controller support")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/microchip/microchip-isc-scaler.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-scaler.c b/drivers/media/platform/microchip/microchip-isc-scaler.c
index e83463543e21..c368c66d9c8b 100644
--- a/drivers/media/platform/microchip/microchip-isc-scaler.c
+++ b/drivers/media/platform/microchip/microchip-isc-scaler.c
@@ -222,6 +222,7 @@ int isc_scaler_init(struct isc_device *isc)
 	ret = v4l2_device_register_subdev(&isc->v4l2_dev, &isc->scaler_sd);
 	if (ret < 0) {
 		dev_err(isc->dev, "scaler sd failed to register subdev\n");
+		media_entity_cleanup(&isc->scaler_sd.entity);
 		return ret;
 	}
 
@@ -229,6 +230,12 @@ int isc_scaler_init(struct isc_device *isc)
 }
 EXPORT_SYMBOL_GPL(isc_scaler_init);
 
+void isc_scaler_unregister(struct isc_device *isc)
+{
+	media_entity_cleanup(&isc->scaler_sd.entity);
+}
+EXPORT_SYMBOL_GPL(isc_scaler_unregister);
+
 int isc_scaler_link(struct isc_device *isc)
 {
 	int ret;
-- 
2.50.1 (Apple Git-155)


 drivers/media/platform/microchip/microchip-isc-base.c | 1 +
 drivers/media/platform/microchip/microchip-isc.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index a7cdc743fda7..27e180aff9a2 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1949,6 +1949,7 @@ EXPORT_SYMBOL_GPL(isc_mc_init);
 
 void isc_mc_cleanup(struct isc_device *isc)
 {
+	isc_scaler_unregister(isc);
 	media_entity_cleanup(&isc->video_dev.entity);
 	media_device_cleanup(&isc->mdev);
 }
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index ad4e98a1dd8f..40a54d7d7e10 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -392,6 +392,7 @@ void microchip_isc_clk_cleanup(struct isc_device *isc);
 
 int isc_scaler_link(struct isc_device *isc);
 int isc_scaler_init(struct isc_device *isc);
+void isc_scaler_unregister(struct isc_device *isc);
 int isc_mc_init(struct isc_device *isc, u32 ver);
 void isc_mc_cleanup(struct isc_device *isc);
 
-- 
2.50.1 (Apple Git-155)


