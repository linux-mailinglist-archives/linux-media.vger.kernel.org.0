Return-Path: <linux-media+bounces-56632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LgtFdL8v2lZCgQAu9opvQ
	(envelope-from <linux-media+bounces-56632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 15:29:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A12E9A91
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 15:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4429301C164
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2026 14:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB033630B0;
	Sun, 22 Mar 2026 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO/1WNHW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A04F3630BF
	for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189531; cv=none; b=C07Us9UkDiQLw0uC4NrgJaNphzwlD2S1HjdQUsometGnBx1dbtlb0fVqdIZpvchZMO9+TN4MZRttbScyPZYspMf3BLTEULIe1PfTQsZ0+pG96mVB9mOho6vQhYVYWxbe2rLJ4QChe3kbM4/UG3TbOajsTx+Gq7H0TGe+PmycGlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189531; c=relaxed/simple;
	bh=XoYW9chMxNN0O5MWYqWV1Eox0ODfDzkDGcCIWamBRPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqi7aKM4R8uiA/LWGkvI8OSRZYbvEFQAVCuzfOpFhQCX77f6zHPUX3guOxANhwFvcekr6AK0l/K/H6L6/5F54nWc5HA8yzKWihRFccQAdM+wbHLBBr/RjFgpLEGudYAL7w14emPP/pAaRN/V6t5786jjCXeWrvLJPjPZzdA2o18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO/1WNHW; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so18687135e9.3
        for <linux-media@vger.kernel.org>; Sun, 22 Mar 2026 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774189528; x=1774794328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRnUNTaRuV/yZtwq26vTO8rrkAf6zU9cYXMu+kKRVc0=;
        b=cO/1WNHWpslxjygF9G3rn4rO2kS2uxChNnhAw7FoueY7oH0MxU44GNoxbiEbRbcDTu
         FUGOhQwAb6Ui6TPWjGNCW/yR3vpqmaQ+fOwge93uoyl9aV+q5BhjQEaKxlH1+8Zc+1Br
         Hw3I3D9nheCA3oyOpOYqRBYzCOGk/jhalJUSaSzFASWBxt5fS3AhFGbR6CBKrdfj8IcW
         KWSGFO/CSBhgyPCo2tpZutacwCTqgsJPxa1R4Rx3aRRiNskx+/hLJMDf7wXNDrb9L9TS
         vUMnb3BFI8wizGkB97f/8QVh34s7mviUJUKyTMYeE7MvW0qIn6AQaSi6Q9cRs9rAlqLN
         q1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774189528; x=1774794328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRnUNTaRuV/yZtwq26vTO8rrkAf6zU9cYXMu+kKRVc0=;
        b=TlQtQknfIFKu+GtyQyrg8FIZ2df0jx/14zG3DjYICpCqVE8H3up7bUtswxQ2gCe/D3
         HxcrdzCRkwlG7Wz8fIbWvQB/HjDCnh5FjXgQX+UKtOcK4s9jGvqIj6F1bvvfan5ce91c
         xxkeAUl5jJ6XYbgLkeS39yFAdIFSEqI4GnIrVYRMDEeL9LPHSQuC0VjTAkZh8BtgrtrK
         kBk3gt8I+R5EEw4KfQc9OVT5tlRXn+P9wD/2A+OHNBKRm42w7eqo+wFGVBwig4Gd0+Zr
         L1XAKG5y/1Z3TCS8FHouTrFCzgFvPb9Ov4at0wNhQRA0gJgDgmy2dlQw8X6kUgJTLPW8
         rEmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV02Y7I47pwGZGN5nPJx+zxsMSp8Rn87D5UaE8SW2PDM8fES7FrsfnL6uchqYQ/1FMmvYisQ+Sa1Kn2jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNw4EkXEeoDDbHylHviFD+UbCWFIcoDmHm/4jvn/dDQFt21hA
	o6RqygVxSDGdhtc/gM2d9hqH13VQvrQehee1DUgsUfk82JHC55lg6ec=
X-Gm-Gg: ATEYQzxw79euNW2NGy+y3PvyCnXJF4Gtambogv3BjOLHazr08MgJ4T/1n4TdnE6uJI6
	H2OXnd3tc4E4CTO2pMiEMhhVKGkAvJnJbH7l3iZdB7YHkgfK6dWiHHJPlMaDYysAsBNF8pcPn8v
	Drsd0/UZmIMK//8zCnYiPnn/+tjnSw+9BMuS2IyauxMeDXG5FZLP1HBNL9jHdAsg2IgK3esNZng
	JacnKadm6JTJzyIc46QxCXhykf/WThG0dFIbshHYBISDbrX/U8ghoJf6OSXm3uOP0kXlTU5ZLrt
	yvAw8G3I3Fc+p/FpBvKaD06KTNNPelz6yMYevILX91Pkmf6dgBuRJcBt5TmMokE7qoDNpo6yGbn
	jEN55gpspbMWHyvcVMq9JkrelyhdDTS/U1Te5KWzpS2xHihtyzsByP02Xn07X+DVVPGYhRPz39+
	8ZJEREzGM7OIjsOrJ7/tCpnigkEjewH3Ii2+noZOgOrEil9LaTNodm7zpDWbYZAYQ54zsf/UQ=
X-Received: by 2002:a05:600c:1d0c:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-486fee2ff25mr140908425e9.30.1774189528450;
        Sun, 22 Mar 2026 07:25:28 -0700 (PDT)
Received: from hp-ubuntu.. ([41.249.139.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm141466655e9.1.2026.03.22.07.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:25:28 -0700 (PDT)
From: Mohammed EL Kadiri <med08elkadiri@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed EL Kadiri <med08elkadiri@gmail.com>
Subject: [PATCH v2] media: atomisp: fix spelling mistake
Date: Sun, 22 Mar 2026 15:25:06 +0100
Message-ID: <20260322142506.42022-1-med08elkadiri@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-56632-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[med08elkadiri@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 004A12E9A91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct the spelling of 'uninteruptible' to 'uninterruptible' in a
comment within system_global.h. This improves code readability and
searchability within the atomisp driver.

Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
---
v2:
- Changed subject prefix to 'media: atomisp' to satisfy Media CI requirements.

 drivers/staging/media/atomisp/pci/system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..bfa8682ee667 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -29,7 +29,7 @@
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
 /*
- * The longest allowed (uninteruptible) bus transfer, does not
+ * The longest allowed (uninterruptible) bus transfer, does not
  * take stalling into account
  */
 #define HIVE_ISP_MAX_BURST_LENGTH	1024
-- 
2.43.0


