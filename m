Return-Path: <linux-media+bounces-7068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0387BD28
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 14:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D51191F24B4B
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 13:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5FBB5B5AB;
	Thu, 14 Mar 2024 12:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VUQlZp2a"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD83C59158
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421189; cv=none; b=r0RYRgHGXNw4KhqBQP+l/eJBxKtCstIk8NKi8kvBlGPBIXVdGtSROCjHiRu2WwmRtLziNBM4dsbQjIrxGczNwVQ3GK49pxEKrYvKHtbpgRTf6N03X70sAxdf3UKiXjcuQW6SVrE46eVOFEoj6SVxzZ69DvEsPmFdA1XQo7tjsXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421189; c=relaxed/simple;
	bh=LKoAMh8+4J5GemhtbJ56AYpcgLK8bJw3jqxkKeBDLe4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uaaZRmVyVgVqFneKa6S/WOGFA++fzdkHp3gQ/er5mtdJJEDr/1Hw5TNFisVaIE7LdJrURZmpviDe/wlxSGlBvaHAaExkdPvvgFwiS2LsVopwKRL1+wKDfWkaPGMeazTHzWHsntaJJj8GXCOC4eERsWojYqPDVz4x/ERXGVerkQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VUQlZp2a; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710421185;
	bh=LKoAMh8+4J5GemhtbJ56AYpcgLK8bJw3jqxkKeBDLe4=;
	h=Date:From:To:Subject:From;
	b=VUQlZp2a5+FX1ess2QcXBILLG8x0Q9XrkYf+sTNpsvyfQcZudDjIR8+s8XL7cIHzJ
	 5jk1RJBKGmQbIn6tzteYloC/nLMaK5PURg9PolQlK7QdsZ6GdW2NnoMeVZ2q0Te4OP
	 upMjdGBse7Z22r1DkCjumpbN95TyMZ8po35O2nggvN03JjHw4uK8NgAeOtFKy5ixmx
	 4uMv7Ak4n339o/Eou0GrHct44jq83azsxAcS1dc1yvg1hiTtMrnuiPdIk4R08UcD7r
	 obJYVS9RHzI3x3QNH0ed6DPoWdgSb7tMcr4orbamTw0k2xk3yXNxwlOfOrma+8J/C6
	 IRMDuBIZ2Dicg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A1A9337820D9
	for <linux-media@vger.kernel.org>; Thu, 14 Mar 2024 12:59:45 +0000 (UTC)
Date: Thu, 14 Mar 2024 13:59:44 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.9] Enable polling in the Wave5 Codec
Message-ID: <20240314125944.zu2vf5oqiglzoqm2@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hey Hans & Mauro,

this patch enables polling with an HRtimer on the Wave5 Codec, the
change is needed because a new hardware emerged with a defective
interrupt line. I have investigated whether a general fake IRQchip could
be implemented for this use case, but it turned out to be not practical
on a general level and on a specific level with a number of
difficulties.

Please pull this change.

The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:

   media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.9-wave5-polling

for you to fetch changes up to 8304af9efccb9f954e8ac74fff376b1fdf303e3a:

   media: chips-media: wave5: Add hrtimer based polling support (2024-03-13 17:16:04 +0100)

----------------------------------------------------------------
Add polling functionality to the wave5 driver

This allows hardware without an interrupt line to work properly.

----------------------------------------------------------------
Devarsh Thakkar (1):
       media: chips-media: wave5: Add hrtimer based polling support

  .../platform/chips-media/wave5/wave5-helper.c      |  17 ++-
  .../platform/chips-media/wave5/wave5-vpu-dec.c     |  13 ++-
  .../platform/chips-media/wave5/wave5-vpu-enc.c     |  13 ++-
  .../media/platform/chips-media/wave5/wave5-vpu.c   | 125 ++++++++++++++-------
  .../platform/chips-media/wave5/wave5-vpuapi.h      |   4 +
  5 files changed, 126 insertions(+), 46 deletions(-)


