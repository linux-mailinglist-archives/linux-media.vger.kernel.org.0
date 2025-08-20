Return-Path: <linux-media+bounces-40486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A59C3B2E58D
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 21:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DADEA7AD975
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 19:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DE728000F;
	Wed, 20 Aug 2025 19:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SSfd4Die"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01ED27B32A;
	Wed, 20 Aug 2025 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755717928; cv=none; b=FYWIcwGbq1aGLe+vuft83K2acOwff1+vAPnA/R4GyjVieV/XgyPG15aftIKMplzUaM7y31Do2aHTavbIrTzxS9mOsEyTXCX+0hijsjKNPJgUvMIWhEYi7jkjd60Q3eNANyOzNrjd8yDXQouvaEZUGF/vfZwjhmSOFBT+7368j3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755717928; c=relaxed/simple;
	bh=OaJ+PXLz7ARjupcj+6znF62eHM/3YCK8NV41zxUE6W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6G06Sw9Obb8wC8xXh0c7UAPkp8gdkgm6yyg1PUaUTVegZ7+am/wf6pziBfeNNgSk5xTnFpTEPLEOucDDUJt9kjCKi8U9HXOjQFQ/SIYcUKs/HmvpwjJVlrXGp4Rqm6C5RIDPbrRmRG7lzIzKKQvQysG5UsSFOAH71ZRBIwaN8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SSfd4Die; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 56B516A6;
	Wed, 20 Aug 2025 21:24:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755717866;
	bh=OaJ+PXLz7ARjupcj+6znF62eHM/3YCK8NV41zxUE6W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSfd4Dies8ZjERJ70j0zYiJkTuJWcgJ4+4tOoYIMR3JDT3tM/G5+JmzW9PPhE83V9
	 p81pXRCwszjJMEx5wqZNtHlFKhgy/kgJD3kfQE9mF4FGjXez0Wb1sM7fFU2D/5mWVO
	 1OE9anmLuBS0EGhipvcya/CSJDBARBBiIArpFDWQ=
Date: Wed, 20 Aug 2025 22:25:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Martin Kepplinger-Novakovic <martink@posteo.de>
Cc: mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: check return value of
 media_pad_remote_pad_first()
Message-ID: <20250820192501.GA10430@pendragon.ideasonboard.com>
References: <20250205172957.182362-1-martink@posteo.de>
 <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
 <20250820140135.GA6190@pendragon.ideasonboard.com>
 <af64e20ba242d4742f650057254029257a40ae79.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af64e20ba242d4742f650057254029257a40ae79.camel@posteo.de>

