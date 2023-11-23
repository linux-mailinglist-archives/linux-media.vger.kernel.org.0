Return-Path: <linux-media+bounces-892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B06C7F5FE3
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00108B214E7
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A7C24B38;
	Thu, 23 Nov 2023 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OHST/eVs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641824A08;
	Thu, 23 Nov 2023 13:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DBFC433C8;
	Thu, 23 Nov 2023 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700745322;
	bh=1geUD0PxSwl4jgapDcrWydrHt9Icc3WU+vTDHs1Kn8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHST/eVsPlt34bKRusq/pA0fPojvNhTL8M91927W7+2fn/NY8QZ38WSt1xoKwwM0P
	 BVRwq6EjiXeZDYhZmkGPnfiihpw+jfK+gtvuGEYRCVApIrUNozGcUgo48eNIsX3LVI
	 ujj+7tow3XtFTuG26iM4s+ToDrepe5MvcpVp8pQQ=
Date: Thu, 23 Nov 2023 12:56:07 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, kernel-list@raspberrypi.com,
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Dan Carpenter <error27@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] fixup! staging: vc04_services: bcm2835-isp: Add a more
 complex ISP processing component
Message-ID: <2023112352-ravishing-garter-c9fc@gregkh>
References: <20231109210309.638594-11-umang.jain@ideasonboard.com>
 <20231113140755.425365-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113140755.425365-1-umang.jain@ideasonboard.com>

On Mon, Nov 13, 2023 at 09:07:55AM -0500, Umang Jain wrote:
> Setup DMA Mask
> ---
> I realised while (re)creating the test branches (sent in reply to the cover
> letter), I missed to squash this hunk in
> "staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component"
> before sending out the series.
> 
> Sending it as a fixup! for now. 

What does that mean?  What can I do with this?

confused,

greg k-h

