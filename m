Return-Path: <linux-media+bounces-36323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F21CFAEE29F
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DD8D189C7B4
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4C728ECE3;
	Mon, 30 Jun 2025 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pG1Zy87n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E406528A1D4;
	Mon, 30 Jun 2025 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297607; cv=none; b=nfCXQiY+9GuuGDKUCA0gG0nhwsyY3G8CLaIAMA/Zt0kw0Z2pjXhMR7LCYbWbITlyrENkLFt2Fm0DyMUCpSODpPy2XboyKtoK/nIVGVc/rWpNZr5R5DqKpx1DTFu/QDJ4/73M1aH+52ndQwamAaKExA7Wj6dMvuf6WNX6N8fPX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297607; c=relaxed/simple;
	bh=u7DRLC1OtDPyfg2rYEHX42elfYJSYNnp14zxw2X7WoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxtK2QsDOjc37u3E1h8QNkNyVVzSpSZFjfGFgo6xufyTNcWyjduywTWELf0ARE9sa8tn7XS7tiRq5QlqyYYIW2oUAHNQHTXK2T8qtPN/Wd7ysYFdHKbmIcSliMCh+As8YTWNmjFWuJYV2xfV4nJUJppHjKMj5lTj2rpyClUqEVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pG1Zy87n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC06BC4CEE3;
	Mon, 30 Jun 2025 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751297606;
	bh=u7DRLC1OtDPyfg2rYEHX42elfYJSYNnp14zxw2X7WoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pG1Zy87n6pq23mMIVTQkJjcHTI2XumVvFB8epljNi3HUafmvY9lGr1nZ5ZBFUpi/s
	 YTICC3uMd/ZH7q2hW6tEBMMhGVotW9wqBN51oXkA2lkGnsG60rI04w0Yzkk28UNr6n
	 E4sn0RVM1cNyDVRV1qPBbXNnMW6/EROaVdTzStv0=
Date: Mon, 30 Jun 2025 17:33:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Desnes Nunes <desnesn@redhat.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
Message-ID: <2025063041-concur-unrefined-9dba@gregkh>
References: <20250630150107.23421-1-desnesn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630150107.23421-1-desnesn@redhat.com>

On Mon, Jun 30, 2025 at 12:01:06PM -0300, Desnes Nunes wrote:
> This fixes the following compilation failure: "error: ‘for’ loop
> initial declarations are only allowed in C99 or C11 mode"
> 
> Cc: stable@vger.kernel.org
> Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
> Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 44b6513c5264..532615d8484b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  {
>  	struct uvc_entity *entity;
> -	int i;
> +	unsigned int i;
>  
>  	guard(mutex)(&handle->chain->ctrl_mutex);

If your compiler can handle this guard(mutex) line, then:

>  
> @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
>  		return;
>  
>  	list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> -		for (unsigned int i = 0; i < entity->ncontrols; ++i) {

It can also handle that line.

Are you sure you are using a sane compiler?

confused,

greg k-h

