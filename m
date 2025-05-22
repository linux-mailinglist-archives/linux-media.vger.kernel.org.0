Return-Path: <linux-media+bounces-33163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E306AC0F99
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC36F1B6589E
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECB42900BF;
	Thu, 22 May 2025 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZnjC3QpF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB6D28FFF0
	for <linux-media@vger.kernel.org>; Thu, 22 May 2025 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926719; cv=none; b=Epl5Hbz8Ljgn1D8FZzDO/uN1xfYOJGxNYj1JoJ+LjOOpLtC99G9TfDMrF1pj0WlEFzH5/NbkBx0ngt3t8BmJhD5FF/Z8XOb/oh7TC6wvPzMgLNNP1/ioZZIwgdo1dAVASRogdZHbR4wATJXSRvjwtqyOeyMum9WWhisS/VjfnKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926719; c=relaxed/simple;
	bh=btoWRSJKO+dK9LY+uanPmK5o4UNbVfmlEw5MxPRgIbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fv0O/xcZcrHFyVtLKzhHrSROyerv3J8ToNOAUZYcnvrEW10ZUt+Vo6TUWoKPUz3e9HmkDh2gkLBcVRgLaf0g+sQ0J3Ej5nXeKVsqrcFNdQlUjUTMp01BsDlA+WWu20l23R5AkB/l7s2ZRoYolBnYocfaFtY/x1U66ViTT1Fpk5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZnjC3QpF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:30c3:8bbb:632f:b0c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA6938FA;
	Thu, 22 May 2025 17:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747926694;
	bh=btoWRSJKO+dK9LY+uanPmK5o4UNbVfmlEw5MxPRgIbk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZnjC3QpFYcDj6M1xRfvWAVbFExjF8xQc5uB7+gohu/B80omw3KMiWi8Ik0DqseshO
	 TsYplKm9DdyyJ+OXjTH+Iqm6Sy8ZouHLTyR5qvpw3ji/cNhWJ/nZTiLfkVUKezmA9s
	 6eZllKNAydmupIFZcZHaTmD4UzlHlHMVAcbH4MNY=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [PATCH 0/3] media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS ctrl and WDR support
Date: Thu, 22 May 2025 17:08:37 +0200
Message-ID: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series adds RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control to query the
parameters blocks that are supported by the current kernel on the
current hardware. This is required to be able to enable/disable the
corresponding algorithms in user space without relying solely on the
kernel version.

In addition to that it includes the WDR patch by Jai which is already in v5 and
was reviewed here:
https://lore.kernel.org/linux-media/20250521231355.GN12514@pendragon.ideasonboard.com/

Patch 1 is only a small preparatory cleanup. Patch 2 adds the
RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control and patch 3 adds WDR support.

It is based on v6.15-rc7

Best regards,
Stefan

Jai Luthra (1):
  media: rockchip: rkisp1: Add support for Wide Dynamic Range

Stefan Klug (2):
  media: rkisp1: Cleanup error handling
  media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control

 .../platform/rockchip/rkisp1/rkisp1-common.h  |   2 +
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 152 +++++++++++++++++-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  99 +++---------
 include/uapi/linux/rkisp1-config.h            | 102 ++++++++++++
 include/uapi/linux/v4l2-controls.h            |   6 +
 5 files changed, 283 insertions(+), 78 deletions(-)

base-commit: a5806cd506af
-- 
2.43.0


