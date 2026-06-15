Return-Path: <linux-media+bounces-64929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZIxOB9toMGo5SwUAu9opvQ
	(envelope-from <linux-media+bounces-64929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:04:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D93868A18D
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 23:04:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gHB2fvfy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64929-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64929-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E8E930B1466
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 21:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F193812CD;
	Mon, 15 Jun 2026 21:04:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9CA3587DE
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 21:04:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557460; cv=none; b=dBjZFeFeQapXr/zUiT2nXBt7PPA5Z9IKOq3xackf3ue8HxEEuPdGGZ8uyBzhIFgnlFf3bQPUgcld3Xblh5OifDU+MbF20Zhe5QEF2Ntcfl11FVNLSvqhZ3GnI40Giu7uIWW5cIPRpJc/HeN04Zp6R+Y8oVdwQuUlkGqGikwwnOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557460; c=relaxed/simple;
	bh=fjmfBlnBRCYZ9jQ3PftKASRjAfY6HSeJwMOTBzZqH6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERSvznxsJ3Gk+FekvE+Xh+jPwkRqt4cMllayYopFLCAnlNhkzbGYrpqO3Tt1C4VSKVi+0xgMjCy36vBXKuX3tWo4xs4AMNQxwp3RIjj5X1wuWRfZCmRUfSQ1PDAeB74CIpsmgi/Q61G8naQWy1AzhAo8miJs6gP7n1gMCuptEGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHB2fvfy; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so24305435ad.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 14:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781557459; x=1782162259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltUhvVx0OkuN1T709UlJ0eFS62iwxupNlYeVNxm4JMI=;
        b=gHB2fvfyVFLpAZY4NbnyOZEnL7nYRXeUxSP+Sjop9HLVzcVE8udmcryqds29kbaLHL
         IWXesefICnvbigj9gcDETL5+efZTBSxVk0FbFBRmNrJSx1DOHtazMfgFl0QCIZDx+T5T
         Y9sbD5bg22ro9gERvn1eV0cts7fHit9m1QxW7vOnlf9JUerAITd8k/+5kp92/JVRcEVl
         JKmwmpM5Lky2AG23McdUfrqrZIJUxD55ekDH41NaD+TD8DrhzT7Fe8Trl8oJuepHsHcY
         a1LqUBeeCCuJv2x3jb+70OLHS6trcoa52HNzD7VA7aFML7KezqvQLJXWpWFIBr95fC6A
         /w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781557459; x=1782162259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltUhvVx0OkuN1T709UlJ0eFS62iwxupNlYeVNxm4JMI=;
        b=m5l8G0tCrYt8hV/G43megreiVWXgewWZdmYwPpEG0CUt4KJic4JDvCu7IxQgN1zQOM
         kQ1VxoM1Au9PJsPmIrOAPQmXd3uwxHrOYnskdnMeUwigQVZh9qAF/Xy4nZKAxjttDrE3
         O/OQAPFkVDSTbmvOiWfHPpIEBq0/YGhk39ij+r8fw5Hi85XZVO8tkEhOWjndla2Gzvqx
         AhWXE7ucavMd2dtEcmyHE4wYeEI7EwXUDfp1M32JqOCsCVOecdhOfChzbePhWgAYqC/r
         e1gGJWBHLuX5xIgbKeEzbMf29E+CQN+/B/6KW0vS906lawQufXQb8+ITZR9EpKIrZAgV
         12pw==
X-Forwarded-Encrypted: i=1; AFNElJ/4UNEpRfUXGHpYxt9KTl3seWz/X36gu/R00QHGknfBus27JwyPNhMRW0TFVesNHIanYb9kZxucW9U/Og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6GdvAvAQNZd9xMZ+E8dxYqVTL0+YnCwS6umr6WRRSxc7oudCP
	PtwxHA0FBrm5U01gH0f0dY2Fq33lGHHukXoyo+LpkkZYGrFK1WC24pE+pxRW5FS4
X-Gm-Gg: Acq92OGN8LTd04GL4MFhuyfMlIuTwEMe3tUn0AppMfx8ExJg9+GHn2qJvkA//ejFAxq
	qnSALfZoAQ5OHj/nGsfrTdbZjTkIeXOEtMb3DBtrcOYBl3J9Vxj+rawVu6c0H5E5kXDVABm1YPB
	2vFcSwlOZRmKxAmY0RaaI5r0yeT7QkQFwymbYCz5zQajl74hjCePJdPIwvLh8JIwOgiRe752hLV
	9vRzVG3jTnP88nya6kKAspqbkXsxcwX97NISTq/rq1vab23fkGeu4WG3wF+zl1h7t7P76/MTr6a
	E93GTqx/ehsKv6kufFaCxLoCczSvG24x3/IdpAwR8XMKCcjtnXAH9aa2rk0egQvG1W3GhYmg9QD
	SUKj1LTuKf/mY2MWX13WTXRRJ6jpESH4VokHykbXh0tIBx3dpoFFHoGrVn21rGZZ8/Qmf0yI0oV
	Qw+JhawsUVQQ3HWj9hteWQ28W21+0InuAeG89M8HthzPbGgo0GBgzq
X-Received: by 2002:a17:902:f70b:b0:2be:e3bc:e8e4 with SMTP id d9443c01a7336-2c69a186b29mr8099215ad.18.1781557458958;
        Mon, 15 Jun 2026 14:04:18 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433747ef4sm110934085ad.82.2026.06.15.14.04.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 14:04:18 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 0/2] media: i2c: ov7740: Fix remove() teardown and PM runtime
Date: Tue, 16 Jun 2026 02:34:10 +0530
Message-ID: <20260615210412.34567-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64929-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D93868A18D

This series addresses two severe issues in the teardown path of the
ov7740 image sensor driver.

The first patch addresses a kernel panic caused by a use-after-destroy
on the driver's mutex, exacerbated by a double-free of both the mutex
and the V4L2 control handler.

The second patch modernizes the runtime PM sleep sequence by properly
checking the return value of PM wake operations before issuing I2C
power down sequences, preventing unbalanced PM tracking or hangs on
disconnected devices.

Biren Pandya (2):
  media: i2c: ov7740: Fix use-after-destroy in remove()
  media: i2c: ov7740: Fix unchecked pm_runtime_get_sync() in remove()

 drivers/media/i2c/ov7740.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.50.1 (Apple Git-155)


