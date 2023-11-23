Return-Path: <linux-media+bounces-899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E473D7F5FED
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F21281E41
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B06E24B57;
	Thu, 23 Nov 2023 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="syQH2IQO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8141C24B3D;
	Thu, 23 Nov 2023 13:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F165C433C9;
	Thu, 23 Nov 2023 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745355;
	bh=7+vPY/xAkpMJVVn/7/Cqls5PobuBs8AnIsNePRvDBig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syQH2IQOe1YlsOkA294m5TzZip7a2FJpx92iS8AB0mGq6lwYyF84jMgzeAl+UnGJd
	 +tp8J7AHDcrVgiK10ZcpHYWHnwvvsJM7GE6k/46pC3cdHFZLTa5CC0FFwyr+Aqznly
	 /DQserOsCFyNa2y2OHC99xSkaWBchYqxDz3KJ0kc=
Date: Thu, 23 Nov 2023 13:11:39 +0000
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
Subject: Re: [PATCH 4/9] staging: vc04_services: Shorten helper function name
Message-ID: <2023112339-endorse-swaddling-be63@gregkh>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-5-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107095156.365492-5-umang.jain@ideasonboard.com>

On Tue, Nov 07, 2023 at 04:51:51AM -0500, Umang Jain wrote:
> Shorten the helper log_category_str() to log_cat().
> Going forwards, this will be used at multiple places with
> dev_dbg().
> 
> No functiional changes intended in this patch.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_core.h     | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 161358db457c..cc7bb6ca832a 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -39,7 +39,7 @@ enum vchiq_log_category {
>  	VCHIQ_SUSPEND,
>  };
>  
> -static inline const char *log_category_str(enum vchiq_log_category c)
> +static inline const char *log_cat(enum vchiq_log_category c)

This is a bad name for a subsystem-wide function name, why is this
needed at all?

thanks,

greg k-h

