Return-Path: <linux-media+bounces-20048-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2219AB1C4
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 17:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A50B21F22758
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 15:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C461F1A2C0E;
	Tue, 22 Oct 2024 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BUNq4qMF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A47E1A2630
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609986; cv=none; b=I2sludMsHgkkVngU4C03pDEkh9m8HAC16MrXqBfyCxOrCy0HxCQmN49riugun2jem6k82GEXuK54v+FkbUKiYUN++44fPFCyUvD6giZtl84/5XZ1qhbGgH69oizD8X/V7qYbpe+WNs4n/zc68zqm7ENd0hoQj/dHvDYspTpaY1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609986; c=relaxed/simple;
	bh=iwwOj3Uz2jvNxLehQqG7HtjmCtv1dhjCDUqCBeb70Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmhtTgQ0vAde/vvsmfuF+g7BXJYe8I2733qNZ1qiwoxFj2rx32FuvFca1DLWfNDNw5ZrxQIZuMtDHxpOWGJn/wgZwMSEkgXlnI4zdVOeSOzs8QwSZiBPcTmQiuSnhXFLFR1jWKLOnGKOgqtKu+Tqk2uaddztWExLo377IhLltwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BUNq4qMF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5ADCCCC;
	Tue, 22 Oct 2024 17:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729609875;
	bh=iwwOj3Uz2jvNxLehQqG7HtjmCtv1dhjCDUqCBeb70Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUNq4qMF23Z/6Ld9ubprGfgQvLofzAdHAxHSQJ9bCmBJYY4/ekzAAtm1CFr2YCBx9
	 Qc67bVUf9AcLK3Hfavv56unZyVPhdp8tdWboeyocelaz7azpMema5kSZzGPp/S6BZx
	 2V9WC3EwT6MR2Wh3ALxv1jl1G84w6l9XPc6TOkzU=
Date: Tue, 22 Oct 2024 17:12:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 2/4] media: Documentation: Reword split of sensor driver to
 two classes
Message-ID: <x2ho2gb7v45a5dyj4urs6czbfftpalsb4kpg3ypq657nodfq5u@st74gzew454p>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011075535.588140-3-sakari.ailus@linux.intel.com>

Hi Sakari

On Fri, Oct 11, 2024 at 10:55:33AM +0300, Sakari Ailus wrote:
> The sensor drivers do not configure the output size of the sensors but the
> entire internal pipeline. Reflect this in the documentation.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index d82cd803e337..ad4049ff7eec 100644
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
> +The camera sensors have an internal processing pipeline including cropping and

As a non native speaker I'm probably wrong, but "The" followed by a plural
name to identify a category sounds weird to me.

What about just
"Camera sensors have"

> +binning functionality. The sensor drivers belong to two distinct classes, freely

functionalities ?

Same question for "The sensor drivers", just "Sensor drivers" ?

> +configurable and register list based drivers, depending on how the driver

s/drivers/ones ?

> +configures this functionality.

configures the pipeline.

?

>
>  Freely configurable camera sensor drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
> 2.39.5
>
>

