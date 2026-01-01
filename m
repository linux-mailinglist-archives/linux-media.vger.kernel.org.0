Return-Path: <linux-media+bounces-49833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 093AACED79B
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 23:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 038E33001023
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 22:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9CB2586C2;
	Thu,  1 Jan 2026 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKZItFmo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EBE26CE11
	for <linux-media@vger.kernel.org>; Thu,  1 Jan 2026 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767307358; cv=none; b=if9Ntes+GST6jDcXVlhC11QnqoJjXWTNhNvazfvPRB+an+RiFnvqXMSbm1j1IDwvgsED2CTohnsdvcYw94bjSfWuiNEdUhS6Kmu4Yp3Apt1zj9jiFidZQYgtfn94GLVd6nK8xccDfXSmgIKqID9z0kLEX3UBx+UxdXLNRRXuHWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767307358; c=relaxed/simple;
	bh=qE13fczsVSiMLM8r8GlOcs5wNBy4Mm8BPtqkM7YCFY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Slenc0ydXsRlaxFmQmehNzs6eTjQYMvyNYqK06Z6K4Ilas1onPky1ErLT2PK2f3z5uRrL7vwoA5uQtwzmOXWhzJxBNYS27+2fF1PDyKavGCPxFDSPpNP6Syl7PyrqsLoPr8IShCn3nuO4ILtrNCUaRcs6oEfxaFZH41/mtj0lso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKZItFmo; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b1bfd4b3deso1062470885a.2
        for <linux-media@vger.kernel.org>; Thu, 01 Jan 2026 14:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767307355; x=1767912155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkxib7mgCDnvv/cO5hRPFnd8JARz6fuM+gH7dtTqG/U=;
        b=JKZItFmosDrWeenhMc17LA2FDG1H1KiiI7qHE2JIhHSwIlSi7A1Y/bYCaqmYHOHvsE
         rO4tyg0OlON7WmBiMoVb7hPC3jVnX3z07J71YEKIrJ6HTSY9kUSNT8xPaYUUhnwiFFpw
         qXHl640/FyP7xdRrjCgL7sc4fRhfw9pQaUd1WejNmxO68bBD/LiYDzh2FCVy9eOscRov
         VfZrGvlJRHskGxdWxYhJ3J1SDrqZ/DpU6ooRVdpdhFqXMt0MbOF8Q2lGo9jL6Y1cHSTa
         0GLzkzQSe5sv65gbenxIsvyxfkFOr2/511gidNvGqHhsGxxYgTK+UpjSljHGnTMcOsu0
         WD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767307355; x=1767912155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkxib7mgCDnvv/cO5hRPFnd8JARz6fuM+gH7dtTqG/U=;
        b=DCztt+9SvmTqv4KsMN1KgeCCfoHJZIeUXFFnfKWq1MfHxf/CqZLf/r6DiL1yCeKa6b
         6UBwRyNv5Fsx07WuJTWw9M/jzgpc3UZxKk559NogZIX4WBD3GpREb9JfSgpz6wJcE82/
         WVXRbreMtlJ4uxPlpm2nsuLWGQ9hucnJoPODw+ptFq8bEiuboSb7Xim6tMNahzygOTcC
         6zttY7i9zwm47QYmY7EQqvIoQ9L/bT+AcSJzjULs7zypRjCaaf1NZjcK2HIaZQfVBWlU
         yRp82gPaIpUN7wAbGQ16NGPfFywDik03bEeXF7v2iZGfQ79LTUc/u22scWdkvNOCJn4P
         Cvpg==
X-Gm-Message-State: AOJu0YxoZQn5IAWAKpMMQbf+r7E0hr5H6ZSwrBOW1ma1iOCCgJYl0ouL
	GmUrowb4GezXriB+7vUBF6yITiUd2i/jXOCF/zsLUhb1QEpX/ZpiQQgdjEPtkQ==
X-Gm-Gg: AY/fxX6budWBxALr/J0SwjtZkR+hpVAvwEYKYI3gmikvsY6F6MM0T6DrV3Bozadg5/p
	CpTXRSxyZIUlYIFloiFdCV+ZWtUaC1biX7/T0beFo7T5JrHs5H3f5nRakzEOq8k4OxwBF8GYjiu
	1wT2uVIIBG0aAKlinKh0f1iqJCfLntGsPzn125NYO4No40tMyCk8Hf6wD10iB8pxveCB9hhWx1m
	d3PUmoBU9+LFxSU2ydZkm35BDWcybU6MsohCNoX5T9weKxgmCpQNPaMkUsjs63SCgifHkp2IYiv
	GNiwFA9d8/eNCULlk/UXHwuRs8H1y5okMcj6TdbuSazCr+w4HBn3t7pLg8wZ/HW5X3Gh/oUbWXX
	ZTtv6/FFAxXPvNtS43tOQfHvcmmhEfjZtjYP9BnWdhShBnYuDwTjR+w6H3jqKanP3SIcWZGqkwQ
	qnr+nab3ge0qIcNGv1TU/vsn9sHISkX1f+9kDwHDSmI2cfG9o=
X-Google-Smtp-Source: AGHT+IHVxZRB0e19r7iNQSIP3XA4AOatUMPyD/3bGKPNUxpkogL1IEFNHqwm1/VwfBo7AsK3SexFnQ==
X-Received: by 2002:a05:620a:1aa8:b0:8a2:2e2b:2c72 with SMTP id af79cd13be357-8c08fc0d561mr5658641885a.25.1767307355348;
        Thu, 01 Jan 2026 14:42:35 -0800 (PST)
Received: from ACERWIN10 ([2607:fea8:bfdb:3500:1070:5a6d:5e26:d87e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f5fa6sm3084565785a.28.2026.01.01.14.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 14:42:34 -0800 (PST)
From: Martin Vallevand <mvallevand@gmail.com>
X-Google-Original-From: Martin Vallevand <r3o2c7fi@duck.com>
To: linux-media@vger.kernel.org
Cc: Martin Vallevand <r3o2c7fi@duck.com>
Subject: [PATCH] libdvbv5: modify T2 delivery system descriptor
Date: Thu,  1 Jan 2026 17:42:31 -0500
Message-ID: <20260101224231.486-1-r3o2c7fi@duck.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ETSI EN 300 468 6.4.4.3 defines frequency_loop_length as length in bytes when used.   libdvbv5 redefines it to be the count of centre frequencies.   This patch converts to the count with proper display and avoids memory corruption and buffer overflows.

Of note the count is defined in the spec as 2-6 centre frequencies but more are possible.
---
 lib/libdvbv5/descriptors/desc_t2_delivery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libdvbv5/descriptors/desc_t2_delivery.c b/lib/libdvbv5/descriptors/desc_t2_delivery.c
index f88718d35..5d245cc97 100644
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

