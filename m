Return-Path: <linux-media+bounces-22375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F349DED12
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 23:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9E7128226C
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A0D1A3AB1;
	Fri, 29 Nov 2024 22:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sktlmc9c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE6A14A4DD;
	Fri, 29 Nov 2024 22:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732917832; cv=none; b=Nr1eNuOl0rIX6KkhMb2rIC/e3bx0Ine8tFKtgY54T/MU9QM3fQrmLrdma69FC5QfjPWXfazgGENkMBSZhg9z0oXsaS7/d0CZzt5qr8czJ1YWi03G5Ruv4iFFQ9RjoTx5MtCPqZdOcrNrw5AunmLl2D2nZ6fCa44pwWOjHCoCBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732917832; c=relaxed/simple;
	bh=gluRh2H75n36eA7TYEjNNd8WkSH7oiY1eWSL8llW1JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj4X/68FVUWxsgZayEtxwnsNFI6hu/b1NiP2/uhZMxbqcdYKEkm/3REF/G/BxqAYaeIJgwiNyiP8PJgEHyqadhT6RIAL0bTgXjMw/izfqQ1JbWPWQxyk9iock3bhQ6kEdsMQuNvlspL4MrdpUCzi5DKKqijKiaFghY4btRy35yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sktlmc9c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA03E80A;
	Fri, 29 Nov 2024 23:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732917804;
	bh=gluRh2H75n36eA7TYEjNNd8WkSH7oiY1eWSL8llW1JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sktlmc9ca68wIF17ANZKyNq07FtIyz9rduUMiShqEpiwt4pnl/OcpGL0K6Ojcctil
	 xQ/9Us/WvUcBtw1jYkM54w+3SqwsnVSCGXiXNCcXobfc6ERIflsH5jAOsKSOqeTxPW
	 WCCfp0NYEQAdBIP3FEirM+6ales6L3JpLL8GmMUc=
Date: Sat, 30 Nov 2024 00:03:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control
 owned by other fh
Message-ID: <20241129220339.GD2652@pendragon.ideasonboard.com>
References: <20241128222232.GF25731@pendragon.ideasonboard.com>
 <CANiDSCvyMbAffdyi7_TrA0tpjbHe3V_D_VkTKiW-fNDnwQfpGA@mail.gmail.com>
 <20241128223343.GH25731@pendragon.ideasonboard.com>
 <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
 <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com>
 <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
 <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl>
 <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
 <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>

On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
> Before we all go on a well deserved weekend, let me recap what we
> know. If I did not get something correctly, let me know.
> 
> 1) Well behaved devices do not allow to set or get an incomplete async
> control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
> 2) Both Laurent and Ricardo consider that there is a big chance that
> some camera modules do not implement this properly. (ref: years of
> crying over broken module firmware :) )
>
> 3) ctrl->handle is designed to point to the fh that originated the
> control. So the logic can decide if the originator needs to be
> notified or not. (ref: uvc_ctrl_send_event() )
> 4) Right now we replace the originator in ctrl->handle for unfinished
> async controls.  (ref:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
> 
> My interpretation is that:
> A) We need to change 4). We shall not change the originator of
> unfinished ctrl->handle.
> B) Well behaved cameras do not need the patch "Do not set an async
> control owned by another fh"
> C) For badly behaved cameras, it is fine if we slightly break the
> v4l2-compliance in corner cases, if we do not break any internal data
> structure.

The fact that some devices may not implement the documented behaviour
correctly may not be a problem. Well-behaved devices will stall, which
means we shouldn't query the device while as async update is in
progress. Badly-behaved devices, whatever they do when queried, should
not cause any issue if we don't query them.

We should not send GET_CUR and SET_CUR requests to the device while an
async update is in progress, and use cached values instead. When we
receive the async update event, we should clear the cache. This will be
the same for both well-behaved and badly-behaved devices, so we can
expose the same behaviour towards userspace.

We possibly also need some kind of timeout mechanism to cope with the
async update event not being delivered by the device.

Regarding the userspace behaviour during an auto-update, we have
multiple options:

For control get,

- We can return -EBUSY
- We can return the old value from the cache
- We can return the new value fromt he cache

Returning -EBUSY would be simpler to implement.

I don't think the behaviour should depend on whether the control is read
on the file handle that initiated the async operation or on a different
file handle.

For control set, I don't think we can do much else than returning
-EBUSY, regardless of which file handle the control is set on.

> I will send a new version with my interpretation.
> 
> Thanks for a great discussion

-- 
Regards,

Laurent Pinchart

