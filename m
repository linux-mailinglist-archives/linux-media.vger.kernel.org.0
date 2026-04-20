Return-Path: <linux-media+bounces-59157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IszBOY+5mlutgEAu9opvQ
	(envelope-from <linux-media+bounces-59157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:57:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF142DA93
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62E1E30665D3
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77B73368BA;
	Mon, 20 Apr 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="Xk+lKENL"
X-Original-To: linux-media@vger.kernel.org
Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938D9336894;
	Mon, 20 Apr 2026 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693312; cv=none; b=FoobxWg7FPLwU0+8PrHqV/vcQCCgynHpLh0uGfGUTl1lsjGLi5aj26JZZNcOwAFQxrQ8gQTol0FLr6/6Ypa8rFZ709XEFWdR746N8rGy8x7w8jgYnDaHcwlEQPXBhqjwSguwICHw6pzW+WkVF17eJiaVYgRylL1Lo8FtMwpfGZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693312; c=relaxed/simple;
	bh=Ssfj0cVGadpRPkLNIxdEg893oD5MdyY4VfefAhq41h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVP815zSTXQwmWdpKg2SvYJ1sl2b8gnktVH01HqvyFzI6NfZQf5OnS1zqtmQ/JPylaOfvksokbND3aPTkxa5rC76zUc4WTErOmACso0i6o7I75Kp2LXMRTvgLtravx2lYSa8di/nsbHb4tBXfQ6SHC7QGg1bMENGaSrwh93j43M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=Xk+lKENL reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776693300; bh=Ssfj0cVGadpRPkLNIxdEg893oD5MdyY4VfefAhq41h8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xk+lKENLekKJX5Salxsqa3VtQywbHQA702CVuHYezuxWsQcrQLR7XJfth1aRUozHZ
	 hE+M6n+Z2Mal2tHlk288CtpkD7lgJv+t/m75xPse1HgVTAACH1yPLkWafEcNm7G/R+
	 SLceYK8CWpxEY0A1WIkSb9ig2j9zdlRK1QoUwUrvFAZJMnh7dD1TyFAk/xPIwZUhMc
	 t5tiIaiytwNrzv0h8fsZG4f/QVYbCfV4rElW/MsDT/3pk+8TMggLoUcQ7sfryw9xvl
	 HyVpTu1+wqlj0fxhDmmOfwq9JvjlYX9WVHUTefAzyWY0bGDUYZiEY67+DRIDQJnWOV
	 WMg0zeql7EKQw==
Received: from jovis.fritz.box (p54909809.dip0.t-ipconnect.de [84.144.152.9])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id D405F2206DEA;
	Mon, 20 Apr 2026 15:55:00 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id 9451E83; Mon, 20 Apr 2026 15:55:00 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: gspca: Fix comment in sd_init()
Date: Mon, 20 Apr 2026 15:54:43 +0200
Message-ID: <352a50a64a3ecb7ad6346d2d0844b5b7d4aa90eb.1776693140.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776693140.git.pmhahn@pmhahn.de>
References: <cover.1776693140.git.pmhahn@pmhahn.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pmhahn.de : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[pmhahn.de:s=202501];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59157-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmhahn@pmhahn.de,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pmhahn.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.943];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pmhahn.de:mid,pmhahn.de:email]
X-Rspamd-Queue-Id: A8DF142DA93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix spelling mistake of{ -> f}.

Signed-off-by: Philipp Matthias Hahn <pmhahn@pmhahn.de>
---
 drivers/media/usb/gspca/sonixb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
index 09725d62d904..60b5d4bc528f 100644
--- a/drivers/media/usb/gspca/sonixb.c
+++ b/drivers/media/usb/gspca/sonixb.c
@@ -946,7 +946,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 /* this function is called at probe and resume time */
 static int sd_init(struct gspca_dev *gspca_dev)
 {
-	const __u8 stop = 0x09; /* Disable stream turn of LED */
+	const __u8 stop = 0x09; /* Disable stream, turn off LED */
 
 	reg_w(gspca_dev, 0x01, &stop, 1);
 
-- 
2.47.3


