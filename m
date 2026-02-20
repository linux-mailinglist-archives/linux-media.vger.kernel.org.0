Return-Path: <linux-media+bounces-53119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOuWFKkYmGki/wIAu9opvQ
	(envelope-from <linux-media+bounces-53119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 09:17:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF031165959
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 09:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D178030467EF
	for <lists+linux-media@lfdr.de>; Fri, 20 Feb 2026 08:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65257336EC6;
	Fri, 20 Feb 2026 08:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIsXRLo4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B21DE3B7;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575309; cv=none; b=NZpklHVs8v66lc5oe2KZQO31U7TD20XPAlfkL9y1k+EfDrsE+xmJOWy6dATB6O89SknS3TMgZIoNYdJ2zoUmZpTFUxQRcq0tQz5aIiQDwth5NsjXBTel94qWNMo9OhRYkobG9QO806eM5E21Gu8G0XtiBlrl4J89ZAPo8uuKS8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575309; c=relaxed/simple;
	bh=QUFyLFVNFD15SkUE8r9Qz2zM/lufvVEda1scMmLZJpw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qgpGqacmXO6dWs18i7NPfYwCVYYfrjzcxtRpVVGTHYFWfo/SvagmMglsgDtFSGlnYayKIIDWUvlk3PnNh1BKZnnCavc/jycN1DmFJo9doBEObmP39p3/hl0XLXgnWVVegacu0Sv8b4vU+OIVZT3EExTPR41A3KYvwnYP8AyrHAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIsXRLo4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56051C116C6;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771575309;
	bh=QUFyLFVNFD15SkUE8r9Qz2zM/lufvVEda1scMmLZJpw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PIsXRLo4YhSPFWchUIhmNY4rNU6gTTT8qnLvScQegiGTGiKhpaLnPCpQRlz59q+UB
	 acDCvFiSke3mFRhY5aN7VK3oWG1ewAUKa70fwbWuD/4NhkLR+1rNepFEhundb9HtjR
	 wCD1V85+XV9tEcrh1Ltl/slBjU9zy5OSMocmR+V64Bj9CgI1w0a73rqL5ljIi5PEm/
	 ZxAl8bMiK4odihAsfATwiYVnWfGZGA3R1DXj2jzsfRbWTFZdD9nSZt/TWFA0dlDUN3
	 MMZ0gn/c/v206ubIpVvmhzO07Jg/csaYmTfNpuCYc7xDdzyxtSi1PmcHczEcC5yQ9q
	 hXUjpjaMUa9wQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A743C53200;
	Fri, 20 Feb 2026 08:15:09 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH v2 0/2] media: rockchip: rkcif: various fixes
Date: Fri, 20 Feb 2026 09:15:06 +0100
Message-Id: <20260216-rkcif-fixes-v2-0-ee40931fe0ff@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAoYmGkC/22Nyw7CIBBFf8XM2jGABh8r/8N0wcDUEhEMaKNp+
 u+OXbs8J/cxQeMaucFpNUHlMbZYsoBZr8APLl8ZYxAGo4xVRlusNx977OObG1IIx7D1e96RAmm
 Qa4xUXfaDdPIrJZGPyktazKUTHmJ7lvpZHkf9s//HR40KSdtARpEN9nD2JSVHpbqNL3fo5nn+A
 pQJiWW/AAAA
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
 Michael Riesch <michael.riesch@collabora.com>, 
 Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771575308; l=1152;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QUFyLFVNFD15SkUE8r9Qz2zM/lufvVEda1scMmLZJpw=;
 b=Npi/LRz/yYZBkJ3+diYHU47zp2Qqf54Rp4LL44ULFxsTXERqUPwiipVtlCo168v/NtIkaVUl2
 dkhVOUoKy1PCWQO+KwWkFVIYLWqPWDUI9/pqo0y7/sfrMEIJNzajgfD
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53119-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:email,collabora.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF031165959
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
Changes in v2:
- fixed index of second buffer (Paul)
- fixed cosmetic issues (Laurent)
- Link to v1: https://lore.kernel.org/r/20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com

---
Dan Carpenter (1):
      media: rockchip: rkcif: fix off by one bugs

Michael Riesch (1):
      media: rockchip: rkcif: comply with minimum number of buffers requirement

 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 10 ++---
 .../media/platform/rockchip/rkcif/rkcif-stream.c   | 44 +++++++++++-----------
 2 files changed, 27 insertions(+), 27 deletions(-)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260216-rkcif-fixes-bdd9d3c7e4b0

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



