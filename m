Return-Path: <linux-media+bounces-54772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHDxIaTQqmn3XQEAu9opvQ
	(envelope-from <linux-media+bounces-54772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:03:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE85221497
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 14:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07F36302C33C
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 13:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D8F3590A8;
	Fri,  6 Mar 2026 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bX6RHffI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662F22E92BA;
	Fri,  6 Mar 2026 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772802188; cv=none; b=bbjezrm6Cx86nVKo8ah0W3VklP31MJdbnz4FQstYhlJ692qiJK+CSdCBBY+oHUJR4jTF/DVVgmxi993lb89+kp3ax580r+1JBlO3+Puu+L0Kg2MXiUaob38uwi4GkswX8nshCnqAxxG/Kgm5TTqmMrW8MeY9hdQd5Yl5WL4XU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772802188; c=relaxed/simple;
	bh=jFRbLbFfFrEgk/RUshZfkHzVOicBJTq11QnLHspvpvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vk/IQk1gqRLzaCEeezBFtJBzTXN07GpWY4XADF6pvaUyIZCtWQMfhR7bPV12D3ZZPkcB33Ri2nZhaDdjVSAMvd8z9Z7zEeKdlzoESxTGi+dUC3aGSM6ZZiYBFc/RtCpovSLPzhMoy5H7EaB0wwXC2GQR974ywtr34S7zy+hcUiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bX6RHffI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AB124F1;
	Fri,  6 Mar 2026 14:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772802118;
	bh=jFRbLbFfFrEgk/RUshZfkHzVOicBJTq11QnLHspvpvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bX6RHffIBaiw6LJxEBInDJpDDaSqt+ybFWpkfUod6Tttp+aA2tCwToHr1GjyAg22n
	 aq+CjYJMXXc7GBPF8utpFHvcXZ2FXqLUoHSdn87IkPOJIEJ6sHLG+aSl/4Ukmk3h/p
	 4zwtqFQsZvMJlMdXUTrAoKxDxBJ7UVRRvq9HjI/Q=
Date: Fri, 6 Mar 2026 14:02:58 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: Documentation: Fix frame interval calculation
 for raw camera sensors
Message-ID: <aarNI_4ghaZme-PT@zed>
References: <20260225-media-fps-docs-v2-1-5cb222d41e4d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-media-fps-docs-v2-1-5cb222d41e4d@ideasonboard.com>
X-Rspamd-Queue-Id: 0BE85221497
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54772-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

Hi Jai,

On Wed, Feb 25, 2026 at 02:19:35PM +0530, Jai Luthra wrote:
> The previous frame interval formula used analogue crop dimensions. This
> diverges from what most non-CCS camera sensor drivers do and what most
> applications expect.
>
> The CCS specification describes under section "8.2.6 Line Length and
> Frame Length" how the horizontal and vertical readout minimums can be
> different when binning.
>
> We see the same thing in non-CCS sensor drivers, for example in imx219
> the minimum FLL (frame length in lines) can be lower than the analogue
> crop height when doing 2x2 or 4x4 binning. Similarly in imx283 HMAX
> (line length) can be lower compared to the analogue crop width when
> doing 2x2 or 3x3 binning.
>
> While the CCS driver defines the HBLANK/VBLANK controls with respect to
> the analogue crop rectangle, with possibly negative values for blanking,
> most other raw sensor drivers instead define them with respect to the
> output dimensions (format defined on the source pad) sent on the bus.

Sakari: are negative blankins the way CCS is intended to be operated
when LLP/FLL are smaller than the analog crop ?

>
> So fix the frame interval calculation described in the documentation to
> match the reality of existing drivers, separating out the CCS and
> non-CCS cases. In future, with the common raw sensor model, this may
> need further updates.
>
> While at it, also clarify the order of operations in the sensor pipeline
> and give the "hardware" definition for frame interval using LLP (line
> length in pixels) and FLL (frame length in lines) before the messy
> definitions that use blanking controls.
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v2:
> - Use reStructureText note box for describing the
>   HBLANK/VBLANK/PIXEL_RATE controls
> - Document the blanking formula for both CCS and non-CCS raw
>   sensor drivers
> - Drop driver-api documentation as common raw sensor model is coming
>   soon
> - Link to v1: https://lore.kernel.org/r/20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com
> ---
>  .../userspace-api/media/drivers/camera-sensor.rst  | 80 ++++++++++++++++------
>  1 file changed, 58 insertions(+), 22 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 75fd9166383fdbb2dabdb6384ed0904c4e78a3c6..e41ed4616593735bf78b73c2ed34b016ab46c783 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -49,34 +49,70 @@ depends on the type of the device.
>  Raw camera sensors
>  ~~~~~~~~~~~~~~~~~~
>
> -Instead of a high level parameter such as frame interval, the frame interval is
> -a result of the configuration of a number of camera sensor implementation
> -specific parameters. Luckily, these parameters tend to be the same for more or
> -less all modern raw camera sensors.
> +Instead of a high level parameter such as frame interval, the frame interval on
> +a raw camera sensor is determined by a number of sensor-specific parameters.
> +These parameters tend to be common across most modern raw camera sensors.
>
> -The frame interval is calculated using the following equation::
> +The pixel array is the full grid of photosensitive elements on the camera
> +sensor. A subregion of it is selected by the analogue crop. The cropped image
> +may then be subject to binning (averaging of a NxN block) and subsampling which
> +further reduce the image dimensions. The resulting image is then read out by
> +the ADC (analogue-to-digital converter) line by line. After ADC readout,
> +optional digital crop or scaling may further reduce the image dimensions, see
> +:ref:`VIDIOC_SUBDEV_G_SELECTION <VIDIOC_SUBDEV_G_SELECTION>`.
>
> -	frame interval = (analogue crop width + horizontal blanking) *
> -			 (analogue crop height + vertical blanking) / pixel rate
> +The frame size is determined by two timing parameters: line length in pixels
> +(LLP) and frame length in lines (FLL). These are fundamental sensor timing
> +registers that control how fast the ADC reads out the image. They may go

nitpicking: I would slightly change this to:

The frame duration is determined by two timing parameters: line length in pixels
(LLP) and frame length in lines (FLL). These are fundamental sensor timing
parameters that control how fast the image is read out.


> +by different names for a particular sensor, like HMAX and VMAX, or HTOTAL and
> +VTOTAL, or similar.
>
> -The formula is bus independent and is applicable for raw timing parameters on
> -large variety of devices beyond camera sensors. Devices that have no analogue
> -crop, use the full source image size, i.e. pixel array size.
> +LLP is the total number of pixel clock cycles per line, including both the
> +active readout width and horizontal blanking. FLL is the total number of lines
> +per frame, including both the active readout height and vertical blanking.
>
> -Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
> -``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
> -is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
> -the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
> -sub-device. The unit of that control is pixels per second.
> +The frame interval is::
>
> -Register list-based drivers need to implement read-only sub-device nodes for the
> -purpose. Devices that are not register list based need these to configure the
> -device's internal processing pipeline.
> +        frame interval = (line length in pixels) *
> +                         (frame length in lines) / pixel rate
>
> -The first entity in the linear pipeline is the pixel array. The pixel array may
> -be followed by other entities that are there to allow configuring binning,
> -skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
> -<VIDIOC_SUBDEV_G_SELECTION>`.
> +Application developers can calculate the frame interval using the pixel rate
> +and blanking controls, relative to the reference rectangle used by the sensor
> +driver::
> +
> +        frame interval = (width + horizontal blanking) *
> +                         (height + vertical blanking) / pixel rate

As you below provides definitions for LLP and FLL in the CCS and
non-CCS case, should we use:

        frame interval = LLP * FFL / pixel rate

?

> +
> +.. note::
> +
> +        Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK``
> +        and ``V4L2_CID_VBLANK``, respectively. The unit of the
> +        ``V4L2_CID_HBLANK`` control is pixels and the unit of the
> +        ``V4L2_CID_VBLANK`` is lines. The pixel rate in the sensor's **pixel
> +        array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same sub-device.
> +        The unit of that control is pixels per second.

Should we link to those control definitions ?

> +
> +        Drivers need to implement sub-device nodes that expose these controls.
> +        They can be read-only or configurable depending on the device.
> +
> +        For non-CCS sensors, the blanking is defined relative to the size of
> +        the image being sent out to the host over the bus (source pad format)::
> +
> +                LLP = output width + horizontal blanking
> +                FLL = output height + vertical blanking
> +
> +        For CCS-compliant raw sensors (that use the CCS driver), the blanking
> +        controls are defined relative to the analogue crop rectangle::
> +
> +                LLP = analogue crop width + horizontal blanking
> +                FLL = analogue crop height + vertical blanking
> +
> +Sensors may achieve higher framerates by allowing lower minimums for line and
> +frame length when binning or subsampling is enabled.

I think what you mean here is that sensors can have different
HBLANK/VBLANK min/max when binning is in use ?

In that case I would say

Sensors may allow lower minimums for line and frame length when
binning or subsampling is enabled.


> +
> +The driver shall set the minimum and maximum values of the blanking controls

and here use "update" instead of "set" to convey that when
binning/subsampling is in use the blankings valid range could be
changed if the sensor supports that.

> +such that the resulting LLP and FLL reigsters are programmed within the range
> +permitted by the sensor hardware for the current mode.

Nits apart the patch looks like a good clarification to me.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Sakari, I understand you're planning to introduce LLP/FLL controls in
the generic line-based metadata series.

Should we take this patch in that series or can this be fast-tracked ?
I'm asking because if you plan to introduce those controls it might be
worth mentioning them in this patch from the very beginning.

Thanks
  j

>
>  USB cameras etc. devices
>  ~~~~~~~~~~~~~~~~~~~~~~~~
>
> ---
> base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
> change-id: 20260219-media-fps-docs-fd1da722cc38
>
> Best regards,
> --
> Jai Luthra <jai.luthra@ideasonboard.com>
>

