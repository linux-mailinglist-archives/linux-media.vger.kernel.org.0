Return-Path: <linux-media+bounces-59870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJzbA9Pq8GmBbAEAu9opvQ
	(envelope-from <linux-media+bounces-59870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:13:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93728489B72
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC69730EB703
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 16:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD6633D4FA;
	Tue, 28 Apr 2026 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nwe8Cvtj"
X-Original-To: linux-media@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64C633BBCD
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395477; cv=none; b=qZBPyALM4h617Q1n7W8tOEkybPyeYbobuGMax3UKnDNsk0vnG/DJmRJrq1iYV6aYdZDsNHdy639Vk36bscYOfGgGU/6k5DPIZgAV2Ns+Z+xBKAxNJ2vDAN2ukRKwidFFxbPUQruWDaHIlV88FihJ+JxBuDcQCs4qvirMeHgyJfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395477; c=relaxed/simple;
	bh=vsoulUNuQqQHNX9oKC4vtpX947oQ8/AiVwpRZbftkfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tx6kWwRp2GTGZkiEEugxRszKuujFfbD49IVrRyyYYVFu/qltw4nkSYNcjxVuIoiRcI0bl7MozfpNgY1Vt1HJI2KA2K6zvYby7L6wRgt+JJ/IsNunEqsUg69TfRUAOrPd8FYSpeIkrDH1GfCtsDVHkAjAFYBqBSQ1JzjROznCws4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nwe8Cvtj; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777395462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CgLQ9Y1K8hEZbbpfjEz4NsFKN2z5LFsryS6T3jsNdJM=;
	b=nwe8CvtjJ6J7XSt+xYIYVdXiNI0Ux9tcPvtC2gesL8JwoA5t5HWAm3u+Z4C0q+2gSd/FQm
	qsZOG/ZRMChFgu8200jWpveKKOYrXT1E9YaARjPvLNQXA2EdY46gMpadP9u5jhXgENmDJq
	5Z6QSr/U75++0bkyoXdFrnZU1wj5kSY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: isl7998x: inline i2c_check_functionality check
Date: Tue, 28 Apr 2026 18:57:20 +0200
Message-ID: <20260428165719.590376-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=825; i=thorsten.blum@linux.dev; h=from:subject; bh=vsoulUNuQqQHNX9oKC4vtpX947oQ8/AiVwpRZbftkfs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJkfnr1veLDliPW59d4XQxd9ynnBunEO490ds//1fDL0W 7SUJfuQSkcpC4MYF4OsmCLLg1k/ZviW1lRuMonYCTOHlQlkCAMXpwBMxMWTkeGrgmFexrqPhw5M WeGlt+VXldHKyGwjxZzZT6Tldt8v4s5jZFhzwEP5+l3e5+8kP3T/3uBu9KLA6312akwpm8/6T3s Zt/ACAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 93728489B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59870-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:email,linux.dev:dkim,linux.dev:mid]

Inline the i2c_check_functionality() check, since the function returns a
boolean status rather than an error code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/media/i2c/isl7998x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 5ffd53e005ee..96702c5eaa35 100644
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

