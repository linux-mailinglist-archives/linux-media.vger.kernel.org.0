Return-Path: <linux-media+bounces-65255-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i5pDI+/7NGrMlgYAu9opvQ
	(envelope-from <linux-media+bounces-65255-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:21:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D06A492A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:21:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LpfhouKF;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65255-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65255-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E5C73028EAF
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 08:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5E035DA49;
	Fri, 19 Jun 2026 08:21:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66EF82866
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 08:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857259; cv=none; b=qu7g73GuqokjbOGxCLPThs4ByWBtnCD+Lo5a5fg3YKU/XzqWMHPRwmP2SkFgSsZidbIBvWukbiUVErbBaxH9sEKx2IE7dDUJZNZbcV6QiHWqrdlDn+p0zrXWFwhwEKGDipF4gRPSouRVLfteOqWi2qadznCMi2y/BqlBHsXpfs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857259; c=relaxed/simple;
	bh=ydiGOwSM6sCyeXvuigf+1Z/T6D1jYkwqpJFns/NdVUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aMwabGPa5uTx4CQkPrpCPaJlDNKBuXgZHoOiV9wIuEH45o4YpwuwLdIYM3XcW8hCj38rFJlCjKfmwnHniO5SMKuuZMFa12Sbtzdxtu99UT+m7O3OxTM53iP5cKc95Lw0GQKCMk3H5Hj0XhzLP0bDbnX1qKTkD237wH7sD2gx5dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpfhouKF; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c6be9cd7afso8490575ad.1
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857258; x=1782462058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RNS6wJpP7LX6d8zPRDeMYS3lftvPnTrBkw5G+97IGIA=;
        b=LpfhouKFnmciwMh33nCinguK6xsfgDpCmJzgHbY1m/xtuhqJcOB2xCeGDUQH0l6Rx+
         uYgwW2h0SMKoJeFcTPMMv5pUwTYWGhzP2c/I4W4+JOsx8gMyP7xyE2VKQPmWMVvwfyqI
         owVmXz/4qQF1LCvtxfKOoaaGPBkGORRH99ImZm53dE6u8xe0dX1Z/Q1/ayjd9XhY5hDR
         7jZwQSf+iwFacYzZeP8kbQP2LaYCayr3llmTK8scXC7VM1ly/d9wuBPn+Abh3mSLuluy
         OLQ8+HAI2MD9EbaYv+rhK8RqbE2K6rzhtuuVCi12abOlL29otX6tXw31bj7wTJ2xzWht
         yr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857258; x=1782462058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNS6wJpP7LX6d8zPRDeMYS3lftvPnTrBkw5G+97IGIA=;
        b=Dr8UlqRjwGUMZ9VaUUDfOxdK6XZX8rwN6MVywQ47zszC9oLd4nWUGae02iRcJMuDZC
         N38rgMsl3Zde6i2uwOLmXHbLlV7iQxRxCp8pUrpqNt2fGKFdUrXpr5G7u9uThuFemMKt
         W1JoMaZLvILB/nFpq7og/ShLZ2P0lvpe4htvs/T5LHGZAnR/tHXsx7emoD69Mi3Y90un
         TWPHnbYfVj7C58K6qa0wKpogIGqlu5hUqSbeHHAlF9nTdpqn/SvTRtKQQlwXxUU3NkCM
         mmamNAIZm1itfTiItZLBw3w9i84fZavkIpHh0/oxDW1FbJMdY/XroZ6ZSUI/TmBjzZ6c
         5dOw==
X-Gm-Message-State: AOJu0YwAHtlezJP2HJ8X9U6yyaib+9v4GidmeSWsn1nRPmNYIa5z3Wdg
	SWuS4MAsdQ0hg7j/Ageg9bOtPljquTDMZCfNxwDZKG+dBmqXJbL2qzBCgmf4X+Vy
X-Gm-Gg: AfdE7clt6M1cShaTyzHzHQ+zTzCDAh4Kf6YHTwOoZGh8z88fzz2+cFgw4rk1Q0ZL4KM
	5fRM2MfrYOY8dtT5sTzvGfX2J0qyPlUMk80v1cbhfGEw7S88YUF6JCB8MBDdExBScP4oGDNueEn
	VE+pFiDWSQNUw/R2vaNxCqq47jhJI2+rpeU8Di/j4qPd44GAfmrg4+z2y9G3wBT8xkz0c0VOpi9
	rqYMXE/83G/wegkqijHe802mlCKHhXIT0D5QwHu+R/1atGCeGbT4G7ZkwuoO1O1BCLn+nBgP5Cc
	XCWoPR0fC1jF/9KJBUlV1owoJGiK8YQ3KhvI3+xNYRK1x+zLuXXcTZbHhKPge/EDnyl51h4ZW2V
	rFfpk8ikjLUCiDOQYiN3NFu++dJqgwwEsgKl/6H0fJ0bjjRokLPAb4Ja/3OeMyAETXvTJKrWktV
	I9Oi/xHTeRcwQc9ToXf/MCiH2jL01/9+cUHN+GWT3MHw==
X-Received: by 2002:a05:6a21:6e88:b0:3b4:7c33:296c with SMTP id adf61e73a8af0-3bb35648fb6mr3237106637.45.1781857258021;
        Fri, 19 Jun 2026 01:20:58 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a88dc66c2sm1791968a12.24.2026.06.19.01.20.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 01:20:57 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3] media: i2c: mt9p031: Fix Use-After-Free in mt9p031_parse_properties()
Date: Fri, 19 Jun 2026 13:49:27 +0530
Message-ID: <20260619081926.18855-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65255-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F16D06A492A

The mt9p031_parse_properties() function calls fwnode_handle_put(np) to
release the fwnode handle. However, immediately after this call, np is
used in fwnode_property_read_u32(), leading to a Use-After-Free bug.

Use the __free(fwnode_handle) attribute for the np pointer to automate
cleanup. This allows us to remove the manual fwnode_handle_put(np) call,
ensuring the handle is only dropped when the function returns, thus
preventing the Use-After-Free.

Fixes: 8d4da37c3006 ("[media] media: i2c: mt9p031: add OF support")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v3:
- Fixed the incorrect commit hash in the Fixes tag that caused checkpatch to fail.

Changes in v2:
- Utilized __free(fwnode_handle) to automate cleanup and safely fix the UAF
  as suggested by reviewers.
---
 drivers/media/i2c/mt9p031.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index ea5d43d925ffa..3b3714b0ef8f3 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1067,15 +1067,14 @@ static int mt9p031_parse_properties(struct mt9p031 *mt9p031, struct device *dev)
 	struct v4l2_fwnode_endpoint endpoint = {
 		.bus_type = V4L2_MBUS_PARALLEL
 	};
-	struct fwnode_handle *np;
+	struct fwnode_handle *np __free(fwnode_handle) =
+		fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	int ret;
 
-	np = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!np)
 		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
 	ret = v4l2_fwnode_endpoint_parse(np, &endpoint);
-	fwnode_handle_put(np);
 	if (ret)
 		return dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
 
-- 
2.50.1 (Apple Git-155)

