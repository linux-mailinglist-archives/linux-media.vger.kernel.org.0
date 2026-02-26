Return-Path: <linux-media+bounces-53446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEy5JjUSoGlAfgQAu9opvQ
	(envelope-from <linux-media+bounces-53446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:28:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CDA1A35EE
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D1EB31159E2
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA6A3A1A30;
	Thu, 26 Feb 2026 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="aBT2BUbs"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66539E6EF;
	Thu, 26 Feb 2026 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097826; cv=none; b=TZZ9/9fm4lyfvtkJ6A0F3xhZ16F46MvfAm7YAwwplYI1ACggiKIYSgbGm/fZiV2sRh5d3MRfkwcmj7lH6rXQo6tdyXMGSJfFG5WiSFc1WtHJ9O5OYXTUexHkvXbTgxT14AgDJV5fU1SgnxFWErBLptC6mOy2AfFx9QLY+Owrs5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097826; c=relaxed/simple;
	bh=e2iCQhxTK3Ei8b4kh/WAOWAFwBK21OyjbDZMcAnayVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3TO+V9ShfzDn75MPC4KPLCKmM/HytDKFKrO/Rsn1I0utli3ELuKDbCq4xMMY8vXkzUl7WnWgo7495d3ue9cGs/3Aju+pJSYgJ8fSkgP5EyZlGzJcrk646/D8ekUCYcMVNozWCB90+ih8FaBAwXfdHKbZWnOKpd3PyJPlBYgSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=aBT2BUbs; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tf+eVQdnJLMIh7oCYg13Ez5jy4Z6AQ8sRVv49j0hQEU=; b=aBT2BUbsHLH8/KI/F6hCDFfF2j
	JqWN8kAWPditfKsto3/BZP8VBPaScNGeIyM0KlzFCxLZU2O5P9GtZdQ7VqdbL4ONsfPoUvlQFh9yx
	eMVmpvOr2KBGHc2IlCg9pumA7UAdygmh+lhQztMzJ6yRqi/iXKsG2AOFQa35r2rPnM+k=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:64689 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vvXAx-0018Zt-9T; Thu, 26 Feb 2026 09:56:51 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 26 Feb 2026 09:56:07 +0100
Subject: [PATCH 7/8] media: i2c: ov08d10: fix some typos in comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-ov08d10-v1-7-c3a916368123@emfend.at>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
In-Reply-To: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Register P1:0x33 is written twice with the same value in the
    'lane_2_mode_1632x1224' sequence. Remove one unnecessary write access. Signed-off-by:
    Matthias Fend <matthias.fend@emfend.at> --- drivers/media/i2c/ov08d10.c |
    1 - 1 file changed, 1 deletion(-) 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53446-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,emfend.at:mid,emfend.at:email]
X-Rspamd-Queue-Id: 13CDA1A35EE
X-Rspamd-Action: no action

Fix some spelling errors in comments.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index fa8d29a62fbfa956dff6b57ccd6c9b7777967731..f5c187d763c4264056100b904ab9585b25909e95 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -93,13 +93,13 @@ struct ov08d10_mode {
 	/* Frame height in pixels */
 	u32 height;
 
-	/* Horizontal timining size */
+	/* Horizontal timing size */
 	u32 hts;
 
-	/* Default vertical timining size */
+	/* Default vertical timing size */
 	u32 vts_def;
 
-	/* Min vertical timining size */
+	/* Min vertical timing size */
 	u32 vts_min;
 
 	/* Link frequency needed for this resolution */
@@ -571,7 +571,7 @@ struct ov08d10 {
 	/* Current mode */
 	const struct ov08d10_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 
 	/* lanes index */
@@ -913,7 +913,7 @@ static int ov08d10_set_ctrl(struct v4l2_ctrl *ctrl)
 					 exposure_max);
 	}
 
-	/* V4L2 controls values will be applied only when power is already up */
+	/* V4L2 control values will be applied only when power is already up */
 	if (!pm_runtime_get_if_in_use(ov08d10->dev))
 		return 0;
 

-- 
2.34.1


