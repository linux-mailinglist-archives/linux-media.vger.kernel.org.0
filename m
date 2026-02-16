Return-Path: <linux-media+bounces-52874-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A/rF9Agk2kX1wEAu9opvQ
	(envelope-from <linux-media+bounces-52874-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:51:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E5314421D
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63933302E426
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3AE3101A6;
	Mon, 16 Feb 2026 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWgcmzEP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393A72EE607;
	Mon, 16 Feb 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771249802; cv=none; b=cWySpfaf95VD9DknsrkcMD9gABtkIURY7YFawiuQQMbYvU6LN55Hawy2TZ+a91FuUsdevlP5FLpfHBK1CxW2XZfNnnPUXCHIhLuOSE5J47GSul8g3K3XppSJ2VaSGOnJNfrGtfI7R2SbbLQvGIUR0ahfEoozMVGSH+5+xjfFt7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771249802; c=relaxed/simple;
	bh=msfTh03NG07ETuEWGU73Tj/AyEz3fvIWOKO1VC6wmzE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RX9UiYfVDY9VnZlJMgUCkI/BK2i+qjtP6llo8wl+0ccr15DqvDGpguDaR70+1Tu29qA4e5cD7AUuQ7tdJo3ls2gTepkGXmeCAhwV1GPr8BXVsK266Kg5gHOlrpP0lYIaifN1bvHlsQg96PBrmUGKWEnypal3T+zDDwJu9gpJlKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWgcmzEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACD1FC116C6;
	Mon, 16 Feb 2026 13:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771249801;
	bh=msfTh03NG07ETuEWGU73Tj/AyEz3fvIWOKO1VC6wmzE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YWgcmzEPxuAOSiMBIghN5Q2kSbmw7OnF9MnW7aS9NexM9ZZb/sMvPuCphE2l8TwV9
	 j3kBvQuDCexDS5hdh9WkP+0Tx5yNkMc1qgn+K4gxu3HJWucRtbI2Lldec2aQ+Stw4r
	 lL+coehGOfCoCOzCrSbCDdjiClU4WBqJXzBiX9yNy2YAl09hUZC1Spq6jWUzsAkbN6
	 UhAXSYCJar4X1w+knbUvnsqal3i1Q/vhLfOWvPMfa6Vd32js8e27cTxsVnXonAEz3m
	 pGRfoIyP3DJE02Ypfe90YG64wwTPFyYmSC94B2LP9rdMWaV6FyfcrpQwAOZ0FqQT5u
	 iJPut3MnMi8OQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962F8E81A22;
	Mon, 16 Feb 2026 13:50:01 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH 0/2] media: rockchip: rkcif: various fixes
Date: Mon, 16 Feb 2026 14:49:55 +0100
Message-Id: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIMgk2kC/x2LywqDQAwAf0VybmDdikV/RXrYR6xBWSVBEcR/b
 /A4w8wFSsKk0FcXCB2svBaD+lVBmkL5EXI2Bu9863zdosyJRxz5JMWYc5ff6UNNdGBHDEoYJZQ
 02VP2ZTG5CT21meF73388YpNjcgAAAA==
To: Dan Carpenter <dan.carpenter@linaro.org>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771249800; l=962;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=msfTh03NG07ETuEWGU73Tj/AyEz3fvIWOKO1VC6wmzE=;
 b=EzemGU4WwwrerpyJyqtpwSkZEMGm+gNFMXztnVatpUldXQTDeZsDGZ8MxfWnBm7/R1bLPh0hI
 h8+KZIwF77YAolHH+0o2kfeiOq61M+Yi/24IZffM9j2nE7HAw/rB8pd
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52874-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:email,collabora.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74E5314421D
X-Rspamd-Action: no action

Habidere,

This series contains

 1) a re-spin of Dan's patch that fixes some more stupid off-by-one issues.
    This patch has been around on the list for some time, but apparently
    has not been applied yet.
 2) a fix that makes the DMA abstraction respect the minimum number of
    buffers requirement

Best regards,
Michael

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Dan Carpenter (1):
      media: rockchip: rkcif: fix off by one bugs

Michael Riesch (1):
      media: rockchip: rkcif: comply with minimum number of buffers requirement

 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 10 +++---
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 41 +++++++++++-----------
 2 files changed, 26 insertions(+), 25 deletions(-)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260216-rkcif-fixes-bdd9d3c7e4b0

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



