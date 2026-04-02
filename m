Return-Path: <linux-media+bounces-57974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN/dBgl9zmnBnwYAu9opvQ
	(envelope-from <linux-media+bounces-57974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:28:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0BA38A81F
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1A33301F9F8
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 14:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E951B3DC4A5;
	Thu,  2 Apr 2026 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ajn0nLDV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6D23EA85
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 14:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139823; cv=none; b=A/kFbOD1Wu3fRFLG3QiUGJfabCSi/PnhGyP4HfOV9FlBXLop6zifH8V7hd2mUXzw4lMwqBs874eNSGLtOgv0bTygdHQx8M8etzRww6IquhhRJcSRQ2tBcTEm9t2mnLKFCXzsS0DDq7eYjQ9UGxf2TGLbqQwR7KKcdvKJepHx4aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139823; c=relaxed/simple;
	bh=8JLlNDkf0zYLtjhUsm+hLi6eoQoW2WyX8HaVQ8wG4KY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CwmLnzia1jLPwatfBjzBlzR6S4oP9wNSm5b+kMdyDZJtTT42pnxB+aVWVz7F5YtMXFBSg6QqHeAd6FKji0mMWi9kKXK2TC4kcMCSugd5azL2oOVNfL11wahqljLOoGDKb3Jyt4KQns3vyy5M1NI5ArIa5tzoiCkIYqifT00uVx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ajn0nLDV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01468C116C6;
	Thu,  2 Apr 2026 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775139823;
	bh=8JLlNDkf0zYLtjhUsm+hLi6eoQoW2WyX8HaVQ8wG4KY=;
	h=From:To:Cc:Subject:Date:From;
	b=Ajn0nLDVJF9+qK2+O1h9EzsBbrL3LW1WuYLxwMdcNdmUCNggBDYamr04OUzdYJ/tO
	 0khly98dlmQIi2r0vTYGUSFoL1IGxv9nHF7DAs/UyGgT0qNN2dNUjNp1MXJOxMru+q
	 5a2WpnRupoUPjFajcIXtDgEQ3z/E6aAZItSaF16BsOBNLcY0WZMwkdfdCAl7RX9jJN
	 xxXOJQD4Myp90pz4mtsh15Pk+1BnmPwaEbHhCSyUC4ZAjE+o4MJDMPfQHJTykyLq1k
	 MyTiHXmdjJeEr5Sxh4AmOczd8rZTjZLQO8bfnH1UCRov+ZXky6K41cXbO+i6ZwEx7w
	 99Kk8xrTADecw==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 7.1-fixes] Please pull platform-qcom-7.1-fixes
Date: Thu,  2 Apr 2026 15:23:21 +0100
Message-ID: <20260402142331.381007-1-bod@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-57974-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 6B0BA38A81F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 4fbeef21f5387234111b5d52924e77757626faa5:

  Revert "media: cx231xx: add USB ID 2040:8360 for Hauppauge WinTV-HVR-935" (2026-03-26 22:27:24 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-7.1-fixes

for you to fetch changes up to 2211e826bd69c041534093735241182013dde7bc:

  media: qcom: camss: avoid format string warning (2026-04-02 13:21:42 +0100)

----------------------------------------------------------------
This tag contains fixes for drivers/platform/qcom in two parts

Venus/Iris
- Kconfig cross compile build testing for x86 - Arnd Bergman
- Use-after-free fix for internal buffers - Dikshita Agarwal
- dma_free_attrs size fix - Thomas Fourier
- Switch to hardware mode clocks - Vikash Garodia
- Use-after-free fix for a concurrency path - Vishnu Reddy
- Fix H265D_MAX_SLICE size for sc7280 devices - Dmitry Baryshkov

CAMSS
- sc8755p fixes for CSID - Wengmen Liu
- VFE fixes for sa8755p - Wengmen Liu
- Format string fix for CSIPHY - Arnd Bergman

----------------------------------------------------------------
Arnd Bergmann (3):
      media: venus: fix QCOM_MDT_LOADER dependency
      media: iris: fix QCOM_MDT_LOADER dependency
      media: qcom: camss: avoid format string warning

Dikshita Agarwal (1):
      media: iris: Fix use-after-free in iris_release_internal_buffers()

Dmitry Baryshkov (1):
      media: qcom: iris: increase H265D_MAX_SLICE to fix H.265 decoding on SC7280

Thomas Fourier (1):
      media: iris: Fix dma_free_attrs() size in iris_hfi_queues_init()

Vikash Garodia (1):
      media: iris: switch to hardware mode after firmware boot

Vishnu Reddy (1):
      media: iris: fix use-after-free of fmt_src during MBPF check

Wenmeng Liu (3):
      media: qcom: camss: Fix csid IRQ offset for sa8775p
      media: qcom: camss: Fix csid clock configuration for sa8775p
      media: qcom: camss: Add missing clocks for VFE lite on sa8775p

 .../media/platform/qcom/camss/camss-csid-gen3.c    |  6 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 10 ++-
 drivers/media/platform/qcom/camss/camss.c          | 80 +++++++++++-----------
 drivers/media/platform/qcom/iris/Kconfig           |  2 +-
 drivers/media/platform/qcom/iris/iris_buffer.c     |  6 +-
 drivers/media/platform/qcom/iris/iris_core.c       |  4 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |  6 --
 drivers/media/platform/qcom/iris/iris_vdec.h       |  1 -
 drivers/media/platform/qcom/iris/iris_venc.c       |  6 --
 drivers/media/platform/qcom/iris/iris_venc.h       |  1 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +--
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +
 drivers/media/platform/qcom/venus/Kconfig          |  2 +-
 20 files changed, 98 insertions(+), 93 deletions(-)

