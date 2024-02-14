Return-Path: <linux-media+bounces-5152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF4854C0B
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 16:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64FFD1C267A6
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 15:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787D35B666;
	Wed, 14 Feb 2024 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I+DyEvjK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595745B20A
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707922854; cv=none; b=mxzBzQbMdX3paekFyJmWqeZex8D0TDfqpb3dhmiImzcSoUaZR0sBWTgL6AO8Pj67zd3JMNPNYQ+bG+Vam/ktRRcSVYhE+oOHidNNAXQWDR6jg8e+tVsothLmBUUlk/XdosH6DqBy7KEXhz3wlj50JV3IT/ybiSgWcmuX2Xnmu8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707922854; c=relaxed/simple;
	bh=NNIIqp1JiE7U6K2gqCzr6T5mMfY/2jLj5BZQ3xXx3jI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sa5HhImvA9ovMj6RYbZVqVe+lsp/n9DtDdIOuzE3RpQazcFAbz/Vf9IfZ5mwgG0S8quTcA8Tnx2sb7iCt72BpWxPhwzJREG7h9/qGmx13OBaZYEscNVTjdUwQigV/x9xkyO52c2GkHvfVdSWm9KxQHzGQ+5rqil44FHWVYlKj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I+DyEvjK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-118-194-nat.elisa-mobile.fi [85.76.118.194])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43700B3;
	Wed, 14 Feb 2024 16:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707922848;
	bh=NNIIqp1JiE7U6K2gqCzr6T5mMfY/2jLj5BZQ3xXx3jI=;
	h=Date:From:To:Cc:Subject:From;
	b=I+DyEvjKNIVXCsep2b27b/YJTuiV501b3dbiqUPnw+dw5ZRykyDZn7wtqkoj366V2
	 ogtBHPA5zeiYaNwBRvqifL2n2Y5de7eaRog3I+cmI6mcH/6wSUlKPuhRNqL7/ItNVa
	 zvVRlPLpRrCyw1x55fo+R0KRn6CNoOB5EbaqDdyg=
Date: Wed, 14 Feb 2024 17:00:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Subject: [GIT PULL FOR v6.9] RZ/G2L CSI and CRU drivers fixes
Message-ID: <20240214150052.GC7120@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5:

  media: edia: dvbdev: fix a use-after-free (2024-02-07 06:06:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-rzcru-20240214

for you to fetch changes up to dc3fe983c419eb683c6b46951e893994d5b7ac1a:

  media: platform: rzg2l-cru: rzg2l-video: Fix start reception procedure (2024-02-14 16:56:00 +0200)

----------------------------------------------------------------
Fixes for the RZ/G2L CSI and CRU drivers

----------------------------------------------------------------
Biju Das (5):
      media: platform: rzg2l-cru: rzg2l-csi2: Switch to RUNTIME_PM_OPS()
      media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
      media: platform: rzg2l-cru: rzg2l-video: Fix image processing initialization
      media: platform: rzg2l-cru: rzg2l-csi2: Restructure vclk handling
      media: platform: rzg2l-cru: rzg2l-video: Fix start reception procedure

 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  3 -
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  | 37 ++++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    | 18 ++---
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 83 +++++++++-------------
 4 files changed, 62 insertions(+), 79 deletions(-)

-- 
Regards,

Laurent Pinchart

