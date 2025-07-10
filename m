Return-Path: <linux-media+bounces-37284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89BB000B1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55C9E3A7E8F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7A32405E4;
	Thu, 10 Jul 2025 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mR57qplp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B4238C25
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752147575; cv=none; b=O1B0wjbnPrfZH9jJGY9pg8EgEW0SotJYixmbz5aqL/rgkIbTz+D+mwj369GKQH/3BsEIe2ZVw33FXHUCh0OeEdN9xB3pWiMQCtbSikAAppkpkoCvQg3S7jca7NKrnBHDZFZFaAIAEDL8RS5ku/DsLYQK32Exw4tgJ66HN3qfPoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752147575; c=relaxed/simple;
	bh=t4edEHjc75vrOGDW8Yp/MvFb6bvwjz3lGFEnsFUGTQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iq4r/aX978z8hkKTl410kinZ35Mxpz4zfHpkLxljPSYltvc/HI/7REB5MW/+Hzv+r+AZ23fM6AEoCI/q40shqFB6nSMl352lwD1Uqsq/0XvtVKROr2GZ7yQEIKiO8bDQSaRgb+rmDW88Bsim1c4OgaEWURZSyVJ/DTuotBDgqWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mR57qplp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A35E97E4;
	Thu, 10 Jul 2025 13:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752147537;
	bh=t4edEHjc75vrOGDW8Yp/MvFb6bvwjz3lGFEnsFUGTQk=;
	h=Date:From:To:Cc:Subject:From;
	b=mR57qplpyI1yYLnabmcPVl1ysaBeY/leh4hvI5+4M9Hw8AZ8h25pq/e6LDvPWn+ht
	 2kgQVtUNO91WfYIM6lOjpbVL3gdy5ODkdIHAQYZYQaGSULQR/CwpMZSC7neH5JXIIS
	 GKwT+krQqhN7Rdhctl3lYm3fjauAryvqZe9nd2UU=
Date: Thu, 10 Jul 2025 14:38:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [GIT PULL FOR v6.17] Miscellaneous change
Message-ID: <20250710113856.GA31774@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Hans, Mauro,

The following changes since commit 3e43442d4994c9e1e202c98129a87e330f7faaed:

  media: vivid: fix wrong pixel_array control size (2025-07-08 09:02:38 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-misc-20250710

for you to fetch changes up to 5f45b4001214a7cd1c569de8f923c6f739c4240e:

  media: imx8mq-mipi-csi2: Fix error code in imx8mq_mipi_csi_parse_dt() (2025-07-10 14:05:06 +0300)

----------------------------------------------------------------
Miscellaneous linux-media changes:

- Drop v4l2_subdev .g_pixelaspect() operation
- Small driver fixes

----------------------------------------------------------------
Dan Carpenter (1):
      media: imx8mq-mipi-csi2: Fix error code in imx8mq_mipi_csi_parse_dt()

Niklas Söderlund (3):
      media: adv7180: Remove g_pixelaspect implementation
      media: adv748x: Remove g_pixelaspect implementation
      media: v4l2-subdev: Remove g_pixelaspect operation

Tomi Valkeinen (1):
      media: rcar-csi2: Use the pad version of v4l2_get_link_freq()

 drivers/media/i2c/adv7180.c                   | 16 ----------------
 drivers/media/i2c/adv748x/adv748x-afe.c       | 17 -----------------
 drivers/media/i2c/adv748x/adv748x-hdmi.c      | 10 ----------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  2 +-
 drivers/media/platform/renesas/rcar-csi2.c    |  4 +++-
 include/media/v4l2-subdev.h                   |  3 ---
 6 files changed, 4 insertions(+), 48 deletions(-)

-- 
Regards,

Laurent Pinchart

