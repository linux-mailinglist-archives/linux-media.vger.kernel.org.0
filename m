Return-Path: <linux-media+bounces-59690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GJ8D/+Y72nQDAEAu9opvQ
	(envelope-from <linux-media+bounces-59690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 19:12:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A90A8476E58
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 19:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA0B930B59D4
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 17:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66AC3DD51D;
	Mon, 27 Apr 2026 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2Byk7ap"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B13ACF0C
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309659; cv=none; b=q/7db+yh7CmSP51kKcDGV94HSBTlrTpuARVP3hRGzIZcaFuRz6YubbDSsRxwMZgTTaqYr3JEWWs4mpC+ALipIPQVtnAA4fVNy/go0EYYtxJE/LT2C02tQ1Mt6zF/2jjIs3K5QAoDipNToPsaekaWoytlFkjrS815duU+DcLhHdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309659; c=relaxed/simple;
	bh=2BBIVyuBfJT/9Pa5JyxKH2ni54xydMVjGCoT+247qyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXJF4HACH7iSwxsb8wMjk9p+clDTLcKingLGAFkocwIGpw95w7n5SrWHjnCezdTP5tZpjl686Om9jMKzIanCGoQet6xOlatXD3ExEGw2nOG4McGUPGhoSsPRcQ1hhuSnpJRVMeooUdxN044PyEkt7ghxDWSum5/rqDMNwMcQW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2Byk7ap; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c795f441ff7so7255937a12.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309657; x=1777914457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=;
        b=G2Byk7apIBIT0LvXdLobff/jvQvGG9DmOkQbLYs/kaTT/UyrbdY801rYoUzeiF45KM
         Y2SRc7xU0T79OSU1gQ5EUNWXYdBwdHINSyFik3wAmMnduOnbkLL5Dbu4w7JymaY1Aabd
         93QPRDvIPSqOWa91ITgR748EF9SHHD6r0fU294b8qlenwMofHCoTT8uPlCaALts7nDCI
         hi5PYCzDB8aJ61DWbgUxlc8g3xM/pRARmy/Px9eaELxNXVLyA3gqw+6PP2B4U3+n4Rho
         JV4BUXZVNAhtfGdF2/M1fGiogwSWGOTTUPCV2m7M7eG88TVe/R516EWo5qzm/ULbajB/
         ld9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309657; x=1777914457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=;
        b=P6nlkZc1AeAowFL7bdRSX2tDTvpHZHheVnBSzUFYCaeegh1vytujzO9VrCGDfmuAJg
         PJn69kcc9YpjJK5g/7WbTe7Yh/Lo/ULAxEKpQeDKHufMNFA9VsvOgP6SzfjxP9QBva0e
         qqpKkYER8b3hME2AK9AalpjJ7MI2EgnMQvsngvXGEawytGsy5GlAPRGum4b96MAY7VFN
         Pk/1+HF9xl4uMSMz9E8CgGF1i+vhRUiYFPTvVJGCQMtRzWWC9PnqMk12OEMGUHY2bDlW
         V7yhmpAbS7EB/g57k1SrY/UzpUnQkQt7OC9/QRVaBbds+WuVPyvJkZr8yUenHvusSWua
         hsIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8e0mY9M/X6SGkhiHeeb2PSCQaL55T/1HysFHKTD2/6/LUiGoIlBIFB1bo6PV/Hmf2edPQc97XoNwnWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMNJClr7J9v/LzLLoOJbhL7ugsR6WmUKLXErN6OY2hEWlA1EG
	KSFHLp/bRCDBvTUOAcNVTX8yG43HTxhUOLOz6192kgDlt3lAnm2nspI1
X-Gm-Gg: AeBDiestCMKGXsGqdIO5DxFVQpRIr8CDojIs2FmFyHE+UMYXREIlwAdjeo4wBS2OaFg
	EYmdXMA6XYea6Fr4/f2ngyqnb0cyaJSSxLJZJUPQpx4G7jICX3yEKo8xBhuiSaVcOULdctX4JEC
	fV985j0Tl+kR6v0gunacAa1+F+Htmh77BY3iW9hqYcsEsIegPwc8A2HMibPubh4DS61AdIjUt8W
	t21cUG1c/HbDL6IGs9+Xmx0/1zJC7q9Ic4jxRMDZhFVIF2lUujRmeqL3dc9EWnok002KRHIHZsB
	Sda1UfspTJRcyjmqV8fTV9burM2lsset6s8CQGh+xeXKaAEeIu4wDIy/lCH+FU1s6M7bGY+IdmK
	hhbcwRF0vvs4jbuknESnR84Ii1cGYmnrwhrypz23edh+aRk3FbdiCV4YQm8VrLCQOnBGNinbuB2
	SZcFa/B1ppNeV0PzuQrNXdoOZHxbDdKSomuBPMF8g8glG5rBl4/wm4oLrka7g5H8CTc/N7QuDmB
	C2r6i9CF5P34LqnzWwDpSGmOZUtf5py
X-Received: by 2002:a05:6a20:6a09:b0:39b:ba95:b127 with SMTP id adf61e73a8af0-3a398c117f6mr307416637.4.1777309657446;
        Mon, 27 Apr 2026 10:07:37 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm39497551b3a.55.2026.04.27.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:07:36 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: imx: remove unnecessary braces from single statement if block
Date: Mon, 27 Apr 2026 22:36:33 +0530
Message-ID: <20260427170634.23072-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A90A8476E58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59690-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Remove braces from a single statement if block to
follow kernel coding style and improve readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


