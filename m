Return-Path: <linux-media+bounces-52053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBeIL4LkgGleCAMAu9opvQ
	(envelope-from <linux-media+bounces-52053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:53:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E06FDCFCAF
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 18:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C59F3013DEE
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 17:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7076A38B99A;
	Mon,  2 Feb 2026 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMWEJk1I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4672138A702
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 17:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054646; cv=none; b=dOnjubWTJybLbwdAHPGX/QxbjFOM5beBLh9cT7W2qZMMLcEokB74jPIgokG7zgR0O9u/CnNvlbeXZPXqjXfCrWYhxIuMEePVE6pNnRymQR3H7iszR5k1cbNu2iHdlFuEjs9vsGy6OZkXohYjpmLyc2s6yHotK11efkiuufKVCtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054646; c=relaxed/simple;
	bh=n2buX5VudVRgU7PL7UJfJORunqQ2AVjMcYcWLb2KfbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJi6SmJuXE9+3Ze4gVTqvjR/0p/4pKkIkZxNM7g3kFBYKT1FKrC+hglvJ0O1thyIeIhGI11RWPjzv1MmGroQPe6uqifMTW8RUws+ScVvTNS0DuIEgyIlEFwXhT6ZhNmIokUEzjgtZucI5nTOKvTehuJhcp8N8Avdy0ZDWccO2Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMWEJk1I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso49167085e9.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 09:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770054644; x=1770659444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rCAwVYKU83hcXqCu+Y7xeDCP8XJjgg0MwhJ+CwyuNk=;
        b=HMWEJk1IJ2OzDdTGeKhcFnV0Hw8K0Lb/OBd7PsnwF3FmNbcH+T7BlM8FRxIbH68mtq
         hn8C0OI06WCUAMDQmzLY3eCP79x9dMTRrxaw32s7etAIDNCjXpwYu42Y0sGXenEoQBqq
         /41JiWOPo4AxLlwjz8UTOIYnTxfJ4cwxTFUZGF0sR8HuXmajxbV58euENt5761FL7+Ic
         /skjHXl9dQRe8Kt6+WU7mAoXYeBfE14opWIwSDvrt7EH7Wtoi8YyXMattY8jRUZRL+kH
         yBKtleZA5DUpMRDO1XnnjgB3ZP6IBmqyJW9ZMgzspJbbwtIYeifqXKO4FENdaA00J6Vm
         cjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770054644; x=1770659444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rCAwVYKU83hcXqCu+Y7xeDCP8XJjgg0MwhJ+CwyuNk=;
        b=KXDFQX9VzQ2gr+OY5todDioo3TgqG+6I5L69ofAOfit7IiZrBSz0FH7NqHkwNvpxtR
         XrwaRf4q2H7ohV4+o7831zYbBhYijD343uKfDqEOHyZKSZJ+/RLkUUfCViTADmAIHmWX
         iJtDvNXE5mkJuRLOlwYPjXtKuhrLqVV9oamkog2NhYBGWi6V+9TTKHVzUv35c2TtSR66
         FQzUyF2h3Hwtj8dJdqXoxmvOE0sBaJgGR/syF/2XUQ6KhcWo546OsoM71ai/VXAU6I5r
         dUztkKHy+GHvVATVJi0lghirZnDyv4jjna9WXOfKP3h7WJHDh1VDormLTULuYLlr4r1u
         yhFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwdYk09NXh1n2InXZjcLjxRSGdad363yF42Q5uDFMsyNNTiPqUTcWKQ3g/IQBfZrZy/dNW/lVZp7eo4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjsLBRNrw7Fjy2vftLC+Ab6WwoCl8xNFDDgU+RS/WpmNIEjCB6
	1euksd2n2DwRO2v/8hf46fI8frj+wTPu+59iWdsgfS8Nb1UVGZdvYI6E9lAnKw==
X-Gm-Gg: AZuq6aIGD91gkCpU8+SH9Nip1Zg1ZsAUaIPwF5C0urq4GUnUQYZde3ox5NwiEuRd6Dd
	vydYWefTtkVasmfXtGRp0cNje7UkLSV2d0UYMaYfo2OyownhliyaLfE9W1b28SYXMmyL1Kxv8wd
	GMm99Ambe3FSu4InEgu8YF/brgQeahBobHPD8pedxHDmoUitiBEXFv0rATvEuFxPFP+h4zMqmpw
	hz3JHeaxddicT/26mDcC8vNM5AsQi0ZZQ9xeIfoUrnHMv2AX6T/oWEjPllxPRSpfFlxYgvBCKv0
	ZGy/QG9OkEnxl5CtFGGEK0jwdCMc7nqP7LrVYDtJ3JPjGadGZphjtHcR+fBXoOBFZ+DuJdSdWww
	Toz95xSJFNYXudJXHufvh3ZEIC4qGTjM+MDNjbNazX+Wf5cI6e3k/ZgpWOBttHTzkEkTm3Yg0iY
	HCn8ubbPuxRpybZUilTekgWL3fP0OfuXwcvTc7Pg==
X-Received: by 2002:a05:600c:1548:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-482db45e124mr148875905e9.5.1770054643324;
        Mon, 02 Feb 2026 09:50:43 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm47011359f8f.27.2026.02.02.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:50:43 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: [PATCH v2 4/4] media: ipu3: use BIT()
Date: Mon,  2 Feb 2026 19:50:33 +0200
Message-ID: <20260202175033.8640-5-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202175033.8640-1-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-52053-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E06FDCFCAF
X-Rspamd-Action: no action

Prefer BIT() macro over manual bitshift.

Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
 drivers/staging/media/ipu3/ipu3-mmu.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index cb9bf5fb2..95ce34ad8 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -21,7 +21,7 @@
 #include "ipu3-mmu.h"
 
 #define IPU3_PT_BITS		10
-#define IPU3_PT_PTES		(1UL << IPU3_PT_BITS)
+#define IPU3_PT_PTES		(BIT(IPU3_PT_BITS))
 #define IPU3_PT_SIZE		(IPU3_PT_PTES << 2)
 #define IPU3_PT_ORDER		(IPU3_PT_SIZE >> PAGE_SHIFT)
 
diff --git a/drivers/staging/media/ipu3/ipu3-mmu.h b/drivers/staging/media/ipu3/ipu3-mmu.h
index a5f0bca7e..990482f10 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.h
+++ b/drivers/staging/media/ipu3/ipu3-mmu.h
@@ -5,8 +5,10 @@
 #ifndef __IPU3_MMU_H
 #define __IPU3_MMU_H
 
+#include <linux/bitops.h>
+
 #define IPU3_PAGE_SHIFT		12
-#define IPU3_PAGE_SIZE		(1UL << IPU3_PAGE_SHIFT)
+#define IPU3_PAGE_SIZE		(BIT(IPU3_PAGE_SHIFT))
 
 /**
  * struct imgu_mmu_info - Describes mmu geometry
-- 
2.51.0


