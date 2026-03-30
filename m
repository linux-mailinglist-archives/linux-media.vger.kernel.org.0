Return-Path: <linux-media+bounces-57545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPuBEA0oymnX5gUAu9opvQ
	(envelope-from <linux-media+bounces-57545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:36:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C07DC356826
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E01123003D1B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF8C3A0B11;
	Mon, 30 Mar 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/SqjIxU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2081A37F749
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856175; cv=none; b=LpUZxuu3FO9o/PfdGNhwUxPD1eBdFc1ku1slYuFuEmwwnbwDsXwwGoR50gJKjsX0JBW2q9AIQ9qd9hdct6NSrBHwwW0llAbiKC/qZ4b/WAa/AbY/aC77DYKnr7Fkbs89hJgAKnrNtruTB4QN4/VELn130hKN8zsKfVUzbaVfSMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856175; c=relaxed/simple;
	bh=6waufSmesp2JgfF19DKXBQuLDjcjbl+OJb3oAYIjJSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbskaaPGOO202n6dilbvEtzVOeVfjPEipMkbFQd11eCIkdXKV18WyJEBhdonUVV91X3Ev91n7W6xlAj77vXBBRw+22ZP5xSVBDaidJeBFbOK884W4aXyQSvnfLRba5IcRj3fLBUyfd5uqZD5HmuF4XN6sQ151sUJsvMH3AWiojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/SqjIxU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso34774335e9.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 00:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856171; x=1775460971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12hnKdjz6/Mr8B3it9Q0v2b6LVUl8V91nVrdlKXH76o=;
        b=h/SqjIxUi4vaqxkwdlHjHb2Pl/P6Giy80RLIla4TcGvjEgVU6Qn8YHziqZmvzvtTIC
         lQE388a+kqLDxLm0K7+t8axKtDdbalf4kq1+kIrROQgZDCC7gliU7NE4Uic18bSCoGmw
         00XagnUjkPxo5XUlGuMLwpA5h5kYCukHJlU9lDtgZP+P/w7uTa389jwVWWSzsGztlZu7
         fwLNT1IB99PGJ5i2NyAqleZKtYIWtIqECVhI2ddLVTdMoTHpWQ27LO+gKbFXrhQT3VXJ
         15PSbIE0DyvFbnCaJ4DB+ZI0y0l4nBNXJsy9SAVPsu0TuHwGVocWPS6bI7+BcYWN/Gss
         M/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856171; x=1775460971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12hnKdjz6/Mr8B3it9Q0v2b6LVUl8V91nVrdlKXH76o=;
        b=X2Qqab23dXRFdp0Jq+2wmVniqaH4OnKzS1or18z5klY1Y04ntyvdytpiCnZ5OCJukx
         mCyzIGkInu9P7RyX7znbkr4hTCH0/15QeOoyybD50ITgzhbDlljjWDppmogk8zZuZAQx
         ICZwDuxHsrw3qAXtMNrgm5JZW6/3J9u19oP4vDbd8kVWF4t0tPejC6iAf+4GyLN12rIQ
         /s+VuZQxoU2I90md0Vz4FC5V/79YxWU5XPmMgB5C6m+EOKbsn1F7pmeIeF+dVOzZhO4I
         k+QscCnHknIqxq/IWBk65Tgptnhu0a9ak3xZ7J2Dss7lcNMwAoXTVhuQcu3agUInYbLT
         1jrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFsg+9HRDf/wZV1lYnGTVad1aRYr6a4uox4fPRDQHEAIKnIqStDq2yHIkvehgYhzJmVENJx+JmqX0p2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy82HmWWaw72x0hO27qC9Gi+dEz9uAc72cQVGXC9k0PZiXX5rne
	kdjhyOM+e+PETb1+XpJz8jMoKzaU2A8uzdnzfyJA4FkE7eXY/M3r5ejx
X-Gm-Gg: ATEYQzwoUT8T8Pr5IqQvKVRsBcfPIKZdK3X3V9FObZuwJcPGGO6IDkWU6buc7vEq83G
	JwB9V6bH/0qowutK7U4BnRnIFZJ/8+15CdZdasM+Jq6z0DGG9nLFMvASGUuiIRSu7tw/fSU3ek/
	Fd7WudAYgdh8qu2axWA44qYLuSiSlrM2MtvmWQGORkK9lJKqvVxMBGVfm9xFhnhTHemeoX6e4VX
	DeWchtKTcI0C7RL8+zovk/YrnDHdzGmN+4P0hNXRw139MEGucv4vxVZ78GsIYdo7nbg82DgR84h
	r5Dt3BjAw1gTIagtbySowwnRc5XSYwEi2ScOOUHMivMX7cSMuKg+NX4oNd5jncpV2S1qFEIoi9z
	p0mZ9RmHfDMlOpHeWFDlIhRuGz1CUIJgc5kgKbttBSCiS6Dhd4inD9KM3vHLW/Ctiliuq3ScfUx
	TDR6PwsSEQ5IUsepDaao5OFeIvfiklUWqt/IXVfnYHOQkddNUc+Yg=
X-Received: by 2002:a05:600c:1393:b0:487:288:1199 with SMTP id 5b1f17b1804b1-48727ef16c5mr199023885e9.28.1774856171307;
        Mon, 30 Mar 2026 00:36:11 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:10 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 1/4] staging: media: atomisp: fix SPDX license identifier style
Date: Mon, 30 Mar 2026 10:35:46 +0300
Message-ID: <20260330073549.5782-2-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,nxp.com,vger.kernel.org,lists.linux.dev,ti.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57545-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C07DC356826
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the C-style block comment for the SPDX license identifier in the
header file as per Linux kernel coding standards.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..c99fb649fb5f 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -1,5 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
-- 
2.43.0


