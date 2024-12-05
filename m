Return-Path: <linux-media+bounces-22663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C75409E4F3E
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83CD9287975
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414901CEEB4;
	Thu,  5 Dec 2024 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sBZk3OTl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125341CEAC9
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733385993; cv=none; b=qcsCBCdH7jNOOfEeOkO3flOD9PSrqN1DzMlqfGFQtL1q3A3sMj17gG+RCi7sfvsT0bIJQ6ZT2fjjS28FrJH5kqwbTDtUJkzYJ/HaC3lMriQdxaTuoy17epUfJs5blG7yz/9Vz08Rha4NpmdXV4jhgTHrKvAuKSLOwUyEKRcZBgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733385993; c=relaxed/simple;
	bh=AUMcEjFT4iacrfJ8IP+WzJYGeGVFbvu4Ny9jM6TuONA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg2t820OkHyc8UUrzmSpBraddDZeBqHp6Yx6JFbfDGT53pXWh3Wa8i6e7sBDGD7aJQLcZXgb9L6Z1Bzd30ikpag+ClUy8YaHiAE3SXYC7t5rNtWBV14oqk+RtlCCYF/bwnHfbixpPGjTw9r4Wgq0QeFv7nVpSqYEphNLDMvCcbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sBZk3OTl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:459e:1ee6:26ea:2d31])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE1C87E2;
	Thu,  5 Dec 2024 09:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733385961;
	bh=AUMcEjFT4iacrfJ8IP+WzJYGeGVFbvu4Ny9jM6TuONA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBZk3OTle0AoBT+osBFNg0ymdLxhayx+h4XOpJYfM8h1ScZhHjKG2PbyctiGeKj1o
	 Z/aIX+qz6yRRniFNZSyq6aMnkmqt1lVCwQvqhXWQoXHcomAImK78EnIcqQPUyiyoQA
	 DXfvqd/JwGibDFmpLbH4QWxxPBhFt2kxyTh7qXqU=
Date: Thu, 5 Dec 2024 09:06:26 +0100
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
Subject: Re: [RFC v3 3/9] media: Documentation: Reword split of sensor driver
 to two classes
Message-ID: <c4xzkyubygnkpwyjiedtxdwblczsdf56hfb2h56ewgkebzs73n@ktzvfwkeiaad>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129095142.87196-4-sakari.ailus@linux.intel.com>

Hi Sakari

On Fri, Nov 29, 2024 at 11:51:36AM +0200, Sakari Ailus wrote:
> The sensor drivers do not configure the output size of the sensors but the
> entire internal pipeline. Reflect this in the documentation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 9a1e8aa9fc77..bc55c861fb69 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -10,11 +10,13 @@ used to control the camera sensor drivers.
>
>  You may also find :ref:`media_writing_camera_sensor_drivers` useful.
>
> -Frame size
> -----------
> +Sensor internal pipeline configuration
> +--------------------------------------
>
> -There are two distinct ways to configure the frame size produced by camera
> -sensors.
> +Camera sensors have an internal processing pipeline including cropping and
> +binning functionality. The sensor drivers belong to two distinct classes, freely
> +configurable and register list-based drivers, depending on how the driver
> +configures this functionality.
>
>  Freely configurable camera sensor drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
> 2.39.5
>
>

