Return-Path: <linux-media+bounces-13829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C800191088E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CB511F22BDE
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B101AD9E6;
	Thu, 20 Jun 2024 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M60p7xBQ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991523774
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718894219; cv=none; b=F7eSCu0pRsWq75Z9kPoBjJvB/xdEsLqHhsFocTmHtuAP2XBqIK+ztARApG2iPDjdCE4BXGIV4auz1kwx9ublrjUavSHAIaB3dqxKNHrJlHeJ29nKoxfzdbE/RsSsNshvTSTCnXLsjvamsmznIg89tl2OfBcL8ZUUp0Q+YhdXswk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718894219; c=relaxed/simple;
	bh=Ri/MA0Qh+g44zYLrLzIHMYoak9ZWDEEAZrJwz+C1Flk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qSujIMNZNC+VNkolXcpB4OFFL1bUxeD18+TXWM1C3tiZUTT7mHf9N1bubOgMPU4ZOxMt9hWXSYdVL7/qlhfTaRGCvJAvcvUdGTU8i6/Fg7WyFD58vKx4AEImMJRXeFhDO95p2OAu3KptIxh2SUw3YlULFkAX/H7FQmhEMYWrsEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M60p7xBQ; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718894215;
	bh=Ri/MA0Qh+g44zYLrLzIHMYoak9ZWDEEAZrJwz+C1Flk=;
	h=Date:From:To:Subject:From;
	b=M60p7xBQo9D5SFYrLZInNyZeFuFIGFVWN4hQktOvLjZ+VB4loMjOEbNw0/m8r8XR3
	 /iGYXYdCWOl09jghGYbJbLeuFTukQu74yVRGrQxVVmeqoYXN+uuPNs29OCmRnV46C4
	 P1avujw153igVai4k/qatB6azjZ+hdFbwuM/Qq6DmDvoClRiiojcslZpEoaF11WwSw
	 GkraeQvYsnrNS829s4I3hZp0kk0+6KFi+9/YJVgSN/XsoCTAHJVJflAcT7zJ01LG9A
	 BwFNl1ZGQVcp/526iA16XgmhM29oP1SlfkCggmnvW+wr7H4YEeRbh7zxjFsOqJMgwf
	 ycLwIR2PkFKiw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8E8F93782159
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 14:36:55 +0000 (UTC)
Date: Thu, 20 Jun 2024 16:36:54 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.11] Wave515 support for Wave5
Message-ID: <20240620143654.tfylr4574pqoddrm@basti-XPS-13-9310>
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

The following changes since commit 7fc65b78b465b8511a503491e7c3116d46dc6c72:

   media: platform: mtk-mdp3: Add support for MT8188 MDP3 components (2024-06-20 11:47:48 +0200)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.11-wave515

for you to fetch changes up to 978f5690c10f047c911563a1b5b3a96e7b8871fe:

   media: chips-media: wave5: support Wave515 decoder (2024-06-20 16:34:21 +0200)

----------------------------------------------------------------
Adding support for Wave515 SoCs to the Wave5 driver

----------------------------------------------------------------
Ivan Bornyakov (5):
       media: chips-media: wave5: support decoding HEVC Main10 profile
       media: chips-media: wave5: support reset lines
       media: chips-media: wave5: separate irq setup routine
       media: chips-media: wave5: drop "sram-size" DT property
       media: chips-media: wave5: support Wave515 decoder

  .../platform/chips-media/wave5/wave5-helper.c      |   8 +-
  .../media/platform/chips-media/wave5/wave5-hw.c    | 395 +++++++++++++++------
  .../platform/chips-media/wave5/wave5-regdefine.h   |   5 +
  .../media/platform/chips-media/wave5/wave5-vdi.c   |  27 +-
  .../platform/chips-media/wave5/wave5-vpu-dec.c     |  51 ++-
  .../platform/chips-media/wave5/wave5-vpu-enc.c     |   2 +-
  .../media/platform/chips-media/wave5/wave5-vpu.c   |  35 +-
  .../platform/chips-media/wave5/wave5-vpuapi.h      |   3 +
  .../platform/chips-media/wave5/wave5-vpuconfig.h   |  16 +-
  drivers/media/platform/chips-media/wave5/wave5.h   |   6 +
  10 files changed, 407 insertions(+), 141 deletions(-)

