Return-Path: <linux-media+bounces-16716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264695E069
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 01:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90AB282288
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 23:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F11A1442EA;
	Sat, 24 Aug 2024 23:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RdTv/kIu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA613B29F
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 23:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724542994; cv=none; b=LWG2zKRYxUtud0Z3/jrAMU5FcM6qhs0YyfOm/MmhaEOZhXjC7WHOIMR5+NoCt1JZoD7IDHOz8rtVwsntZf+36Z8hB5ZBCPcnowMBo2/vWmurvLVpnTuh7hzqWONdGiCg2WKD6Jicgqfq1cJVBHaA0/57RK9O/SSxj6XxvQboH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724542994; c=relaxed/simple;
	bh=ChjG6Rg6XzBm9yGLZZnY4wL1N6sG/czP66VMtlrUmxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aEHLRb9jb+pJoG4FH16xkoFXjS3ZL3VzECND+hEBm4fKzNQ5cBjG9QN+hYuhA844tUp5RpCjqGM0aJZ2Fj+N9fPWJtPJ5ogWKfZMKkHlVwoKwcm+nSnyyukgAYiUdHKLb6WPluR4ypVviHeLgCPZMZGaSOkptfG7mpJKt9xRhDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RdTv/kIu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6521E3D6;
	Sun, 25 Aug 2024 01:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724542926;
	bh=ChjG6Rg6XzBm9yGLZZnY4wL1N6sG/czP66VMtlrUmxE=;
	h=Date:From:To:Cc:Subject:From;
	b=RdTv/kIujKomb+KG0iWsm8S8Gmfpdz2lrwND9zjGWQE2Jje2TjPk7XiFx8YIkfVbQ
	 N/qXpXAyWAjwLIuletRJUmWydJtGB9S9XSBAYpnfoDHmmlbE6BWtp59tbS0OTHRLnK
	 bqhWW3HlRdTfUD1ycoxsg73KGijc7wGkTaO38nJg=
Date: Sun, 25 Aug 2024 02:43:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v6.12] Miscellaneous Renesas patches
Message-ID: <20240824234307.GC9543@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Mauro, Hans,

The following changes since commit a043ea54bbb975ca9239c69fd17f430488d33522:

  Merge tag 'next-media-rkisp1-20240814' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-14 17:18:47 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-renesas-20240825

for you to fetch changes up to 89dd679303f4b4a76204c2269a7724b545cd84df:

  dt-bindings: media: renesas,vin: Add binding for V4M (2024-08-23 16:55:41 +0300)

CI has passed: https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1256968.

----------------------------------------------------------------
Improvements to Renesas media drivers:

- R-Car V4M support for VIN
- Fix rzg2l-csi2 module auto-loading

----------------------------------------------------------------
Biju Das (1):
      media: platform: rzg2l-cru: rzg2l-csi2: Add missing MODULE_DEVICE_TABLE

Niklas Söderlund (3):
      dt-bindings: media: renesas,vin: Add Gen4 family fallback
      media: rcar-vin: Add family compatible for R-Car Gen4 family
      dt-bindings: media: renesas,vin: Add binding for V4M

 .../devicetree/bindings/media/renesas,vin.yaml      |  4 ++++
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 21 +++++++++------------
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  1 +
 3 files changed, 14 insertions(+), 12 deletions(-)

-- 
Regards,

Laurent Pinchart

