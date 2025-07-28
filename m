Return-Path: <linux-media+bounces-38567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF0BB13CA3
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 402EE545671
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33D926B767;
	Mon, 28 Jul 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LSQdy1mY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7026A0EB
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711458; cv=none; b=AgQt/lUrpLSXz5cQvJz7SrS3qpc8d8aztDHxYCSgygbGFxLf5O665L2T2SglHKVCww8tsYaZ1mtpMX6klpNepMb26qDT5h9YUnCBmIHxD5z2nCn96QZmge9YtbI2WoJdtlZNRMDBQ0TMzsEe9iLBrqMqQs/IA2SGwSxKZ5VsIlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711458; c=relaxed/simple;
	bh=59yuaZvojlSeBTzMzUjK17M8s2l3ESnNJrjxAO4+6PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQDh4aAxdmbul89ArPhuAaCUU1OoGMTOvIKXcvltf6eZjdgOsQKOCvds/gMGBuYPJI9y5zrhpV2K9kPpKG7Amw9xZep2Bvp4ieJPVLgFIS5Dffmb2HUypULNIjhsb4q492bnBQ0gEtPjwAnNT/c9vxIqhB2nvT/N7+hWTaFQ1Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LSQdy1mY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-29.net.vodafone.it [5.90.139.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FC5642B;
	Mon, 28 Jul 2025 16:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753711412;
	bh=59yuaZvojlSeBTzMzUjK17M8s2l3ESnNJrjxAO4+6PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSQdy1mYke9thTNQU7MQlhK4LPpMgmb1U6hFk86cHy6t/2Mdm5Rh19wDr2Zmc02CV
	 oFBl+sfWftPg+NOckxm2zEycpjBuTGbNao9tT8i14Zzupan4niB1kUgyihQlVeAwkD
	 kpSGdktRsjrb72s52r1S9UbkFgivEx4htGupaU0w=
Date: Mon, 28 Jul 2025 16:04:10 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH 0/2] media: Make v4l2_subdev_stream_config private
Message-ID: <gzp4zzk3ie6y47g5gp43kcyhmfh5f6gme5iep63pw2rqt72n4x@56qpwjgtvdlb>
References: <20250630004602.23075-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630004602.23075-1-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Mon, Jun 30, 2025 at 03:46:00AM +0300, Laurent Pinchart wrote:
> Hello,
>
> This small patch series attempts to avoid usage of the
> v4l2_subdev_stream_config structure in drivers. The rationale is that
> the structure was meant to be an implementation detail. Recent
> discussions about how we store stream config led to considering a need
> to rework the internals, and usage of the structure in drivers makes
> this more difficult.
>
> Patch 1/2 drops usage of the structure in the ds90ub913 driver, and
> patch 2/2 then makes the structure private to v4l2-subdev.c.
>
> Ideally we should also make v4l2_subdev_pad_config private, but it has a
> few more users:
>
> drivers/media/pci/saa7134/saa7134-empress.c
> drivers/media/platform/atmel/atmel-isi.c
> drivers/media/platform/intel/pxa_camera.c
> drivers/media/platform/marvell/mcam-core.c
> drivers/media/platform/renesas/renesas-ceu.c
> drivers/media/platform/via/via-camera.c
> drivers/staging/media/deprecated/atmel/atmel-isc-base.c
>
> All those drivers are video-centric drivers that use
> v4l2_subdev_pad_config to implement TRY_FMT. I think we could use
> v4l2_subdev_call_state_try() in those drivers, like done in
>
> commit f076057f0107c3ef890bfad8d6658387504e7f11
> Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Date:   Fri Jul 1 14:15:59 2022 +0100
>
>     media: stm32: dcmi: Fix subdev op call with uninitialized state
>
> I however lack the ability to test that beside compile testing.
>
> Laurent Pinchart (2):
>   media: i2c: ds90ub913: Stop accessing streams configs directly
>   media: v4l2-subdev: Make struct v4l2_subdev_stream_config private
>

Sorry, the series went ignored...

For both patches
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  drivers/media/i2c/ds90ub913.c         | 17 +++++++++--------
>  drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 25 +------------------------
>  3 files changed, 34 insertions(+), 32 deletions(-)
>
>
> base-commit: c0b1da281d84d33281fc49289f0c7f8aada450ff
> prerequisite-patch-id: e09080849e2b6fabfc70eb12b5c99c42111d3823
> --
> Regards,
>
> Laurent Pinchart
>
>

