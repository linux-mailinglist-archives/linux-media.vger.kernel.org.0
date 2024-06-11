Return-Path: <linux-media+bounces-12960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B14904032
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 17:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D7F81C231D3
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 15:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8701BF53;
	Tue, 11 Jun 2024 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xrrPFXU+"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23262E417
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718120285; cv=none; b=qX0sdEsaE/5UWc5lckxcRwPm0FohsSYHJJMYXHfDxu/XPaT3q9shE7h5MKfDgsVwc2GT/8S32L5dLJYtD/fH1F2Nv2cc2mTe8BvokHM4smNHrQcYuhWeB36JpF7SBzakFk1z5ktqeo5u0TkYL/00r6fKcCAx8/VGcprVa7rpg3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718120285; c=relaxed/simple;
	bh=Cvi+uF2MJBjwfTXgBENhZGnZWr4063Pm3E90WCfDKpQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKIA9ijAG1Z32hvI68YW+n4CV1jKuYIZ6LMA8Cd48FfxztRfVwgSNrBREh2zXIWok738egPLJ/+aHeqxvzg5dhX9L0Wa+Qr67/zKq3AF5V+LsXnQiw1XZZoEojkf1xOI5ob9MEElO0zVG44CHTk5sBVvqlyC96Bv2rW9dWj+i/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=xrrPFXU+; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718120280;
	bh=Cvi+uF2MJBjwfTXgBENhZGnZWr4063Pm3E90WCfDKpQ=;
	h=Date:From:To:Subject:From;
	b=xrrPFXU+CWr2BB60YXmHlZ8VmIHyRxo+cTT6KGEFafctXRt9CVZDsiW5zijwRtC5j
	 T5Btd0FjHMpZI9A64JOJatz9DOJG8ytzzg6CU39ghdTtBj5+jTLpWUgpBoE5SyX7FI
	 t30O8OeD11PkOytK05/v5v+T9qpxua3R7jeSvXhG7Yp35vtCMb3w+D5rlkImjBHHPA
	 nh9ZDg9eMAFJuxM1tTViI+LHecSSMQHQBXAQvYIhD5l1AV0Wy6kyJZJGblZvR+SdfU
	 xGYtHIU/vwbUWtpsHJcSoURxm1Wgep9J+PVMKY2aPlqNTlzE7Lv+3QeM8Jn+CeSt/k
	 hEJdO8dAWAQrw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B424F37811D1
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 15:38:00 +0000 (UTC)
Date: Tue, 11 Jun 2024 17:37:59 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.11] Wave5 features
Message-ID: <20240611153759.t6vy23etmawej7vm@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

please pull

The following changes since commit 1034ead1a7333e65e516c583f757717f461eba43:

   media: amphion: Report the average QP of current encoded frame (2024-06-10 10:24:30 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.11-wave5-features

for you to fetch changes up to 0fc475f948e052b807a8591a32ea8c8c9e2ed558:

   media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder. (2024-06-11 17:33:44 +0200)

----------------------------------------------------------------
Multiple new features for Wave5

----------------------------------------------------------------
jackson.lee (4):
       media: chips-media: wave5: Support SPS/PPS generation for each IDR
       media: chips-media: wave5: Support runtime suspend/resume
       media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
       media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder.

  .../platform/chips-media/wave5/wave5-helper.c      |  24 ++
  .../platform/chips-media/wave5/wave5-helper.h      |   5 +
  .../media/platform/chips-media/wave5/wave5-hw.c    |  23 +-
  .../platform/chips-media/wave5/wave5-vpu-dec.c     | 312 ++++++++-------------
  .../platform/chips-media/wave5/wave5-vpu-enc.c     | 308 +++++++++++---------
  .../media/platform/chips-media/wave5/wave5-vpu.c   |  43 +++
  .../media/platform/chips-media/wave5/wave5-vpu.h   |   5 +-
  .../platform/chips-media/wave5/wave5-vpuapi.c      |  14 +-
  .../platform/chips-media/wave5/wave5-vpuapi.h      |   1 +
  .../platform/chips-media/wave5/wave5-vpuconfig.h   |  27 +-
  drivers/media/platform/chips-media/wave5/wave5.h   |   3 +
  11 files changed, 420 insertions(+), 345 deletions(-)

