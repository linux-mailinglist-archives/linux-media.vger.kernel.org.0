Return-Path: <linux-media+bounces-898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894537F5FEC
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F24E2B215A0
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE0A24B4A;
	Thu, 23 Nov 2023 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uzDThtuX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269824B38;
	Thu, 23 Nov 2023 13:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5462CC433C7;
	Thu, 23 Nov 2023 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745350;
	bh=Ql73lSrKwKhqup+abmtnnxEZYubEKUABQoHRGC8oFho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzDThtuXu/PTCtexQ8HN9QaXYAK0BZpNI/5gjSpKvL8SxEECMfj34sfZDWvr6O1tb
	 IMT3H4LdZs5gZT6FBvD2vwfzlrwvAj/o6Dcv9hlpndFV/UiFp2nz7ZyaA8T4VKd6n4
	 c2NkJRs7t0Cs+ai/173/MXHqduMLNNq8ly1jj/Jk=
Date: Thu, 23 Nov 2023 13:04:10 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 7/9] staging: vc04_services: Drop vchiq_log_warning() in
 favour of dev_dbg
Message-ID: <2023112309-shape-machinist-9271@gregkh>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-8-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107095156.365492-8-umang.jain@ideasonboard.com>

On Tue, Nov 07, 2023 at 04:51:54AM -0500, Umang Jain wrote:
> Drop vchiq_log_warning() macro which wraps dev_dbg(). Introduce the usage
> of dev_dbg() directly.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           | 35 ++++++++++---------
>  .../interface/vchiq_arm/vchiq_core.c          | 33 +++++++++--------
>  .../interface/vchiq_arm/vchiq_core.h          |  4 ---
>  3 files changed, 37 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 2cb2a6503058..bc0ee8b9d1c3 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -690,8 +690,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
>  		pr_err("%s: videocore not initialized\n", __func__);
>  		return -ENOTCONN;
>  	} else if (i > 0) {
> -		vchiq_log_warning(state->dev, VCHIQ_CORE,
> -				  "%s: videocore initialized after %d retries\n", __func__, i);
> +		dev_dbg(state->dev, "%s: %s: %s: videocore initialized after %d retries\n",
> +			log_cat(VCHIQ_CORE), log_type(WARN), __func__, i);

what is the log_type(WARN) stuff for?  How does that work?  You should
just use the normal dev_dbg() call and don't try to add new prefixes to
the message as that will just confuse the common parsing tools we have
for these types of things.

Also, as before, __func__ is redundant, and now you see it twice in the
output :(

thanks,

greg k-h

