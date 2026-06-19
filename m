Return-Path: <linux-media+bounces-65257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gxg9A5ATNWq+mgYAu9opvQ
	(envelope-from <linux-media+bounces-65257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:01:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 132166A5172
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:01:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dw7sH5PR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65257-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65257-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CC2B3006D75
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4379635AC07;
	Fri, 19 Jun 2026 10:01:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18A1367B9F
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:01:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863303; cv=none; b=Pje3M7bcAG8/P5Mm+FyO7ToWm1KRpSb2ldmLg9WqaEXpBWUAtphslPkDTu4xBo/ViYxuvf5Mq55x6hjtju5/+6kRhpt3PZh9vilB6RZEuhLZ92JSe6javCZjaShlgYxUpxTsXi2I0tJBLX5yRdvW9ucHCsWtkEV1YBH0nPbM6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863303; c=relaxed/simple;
	bh=4D+y8UD1GHtSCPpQ0Me6A2p+sSocE2kdja4OakASoss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uBsNT7jtz/o/PdmX3jb2yXoTQmkSzUJ3RkYzE2vaO0sG9JUIUaQoUYzp4NrjRNPFoKDsKHl2soIiKRs2uBoZQq8hrFrsqKJM72xs7eTGhUhh7ZS5E44a6X9iTR9HtpqrspmIHHexaR9xiP85rpK9uidYD9iv/4qvwnAtanu2ML4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dw7sH5PR; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so1113612a91.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781863300; x=1782468100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkqYIALzNXPPRAYaKOOOXcxcCeCYifWi8am/6xuXOEk=;
        b=dw7sH5PRyoc8Q7NJW48eRqlVuVEnPBu+oZjpQJKy1YFj20bPc33XcarZH0jsbdJnSy
         VFsu5n6fFSdCrXwIvtpZLvnPjg5blkvLdShu3mO1qIZVI8kdPwMZ0WYYyozy9dutp6gd
         yo8TerwXAvc8N42Rfu/Ykmr0B4dSBcpvFbWBQToZ3LpN3Dfh6xo6mqD3CHfxsqdqu4CK
         9LYsi1etZZ9yAq7e6LBcQI1JwSi/e7i2utIRH1PYJVZ+c+xtv7Tzek4OoGkVYIyn1S0X
         gAfvEOtUL4AUUZcMhU5UcVrZSHSqcTlnUtGqlu2ukiDPBEGO4NgEa1+8lKD7OiusJCuO
         Q+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863300; x=1782468100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkqYIALzNXPPRAYaKOOOXcxcCeCYifWi8am/6xuXOEk=;
        b=N9XTdfg+BbkV+SYG/zxN/BWaSUD2B6aCFh6nBudi9olXWPnPF0bG2+xcmemZQHSTpX
         F6vEOYjf0vRIHGzf2zTE5DqMv/p8ThImCIUdyKhqTwtE0DxIsqtrStUN8/gkEeOf5jVq
         jpMo2Q1hzLDfclUcASuaLAIL94mnSmiVX4wtM95IB/acJBAjShYJO6bgWoVjhUi2pqWY
         5Tjoa6bz4qCczPYHlsoRllWSIHp8+gcbTYgmW4M+B4pQr1s9+q7T+YT01JLBMt/gEvit
         YWU9/m2uC70ZsMFTRP+GAjxLZ8dC5XwFfvZlNEBNuap4nvhLzv5yvBGz7wJsTb0vxhWM
         oQow==
X-Gm-Message-State: AOJu0Yyyfl+oQkXrzihGLTUfdv87H5PMoaUwWykq+F/jy4SALMZhz8Uw
	ErGbAyG6V0+0a4WErRROY3GGBa2EAEvGeK7ex+Qp1AnG3bBlIdcvSENC/zgjiw==
X-Gm-Gg: AfdE7clvLEZZXmC9hzl9b087Dq1NRlElLCDcviOPVmJDpXyeD5v6r/sLTjiE0K6OV4o
	IQRJoqYVABmY+gkAFZiMRoEEz1ilP4j64ktvD+Ty4+IJYNyU7n8/Fr2IfzDrQN3Dn3c4CVvl8zn
	DIdLavCrBovmjwq0PQ6HCrUCp0ZgyBtvJM5ZPUZ+Olzs+ve9dXdptzgqCzIGkpc8Mia/rHSxpUQ
	0T1CZ7P7/RvK4opAgdtchyH6XefwRzPnwUdkjK2w7WjZOUF9hHtmC3yrgd1K0AHzrdKVTNMT/WP
	e0Ipot2c23C5L3ipPAFtSJoDytkb9bGA0HECWshWl/CDSK2vL1b+ER7r0CWycJ90Xc4NE6HGDH7
	cDRcdKrE5uQQwB4VBcohqzVhzDWR1Io2mPZuZO6y756B0wnnMu76WpG+jFYRonzVXtbCmfKiEeZ
	T2J8BxZVcaFPfqBPjXzxhz6Zu4gAtt5evG2mbxN2pibQ==
X-Received: by 2002:a17:90b:4a8c:b0:367:b8ad:f0e9 with SMTP id 98e67ed59e1d1-37d160c7bf1mr3242701a91.16.1781863299543;
        Fri, 19 Jun 2026 03:01:39 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1558b599sm2340902a91.7.2026.06.19.03.01.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:01:38 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 0/5] media: i2c: Add missing media_entity_cleanup() calls
Date: Fri, 19 Jun 2026 15:31:27 +0530
Message-ID: <20260619100126.22197-7-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65257-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 132166A5172

Hi all,

This patch series addresses missing `media_entity_cleanup()` calls in the
error paths and remove functions of several media/i2c drivers.

While `media_entity_cleanup()` is currently a no-op when
CONFIG_MEDIA_CONTROLLER is disabled (and even when enabled in modern
kernels, as pads are rarely dynamically allocated anymore), the media
subsystem guidelines strictly require drivers to call it to prevent future
leaks if the core framework behavior changes.

Biren Pandya (5):
  media: i2c: cx25840-core: Add missing media_entity_cleanup()
  media: i2c: max9286: Add missing media_entity_cleanup()
  media: i2c: msp3400-driver: Add missing media_entity_cleanup()
  media: i2c: mt9v011: Add missing media_entity_cleanup()
  media: i2c: saa7115: Add missing media_entity_cleanup()

 drivers/media/i2c/cx25840/cx25840-core.c | 2 ++
 drivers/media/i2c/max9286.c              | 5 ++++-
 drivers/media/i2c/msp3400-driver.c       | 2 ++
 drivers/media/i2c/mt9v011.c              | 3 +++
 drivers/media/i2c/saa7115.c              | 2 ++
 5 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.50.1 (Apple Git-155)


