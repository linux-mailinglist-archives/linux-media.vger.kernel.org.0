Return-Path: <linux-media+bounces-58617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Lq2GmcG3GkgLQkAu9opvQ
	(envelope-from <linux-media+bounces-58617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 22:53:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C43E5F70
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 22:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 566A0301C3EF
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 20:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2155A37F8D2;
	Sun, 12 Apr 2026 20:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRvHqU0c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5040E37F016
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027160; cv=none; b=K1gbgTr+TdULjzIKY+4StvD635nIn0MhSK9qZv/GjEXFV+PZ1BkzNi2hlXC7RnxgbPDvmx7NX3iEBT1nTzbI6iJuRbRzZLZv3xVMSywrJuqECLfxvezQJZzu0UYdup1TNq1emHI05XdNfo6blPRQ60D4JGyGGDGeKlvXpnTirMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027160; c=relaxed/simple;
	bh=nIUuhPo14Rb84c9rV0PW6bxTvbOBeIThPmGOtOwZmx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5AyM0SR6Y0WhYwBCRs04sPVoWASBzV2g71AlQN0v4oBfBCM+MD0uh/vWlj7vbhDwwFjlTNUcEDmX5OzphCDvoAk0oHELSGx4omooeQXav11mgQLojIo/n3rhQYbFegMzJbWxClYHU5FUeN4/DMAMGxntDvouzV0j51McNA+Wfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRvHqU0c; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6718ebdf7c7so218800a12.0
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027158; x=1776631958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgiKlidCsyHiOBrFB0tntTy3c+WIv2+mYS1vg1TsEJk=;
        b=SRvHqU0cvqXIuBAvYsatUd8JCJsoCOW7XKYNbUgnc7xayIbXzyoG1SurCOOtvrrcx1
         Cq+rkugBUeCHZVi6mR7DcdvkKnfXflHHP0LageNvFbqlO0AdJKIfn54P3P+uQlFZ7EwL
         QiV6pJnhuX5PV8FzrvnpiGePKtmWDABBpYJu0cbKLg+YSC5SkAiPyEBegi3eWLK1eWUC
         6ZZaq86up6GoDsFkca4T3/6Zd6Bg843eLYNrmdumHPDZcSc2SFNyo9pZjZPm2Va5Xe1L
         v5+kOwzEyZJz3GxwWLAnJe8Ns7Qn+TrSCi2GoadoDn9gu1a1Wy2FDAFeKtTlEcPWhtCE
         LAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027158; x=1776631958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgiKlidCsyHiOBrFB0tntTy3c+WIv2+mYS1vg1TsEJk=;
        b=OeldS37M7VH6znWQyFe4TFm44DJhShgdFJyEy9SmiOCexNH6iaceTyt851YAYlMsVy
         Qx36gtT6I8chhsKBiWf+e1iiJD/a+ukibNjWxqd+JG/p4rM2ZUUi0dOAxxgpY1ObZ7yt
         vAmC3zAo019ECl0sncrALjnWEpCl7zkBbAInsbhHtrjdUCMNp2ApqXlOKdMT29mZGqxV
         FPQg/Eq3W4H7IBX1u6jT9rhTKoR5Bkylq1Wrt7nOA+NGBfRKwAJQT6TluEjMnZl158e9
         Wk9jGZwCak8RgLTl2+S2fdmdAQHZMWTXgRWJ0KAfKoNuDgflLfv2prhmCLJLtaHgTe4O
         myEA==
X-Gm-Message-State: AOJu0Yw9um37IhVVihmzbJp/Y9feYwPs5KWIWe2LbnkKYkj9q23WTT6w
	V1Hr3ks/QRTIvxkilnh314zmXzVU6oz8ZCH1kbfqyH0ziyMqbKumqFOn4vcX3/y2uxM=
X-Gm-Gg: AeBDiet/cRoGOOrctUwZOWDy7pVsIE0p9nZ6x/63+scQ0cK7WpNpHHBSgkVJQphv9B8
	k2oP4luIiVXQ2E71BGdZIUSAexGbUAwuMJOhDTN88t3PdoaMHteGh1vycjFywfI/RE0hIkSBBen
	zSysJfrtiKzALd8/065pe9oavcosPpsQ1z+rFIsIdrxF+ByohRoxiYBN+3qBKnnrg9GPjbgUgAX
	dWnKdazJfa/JFkihW33HirHzrEQXDi6k38TE6m0vLlDuZTyoyqfeAfdOWRLNQvdLV0VgSFPho86
	sTaXaRTrL2kwsi8Mnb6Lvbx7hkYY9mZvxotKNioC1kiSh1PkDZ4xKcpHeVE3fyS7YOaORJH9ldc
	+/4Sime/0a3dL97XfLvpPkuvxbIkjcx4WMO0IQXD6fA5nAR731iOAqY2RPl40JghJtf6PFwRWIi
	eQNTSHxPVXFG0MWezRuOZT864T3Y6yCt5k3A0hMVnYNp2ECct61xRiPCogAcna9wMgyspxOwq26
	jOytflii1RJQ6EByWxTOtxX6DmElW1kqxSTuQWvbvmqJagrRDCjRaw/fLvwutl2QBtNSOx5YGs1
	6cY4EA==
X-Received: by 2002:a17:906:518c:20b0:b9c:7748:a26f with SMTP id a640c23a62f3a-b9d7260e086mr457213466b.17.1776027157563;
        Sun, 12 Apr 2026 13:52:37 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e36sm265193866b.10.2026.04.12.13.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:36 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 2/5] staging: media: max96712: add NULL check for of_device_get_match_data()
Date: Sun, 12 Apr 2026 22:51:08 +0200
Message-ID: <20260412205108.387023-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58617-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[hossualexandru@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ragnatech.se,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E05C43E5F70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

max96712_probe() calls of_device_get_match_data() to retrieve chip-specific
data from the device tree match table, but does not check the return value
for NULL before using it.

The pointer is dereferenced later in the same probe call via
max96712_mipi_configure(), which accesses priv->info->dpllfreq. A NULL
return would cause a kernel NULL pointer dereference.

Add a NULL check returning -ENODEV immediately after the call, consistent
with the defensive pattern used in other staging media drivers.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/max96712/max96712.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0751b2e04895..8a65c37ac739 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -416,6 +416,8 @@ static int max96712_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	priv->info = of_device_get_match_data(&client->dev);
+	if (!priv->info)
+		return -ENODEV;
 
 	priv->client = client;
 
-- 
2.53.0


