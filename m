Return-Path: <linux-media+bounces-57273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC3cB7KfxmlxNAUAu9opvQ
	(envelope-from <linux-media+bounces-57273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:18:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92499346917
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3E62307EFDE
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3372A32A3F3;
	Fri, 27 Mar 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YBY1xoer"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5497131ED93;
	Fri, 27 Mar 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624569; cv=none; b=PFzT/1QCvZF/FgS03DyqwQuhVQGdSsHRt8hsuuh6FUWxQ733XI7+GxOBJe/JLLn3UA36xQ4ZQ1yXnezcdQEpgjw0QSQH4N+4vKS3K6UAePGXLny/HzVmfn0SMDLfsQH4jS/hMrnLMLeLEbrhHRy/n4oUQMXeVuYuXK+n1a224+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624569; c=relaxed/simple;
	bh=93cbvhOhHO3BIlQLuu3rBBU+F598t09c4s9HxlgYH/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IF2tD0aqa2LojWuraaa17BM2v9M/afNIIr7nLk78Yxc8bS5pr1C23A/bgm0hUmK8JL4LqEkUV/j9mkx6GS3W7IadfWEWLMyEUcuY2WodAXmYPQMoDoYmJYAU7Q3+cLe/vQjApLfKQxexVVTxBh4EWXutA5MTCWNo1wp3bTSQIok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YBY1xoer; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774624566;
	bh=93cbvhOhHO3BIlQLuu3rBBU+F598t09c4s9HxlgYH/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YBY1xoer/CEtYGdfvDkOJnUC9SEAbOn19cLaA4YK5TmfTL8j2/MKqDSC2s1lRmLQE
	 jOll7A7DaKycsm0VSd19fTkJuFd7toxN34H61yCao80zuEwt74i0vm1ziK/W7XF+at
	 Gk/pnI3+5inCbtpO8397vE4RTw2U+GURK85ujwqbb5b47D044Dt1Yl4n2uSVFmOmg6
	 tYeDNAGtLtZJ+UdKeae0I/KZLi1MGO/eU+fffnUMmzzaXi+IZ6yDx2iR8bGEir+x1P
	 X+P2uAwC7JtG0K10cPOWfsDRAynN629FU4OQ9YFKFQ2H4ZadpIW3jtglXsjCSVRsaE
	 mAaz8Tv8lQ7uQ==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C84F417E5A68;
	Fri, 27 Mar 2026 16:16:04 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Mar 2026 11:16:00 -0400
Subject: [PATCH 1/4] media: rkvdec: Introduce a global bitwriter helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rkvdec-use-bitwriter-v1-1-982cf872b590@collabora.com>
References: <20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com>
In-Reply-To: <20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57273-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 92499346917
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The use of structures with bitfields is good when the values are
somewhat aligned.
More mis-alignement means that compilers need to do more gymanstics
to edit the fields values.

Some cases have been reported with CLang on specific architectures
like armhf and hexagon, where the compiler would allocate a bigger
local stack than needed or even completely freeze during compilation.

Some fixes have been provided to ease the issues, but the real fix
here is to use a bitwriter instead of heavily unaligned bitfields.

This is a preparation commit to provide a global bitwriter interface
for the whole driver.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/Makefile    |  1 +
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.c    | 30 ++++++++++++++++++++++
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    | 25 ++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
index e629d571e4d8..11e2122bcbbf 100644
--- a/drivers/media/platform/rockchip/rkvdec/Makefile
+++ b/drivers/media/platform/rockchip/rkvdec/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += rockchip-vdec.o
 
 rockchip-vdec-y += \
 		   rkvdec.o \
+		   rkvdec-bitwriter.o \
 		   rkvdec-cabac.o \
 		   rkvdec-h264.o \
 		   rkvdec-h264-common.o \
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c
new file mode 100644
index 000000000000..673ebb89002b
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Video Decoder bit writer
+ *
+ * Copyright (C) 2026 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#include <linux/types.h>
+#include <linux/bits.h>
+
+#include "rkvdec-bitwriter.h"
+
+void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field field, u32 value)
+{
+	u8 bit = field.offset % 32;
+	u16 word = field.offset / 32;
+	u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
+	u64 val = ((u64)value << bit) & mask;
+
+	buf[word] &= ~mask;
+	buf[word] |= val;
+	if (bit + field.len > 32) {
+		buf[word + 1] &= ~(mask >> 32);
+		buf[word + 1] |= val >> 32;
+	}
+}
+
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
new file mode 100644
index 000000000000..44154f1ebc65
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Video Decoder bit writer
+ *
+ * Copyright (C) 2026 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#ifndef RKVDEC_BIT_WRITER_H_
+#define RKVDEC_BIT_WRITER_H_
+
+#include <linux/types.h>
+
+struct rkvdec_bw_field {
+	u16 offset;
+	u8 len;
+};
+
+#define BW_FIELD(_offset, _len) ((struct rkvdec_bw_field){ _offset, _len })
+
+void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field field, u32 value);
+
+#endif /* RKVDEC_BIT_WRITER_H_ */

-- 
2.53.0


