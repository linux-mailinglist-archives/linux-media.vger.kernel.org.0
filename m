Return-Path: <linux-media+bounces-3683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A382D763
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 11:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 689241F2211D
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 10:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACAD1426C;
	Mon, 15 Jan 2024 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pfR9D4MM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E44101E3
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 10:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E39F4326;
	Mon, 15 Jan 2024 11:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705314557;
	bh=2T7f2438772OFGVL5IBvxzEQ1k+PrW13zdRkxCWvc2o=;
	h=From:To:Cc:Subject:Date:From;
	b=pfR9D4MMnL1XYpU7Ukx5xj7Kpry6e6P7cPqoSAFJYxwTUyqe3qJ8bFb5uorCsi9v1
	 SRQ6WpkQ6xCaIUpkmPlPKYnED/B0TFgOBMW9gKc5bBsmQ/wzOwSK4lxtM6w1boVHUK
	 FRizwZo+EUJ56EPu+yitRVomUziy+ZxVBhytjjDM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Purism Kernel Team <kernel@puri.sm>
Subject: [PATCH 0/7] media: Fix mishandling of MEDIA_PAD_FL_MUST_CONNECT flag
Date: Mon, 15 Jan 2024 12:30:22 +0200
Message-ID: <20240115103029.28055-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series fixes mishandling of the MEDIA_PAD_FL_MUST_CONNECT
flag.

The issue has been introduced in commit ae219872834a ("media: mc:
entity: Rewrite media_pipeline_start()") when reworking the media
controller pipeline validation code. It is known to cause crashes in the
imx-mipi-csis driver (see [1]) and most likely affects multiple other
drivers. Patch 1/7 and 2/7 fix the problem.

Patches 3/7 to 7/7 fix an additional related issue affecting the
imx8-isi driver. It is however not a regression introduced by commit
ae219872834a. The problem causes a NULL pointer dereference when
enabling streams if the pipeline is configured with the imx8-isi
crossbar sink pad not being connected. Patch 3/7, initially submitted by
Marek, fixes the issue in the imx8-isi driver itself.

As the problem is very similar to what the MUST_CONNECT flag was
designed to handled, I considered the bug to be better solved by using
the MUST_CONNECT flag in the imx8-isi driver. This requires expanding
the purpose of the flag (patch 6/7), after a few drive-by fixes and
reworks (patches 4/7 and 5/7). Finally, patch 7/7 sets the MUST_CONNECT
flag in the imx8-isi driver, effectively reverting the changes from
patch 3/7.

I have decided to still include patch 3/7 in the series, as in the even
that the changes in patches 4/7 to 7/7 were to be reverted later (or
simply require more discussions and new versions), patches 1/7 to 3/7
could be merged without delay and fix the issue for users.

[1] https://lore.kernel.org/linux-media/7658a15a-80c5-219f-2477-2a94ba6c6ba1@kontron.de

Laurent Pinchart (6):
  media: mc: Add local pad to pipeline regardless of the link state
  media: mc: Fix flags handling when creating pad links
  media: mc: Add num_links flag to media_pad
  media: mc: Rename pad variable to clarify intent
  media: mc: Expand MUST_CONNECT flag to always require an enabled link
  media: nxp: imx8-isi: Mark all crossbar sink pads as MUST_CONNECT

Marek Vasut (1):
  media: nxp: imx8-isi: Check whether crossbar pad is non-NULL before
    access

 .../media/mediactl/media-types.rst            | 11 +--
 drivers/media/mc/mc-entity.c                  | 93 ++++++++++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  4 +-
 include/media/media-entity.h                  |  2 +
 4 files changed, 78 insertions(+), 32 deletions(-)


base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
-- 
Regards,

Laurent Pinchart


