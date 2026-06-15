Return-Path: <linux-media+bounces-64933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jwlYIBZ+MGopTwUAu9opvQ
	(envelope-from <linux-media+bounces-64933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:35:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC90B68A646
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 00:35:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hNyrGn2n;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64933-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64933-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85AC5309C935
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 22:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556B43BB116;
	Mon, 15 Jun 2026 22:31:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767F3B9930
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 22:31:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562664; cv=none; b=qxemGWofayne4frpyQQVaYqBagJPV5+e7Nmty0kK15JUe4I2gO8d48mMfRquBvn1oBnx7KovSKvUkuaQrEdcGa7k5Jp9yM447i1yE1fusr+DkmjX3ivIsl5PxDIJZAawJ8Os4IFoF4ckFKc52vFzqDlOuNGgQ4uQaG1emvvUyUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562664; c=relaxed/simple;
	bh=eYr80klDuV8WLJlKkt2otNOz52T6tToTTizT0zpHABA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E0Q67fy3PFC4hd+dckhuh8sR7kBoFDKRP3Rutn/oNfrcxO/Cqu91Ug4u8BgCT1oy6ubsSEgQOAipVrSeQCnDY9mY+wkv5h+YohsMG/auqrYqSsbHX5VaqG+E6exCqrmKBHNn6Qhy4FFyRLRHXrZFT5hBO3WhW3VNmB4d4iAkqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNyrGn2n; arc=none smtp.client-ip=209.85.215.172
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c855599a77aso1892527a12.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 15:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781562663; x=1782167463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrHlJSSHn+O20kbLBa1bhtFD2Y96MxgsLzX6joVKUcI=;
        b=hNyrGn2nS6u+hTX8LACXjiUxyoSOqF4wj/IPyz4TLVW0AFxp0wwYvCsXqehScws8+E
         xyA4TGuqr2n6tsL7IyNkcZqBUfgwoM7rdToE+WW4N/D4R+Desr7x5BOclWoQxbKyB1Sx
         JqYyPdHKsvGVP30vfjVJ2tW/Jx3jItkHh7XJ0RknS8TbPoyhUjuLZKeuxGWrGaYGeQCN
         DMnHN2atFUcayp0fhiJmUvH4+uJ45V38kWKWDS+fzLUTBBcx5/tsBxOAo8VAVs195nEA
         H2e3fy1PctGc0iJAfudcu056h7z9uhV8OUonuLp2x69NZHDwG7bxiZ06Sn7xWFKJVfRx
         vWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562663; x=1782167463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrHlJSSHn+O20kbLBa1bhtFD2Y96MxgsLzX6joVKUcI=;
        b=m8BiSkfzYp8ETLm9QvQx0N0pSirUSWVB3O9QrTBiuu4DeWIUDSZTS+AC/xMR7ivuV+
         u3UUXUaaCQnpOW88/J6JImltb04p1+5MJiULCUhhlRDEYZtHn3Sw3BZU8cHxfBFA2YRw
         OpaApPxLZzZ78IbihUL8n8g6lXj7q7fKcgOGiiIYTxbf1ZS3/fK2FV0WkNsB6lVLMED1
         L6tByMmtU0GDgrX7tW4UCqVT9A4p3PFJoh7i3bRpqfmU0KW9S/9NjdZ6Wk2rSVLaXr64
         gDzNhZFW89z7X6yOtX6cKU4IBfcp57Cqg5dOMkrw8NJU3y8YHLvkVo+ESN7qKETsxPeG
         lQEA==
X-Gm-Message-State: AOJu0YxWxbtdwSocGwsFcpdtF0VxuHswPsushIXcJpsVg8zF0fYpCd61
	u6wOfOHJbDbYatnnbiMfZpm4zLRBhcB0wnmIhtW7wariDP3NWowr0RcJS5M5TOP4
X-Gm-Gg: Acq92OHnulpja70ww6HVhBd26F0uIVspZF2x+sxHH0I5i/hox2Zf7NeXo/xxJ9pEFtd
	+PsWXXRuKqq/aTrb2AhIGccxtMIaSYlI81Z/dtbfQrAHrYbhin5XJrJKcxUbDOzuCk+wjCsUudC
	goIE4VFBBGzmZ6KLryJoBMkkZul5YsfQZFgTvlF/at/fdazQQG0Qh0hyi06+8c3Xdg070f+CbZG
	wFcBkgHY+TKH5KutkmX1xNXgfVNYIGfnoYcHST+Knpd3RxNARafu8qkvD8j0WG9VbTgQAy5aI1T
	BAoF7g47ScyKsZC5NwFerAzOVVuUX//Uzbu7KDe4CHiqRlv3pAyrCKGzyy/A7g9ZsmiZJ8wpD+/
	Q1w/v9h3w4XiIyCLrmuMkO9jJFNfd9RpzwqF2FHAohfpRRKhsc9OBFbE5UTn96wBVA/M7bkk2eD
	ER73dlxGrH/yQ6/HcY72+GNc7IxZKV7US4/wO5JrS2ZdD9FAyygpYLvDK4i6OH/ns=
X-Received: by 2002:a05:6a20:9145:b0:398:b178:a53f with SMTP id adf61e73a8af0-3b7e4deb659mr1016716637.40.1781562662582;
        Mon, 15 Jun 2026 15:31:02 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm9638592a12.26.2026.06.15.15.30.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 15:31:02 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 0/3] media: i2c: Adopt scope-based fwnode_handle_put
Date: Tue, 16 Jun 2026 04:00:52 +0530
Message-ID: <20260615223055.39953-1-birenpandya@gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,linux.intel.com,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64933-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:mani@kernel.org,m:slongerbeam@gmail.com,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC90B68A646

This series updates the firmware node parsing logic across three highly active
V4L2 I2C sensor drivers (ov5640, imx290, and imx219) to utilize the modern
__free(fwnode_handle) scoped guard macro introduced in <linux/cleanup.h>.

By binding the lifecycle of the fwnode_handle directly to the variable's scope,
we eliminate the need for manual fwnode_handle_put() calls. This permanently
removes the risk of subtle early-free or missing-put memory leaks in
error-handling paths and establishes a cleaner pattern for newly merged
drivers to follow.

Biren Pandya (3):
  media: i2c: ov5640: Drop manual fwnode_handle_put() via scope-based
    cleanup
  media: i2c: imx290: Drop manual fwnode_handle_put() via scope-based
    cleanup
  media: i2c: imx219: Drop manual fwnode_handle_put() via scope-based
    cleanup

 drivers/media/i2c/imx219.c | 6 +++---
 drivers/media/i2c/imx290.c | 6 +++---
 drivers/media/i2c/ov5640.c | 7 +++----
 3 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.50.1 (Apple Git-155)


