Return-Path: <linux-media+bounces-64965-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UCbBLCMGMWoGagUAu9opvQ
	(envelope-from <linux-media+bounces-64965-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:15:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9E68D131
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:15:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Bpyhys+f;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64965-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64965-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02B3C303D130
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB26A368D74;
	Tue, 16 Jun 2026 08:15:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4955F3321A7
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:15:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597725; cv=none; b=eRe5Rbh53sH0sb2z/6CQyHZVKApz45GftNp7jay/RhHGOuPC4sM3Z2Y2rfuK/bU56Pe3s0so4Frp3UsHaOFXGbSTSCqtBb8Ylpn++CtrJOC8+z2UOcDKa8jLVedFBG49A2FvCsST4Voo1nAzrU3HSQhHZWh9SHAehRPbwM6LIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597725; c=relaxed/simple;
	bh=CUr4FO1dHNr/GfiXsjJBitj1Yw390ZvoIwOusvxyrFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rkIknqjsyle/dlDshWZe2pYT/gEYGHKZ+Pngl7NoLzO7S9pCSq5PCO/sOcnyGtUBD796ZVLZYELeahYUAIO1usxE3w+eR2Y4E/MoWULIg4zvR7xTS42zrNmZKPmIDEVkuABV/wfELPggM47JI4OllkkDO1+M4vCR7T+nCS8j2NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bpyhys+f; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c40397e3caso41234135ad.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 01:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781597724; x=1782202524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ccYrAzLIFWHGBRt6i27SxOlw8B/j7lTQGKILTWoiLvg=;
        b=Bpyhys+fYE3vcBs44YCsVWugUKO5aQKXbX5c/37eIuF6CT2Y/h4jK0TLsSM6VbLqU5
         Uj4/hZgmjnCf7biAN7eam8PRdHXWwyL+jQVfo5IfyJMsEMq/Xh/ngmsieSCShIHs+tdN
         sol8zp9ZWTqowmScst+1Zkx/vOh9FPnrg7Gfy2yq0a1rTp5Eq8MWnsH+8gbJp/ij8eXN
         KwA1h1Q9P1aSRCv9g9i08Q7EWXfzdNDHaee+/JjzbuZa+65NP1y2lDZM0S8KWAnPmTE5
         tQIUkkGYxBTum9vrIti5aeW3Lz5yNrdyJ9SmEXpmiO1LJEGV6fHe8/E8Yu7Qoc3f7DvI
         ETJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781597724; x=1782202524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccYrAzLIFWHGBRt6i27SxOlw8B/j7lTQGKILTWoiLvg=;
        b=Z/YXJ2NwnNs/DP7bpYzXmH0Ci1U4p8eKbgQlRdMSOaFs42ZhTjWz2c5KlPUBvmZ4qh
         QtPGD8Re6IpzU9x7L1ayff5LAwLY+7Lj64Cxm0jn5KRkgFwf3lfUvHHKlC0zvhU5On99
         TFwVUdtVYUmnklmaVintVyNQhiWNqjcdvvMAPLdgB/6z8Ys9YGkloIT7QcwZczkP5h1Y
         QlA04GX+Yq3WV/HONkkiiH6Z2Al0Fx+ckmBhgLVz2IQ+AqKA8hY4cq5urf8BOMeyuJe+
         3D8L/4Q2a1cBg1qX66WkLLUSxGpxPGx7HMka1zBoENlfirAVLBrKPYnC2aywzGI/G+8V
         q4dg==
X-Forwarded-Encrypted: i=1; AFNElJ9EAlxepDBT7ESUSlXm9a2jS5fq+EDU5KvMKtoN+TAVHCJ0iv36M8I467glYmtEb2bx0ZCSLHLdnCPbjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAcfGJ4rSDrfeJbe5YVareV5TgWLPXgA3qtck/318BjRPaYv9z
	bLg8eh9c+oswlpREVcyGn7bEJqwjwV9h0n8dhKJCxSMO7IIOPsNrwt4P
X-Gm-Gg: Acq92OGqAR8WBTKWfhrVr+u0MjnyZAao9ueZ7Km76F6eDKydw5W60kmXiAa7btgaeR1
	4bS3xlHt6k6fD4ZR+5O79Bku69oDwxD31f6tfAGmgHHXtcCd6OdKQw1KbhMGJgZ1KBAwBhl8oVz
	Px5hbOquF9DyBFpM4Tn8PmBVI4DnCJfQpw8GdFJ73tZA2Gdrb+gwjB7YRSo424djY6IPL73qFs/
	L6EM4NrCvHdRhdyb74QD54v8sSl1bquEYETn+e5KUo2mIbeparzfVkDHfLLsVuIe9LqGsA2CEE1
	otU81GvB5+RpZtZUNjn24SljdBpOpm5HkfP3Ztm6WT7jzxlMYgIi+7SpfMx6hvg0I9Pu06y9COh
	Z8sqK0fM6k+Y+f+E4wh9Scrjzl48N7XERmaq2amdYDFCAFiu8K+p/R0C8VgpwcoAFhJtyaq1mQA
	rPKuDp+HzVs4PTqrrL3F2KpvsqcLBno5hiAqt5Ex3kjy96aS38CAYi
X-Received: by 2002:a17:902:e78f:b0:2c0:b7e1:7f08 with SMTP id d9443c01a7336-2c41235c53emr186328055ad.28.1781597723658;
        Tue, 16 Jun 2026 01:15:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c75c3sm119650765ad.27.2026.06.16.01.15.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 01:15:23 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 0/3] media: i2c: Automate fwnode lifecycle with __free() scope guards
Date: Tue, 16 Jun 2026 13:45:14 +0530
Message-ID: <20260616081517.44685-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64965-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:mani@kernel.org,m:slongerbeam@gmail.com,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12A9E68D131

This series updates the firmware node parsing logic across three highly
active V4L2 I2C sensor drivers (ov5640, imx290, and imx219) to utilize
the modern __free(fwnode_handle) scoped guard macro introduced in
<linux/cleanup.h>.

By binding the lifecycle of the fwnode_handle directly to the
variable's scope, we eliminate the need for manual fwnode_handle_put()
calls. This permanently removes the risk of subtle early-free or
missing-put memory leaks in error-handling paths and establishes a
cleaner pattern for newly merged drivers to follow.
Biren Pandya (3):
  media: i2c: ov5640: Drop manual fwnode_handle_put() via scope-based
    cleanup
  media: i2c: imx290: Drop manual fwnode_handle_put() via scope-based
    cleanup
  media: i2c: imx219: Drop manual fwnode_handle_put() via scope-based
    cleanup

 drivers/media/i2c/imx219.c | 4 ++--
 drivers/media/i2c/imx290.c | 4 ++--
 drivers/media/i2c/ov5640.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)


base-commit: 424280953322cf66314f3ba5e2d1ef345f21c770
-- 
2.50.1 (Apple Git-155)


