Return-Path: <linux-media+bounces-63449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id khucF9VbH2oilAAAu9opvQ
	(envelope-from <linux-media+bounces-63449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:40:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB8E6327F9
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:40:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=W8k35kwy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63449-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63449-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 465F3301BA73
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 22:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8864E2ED860;
	Tue,  2 Jun 2026 22:35:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059C39936D
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 22:35:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439709; cv=none; b=lmvPR905Kqm6L/DM1kOyjKlwDKPHmTINA3Yfg40FkLyUB/fwrlNHQ/xb7fenZMOpMKk0ilzQWVW+hMH6/Dsh8FetfDD2OEMhmYquHPfP2kwc7AoOnmYEx+44Rn5rWrrwbR0kj18Whj5gTvWrArjBZ3HfMuYraJcQcOmLwAPE2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439709; c=relaxed/simple;
	bh=ymtXsJ3XBwX8VsD4dkmcTHJ9luGsKlGWzHGma50Ig94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JfMNP6PPcMAPYarorlkgE1Sz79jI74611ZU6nhVhJTetwtUwA7zgTPkJCt5MCY6Kx26VsffpvYo/yDzW9qZntSiYgSvmObKqRAYYR83qL7Y5or/Er/FRLJDCCuCxeVihV8qAzsvJOu2xsAtFMUWDvH9knbOE8AUQ1lrPpyxvsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W8k35kwy; arc=none smtp.client-ip=91.218.175.181
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780439695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZxHtGUK7BeQdI2Ot+q2RAaa+eQBvtlH57aM0BhhPgFo=;
	b=W8k35kwycNd+Iub3MF/6Dnx8KXW+/GG525invA/5VEmi1i6jg8fPjneKoM1lOw8CKfEP3I
	BnewOU8dRBAFLCPdCGiMYxw4JAGXRi55S1sD2qnAWIEqFHpjIacqfCVBbcPEmpzT9PNKJ6
	Fbwx8bkaptjRVpnTLpka4Vz3GawGQD0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: i2c: isl7998x: inline i2c_check_functionality check
Date: Wed,  3 Jun 2026 00:34:43 +0200
Message-ID: <20260602223441.1087427-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=thorsten.blum@linux.dev; h=from:subject; bh=ymtXsJ3XBwX8VsD4dkmcTHJ9luGsKlGWzHGma50Ig94=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnyUY2HJV6IbdX1+scbf/pP8RrRi8wlO1iPxuy6NqGwZ Sard5dfRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExEKYmRYc3O7bZXt2TPfhv8 JaVhbWT3i/nB/9+xJWhfi1kzOfic7iSGP/yh9akRX99Fim+V0j5zentn1XWPezuSnx5Imp694TT TRT4A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63449-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:m.tretter@pengutronix.de,m:kernel@pengutronix.de,m:mchehab@kernel.org,m:thorsten.blum@linux.dev,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAB8E6327F9

Inline the i2c_check_functionality() check, since the function returns a
boolean status rather than an error code.

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/media/i2c/isl7998x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index a77538d2343c..8244d4296a02 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1460,8 +1460,7 @@ static int isl7998x_probe(struct i2c_client *client)
 	int nr_inputs;
 	int ret;
 
-	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
-	if (!ret) {
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
 		dev_warn(&adapter->dev,
 			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
 		return -EIO;

