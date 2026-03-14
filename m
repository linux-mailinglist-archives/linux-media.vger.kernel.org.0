Return-Path: <linux-media+bounces-55816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLO8GQ3vtWnZ7AAAu9opvQ
	(envelope-from <linux-media+bounces-55816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 00:28:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F7F28F7C2
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 00:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C51063035D54
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 23:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A29B378800;
	Sat, 14 Mar 2026 23:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8jx6vqT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5629BDB1
	for <linux-media@vger.kernel.org>; Sat, 14 Mar 2026 23:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773530883; cv=none; b=a74pg7yM83dE0h97Eop0xJ/YHEHP/T3TJHI+ydqM8V8LUi9piLVPudIByvh2Tk3RZG5gTF5AsEXzg/ZvIAJuP/scA5SrGzMWhtROqbtJV8fTnMq31BbxeVkkW0dQJerIkf/QOdtcdS1vrfw4HlpJz336zfvs4uhWtcBr81pbxo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773530883; c=relaxed/simple;
	bh=dTlprqjYOEXcKo+WIv/Qa6MqjDoxcbi0QD2m8z25QTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LHWycywg6uLkNJoEC+oSqxe/JbwTUfv3F1E28C6crY+OWc7TCEcCurT66eYIHOOXFiHEo7wSEHN3PCrEYpU9TCP4xIMqi7X7YVyzPNE4Fn98qygnpIKYyymtk0isGGLxUi437B3nC4KEZj0pTItuK8c9v8qkp+Z1kcWmXRcZ9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8jx6vqT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a2544b52bso29518171fa.3
        for <linux-media@vger.kernel.org>; Sat, 14 Mar 2026 16:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773530880; x=1774135680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCtEmGh8LeY5ZVx8BhZuufdcg167qUrzjvmKMxMMtZ8=;
        b=i8jx6vqTz/VUOAA2wgqRLcQQ8Pk3bLdJf0hCYaj8+GNXTbX66apRsWUY1CmwnA2U0J
         ZvwmqZJhbYCLnBx6uc1bY53+hEyLYZTEuXde+eC9kNaif/50Gjyn1ZnHlY1AyliTencj
         ks31kTGiZtMdhSKUkeGIddqdTjyZ3b4sKGofkWVHg653XibgCYTWtLEiHybnKn/HcP77
         WtWE0INOSGVQ67TMP7V/jyHDcNEJdAbGRALClNlFVDFgcF5zACC6DIEkXXeUaO+4fjdO
         UOlVgKp+PUGOjKy7btyzWe6isdEMjkb1wgK28br1D8ZETiLZOlf6apT2ZvB7HEwd5R4F
         u5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773530880; x=1774135680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCtEmGh8LeY5ZVx8BhZuufdcg167qUrzjvmKMxMMtZ8=;
        b=gxRY0Y0sHYnbeQ7YN5rxvdemzuJabDvtDbiAjCrI/dA4BXTrBA7h9sqMLKOtzN0nXz
         7lexgZySw8Nm8usQdby4iUgJX2xTzhQViJjm00kFGe0J1sGKIF5/6P2z5lA9nMy1FdDp
         Yty9FzfWYRwxwzXF8UTsVw8390ir/fwsQb2F39i9e5VdjjNZalwN64p18eAX5k5Zn1de
         W3k2E3qz+JmPhISndTljKTckgcFKZcp3wMGMK76RLnEMV3icwIRKoEmpP2HN5H1FSVEb
         8+DIqrNFSh8SBs2KTBtHeBCoBeg5/ievEfyTIYm9pyEyTC3lc3VLjxgIoBh8MwZMgM5q
         dyyg==
X-Forwarded-Encrypted: i=1; AJvYcCWbDNVaoIyiKnRa+IaqojfCtRWh68ykKCt060X6jjEZk+9aTMOTdnABNcCmnJcyn6Cc1yjG6mVwmSGmJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGnfr8zclwT4ngA3cAYOTf42x9+8lSFkCE/oTXjHZ7/axZnlRH
	sau62wfxVXJGuGM6bzew4iPamVkyeNT8ilj9MPO7qXc2HJm2aMvxHyrxcy95krHWOpSrM//O
X-Gm-Gg: ATEYQzxKxm+Xi70lE55iciJhRE9ZwVqQvVCPAYTpeDR5VSmFW6HfnlJ8xZOT2IKsIWl
	6aBRO2yMYPKPmLa3RNi8RFrzOYPMQ73TzQ8269o+HAgaIhNXqsXoKoI8FfirGJucsQTuxauu/UQ
	y21hVK402qmOrc8hBqwHjpiveT2tcceeASup2IzD13F9sWvvCAAuDBBMHDf8SYDl2K+C/eDhYLs
	rhhS/NNcaiao6iHYuNdSiz4xTE+EYO/47RdofyPk+DAvZFrM7Lzkwq0JjqnjS2YtezrBsjFo4/g
	d241cSqvYYlNJtevit2AWG4EHz1RvKmIaH9pDkavlrnd2o54L/V0FV8ujOl5KCnEZuFC6n/+aY4
	07Yr5tDfSqGTaJxMkOVSi4ZbMvgOaoJQy/EV68OkxgJg2Am41TRw1l6oykmvOLKfO1JPE42tROu
	efYXk29fersYnLNR9rW8JU2omUvsR/PKghBg==
X-Received: by 2002:a05:651c:4083:b0:385:bb24:d0eb with SMTP id 38308e7fff4ca-38a897b7410mr17019691fa.34.1773530879579;
        Sat, 14 Mar 2026 16:27:59 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d9a4b6sm24308881fa.12.2026.03.14.16.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 16:27:58 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: kraxel@redhat.com,
	vivek.kasireddy@intel.com
Cc: sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	stable@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH] udmabuf: fix DMA direction mismatch in release_udmabuf()
Date: Sun, 15 Mar 2026 04:27:22 +0500
Message-ID: <20260314232722.15555-1-mikhail.v.gavrilov@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55816-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mikhailvgavrilov@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10F7F28F7C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

