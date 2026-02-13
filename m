Return-Path: <linux-media+bounces-52757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLDuARkwj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:07:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD6B136E85
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17DF43102732
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB07361676;
	Fri, 13 Feb 2026 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DpyjcpI1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236043612F4;
	Fri, 13 Feb 2026 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991365; cv=none; b=gfRKeq1+FjTaTeyExZSji76usxXN1vmpu6N+ykc+sF2cQLlsfUVO34DE0xrTyHSJZJeWDqY+NvmcKa+VXEs4WKzq3Y+4s/QeU5oQzjGUkgWkFeV6hSAx46HhhplHTFf9iFaVWBI4/MRm7q8oYiiXy98IYOFnHbYbhLG1XB3GwE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991365; c=relaxed/simple;
	bh=FmcEYHQ1IfaibJAwBHqF/Cbl4nH/qotAV8i2TDcsS8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiQr9XJvgZjtjOqm8IMf+HrNeknO2v/W81sfJ3iou6mmNKul4CwZNMo7548w552eLgbXGfFZNEUp9M5U8wF6Krb94TPZC+6TuzugE1eIR8FMTPawRtY40F8jwpIYon3T64Rj8n0WBo22RovcvbVcY5VqKxXk9roQOGWk0YLCwps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DpyjcpI1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8EF1276A;
	Fri, 13 Feb 2026 15:01:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991283;
	bh=FmcEYHQ1IfaibJAwBHqF/Cbl4nH/qotAV8i2TDcsS8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DpyjcpI1dhyX01PtXye2W9/PP05Iaxd60yU+YFFrfMxtT9IFMyWBogcM55oe2DUdO
	 H7GodRUet9k9YB894Edk288QfBkzbtKXDBF1NzBu8OK3tQW8UnXeDur1CHwT9UGWgF
	 F0BMRaahUOSL6grGNtIWAHoCXuxcfobyF9vH7Am8=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:55 +0000
Subject: [PATCH v2 16/25] media: i2c: imx283: Account for clamp region
 coordinates
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-16-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=2260;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=FmcEYHQ1IfaibJAwBHqF/Cbl4nH/qotAV8i2TDcsS8E=;
 b=dYJ/cIb8LQhuQUTFejw5z5vytjg8XtKiKbSVc3APC7gMZ1lGiH38NqBWMI3aD/nSjhIpjXkca
 ctB14NwI6oIBzl99IEoBOz5poz9ptoJr/6yJuwzJXeJKQBXaFyIgL7J
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52757-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: AAD6B136E85
X-Rspamd-Action: no action

The user clamp region is included in the pixel native area coordinates
but is not included in the sensor vertical coordinates when configuring
the VWINPOS.

Remove the 16 line offset from the top position to account for this
and in the event that a crop position requested vertical optical
black, reduce the OB_SIZE_V register which causes those lines to be
output in the main image data type instead.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index f9cf2bb0e10d..c3a44d2c6508 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -1144,15 +1144,31 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	/* Vertical Configuration */
 	{
 		u32 y_out_size = mode->crop.height / mode->scan->vbin_ratio;
-		u32 write_v_size = y_out_size + mode->scan->vertical_ob;
 
-		s16 top = mode->crop.top;
+		/*
+		 * The CLAMP region contains the Vertical Optical Black (VOB)
+		 * lines, which are not included in the effective image height
+		 * and 0 of the VWIDPOS corresponds to the first line after.
+		 *
+		 * This puts any request to view VOB as negative positions.
+		 */
+		s16 top = mode->crop.top - 16;
 		u16 veff = mode->scan->veff;
 		u16 cut = veff - min(veff, y_out_size);
 
 		u32 v_widcut;
 		s32 v_pos;
 
+		/*
+		 * Reduce the v_ob when the requested crop position is below
+		 * zero to output the VOB on image data.
+		 */
+		u8 v_ob = mode->scan->vertical_ob + min_t(s16, 0, top);
+		u32 write_v_size = y_out_size + v_ob;
+
+		/* Clamp our top position now that VOB is handled */
+		top = max_t(s16, 0, top);
+
 		if (imx283->vflip->val)
 			top = -top;
 
@@ -1168,7 +1184,7 @@ static int imx283_start_streaming(struct imx283 *imx283,
 		cci_write(imx283->cci, IMX283_REG_VWIDCUT, v_widcut, &ret);
 		cci_write(imx283->cci, IMX283_REG_VWINPOS, v_pos, &ret);
 
-		cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->scan->vertical_ob, &ret);
+		cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, v_ob, &ret);
 	}
 
 	/* Horizontal Configuration */

-- 
2.52.0


