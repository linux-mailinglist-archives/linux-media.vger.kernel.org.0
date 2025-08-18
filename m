Return-Path: <linux-media+bounces-40121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55248B29E5E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 11:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17AAF3A986F
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 09:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4840D30F802;
	Mon, 18 Aug 2025 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmmEyNVQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC830F7EA;
	Mon, 18 Aug 2025 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755510625; cv=none; b=JLFcfxngYZWobWfalfIeceMN/OZkt89dFxv8BD4DeRX4bHlF9qp8o4JOHjCjU7vHg4gVTP6XCyUnBudvmOSL8RKbgqr0B0sRwzaIwZdKVEDGCo4I5mnx4oFZjsaurTahV4CKbSaf/ajpkzeqfKTfSb2C71DZnaQCdgWjSHLzzQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755510625; c=relaxed/simple;
	bh=fF5TnFoyE7O3BtbCozQ53yUk53Lr608lTOacuET0vOk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ncgYp2I51TE4Q0NSCCUviODD9/vvDqHkIfUrhZ1P41BFuuFVmYtUOkoZbhDLSAZkW+bFpaYl3es79eKo89cq788iJUIdMybbOVmfAy7x0roRpmn2NAo0GskaB6a7WyixatpRn14uih0STKeIoxdsnrxFuHikesO6PCK69IXZKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmmEyNVQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce5090b1cso3814563e87.0;
        Mon, 18 Aug 2025 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755510622; x=1756115422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xn131HOwLTRiislWx2+Ma2huWnx9WcPF/0AWN6YMczI=;
        b=bmmEyNVQKb5cDmWQJvqEgZmtdt1BJ0YAWN+xAXeZ10zBTAIZFzcTkfLxoUFic8kcJ5
         fWwddKjw4ZkqoaG0ONR4ZoMZxGUtvirplcOqJRscxwsYWdWwZTtQqZQN45zzb1Mw0nXD
         rBdOme2Czxd2xZAv/yV7i82EkB+fpgyW8CJBVCLfQSEMK3VcvEvZDrpuZ/vKjRhGlPWJ
         SYnBI3AXTRCn4aVDhi0cKQsjn5xbKHnAb/42IGKVUorgJrcoQxtX84mCfhyJzHIUAklC
         YXrElpNDyz2woKeF2IuCLha5zU1BwhYB7a1vA3lMlBZDbbhmxw9tf/hjNWIvvxp0LV+o
         AXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755510622; x=1756115422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xn131HOwLTRiislWx2+Ma2huWnx9WcPF/0AWN6YMczI=;
        b=FJ7kA4RD7oLywfFAbKTcflomyg2ornVgwwYTstf6b7s2cF6ZBEtHFkkIDNpGsJNsQO
         R87xN87tzSsaveq/yV226FjXCx8jBAwGVPFPZVstWAgfZNyNA0Z0V4nk6X6beqDLPYtH
         v79xjvsOF+snIS+ybvyxZ0G9mKCWkxggnd0cPuSASaExrgRr/oJavUd3b/7wt6pDT3bN
         ueBCaDhSMAy1IEQ6udqR8VCo00gLiJbnFSpezdJcmMfrY1BOh6oii8QuASEn6Qrwzh05
         lKKJEEoDtEHgs3Yz5n0Yte9s3ilM6Htf9dtoMLU5oaVHFsHnME+xrFcwZte3IVCQH/Tb
         PLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWNo+PAvZlMLXa3wKTeZ2aOWAVXXl+IbYccAgBP3IJ9DmRRnyeEwiWBnOBa/cyLhhhQjMRZ68e9aUe8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtpG1C6FbRTsV4MOYir2mtrwqLBY9gPZVjDZXOn+gCMw68bh1K
	nTb4VMZYtc4qmX7iMvXpNWsuhRz4tmEriD9MGdDOXt337/eS+6ICrxx+
