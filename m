Return-Path: <linux-media+bounces-16162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0094FA23
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 01:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0880D2828C8
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 23:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB8718C354;
	Mon, 12 Aug 2024 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G1fEBUHd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FFD1487F9
	for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 23:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723503979; cv=none; b=WN1V9hul5X1dM+QZxcYlduJUy+93pNJY5+jhyWI5kwGmYAnSj8BunkftmWzDq2nLrXLQQD14W6lkg0JLax0XFF7iSVxDuppBlbrLARuz2ggRGXZRuQpaYpUlzc+lhjooezHvacacllOeNElNRjWShNgpOUQEiNr6U2SJ+J7R2hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723503979; c=relaxed/simple;
	bh=j9ZKbAkYFfyZtEP745xegOpdtJC9TAFxGDeEdiULgs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nbs38QZ3OXP67C3GRBl7B4Pzv8Dn+RGfm62csSbP420dKCDtVz00SkzFYvOlGVoZ8IqmI1brzVRWCyGot24puJpfUfNObACMIA0Vs1NYu6r3cgKWZynUTvVkn0OwzFrvDV0WUIiHXuaj91bFKrmsKXzFJrmY6Q+omMzqDQxhtEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G1fEBUHd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA6F045A;
	Tue, 13 Aug 2024 01:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723503913;
	bh=j9ZKbAkYFfyZtEP745xegOpdtJC9TAFxGDeEdiULgs8=;
	h=Date:From:To:Cc:Subject:From;
	b=G1fEBUHdBSOd6AKEEqRT/VhfitkQT7gpskw/O/pPETnRFL16HrQBA0ERIhZFDT3b2
	 ATWeLk2GHVva9UvLdZj+SIZM5ysn9WmbfxN1bdTDQRIVaKrT4kGJyc8s4PEuFBbDVz
	 3Nf75BLo6/lVqdc1LNuc0hZH7KKYUtpGsgYwqR+g=
Date: Tue, 13 Aug 2024 02:05:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v6.12] rkisp1 extensible parameters format
Message-ID: <20240812230545.GA2358@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit c80bfa4f9e0ebfce6ac909488d412347acbcb4f9:

  media: ti: cal: use 'time_left' variable with wait_event_timeout() (2024-08-09 07:56:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-rkisp1-20240813

for you to fetch changes up to 32be6029c1c1e8c628077403b2096e9d9085f6c8:

  media: rkisp1: Add support for the companding block (2024-08-12 13:36:50 +0300)

----------------------------------------------------------------
Extensible parameters support for the rkisp1 driver

----------------------------------------------------------------
Jacopo Mondi (7):
      media: uapi: rkisp1-config: Add extensible params format
      media: uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
      media: rkisp1: Add struct rkisp1_params_buffer
      media: rkisp1: Copy the parameters buffer
      media: rkisp1: Cache the currently active format
      media: rkisp1: Implement extensible params support
      media: rkisp1: Implement s_fmt/try_fmt

Laurent Pinchart (2):
      media: rkisp1: Add helper function to swap colour channels
      media: rkisp1: Add features mask to extensible block handlers

Ondrej Jirman (1):
      media: rkisp1: Adapt to different SoCs having different size limits

Paul Elder (3):
      media: rkisp1: Add register definitions for the companding block
      media: rkisp1: Add feature flags for BLS and compand
      media: rkisp1: Add support for the companding block

 Documentation/admin-guide/media/rkisp1.rst         |   11 +-
 .../userspace-api/media/v4l/metafmt-rkisp1.rst     |   57 +-
 .../media/platform/rockchip/rkisp1/rkisp1-common.c |   14 +
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   49 +-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |    5 +-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   15 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    9 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 1037 ++++++++++++++++++--
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |   23 +
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    4 +-
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |   51 +-
 drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
 include/uapi/linux/rkisp1-config.h                 |  578 +++++++++++
 include/uapi/linux/videodev2.h                     |    1 +
 14 files changed, 1689 insertions(+), 166 deletions(-)

-- 
Regards,

Laurent Pinchart

