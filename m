Return-Path: <linux-media+bounces-4261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29883ED12
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 13:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6FF28336B
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 12:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C06210E5;
	Sat, 27 Jan 2024 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jzH3KNbw"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD0620DC7
	for <linux-media@vger.kernel.org>; Sat, 27 Jan 2024 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706359633; cv=none; b=rQnK5/mFa5O95wFIhqeNhtDRSLTig81Z1XGX7wgrYrxa+hjtCJ2UCZaTBi65MrTMad8r0Bd+VzPGBZctje3o3k+qcsii6VjcUq7hlD55QezOAPyfxO6lGSnYTFD+votKazKmTqvmg2ya7aY4elWRZ3vRjjRlPtJw25hjqZ/dP7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706359633; c=relaxed/simple;
	bh=cPPwdZcbENY7mHOLd34N91Haz8i0L0udnZ00rBZfLwg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzqpDK1TPg2ub1fux5J2azMTl9w/4PBGFEstxdP7Vba7v5qKjvgBG056zEPqp11r4DnObbLURGI1WyBMlKLLvdlt9ugZqJfn7luYFbZ6BuUDqrte/76cssZbF9Q1NdEQRcnqA1wCLMQSEE7VvCFm/sNpDCVblqHewFnh6IjD8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jzH3KNbw; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706359629;
	bh=cPPwdZcbENY7mHOLd34N91Haz8i0L0udnZ00rBZfLwg=;
	h=Date:From:To:Subject:From;
	b=jzH3KNbwbd2/dXBFrUPTblf2AhLFrqmSEm1DQB+49Dg21mO2yEqWu4W8LOipct+Lo
	 4CSYuCV60Lw1P1RkQ3tjvdonw8lbLkLvOFUbOHjKLk1LWU/mJzXbqLxkHd9neMRjby
	 V7SBTUaWwPm0pDAg1IUsxeHerZO5wbLu2RR0xRpncfLu9SD4N9k7+a2VJTG6DxlFOk
	 RwY3tk5MnAFMhxNUeO0PnDBBHgQ194qS3Z9HFmnu/Q/LUW+xu1fC3Arb705pL0pCUo
	 1eta2SRVOMktTfARB/khLA4Fa3Wpgbv9PJtN8ZEBt6KrvolkHI1mPKKK0sNhzuOq82
	 gJDrkne2HrY8g==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 39BF537811D1
	for <linux-media@vger.kernel.org>; Sat, 27 Jan 2024 12:47:09 +0000 (UTC)
Date: Sat, 27 Jan 2024 13:47:08 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] MDP3 on MT8195 support
Message-ID: <20240127124708.equgiz7tsu4mlx4v@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Mauro & Hans,

this set of patches has been delayed because it was originally submitted
on top of linux-next and had dependencies that were not found on the
media tree, now that these dependencies have been merged I can post the
pull request.
This patch set adds support for MDP3 on the Mediatek platform MT8195.

Please pull.

The following changes since commit 04447d48afd365a837e23cde631517f166045b9d:

   media: mediatek: vcodec: drop excess struct members descriptions (2024-01-24 11:38:34 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9.0-mdp3-signed

for you to fetch changes up to dda00d8a598d9afa7d6da2e924467fbf543cabb7:

   media: platform: mtk-mdp3: add support for parallel pipe to improve FPS (2024-01-27 13:24:51 +0100)

----------------------------------------------------------------
add support MDP3 on MT8195 platform

----------------------------------------------------------------
Moudy Ho (12):
       media: platform: mtk-mdp3: add support second sets of MMSYS
       media: platform: mtk-mdp3: add support second sets of MUTEX
       media: platform: mtk-mdp3: introduce more pipelines from MT8195
       media: platform: mtk-mdp3: introduce more MDP3 components
       media: platform: mtk-mdp3: add checks for dummy components
       media: platform: mtk-mdp3: avoid multiple driver registrations
       media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
       media: platform: mtk-mdp3: add support for blending multiple components
       media: platform: mtk-mdp3: add mt8195 platform configuration
       media: platform: mtk-mdp3: add mt8195 shared memory configurations
       media: platform: mtk-mdp3: add mt8195 MDP3 component settings
       media: platform: mtk-mdp3: add support for parallel pipe to improve FPS

  drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c  | 729 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
  drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h   |  25 +++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_color.h |  31 ++++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h    |  23 ++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h   |  31 ++++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h |  25 +++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h   |  25 +++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h   |  21 ++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_rdma.h  |  24 ++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_rsz.h   |   2 +
  drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h |  34 ++++++
  drivers/media/platform/mediatek/mdp3/mdp_reg_wrot.h  |   8 ++
  drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h | 283 ++++++++++++++++++++++++++++++++++++++++++++++
  drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h   |   4 +
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h  |   2 +
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 440 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h |   1 +
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 895 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h |  93 +++++++++++++---
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 142 +++++++++++++++++++-----
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h |  50 ++++++++-
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c  |  15 +++
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c |  18 +++
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.h |   1 +
  drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  |   3 +-
  25 files changed, 2747 insertions(+), 178 deletions(-)
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h

