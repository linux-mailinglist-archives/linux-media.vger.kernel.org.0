Return-Path: <linux-media+bounces-4645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 931AF848749
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 16:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 432F81F24058
	for <lists+linux-media@lfdr.de>; Sat,  3 Feb 2024 15:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8594D5F854;
	Sat,  3 Feb 2024 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AAm4JX93"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13015F844;
	Sat,  3 Feb 2024 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706975907; cv=none; b=jnN43fDJWHavHdVNhkAUgWs2XHkDiywVCV27akDdnVa+HexxFMNUHI1QWl22gxpcIO6SHnTwJflD//b4UOYPs5M9UEgle6+581EY3q/d+Mc5hmNFZflYNEeIJXjWcfCaDX9RbDsC/LGbXgsUh7CbFAguxqnZAH5G1fMJqJtRqvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706975907; c=relaxed/simple;
	bh=CS+BbMpRI3hgYUmMwGUBpteHD001UQk+1jLwOQccs0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6c+JInHDI5z7mjrN14b2EM2DmNY+N/qTnGyFmadDrZTuyMZkr+LIIdr2H1P8kYJvcgKhQ3yVCjrxlYq9mjLtaZda/0i2mUM3ipZY7eW99AT1SPFUxYVq+DMVrCCF8BimSH7Oun9zp+u/347C3XVWO+Ca7PH5nDWDdWzC3hkeC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AAm4JX93; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6349CC433C7;
	Sat,  3 Feb 2024 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706975906;
	bh=CS+BbMpRI3hgYUmMwGUBpteHD001UQk+1jLwOQccs0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AAm4JX93022X8E9EIDawaTUZZWGPeBvGHwQvVp9JkfN3D02X80LSy8ni4OvYm+lGN
	 R3Yac5C1vE7ovHj7bQxaos1haX9LwXch/wHvyj3AJ6W/DH0hKiQPwiJRASq8dXAKYX
	 btUyXQU3a4IT69cCGuW9yVHBHJfCczHMDTKM5PTU=
Date: Sat, 3 Feb 2024 07:58:25 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: cec: make cec_bus_type const
Message-ID: <2024020316-resilient-camping-b059@gregkh>
References: <20240203-bus_cleanup-media-v1-0-33e8feeab912@marliere.net>
 <20240203-bus_cleanup-media-v1-1-33e8feeab912@marliere.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240203-bus_cleanup-media-v1-1-33e8feeab912@marliere.net>

On Sat, Feb 03, 2024 at 12:31:26PM -0300, Ricardo B. Marliere wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the cec_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/media/cec/core/cec-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

