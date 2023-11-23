Return-Path: <linux-media+bounces-900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 800A17F5FEE
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BAAB281F48
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A29124B4A;
	Thu, 23 Nov 2023 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KFCrXext"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D388E24A0D;
	Thu, 23 Nov 2023 13:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3785C433C8;
	Thu, 23 Nov 2023 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745359;
	bh=zUbrdBm8Q2+P04oC+jzJgrh1Nr0G4L+l33QE59HItts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KFCrXextGh4GSnx37HAmDmG+R0W8UvxUd1JKSUBjjp3UvSBfPViS4evFVtCuGHOHm
	 Qymn+moB4UzUOr/UD9mvWZgKwvEZnwxMthLHeKi7UJlY5tOirc2mqbaAgego12HM0R
	 TZ262UJt1yakeKtFGvA0M5PkU8USgwSBDWoVc24Y=
Date: Thu, 23 Nov 2023 13:14:10 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH 0/2] staging: vc04_services: Use %p to log pointer
Message-ID: <2023112334-projector-spoilage-fcbc@gregkh>
References: <20231107165523.638555-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107165523.638555-1-umang.jain@ideasonboard.com>

On Tue, Nov 07, 2023 at 11:55:21AM -0500, Umang Jain wrote:
> %lx is used to print the unmodified pointer address for debugging.
> %p will print the hashed pointer address to avoid leaking information
> about kernel memory layout to userspace. But when `no_hash_pointers`
> is passed as kernel parameter, unmodified pointer address will be
> printed.
> 
> Hence, drop %lx in favour of %p. For debugging purposes, one can
> easily depend on `no_hash_pointers`.
> 
> This also solves the following smatch warnings:
> service_callback() warn: argument 7 to %lx specifier is cast from pointer
> service_callback() warn: argument 11 to %lx specifier is cast from pointer
> service_callback() warn: argument 12 to %lx specifier is cast from pointer
> service_callback() warn: argument 13 to %lx specifier is cast from pointer
> vchiq_release() warn: argument 7 to %lx specifier is cast from pointer

Doesn't apply as I didn't take your other patch series.  resend it when
you have that one fixed up?

thanks,

greg k-h

