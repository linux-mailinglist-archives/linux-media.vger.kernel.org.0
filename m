Return-Path: <linux-media+bounces-17993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F05329719B8
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998E7285112
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C96E1B790E;
	Mon,  9 Sep 2024 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wSZYGgpQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07D21B5ECA;
	Mon,  9 Sep 2024 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725885830; cv=none; b=sCTI5znuhsFO0qy51qK2NDGNZRxnJZHhriRsJfcFl3cKOzUZT67kMVanqeSH4drQRpaj0BfNQoxRF+ENNXK1Ssw8p5ZB3cgyCmSLrpNlH954ciy/Pgb5xsRM1PqpCIPVPW8F+L/t+xDN6I087v4DfbRJQGbUIVmW8HMSzLIFtbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725885830; c=relaxed/simple;
	bh=SbloTQbPcCrHzydoJVv/i+WcWaUlq80HHnTu8eN4mKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyj1zICC2Yt9TzX5kZGJ4HXqUJ48n9FyO1XZJWx1f3038QuGezcf+NgCHphDtlMZuRvxjW8StAkhnX+cAE9L1q/TP8ZfkBUnNX2et8C+TM2O5F+m1e1Wk/USOMTR7haAhEKJ7JAI799e+nniRh3dALod1qIatQOF969Dlv+nXR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wSZYGgpQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D7853DA;
	Mon,  9 Sep 2024 14:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725885750;
	bh=SbloTQbPcCrHzydoJVv/i+WcWaUlq80HHnTu8eN4mKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wSZYGgpQsN5941g6XAXj4ALxjFZj2oLCXCgSMgB5hWduNEpPlrQF4h5pdYt9hV9nY
	 5YZ89HxFTLVJcbCVBSSD/0Lf5z5ESSkZO6MptvuyTiH+ZWqxXY1fT6SGlKtJprgeEs
	 CgFZ8vObGqmzShJu2sO5eeVYnGNDrBrMN2Fy8lEo=
Date: Mon, 9 Sep 2024 15:43:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: sakari.ailus@linux.intel.com, mhecht73@gmail.com,
	michael.roeder@avnet.eu, hverkuil@xs4all.nl,
	Martin Hecht <martin.hecht@avnet.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] media: i2c: alvium: add camera sysfs attributes
Message-ID: <20240909124342.GH15491@pendragon.ideasonboard.com>
References: <20240909105831.684371-1-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909105831.684371-1-tomm.merciai@gmail.com>

Hi Tommaso,

On Mon, Sep 09, 2024 at 12:58:29PM +0200, Tommaso Merciai wrote:
> Hi All,
> With this patch I'm going to add some sysfs attributes to the alvium-csi2 driver.

Why ? You need to convince us that this shouldn't be done with existing
V4L2 mechanisms instead, like controls, or VIDIOC_LOG_STATUS. I expect
the answer to depend on the attributes.

> This patch adds the following sysfs attributes:
> 
>  - cci_register_layout_version:
>    Shows current cci regs layout version of the camera.
> 
>  - csi_clock_mhz:
>    Shows current alvium camera csi2 freq.
> 
>  - device_capabilities:
>    Show the capabilities of the current camera.
> 
>  - device_guid:
>    Shows the current device guid as programmed by the vendor during production.
> 
>  - device_version:
>    Shows the version of the alvium hardware.
> 
>  - family_name:
>    Shows the Alvium family name, like Alvium CSI-2, GM2, FP3, ...
> 
>  - genio:
>    Generic camera input/output xfer for using user programmable part of the flash.
>    Reading and writing camera's user programmable flash memory.

Complete and absolute NACK. We don't expose direct I2C access to
registers.

>  - lane_count:
>    Shows device current CSI2 camera's lanes number.
> 
>  - manufacturer_info:
>    Shows manufacturer info as programmed by the vendor during production.
> 
>  - manufacturer_name:
>    Shows manufacturer name as programmed by the vendor during production.
> 
>  - mode:
>    As stated by the BCRM Ref Manual camera can work in 2 modes BCM/GENCP.
>    This attribute is responsible for switching the camera mode and check the current mode.

You will need to be very, very convincing to get a writable sysfs
attribute accepted.

>  - model_name:
>    Shows model name as programmed by the vendor during production.
> 
>  - serial_number:
>    Shows camera serial number as programmed by the vendor during production.
> 
>  - user_defined_name:
>    Shows camera user defined name as programmed by the vendor during production.
> 
> Thanks & Regards,
> Tommaso
> 
> Tommaso Merciai (1):
>   media: i2c: alvium: add camera sysfs attributes
> 
>  drivers/media/i2c/alvium-csi2.c | 484 ++++++++++++++++++++++++++++++++
>  drivers/media/i2c/alvium-csi2.h |  25 ++
>  2 files changed, 509 insertions(+)

All sysfs attributes are ABIs, and need to be documented in
Documentation/ABI/. I expect you'll need one patch per attribute. Don't
forget to CC linux-doc@vger.kernel.org on the patches.

-- 
Regards,

Laurent Pinchart

