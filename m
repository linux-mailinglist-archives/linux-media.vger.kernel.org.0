Return-Path: <linux-media+bounces-64699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XBwGB0QXLGreLAQAu9opvQ
	(envelope-from <linux-media+bounces-64699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:27:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146067A28F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 16:27:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=ebNFjzIw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64699-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64699-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97DBC30F80A2
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B457C3890E8;
	Fri, 12 Jun 2026 14:26:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18DB342532;
	Fri, 12 Jun 2026 14:26:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274408; cv=none; b=Yi5ECrIHLyuoVKwVc6mSaj1q8rQhwYp0HfE0eOcx6T2JeGk04SgogY9vCFtn1533zW1f/Y/Uj7TPPSVM8YUv3WA+/pkRGqF0HXw77qNHHd1y1gbv3KHfKNf0dlzT1RnB/t1VV7c6+fd2IBVcUaZLMiXZd5jTP6CCfrmOCXj+0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274408; c=relaxed/simple;
	bh=nqhbl4w0DHWLcyrWk2QyBKWcj55aVfVDCiblKdSoOWQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IOMihklbv6ThWhi4y6B1wdqhB2EObMCTWiGJTmoQHGrvn1Ie9gp7pNOmFKBl28rcmzKVuzmHoAdpvLkMcJZxmi5920duDJFSatoguDVNes+LhnMzL0XFWmR2n3bg2grd9cc0v5twKApbNShq82aw9fUVjNAbAbMGs7K8yqJOrfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ebNFjzIw; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781274398;
	bh=nqhbl4w0DHWLcyrWk2QyBKWcj55aVfVDCiblKdSoOWQ=;
	h=From:Subject:Date:To:Cc:From;
	b=ebNFjzIwS5EalYroWxun8G7UD0zFRZujG4dxYZi0xjfXfSJHRuo+x359oEu5jGG9m
	 jNBXFJKAR8OodTRwTQyo02lO8z829vqDdrpBjl6yYuOMVybBVQR/3Pl54blOY32zEq
	 fkagXvqbL1MW27NNBHEzA+77RcF/R71w8aihqISAnD+3AIb2txmXWzArUjxkQ0E2VL
	 DqFNz9T/yiov4iLqRU/3OpyV+2Q58/8/121r6tKZD7+pyAw70wtmuQpUE50II0ffDc
	 PJ/dpLk2HvDiptQbQMtV+M5b7Cja2riPYdJOOW2ka5n/M4sKyOT6vjUvD8Rk32iBiA
	 xilS9dApx8LNA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78A8B17E040C;
	Fri, 12 Jun 2026 16:26:37 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/3] media: Add fdinfo support for v4l2 drivers
Date: Fri, 12 Jun 2026 10:26:21 -0400
Message-Id: <20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrE1SJYSriEW1U0akpEUk4u6K5
 Vv8f0EgzxSgSS7wdHDgxUVkaQJ6VG4gZBMNUshSlJnAo5glKmPQGnZ2QVXVwmpSfS5riNXqyfL
 5Hdvud9j7ifT2buC+H2CRriJzAAAA
X-Change-ID: 20260610-v4l2-add-fdinfo-a790fceab329
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64699-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,m:healych@amazon.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7146067A28F

fdinfo is useful to poll information from the driver.
Unlike the ftrace interface, it lets userspace tools get a snapshot of
the state of the driver at their own pace, instead of getting events for
each driver status change.

This works better to get information like HW usage time or clock
frequencies, as well as memory usage.
This patch set focuses on mem2mem drivers that are per-frame based and
an implementation is proposed for the Verisilicon Hantro driver, limited
to clock frequencies and HW usage time.

An example of usage of this from userspace is implemented in v4l2top:

https://github.com/cazou/v4l2top

checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
definition are kept unnamed to match with the rest of the struct
definition.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Christopher Healy (2):
      docs: media: add documentation for media client usage stats
      media: hantro: add per-context fdinfo usage stats

Detlev Casanova (1):
      media: v4l2: Add callback for show_fdinfo

 .../userspace-api/media/drivers/index.rst          |  1 +
 .../media/drivers/media-usage-stats.rst            | 84 ++++++++++++++++++++++
 drivers/media/platform/verisilicon/hantro.h        |  5 ++
 drivers/media/platform/verisilicon/hantro_drv.c    | 22 ++++++
 drivers/media/v4l2-core/v4l2-dev.c                 | 10 +++
 include/media/v4l2-dev.h                           |  1 +
 6 files changed, 123 insertions(+)
---
base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
change-id: 20260610-v4l2-add-fdinfo-a790fceab329

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


