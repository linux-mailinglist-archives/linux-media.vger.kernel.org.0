Return-Path: <linux-media+bounces-5969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD16867989
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 16:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81A3F1F2587B
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 15:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F370133417;
	Mon, 26 Feb 2024 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TWG/pSCR"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049E1332BB
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 14:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708959000; cv=none; b=ScBqtTB++YTxW3z7bdhWxjrct0RUiLijX4drmBHmb5FbYWr7Ux8A4l1s+hv48TILQ1N+Fv8Vcq6t5D8kXUlRm6TNbZDvUAgtd1dpVUcuhbsvYJ5S6+9IrNTknPiJPwFuolaQos07o/LNvfjDk4Wc7Kc0+DWN93uiS4yaoCR8SgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708959000; c=relaxed/simple;
	bh=oHkPxSIyepKROhyt/dK17UYbHVUuftWr9+KWOmCk0Qw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFjsFTgu07jxF5rUoaXzCuxQ5oScQvQuiDmrxVPaSOyVTLDG0hqqyqlpd0+q4Qb7CeUfkKsD8M11GRE21ZFjv/GZvH9JqGU1BEinr+z4IgeG+FOPO68PI4l27U1Q7E+H/hPPIEjUmq0qQ6srDcB4XZVDkwyE1VbxkxEHrHY58qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TWG/pSCR; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708958994;
	bh=oHkPxSIyepKROhyt/dK17UYbHVUuftWr9+KWOmCk0Qw=;
	h=Date:From:To:Subject:From;
	b=TWG/pSCRCb1yYmVO5p8AY3G0rT1j+H5fqGfSfSSMezLNDvT8/Y1M4fZrPP+OUTKa5
	 vZi6l2c7bfxHK3Amc7lqN2P9E9vkQGdqcDKGX83FQrP12sxQEJAoAibQuTcpb9jFuP
	 3vXVn2T2wd1GqxDh1s9ji3kkRWQ541pVs4F58KtgWHzd+KAgBXOto4esskY/ovsDFq
	 c82aS4hl7jWQh3EcGexMcppG1c1SNXqfzgF73llFXLrDBNmbsiduErJOfnQ0kp8zdw
	 jpnCCPoosOAL8cdteVOMG2jO3GsCrAVZDKoCoxPvfnX8K25z8cbN9jekA0+MW0F4Y8
	 5ftg1RYYbZFzg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E2823780BFE
	for <linux-media@vger.kernel.org>; Mon, 26 Feb 2024 14:49:54 +0000 (UTC)
Date: Mon, 26 Feb 2024 15:49:53 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] Small Wave5 Fixes
Message-ID: <20240226144953.5rmmqspzwggovzby@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hey Hans & Mauro,

here two very minor changes for Wave5, the 2nd patch by Uwe is only one
part out of 5 from this series https://patchwork.linuxtv.org/project/linux-media/list/?series=12307

Please pull.

The following changes since commit cecce089b92f52888160b0d9bc53fc191c0d08d3:

   Merge tag 'tags/media-next-rkisp1-20240223' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git into media_stage (2024-02-23 15:17:10 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-wave5-fixes

for you to fetch changes up to 1cc5ba04cfd6b344ec7e220ab633df06b0798ff0:

   media: chips-media: wave5: Convert to platform remove callback returning void (2024-02-26 14:47:21 +0100)

----------------------------------------------------------------
Very minor Wave5 fixes

----------------------------------------------------------------
Thorsten Blum (1):
       media: chips-media: wave5: Remove unnecessary semicolons

Uwe Kleine-König (1):
       media: chips-media: wave5: Convert to platform remove callback returning void

  drivers/media/platform/chips-media/wave5/wave5-hw.c      | 2 +-
  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 2 +-
  drivers/media/platform/chips-media/wave5/wave5-vpu.c     | 6 ++----
  3 files changed, 4 insertions(+), 6 deletions(-)

