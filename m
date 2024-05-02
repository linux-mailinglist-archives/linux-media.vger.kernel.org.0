Return-Path: <linux-media+bounces-10590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1358B98BC
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 12:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8EBE2845E9
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 10:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8A658229;
	Thu,  2 May 2024 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roBfGZ5a"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8B5490A
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714645553; cv=none; b=fTFXO6S4IAL5Giwb+/MZDyKVIg2PIJtsnTe89qI8cgi8mrRFcPUVnPb/ixdgLb4C9nKJB3+0SpK+wCUEBprV2MCn1ot2CExogDBbfb6yJ0zIFHtLFX03gBbNeHTZ4sQdSkpaGrG17xbGYyS0cnqJl3C0EfMU8528l3qEOAVtDsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714645553; c=relaxed/simple;
	bh=XS9rlpiw8WzWr2DFe6SvhkENFUk4ExLKW973/hM82sM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gE0sLjhWCzQy/fRzSRzAk9MY98zT1B99cszA6sm3jfHIiEq1fuxbYVR3pAqqvUOKxWbsShNwdN1MoA5D+/R31Efz7LGBMG+a0YVP625zgKH8QEE+gY8RYpwQNoZqutSoli4OBLPaBfB2zyIgdD07aJo6ueDV2CyOwjH0XY9Kk7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roBfGZ5a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6140AC113CC;
	Thu,  2 May 2024 10:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714645552;
	bh=XS9rlpiw8WzWr2DFe6SvhkENFUk4ExLKW973/hM82sM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=roBfGZ5aipVu00rwn5cbc8MyLKSbnvuqX3DNVxCdphZeQe+taC5XLVgUYSad8NqFV
	 y7UeRLAfG67fZT0cgvhqiJJ8HrEAp3OWjhCcmhLbP8pV9TuGeZEVB0Yjj+Un12B3or
	 Fw/HWlIvaRNo/aS1oIMcHJL6DxURJEZf/YlnacBpJfA862+AfEhDfyOf6MzJh+4L6z
	 gAsHbuVN347AOQlJQLYCrPSb2Uj4EaB4Bw7jH4xNvXKU7ZDO+uJBdpPJz+qAsz5W3Q
	 jPMloWmsklPBGE978zHJNQ8rZQCmSxTPE5j6jOKF39MBeiG3bFE1t+zuysYUDeoUos
	 xUDxy0ojOybDQ==
Date: Thu, 2 May 2024 11:25:47 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Ricardo
 Ribalda <ribalda@chromium.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: Re: [GIT FIXES FOR 6.10] IPU6 and Unicam fixes
Message-ID: <20240502112547.3170d33c@sal.lan>
In-Reply-To: <ZjNQbS9CF1U6lGWx@valkosipuli.retiisi.eu>
References: <ZjNQbS9CF1U6lGWx@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 2 May 2024 08:35:57 +0000
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Hans, Mauro,
> 
> Here are a few fixes for the IPU6 and Unicam drivers, for issues found
> since merging them. Most are are due to Kconfig options.
> 
> Please pull.
> 
> 
> The following changes since commit a1c6d22421501fc1016b99ac8570a1030714c70f:
> 
>   media: staging: max96712: fix copy-paste error (2024-04-30 14:33:08 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-1.1-signed
> 
> for you to fetch changes up to f28348ebadf7c7127646672f363e055cb19f3b66:
> 
>   media: intel/ipu6: Fix build with !ACPI (2024-05-02 11:34:26 +0300)
> 
> ----------------------------------------------------------------
> IPU6 and Unicam fixes
> 
> ----------------------------------------------------------------
> Laurent Pinchart (1):
>       media: bcm2835-unicam: Include v4l2-subdev.h
> 
> Ricardo Ribalda (4):
>       media: bcm2835-unicam: Fix build with !PM
>       media: intel/ipu6: Switch to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS
>       media: intel/ipu6: Fix direct dependency Kconfig error
>       media: intel/ipu6: Fix build with !ACPI

The above were applied, thanks!

> 
> Sakari Ailus (1):
>       media: intel/ipu6: Fix vmalloc memory allocation

I didn't applied this one, as it sounds to me that the fix is
incomplete. I sent an email with the potential issues I found on it.

> 
>  drivers/media/pci/intel/Kconfig                  |  3 +-
>  drivers/media/pci/intel/ipu-bridge.c             | 66 +++++++++++++++++-------
>  drivers/media/pci/intel/ipu6/ipu6.c              |  6 +--
>  drivers/media/platform/broadcom/bcm2835-unicam.c |  3 +-
>  4 files changed, 54 insertions(+), 24 deletions(-)
> 

