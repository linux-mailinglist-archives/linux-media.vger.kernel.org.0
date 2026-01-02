Return-Path: <linux-media+bounces-49856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AE3CEF812
	for <lists+linux-media@lfdr.de>; Sat, 03 Jan 2026 01:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5CBE30133B1
	for <lists+linux-media@lfdr.de>; Sat,  3 Jan 2026 00:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593CB2C21F0;
	Sat,  3 Jan 2026 00:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrMMoMCz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072472701B1
	for <linux-media@vger.kernel.org>; Sat,  3 Jan 2026 00:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767398405; cv=none; b=cgpq5fRxmAZM4+WhzXoAgnZFXoHA+/a5G0Nh93LbXbtcSmJJlovztlLk8ON+1Dyx47UkYxqv5+BJhx6T8RQSQfhPYqyt39EYodRuVqIB352e1/e6hzcbvgBRpuQJTUp8aiQNHxha4Fd5Y1UUTsjJbrlEOdfPyK7v1DwGM8Tuya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767398405; c=relaxed/simple;
	bh=mC6YzU/0q8inzQrz02J15BiDm+VlwW5SX3AheFMhUjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEnW3P0MNq+du4kQVkPAjXZ7IBOMPz93FdlnTiMXP1oWQJv+RXqYwupT+nJg7p8L4SUoo/ZHdtCkwBN8p4nPHEPr8IgheiIBV6C39vofeGTIMVkNKYvqTxo5Z3ayjZ16tRbsSOnyAF8GwptroM/V+560Zjx2/aEmsHilOs6zTJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrMMoMCz; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c30365ac43so166602285a.0
        for <linux-media@vger.kernel.org>; Fri, 02 Jan 2026 16:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767398400; x=1768003200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFDUshfm8K4s8Z3vz05wVzHPn6S3Snwrb9oPx9OleW0=;
        b=WrMMoMCzsksphVDK/2mj5c4yUfDLy0UrGSj7D9JzXWd7aB9DWl0JB2oTi/bmmJaDW2
         fbE9yZXQ8nK/WTn8u3aCXlIxQU4be9+csn3QyOxOQEV2AAmEOAvqrLKFop5U2At5k9lM
         +88bDzHsmgd4FUq2YD868rcLXs7a8yECAQeplPVJ6xOGbr7IkuU83bV27azAA/D9OHdd
         /qLjHXvCwzd9Vy9ibhP1ImMthX4A9KiHlLtMI80LxBT9/Mu54V7JlKyuYHpevEQOpHLV
         JiSCWIi2awB7+AvCtRVvogUxSnZaEWmMIpDtmWhdPTP4zgn+1Y8qlZsRsRcDcA8jdENX
         JeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767398400; x=1768003200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFDUshfm8K4s8Z3vz05wVzHPn6S3Snwrb9oPx9OleW0=;
        b=mJ2qDQlOKdCQcrxaqGhHE0ozIhoHduaWxPeFyRtBB9KUMkdS2Tuzu6ky//oofrxqY/
         uCFWY0KVmXgb9E4eH8xSnIZqOoSFCo9AGeA1eLzb5AyHHNgq6mtsoFyAYP/gA747YZrw
         D7GrubebhDGhECLaI4mWUgwUn+l3uS7D/bjJXYkPCz1sRzWyD0Uu8EBMjTTgbVlKW4iD
         jkVbKQHc0Lmg/KnDtP2TjJ5K3bWfjUyc59TD7oLbouVlGGKAALrIqoTM2H/dvaupSgqi
         ihw3abDBpQ1/+qa8tht2OPekGfM1z9uTB+nkRpwsvOX4fg3P11VhpkIG9UTdqNbHVB6v
         latA==
X-Gm-Message-State: AOJu0YzokXvIOSR516z6yVGoQRzdwvNJ9sKvF/ILyUK89xMVIrBqTB+U
	sqQno5sgoLuzrtenicoftTeDH6ilyYzBCE+acg0clbndodi7AqYtFMxu/z80xg==
X-Gm-Gg: AY/fxX6ACItIZOxNMOD6PbdDWyj6uDKdcG1AsNMncruteA/PC7NdOtrjOI+enc/RdBO
	eCc5ZVpWzpwORa6aXJX6VHgbM34hvfpSaXHHb5xEn9DKpsDLs25G5iBnbAsOGq74q1fvg9Vk0ZA
	9zGZJKgjNa8D3oi6ggR/w3O8P9fhrpKbKksuaXw738hmaTxcDoKH7LUEMzycEpKkcGL4p0rv0Ke
	h/z77TAGVEY50utVxwxZT8ZyrpyS0wiea4AtyXaQKrUdgA5Kv0wwP03oPQLbCmDj3RbeFfdbXOm
	HTkiQvO+kKM8srdXzqG7QBbP5VKu4wqmjHB0uvcthliCXoUJk6PrG4Xh9Tca0Poc3XjojM6CjBe
	SJd8gt+MNQQk9Qi/PzDN6qQ7egKyqnp7Z6ULNl+2/1F+OEtjyM7mHxnULgZj5RjSSsJ/Xiy7iRG
	2MSQtjcPQkZ74QL9Epsvkg+HaD2/w4JhgC+Sb9wsQrXEZp7Q0=
X-Google-Smtp-Source: AGHT+IENyh/jR6BqDDHMgkGdz2e5A7MU9UAiO/pQ/AGBkj8BX95P+4CMOBhhybhYj9/tTcEAMi+ymA==
X-Received: by 2002:a05:620a:488d:b0:8b2:7777:f662 with SMTP id af79cd13be357-8c08fab9d53mr6976608285a.64.1767398400211;
        Fri, 02 Jan 2026 16:00:00 -0800 (PST)
Received: from ACERWIN10 ([2607:fea8:bfdb:3500:1070:5a6d:5e26:d87e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975eeb4bsm3334401285a.52.2026.01.02.15.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 15:59:58 -0800 (PST)
From: Martin Vallevand <mvallevand@gmail.com>
X-Google-Original-From: Martin Vallevand <r3o2c7fi@duck.com>
To: linux-media@vger.kernel.org
Cc: Martin Vallevand <r3o2c7fi@duck.com>
Subject: [PATCH v2] [v4l-utils, v2] libdvbv5: modify T2 delivery system descriptor
Date: Fri,  2 Jan 2026 18:50:48 -0500
Message-ID: <20260102235048.1596-1-r3o2c7fi@duck.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ETSI EN 300 468 6.4.4.3 specifies the frequency loop length in the T2
delivery system descriptor in bytes but libdvbv5 populates  it as the
number of frequencies in the descriptor.

This change ensures that the byte length is correctly converted
to the frequency count, preventing potential memory corruption
and buffer overflows.
---
 lib/libdvbv5/descriptors/desc_t2_delivery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libdvbv5/descriptors/desc_t2_delivery.c b/lib/libdvbv5/descriptors/desc_t2_delivery.c
index f88718d350db..5d245cc973c5 100644
--- a/lib/libdvbv5/descriptors/desc_t2_delivery.c
+++ b/lib/libdvbv5/descriptors/desc_t2_delivery.c
@@ -76,7 +76,7 @@ int dvb_desc_t2_delivery_init(struct dvb_v5_fe_parms *parms,
 		p += sizeof(uint16_t);

 		if (d->tfs_flag) {
-			d->cell[d->num_cell].num_freqs = *p;
+			d->cell[d->num_cell].num_freqs = *p / sizeof(*d->centre_frequency);
 			p++;
 		}
 		else
--
2.50.1.windows.1

