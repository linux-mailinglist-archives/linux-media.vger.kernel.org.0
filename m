Return-Path: <linux-media+bounces-62350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM78GEIZDmpT6AUAu9opvQ
	(envelope-from <linux-media+bounces-62350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:27:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BE5999BA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 22:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65ABC3014162
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 20:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B3B36B048;
	Wed, 20 May 2026 20:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vhHPv1TL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13503537F7
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 20:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308863; cv=none; b=jKV4yvNAv3UYgyXYxSLOs+FyRkxt6QU0v92XB8dkTENZHjpkeTTYVjrsVwm6jcM/u+2d0ZYjWC2mLXhDgtR6gQZELav/2piz3+kZu8JcP2+kA28N+JyCyCzMAc0yvhmxHnHFyM0NPsg9ksKPTWGsUqWZK20q4/cKW7WbmHhMBLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308863; c=relaxed/simple;
	bh=nNp3h7fzC+P+gB108HvnMusXH/HXgD5he2h2CbgBgCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h3efwnOz1ro3Z0tNxLJybNupeaTTUDirGXXwIKoHcyt8LdWUjykeay5fHuL5Z7fEB3YYuNWSM2k0XoN2YEiIby5178Ensi9o1NomOqeN1kYQp1dY4ZS7FMWNyN4UUTELNXavkBMLdy2LIffF2YeNpSHMuyxQco4Mpw6cCA8kGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vhHPv1TL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9980B874;
	Wed, 20 May 2026 22:27:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779308845;
	bh=nNp3h7fzC+P+gB108HvnMusXH/HXgD5he2h2CbgBgCI=;
	h=From:To:Cc:Subject:Date:From;
	b=vhHPv1TLiYfQtwqJZMM3+pNrAwuemXpRWtb+RH8N/S/oDK9nra6KMh2gsB7e+HjRC
	 U+MJGQUvKjM5en1v2N9PhagZYyyGD2lGXAP9zM+160uL3Z0BpLr2sYxHBx195+7lNN
	 qi8ZTItJArr3ggjO5xLs28jwVZU67U2wC8kCxbDE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	imx@lists.linux.dev
Subject: [PATCH] media: nxp: imx8-isi: Drop unneeded downscaling factor clamping
Date: Wed, 20 May 2026 22:27:38 +0200
Message-ID: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62350-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F14BE5999BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The total scaling factor including bi-linear downscaling and decimation
is clamped to 16. The bilinear factor calculation therefore produceds
values guaranteed not to exceed the maximum factor of 2.0. The clamping
is unneeded, drop it.

Note that the ISI_DOWNSCALE_THRESHOLD value of 0x4000 is incorrect, as
that would be a factor of 4.0. This was inconsequential given that the
computed factor never exceeded 0x2000.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 16b20ea2d1db..e07eebae9e2b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -11,8 +11,6 @@
 #include "imx8-isi-core.h"
 #include "imx8-isi-regs.h"
 
-#define	ISI_DOWNSCALE_THRESHOLD		0x4000
-
 static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
 {
 	return readl(pipe->regs + reg);
@@ -118,8 +116,7 @@ static u32 mxc_isi_channel_scaling_ratio(unsigned int from, unsigned int to,
 	 * output (input / scale_factor) rounds up to exactly the desired
 	 * output.
 	 */
-	return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec),
-		     ISI_DOWNSCALE_THRESHOLD);
+	return DIV_ROUND_UP(from * 0x1000, to * *dec);
 }
 
 static void mxc_isi_channel_set_scaling(struct mxc_isi_pipe *pipe,

base-commit: d97d13c24d7893abcfb80d38630ce74daaa1434c
prerequisite-patch-id: 2d7379698fb55fe2345d604dfb73914f91705a5a
-- 
Regards,

Laurent Pinchart


