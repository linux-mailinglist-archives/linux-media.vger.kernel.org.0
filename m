Return-Path: <linux-media+bounces-897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B307F5FEA
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C7E281EBC
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861B2249E7;
	Thu, 23 Nov 2023 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jaQ/h+Jm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87DA22F02;
	Thu, 23 Nov 2023 13:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717B4C433C8;
	Thu, 23 Nov 2023 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745345;
	bh=eJTy5aMrNtZAv8SIwMLQ3REahBl73WirIDU8LHCm6JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaQ/h+JmhhWZwfEqGyzsMAjEut3UCUY5hUGmVL1rymqCqtlZ7j9zZbNx3nW6xpKop
	 OmB/90ht5t47jgkdJIzjyXCEAUIQMdJZ7HsTcS4uFriashxUq8oFUKr25pI1TjgGBx
	 cp+cnDltoMPfhmHubZ8DOS2kEHkScX8KltABAYUg=
Date: Thu, 23 Nov 2023 13:02:45 +0000
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
Subject: Re: [PATCH 6/9] staging: vc04_services: Drop vchiq_log_error() in
 favour of dev_dbg
Message-ID: <2023112322-wife-aspect-135b@gregkh>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-7-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107095156.365492-7-umang.jain@ideasonboard.com>

On Tue, Nov 07, 2023 at 04:51:53AM -0500, Umang Jain wrote:
> Drop vchiq_log_error() macro which wraps dev_dbg(). Introduce the usage
> of dev_dbg() directly.
> 
> Add a new enum vchiq_log_type and log_type() helper to faciliate the
> type of logging in dev_dbg(). This will help to determine the type of
> logging("error", "warning", "debug", "trace") to dynamic debug.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_arm.c           |  54 ++++----
>  .../interface/vchiq_arm/vchiq_connected.c     |   6 +-
>  .../interface/vchiq_arm/vchiq_core.c          | 126 ++++++++++--------
>  .../interface/vchiq_arm/vchiq_core.h          |  23 +++-
>  .../interface/vchiq_arm/vchiq_dev.c           |  47 ++++---
>  5 files changed, 143 insertions(+), 113 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 9fb3e240d9de..2cb2a6503058 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -696,8 +696,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
>  
>  	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
>  	if (!instance) {
> -		vchiq_log_error(state->dev, VCHIQ_CORE,
> -				"%s: error allocating vchiq instance\n", __func__);
> +		dev_dbg(state->dev, "%s: %s: %s: error allocating vchiq instance\n",
> +			log_cat(VCHIQ_CORE), log_type(ERROR), __func__);

All dev_dbg() calls have __func__ in them automatically, you never need
to duplicate it again as that's redundant :(

thanks,

greg k-h

