Return-Path: <linux-media+bounces-48715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33ACB9355
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 17:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC8693049D27
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDE8239E9D;
	Fri, 12 Dec 2025 16:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DsvJs9f1"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E8B44C8F;
	Fri, 12 Dec 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765555306; cv=none; b=bH6pw0MggrjHrhU3u9NoMcfuKZ/HkzsCWYwbbUahcvIijnWQ3rnNYWdF4xtv23aY7kZhII+P1U5HNYqUvw+ThztwajxS9syqEzrSMdtCFJp6dBcEAqI8ybVE9A4K0qqxzWr1Jtb9esWR18rD1ltQ3ybTYd+w+80QYZ60zMcLcbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765555306; c=relaxed/simple;
	bh=6C8YphqfTDdebCVna2Q5xUBkPyfF4qogtfqUDvYjttI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BAKVktG8lDmZQ6eMin4GAW+h3wohdfb0BRQMnHV+GcUveqAYav6huRItz+L+6vdOjwGlu8XMD/eGinIz4s2y9Ph1+Nl1G3C3ykpGF1mGfsryfaaO87ju9rdNFLCBz7eAx7prqdM2I46laeclY3jrYdzMvYUFaJJPTgiPcrTXG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DsvJs9f1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765555297;
	bh=6C8YphqfTDdebCVna2Q5xUBkPyfF4qogtfqUDvYjttI=;
	h=From:To:Cc:Subject:Date:From;
	b=DsvJs9f1sRzjm+YY0eNrDP1xdN/n/oLQlVdleX2EJ3TcFQ/AMdOiCLvuWhChrgSzm
	 mnFSpgGQbRfZLvUYjNTY6rwzmcxvX9cvXvEpZ+QKuxOcL8xmaQyU65ZEDGAfCZL12a
	 Nm/eYEwdXeCwhTnKkQHnc1UOYowI23+YpdfI0cGtfB2mkeMy/5QKMcKHhFwkWwc3lL
	 VPAzNrVyVfzxFISh/2nhllw7zso6KW69QHmjwGTqkUGZ0lSvCqoe7w29tnvO2lxZb6
	 yJo+bHKpER/VlFNxX6rKgA1hW78A7C58FeUx3WqFWCE/TZnJ5cyU8k0LNFmYhkp9xI
	 OCc44jmhB5XQA==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A77B17E0465;
	Fri, 12 Dec 2025 17:01:35 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	kernel test robot <lkp@intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH] media: rkvdec: vp9: Fix probs struct alignment
Date: Fri, 12 Dec 2025 11:01:01 -0500
Message-ID: <20251212160101.146684-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building for arm 32 bits, the struct alignment changes and the compiler
adds 3 padding bits to the anonymous mv struct in
rkvdec_vp9_inter_frame_probs.

Therefore, the BUILD_BUG_ON used to check that the struct size is aligned
to 128 bits (hardware requirement) fails.

As that mv struct is at the end of the global rkvdec_vp9_probs struct
and is followed by 11 padding bits, the 3 padding bits can be explicitely
set in the mv struct and removed from the 11 following it.

This makes sure that the mv struct is 32 bits aligned.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512110229.R6YCf1Le-lkp@intel.com/
Fixes: d968e50b5c26 ("media: rkvdec: Unstage the driver")
Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index b4bf01e839ef..23c733ca2e8e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -66,6 +66,8 @@ struct rkvdec_vp9_inter_frame_probs {
 		u8 fr[2][3];
 		u8 class0_hp[2];
 		u8 hp[2];
+		/* 32 bit alignment */
+		u8 padding6[3];
 	} mv;
 };
 
@@ -85,7 +87,7 @@ struct rkvdec_vp9_probs {
 		struct rkvdec_vp9_intra_only_frame_probs intra_only;
 	};
 	/* 128 bit alignment */
-	u8 padding1[11];
+	u8 padding1[8];
 };
 
 /* Data structure describing auxiliary buffer format. */
-- 
2.52.0


