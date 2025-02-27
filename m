Return-Path: <linux-media+bounces-27160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 228FDA47C7A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 12:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D19EC18914BC
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 11:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A1C229B23;
	Thu, 27 Feb 2025 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U2/9bzRL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1F815442C;
	Thu, 27 Feb 2025 11:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656821; cv=none; b=gHpxiltQ3QFovENc2Bp/1qt8iU/Xcl/P0apb7jHTAwlUna2TE7XRtLL0PS+2J8tiCB83RBq1Xdl5Z2SZl9Pa9B2B6GsuIVA+VHyBXXTVG67xFLlFAjYD2cGSyeDof+8YN2sxrxW82wPRmPldp+t6AfZOn+xGeMzY2tyuDTl2Ol4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656821; c=relaxed/simple;
	bh=m0byIXM8l1cSjYztsjedplkoLC9ZBtvnC08V8sv8PfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svTh0NFvV+b4tzHO6JXJVoPZ5wXujtlT+jVX1Mb6Jn5OK1QrxHYpRF/XrbMINeRxGL2Imk8DdSWnrI+Go/UVj8oTIgJVLvXpbNv3voEJc1vOJojtdjaO/BbbfjsqAZUJvaAJw8lKrW/gnqfSDlWfuu0CSRvlEkd9VqaCroNf734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=U2/9bzRL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a3f5:6799:2ce9:5b66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C1906A6;
	Thu, 27 Feb 2025 12:45:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740656728;
	bh=m0byIXM8l1cSjYztsjedplkoLC9ZBtvnC08V8sv8PfM=;
	h=From:To:Cc:Subject:Date:From;
	b=U2/9bzRLid0pBsKRIyD9nae+aOeDLTcv4guOuQog4GnnVNNw17mnTz34zBreMfu1P
	 pUl8GEg2EhwH2JmV8vjxLqSalGj/ReCv6zNxKlWzjq9FxmXVY6F9rOaAYad74LIjYR
	 NRf7ES2BoZEwRAIRSHjmza5UGnxgB7e2hFR1o0HQ=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Fix full range quantization on rkisp1 based devices
Date: Thu, 27 Feb 2025 12:44:58 +0100
Message-ID: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

After I sent a patch too early yesterday, I'm sending the corrected
version now. This series fixes two issues with the rkisp1 driver and
full range quantization. It was developed and tested on a imx8mp board
(Debix Som). With the current code it is impossible to get full range
YUV data by selecting color space JPEG (fixed by patch 1). But even
explicitly setting the range to full range results in image artifacts
due to incorrect range handling in CPROC (fixed by patch 2).

Please see the individual patches for more details.

Best regards,
Stefan

Stefan Klug (3):
  media: rkisp1: Set format defaults based on requested color space
  media: rkisp1: Fix the quantization settings of CPROC
  media: rkisp1: Remove unnecessary defines

 .../media/platform/rockchip/rkisp1/rkisp1-isp.c   | 15 ++++++++++++++-
 .../platform/rockchip/rkisp1/rkisp1-params.c      |  8 +-------
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h  |  7 -------
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.43.0


