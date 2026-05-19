Return-Path: <linux-media+bounces-62184-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MoqFUzCDGqJlgUAu9opvQ
	(envelope-from <linux-media+bounces-62184-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:04:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C596158473C
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3FDE3080FA7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 20:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF893B8944;
	Tue, 19 May 2026 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxCVAkUi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844B3B6C13;
	Tue, 19 May 2026 20:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220843; cv=none; b=VMLQoVYPJcL8EDv0JWLWgVLm0fYeD56Dcz/cZou9x8K8TkgSW6Y0i+prjdVMpQaaqz8SQkfgtoqGodWoSXOYGJpkLpeypSHAI9Oj5Hx8G5lfylvCwYFRICjYOE8GWQA8pkAFG+Lx0Dex15ze4tO7pAd/aec11FSpJoGHhF0ftzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220843; c=relaxed/simple;
	bh=OOgUaoniX76m/tAF/sgM+nboqIeV3LgV/ISkp/XCJnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n07Tj1sqZrKx0QbyOqNrpsTbBjl40yfDRkJyyxcqPgq/lN1wf5dyd9z/ms70kkw4lC3WYJtrz1ZgVQZnq7BYQRXCRdSFAQJfKMvNX+n0dD8/tajKLmAFQ3G8pcM+wFRRDFkVyNvVX1UYha5OiDo2/LPfMGZzwrPh9KmR6XhPkyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxCVAkUi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2D61F000E9;
	Tue, 19 May 2026 20:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779220842;
	bh=XGcl3gLQX8Der+IzDGh1ASi/yIqQp9SvRrEe6NQKVcE=;
	h=From:Date:Subject:To:Cc;
	b=hxCVAkUiIFQqVdi7bA3BLeAK+VSW+kcPgRk6eXYzNk2giai8Rbp5qJQlQk2jj3Pus
	 rdIs+BxN42QTvmb97kgwReMaEIwLgwGt4MosmyRn4Rd2q5YcBgfWwi7jawoN7rCcc2
	 OnhzzLs/gvTBk+/bAqmsMBy7L52Itic8Lk3jB26uxn4a8OimYhwmlG7/aaIBPc4BdH
	 KjjiEtF6Z/FQcN+WSocdBZ5QFTsoW7X389WCznDETb1bPltCadjL8Vvq/fW8EHRElL
	 BV91FEOfsiDvu/wLph6UTR/0uQ07lEdGKwxM2erWXLUrw6leluKlIFEgpCrIcdweW5
	 kN9a7aplpUnUg==
From: Eugen Hristev <ehristev@kernel.org>
Date: Tue, 19 May 2026 23:00:30 +0300
Subject: [PATCH] media: i2c: imx274: trivial cleanup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-imx274-v1-1-a7b78ae0db46@kernel.org>
X-B4-Tracking: v=1; b=H4sIAF3BDGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NL3czcCiNzE91UY0tjA0OjxERTU2MloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AGoO5x2oAAAA=
X-Change-ID: 20260519-imx274-e393012aa553
To: Leon Luo <leonl@leopardimaging.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3139; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=OOgUaoniX76m/tAF/sgM+nboqIeV3LgV/ISkp/XCJnc=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLJ4DibXM3HeWhSv9NX6TvDb9Utj8jRVfA5sFFmSGXv26
 aZZoprMHaUsDGJcDLJiiizVJv9qhft3uJ90tVSBmcPKBDKEgYtTACby8xPDPwWDucmv73W82Tz/
 sFvK2UIv5vjCkoSinV2REqrJogxs8owMrWmn3ib3aS9d7OfW18Nzr/PjlYyvdio9199MmXLuw8X
 3rAA=
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62184-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C596158473C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix some typos, removed superfluous comments/code,
some minor code alignment.

Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/i2c/imx274.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 241821572e03..bf38001272d7 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -182,7 +182,7 @@ struct imx274_mode {
 };
 
 /*
- * imx274 test pattern related structure
+ * imx274 test pattern related enum
  */
 enum {
 	TEST_PATTERN_DISABLED = 0,
@@ -533,7 +533,7 @@ static const struct imx274_mode imx274_modes[] = {
 /*
  * struct imx274_ctrls - imx274 ctrl structure
  * @handler: V4L2 ctrl handler structure
- * @exposure: Pointer to expsure ctrl structure
+ * @exposure: Pointer to exposure ctrl structure
  * @gain: Pointer to gain ctrl structure
  * @vflip: Pointer to vflip ctrl structure
  * @test_pattern: Pointer to test pattern ctrl structure
@@ -547,7 +547,7 @@ struct imx274_ctrls {
 };
 
 /*
- * struct stim274 - imx274 device structure
+ * struct stimx274 - imx274 device structure
  * @sd: V4L2 subdevice structure
  * @pad: Media pad structure
  * @client: Pointer to I2C client
@@ -587,9 +587,6 @@ struct stimx274 {
 	    ? rounddown((dim), (step))			\
 	    : rounddown((dim) + (step) / 2, (step))))
 
-/*
- * Function declaration
- */
 static int imx274_set_gain(struct stimx274 *priv, struct v4l2_ctrl *ctrl);
 static int imx274_set_exposure(struct stimx274 *priv, int val);
 static int imx274_set_vflip(struct stimx274 *priv, int val);
@@ -640,9 +637,9 @@ static int imx274_write_table(struct stimx274 *priv, const struct reg_8 table[])
 
 	for (next = table;; next++) {
 		if ((next->addr != range_start + range_count) ||
-		    (next->addr == IMX274_TABLE_END) ||
-		    (next->addr == IMX274_TABLE_WAIT_MS) ||
-		    (range_count == max_range_vals)) {
+		    next->addr == IMX274_TABLE_END ||
+		    next->addr == IMX274_TABLE_WAIT_MS ||
+		    range_count == max_range_vals) {
 			if (range_count == 1)
 				err = regmap_write(regmap,
 						   range_start, range_vals[0]);
@@ -650,8 +647,6 @@ static int imx274_write_table(struct stimx274 *priv, const struct reg_8 table[])
 				err = regmap_bulk_write(regmap, range_start,
 							&range_vals[0],
 							range_count);
-			else
-				err = 0;
 
 			if (err)
 				return err;
@@ -1960,7 +1955,6 @@ static int imx274_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	int ret;
 
-	/* initialize imx274 */
 	imx274 = devm_kzalloc(dev, sizeof(*imx274), GFP_KERNEL);
 	if (!imx274)
 		return -ENOMEM;
@@ -2125,7 +2119,7 @@ static const struct dev_pm_ops imx274_pm_ops = {
 
 static struct i2c_driver imx274_i2c_driver = {
 	.driver = {
-		.name	= DRIVER_NAME,
+		.name = DRIVER_NAME,
 		.pm = &imx274_pm_ops,
 		.of_match_table	= imx274_of_id_table,
 	},

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260519-imx274-e393012aa553

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>


