Return-Path: <linux-media+bounces-1538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C916803278
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16829280FD8
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5C9241E5;
	Mon,  4 Dec 2023 12:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AfFK+HOg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9D2375B;
	Mon,  4 Dec 2023 12:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E4AC433C7;
	Mon,  4 Dec 2023 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701692519;
	bh=+MF1TQtCp94CVORJQ7s0p1ZHpXbLCbspCjVzcdll2n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfFK+HOgosUm6FfM0C1uZB/77869CB60mNLJlxrq2hETV1jDkD+Sy1rI+A3DN7ezM
	 vbnJ5u/uvQHkGoS9//wZRHIXroYAqEACNlTJVVWwB8000cK986x1HwY2nkdsp1uvvQ
	 VRZY/6QzqRpm2ihLspcYbTXmUn4liAa/UMHTqauA=
Date: Mon, 4 Dec 2023 08:07:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH v2 1/2] staging: vc04_services: Use %p to log pointer
 address
Message-ID: <2023120430-calibrate-defender-cee4@gregkh>
References: <20231128202007.489294-1-umang.jain@ideasonboard.com>
 <20231128202007.489294-2-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128202007.489294-2-umang.jain@ideasonboard.com>

On Wed, Nov 29, 2023 at 01:50:06AM +0530, Umang Jain wrote:
> Solves the following Smatch warnings:
> service_callback() warn: argument 7 to %lx specifier is cast from pointer
> service_callback() warn: argument 11 to %lx specifier is cast from pointer
> service_callback() warn: argument 12 to %lx specifier is cast from pointer
> service_callback() warn: argument 13 to %lx specifier is cast from pointer
> 
> %p will print the hashed pointer to dynamic debug.
> In order to print the unmodified pointer address, one can use the
> `no_hash_pointers` via kernel parameters.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c  | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Does not apply to my tree, is it because I just took your other patch?

thanks,

greg k-h

