Return-Path: <linux-media+bounces-39062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF61B1DABB
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 17:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6F22169017
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E25269B08;
	Thu,  7 Aug 2025 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rEKJFq56"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD1267B9B;
	Thu,  7 Aug 2025 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754580309; cv=none; b=tuymbyVqldkvO8YWxI7SBm3eDeVUdSwfqUh3wF8vrrQSGmhsUaBNLjK7DJpbfRU8BqGUzcDAo47rEOpsfgpDmXCc/qL2a/3EcR4pZhsR7t5xe9xIYpAT+cbYpjwZ+gTyIRl2auW0H96XU18zQjkuVBg0cVZ7uxgOSIYmCF941Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754580309; c=relaxed/simple;
	bh=m16anDcHzzBv8fTJ1SF4nX1vNGnGlpCIQqGs5C5MJSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTI9PjDvQlG4Ri6tgJZXa44VYPG8Zcemmp8nvvxEGEb+EFQXigvJ/lTrjbFyKwloxCvfUicH40uXX7D0cvre6Jgq6BxSrgTK5kLVtAwSztriDt2tyDvEgddlpjXCOmORsPEoMQKjuv8hB+f5iidjbaIIWc3KrR0crYOXauJ0CZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rEKJFq56; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D9AC4CEEB;
	Thu,  7 Aug 2025 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754580308;
	bh=m16anDcHzzBv8fTJ1SF4nX1vNGnGlpCIQqGs5C5MJSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEKJFq56ICQjITfSuUs2nefp5H0fs8Okl0H6A6EacazjYmfHhgRwzpGNRd+xY63yz
	 JLWwa0+v59yAwXAhlSQwcejLOjyeFUvE++GVo0sYqxS2Jxl+63n6IeTnpOL422LYzt
	 miWVC2TU48xmrnP3EENp1Ks7rh0kTTjg6iKn6/4w=
Date: Thu, 7 Aug 2025 16:25:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	Thinh.Nguyen@synopsys.com, Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 1/4] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
Message-ID: <2025080747-stays-snuff-86cc@gregkh>
References: <20250807055355.1257029-1-sakari.ailus@linux.intel.com>
 <20250807055355.1257029-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807055355.1257029-2-sakari.ailus@linux.intel.com>

On Thu, Aug 07, 2025 at 08:53:52AM +0300, Sakari Ailus wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> Detect eUSB2 double isoc bw capable hosts and devices, and set the proper
> xhci endpoint context values such as 'Mult', 'Max Burst Size', and 'Max
> ESIT Payload' to enable the double isochronous bandwidth endpoints.
> 
> Intel xHC uses the endpoint context 'Mult' field for eUSB2 isoc
> endpoints even if hosts supporting Large ESIT Payload Capability should
> normally ignore the mult field.
> 
> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Co-developed-by: Kannappan R <r.kannappan@intel.com>
> Signed-off-by: Kannappan R <r.kannappan@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/usb/host/xhci-caps.h |  2 ++
>  drivers/usb/host/xhci-mem.c  | 60 ++++++++++++++++++++++++++++--------
>  drivers/usb/host/xhci-ring.c |  6 ++--
>  drivers/usb/host/xhci.c      | 16 +++++++++-
>  drivers/usb/host/xhci.h      | 19 ++++++++++++
>  5 files changed, 87 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-caps.h b/drivers/usb/host/xhci-caps.h
> index 4b8ff4815644..723a56052439 100644
> --- a/drivers/usb/host/xhci-caps.h
> +++ b/drivers/usb/host/xhci-caps.h
> @@ -89,3 +89,5 @@
>  #define HCC2_GSC(p)             ((p) & (1 << 8))
>  /* true: HC support Virtualization Based Trusted I/O Capability */
>  #define HCC2_VTC(p)             ((p) & (1 << 9))
> +/* true: HC support Double BW on a eUSB2 HS ISOC EP */
> +#define HCC2_EUSB2_DIC(p)	((p) & (1 << 11))

Why tabs when the ones above it were not using tabs?


