Return-Path: <linux-media+bounces-57947-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AJ5GUdczmmgnAYAu9opvQ
	(envelope-from <linux-media+bounces-57947-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:08:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 06022388D58
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58EF63004F0D
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704E23CF04F;
	Thu,  2 Apr 2026 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmybc2ti"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F5A39D6E8
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131713; cv=none; b=Z+QFIEHTuKmAMiVx0nJJ9TjGsBHUO4QPOo5oPap/G7dkGEp9yBCF/qZEs2LDQjqk7JSfqS+K3ijxos6Ef1df5fVhS5+mfbljFOJkgyHb9aKw4zs84UyYXAH3yXWVH5K/uTh3/IjwjMHcAm3bbLH1ttBO+kfi2DCXkOKTvUS3rhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131713; c=relaxed/simple;
	bh=SlH+gm31r/k+1kaj9oO1Ub1WtfcNs3nK9sCq4h9tq/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9mQ6/MBz1I6MLhEx25Msb79GM5fqxYZjfE/vrWy5EU+NBabj5+kfiiZEkcMw8cLGXS3VYN+rwfaNWQ7otY/3LXUGhxDkQ40SNRmOQbKNGSTYuoI4daT1knWAKEoCQkDvIEqoQzCAKYsEvCyH5lnqQYshR/FY4wTr+1M3B9hSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmybc2ti; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66db0cf6a4aso1501410a12.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775131711; x=1775736511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMlG/qitsM5fyos+MK5I7B9yHHX0Siz+mL00S24SaCs=;
        b=gmybc2tiHHF0bVd1wfDl5f6wIWOVZPrcJIxZUi97x6pOr8fQIjTrxnItv+27ymv/zW
         84xGSJ9PDd1Ylfa8ryh/AHukeQQ0aKgOBgNoiCy7m1Vc9gBQHDP5br7YsLHfuQYDbQDT
         jQKSbG4AUufDHHOZxMhNXvwDC5BFJlu7b/NiYY4cvCE+gFFvMzdLaJfeV/Vj4PixNr2E
         HxURrLDxuR7Xquawo36cs0TBML4F3W1lZGq7pgeYnTaNljst2yihp2pyympAQ3XnQwTJ
         hg7SK2084CvWhIlaPgbHrmABxKYqlPCzZBXcWV0d0AEYSNZPgrENKVuIBNuuJIY0UfmL
         t30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131711; x=1775736511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMlG/qitsM5fyos+MK5I7B9yHHX0Siz+mL00S24SaCs=;
        b=Jg3Rjlj9nXswWP9ebdj1pUWJX4NbjWfIOaCb4ugRQIHHzW6z7i+iufQ/1CC8BI0cKa
         2CvpD9jVhvw2Taj8mrMGcHKtKSM8gAYFco50qGBCWrQ7B9cbAh4LI6Ycv75rP+KZohNQ
         e/XMQY+3UvDeeprx5Zh3KKnYq8Rc8SRObT/tIIkHj02LlB92CQcolXMPUbEf0hscMqh4
         +bzo8HST+P5cAQhyUma89sKseiOAQm6mUgVWEDz3CFZOypJftJcAiM2W84S1n+Yul6i5
         jy0cOi5QIQgI22oHvt8BujqnblpmeS0WZ8q8f2HbjBIjG17d9DnMS9jDKWpJqCLipKCj
         22pA==
X-Forwarded-Encrypted: i=1; AJvYcCXod6oYlJXk5T0iVWZ3BJ4zxOMIl+JsC6cCGJffqvF+2Z0gOco6ZNImhmBXKbNUVYS7z3cRwQBEe+3eQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKOv/vRDPaCpHq9OHtwK105J18rlZfh/lV19YyXuiv6E2HZiC
	G6qob4gCQ6d8FEp05hzFP3cBbYKisDP1cD3FU8aTCtgUdiNAScwmO4Sc
X-Gm-Gg: ATEYQzxipqHsiB5Er5KauBQgLpivF7GRm0OySl0KP9L6aZHyEmsNrIwzKzFItXFl65F
	RjKlSRxyyJb+20lnJssJ9f2oBik1jHHTJCHYG9BZ7kXl1ohdHxXgLkByx1lhMMWq6FoWVxdQpcF
	3jk6gEo0Wk+2SokyLYytlw0s3npoFm9ustg8ZvBoB7/FdshZdOI0p2KIO2pbei+cX5XCU5RAFHM
	RsbBAYrIsv0+BdPsOjjjGJGt4KFDXX6UXGg2VWG0y8TGRKDOa8vp9d8ayX7u1sZHdW30Fs5Ov87
	hsqWPeK+31IrotLXSh1DOI/S9bk3rYLHqEtn2pnIiUwCw4BKjm8oqy3LKStgBN5cCk7uxcmmWSP
	2m3w6E0zxtf/UZNFnG8yYOnwTlPy10x/05nw3HA1SxwUAjvyNE7hDJTT7o8MjGHq6Xcz+TFFReI
	+J5pG5uvT5uAodrnwj6hzrdw9CrXD997tvfd9c2N2m/SLJwzl9piW1OyUwnQ+gg7Ywxcx2WBvgf
	5rEuR1l/4KdJ4QM4bRutCt9eeODKUOPBCqzrIJI7k1qgBDYVMX5kSsV2qlFrlBbyhCe9xd8hDWl
	jUMY7TQPLD9UmnvRLYoolj3DTM9YBy6tZPGSBoIbCJc6HBJVMp38ERqRwe+1zXMi5gF/sZLntzv
	ejUWuZ6AC6++fXR3+
X-Received: by 2002:a05:6402:2111:b0:66d:d119:11bb with SMTP id 4fb4d7f45d1cf-66dd11913b5mr4322079a12.9.1775131710389;
        Thu, 02 Apr 2026 05:08:30 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (253.119.12.34.bc.googleusercontent.com. [34.12.119.253])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e06479211sm573615a12.0.2026.04.02.05.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:08:30 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	grondon@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2] staging: atomisp: fix alignment in function signature
Date: Thu,  2 Apr 2026 12:08:06 +0000
Message-ID: <20260402120807.1266-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57947-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 06022388D58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix alignment checks in function signatures

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f2..c51d04af6c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
 }
 
 static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
-	enum atomisp_input_stream_id stream_id,
-	enum ia_css_pipe_id css_pipe_id)
+					 enum atomisp_input_stream_id stream_id,
+					 enum ia_css_pipe_id css_pipe_id)
 {
 	struct atomisp_metadata_buf *metadata_buf;
 	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
-- 
2.47.3


