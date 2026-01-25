Return-Path: <linux-media+bounces-51511-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN2ZAU1Qdmk4PQEAu9opvQ
	(envelope-from <linux-media+bounces-51511-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 18:18:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D62D81917
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 18:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9550530078D5
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 17:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F8723D7DC;
	Sun, 25 Jan 2026 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcSUwuSl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579061EB19B
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361476; cv=none; b=ePAs/A6Kl8oE1JWk2eHZuPgw7S/dnhIJ9YCxOYS06tzTUVepqYHBfu32bv+S9jUp/pDl5aK1rQo5hrl6T+pxf/7xa8oFoO5DiUnDdNDxjlY4M9L50FyZSK5PHuINJ/XV0kz54LeKCCm0Mho1Hx4wPLtB+LdxVMcnQ5cPVWqfQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361476; c=relaxed/simple;
	bh=BeEi0RWjbY+H0Ngudm5srUEImIyA5xH0zZkzhqFyapM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9NDmXma8/pD5xSCbEckhtC7Y509xwYUbYNwiaZGa5SBYySbM1ytWYvqwagoT+oCOmxTdFveTRweYz9pg68gN2dC2gxXD+SzelDHx6cbUxthq6CHbAW/a/lmFLwYJXB/QvkPEbHs6yyAY/nDhke3A3RevwZSIhLY22359wzNr5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcSUwuSl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso3592693b3a.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 09:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769361474; x=1769966274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+1386rB0n9okZmKhpIHx7JNQZHVrJo7ec2P/m0LSWg=;
        b=TcSUwuSl17+evN3rWY3vnX+s2taVqtgRxy+4qeUp/F7oqgEzEdlafpCKoMonLYqjmd
         ttC+v/kCXFSESz6AhF0MUwBsLjH8+hWCZJNDcQnsMayAWPo30AEQ8izBuH3+88W9Weeh
         FIMWS8KNA/f21bAvOty9/bRyBvVyk1DxSnBOshNXoKxXLBmMDC1weWwZScdp+84p9r3D
         BYi9LLc4KlaCYw/NGEs19OhB75goBm6NwwF6Bn+egWGe5CctQdkbvhl9ezf2PATj3Htq
         AEnF/BWld1zDFETT8axthB3WO2/HvwinXCtojGdwk2p8mJdoSeHCQpI1ksH4OHfRGchl
         XBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769361474; x=1769966274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+1386rB0n9okZmKhpIHx7JNQZHVrJo7ec2P/m0LSWg=;
        b=EEK4ezWl+9jO/JYsjzmogsw/AGNUh5akO1rLcazTyThZgpiVMmabZIz3o8cpBzq8pf
         4bra5gked6Ze8/Kw/mRdI4VrCgbma7RFFwc886h2Yl3x66ij6Q7IlnTIPhtprokeoGOs
         Lyme3Tk5TUZKfNNO4P1CSA1o46LZkTBUvTEt6T/1LukXo0Z4RE6H8Lq+0vBsPhxwWnxU
         +TNDcz/6sQ5Ft3HLpWpBLDP1aH6Po8gGoKYvXiFeWFF0u5NqsMsYeTdzjjnm23kdE3Xx
         B760wnIFC7nHS+4x90Zgps7uaAYQld7soht8NjNMTCuuNTT8J8FZrbAgzilIDcnwxulT
         oRcw==
X-Gm-Message-State: AOJu0YzBbuGZR00/ReIaVGIlXai/IjEUxGl9Vs4m4Ff2qDnQpMEVNtyH
	rUP+q3/9r29y8seSwU/7RdoTp2oDPSorYIX0VHs9UflhcGI1nRiVnxpaQeRBkxTd
X-Gm-Gg: AZuq6aLoNqRXJ32T8aD2TgctSBEDWBgNcJSz+64go72kcxIq0RBcgswMlprYmNp60QK
	8TKq1962V6VjBF9HELOsc0ifmhaRkKAy/ltJsVWpH6nWB1mliyRhLKmjxYcb4nCA+1krZLw2q08
	gMWnrey2u7/zrHqbp/q8lrE9hpjkZWxlNfPH6If7SOKuSiNMhDuQVRrMu6SGBji+Bfmjsd4p4G/
	4W7/GwFHWZ+tL+Y3L4dVt7fGD2f5N/Jexy+ScSQwGxB8hu437MLj0AZZk1rdlJgOV3/ZpDQgBJg
	f19GfXqpfNymPQ7HV2tltVQ5xUtriRcucK8rKtxgyY4NOnJcRdFtvhjFGL0lIvl5mffhy+1wlQd
	5l/e0J2PtzsYbAOznP8Z8RMfVtS5S6714foNiFiuagBX887P2VKbjGfvjOlluXWCHQKyc+o5HRB
	2d1yzGPhn8cTI1T4Y3FJ7rWeXWX/0ckhj9Yz6z
X-Received: by 2002:a05:6a00:4c81:b0:81e:e09d:2687 with SMTP id d2e1a72fcca58-823411da749mr1575327b3a.1.1769361474406;
        Sun, 25 Jan 2026 09:17:54 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:35ca:7619:a2ef:5e6c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f2e12sm6924293a12.22.2026.01.25.09.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:17:54 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v2 0/2] Fix OV02C10 camera pipeline lock issues
Date: Sun, 25 Jan 2026 22:47:43 +0530
Message-ID: <20260125171745.484806-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51511-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D62D81917
X-Rspamd-Action: no action

This series fixes critical pipeline lock leaks that permanently lock the
camera on Snapdragon X Elite systems when applications close unexpectedly
or subdevices fail to stop cleanly.

Changes in v2:
- Patch 1: Added Fixes tag and Cc: stable as requested by Bryan O'Donoghue
          Fixed code style (moved opening brace)
          Simplified commit message
- Patch 2: Added Fixes tag and Cc: stable
          Removed unnecessary multi-line comment from code
          Removed invalid commit reference from commit message

Note: The brownout prevention patch (originally patch 3/3) is being reworked
based on maintainer feedback to improve power sequencing timings. It will be
submitted separately after testing the suggested approach.

Testing: All patches tested on Lenovo Yoga Slim 7x (Snapdragon X Elite,
ov02c10 camera) with libcamera/qcam, browser WebRTC, and PipeWire.

Saikiran (2):
  media: qcom: camss: Fix pipeline lock leak in stop_streaming
  media: i2c: ov02c10: Check for errors in disable_streams

 drivers/media/i2c/ov02c10.c                     |  6 +++++-
 drivers/media/platform/qcom/camss/camss-video.c | 10 ++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.51.0

