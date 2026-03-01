Return-Path: <linux-media+bounces-53888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AJ+O7eUo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A51CA471
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D3FD3019FC7
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B14A26FDAC;
	Sun,  1 Mar 2026 01:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ndf3Ye5C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2961175A74;
	Sun,  1 Mar 2026 01:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328002; cv=none; b=tKg0nVpbXP+O2nmdCnPVOLp4fbFECY+bdF1GAiRui7auU1+YSadXuuDrO6FWMyZYTYJ3EPUbDbkcgfUJPxZRYnZAu+LdTW/qjc3Ozh6oK8RrNFBjcIttIw96a6ZMsgTPD6J7k8W1ezOZEZKhbdjGrGzgcbDdbm4nFbwB9Nv+4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328002; c=relaxed/simple;
	bh=3VkP9vlU5leq30QrlJPL206rgman0zFh0SF0ZyoxFXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o8lJhLO9h8wq8jsn2uLAlrn0lMjGFj7pQEoMY4T9ukHycdsupYZQKd0EdpeyWdkS8PG4MRD45x7diEEQNWze4+niBdVsadnc0x4fpegJr3viriiq++LB0p1bC5wz1jFcucwzXtlMMgSVUEC6eBYpe5iWjANWoF0irONaNJPot5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ndf3Ye5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49ADC2BC87;
	Sun,  1 Mar 2026 01:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328002;
	bh=3VkP9vlU5leq30QrlJPL206rgman0zFh0SF0ZyoxFXg=;
	h=From:To:Cc:Subject:Date:From;
	b=Ndf3Ye5CZ6Z+oE5kCTZ8wOm6N9TjrmQUGS9HHfhWqRXim/znV/bI9+8+WPfNLAHO1
	 OU0Snjl0zHVwsiJA1Xr3kbv/KCIir9AFZpBoekFBPe2qpSnXTvFrLFWEM1hecb2Vcf
	 AQUeM6ffd8CX31/HgDlLLCK9HZHUnkblsl5OEZfB2bDgoJXtDQFpiDbJ8uVIIsWYkG
	 ktdlVFAsgVx+ySRPtPZTlCJr91rbaMvNCVeiQbUwLTfGkRUB2PUHFw8jJTlJaZMKbb
	 42ufwYcl+34vIgCM/pvoqHPYMQLUfID71J1IX9az04d1E48acnWwU0H4TKndK98Iuv
	 2FMPb1wRlKHBA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix reported pixel-rate value" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:00 -0500
Message-ID: <20260301012000.1675439-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53888-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 0E5A51CA471
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 9c632eebf6af4cb7b0f85503fe1ebc5176ff0db1 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hansg@kernel.org>
Date: Tue, 14 Oct 2025 19:40:10 +0200
Subject: [PATCH] media: i2c: ov01a10: Fix reported pixel-rate value

CSI lanes are double-clocked so with a single lane at 400MHZ the resulting
pixel-rate for 10-bits pixels is 400 MHz * 2 / 10 = 80 MHz, not 40 MHz.

This also matches with the observed frame-rate of 60 fps with the default
vblank setting: 80000000 / (1488 * 896) = 60.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index e5df01f979781..0b1a1ecfffd0e 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -16,7 +16,7 @@
 #include <media/v4l2-fwnode.h>
 
 #define OV01A10_LINK_FREQ_400MHZ	400000000ULL
-#define OV01A10_SCLK			40000000LL
+#define OV01A10_SCLK			80000000LL
 #define OV01A10_DATA_LANES		1
 
 #define OV01A10_REG_CHIP_ID		0x300a
-- 
2.51.0





