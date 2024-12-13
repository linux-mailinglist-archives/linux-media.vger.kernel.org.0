Return-Path: <linux-media+bounces-23392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A089F0CDA
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 14:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50A6283829
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C881DFE1C;
	Fri, 13 Dec 2024 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="b2zk4mpT"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F331DE8BC
	for <linux-media@vger.kernel.org>; Fri, 13 Dec 2024 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094832; cv=pass; b=digF4zQxtK2NqVcKLV08LQXH76Ex+0RAC7DalntyeUAwpDByYmUDCOJSia6+P+m3l4jvOIRI92PT1jA4KAfW867od8hI8XbRWf+VVpKV+Of0wZQNszot2D/voEGyco1g4CBT+WGAdD2iT2lXIjsLzA12nzc/paNR3INUjQxCYIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094832; c=relaxed/simple;
	bh=0W4m0uNg+OWnvUBm/Zogc68qrd8Je3Tq9+Q4Q4NH4kM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPMAh6ZXxyvIUQHMyj2WEBrml3HHiU/8LK0BHqXAPrkxEEaSi3cZSYOSJEw5Ulr+Hx/XRa1UTJQ/9PTNQ1D1r5E2/0MbvNdDnnpBUKuqzcBV3E1TOzf7e1/m7kUMXxfSoXNrUFD1NbmjE4lm9bDDltbHO+QtIGcB2M+khUbG+dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=b2zk4mpT; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1734094829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ez9KjF/Tu+lAnYWwxmpHz8d1e9sLSmx5mvuqOE7rn1Yf5R9OE0wSS+setp1L9df/egdffBK/ZCQPaFjyy+AY84UtN+wGxc0koLAtUlVg63x4Kb+bP3jW8WHCntIkanzvyhiu44sV4MDNkJrr9tiksEJqeqWxqOtsfBkvFFfkN+g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734094829; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=9BYEuDP0AU701jF+Srnk05DhWIa9y41fhUwUAaX1SR4=; 
	b=jQHzf8HD39C0cKOmTQKEhBKcGhXkfbjUTZTcIlMNJ0Np4v0pT/LfUIDiIbS8+ywzqzlH9RPyV+gnUsdPu0eOfaPjkfPaGGkIGLz5uZJZYrCuvXvLVK0WNuxHqEaszFu41W0TCnsqHDkPKUKxCY7Y6hiztR5Y1LZTDfNIzwXHlXA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734094829;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=9BYEuDP0AU701jF+Srnk05DhWIa9y41fhUwUAaX1SR4=;
	b=b2zk4mpTWDic6DvNXfxFm+6NgDy4Hg7CXtUo09+lFUZb2aEdnk0xgg8enr5HS4yr
	6KVG7Eq5aYqHsG5SHXSr2RZnvi9mWEfZIJLYRVCez0kzah2DMB6R08j2E7rsCF+Y7M1
	EmYUd93hP8BNa5i4ldNg8vNbLFenKFNaN/Egs2OE=
Received: by mx.zohomail.com with SMTPS id 1734094826983795.1314585277793;
	Fri, 13 Dec 2024 05:00:26 -0800 (PST)
Date: Fri, 13 Dec 2024 14:00:24 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.14] Various Hantro changes
Message-ID: <20241213130024.wacav6zbxg74ist4@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
X-ZohoMailClient: External

Hey Mauro & Hans,

please pull the following, note that this contains a change to the
MAINTAINERS file.

-------

The following changes since commit 686f27f7ea376ee5001783489c70a6c2e0bfcd6d:

   media: stm32: dcmipp: add core support for the stm32mp25 (2024-12-12 13:22:26 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.14-various-hantro-changes

for you to fetch changes up to 8b1d03e1a95776410a9a4b2c2163bf33842c2adc:

   media: hantro: Replace maintainers (2024-12-13 11:50:45 +0100)

----------------------------------------------------------------
Various small fixes & changes for the hantro decoder driver and a
maintainer change

----------------------------------------------------------------
Benjamin Gaignard (3):
       media: verisilicon: Store reference frames pixels format
       media: verisilicon: Fix IMX8 native pixel-format step values
       media: verisilicon: av1: Store chroma and mv offsets

Nicolas Dufresne (1):
       media: hantro: Replace maintainers

  MAINTAINERS                                        |  3 +-
  drivers/media/platform/verisilicon/hantro.h        |  9 ++++++
  drivers/media/platform/verisilicon/hantro_g2.c     |  2 +-
  .../media/platform/verisilicon/hantro_postproc.c   | 32 ++++++++--------------
  drivers/media/platform/verisilicon/hantro_v4l2.c   | 21 ++++++++++++++
  drivers/media/platform/verisilicon/imx8m_vpu_hw.c  | 10 +++----
  .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |  9 +++---
  7 files changed, 54 insertions(+), 32 deletions(-)

Regards,
Sebastian Fricke

