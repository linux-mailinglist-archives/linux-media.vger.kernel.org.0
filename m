Return-Path: <linux-media+bounces-52756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKjiH+Qvj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:06:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBC5136E5F
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 686C530F49ED
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DDC36214D;
	Fri, 13 Feb 2026 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S5H/IufR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA55D36165A;
	Fri, 13 Feb 2026 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991363; cv=none; b=FXW7IONavOQnkpG6Y55UwbfC5Shvs9HPV1g+7R+ScINLjCxBeeEdhpuVcXccXq0G2GcJQjUtILvvIAQLdr/Tff6QOw6g075QrzUCMEM80nFHCG3alUq2vUJKiqIuc028tit0Xx+2UQiUm7Mny0XbzD8ELwRz94bhSrekEm62uc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991363; c=relaxed/simple;
	bh=awyvcL9zMDZdNR4Tc/jZ/sf7CjfFH0FtEDJ3re1DuvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KtjQ6gartfxyEkJ9YI1B37jqM//A8CWMAedtvHaY+C3UMDI4NS9vJpzyDLKSdutP2tJYu5DaKiCGhIQi7GJv55+04lYkacSRNVmzD2pfGgl1B/d30cQ4bpXu6tpjmGMs5PUUKx1Z3RXs6bLsyd1OeD/FsuTVKqEttdhFpf9ZDxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S5H/IufR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B55E2769;
	Fri, 13 Feb 2026 15:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991282;
	bh=awyvcL9zMDZdNR4Tc/jZ/sf7CjfFH0FtEDJ3re1DuvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S5H/IufRPjms/bYphNabuMrQ42M6M5HaFTdl9RqmLTKAbn2fryYCBIOkQiJWlfrZo
	 3oyPmT6HVdVYssy5uXgcAnpSRTjQt85LYyl6Z7k9t/rnGfn/rHuwZze7q2UDngdlab
	 j3r2D+uciQ7x3cSkmDep+eKKU0GdtINXIw1GWg9E=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:54 +0000
Subject: [PATCH v2 15/25] media: i2c: imx283: Simplify and clamp widcut
 calculation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-mainline-imx283-v2-v2-15-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=1457;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=awyvcL9zMDZdNR4Tc/jZ/sf7CjfFH0FtEDJ3re1DuvY=;
 b=RKs9GpI3+B6x5MPUV4NM9Ras+q4jDuBFDkFUSnnbwjNuTs+dNIIl1YZKlkN4qvCLCPrQazZmp
 YJQGlm2ELnDAPSx/s63ky5mL+J+uqNoU2p65Uk1UUYElT9fC+b5Ctxz
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52756-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: EDBC5136E5F
X-Rspamd-Action: no action

The vertical handling cuts unused lines to restrict the output to the
desired height.

It can be valid to set y_outsize larger than the veff to include optical
black regions in the visible image.

Ensure that the cut is clamped to the veff to prevent underflow.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 6c2be9195cba..f9cf2bb0e10d 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1145,7 +1145,11 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	{
 		u32 y_out_size = mode->crop.height / mode->scan->vbin_ratio;
 		u32 write_v_size = y_out_size + mode->scan->vertical_ob;
+
 		s16 top = mode->crop.top;
+		u16 veff = mode->scan->veff;
+		u16 cut = veff - min(veff, y_out_size);
+
 		u32 v_widcut;
 		s32 v_pos;
 
@@ -1157,7 +1161,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 		 * cropping width = Veff – (VWIDCUT – Vct) × 2
 		 */
 		v_pos = (top / mode->scan->vbin_ratio / 2) + mode->scan->vst;
-		v_widcut = ((mode->scan->veff - y_out_size) / 2) + mode->scan->vct;
+		v_widcut = (cut / 2) + mode->scan->vct;
 
 		cci_write(imx283->cci, IMX283_REG_Y_OUT_SIZE, y_out_size, &ret);
 		cci_write(imx283->cci, IMX283_REG_WRITE_VSIZE, write_v_size, &ret);

-- 
2.52.0


