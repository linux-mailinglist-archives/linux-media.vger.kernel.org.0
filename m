Return-Path: <linux-media+bounces-12668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 903288FF152
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 17:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F8EA1C22557
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7CED197A65;
	Thu,  6 Jun 2024 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="yaXnGMIq"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD911E861
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689337; cv=none; b=tXNrWpE3ThLHWT5Jc+uqh4BWBoJGI4LsPpVE/C/4IjUKpzuoCprTU4ZFL6vAktooi19g8MZrBoB3HfePolLvhrgYTC1xaxFdTCrXsu3jcl06a7mPUlEZRePKBvaT7ZLxBs7AXErZ4BHDLCQfEANxlxj8GTxFsm70EBSk2wnGpMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689337; c=relaxed/simple;
	bh=lArHKXUkkyXTo6kvgtsqbTwiT3uIHIVivBzQ+2PXtuw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJJ1LjpDqlU+I5Or00c3RYir3FPOlmb9wiHNbl0o11jEbuu8Y1DWtG8IWJki1oy/mjdtQNhN4HaW4VdrvxpI6h0erjqu5IS07LqQZQFhdM1YD0GF/uJynJzp4z5wkC6BM9CCeXbpCuRwDthnIbo8m6J34zTdpe4E5h4Kg2l+rx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=yaXnGMIq; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717689334;
	bh=lArHKXUkkyXTo6kvgtsqbTwiT3uIHIVivBzQ+2PXtuw=;
	h=Date:From:To:Subject:From;
	b=yaXnGMIqKsezSPJszzPZ3l9IzipEAwjArC9Cuh/FC94h8BHNY/FEo/8y0q43ly7S2
	 lR4etRdIF3gupXNp4Qbx2Q0S710kE+x5eM6MDY+g0fk4IFEvb3biFi641+JzJANxY8
	 2gOU6o4hHaJ1GLYRUSfpWygMaeFL5FTisUdOPw3SkB1tB5eR15Y73RX327efQK6aYv
	 rD2XpHWuOKB0S9Diqnhd14wIofCqV3O3eP5m3Mu9B7vnQzNsRVoxeQQxGPM3vZDJIP
	 iL3kA0tkIemJKievLji0hbDr1ic1sJCb5m9VOjxjzWwKSzA+gj0CCc91XEALUuuaOs
	 aobmPyeAtZ3Yg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F2FC937821C1
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 15:55:33 +0000 (UTC)
Date: Thu, 6 Jun 2024 17:55:32 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.11] Add average QP control
Message-ID: <20240606155532.43rac2olf6qnnkq2@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

please pull.

The following changes since commit 1aea3d1d4a21e3e7895663b848ffae79ee82e065:

   media: av7110: coding style fixes: avoid_externs (2024-06-04 16:19:56 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.11-add-avg-qp-ctrl

for you to fetch changes up to a3504a8198a9516facf57f84b546ba0c677f0ad8:

   media: amphion: Report the average QP of current encoded frame (2024-06-06 12:37:03 +0200)

----------------------------------------------------------------
Add an average QP control and apply it in the amphion driver

----------------------------------------------------------------
Ming Qian (3):
       media: v4l2-ctrls: Add average QP control
       media: amphion: Remove lock in s_ctrl callback
       media: amphion: Report the average QP of current encoded frame

  .../userspace-api/media/v4l/ext-ctrls-codec.rst          | 14 ++++++++++++++
  drivers/media/platform/amphion/vdec.c                    |  2 --
  drivers/media/platform/amphion/venc.c                    |  6 ++++--
  drivers/media/platform/amphion/vpu.h                     |  1 +
  drivers/media/platform/amphion/vpu_defs.h                |  1 +
  drivers/media/platform/amphion/vpu_v4l2.c                | 16 ++++++++++++++++
  drivers/media/platform/amphion/vpu_v4l2.h                |  1 +
  drivers/media/platform/amphion/vpu_windsor.c             |  2 ++
  drivers/media/v4l2-core/v4l2-ctrls-defs.c                |  5 +++++
  include/uapi/linux/v4l2-controls.h                       |  2 ++
  10 files changed, 46 insertions(+), 4 deletions(-)

