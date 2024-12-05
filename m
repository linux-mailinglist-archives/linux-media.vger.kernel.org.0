Return-Path: <linux-media+bounces-22662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD88B9E4F39
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E5CC2870E8
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C191E1CEE92;
	Thu,  5 Dec 2024 08:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wHDSaJoT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD407E9
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385903; cv=none; b=q+kuMDtla1dye4b7p/TlwdmVu0QjjVLYbMtYtNWYSixcdtZjXdX2pAM68v5vUGVPfUKYjYSzkpefTzoUMuz4L3W/RsZcI4JGZnC+YjAnasEvYLLVKAm5sxilza3UMwI69HzPDqG/epnQYdSYaknzb4fHzcYc2CKuB7BMXYyvdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385903; c=relaxed/simple;
	bh=jATMfhZNpP5P5dBYTS2qm4NlreKCNVWC9s2eAnJASs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXNMnrEhPb/n8vpw6rQazvC5FXsgeaBSkIKB+4hvA8klIowJCrV+WCNHgdCPV54f0gbkqLfZKuCkinqitVzzFd4QYWv2IqWAFZll5jz5dfEm2v54qoCXPyCRx6lOMdWKlxc8RweYbEsuYjNy93Y/eHNoh3wuaT0H9rvWnhGjYoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wHDSaJoT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:459e:1ee6:26ea:2d31])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D11D7E2;
	Thu,  5 Dec 2024 09:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733385864;
	bh=jATMfhZNpP5P5dBYTS2qm4NlreKCNVWC9s2eAnJASs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wHDSaJoT3bX02LKgETg8n07r4cA+ZbD/TQLUb1ehJJHOhVaO9a3YnfJGfxApWSYZX
	 isyjhLrP/eHpngJ6ohKQS8s9E4C0MQBiTSb0T/ytCax3G+aLIYNnKmxJ0bgd9/hdrW
	 i4lzVQ2hSSOBODxgn7quTYWJOnNbNHuzFSOdV22Q=
Date: Thu, 5 Dec 2024 09:04:49 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 2/9] media: Documentation: Add a hyphen to list-based
Message-ID: <sl5k4kmdxcrgnskxrw5cbqnrh355zs77crdrfh2a3rjshpij7l@gnatqv5s2wnq>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129095142.87196-3-sakari.ailus@linux.intel.com>

Hi Sakari

On Fri, Nov 29, 2024 at 11:51:35AM +0200, Sakari Ailus wrote:
> Add a hyphen to list-based for uniform spelling in camera-sensor.rst.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  Documentation/userspace-api/media/drivers/camera-sensor.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 8e1083417ae1..9a1e8aa9fc77 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -26,10 +26,10 @@ of cropping and scaling operations from the device's pixel array's size.
>
>  An example of such a driver is the CCS driver.
>
> -Register list based drivers
> +Register list-based drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> -Register list based drivers generally, instead of able to configure the device
> +Register list-based drivers generally, instead of able to configure the device
>  they control based on user requests, are limited to a number of preset
>  configurations that combine a number of different parameters that on hardware
>  level are independent. How a driver picks such configuration is based on the
> @@ -67,7 +67,7 @@ is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
>  the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
>  sub-device. The unit of that control is pixels per second.
>
> -Register list based drivers need to implement read-only sub-device nodes for the
> +Register list-based drivers need to implement read-only sub-device nodes for the
>  purpose. Devices that are not register list based need these to configure the
>  device's internal processing pipeline.
>
> --
> 2.39.5
>
>

