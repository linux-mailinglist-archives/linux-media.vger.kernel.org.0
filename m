Return-Path: <linux-media+bounces-53887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLT2N2iUo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:20:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7481CA3BD
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85B10301982F
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBD41A3154;
	Sun,  1 Mar 2026 01:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeP+mL9k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B426C39E;
	Sun,  1 Mar 2026 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328000; cv=none; b=Tv6moHmf0l2RausB1Xwov84ZM+D+p5WETtHjMCRGfYx9v4mfBQSuIfbxJ6zwHDooW2GKAFOEbqlfMyYmt0OQhi9u5OefXih8WLPoYBu3EPORbiVCWxOK629xOBWvCF+tTRtmsMRlHYXrPoJVFfhIBrgWliHnGN3yYyFhMbNo24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328000; c=relaxed/simple;
	bh=yxQ3hpvq+NWHMb4rbzTw14u0lp5DYRWTbtBke3+7VWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sG5sG3UN7vnfzcE7WsrZju38Fo3cNEdI5aM7vxhoh7dhbip5wfPb6zDdL0eqfASDlkXGpAPtdrvw9B59AQIz8a+yEakCNPTSYGMgwrkXrM4VHxe9iy+WcXVRJCZLaZBycstrVFM/OmPKwhSkN9OtgUteB7BQKl2qU5LOyf4IkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeP+mL9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64892C19421;
	Sun,  1 Mar 2026 01:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328000;
	bh=yxQ3hpvq+NWHMb4rbzTw14u0lp5DYRWTbtBke3+7VWs=;
	h=From:To:Cc:Subject:Date:From;
	b=LeP+mL9kHcaFL6Tp+C87WTaNTjgOzQeeXDGg4sFCvCYYE/1hLJFJaAytbV7qCZZgC
	 s+Tw0i7abdGLvxJLX3nnKkiD2BmzNiKUqlYFI0ZdG+6geqZe6Sh7+51r44a8cYut0D
	 G0CCU7fMt/nVsObY/yFPWV5OLWHcN02VGacM4m7AvbBEI4gxDSgSlPd8BFq7KJ7zhO
	 tLiKwv/hEBJn70to0Cb93+1+lVbyvIZZkaOQW6Ypf6woPeC18oCM1oGq9sSae1p88/
	 0zpGmxpuVQ8GwQbXmvm8j6qG7FzkChuPHFEaweNpVkt79t5zrS2t9u3plJ1K9R3Hs1
	 XT51ovRVDTsVQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix analogue gain range" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:57 -0500
Message-ID: <20260301011958.1675360-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53887-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 9E7481CA3BD
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 109e0feacaeca5ec2dd71d7d17c73232ce5cbddc Mon Sep 17 00:00:00 2001
From: Hans de Goede <hansg@kernel.org>
Date: Tue, 14 Oct 2025 19:40:11 +0200
Subject: [PATCH] media: i2c: ov01a10: Fix analogue gain range

A analogue maximum gain of 0xffff / 65525 seems unlikely and testing
indeed shows that the gain control wraps-around at 16383, so set the
maximum gain to 0x3fff / 16383.

The minimum gain of 0x100 is correct. Setting bits 8-11 to 0x0 results
in the same gain values as setting these bits to 0x1, with bits 0-7
still increasing the gain when going from 0x000 - 0x0ff in the exact
same range as when going from 0x100 - 0x1ff.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
[Sakari Ailus: mention analogue gain and update the limit from 4096.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 0b1a1ecfffd0e..834ca46acb75f 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -48,7 +48,7 @@
 /* analog gain controls */
 #define OV01A10_REG_ANALOG_GAIN		0x3508
 #define OV01A10_ANAL_GAIN_MIN		0x100
-#define OV01A10_ANAL_GAIN_MAX		0xffff
+#define OV01A10_ANAL_GAIN_MAX		0x3fff
 #define OV01A10_ANAL_GAIN_STEP		1
 
 /* digital gain controls */
-- 
2.51.0





