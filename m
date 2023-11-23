Return-Path: <linux-media+bounces-895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B00C47F5FE8
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EC1EB21543
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2145F24B44;
	Thu, 23 Nov 2023 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lWjwKCgV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C81C24A08;
	Thu, 23 Nov 2023 13:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B97FC433C8;
	Thu, 23 Nov 2023 13:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745336;
	bh=ZPtKgbpZzFUFQPD2alKCmhEerwJY/Y+95EB9EdHdGUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWjwKCgV6MYqxd/uuVbuZoUffAd9OOTW2pU6whP/FBXGAfGvQA8IzMkGyfm9C/x9Q
	 6e/91aVepueICuvy7F7SPogdsi5oKpm/erx5+mtfHNyAi4LkmW57bgCzCEy20CyeIu
	 hreQZ/vtKf3CpY9fncf8rSWX/0LsiiG0Dk4SzXDI=
Date: Thu, 23 Nov 2023 12:58:03 +0000
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
Subject: Re: [PATCH 1/9] staging: vc04_services: vchiq_core: Log through
 struct vchiq_instance
Message-ID: <2023112346-briskness-impaired-f545@gregkh>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107095156.365492-2-umang.jain@ideasonboard.com>

On Tue, Nov 07, 2023 at 04:51:48AM -0500, Umang Jain wrote:
> The handle_to_service() helper can return NULL, so `service` pointer
> can indeed be set to NULL. So, do not log through service pointer
> (which will cause NULL-deference), instead, use the vchiq_instance
> function argument to get access to the struct device.
> 
> Fixes: f67af5940d6d("staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debug")
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Also, please send this as a stand-alone patch so we can apply it for
6.7-final.

thanks,

greg k-h

