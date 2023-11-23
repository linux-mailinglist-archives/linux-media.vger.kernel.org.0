Return-Path: <linux-media+bounces-907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6C7F60E4
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5901AB21647
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37662E829;
	Thu, 23 Nov 2023 13:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jVLCBZDs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE84D43;
	Thu, 23 Nov 2023 05:53:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73D21E52;
	Thu, 23 Nov 2023 14:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700747595;
	bh=5TiUrShDodvlqY5geajHll5Q6vI9HOwA3wBbcos2dC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jVLCBZDseUOrzUwy2DDcSAReWnc9HxHPxwxAlwZnB6Njqy4RBifc2mAytvAxNFRgB
	 qohjo7KIzEiB84s+a3HN8WxXSKusoRK5cEJ6UHMsBUHvASmrv5tNfE5nDCadMXR06r
	 gsRT3PTZkobfJ01+dgUMuHVfOcZo3Tr83+qgxZhU=
Date: Thu, 23 Nov 2023 15:53:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
	kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Dan Carpenter <error27@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] fixup! staging: vc04_services: bcm2835-isp: Add a more
 complex ISP processing component
Message-ID: <20231123135354.GE16377@pendragon.ideasonboard.com>
References: <20231109210309.638594-11-umang.jain@ideasonboard.com>
 <20231113140755.425365-1-umang.jain@ideasonboard.com>
 <2023112352-ravishing-garter-c9fc@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023112352-ravishing-garter-c9fc@gregkh>

On Thu, Nov 23, 2023 at 12:56:07PM +0000, Greg KH wrote:
> On Mon, Nov 13, 2023 at 09:07:55AM -0500, Umang Jain wrote:
> > Setup DMA Mask
> > ---
> > I realised while (re)creating the test branches (sent in reply to the cover
> > letter), I missed to squash this hunk in
> > "staging: vc04_services: bcm2835-isp: Add a more complex ISP processing component"
> > before sending out the series.
> > 
> > Sending it as a fixup! for now. 
> 
> What does that mean?  What can I do with this?

Umang, we don't do that for upstream kernel development. If a patch
needs a new version, you should send a new version. In some subsystems
maintainers will prefer if you only resubmit the offending patch when
the series is large (as a "vN.1" instead of a vN+1), while in other
cases resending the whole series is preferred.

Greg, I don't think Umang wanted you to do anything with this patch :-)
This was meant to tell reviewer that the issue was known already.

-- 
Regards,

Laurent Pinchart

