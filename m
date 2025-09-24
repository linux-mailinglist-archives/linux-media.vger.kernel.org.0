Return-Path: <linux-media+bounces-43052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BDFB9978E
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 149377B1A20
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 10:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA10A2DEA7A;
	Wed, 24 Sep 2025 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcMR98k8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127D2DFA3B
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710665; cv=none; b=plHVmOTSMgbz0AOw4lZbLdd12b/e36sVH02rDa7egtEVfcm0LyYsq37r2EGAPH48XDLtavQbMz2uSKoUwHa6aQ63JCBMdL0CRETzr3jpZlV5t2w9VXF54bPaLCePR8ELmqGWAVz3pP1q2Kw7O/AtD4YHYM+gYlupgsH/jtkQUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710665; c=relaxed/simple;
	bh=9iko0IOvzqd7n2JM7Y5Re5xIuF2PTCuK4g6Sx7Ajt4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HPOZBmo8VSy3Z+5Iq5YbqHglTPlTK0FS9gmKLjZQy7QhCCeN8pEpzwdeSmbPp8Xb1VGAoII/GJng7nBlTP4XKForQJ8bvCMCdxCYuQRytCqoMvmDuY4YmhF0Nin/pDonvfmyZM5NJTeQgUiefn0003pvvpc8mLc19RqSwpp7PGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcMR98k8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CF7C2BCF4;
	Wed, 24 Sep 2025 10:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758710664;
	bh=9iko0IOvzqd7n2JM7Y5Re5xIuF2PTCuK4g6Sx7Ajt4s=;
	h=From:To:Cc:Subject:Date:From;
	b=GcMR98k83Tuj7wA4Q8Gu2mQtj2M8P1qR4x8FHKypngfbfNpzBX082AQDQ0sHpWEXz
	 725s4WOgCFuNkiIGHlrvWhn74vQ9AXSBkTNn93cuU5umzsXLcsV/FQe9I0MXTQ2e1K
	 7MTDHAbgeDX14vYCfQn3W4n7DsJiiZGmEQCtyUd5peDNQPzvVfyRexKKqhNH4Qs3fx
	 wKsrD8X2P5PcVMuvhct6UAmr2gw7mqpLGgg1sW+/bMPHzErm1eLeLm5C6y57yJI+y+
	 dO7od0kj5J4MP7GPJzRjYiCBb9hw2DlZL4CYxGGstrF/a4Z9V40L4UTEKloQjr4lO1
	 dFZi3pKtEkV4g==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 6.18-fixes] Please pull platform-qcom-fixes-for-6.18
Date: Wed, 24 Sep 2025 11:43:56 +0100
Message-ID: <20250924104419.7248-1-bod@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 40b7a19f321e65789612ebaca966472055dab48c:

  media: tuner: xc5000: Fix use-after-free in xc5000_release (2025-09-17 12:15:35 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-fixes-for-6.18

for you to fetch changes up to 22d0fa7f9507d8e20db956aab5d2eecd55084db6:

  dt-bindings: media: camss: Add qcs8300 supplies binding (2025-09-23 00:13:39 +0100)

----------------------------------------------------------------
This tag contains three fixes for 6.18

- An alignment issue Loic identified in -next for QCM2290
- A fix for Venus when OPP tables are missing
- A fix for the QCS8300 CAMSS binding.
  https://lore.kernel.org/linux-media/61b562ad-eb67-4917-a449-f5556c43ceef@linaro.org
  https://lore.kernel.org/linux-media/e72800d4-cb65-443b-be7e-0966a60fa5a9@linaro.org

----------------------------------------------------------------
Loic Poulain (1):
      media: qcom: camss: vfe: Fix BPL alignment for QCM2290

Nihal Kumar Gupta (1):
      dt-bindings: media: camss: Add qcs8300 supplies binding

Renjiang Han (1):
      media: venus: pm_helpers: add fallback for the opp-table

 .../devicetree/bindings/media/qcom,qcs8300-camss.yaml       | 13 +++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c               |  1 -
 drivers/media/platform/qcom/venus/pm_helpers.c              |  9 ++++++++-
 3 files changed, 21 insertions(+), 2 deletions(-)

