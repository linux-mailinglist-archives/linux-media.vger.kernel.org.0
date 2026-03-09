Return-Path: <linux-media+bounces-54979-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCGeCOQHr2loMAIAu9opvQ
	(envelope-from <linux-media+bounces-54979-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:48:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B2223DE19
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 125A43068164
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 17:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAE9293B75;
	Mon,  9 Mar 2026 17:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="W47cSfGR"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFEE27A133;
	Mon,  9 Mar 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078378; cv=none; b=D6Q3RwupSF+xxMAdKICIeaOYsa/kWLLj+2Cf/sbM34Gb7yi990Wg+AEfiDnyOg5UsKvyVruylRb05zEoKzVzNjVYqvv/Vmh4zASSODeW+gStK5H4H3LxWdfCZI6Ow1g36v5B4R7OzqxseRbYdKlECt9xp31wzcq36RTDeueJ9U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078378; c=relaxed/simple;
	bh=IfU1Y8onDOfWqqELfqFJsJ0vpN6YdPyB9fFFjmm5Qfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BEWp47r+oDKSLURYV+Z+tBnEaBd2xp6Wl1edwuWMk+Jhu1Pk9wSAxz4vmSfjBcjKhP3yvOZHUvWGaryRGw0rrCQFBt+O3tLkAUSiwDWsbMR/GnmAs8LWdJPlNDOfRhnJs2wJAfllc6gBsCTslKlO9h1reewwWGLNd5LSeHb8XKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=W47cSfGR; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7SVm8W87fXLlxZkokAgEevAaF5wTPfi0LE7BY0/dgJ4=; b=W47cSfGRqzrPRZaFUeUClX3UBK
	nqiKRVjjTIOzVTI89NyU8+VMgCKvyyQCZXrRLJ7pse0rRmbi/HFMleFDko4050Wu3TJxMiZqeL+6Z
	QyWX+ih33/w98mUwAnRJ1Uh52I6Q92iOUg+x+eROiR5BPIR13enLaginxR4ffnGY2IWk=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:56968 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vze4R-00Dxnt-6s; Mon, 09 Mar 2026 18:07:07 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 09 Mar 2026 18:07:06 +0100
Subject: [PATCH v2 4/9] media: i2c: ov08d10: fix some typos in comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-ov08d10-v2-4-81f8b5d99984@emfend.at>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
In-Reply-To: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
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
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
X-Rspamd-Queue-Id: 79B2223DE19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54979-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.941];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,emfend.at:mid,emfend.at:email]
X-Rspamd-Action: no action

Fix some spelling errors in comments.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 9d54170cdf7da6fe4f03dbf64d5e8976df247846..fd1e0769eebe99ec2e827e9bfd0d0a7731116669 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -88,13 +88,13 @@ struct ov08d10_mode {
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
@@ -533,7 +533,7 @@ struct ov08d10 {
 	/* Current mode */
 	const struct ov08d10_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 
 	/* lanes index */
@@ -863,7 +863,7 @@ static int ov08d10_set_ctrl(struct v4l2_ctrl *ctrl)
 					 exposure_max);
 	}
 
-	/* V4L2 controls values will be applied only when power is already up */
+	/* V4L2 control values will be applied only when power is already up */
 	if (!pm_runtime_get_if_in_use(ov08d10->dev))
 		return 0;
 

-- 
2.34.1


