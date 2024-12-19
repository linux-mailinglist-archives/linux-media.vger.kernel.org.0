Return-Path: <linux-media+bounces-23751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0889F716D
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 01:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5490016BA3A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 00:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EB0171D2;
	Thu, 19 Dec 2024 00:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QM/waVd5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F31805E;
	Thu, 19 Dec 2024 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568636; cv=none; b=sIyYNU6ooMTRM9JGWqLhcrnkdqVtzn7zYmXQACSyO3G+kkNqfJZTz+vQLPel2KiRv0csMJvm8fKuip1jOmpJV/infQEfww/QHm7jxCkLcTPAodWMqq0xmPyC0XCoar3OnM9ftEFienpw4M6NkNUmMgLeqigJY6yk8ied6inY3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568636; c=relaxed/simple;
	bh=TTLuCrqACwgADLkp2ytGhfloNQPktr8ckPVnKLz7RaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIkhnVnvUC1hGirW1NN1hbGRY2dzYA58k5adlhr4/RycfPNtmjXJStyysD+RjwdfGnm/LkGnUQWjn0GTRsZ3jAYCDjvOiYrKU9hOu9kKDDgdUjTUpE4ti0ydW91b9pYYYr/UxzGlMxTy1p2I90uz+763/WrINKa2uDytWqHCosQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QM/waVd5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 431BF163;
	Thu, 19 Dec 2024 01:36:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734568594;
	bh=TTLuCrqACwgADLkp2ytGhfloNQPktr8ckPVnKLz7RaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QM/waVd5ZNy/YQ1VH3rw6d8wFT7mnGuNHS0zDcfIBt37HBs6oLQl6z3Ztcokq5iab
	 dW7o/dj83ucYpN6WYTCbFlFd85aDWfALjB61w44gqUrc464hbo+qqT2c7M5mTHGlax
	 iillauNVo5kcmmTGtyapF7LhxYN38ToYF4ACPV6U=
Date: Thu, 19 Dec 2024 02:37:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 0/5] media: uvcvideo: Two +1 fixes for async controls
Message-ID: <20241219003708.GK5518@pendragon.ideasonboard.com>
References: <20241203-uvc-fix-async-v6-0-26c867231118@chromium.org>
 <e3316372-d109-4d2e-ad2b-8989babdf546@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e3316372-d109-4d2e-ad2b-8989babdf546@redhat.com>

On Mon, Dec 09, 2024 at 12:01:16PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 3-Dec-24 10:20 PM, Ricardo Ribalda wrote:
> > This patchset fixes two +1 bugs with the async controls for the uvc driver.
> > 
> > They were found while implementing the granular PM, but I am sending
> > them as a separate patches, so they can be reviewed sooner. They fix
> > real issues in the driver that need to be taken care.
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Ricardo, Thank you for your patches.
> 
> I have merged patches 1-4 into:
> 
> https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

At least patch 5/5 was applied incorrectly. Does that result from a
merge conflict ? Or did you apply v5 by mistake ? There doesn't seem to
be any other issue.

I've rebased the uvc/next branch to fix this. Once CI passes, I'll send
a pull request.

> > ---
> > Changes in v6:
> > - Swap order of patches
> > - Use uvc_ctrl_set_handle again
> > - Move loaded=0 to uvc_ctrl_status_event()
> > - Link to v5: https://lore.kernel.org/r/20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org
> > 
> > Changes in v5:
> > - Move set handle to the entity_commit
> > - Replace uvc_ctrl_set_handle with get/put_handle.
> > - Add a patch to flush the cache of async controls.
> > - Link to v4: https://lore.kernel.org/r/20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org
> > 
> > Changes in v4:
> > - Fix implementation of uvc_ctrl_set_handle.
> > - Link to v3: https://lore.kernel.org/r/20241129-uvc-fix-async-v3-0-ab675ce66db7@chromium.org
> > 
> > Changes in v3:
> > - change again! order of patches.
> > - Introduce uvc_ctrl_set_handle.
> > - Do not change ctrl->handle if it is not NULL.
> > 
> > Changes in v2:
> > - Annotate lockdep
> > - ctrl->handle != handle
> > - Change order of patches
> > - Move documentation of mutex
> > - Link to v1: https://lore.kernel.org/r/20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org
> > 
> > ---
> > Ricardo Ribalda (5):
> >       media: uvcvideo: Only save async fh if success
> >       media: uvcvideo: Remove redundant NULL assignment
> >       media: uvcvideo: Remove dangling pointers
> >       media: uvcvideo: Annotate lock requirements for uvc_ctrl_set
> >       media: uvcvideo: Flush the control cache when we get an event
> > 
> >  drivers/media/usb/uvc/uvc_ctrl.c | 83 ++++++++++++++++++++++++++++++++++------
> >  drivers/media/usb/uvc/uvc_v4l2.c |  2 +
> >  drivers/media/usb/uvc/uvcvideo.h |  9 ++++-
> >  3 files changed, 82 insertions(+), 12 deletions(-)
> > ---
> > base-commit: 291a8d98186f0a704cb954855d2ae3233971f07d
> > change-id: 20241127-uvc-fix-async-2c9d40413ad8

-- 
Regards,

Laurent Pinchart

