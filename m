Return-Path: <linux-media+bounces-1947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143A80A47B
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E747281BE2
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 13:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1F51D528;
	Fri,  8 Dec 2023 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cW+bbEMs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B19115
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 05:33:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4424D49
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 14:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702042384;
	bh=5baprotWlig5IS41mK9rfNFfqpfEQnllJDbA02YrFlE=;
	h=Date:From:To:Subject:From;
	b=cW+bbEMsPWUpbuAgQA/2CJz4REiyN4pEMpiBjqa0yfkO7ziKs4De/VMbfI0wHiieE
	 C8B3hjjvyptpRTMmke9tLgv8zrrjKNHB5T9vHZt/92/2TR8YHL6mDoe8x7K0fzkRI5
	 c2EUza0uFY5cYXYnzU4qf9MMXzXSltjhu9UWuehU=
Date: Fri, 8 Dec 2023 15:33:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.8] uvcvideo changes
Message-ID: <20231208133352.GA12450@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

The following changes since commit e55a9482888da73eeadde5f13ef8bafce68a38ed:

  media: ov9640: Don't set format in sub-device state (2023-12-08 10:04:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-uvc-next-20231208

for you to fetch changes up to 3fae266fa64f31a846e09af2be8e02bc413392fd:

  media: uvcvideo: Fix power line control for SunplusIT camera (2023-12-08 13:22:29 +0200)

----------------------------------------------------------------
Miscellaneous fixes for the uvcvideo driver

----------------------------------------------------------------
Laurent Pinchart (1):
      media: uvcvideo: Pick first best alternate setting insteed of last

Ricardo Ribalda (2):
      media: uvcvideo: Fix power line control for a Chicony camera
      media: uvcvideo: Fix power line control for SunplusIT camera

 drivers/media/usb/uvc/uvc_driver.c | 18 ++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  |  2 +-
 2 files changed, 19 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