X-Gm-Gg: ASbGncs8/dt8NGqJ6K+jDe3cspR4nf9e0qR4xhPiQuuBlkYWcgBhjwucHxwL3Xb0kZE
	Du95LDDWc13/WLJ3AiFVBHjgwWbS2GWL9ELZ9CWPBSi7fQDnrb+Hi5kHSASwjRWHH1O3Jmmfx27
	IaZZ8G6Rkqxcme+VSvjkuXi5bav/PAeUeIMmkKxLKdV0ZAKMDr8oLSaTGQubRYZsywGOY81c2WR
	ihtF+f1n28vxcIRcWxhT3e1wqXLTb2/tdx5Uh1CWSMsDxP94LrtHHlHUUQ/G9IFVSkBAEnv1pDR
	089XoYUXkPtsTFc4GkdsOZtsSr47ydzp5Y6CBic4imqlZWD/WR54X27SRAGU4f7124p80oRQtrH
	A2Acm5kDudrirjsNay9lHlYuEWiqO9SG5EUU=
X-Google-Smtp-Source: AGHT+IHjIZJECXtS7IIH4/209VT4xtm4ZwOEA6bD+k8Fe1qxZ0DD6Fce5mVsJ6HuuAJYcrUxofDAgA==
X-Received: by 2002:a05:6512:220d:b0:55b:8f40:32bd with SMTP id 2adb3069b0e04-55cf2cdd00cmr1794510e87.33.1755510621449;
        Mon, 18 Aug 2025 02:50:21 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef4732a5sm1564270e87.162.2025.08.18.02.50.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 Aug 2025 02:50:21 -0700 (PDT)
Date: Mon, 18 Aug 2025 11:50:16 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
 hdegoede@redhat.com, Thinh.Nguyen@synopsys.com, Amardeep Rai
 <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>, Mathias
 Nyman <mathias.nyman@linux.intel.com>, Alan Stern
 <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 1/4] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
Message-ID: <20250818115016.3611b910@foxbook>
In-Reply-To: <20250812132445.3185026-2-sakari.ailus@linux.intel.com>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
	<20250812132445.3185026-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Aug 2025 16:24:42 +0300, Sakari Ailus wrote:
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
> index 4b8ff4815644..89bc83e4f1eb 100644
> --- a/drivers/usb/host/xhci-caps.h
> +++ b/drivers/usb/host/xhci-caps.h
> @@ -89,3 +89,5 @@
>  #define HCC2_GSC(p)             ((p) & (1 << 8))
>  /* true: HC support Virtualization Based Trusted I/O Capability */
>  #define HCC2_VTC(p)             ((p) & (1 << 9))
> +/* true: HC support Double BW on a eUSB2 HS ISOC EP */
> +#define HCC2_EUSB2_DIC(p)       ((p) & (1 << 11))

I guess this bit is not defined in the original xHCI 1.2 spec which
predates BW doubling, any reference to where it is specified and what
it means exactly?

> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 6680afa4f596..ea51434c80fa 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1328,18 +1328,36 @@ static unsigned int xhci_get_endpoint_interval(struct usb_device *udev,
>  	return interval;
>  }
>  
> -/* The "Mult" field in the endpoint context is only set for SuperSpeed isoc eps.
> +/*
> + * xHCs without LEC use the "Mult" field in the endpoint context for SuperSpeed
> + * isoc eps, and High speed isoc eps that support bandwidth doubling. Standard
>   * High speed endpoint descriptors can define "the number of additional
>   * transaction opportunities per microframe", but that goes in the Max Burst
>   * endpoint context field.
>   */
> -static u32 xhci_get_endpoint_mult(struct usb_device *udev,
> -		struct usb_host_endpoint *ep)
> +static u32 xhci_get_endpoint_mult(struct xhci_hcd *xhci,
> +				  struct usb_device *udev,
> +				  struct usb_host_endpoint *ep)
>  {
> -	if (udev->speed < USB_SPEED_SUPER ||
> -			!usb_endpoint_xfer_isoc(&ep->desc))
> +	bool lec;
> +
> +	/* xHCI 1.1 with LEC set does not use mult field, except intel eUSB2 */
> +	lec = xhci->hci_version > 0x100 && HCC2_LEC(xhci->hcc_params2);
> +
> +	/* eUSB2 double isoc bw devices are the only USB2 devices using mult */
> +	if (xhci_eusb2_is_isoc_bw_double(udev, ep)) {
> +		if (!lec || xhci->quirks & XHCI_INTEL_HOST)
> +			return 1;
> +	}
> +
> +	/* Oherwise only isoc transfers on hosts without LEC uses mult field */
> +	if (!usb_endpoint_xfer_isoc(&ep->desc) || lec)
>  		return 0;
> -	return ep->ss_ep_comp.bmAttributes;
> +
> +	if (udev->speed >= USB_SPEED_SUPER)
> +		return ep->ss_ep_comp.bmAttributes;
> +
> +	return 0;
>  }

