Return-Path: <linux-media+bounces-22644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5939E44EA
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 20:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7057F167253
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 19:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5D71E2306;
	Wed,  4 Dec 2024 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YXxjP0s9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D934B1A8F70
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 19:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341194; cv=none; b=Me26++/B77S5UAHdsSvdmzwgExfqqJF+9rxhNLKy1dVuCedsn6u5P6JQ7zGeosptAyxrBFw3mmDeLUjP/YPfcd3EEbtzONMjb85S6KveuxvOUSuzt+08yoDjFrAJioyr+Ico/EpeO/hhd/R7pE+kl5RtmEPpn5RUavwMbDSGhr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341194; c=relaxed/simple;
	bh=XTP7TXC1yxJxGUFuda3bJvq5NFvwYmpQzVdrR0aFLnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctGwhS1NddjWdOzMK9ayHI8Ua06Q/H/mZiqsJhPzdUfVVpJ53CMls6/QaYPG0320cY5E9Grp0ulU9XLHkaGuujwf5jeulir3bM3ktHT+5PdseMxrs+88Q0E9sGVhxom6H9i96VA7f6eftV+Qe0eT7IIJpcD1DDaMoIq2mILaCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YXxjP0s9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85DA44D4;
	Wed,  4 Dec 2024 20:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733341159;
	bh=XTP7TXC1yxJxGUFuda3bJvq5NFvwYmpQzVdrR0aFLnI=;
	h=Date:From:To:Cc:Subject:From;
	b=YXxjP0s9c/bnUt340i/4zbujaDsQxt/dCE8+9+RafQ5JMumXz/R4RQ2BKKtt6JiPR
	 WPQrLeqmaplG3qPuu38l8Wo+/gfhTWbVNaML+G8GRUstfxHS/cAdgXGM1thOH9IRPT
	 rnf1ZlFWGkm9CDR3pvzqBvMFyKQiE5Ltnd/vX8ng=
Date: Wed, 4 Dec 2024 21:39:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
Subject: [GIT PULL FOR v6.14] rkisp1 miscellaneous changes
Message-ID: <20241204193935.GE10736@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hans, Mauro,

Ricardo asked for a pull request that can stay on the list for a week
before being processed (I assume for CI testing purpose), so here's one.
It's a real pull request, but it doesn't need to be merged urgently (as
long as it makes it to v6.14).

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-rkisp1-20241204

for you to fetch changes up to edb4d6ac547664c6e0b8bcc0f4f7a99212b2ff9b:

  media: rkisp1: Reduce min_queued_buffers to 1 (2024-12-04 19:03:08 +0200)

----------------------------------------------------------------
Miscellaneous small changes to the rkisp1 driver

----------------------------------------------------------------
Dheeraj Reddy Jonnalagadda (1):
      media: rkisp1: Fix unused value issue

Jacopo Mondi (1):
      media: rkisp1: Reduce min_queued_buffers to 1

 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 4 +---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c     | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
Regards,

Laurent Pinchart

