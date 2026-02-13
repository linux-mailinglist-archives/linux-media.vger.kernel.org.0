Return-Path: <linux-media+bounces-52741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHGBBO8uj2nTLgEAu9opvQ
	(envelope-from <linux-media+bounces-52741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:02:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C5136D9C
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 452C530457D9
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A96D360737;
	Fri, 13 Feb 2026 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ia08d3UI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D29122A7E9;
	Fri, 13 Feb 2026 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991329; cv=none; b=o40/rP2Z/c1uwX6oAez2vwdn++ox6kY4e5IvAK1hG/c5sAlP+dpYocKCLX3IBdnraUp1OkCkpFgztwSIH17sbZojQET57wTUqO3yTG/y/sZo1JvtbCVl/Q+x0lqzk9q217b/teCPG12V6PamVsNfYwCKlUxl/SMQSWANN696XGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991329; c=relaxed/simple;
	bh=eGDt+QUEP8jNkwnTJw5v7lLHwdQU7KiuyW9rW8rRK9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBV+oIhZ5fET38VtiQldGV19lXGWVZ3j/C+maULUxmq+Nc3x/XxRwtxnQjY+4F0b+/LmuxJKI7WNLxpjTsMJly0pYBJhvdnVe34GbUxQSDHTnE1cnIuscCx/OykKOyhL+jX9eNhA/xqvC+LUT6SYd0+GlKWGiCzRQADHrVy3E60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ia08d3UI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48BD1CF5;
	Fri, 13 Feb 2026 15:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991277;
	bh=eGDt+QUEP8jNkwnTJw5v7lLHwdQU7KiuyW9rW8rRK9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ia08d3UIriE4hYdb2pdX/lZHbIK4Ez4DR6ViF5/DJAloJuAZgfY/tSgiMJyA6l5zW
	 Jur2ixrRB4Vv9k7z4TSLaZ5wrfOSJeAm5OsioB7969W7jHBV0sdI1JJ9wll6XaMCPq
	 vtXNMkm2+dZI1c8ZBKTMCKH2UOKIjw9EE0Gb7rCs=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:40 +0000
Subject: [PATCH v2 01/25] media: i2c: imx283: Report correct
 V4L2_SEL_TGT_CROP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-1-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Stefan Klug <stefan.klug@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991324; l=1325;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=BBivussIvk9YcKcloCC2V2eItBbXaeuB2KOGJapG5tY=;
 b=axDFgGxuFDNwToutEE2Vf2IR9/QkpNEM4JYDiSzDExFULz8eu7v4jwkp0GiPP1qi5T679QDxa
 ZcNs/4MaTxeAvy/1snaKPs0IXCUnq+p9QxW7Zm2W2gwC8Abkptm++cc
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52741-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[kieran.bingham.ideasonboard.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: CA4C5136D9C
X-Rspamd-Action: no action

From: Stefan Klug <stefan.klug@ideasonboard.com>

The target crop rectangle is initialized with the crop of the default
sensor mode. This is incorrect when a different sensor mode gets
selected. Fix that by updating the crop rectangle when changing the
sensor mode.

Cc: stable@vger.kernel.org # v6.10-rc1-70-gccb4eb4496fa
Fixes: ccb4eb4496fa ("media: i2c: Add imx283 camera sensor driver")
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 8ab63ad8f385..e5c04d259625 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -956,6 +956,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
+	struct v4l2_rect *crop;
 	struct v4l2_mbus_framefmt *format;
 	const struct imx283_mode *mode;
 	struct imx283 *imx283 = to_imx283(sd);
@@ -982,6 +983,9 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
 
 	*format = fmt->format;
 
+	crop = v4l2_subdev_state_get_crop(sd_state, IMAGE_PAD);
+	*crop = mode->crop;
+
 	return 0;
 }
 

-- 
2.52.0


