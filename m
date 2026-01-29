Return-Path: <linux-media+bounces-51787-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPOkJGmOe2kKGAIAu9opvQ
	(envelope-from <linux-media+bounces-51787-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 17:44:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3EFB25FB
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 17:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3923A300AC1F
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 16:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E223451AE;
	Thu, 29 Jan 2026 16:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv4j/5fD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D73446C8
	for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705035; cv=none; b=kLZVg+jr3WhcZ8jAuLxuEgEJJlDS/Stwg4FxJJ645cOsKZAttuhH/uDe91VihGBLFVxvVaWFQvJroQWuwi71Al44CY472QMOcXyEc/MerhGMaBMaG4Ykczn3V+IID+/vJh19IpsSJW78bT7Hgybmohe0pMnMOq/gsoJg59124gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705035; c=relaxed/simple;
	bh=xIYiZzBxSwMEIJ4C0RtoZaDxiJPYbMUccG9vgJreaXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=INjlBp0W3mjtjA+nJnl1A6Jt8gDbVhDFpoG59pceICKLZm4XbH0JDtZj6FEB21+UoaN74AKz0dtqhf4ES3y3I3jbpECjVBuFfNPZolg0PTVfd0JNpovsbguBxHS/OXHqJ4nXjGxMjAtlSA8Lxra+TACpyXNfcJwt64j9wxRCZkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jv4j/5fD; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-480706554beso12691405e9.1
        for <linux-media@vger.kernel.org>; Thu, 29 Jan 2026 08:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769705033; x=1770309833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhyBy0UGiy712lAFCHNNTHqAhsRO5EoRden9HyKwIMM=;
        b=Jv4j/5fDaDZJNudxmrcBrF8OmMq5AO/+d65tYtFgAuH4hU5rJnz67Io5TI7I16/qOO
         4wbw5G1gZwFM/dIT54QLL+WmbiYXOjPwm8tnrbeHH13YyvFp9UvzoX5u2gstCN/GJ/ld
         nMBFVDG4c0ffWTVG6rdLxxu4h/HFSF6MccGaDJBPvCiUuD8cE+M10FokL07aOrTI844x
         jNOdenvPyd7XYwFpUC8iLS2oGmcbzatGVPv8p/HGOcBJmjh75zcN2sDTAkDr0XG7xUaF
         oC5FDHPDfEoA1oR8z60PWtsWHiU7CZRIFZJKbahNbfnn+FB80hDvnp2Ezkct40TCr6xL
         kuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769705033; x=1770309833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhyBy0UGiy712lAFCHNNTHqAhsRO5EoRden9HyKwIMM=;
        b=rME+ZlYwVrCc7Lofr8KSwoOgavGNbyrUydVnmWP3oYFO9Ugz8zneg0F0hl14k464zi
         FaVRc2K6I6ci3OH+WVLFaC+KKN8lyZkjIbG0gLKGrSzO4YN3yRqUGoG4jvsfu86ZGhP6
         karF0WWno+a/WxVvKp9JnSzb3YuaQTxmavyNGpJNkzntF2pqRl0nj97HQca7gd5R12fo
         ZcdJV6BbMNUjwJQ1g+NAN5ZgmFbXepNldycyHoo0gqALJU+1lUK3A0xuQoCJVDSH5oiI
         wum+ebd0ZH9MUQNLnAQi6i19YDsw6rd8zikEtROJIGr1jcnAz43EltwyM/Jw2ANBUUlA
         20Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVMn2Jja9+UiCvNKvGKu3zy9ggPeKjxB2C+4mzeRtdZ8InZcr5jbqXd22NqjJQjOHPUMJ1czsveMvAYAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygJ3AdA3KWdfy4g+h0S4x0pr3YDQyn2gjU4VbqV4urjzV6wbih
	7+qbsn1VPkBzlHN+PwExH+6swy30MCp1a0CjTQji+i75Kh3Jk26V+lHm
X-Gm-Gg: AZuq6aJMFOKw+dNO5C0SE3+wUj1JLFHqWeo9Byug0XWFUkLWAKL5mYT2+AokxXcaQu0
	rrRllGMa0LWoFZ1VHoKBfQ+plDVRzfRG99wLAMhXnNokLBovLUnjdrSrkFyVANQ9XBI1cJoh1ue
	cVQTLnZEdfSx33z5FBbpghGcTqCH49mG4iHMYGzyBGxguSY+n3T9i/OlCi4+V/LryAQThDEV8i1
	W1VS5RvCSGerIJ3IGhLA0aashfUY2TanozQBzGXdSJBK7fwFD/9vQsO+BPpQKUJP4bLK5Vvlxkp
	u4KDCt+tfimHs0Z5IlnzVoC8kZQkvlEQziBO3Nk6NsyTdg5vZ+U6XoAHSNfQYwLVyVISqZn0Bpf
	YgTiWzNJRndv37vdgGXjzj0p7UzTeBMnkd17AS69Qn+Wvg0Z/eNAK/Fgh94p/ZqYIxygmBhqIjg
	==
X-Received: by 2002:a05:600c:4f4f:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4806c7cc86dmr126373465e9.16.1769705032532;
        Thu, 29 Jan 2026 08:43:52 -0800 (PST)
Received: from desktop ([149.88.24.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56068sm132122215e9.13.2026.01.29.08.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:43:52 -0800 (PST)
From: Andrew Geyko <ageyko0@gmail.com>
To: linux-staging@lists.linux.dev
Cc: mripard@kernel.org,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Andrew Geyko <ageyko0@gmail.com>
Subject: [PATCH] cedrus: Convert bitfield macros to FIELD_PREP for clarity
Date: Thu, 29 Jan 2026 17:43:41 +0100
Message-ID: <20260129164341.104155-1-ageyko0@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,sys-base.io,gmail.com,sholland.org,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-51787-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ageyko0@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F3EFB25FB
X-Rspamd-Action: no action

Use FIELD_PREP macros for VE_DEC_H265_TRIGGER and scaling list registers
to improve readability and maintain kernel style for bitfields.

Signed-off-by: Andrew Geyko <ageyko0@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  | 28 ++++++++++---------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
index 05e6cbc54..e8449859d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
@@ -344,8 +344,8 @@
 
 #define VE_DEC_H265_SCALING_LIST_CTRL0_FLAG_ENABLED			BIT(31)
 
-#define VE_DEC_H265_SCALING_LIST_CTRL0_SRAM	(0 << 30)
-#define VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT	(1 << 30)
+#define VE_DEC_H265_SCALING_LIST_CTRL0_SRAM	FIELD_PREP(BIT(30), 0)
+#define VE_DEC_H265_SCALING_LIST_CTRL0_DEFAULT	FIELD_PREP(BIT(30), 1)
 
 #define VE_DEC_H265_DEC_SLICE_HDR_INFO0		(VE_ENGINE_DEC_H265 + 0x20)
 
@@ -424,17 +424,19 @@
 #define VE_DEC_H265_TRIGGER			(VE_ENGINE_DEC_H265 + 0x34)
 
 #define VE_DEC_H265_TRIGGER_TYPE_N_BITS(x)	(((x) & 0x3f) << 8)
-#define VE_DEC_H265_TRIGGER_STCD_VC1		(0x02 << 4)
-#define VE_DEC_H265_TRIGGER_STCD_AVS		(0x01 << 4)
-#define VE_DEC_H265_TRIGGER_STCD_HEVC		(0x00 << 4)
-#define VE_DEC_H265_TRIGGER_DEC_SLICE		(0x08 << 0)
-#define VE_DEC_H265_TRIGGER_INIT_SWDEC		(0x07 << 0)
-#define VE_DEC_H265_TRIGGER_BYTE_ALIGN		(0x06 << 0)
-#define VE_DEC_H265_TRIGGER_GET_VLCUE		(0x05 << 0)
-#define VE_DEC_H265_TRIGGER_GET_VLCSE		(0x04 << 0)
-#define VE_DEC_H265_TRIGGER_FLUSH_BITS		(0x03 << 0)
-#define VE_DEC_H265_TRIGGER_GET_BITS		(0x02 << 0)
-#define VE_DEC_H265_TRIGGER_SHOW_BITS		(0x01 << 0)
+#define VE_DEC_H265_TRIGGER_STCD_MASK  GENMASK(5, 4)
+#define VE_DEC_H265_TRIGGER_CMD_MASK   GENMASK(3, 0)
+#define VE_DEC_H265_TRIGGER_STCD_HEVC  FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x0)
+#define VE_DEC_H265_TRIGGER_STCD_AVS   FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x1)
+#define VE_DEC_H265_TRIGGER_STCD_VC1   FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x2)
+#define VE_DEC_H265_TRIGGER_SHOW_BITS  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x1)
+#define VE_DEC_H265_TRIGGER_GET_BITS   FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x2)
+#define VE_DEC_H265_TRIGGER_FLUSH_BITS FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x3)
+#define VE_DEC_H265_TRIGGER_GET_VLCSE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x4)
+#define VE_DEC_H265_TRIGGER_GET_VLCUE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x5)
+#define VE_DEC_H265_TRIGGER_BYTE_ALIGN FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x6)
+#define VE_DEC_H265_TRIGGER_INIT_SWDEC FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x7)
+#define VE_DEC_H265_TRIGGER_DEC_SLICE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x8)
 
 #define VE_DEC_H265_STATUS			(VE_ENGINE_DEC_H265 + 0x38)
 
-- 
2.52.0


