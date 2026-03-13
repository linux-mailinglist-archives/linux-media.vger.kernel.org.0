Return-Path: <linux-media+bounces-55657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOtOGxLys2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:16:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7628214E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E01A03184AB2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9404838AC62;
	Fri, 13 Mar 2026 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IttCBsXG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DC9377EA9;
	Fri, 13 Mar 2026 11:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400454; cv=none; b=bnkvstGIeq5X/xgL3v6XWaDVTcfh1msVqXCq8iv1sLTWBVltC4r5fiBiP/FCNw/++JxClvbgRuHK62VboAYdC+JZXK7mr2sA0MeIOSj1Q3oPfA8tV1gh0JVCFJJ2XMNIdjFQHM4glcAwkmLjH8UHmv/jPFkUwjk6ZmTklwldIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400454; c=relaxed/simple;
	bh=PBi8P5i1khh9PfffQeRZH7xdA4AlUrisQPWAXLjqUpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T55ssle7aOvlh/0bfmauRykw97anG0T2uuQ9tsLEKf3j736TPSUjE6b/Od44i66dc33oSwTFJsTfK2JLyttF/g4CdS+tV1GWo7Je6n62HxbWoS846n4dg8OVBuAt536e/T6Wmx/cvoOqNzuqI2Hm3vlo06uw+cPWpzM+2yt35JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IttCBsXG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.92.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AEFD1356;
	Fri, 13 Mar 2026 12:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400383;
	bh=PBi8P5i1khh9PfffQeRZH7xdA4AlUrisQPWAXLjqUpk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IttCBsXG3u4XP+j0+Ajel/3T5VM52K1N5XtUIzAXzh8wDmKZjlKK+Vflf5O1Vjjwd
	 Y1Xo0N0EVfXCUKNiSOi3O38MytI9lUe9o1F24WN3BREqDA0nmFYFhpdQLWmB6dFxwq
	 jvqhJsx+T4DEcJ+L1F7ipkLAOtx29RDefQAwkh5M=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:13:57 +0100
Subject: [PATCH 1/7] media: rzv2h-ivc: Revise default VBLANK formula
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-ivc-fixes-v7-0-v1-1-cb0714cd1279@ideasonboard.com>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Daniel Scally <dan.scally+renesas@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=aADwAwORVgNkbQP67xlyDy3fqg+eAiV6IKfDCHUXOxk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps/GAKwcccsUu8ka2xR9jDs44/l4lbAvmvq2CF
 fmDPgfLsSWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPxgAAKCRByNAaPFqFW
 PDtkD/4nHAmPHgF3CzH2MQnkQbHy9qk3nsjCNuvYOBVtWFiC/VYIcDaQ95YcVuefVHBXXUmdYE8
 GM+bGnxv31SENE0lczHl4aoI9GPV6OKoEpGLFoRpoSSytPAre98hW3+zMPpMMEAmrgFOPLLpSC5
 /sdzvFlcCuqOHh0LvIOUM7l4e56tvGVr/ZDaIGV/CGXM8PvO7WQ87rbYTWx85dh4GiYcFDQMSrG
 Vuw5IqTAPT2rKLpvtkk17frf1ljAPUqP5bvv4osCxpgfJPZgt+lHSKu/C/W1jZyuviAsoy3gkgk
 ac9JpbIhzQHih3WDdK4mnk8aYN4d8v9PeHMKz7kI11JDqX25Y33Ioqh3WSehvQk4aqc1R/41a7P
 pCAMRDJAArUsF/SDFk2EFnMk1tyxa+R0BlEJx9HhyajN26BHXYH3rn731t0FcadzCYjVvr+6Fs6
 ia/OH9BWOHMoo6O6yUwsOXmSA9mCLCtyySG765UYXX+pez41+qV1KkcuxVR2UZwBNCTltidmrP4
 hsa0KJyavvzteJjp+ZTa+Onxmc2zqsd8Dk3e4qrh+Xht9PcluwXCBjnv36h7qVE/cMqPff9kzK+
 zCchZ3zIw0w4X7xepFRd0fKHhy6GOtCfABWXs45xeoP5tDwd3+Iz8fuMRhQUw37RStDP6/puuCI
 XxFzb0YC2ygIEEQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55657-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5E7628214E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

The vertical blanking settings for the IVC block are dependent on
settings in the ISP. This was originally set to calculate as the
worst-case possible value, but it seems that this can cause the IVC
block to hang. Instead calculate the vblank to match the default
settings (which are currently all the driver sets anyway).

Cc: stable@vger.kernel.org
Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index 799453250b85..1e016b17dcee 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -24,7 +24,7 @@
 #include <media/videobuf2-dma-contig.h>
 
 #define RZV2H_IVC_FIXED_HBLANK			0x20
-#define RZV2H_IVC_MIN_VBLANK(hts)		max(0x1b, 15 + (120501 / (hts)))
+#define RZV2H_IVC_MIN_VBLANK(hts)		max(0x1b, 70100 / (hts))
 
 struct rzv2h_ivc_buf {
 	struct vb2_v4l2_buffer vb;

-- 
2.53.0


