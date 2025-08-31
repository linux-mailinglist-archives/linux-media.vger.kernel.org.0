Return-Path: <linux-media+bounces-41382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA74EB3D17F
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 10:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B4813B6773
	for <lists+linux-media@lfdr.de>; Sun, 31 Aug 2025 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58F0241690;
	Sun, 31 Aug 2025 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlYaPgkt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB23168BD
	for <linux-media@vger.kernel.org>; Sun, 31 Aug 2025 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756630417; cv=none; b=Rw6FJu4+IYVaeGX4ahDRXORklxuJwaQ60AHx2S1rjjeAYJhea8WXA5Fa+THtH6/D6O+K9NyRtzPlNm7W6ZVZPvlKf7pBunolxgmBH3Cy1OTQwmXFmghRdlxYBkBaTYPHE/EhcBjcy+LR3Pw+Lm5/dvobwrFuTO/eyOoOtoaeIuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756630417; c=relaxed/simple;
	bh=1GV1npeAJk0w4u/PMe/AC08+IhFkpuzuciSAcElMUYM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=GTRqu1MhYb2m43CPfyMW6U9LxhoW/pCfm8KcYELs/cyzhfw3a5Ujm/8OGKUPgSWYtovKor4qGIHEQotf/WUPZMV5GhcmzNUgd1WkPJ4UR4162L0LJE9qwCDiUAJhiv689tisht0nKl0AZbkmQ7GD2uamDIEgO8sVizz891Bifck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlYaPgkt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB85C4CEED;
	Sun, 31 Aug 2025 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756630416;
	bh=1GV1npeAJk0w4u/PMe/AC08+IhFkpuzuciSAcElMUYM=;
	h=Date:From:Subject:To:Cc:From;
	b=IlYaPgktiUiXsyNyyRHrwziIzJ4vwbschHOdy9wbfywK+1oZslRyZ3dwhltv/kIi7
	 PvwbpyIokMTVgAReHLAdB1wKkP99Nga8fMHHZSKEygsOG+uk1JN1B8LQO9BpsZFAnv
	 POOothXEqoUxaKzozHL/nsx/Wm21PRGwL01k1Wgv+oBR1vjJTkfJme2T4tQ6aBOtLt
	 R8OYunKUOPg2BDoqBPpYu8I7lp0n6gZqAyqRCtxsbj+9s6JquS8At1sfDwcTnKCaaA
	 Oc4Lk6NDp7TnvhZxDDHj6m7TBMfLvhu8/tqFc7yZpy8rl1sE/URNPiaWsA5G42t2hs
	 4d5w+At7EOC5w==
Message-ID: <5fccadaa-b111-487c-b396-a1bf9b3de677@kernel.org>
Date: Sun, 31 Aug 2025 10:53:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [GIT PULL FOR v6.18] media: tc358743: support more infoframe types
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This short patch series extends the number of InfoFrame and Packet types
that the tc358743 supports, including one that is programmable.

This makes it really useful for testing.

Regards,

	Hans

The following changes since commit 0750649b528ff18d1d68aecb45b34ec22d5ab778:

media: pci: mgb4: Fix timings comparison in VIDIOC_S_DV_TIMINGS (2025-08-29 11:04:03 +0200)

are available in the Git repository at:

git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.18g

for you to fetch changes up to 7c449853002c0ab52bed2b8a706369a054964b53:

media: i2c: tc358743: add support for more infoframe types (2025-08-30 15:52:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (2):
media: v4l2-core: v4l2-dv-timings: support DRM IFs
media: i2c: tc358743: add support for more infoframe types

drivers/media/i2c/tc358743.c              | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------
drivers/media/i2c/tc358743_regs.h         |  57 +++++++++++++++++++++++++-----------
drivers/media/v4l2-core/v4l2-dv-timings.c |   4 +++
include/media/v4l2-dv-timings.h           |   1 +
4 files changed, 140 insertions(+), 31 deletions(-)