That's a complicated control flow. I think it could just be:
> +	/* SuperSpeed isoc transfers on hosts without LEC uses mult field */
> +	if (udev->speed >= USB_SPEED_SUPER && usb_endpoint_xfer_isoc(&ep->desc) && !lec)
> +		return ep->ss_ep_comp.bmAttributes;
> +	return 0;
> }

>  
>  static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
> @@ -1351,8 +1369,18 @@ static u32 xhci_get_endpoint_max_burst(struct usb_device *udev,
>  
>  	if (udev->speed == USB_SPEED_HIGH &&
>  	    (usb_endpoint_xfer_isoc(&ep->desc) ||
> -	     usb_endpoint_xfer_int(&ep->desc)))
> +	     usb_endpoint_xfer_int(&ep->desc))) {
> +		/*
> +		 * eUSB2 double isoc bw endpoints max packet field service
> +		 * opportunity bits 12:11 are not valid, so set the ctx burst to
> +		 * max service opportunity "2" as these eps support transferring
> +		 * over 3072 bytes per interval
> +		 */

I think a shorter comment would suffice: eUSB2 BWD uses fixed burst
size and max packets bits 12:11 are invalid.

> +		if (xhci_eusb2_is_isoc_bw_double(udev, ep))
> +			return 2;
> +
>  		return usb_endpoint_maxp_mult(&ep->desc) - 1;
> +	}
>  
>  	return 0;
>  }
> @@ -1400,6 +1428,10 @@ static u32 xhci_get_max_esit_payload(struct usb_device *udev,
>  	if (udev->speed >= USB_SPEED_SUPER)
>  		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
>  
> +	/* High speed eUSB2 double isoc bw with over 3072 bytes per esit */
> +	if (xhci_eusb2_is_isoc_bw_double(udev, ep))
> +		return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
> +
>  	max_packet = usb_endpoint_maxp(&ep->desc);
>  	max_burst = usb_endpoint_maxp_mult(&ep->desc);
>  	/* A 0 in max burst means 1 transfer per ESIT */
> @@ -1437,6 +1469,13 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>  
>  	ring_type = usb_endpoint_type(&ep->desc);
>  
> +	/* Ensure host supports double isoc bandwidth for eUSB2 devices */
> +	if (xhci_eusb2_is_isoc_bw_double(udev, ep) &&
> +	    !HCC2_EUSB2_DIC(xhci->hcc_params2))	{
> +		dev_dbg(&udev->dev, "Double Isoc Bandwidth not supported by xhci\n");
> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * Get values to fill the endpoint context, mostly from ep descriptor.
>  	 * The average TRB buffer lengt for bulk endpoints is unclear as we
> @@ -1460,8 +1499,8 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>  		}
>  	}
>  
> -	mult = xhci_get_endpoint_mult(udev, ep);
> -	max_packet = usb_endpoint_maxp(&ep->desc);
> +	mult = xhci_get_endpoint_mult(xhci, udev, ep);
> +	max_packet = xhci_usb_endpoint_maxp(udev, ep);
>  	max_burst = xhci_get_endpoint_max_burst(udev, ep);
>  	avg_trb_len = max_esit_payload;
>  
> @@ -1482,9 +1521,6 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>  	/* xHCI 1.0 and 1.1 indicates that ctrl ep avg TRB Length should be 8 */
>  	if (usb_endpoint_xfer_control(&ep->desc) && xhci->hci_version >= 0x100)
>  		avg_trb_len = 8;
> -	/* xhci 1.1 with LEC support doesn't use mult field, use RsvdZ */
> -	if ((xhci->hci_version > 0x100) && HCC2_LEC(xhci->hcc_params2))
> -		mult = 0;
>  
>  	/* Set up the endpoint ring */
>  	virt_dev->eps[ep_index].new_ring =
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 94c9c9271658..9abc5bc4e1c0 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3542,7 +3542,7 @@ static u32 xhci_td_remainder(struct xhci_hcd *xhci, int transferred,
>  	if ((xhci->quirks & XHCI_MTK_HOST) && (xhci->hci_version < 0x100))
>  		trb_buff_len = 0;
>  
> -	maxp = usb_endpoint_maxp(&urb->ep->desc);
> +	maxp = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
>  	total_packet_count = DIV_ROUND_UP(td_total_len, maxp);
>  
>  	/* Queueing functions don't count the current TRB into transferred */
> @@ -3559,7 +3559,7 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
>  	u32 new_buff_len;
>  	size_t len;
>  
> -	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
> +	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
>  	unalign = (enqd_len + *trb_buff_len) % max_pkt;
>  
>  	/* we got lucky, last normal TRB data on segment is packet aligned */
> @@ -4130,7 +4130,7 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  		addr = start_addr + urb->iso_frame_desc[i].offset;
>  		td_len = urb->iso_frame_desc[i].length;
>  		td_remain_len = td_len;
> -		max_pkt = usb_endpoint_maxp(&urb->ep->desc);
> +		max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
>  		total_pkt_count = DIV_ROUND_UP(td_len, max_pkt);
>  
>  		/* A zero-length transfer still involves at least one packet. */
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 8a819e853288..1ea7d2fb5876 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1332,7 +1332,7 @@ static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
>  	struct scatterlist *tail_sg;
>  
>  	tail_sg = urb->sg;
> -	max_pkt = usb_endpoint_maxp(&urb->ep->desc);
> +	max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
>  
>  	if (!urb->num_sgs)
>  		return ret;
> @@ -2920,6 +2920,20 @@ int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int
>  }
>  EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
>  
> +/*
> + * xhci_usb_endpoint_maxp - get endpoint max packet size
> + * @host_ep: USB host endpoint to be checked
> + *
> + * Returns max packet from the correct descriptor
> + */
> +int xhci_usb_endpoint_maxp(struct usb_device *udev,
> +			   struct usb_host_endpoint *host_ep)
> +{
> +	if (xhci_eusb2_is_isoc_bw_double(udev, host_ep))
> +		return le16_to_cpu(host_ep->eusb2_isoc_ep_comp.wMaxPacketSize);
> +	return usb_endpoint_maxp(&host_ep->desc);
> +}
> +
>  /* Issue a configure endpoint command or evaluate context command
>   * and wait for it to finish.
>   */
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index a20f4e7cd43a..9657a4deb87b 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1736,6 +1736,23 @@ static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
>  	       (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
>  }
>  
> +/*
> + * USB 2.0 specification, chapter 5.6.4 Isochronous Transfer Bus Access
> + * Constraint. A high speed endpoint can move up to 3072 bytes per microframe
> + * (or 192Mb/s).
> + */
> +#define MAX_ISOC_XFER_SIZE_HS  3072
> +
> +static inline bool xhci_eusb2_is_isoc_bw_double(struct usb_device *udev,
> +						struct usb_host_endpoint *ep)
> +{
> +	return udev->speed == USB_SPEED_HIGH &&
> +		usb_endpoint_is_isoc_in(&ep->desc) &&
> +		le16_to_cpu(ep->desc.wMaxPacketSize) == 0 &&
> +		le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval) >
> +		MAX_ISOC_XFER_SIZE_HS;
> +}

It looks like eUSB2v2 is another spec which uses this descriptor for
larger isoc endpoints and this code might trigger on such devices once
USB core learns to parse them.

Would there be no issues with that? Or conversely, any chance that your
code could be trivially modified to support full 2v2, and "bw doubling"
removed from names and comments?

> +
>  #define xhci_dbg(xhci, fmt, args...) \
>  	dev_dbg(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
>  #define xhci_err(xhci, fmt, args...) \
> @@ -1957,6 +1974,8 @@ void xhci_update_erst_dequeue(struct xhci_hcd *xhci,
>  			      struct xhci_interrupter *ir,
>  			      bool clear_ehb);
>  void xhci_add_interrupter(struct xhci_hcd *xhci, unsigned int intr_num);
> +int xhci_usb_endpoint_maxp(struct usb_device *udev,
> +			   struct usb_host_endpoint *host_ep);
>  
>  /* xHCI roothub code */
>  void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
> -- 
> 2.39.5
> 

