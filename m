Return-Path: <linux-media+bounces-896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AEE7F5FE9
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40BAEB21451
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32A624B3D;
	Thu, 23 Nov 2023 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KyPchN12"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F424B2B;
	Thu, 23 Nov 2023 13:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC946C433C8;
	Thu, 23 Nov 2023 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745340;
	bh=nH7dXM1v48hCQEwydIRgFJ5nFhGmuyX9YZPGafz3Pxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KyPchN12hc69ZKNewTbuiSIBSITycVgAVn491PHwnXSh5qJHQYuOHLzuCgoWZ6gx9
	 AaN2/4tKha42UzAkK9QHYR/m3Hz4NTPNBPc6De4gPlv85M+gcpdsZdUl5K0k2osWED
	 EKIqaoXCwstrz/mSsvMw8BO3PuruYhlmh4NNMC40=
Date: Thu, 23 Nov 2023 13:02:01 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH 2/9] staging: vc04_services: Log using pr_err() when
 vchiq_state is unset
Message-ID: <2023112312-epic-viscosity-3848@gregkh>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107095156.365492-3-umang.jain@ideasonboard.com>

On Tue, Nov 07, 2023 at 04:51:49AM -0500, Umang Jain wrote:
> In cases, where the global vchiq state is still unset, we cannot log
> to dynamic debug (access to struct device is needed, hence potential
> NULL de-reference). Log using pr_err() instead.

No, something is wrong here, don't do that.

> In vchiq_initialise(), remove the 'goto' because it is just again
> trying to log to dynamic debug. Simply return with -ENNOTCONN after
> logging to pr_err().
> 
> In vchiq_open(), move the vchiq_log_debug() after the state pointer
> null check.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 6 ++----
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c  | 7 +++----
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 9fb8f657cc78..9fb3e240d9de 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -687,10 +687,8 @@ int vchiq_initialise(struct vchiq_instance **instance_out)
>  		usleep_range(500, 600);
>  	}
>  	if (i == VCHIQ_INIT_RETRIES) {
> -		vchiq_log_error(state->dev, VCHIQ_CORE, "%s: videocore not initialized\n",
> -				__func__);
> -		ret = -ENOTCONN;
> -		goto failed;
> +		pr_err("%s: videocore not initialized\n", __func__);
> +		return -ENOTCONN;

Here's a good reason to get rid of the crazy "this subsystem is special
so let us use a custom logging macro" logic.

Convert everything to just use real dev_*() calls so it makes it obvious
what is happening and how it all is working.  It will save you from
doing stuff like this in the future as you will "know" that there isn't
a valid device pointer here.

thanks,

greg k-h

