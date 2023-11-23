Return-Path: <linux-media+bounces-903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C047F608C
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 14:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39EB81C21029
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 13:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF802556B;
	Thu, 23 Nov 2023 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NfZ7kKJb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4A0D42
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 05:42:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9ACF5DB7;
	Thu, 23 Nov 2023 14:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700746920;
	bh=ipKTtdDTQQuc8CbZO5+BiK1yiMtst+GzoqvW0dIfOWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NfZ7kKJbp5Wetza26Dc230y/OoTY9inYiaMZm8htbLkyMSxHaUNHXBzgg2V1ZSM59
	 +j1cImBybILAOrW/LzrsUm9bqNO8CxC7WZS2DRfBRrOaFWiHAReKq64qAqQPcSgFl2
	 hmtFW4Mq84VpZrYAcDoI2YuBP3r02WHC2UsMhBeQ=
Date: Thu, 23 Nov 2023 15:42:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH 1/9] staging: vc04_services: vchiq_core: Log through
 struct vchiq_instance
Message-ID: <20231123134239.GC16377@pendragon.ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com>
 <20231107095156.365492-2-umang.jain@ideasonboard.com>
 <2023112324-boxing-amiss-6df8@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023112324-boxing-amiss-6df8@gregkh>

On Thu, Nov 23, 2023 at 12:57:33PM +0000, Greg Kroah-Hartman wrote:
> On Tue, Nov 07, 2023 at 04:51:48AM -0500, Umang Jain wrote:
> > The handle_to_service() helper can return NULL, so `service` pointer
> > can indeed be set to NULL. So, do not log through service pointer
> > (which will cause NULL-deference), instead, use the vchiq_instance
> > function argument to get access to the struct device.
> > 
> > Fixes: f67af5940d6d("staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic debug")
> 
> You need a space there :(

I have this in my .bashrc:

gpf() {
	git show --pretty=fixes -s ${1:-HEAD} | wl-copy
}

It's quite handy.

-- 
Regards,

Laurent Pinchart

