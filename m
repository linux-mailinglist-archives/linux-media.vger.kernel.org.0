Return-Path: <linux-media+bounces-57039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF9/Hl3lw2lvugQAu9opvQ
	(envelope-from <linux-media+bounces-57039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:38:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9102325EDC
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 14:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ADC331A35D7
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878103DA5DA;
	Wed, 25 Mar 2026 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Y7qIYXrM"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4108F3DA5BA;
	Wed, 25 Mar 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444803; cv=none; b=nG+HG30ftxmJ1NwyZKn18PhSnZBGT1Ti3f2dS/1F60XClBxN/X5f4pC5EIXuQagoDDi0STKRQ8iH49o9vUzjIo3NOpAePPjTiS7GgK+jv6EZSi5n2ryLH9yyiD2hS79ER1rtnjXRyOoIksz/x/7/U1MJqAfkCnTlZadUS5noJEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444803; c=relaxed/simple;
	bh=rAtFCTnNu62D1mgQjhXKJO7Vg4yukZj9geogQbPukM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jvPaZryrSIXQmz+ySVY4BQreCx5O864/XNcUbaN2HgxyYI3mDv4zgpuOYGYIrxmpv5IbWxBb7mzAfY0CwSardJLSH71iOtRTMl3QaLPFtEDHLDx2weaIi2k1kFTUNwwzC1WxbUWGBEPD0hfJ3NFKYy+tn1AjPFI6WHgi0wvm8QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Y7qIYXrM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774444799;
	bh=rAtFCTnNu62D1mgQjhXKJO7Vg4yukZj9geogQbPukM4=;
	h=From:To:Cc:Subject:Date:From;
	b=Y7qIYXrMVX8by7jKWR9K3d+2t3lvnEQZpo0dYyAPmqdklWQVMox/zR4oH4I0dG1NO
	 dOFBeiM49RWp9Nzz0oO3qH0I9tfplE3RgpemIg6TScv4qfsxbtHV/RJaMp/y5A6Hkp
	 VqdUeVyNgx6FgmY+B2idY6qujq/SmHV9l6DW1Ybah5Jx67JUixJZnCWR4RRf8zupJA
	 egY6avMuj2yg27l1NKopq2ueLtC6utlIqMhVoNrbcvPz9LLfO1QzbU2NA8n0KLUKpR
	 zILTnWY4cZbkMYw6I1SS834mT0cEGOjzfJbfpTvFfbWvhBHUAeTujpbmjPlBLV3jvK
	 HYtCl9wWQLG9w==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:5bd7:b5b9:ee7f:b609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ED71E17E5A4E;
	Wed, 25 Mar 2026 14:19:58 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: AV1: Discard none supported profiles
Date: Wed, 25 Mar 2026 14:19:56 +0100
Message-ID: <20260325131956.18075-1-benjamin.gaignard@collabora.com>
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57039-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C9102325EDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AV1 hardware can only decode YUV420 pixel format. That means
that only profile 0 is supported. Discard all other profiles
when receiving AV1 sequence control.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..12f98e7e7994 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -283,6 +283,8 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 
 		if (sequence->bit_depth != 8 && sequence->bit_depth != 10)
 			return -EINVAL;
+		if (sequence->seq_profile != 0)
+			return -EINVAL;
 	}
 
 	return 0;
-- 
2.43.0


