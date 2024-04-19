Return-Path: <linux-media+bounces-9766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C43558AAED2
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 14:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80F4E282BEC
	for <lists+linux-media@lfdr.de>; Fri, 19 Apr 2024 12:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2AB85643;
	Fri, 19 Apr 2024 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MR3Cy1rP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F12D4D137
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713531121; cv=none; b=AU7ZTOU88O1jsH5zc1/ibhTeAw64WR7N/g23m8ZhmU1+2rNI0ZTOPfm3Qgd221G7JxbbMT9I9LWLcw++FxkqQnyp0CLFRz5nupGM8YBKo37ci/JK4vZYWU3HmD/X/5lYpOFb/yogZGRNcrWAW2zm0zWsFGctfp/T7XI5hKtOW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713531121; c=relaxed/simple;
	bh=e0vcUAGOL4SZljfC9R4Wo5bCFHAYcJ5icsyMFCyTilg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqTp2GOUxNH9CMQxc0Rjz85CDrbOmd6kb9jlgmWetNh2OWh0yKqeNobSMcEw1EP/S9PiTSPYcfRpZJcuxZIKiXdfDOKHmDjOguz3QHE4czm4W4P339Kua967givzheVOzRkbkNWcF+92NDQVdtr9w6wUF/UBIN3LN6DrjE0OMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MR3Cy1rP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0452A802
	for <linux-media@vger.kernel.org>; Fri, 19 Apr 2024 14:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713531069;
	bh=e0vcUAGOL4SZljfC9R4Wo5bCFHAYcJ5icsyMFCyTilg=;
	h=Date:From:To:Subject:From;
	b=MR3Cy1rPMwpjIUzpFPIzvhMtzm1NPChSAj0borJytzs4kWZagW3/+RdR02kUlz05k
	 gzOziuZRfnreEj+/18odISDRJc8p78rQ1uq4kbLUx61flChlz04rjesD/ObBhuUuoB
	 +kG25MROxbkaLy9R3+iO1jjIqVhxRxo4QvJlNzkM=
Date: Fri, 19 Apr 2024 15:51:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v6.10] uvcvideo fixes
Message-ID: <20240419125149.GA2125@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

The following changes since commit 836e2548524d2dfcb5acaf3be78f203b6b4bde6f:

  media: usb: siano: Fix allocation of urbs (2024-04-16 00:02:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-next-uvc-20240419

for you to fetch changes up to 3de6df64f92d8633eb51a5e957ffc43ebdb2156e:

  media: uvcvideo: Disable autosuspend for Insta360 Link (2024-04-19 13:48:38 +0300)

----------------------------------------------------------------
uvcvideo fixes

----------------------------------------------------------------
Ricardo Ribalda (3):
      media: uvcvideo: Add quirk for Logitech Rally Bar
      media: uvcvideo: Fix power line control for Shine-Optics Camera
      media: uvcvideo: Disable autosuspend for Insta360 Link

 drivers/media/usb/uvc/uvc_driver.c | 54 +++++++++++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h   |  2 ++
 2 files changed, 55 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