begin_cpu_udmabuf() maps the sg_table with the caller-provided direction
(e.g., DMA_TO_DEVICE for a write-only sync), and caches it in ubuf->sg
for reuse.  However, release_udmabuf() always unmaps this sg_table with
a hardcoded DMA_BIDIRECTIONAL, regardless of the direction that was
originally used for the mapping.

With CONFIG_DMA_API_DEBUG=y this produces:

  DMA-API: misc udmabuf: device driver frees DMA memory with different
  direction [device address=0x000000044a123000] [size=4096 bytes]
  [mapped with DMA_TO_DEVICE] [unmapped with DMA_BIDIRECTIONAL]

The issue was found during video playback when GStreamer performed a
write-only DMA_BUF_IOCTL_SYNC on a udmabuf.  It can be reproduced
with CONFIG_DMA_API_DEBUG=y by creating a udmabuf from a memfd,
performing a write-only sync (DMA_BUF_SYNC_WRITE without
DMA_BUF_SYNC_READ), and closing the file descriptor.

Fix this by storing the DMA direction used when the sg_table is first
created in begin_cpu_udmabuf(), and passing that same direction to
put_sg_table() in release_udmabuf().

Fixes: 284562e1f348 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 drivers/dma-buf/udmabuf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 94b8ecb892bb..d0836febefdd 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -40,6 +40,7 @@ struct udmabuf {
 	struct folio **pinned_folios;
 
 	struct sg_table *sg;
+	enum dma_data_direction sg_dir;
 	struct miscdevice *device;
 	pgoff_t *offsets;
 };
@@ -235,7 +236,7 @@ static void release_udmabuf(struct dma_buf *buf)
 	struct device *dev = ubuf->device->this_device;
 
 	if (ubuf->sg)
-		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
+		put_sg_table(dev, ubuf->sg, ubuf->sg_dir);
 
 	deinit_udmabuf(ubuf);
 	kfree(ubuf);
@@ -253,6 +254,8 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
 		if (IS_ERR(ubuf->sg)) {
 			ret = PTR_ERR(ubuf->sg);
 			ubuf->sg = NULL;
+		} else {
+			ubuf->sg_dir = direction;
 		}
 	} else {
 		dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
-- 
2.53.0


