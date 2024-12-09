Return-Path: <linux-media+bounces-22943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E4F9E9A59
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 16:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F146D188948F
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1489F1E9B31;
	Mon,  9 Dec 2024 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="loPa0XYD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D71B4257;
	Mon,  9 Dec 2024 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757541; cv=none; b=kiJ1KfGP/LqSVJgNWVrbcT5qx8//jPsCvqzp5kTQ1cgVU21jiBl+55ad6DAPl+MrFhoEoiKHTmoJtFvSDFCS3Gn4AIyBXKhsjP/50npr7oOwOBVIMnbE4H0+5IONktFG4lsG4sPBQI28d0oO3sSGZco65X3ce0SfHguDtl3peIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757541; c=relaxed/simple;
	bh=IkhWJ7wUs/1Z3DXk0eb7eLlKr7VcxthrUkRqPQdE5W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eve1sVGXUKHlDEt2U+o6ZoHWLT/pKcsaLDjT4W77HtdhmUkNsALd1XfoC8io/KNt9hvKG5sfWfJcPb+V7Olk7znGg4cVlzCMVZASxKlctwmrPK7Fvx4nMjO7P2i46l+PQlxTBDKGxv2DRDHjcxhKMweTLeZW57AlL4dqzUGWjZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=loPa0XYD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66306C4CED1;
	Mon,  9 Dec 2024 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733757540;
	bh=IkhWJ7wUs/1Z3DXk0eb7eLlKr7VcxthrUkRqPQdE5W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loPa0XYDmwqE+YllEDKLzKfx2KMjPwL5h9JPQN94GhmXTi4PlSmlr+TnNhQRmX89U
	 GvamidDpPLu7Cmkm+DQkJEVvkz+oAODlPK80B7+9hRiPwm2fpvOU7bVj2vc7LiCz5d
	 RE/qkzUE/R1gVS4hYzHXL7WIB9OxcvrfJQ975nOk=
Date: Mon, 9 Dec 2024 16:18:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	torvalds@linux-foundation.org, stable@vger.kernel.org,
	linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
Message-ID: <2024120934-wreckage-hazily-166f@gregkh>
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>

On Mon, Dec 09, 2024 at 09:52:17AM -0500, Genes Lists wrote:
> On Mon, 2024-12-09 at 11:48 +0100, Greg Kroah-Hartman wrote:
> > I'm announcing the release of the 6.12.4 kernel.
> > 
> > All users of the 6.12 kernel series must upgrade.
> > ...
> > greg k-h
> > 
> > 
> 
> FYI 6.12.4 got a crash shortly after booting in dma_alloc_attrs - maybe
> triggered in ipu6_probe. Crash only happened on laptop with ipu6. All
> other machines are running fine.

Did older kernels work?  Did 6.12.1?  If so, can you do 'git bisect' to
find the offending change?

thanks,

greg k-h

