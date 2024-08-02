Return-Path: <linux-media+bounces-15724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C170945FBD
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 16:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79651F2229C
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 14:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4E22101AE;
	Fri,  2 Aug 2024 14:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mfFYLjNo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0180A1C693
	for <linux-media@vger.kernel.org>; Fri,  2 Aug 2024 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722610560; cv=none; b=Zy+ZQL+V4ALubI7Ye+PBceM8HBGUtNsSet0cTNYCYWl6kTsuzusEFuISOUA+B1J+pBP7dXCK8sod/cSOS0odSnC/myn4vIo9zKvGP9/SyxvPOtGg4Nch2oeZhr34DzAr39IcJ5grlL0CTriWK16iKemblu8dXu/e6DxvZhO6iu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722610560; c=relaxed/simple;
	bh=zDyWYZMGcS1kSvCDQGD1a46cmobNtYFJK5IqcI5xBQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AIOWo/F0ekZKB4kAvnJlQAGF8XUTe+brRZ3j6ZbXohqrY2htD9BObOD8RPVsk8Nn7f4Zl08Z7kA1L/mge4uPZrwMV8iAiDs5bWJ0Vz0FS88IjivUwl60oa0ScBsGrP3nsT4d137E8TGBy/T70XDn1mNcYSUyo/qwKXHnrKOSu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mfFYLjNo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E94F2524;
	Fri,  2 Aug 2024 16:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722610508;
	bh=zDyWYZMGcS1kSvCDQGD1a46cmobNtYFJK5IqcI5xBQs=;
	h=Date:From:To:Cc:Subject:From;
	b=mfFYLjNoPEfLrkakxo7jI8CrBOm006ipw/trLSEmO0m3ihKvs9vWLEvCmlJEFhwaD
	 EGOuedr5XRf5uhjomJUdQQN5oFfGJZUYYuK68s+vjFF5TizozWP0PGbCad/Y4+L7ta
	 4tGtGn08icgRyHJHuQnBk+Uz2boBjU6S/B1dqREk=
Date: Fri, 2 Aug 2024 17:55:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [GIT FIXES FOR v6.11] uvcvideo fix
Message-ID: <20240802145536.GA31873@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 68a72104cbcf38ad16500216e213fa4eb21c4be2:

  media: raspberrypi: Switch to remove_new (2024-07-12 10:11:43 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/fixes-media-uvc-20230722

for you to fetch changes up to 66558537cb8c7485cf2d43b3880395c81218ec12:

  media: uvcvideo: Fix custom control mapping probing (2024-07-22 15:22:20 +0300)

----------------------------------------------------------------
uvcvideo v6.11 regression fix

----------------------------------------------------------------
Ricardo Ribalda (1):
      media: uvcvideo: Fix custom control mapping probing

 drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
Regards,

Laurent Pinchart