On Wed, Aug 20, 2025 at 02:54:35PM +0000, Martin Kepplinger-Novakovic wrote:
> Am Mittwoch, dem 20.08.2025 um 17:01 +0300 schrieb Laurent Pinchart:
> > On Thu, Feb 06, 2025 at 08:49:37AM +0000, Martin Kepplinger wrote:
> > > Am Mittwoch, dem 05.02.2025 um 17:29 +0000 schrieb Martin Kepplinger-Novaković:
> > > > media_pad_remote_pad_first() return NULL if "no enabled link has been found".
> > > > Check for that.
> > > > 
> > > > backstory
> > > > =========
> > > > While trying to get a (Y10 grey) sensor working on imx8mp (v6.12.12 now and
> > > > I know the hardware works on an ancient nxp-kernel),
> > > > I tried to enable the sensor link, set formats and stream:
> > > 
> > > btw, that's roughly the
> > > driver: 
> > > https://github.com/VC-MIPI-modules/vc_mipi_nxp/tree/master/src
> > > that might need additions to with recent mainline kernels. Will the
> > > sensor be the reason for the link not being found here?
> > 
> > I've submitted
> > https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchart@ideasonboard.com,
> > which should fix this issue in a more generic way.
> 
> Hi, thank you. As posted over there, this indeed fixes the crash
> itself.
> 
> P.S.:
> Not that you should care :) But as for my specific "vision components"
> sensor I want to use here, where this rpi-driver exists:
> https://github.com/VC-MIPI-modules/vc_mipi_raspi/blob/main/src/vc_mipi_camera/vc_mipi_camera.c
> a script like
> 
> media-ctl -d 1 --links "'vc_mipi_camera 3-001a':0->'csis-
> 32e50000.csi':0[1]"
> 
> # format settings for mipi rx and ISI
> media-ctl -d "platform:32e00000.isi" --set-v4l2 '"vc_mipi_camera 3-001a":0[fmt:Y10_1X10/2592x1944 field:none]'
> media-ctl -d "platform:32e00000.isi" --set-v4l2 '"csis-32e50000.csi":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
> media-ctl -d "platform:32e00000.isi" --set-v4l2 '"crossbar":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
> media-ctl -d "platform:32e00000.isi" --set-v4l2 '"mxc_isi.0":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
> 
> v4l2-ctl -d /dev/video2 --set-fmt-video=width=2592,height=1944,pixelformat='Y10 '
> v4l2-ctl --verbose --device=/dev/video2 --stream-mmap --stream-count=10
> 
> 
> still fails with
> 
> 
> [   34.642252] vc_mipi_camera 3-001a: vc_core_set_format(): Set format: 0x200a (Y10_1X10)
> [   34.650227] vc_mipi_camera 3-001a: vc_core_try_format(): Try format 0x200a (Y10_1X10, format: 0x2b)
> [   34.659284] vc_mipi_camera 3-001a: vc_core_try_format(): Checking mode 0 (format: 0x2b)
> [   34.667295] vc_mipi_camera 3-001a: vc_core_calculate_max_exposure(): period_1H_ns: 7407, vmax.max: 1048575, vmax.min: 9
> [   34.678083] vc_mipi_camera 3-001a: vc_core_get_optimized_vmax(): vmax_def: 4500, v_factor: 0, height: 1944/1944
> [   34.688178] vc_mipi_camera 3-001a: vc_core_calculate_max_frame_rate(): period_1H_ns: 7407, vmax: 4500/4500, max_frame_rate: 30002
> [   34.699833] vc_mipi_camera 3-001a: vc_core_update_controls(): num_lanes: 2, format 43, exposure.max: 7766728 us, framerate.max: 30002 mHz
> [   34.712184] vc_mipi_camera 3-001a: vc_core_set_frame(): Set frame (left: 0, top: 0, width: 2592, height: 1944)
> [   34.722208] vc_mipi_camera 3-001a: vc_core_calculate_max_exposure(): period_1H_ns: 7407, vmax.max: 1048575, vmax.min: 9
> [   34.733000] vc_mipi_camera 3-001a: vc_core_get_optimized_vmax(): vmax_def: 4500, v_factor: 0, height: 1944/1944
> [   34.743112] vc_mipi_camera 3-001a: vc_core_calculate_max_frame_rate(): period_1H_ns: 7407, vmax: 4500/4500, max_frame_rate: 30002
> [   34.754768] vc_mipi_camera 3-001a: vc_core_update_controls(): num_lanes: 2, format 43, exposure.max: 7766728 us, framerate.max: 30002 mHz
> VIDIOC_QUERYCAP: ok
> 		VIDIOC_REQBUFS returned 0 (Success)
> 		VIDIOC_CREATE_BUFS returned 0 (Success)
> 		VIDIOC_QUERYBUF returned 0 (Success)
> 		VIDIOC_QUERYBUF returned 0 (Success)
> 		VIDIOC_QUERYBUF returned 0 (Success)
> 		VIDIOC_QUERYBUF returned 0 (Success)
> 		VIDIOC_G_FMT returned 0 (Success)
> 		VIDIOC_QBUF returned 0 (Success)
> 		VIDIOC_QBUF returned 0 (Success)
> 		VIDIOC_QBUF returned 0 (Success)
> 		VIDIOC_QBUF returned 0 (Success)
> 		VIDIOC_STREAMON returned -1 (Broken pipe)

The pipeline validation code at stream start time contains extensive
debugging messages, in particular in v4l2_subdev_link_validate_default()
and v4l2_subdev_link_validate_locked(). Enabling those should help you
figure out why your pipeline fails.

-- 
Regards,

Laurent Pinchart

