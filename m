Return-Path: <linux-media+bounces-60401-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIbuKj/V+Wk1EgMAu9opvQ
	(envelope-from <linux-media+bounces-60401-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:32:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF494CCB03
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 13:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA0A8309C194
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 11:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4C0386C2D;
	Tue,  5 May 2026 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/NhtlYG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B7837CD54;
	Tue,  5 May 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980305; cv=none; b=UwErlsHI6G0KG0krpESkHpgZfY1TN8R8Cb8PfMttHm3mmQEc/671kU2RnJSZXyYKJeWACno1VYIA6bMoD04hgUyA2MQMRQpPJciSFSXUyV2/MTWNYcTZLW2cWO/vC3iob2BZ6LpD4m1yehlwCuFlc99Dd/C1ev8v3eAOo+564zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980305; c=relaxed/simple;
	bh=oyrvTSeprdoeY7heH7XkPLJJbjixtSkpu8LjnXgErvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tyP3lWw6leYkSmR7VzWdMqzzk0zpAGm2y+BN99X7PjpscDQHGJdNM1lT2zIlB7IF4WtzNmbf7Z4U9LSU+UCNNudhwhwg74ImVBq046GvTUK3F9JdZ2Lx4GfbKb/ZxgTKi9lYtkp2vpESL5J0mbHqsZZg8+WIcX2GWnvG6PPu2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/NhtlYG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8458C2BCB4;
	Tue,  5 May 2026 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777980305;
	bh=oyrvTSeprdoeY7heH7XkPLJJbjixtSkpu8LjnXgErvs=;
	h=Date:From:To:Cc:Subject:From;
	b=n/NhtlYGDhMBLg+3PjNe2jCV0sfVQxstmHxqujBSBIWIJg+e8/KV7wT8/FT8PiWCd
	 6P2ESr+m3bz9rpFkSUUfmqqZFxTExik/XjwN2gMNzphVUQWiXoIFxWKwewWYYahsqh
	 nAAOgC14PidR0N8b5VVB2Pev63heUYX2tVl1IWWQrVsNkLJ4Wp0kTHLGomJZ2mDXuO
	 J/nAnsSXihBGvTe4weG22aQm/A+hM6Vdo5YhTSBDjqdPiy9m9jAyR71rkJQb4SQLr3
	 AOkOiQBHlfeXCmvEr1KjZMO+CXJg3MavmidrXrHSgKskv1BBgShTgesIWb6qsJJho0
	 W/EBKcgvWuKBw==
Date: Tue, 5 May 2026 13:25:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [GIT PULL for v7.1-rc3] media fixes
Message-ID: <20260505132501.1cbb9d20@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6BF494CCB03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60401-lists,linux-media=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-2

For:

- rc: ttusbir: fix inverted error logic.
- Venus/Iris fixes:
    Kconfig cross compile build testing for x86
    Use-after-free fix for internal buffers
    dma_free_attrs size fix
    Switch to hardware mode clocks
    Use-after-free fix for a concurrency path
    Fix H265D_MAX_SLICE size for sc7280 devices
- camoss: fix some clock-related issues.
    
Regards,
Mauro

---

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v7.1-2

for you to fetch changes up to 23c39cb598977f10909a2387c5e5f34afc1d6933:

  media: qcom: camss: avoid format string warning (2026-04-27 08:41:22 +0200)

----------------------------------------------------------------
[GIT PULL for v7.1-rc3] media fixes

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

