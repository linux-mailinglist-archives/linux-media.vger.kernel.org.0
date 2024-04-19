Return-Path: <linux-media+bounces-9762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E78AACF2
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 12:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA761F21D81
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 10:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F8A7E776;
	Fri, 19 Apr 2024 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nUM84254"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D6C762E5
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713523113; cv=none; b=b8eJHWLOaj+GhAJ9ybqMN4YUta9xfrQ6hpfwbsrJKxDAXz+A79yCzkK2nMULvPOSQIRJTKuOJSDQ/WFq/uzUJfRr71lE0pQ6HuBa2tK1Y9kq5OJ29pE6JJ0oRA8m7vyZQFKFgZG/EFGMBRgkYGhiz2UqEZeT7Tb4Z5vO9IC0bjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713523113; c=relaxed/simple;
	bh=gcYrw9C9L/wQaU4ImfXXSgWrJXmTHbFFdWyR2helohE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z3hWfi3l9XaGRe6AaOcMfn/Coep9h0g17r8BHoU26DDevdABVTVti9Rch0OY9CLPU+bfSIBE2InX4B74e2nD+XkG+H8PucvhQ7RQWKOI82hZy3ok1MoNz4Zi78Ccnm8nGrN2xeuoxmxMww374ldySQcIS/rJ2ExydeiatALAFSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nUM84254; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0251063B
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 12:37:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713523062;
	bh=gcYrw9C9L/wQaU4ImfXXSgWrJXmTHbFFdWyR2helohE=;
	h=Date:From:To:Subject:From;
	b=nUM84254ff58LOI0eewrGiZih9/TbDQzxki3LlACWBVYVIrNxDlAu+/++64JRj8Jk
	 8G3JjjYQNizNtX9oz9FqAnALGAjABk6AJzVFA+PmzstOcdqXiK0+rGITpz6NXCGUoc
	 3Wvt4UycVzpJ3lO7F7saeprM+km91uHEnzioAweY=
Date: Fri, 19 Apr 2024 13:38:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v6.10] NXP media drivers enhancements
Message-ID: <20240419103822.GA6868@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit 836e2548524d2dfcb5acaf3be78f203b6b4bde6f:

  media: usb: siano: Fix allocation of urbs (2024-04-16 00:02:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-imx-20240419

for you to fetch changes up to 459a5cb152047448c8b8bdc73dd3e2519e36db0b:

  media: dt-bindings: nxp,imx8-isi: Refuse port@1 for single pipeline models (2024-04-19 13:34:40 +0300)

----------------------------------------------------------------
NXP media drivers improvements

----------------------------------------------------------------
Alexander Stein (1):
      media: dt-bindings: nxp,imx8-isi: Refuse port@1 for single pipeline models

Stefan Klug (1):
      media: mipi-csis: Emit V4L2_EVENT_FRAME_SYNC events

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  1 +
 drivers/media/platform/nxp/imx-mipi-csis.c         | 34 +++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

