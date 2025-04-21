Return-Path: <linux-media+bounces-30585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977DA94E47
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0474E3B31FD
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 08:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B735F2139A2;
	Mon, 21 Apr 2025 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o0001Z8v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0481B189B84;
	Mon, 21 Apr 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225502; cv=none; b=RxfZJFlC8d22nvtoPFDtmvb2vlEBmJ2Ic6GuC6rO54a08zYATah7jlYgnl3XXa+CLB4V7kAx7F0HaF2sc2iqA66f/gNPJy0qgPc59Z+KGWm/ZaX8RBqLvnPECLilHV+mFrpIeqfJh0CgA8di7Oo6pCGWZlkEzzbwC/sevMO2Tok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225502; c=relaxed/simple;
	bh=zJShDvas9o4kwADRZZXz3VeLI3YlnhE4uY/hWs9kiJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbEewFqG/Uu3chi2PV+Q9kCZgB7DRg3+yu4y5aSpXqdTdjivcwCwXlNPpnIU/s2Qr5AKFTRKWduvQgiCExzHGG2e1IvwykR1134QEr7RitQrJJ67ijsp9/ijn7R7A1CVQMJukW4choy6vU2s4aFzjujdeySpxNktVTdqx3RWzAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o0001Z8v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0042CC4CEE4;
	Mon, 21 Apr 2025 08:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745225501;
	bh=zJShDvas9o4kwADRZZXz3VeLI3YlnhE4uY/hWs9kiJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0001Z8vypGe599+bJD9siWiB4gPa+3L0luwFQlHRmj4wgNTPZvnZdgfl4F9aTJrv
	 EqDk1WcvM7uIw3g+4G2gcltTiMYF+SXbq+f/n/LZmGkACLVvjPi22D4H3DXBSI/8+2
	 Yw5PS1UOv27xv3L6l2IfKRscOQyc5pNG8X0x0CkM=
Date: Mon, 21 Apr 2025 10:51:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Support large SuperSpeedPlus
 isochronous endpoints
Message-ID: <2025042101-coyness-vitality-e636@gregkh>
References: <20250421095951.1e63824e@foxbook>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421095951.1e63824e@foxbook>

On Mon, Apr 21, 2025 at 09:59:51AM +0200, Michal Pecio wrote:
> USB 3.1 increased maximum isochronous bandwidth to 96KB per interval,
> too much for 16 bits and the SuperSpeed Endpoint Companion descriptor.
> A new SuperSpeedPlus Isochronous Endpoint Companion descriptor was
> introduced to encode such bandwidths, see spec sections 9.6.7, 9.6.8.
> 
> Support the descriptor with code based on xhci_get_max_esit_payload()
> and widen all 'psize' variables to 32 bits. Subsequent calculations
> are 32 bit already and not expected to overflow, so this change ought
> to suffice for proper alt setting selection on USB 3.x Gen 2 devices.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> This change appears to be a strict necessity for supporting USB3 Gen2
> isochronous devices meaningfully. Whether it's sufficient I don't know,
> I don't have such HW. No regression seen on High Speed and SuperSpeed.

If you don't have the hardware, why make this change?

>  drivers/media/usb/uvc/uvc_

This line looks odd, because:

>  drivers/media/usb/uvc/uvc_driver.c |  2 +-
>  drivers/media/usb/uvc/uvc_video.c  | 13 +++++++++----
>  drivers/media/usb/uvc/uvcvideo.h   |  4 ++--
>  3 files changed, 12 insertions(+), 7 deletions(-)

Only 3 files were changed.  What went wrong?

thanks,

greg k-h

