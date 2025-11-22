Return-Path: <linux-media+bounces-47614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D8471C7D31C
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 16:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5AC7434C84F
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4382E288515;
	Sat, 22 Nov 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZfgAYMec"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0C286410
	for <linux-media@vger.kernel.org>; Sat, 22 Nov 2025 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763824480; cv=none; b=GdykX1Ucb8fVQwrRY0ayl3gLGvcRz/CjIkaW9toLOf8gUDU2snbT6rOnBpCAIWU1gDXQ6NsGS9fyK3cwGzAN0dv0QrER1uB7NVDJV0v/9MlawWn5J+4oNTpkqmiVMkLWqU7xButzKbInhvLBF17LKATXaTyzD46aepXa2va1SuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763824480; c=relaxed/simple;
	bh=96mZRfIwWmEUcWaa7TTm4aiGazhILKQbWDNR++bEOjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfPg1Mj4k9MAKdnimLvALubkYdSSaZmjWzh7gtT/r0sBISqgRI6zgHMEBnP7ZPq2pcgc//uxi9hzNLYUUrY4lXessHLtx+weWnCpXnX34DX1wng3gCSHTErhvjPLavUjndAnO0QBjVznP/c5QjPP58uishCiLXbiTsyvsaXxRqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZfgAYMec; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (fs276ed015.tkyc509.ap.nuro.jp [39.110.208.21])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 30B8F56D;
	Sat, 22 Nov 2025 16:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763824340;
	bh=96mZRfIwWmEUcWaa7TTm4aiGazhILKQbWDNR++bEOjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfgAYMecCBxcUEi3Cf1Y7VWETEt7H9n1CvnALEUtvvkjuZXeT15uobA7lcLv5lQUg
	 DGIVZo1OHCvye+wynl4kjXzqVSM2rKyBbMhISvRaMo1eFObSl8QPaQfEd4SKHsOKF/
	 B7dXtsyoqM3XPDHjCKWvqBk3+kVphhx+4tEium7M=
Date: Sun, 23 Nov 2025 00:14:01 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lynne <dev@lynne.ee>
Cc: hdegoede@redhat.com, linux-media@vger.kernel.org
Subject: Re: uvc_video issue: Panasonic S1II initialization fails in webcam
 mode
Message-ID: <20251122151401.GC15447@pendragon.ideasonboard.com>
References: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91137e13-102b-41a6-8f14-14fb33a3e554@lynne.ee>

Hi Lynne,

On Sat, Nov 22, 2025 at 12:28:48PM +0100, Lynne wrote:
> The issue I'd like to report is that the kernel fails to initialize the 
> Panasonic S1II DSLR camera in webcam mode as a webcam.
> Seems like most queries time out or error out with a generic protocol 
> error return.
> I tried increasing UVC_CTRL_CONTROL_TIMEOUT just in case, but it did not 
> seem to help.

I see in the log that the USB audio driver fails as well. There are
quite a few devices that exhibit issues in the interactions between the
audio and video interfaces. Could you test blacklisting the
snd_usb_audio module to prevent it from loading (and unloading it if
it's loaded already), and replug your camera ?

> Full log is below:
> 
> [Nov22 12:11] usb 4-4: new SuperSpeed Plus Gen 2x1 USB device number 10 using xhci_hcd
> [  +0.017315] usb 4-4: New USB device found, idVendor=04da, idProduct=2385, bcdDevice= 1.00
> [  +0.000008] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  +0.000004] usb 4-4: Product: DC-S1M2
> [  +0.000002] usb 4-4: Manufacturer: Panasonic
> [  +0.000002] usb 4-4: SerialNumber: 00000Z12FB009251
> [  +0.019222] usb 4-4: Found UVC 1.10 device DC-S1M2 (04da:2385)
> [  +5.127335] usb 4-4: Failed to query (GET_INFO) UVC control 2 on unit 2: -110 (exp. 1).
> [  +5.119884] usb 4-4: Failed to query (GET_INFO) UVC control 2 on unit 1: -110 (exp. 1).
> [ +10.239937] usb 4-4: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.
> [  +0.008264] uvcvideo 4-4:1.1: Failed to query (GET_CUR) UVC probe control : -71 (exp. 34).
> [  +0.000013] uvcvideo 4-4:1.1: Failed to initialize the device (-71).
> [  +0.000026] uvcvideo 4-4:1.0: probe with driver uvcvideo failed with error -71
> [  +0.103095] usb 4-4: 3:1: cannot set freq 48000 to ep 0x83
> [  +0.359825] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320056] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320010] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320011] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319987] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319998] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320059] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319936] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320003] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320013] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +2.239898] endpoint_set_interface: 6 callbacks suppressed
> [  +0.000006] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319993] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319998] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.336000] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320060] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320003] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319963] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320031] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320000] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319939] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +2.272271] endpoint_set_interface: 6 callbacks suppressed
> [  +0.000005] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319969] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320040] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319687] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319976] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320002] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320000] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.335995] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.336289] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319755] usb 4-4: 3:1: usb_set_interface failed (-71)
> [Nov22 12:12] endpoint_set_interface: 6 callbacks suppressed
> [  +0.000006] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319730] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320269] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319729] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320145] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319884] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320264] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320012] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319704] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.320287] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +2.239682] endpoint_set_interface: 6 callbacks suppressed
> [  +0.000006] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.319995] usb 4-4: 3:1: usb_set_interface failed (-71)
> [  +0.233053] usb 4-4: USB disconnect, device number 10

-- 
Regards,

Laurent Pinchart

