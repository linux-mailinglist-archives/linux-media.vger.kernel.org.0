Return-Path: <linux-media+bounces-34919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6833EADB1B5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC83162E92
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2E62DBF58;
	Mon, 16 Jun 2025 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eU0L2iJt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665372DBF47;
	Mon, 16 Jun 2025 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080160; cv=none; b=t97g6OCeNAYLW1/duLLYesA6MMNZDbIE5HKfYJ6UnE6EpW7vQc3fCkxlmmDqyiyiQXd95aRGn7zmhUqPDyfOur/mjcYtBN61oxw853YBH0IJqzhi/+OmrZerLRpz4hDNax5k5M5PkIN6VPp5K7FVsTjml9r0sylPZT6c2CC1VCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080160; c=relaxed/simple;
	bh=XuT+3VsgckTt5M2xAgkLpIziX/vCPsExpdvphkrw+M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAnAbZA1Qmg8nwy6A4gvwBRULwPEL1xZtOW59eYowsEvK35kR9jHdyfGm5DJHrLHHTDHQQlbER0Wskb7qSyoRU53xFErkbRlGZ+qMfT08QWzk1dPxKf0BTXTldJqfCL9lt+qhH9R8DCzfanHd3TG1zd1ICxHTKjNLEbASX3aXxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eU0L2iJt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1F1722A;
	Mon, 16 Jun 2025 15:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750080146;
	bh=XuT+3VsgckTt5M2xAgkLpIziX/vCPsExpdvphkrw+M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eU0L2iJtMi5fWmrqRYpFpkozmOm0ls3n08WfFTZJM1AXqpNOe8LQeORsEAybvto+s
	 LHUGoa8Gdk2WPt21cK7d0y4YImXVJ84Gp/rwxPMIrcR/DQRVfaKr1679qteo/k8xAe
	 kUPL5PWEclJpcpz6TDB0ZNvtzY/8HCNpYJRepUPI=
Date: Mon, 16 Jun 2025 16:22:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org, hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com, Tao Q Tao <tao.q.tao@intel.com>,
	Amardeep Rai <amardeep.rai@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 3/3] media: uvcvideo: eUSB2 double isochronous bandwidth
 support
Message-ID: <20250616132222.GB10542@pendragon.ideasonboard.com>
References: <20250616093730.2569328-1-mathias.nyman@linux.intel.com>
 <20250616093730.2569328-4-mathias.nyman@linux.intel.com>
 <20250616094359.GB32454@pendragon.ideasonboard.com>
 <7ab7cd9e-3100-4996-9357-5350e4c46824@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7ab7cd9e-3100-4996-9357-5350e4c46824@linux.intel.com>

On Mon, Jun 16, 2025 at 04:05:54PM +0300, Mathias Nyman wrote:
> On 16.6.2025 12.43, Laurent Pinchart wrote:
> > On Mon, Jun 16, 2025 at 12:37:30PM +0300, Mathias Nyman wrote:
> >> From: Tao Q Tao <tao.q.tao@intel.com>
> >>
> >> Add eUSB2 support to check total number of bytes, isochronous endpoint
> >> will transfer every service interval(SI).
> >>
> >> Co-developed-by: Amardeep Rai <amardeep.rai@intel.com>
> >> Signed-off-by: Amardeep Rai <amardeep.rai@intel.com>
> >> Signed-off-by: Tao Q Tao <tao.q.tao@intel.com>
> >> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> >> ---
> >>   drivers/media/usb/uvc/uvc_video.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >> index e3567aeb0007..a888f84208c6 100644
> >> --- a/drivers/media/usb/uvc/uvc_video.c
> >> +++ b/drivers/media/usb/uvc/uvc_video.c
> >> @@ -1906,6 +1906,11 @@ u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep)
> >>   	case USB_SPEED_SUPER:
> >>   	case USB_SPEED_SUPER_PLUS:
> >>   		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> >> +	case USB_SPEED_HIGH:
> >> +		psize = usb_endpoint_maxp(&ep->desc);
> >> +		if (psize == 0 && le16_to_cpu(dev->descriptor.bcdUSB) == 0x220)
> >> +			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> >> +		fallthrough;
> > 
> > Instead of adding yet another case here, and eventually in a bunch of
> > other drivers, could we centralize retrieval of the maximum bpi value in
> > a helper function provided by the USB core ?
> 
> Sounds reasonable to me.
> I'm not sure if any other drivers will need it as this feature seems to be made
> specifically for integrated webcams, but things evolve.

Even if eUSB2 doesn't get used by other devices, I think centralizing
the whole max bpi calculation will be useful to handle the different
USB_SPEED_*.

-- 
Regards,

Laurent Pinchart

