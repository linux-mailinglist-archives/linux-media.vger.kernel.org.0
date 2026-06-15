Return-Path: <linux-media+bounces-64927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7TlgMxpGMGq7QgUAu9opvQ
	(envelope-from <linux-media+bounces-64927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 20:36:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCB689351
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 20:36:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gGvHpBiV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64927-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64927-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4BDC3112177
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 18:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7C837B02A;
	Mon, 15 Jun 2026 18:33:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFAF37702A
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 18:33:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781548388; cv=none; b=L6qxcfLstZGqkqSvxWwjli2OEG4+kEVRzhq5Brfv+AwiiYD/RIQ/Mtnbd9jNPQ/YJCtlS4QqBIHSF48RVZTI47k51WgcsRPXKb40x7jWE3jQNcmESUUNa+G8jgbVD8Nz08keM0p2jiP6dKLeAv4BoqFaz89fPu8wIMoEVqD4xO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781548388; c=relaxed/simple;
	bh=n9xhRUgAUeZ+8eW8uQLZBVYIUn2hehpzDqQxJwh65w4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6z0vwfYNSqNEAXR/thz7uLadMUEJVTJjFQsRvRdvXOPS/i+Oun+Yck8SEywWJSFIqIQ922whHb6jbl3OlKC7v+GmEU3HqQhtd/8rYRCJS59qC1GZfdlwORzZlOP/0qQ+RJIw6+rvlfEHtXPd+9PCOGvCozAnu7cmT48h3XAiKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGvHpBiV; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso1866355a91.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 11:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781548386; x=1782153186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5wCh5w7SDSfUuaxlxMeenk1SsH9D4AHvWEoO245y1zg=;
        b=gGvHpBiVySK1ROAt2kyE9rcriE7mEy75d38l+bcdNVPtoeDSdbDdXqS8HvLeeLcd0A
         EFei0xCaQqa9m/OvuP0vBJ4TBqcI9vyHISFQ2xvo7vDUQSkVwc+sXKIflqnqy3dy2RuR
         NIlj+mEtO3wphJ+9sqB+Ji8DM0QL+5oNzMoN+qac5YRUzrasM+ZSTMBDn1UdsXCSdcC9
         lk0mIRuyEWRORanjcwbLlWk7y9gNnhsTJccSafWTtk7qeAUKH32ph0WP977MQx01P1UT
         gJCuV2IPP3UlL2aBMKA/+qmWOjDZxb+EVB60xp/0NNdVnhileFw1HHyE3NY5K+THtUFB
         1UNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781548386; x=1782153186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wCh5w7SDSfUuaxlxMeenk1SsH9D4AHvWEoO245y1zg=;
        b=sxIyTxW9YBg3guIsl1prQKXmPxx3fvxX0K8KdBlnPb36hYdwc72Crh5sIbdXZCWDP5
         TyQVbXYbYn10P10RVuN5XVZ9b952RsqP4QkHXOeLvQDm7b/6yVH7prpbVZtYJJw1+qt9
         T5MpOYaUfLEDZkbXYs94NUgm1REX9WwyYtL35qMwFoh8X8mY/aKQ8P2f8Y/L3JYNBkh6
         1uVfs+XffyU8kHjol1BDDTq8QfuUhILpsfIRJwX0CWZFgFsn7mfY+MvPk6peT1kvIM0T
         j2SUxz4agcp7kjnnnd3fPmj15os1vBt0zBSeyR9RwZ3q3Dv4TLU3VslgCAWeeBJMJNaL
         vm5A==
X-Gm-Message-State: AOJu0YwkMA98JWNikgSt+vJwywT5rK7rvLCoqHvTz08YXUpG397GrGJ4
	ANvjslC1QVESD3FoRN2gCK0ANoPSiRZta5gf1X5u5TE/vkLiTWaNAsaR3TA2rgFI
X-Gm-Gg: Acq92OFkcz4zuzuRbGmHZUZwzEQdsC9IkkElR3nJmiKe8o0v9KpFmWMwKmbtMhHlmDQ
	r1Q8gJCn09l97hFKBjZ5i6m4/7WST7Ewnn9DtJIZMddLfKHOASNmcxhH3ODuKYIx5jijObZ3hEU
	sgVkGWacO9CQFzv0epGGhUlk/TYi1Dt1rBz3fxnhHYNUI6sz2SQy67poihTJDL0o0lWIZp8F4Kx
	B4uEeZb5mbMjyO/o1YK1uc4smEen8FA/CXY1kxF+QUutoer+rbL8yIrMh5bASX5cIVQj3foZyUw
	iEkgtJNfMcTNZA3UuBW3l+AH5AaBeMW9AP4/aKavznkzTSMfzhST/aEENCHqnG8hiX9B7CavQMK
	uUdAc2NHrklgAwmwEjJa7yk/6Z6qsl0aXoWjfMFlafjb2Z/VhauV8CdPVYDgYlS5q/2+jOtU3Y1
	OWX9ddwBU2jVDI38Cytvx24gZgEIOKVlJ98/5BK3NJ84mEl+17I6vv
X-Received: by 2002:a17:90b:58c4:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-37a040adfbbmr15571720a91.18.1781548386307;
        Mon, 15 Jun 2026 11:33:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ef803sm316802a91.11.2026.06.15.11.33.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 11:33:05 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2] media: i2c: mt9p031: fix endpoint parsing use-after-free
Date: Tue, 16 Jun 2026 00:03:00 +0530
Message-ID: <20260615183300.26615-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,ideasonboard.com,kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64927-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29FCB689351

The mt9p031_parse_properties() function calls fwnode_handle_put(np) to
release the fwnode handle. However, immediately after this call, np is
used in fwnode_property_read_u32(), leading to a Use-After-Free bug.

Use the __free(fwnode_handle) attribute for the np pointer to automate
cleanup. This allows us to remove the manual fwnode_handle_put(np) call,
ensuring the handle is only dropped when the function returns, thus
preventing the Use-After-Free.

Fixes: e9148d88b488 ("media: mt9p031: Add OF support")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
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


