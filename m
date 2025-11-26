Return-Path: <linux-media+bounces-47784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C54C8BD53
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 21:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08EA83B0421
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 20:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1A434321F;
	Wed, 26 Nov 2025 20:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ow1qOeTT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D5C34250F;
	Wed, 26 Nov 2025 20:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188644; cv=none; b=aLSLKopLattC39zGTZ8wDJMQTDCIgmKCF4dt2DwxFfTn/qnDtiFUsvSwEgDCdEuJ9M3LoPiZVwLclUzBjsg19/6bBhMtp23YgRWKq/mITBCZJlwpDMndfiMbXSQMKtID7E544PMDzI5pkt+m1D2zkBBAbYvpieCEUtK+puvU4UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188644; c=relaxed/simple;
	bh=6ppHddaRqYMsI6Dz0YKB1UjjTovHL62t6tMf6G5uGxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QkxkUdnadKNHoWXnjxpjrW8KC7prV1rmaA1IBCFG0Yx1eP3TDyiOdVE3PRgHxh5zmluuSY+/Jp2ivLoMP8gqiGkl/5E7i0+66QuTBpFNpZgLew0NlhTLVSGyCzCbP2ekD4PYvR931xziHCDwQBgJHbeziNH3fjHs+tU/RSJbiUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ow1qOeTT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D887FC4CEF7;
	Wed, 26 Nov 2025 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764188643;
	bh=6ppHddaRqYMsI6Dz0YKB1UjjTovHL62t6tMf6G5uGxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ow1qOeTTaWPmjaDfSD80Tvoq46crHMsTDz5Zp/W0jZnZEisxNllOzOJpgYoKuDG4y
	 8YQg7s09Czyea8Po/JrYzvJ3uw2Zu+TrAJ/Aan6fk3r/xoX12CGNWYFzW+KVTakIJN
	 48r+qBLTbtFlefVag1sr1UeuZhQmgCrndHU/HnkU=
Date: Wed, 26 Nov 2025 21:23:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Kumar <ayushkr0s@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, hverkuil@kernel.org, ribalda@chromium.org,
	abdelrahmanfekry375@gmail.com, santiagorr@riseup.net,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel-newbies@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements
 to next line
Message-ID: <2025112631-unvarying-android-15a6@gregkh>
References: <20251126190026.37436-1-ayushkr0s@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126190026.37436-1-ayushkr0s@gmail.com>

On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).
> 
> Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

