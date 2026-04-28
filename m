Return-Path: <linux-media+bounces-59778-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBGTCFp08GngTgEAu9opvQ
	(envelope-from <linux-media+bounces-59778-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:48:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F92480889
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D50EC306A813
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B179A3DA7CB;
	Tue, 28 Apr 2026 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pExvFEpr"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3CA2580F2;
	Tue, 28 Apr 2026 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365456; cv=none; b=VTOsBZbJ1N+33A9Ck2GmnPNGtB6KFjeS6p7lxJAMeUkWBFF+3gSnvVCauIF6cGe/dQGppMsi2MwYhDV5IxYqfAdfd5kcs7u677kZDjpwkVVYF60VWz7nVuaBh6bYJaQ4p5+vHsnddO+7LvVI25Z50Y9YXIZ8Tnjx16H5iyAN5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365456; c=relaxed/simple;
	bh=IeT500gqLTot4aUr5UON/hNQJD/41U0aoYoeo1sGEUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PHuYTUlX6YosGVrQYXCtzW/VnQHuWwxi4avNtzsGA7kTJic7UHV39qydlbgWtSytOiBBOCd4bLXMD8HX0wb/lh9cm461rfI0tRbpXqBAe4XFppAmDJvBR+g2DHQUiOvPNXJ2XTdZhX5/4gY0ShqdzbckzhbWCOi/u7Yux0NguCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pExvFEpr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777365452;
	bh=IeT500gqLTot4aUr5UON/hNQJD/41U0aoYoeo1sGEUI=;
	h=From:To:Cc:Subject:Date:From;
	b=pExvFEprJk5rletvW4RpV3GLebQ7heCN7UfoYoOpiPKyKtwOf74ug3h3odnMUg2ST
	 c88gQRMIxwZ7vJ3EhaZxDjWZEAReiQxhvkVsMtg7wyLpgW+cfOmg6ZIrYlwF7hlOfl
	 z/gI/t9wUYLXp9n10DS2FZDnDTfl+RMyojArJV6zdedz6Gx0Ioaz9pA3yJX5cn7Bf1
	 b7iT+z2ak1Q226VS4204vRlnLuoRg+8X+tE8moH8dUKY/hZXl/S/0Mb9IRc8EYXbKK
	 RGFbloPIabFev8fIA6MyTka0pJv8Ee0fXt/2are7nNbFTOdxA4JoCW7CoCoG4Piu74
	 +onhqjd1qQY0Q==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 861A417E128F;
	Tue, 28 Apr 2026 10:37:32 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: Fix format enumeration when post-processor is mandatory
Date: Tue, 28 Apr 2026 10:37:23 +0200
Message-ID: <20260428083723.54314-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B1F92480889
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59778-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

When a post-processor pixel format is mandatory (i.e. when an AV1
bitstream use film grain feature) the driver must only enumerate
post-processed format.
Use the context format to know what is suppose to be enumerated.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: 80c7373a456e ("media: verisilicon: Conditionally ignore native formats")
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index fcf3bd9bcda2..f538d4562744 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -242,7 +242,7 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
 	 */
 	skip_mode_none = capture == ctx->is_encoder;
 
-	formats = hantro_get_formats(ctx, &num_fmts, HANTRO_AUTO_POSTPROC);
+	formats = hantro_get_formats(ctx, &num_fmts, ctx->need_postproc);
 	for (i = 0; i < num_fmts; i++) {
 		bool mode_none = formats[i].codec_mode == HANTRO_MODE_NONE;
 		fmt = &formats[i];
-- 
2.43.0


