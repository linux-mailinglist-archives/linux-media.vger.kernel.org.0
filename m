Return-Path: <linux-media+bounces-59598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLnGEKHs7GngdgAAu9opvQ
	(envelope-from <linux-media+bounces-59598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AD466E6C
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 18:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8420300646F
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 16:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4998367F26;
	Sat, 25 Apr 2026 16:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRM/pyJF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D478363C4A
	for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134721; cv=none; b=lvUkoA0YL9LvT3w+ytWIFELhsj4h6OmiseKYD7c3artbZWcJp95MypbcfQddBNv/3MZNBqc3RNlgYj3rEnUJN2TSDsaEqsiItbzOgXqb4G8qh+f9qru/zSlsN2POwvdtTbN3hOeOA5YorcjWaPZPmALakIgKKhRMIUmCXEQNuSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134721; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKCk0246pr21dgrj5Kz7YthAF4V0qpdtzOCxPFOVAB/XL/h/kokd4aBUKvasfH3z1S8NaSwnq+Zp+MVyOQGck24/QnQDve+HO9/n48KQscY3rM2DtXNwQ/OXthEZngwbpMbHKaIzIUupygfRpTTfi4DqcmgXi5LlR+NZM7wxVKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRM/pyJF; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2e221a71e19so8653459eec.0
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134718; x=1777739518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=BRM/pyJF4Wc5DelUIb5mB3NelzylN5o7Pxtc+CnZcWyGGR2q4/0nLRf1rx6wjETAoD
         +/x5Eks8WJ44n9nAnaLgQyTcxki8B2/Ea7nsUR+Wljuw556oHou1dnsblQ3OovU3Y2/l
         TMFAEZV3w6ruazM7b/7MVb7nMKKZl6usJJWHiNjGZ0qIrAYvf2n700hWYUnKY0IqwZyC
         Q6v504UtN7eAG0AdSAz8idUzP0UfN+WHB5kp/uVIx83kOmoWt0L6rP2POUqwU7rBbdGI
         hI1QQ7hnFXJcRDgcM3Hw5gIeF6lHnzyHvE9ERn2OuTfPLzx0fBHaeqeNVpLbP/xj0r/D
         mNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134718; x=1777739518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=JPO1+SbX2a1D8nbK8KmFw/xWgkSMyJK+3dBbfsSHtaoGAZ8imkhx+Q0K9QZLFlb3W+
         gwIqmZhNzv8qHc7t3Hn1zQ+ysee4ytKqCxZMETkP62C1VEUgviwX/5/IZ5IaVPgY5xCu
         lQf/K/y3eMCmWmXH42250ux//C8zO/nJzNQ52/xFpIdtB+ExzZLXAjEjbYfEX/3SxNuP
         Mlv/Hu63bNtjKOQAdjwzOZ4neVXhtFoojJL4wvJK6b+wsHSFr4nnns9K0Q9c5ijP9oRP
         /YLTsNg30ZV1jLovMf2Nu+znMv3QbKe3L36bmxL0mHPz15TEkr+11p45HIjx2nLz4nA+
         aVcg==
X-Forwarded-Encrypted: i=1; AFNElJ+ywA7Jqdg5wlYwEXR+2xz4mte6np6MkiCA6sbHqTeo7P3d4TB7eBqZg+Q2Ht/R1wGITLetFkQsPangTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+29dj2Gu/L8V36tfsptXb14WXhvZf0NhD57XGG0D0eWY7Xzg/
	GQoUjFfPnKKSHH8AJORpGbHwWhqXQI66fx+QlsFeucuKpgJLGyyOajXd
X-Gm-Gg: AeBDietmuv/Fj36PHF0/mdgnKda8ps4LAbBeMtFOwpoG0wTMMcj4SNuYk7LgxeyHaXe
	DyWj0NhC+8gfYh6RNOqactDI7A2H3iKrs16ShyhKtiKBz9pdpYUzMzt0DhdaVR88tW/sCeQEtRr
	qK2+hOR1/wkKsqTGPKXI3paZgC6ADqZwopwpbxAU0m84rXf0IE0NSsijXxwFsYSYmrTqvHwwhjp
	JbIP0LoFzmChUCshKMN9ZOqpJL1QAJmfC9VCwWh+V52NbDdqc1Z7jvI2uQy+UfgEhVH9qORQud8
	6WPrWqok05KD3z2CK2OiWbM0DItIhNy4NNmPhVAlUX7zpVF/vYIeuVTGNlCgEI/s13fUxRQJkvq
	OT62+iY+/iTCb1zhcCK7ebbGbFiGf++dqYg/V9zn3pOPkzfjq9pp8BewTZErn8a8o510splDHxI
	Bw0AzqhVLgqhovHrvqhUB5LOtrVj6AzsEehmQ2P34ppbJ2
X-Received: by 2002:a05:7300:2393:b0:2d9:6f2f:9f6f with SMTP id 5a478bee46e88-2e483d82ddbmr21223138eec.24.1777134718278;
        Sat, 25 Apr 2026 09:31:58 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:58 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v6 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Sat, 25 Apr 2026 09:31:44 -0700
Message-ID: <20260425163145.8474-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425163145.8474-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 210AD466E6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	TAGGED_FROM(0.00)[bounces-59598-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tchatard@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.51.0


