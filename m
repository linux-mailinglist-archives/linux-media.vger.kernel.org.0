Return-Path: <linux-media+bounces-33439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B8AC4904
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 09:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7942188EA58
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C841F4174;
	Tue, 27 May 2025 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUEoO5jB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D510D72614
	for <linux-media@vger.kernel.org>; Tue, 27 May 2025 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329716; cv=none; b=SobsMQEibPf6F6UZ/R4PC6QzmMgYotC/FuAYsXMqVnzaOCK011nFLgh5BcllSHYdHRmsdR/zPPyhyKR2eeAHhReWYerjJ3WjLqdPGUhqwH8FFnhjFFpyZuM4KJWMGOxHipbCs4r+F90ZfvpVc11S1n90hrRhMkye2ndVnHH8TqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329716; c=relaxed/simple;
	bh=9FFaJolFZnt4aTg2iGbSNX+5rqhA8OPlAYunL0tu8L4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YoXcmkTNsfFo7jn6F+LLl6y32OgvzNLhhwkMuEL01rDBYxNOa4CZzDn5mMsIeET4TtiN24Ln2FaeMtf+2p4VY3CBPdHHqpQ0n6cOH9n69JLwZlzxnN7D70GQb61N7I25yRX9aZR+R8e7L8KAB6Pdwikvoc/5KI7T6rKT6mdACv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUEoO5jB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C2CC4CEEA;
	Tue, 27 May 2025 07:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748329716;
	bh=9FFaJolFZnt4aTg2iGbSNX+5rqhA8OPlAYunL0tu8L4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DUEoO5jBLRX0LXc33ayWG6szlNWWeRyDxk3LeY8gsuPHcCH53wFyGwelR0Qul5gpj
	 YJFI0ImnRUHVzf3ShU9lkEXcJrYrk3+7MniMR6+XZG/+7dxsABzjejURjySS4Nm/ve
	 TfTEiRF20a3jUswtqjeR3Gk5t3mwhEOpU8BKs/bYt/N4eRZcpMWqifW9ubh4muUN3o
	 FsSI+BMAAqq6N3GEtkbaIKIPH+010FKKssl/aWR+BTqPJi0IGRAAbKIK4zXr+JmgjV
	 gOhOjAfQqNAfWhfX9xlG8A4ZgTwHId1KddhFttX1KZGNVQ3UVPdKVbJvgnt94guH7m
	 K1QoKA7MgK+Pg==
Date: Tue, 27 May 2025 09:08:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hans@jjverkuil.nl>, linux-media@vger.kernel.org, Hans de Goede
 <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [GIT PULL FOR v6.16] uvcvideo improvements
Message-ID: <20250527090824.3ecb413f@foz.lan>
In-Reply-To: <20250509124615.GA12452@pendragon.ideasonboard.com>
References: <20250509124615.GA12452@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Laurent,

Em Fri, 9 May 2025 14:46:15 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro, Hans,
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-uvc-20250509
> 
> for you to fetch changes up to 9882222fa76450e545aeb625522ced7a78ff79a0:
> 
>   media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional (2025-04-07 15:31:55 +0200)
> 
> ----------------------------------------------------------------
> uvcvideo improvements:
> 
> - Granular power saving
> - Controls cache sync fix
> - GPIO deferred probe error fix

It doesn't seem to be the case of this PR, since it sounds mostly fixes,
but if a driver is getting some relevant improvement from user's perspective,
please be a little bit more verbose at the e-mail's subject. Something like:

	Subject: uvcvideo: added support for xxx

As otherwise, I'll simply ignore the PR's subject when submitting
upstream pull requests.

Regards,
Mauro


> 
> ----------------------------------------------------------------
> Ricardo Ribalda (10):
>       media: uvcvideo: Keep streaming state in the file handle
>       media: uvcvideo: Create uvc_pm_(get|put) functions
>       media: uvcvideo: Increase/decrease the PM counter per IOCTL
>       media: uvcvideo: Make power management granular
>       media: uvcvideo: Do not turn on the camera for some ioctls
>       media: uvcvideo: Return the number of processed controls
>       media: uvcvideo: Send control events for partial succeeds
>       media: uvcvideo: Rollback non processed entities on error
>       media: uvcvideo: Fix deferred probing error
>       media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional
> 
>  drivers/media/usb/uvc/uvc_ctrl.c   |  91 +++++++++++++++++++++--------
>  drivers/media/usb/uvc/uvc_driver.c |  38 ++++++++----
>  drivers/media/usb/uvc/uvc_v4l2.c   | 117 +++++++++++++++++++++++++++++--------
>  drivers/media/usb/uvc/uvcvideo.h   |   5 ++
>  4 files changed, 190 insertions(+), 61 deletions(-)
> 



Thanks,
Mauro

