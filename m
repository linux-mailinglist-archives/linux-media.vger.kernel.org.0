Return-Path: <linux-media+bounces-65396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3lVvM+2DOWqiugcAu9opvQ
	(envelope-from <linux-media+bounces-65396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:50:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4DF6B1DF4
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:50:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mbgYIjmj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65396-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65396-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B9D33043FC5
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 18:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7163B346E59;
	Mon, 22 Jun 2026 18:48:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD79A340416
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:48:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154133; cv=none; b=C1ZM5ouci42MGQQQWunhZn3CdCY1Hkb6bk7AA1rdkFry4cwC2mwnfT/FCNoJW0K991VQ8XM9aWoo9gSg4CQSot7QuinIBmE1suA91BSCdlmlkGxhTdcC03SuanusbALU1X5uhSP+gfL/kszEZQB22GvDru1/Tvert4Tn0M8P2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154133; c=relaxed/simple;
	bh=T8esV+O5VeAEnhYo0CvVH6ObWnqomx3sYy3+gmHq4CU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TawjRrgrk1EC9hyvB3DsGu6ukcjEKswDKjAefULwjl0Q5DjVRSKupNaHRcSs+M9oTzfBsOEhW/7qHLnO009uR122rJGK/F3SuPYjwu8RFAW5o5k9+6Dn2sM1jGf+KBR/N9cICWzcO2dsI1fmg88dA3zasvB6xb1H+ftdc/RAloM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbgYIjmj; arc=none smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37d700363fdso886188a91.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154132; x=1782758932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xCvssNQne72NavhMvuwUrx2Vh4KYhQUGV0pglyxelQ=;
        b=mbgYIjmjMyovi/g2A2mr5lzG1Kpe4mxqO/Ifvn2mN3R9JwbgywZmVdgYvGzcnEwD3+
         Y6aWEMXF18hbYROMO3Zt4WG3K8AZoFWoi/S0Fd9r5JDrRK4pN3hCGRZuNibAh8BTEPO1
         bvHPFvnmtcr3tXv1rFYGZHaxvXhJZNfkKTsFU1x9KTdzkz/bxENEkwKwoEF74hhC0dwQ
         Uwr3B1L1/EUYtJk+F5+FBIteOib0+OKrnNA797BRf7s2yNG1HZAWWcJ7g9SLg0exKG2R
         VZv4PftexaVW812M7ZgyktYAGOXWYrlzd24gFPfvkizDNOPxXkjJ0bBIGn+d2En/aYqJ
         kvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154132; x=1782758932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xCvssNQne72NavhMvuwUrx2Vh4KYhQUGV0pglyxelQ=;
        b=VheU7wm6Bg3/4vYk6vW1dXl+X4HaXel7yLPGF1YLdUhBytFSCoedXRZF9wZ1vF3IDK
         THlTAqjjZ1bKVVQlKL9ljmXb0PbOKRxDv9hmR423sWsgDyPAA7kngAUsjsXnMpfdPixn
         oidUzqM+3CXPcgROjb9qdMVoaYd5zl2WN/K489yT+htkC4obCYCZ0zOF/RWwTNEcBqYj
         P5jb6CNBauJzkbt+BChkfAH7e7/TyzM5/9DuNjQbYlVGXCnd9AdTPf6lx8xIaiiJ/suR
         0Pa1UpqahPTfYBp97AOWd9SQ63LMrtIcdTODtB3gEBte3GAiczUxkCyxWQ6cBat8RjqT
         HuFg==
X-Forwarded-Encrypted: i=1; AHgh+RqL76LwVW67Y9cd7PAH/CzSOxrcKNAIux0TrKZucJR8FCITg2ouXqx3aLZx9C7eOrdQAEcjAToD8hzvhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsfSoDsk7xJGK/GZCdOH1QYWQA0Ag68sBG9IyN6SEnD5OG2KC
	kFgmY7hg6eLGmuCEGkIcu7qvN18KOADY5PfF1uELlYP602ZvtN3C1lW9
X-Gm-Gg: AfdE7cnYv0TYigFDklrDP1KlSJE0eUBJcw7AejKr9GGWbNbzsFn3OIo2K1aYW7TL98a
	zkWJQg0VZePAdPAzNNwbAATeIU+gEvEt8lopdeVZE5f0G9ADHAn+q4bV3eBqJug4aX43aXimWhw
	u45yO3XZ5nx3CVJpkm8Cl0YWrGesAfs1mOs6EaDODiQGB4zmWyaaF3eGbVPNlWTEsATSgGVX/Mc
	fkNdxHlvhOcE741KKBicBP8rOhJeoczC0+ciIUWo+iF5nHztOr7xsgWmDCLn/P+ncd4EDOW6N/j
	n3HD2xEteVMdkr0Yc5MT0IwxKXvxx2nzVSAq6mTHLs1cb9Mzp3b62J90+I9yAW5aw6smgKe1gZ5
	kWTmU6959+N7EYpP34oa7J9WaRsahR5684ofRYnDepGZFnG6nK7j1KTDVtjjhsdZARYFI8/GoXM
	xGiHOp2/0WhP56K+uiHs2+8U489PHXL9Q9gSU0dQ+TyQ==
X-Received: by 2002:a17:90b:380a:b0:36b:7ad1:df70 with SMTP id 98e67ed59e1d1-37d15688cc9mr16655816a91.2.1782154132136;
        Mon, 22 Jun 2026 11:48:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm7780517a91.7.2026.06.22.11.48.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:48:51 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	birenpandya@gmail.com
Subject: [PATCH v2 0/5] media: i2c: Add missing media_entity_cleanup()
Date: Tue, 23 Jun 2026 00:18:41 +0530
Message-ID: <20260622184840.66226-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65396-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:jacopo+renesas@jmondi.org,m:kieran.bingham+renesas@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:niklas.soderlund+renesas@ragnatech.se,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:jacopo@jmondi.org,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A4DF6B1DF4

This series adds missing media_entity_cleanup() calls to the remove
functions of several media I2C drivers that initialize media entity pads
in their probe functions.

Changes in v2:
- Dropped "prevent memory leaks" from commit messages since
  media_entity_cleanup() is currently a no-op. (Jacopo)
- Added missing cleanup to the probe error path in msp3400-driver. (Jacopo)
- Added Reviewed-by tag to max9286 patch.

Biren Pandya (5):
  media: i2c: cx25840-core: Add missing media_entity_cleanup()
  media: i2c: max9286: Add missing media_entity_cleanup()
  media: i2c: msp3400-driver: Add missing media_entity_cleanup()
  media: i2c: mt9v011: Add missing media_entity_cleanup()
  media: i2c: saa7115: Add missing media_entity_cleanup()

 drivers/media/i2c/cx25840/cx25840-core.c | 2 ++
 drivers/media/i2c/max9286.c              | 5 ++++-
 drivers/media/i2c/msp3400-driver.c       | 3 +++
 drivers/media/i2c/mt9v011.c              | 3 +++
 drivers/media/i2c/saa7115.c              | 2 ++
 5 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.50.1 (Apple Git-155)


