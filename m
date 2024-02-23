Return-Path: <linux-media+bounces-5782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845AE86118C
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 13:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E56E9B217C8
	for <lists+linux-media@lfdr.de>; Fri, 23 Feb 2024 12:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC388C0A;
	Fri, 23 Feb 2024 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="snHzBVU7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245D15B1EB
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708691761; cv=none; b=lcoBvWiB5vt4qxKaXW7SQwBNhq7jMNeiaaNCG+/j1u9YkUoRoIGYEfhLI/oP360UOK886PFVNNb+PkEirfsLciN7iqSFyGjMKVuFZBmsgu0D5l7rLEu4LybuAnnBjOc01ji3Lh9LqHC+JecKLfWpH1vJwj0iwlpQYFeVgow4aBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708691761; c=relaxed/simple;
	bh=9ebNV0083Ib+eFnhMslFUTbitJBsQMoXdO2GMyKenvw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qIA68Dw2exGid8yHwduVXDtdDlyTwXzNoohuUOuybeql1JduQcOYZegpwnEAO7c3PUdze6YK6Id8gFohE89evCdhcjwJzubRpyJp8HIJ1zCzO1V7uTQoUzaCA+XtF4FegNcvlSPKYBMDZFhcBagWc9u1NyO3yzS9wfu64x27V/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=snHzBVU7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB0D9B6
	for <linux-media@vger.kernel.org>; Fri, 23 Feb 2024 13:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708691743;
	bh=9ebNV0083Ib+eFnhMslFUTbitJBsQMoXdO2GMyKenvw=;
	h=Date:From:To:Subject:From;
	b=snHzBVU7GbJTbsBgWSqv/E2eSxU7KTApRVbtShcFOc810CxrFfXhF7oE/+kBwv8w/
	 jtF3vf68fFeTDfu+eXowHqZxIY61kC2QXfPt/v5ZK0XpZWEli6YCmOpag9wJCqjCX1
	 XE6l7QYfm02BX2rpEB8edoQ781rh7Dn/obtcMh1I=
Date: Fri, 23 Feb 2024 14:35:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v6.9] media: rkisp1: i.MX8MP support
Message-ID: <20240223123556.GA26004@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0:

  media: visl: Add codec specific variability on output frames (2024-02-16 11:46:33 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-rkisp1-20240223

for you to fetch changes up to 9f9cd26aec8406bbae42d7d2afe23a5d368b7b9a:

  media: rkisp1: Add match data for i.MX8MP ISP (2024-02-23 14:23:34 +0200)

----------------------------------------------------------------
rkisp1: Add i.MX8MP support

----------------------------------------------------------------
Laurent Pinchart (2):
      media: rkisp1: Add and use rkisp1_has_feature() macro
      media: rkisp1: Configure gasket on i.MX8MP

Paul Elder (10):
      media: rkisp1: Support setting memory stride for main path
      media: rkisp1: Support devices lacking self path
      media: rkisp1: Support devices lacking dual crop
      dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
      media: rkisp1: Add version enum for i.MX8MP ISP
      media: rkisp1: Support i.MX8MP's 34-bit DMA
      media: rkisp1: Add YC swap capability
      media: rkisp1: Add UYVY as an output format
      media: rkisp1: Fix endianness on raw streams on i.MX8MP
      media: rkisp1: Add match data for i.MX8MP ISP

 .../devicetree/bindings/media/rockchip-isp1.yaml   |  37 +++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 216 +++++++++++++++++----
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  35 +++-
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |  71 ++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 131 ++++++++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  36 ++++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  19 +-
 include/uapi/linux/rkisp1-config.h                 |  50 ++---
 8 files changed, 501 insertions(+), 94 deletions(-)

-- 
Regards,

Laurent Pinchart

