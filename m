Return-Path: <linux-media+bounces-41930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D661B47D08
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 21:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FD51189BEE3
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 19:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B506929AAFD;
	Sun,  7 Sep 2025 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RzAGOzRl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F31F63CD;
	Sun,  7 Sep 2025 19:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757274620; cv=none; b=rxG9VmFY9lkhirWtKhcGjR0LOITGR3WkFi6EZn0sVAeYDgxqBlP13as+FWOdjAxGpfuArico9+mto22VSIslCwnEm9pR+BZn+TUK4Jm0ZDzy6lH8bwmTpbZ4jUClhCxyb5c1+Wm08VHFrZWlUnbNI0wgkazXDMLKx2YR69HB4Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757274620; c=relaxed/simple;
	bh=0JvDXnMBYRRgeGBKLqZy71elUlsFHvuzKMNKf7beQLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJGpj/+M/pkg8Pr+Vo15dciwpa/z0dXEZJQFQEx8tytlrXHvVGa4ZBUZWalU6EWwof2QKQCLR6ltm/6Zbk0+bpWzmu+wRmu3R+zGdpJjRXx2lNL3oYKVQI1GMmrHPoZzqvkkiYmdKd61qPOJgK3qxwmvGpEtf5j//vDh4ImLMJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RzAGOzRl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6106F10BE;
	Sun,  7 Sep 2025 21:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757274543;
	bh=0JvDXnMBYRRgeGBKLqZy71elUlsFHvuzKMNKf7beQLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzAGOzRlNYE81FGGwAGewH7RIX1XOzjKNkBhl+gULNOsqC+IWo5HWDpyd3Uj7Mhjm
	 tR847OVBlz9eX6GA0xOJyhC+OTVmp01uXtVN3zlOYG4ZxW3lExmPJ9bszTjHsJVTAV
	 v7WsRXlZuLmC45BsL7ZzmELw3pRWxZf5kkPIBCPY=
Date: Sun, 7 Sep 2025 21:49:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>
Subject: Re: [PATCH v7 04/10] Documentation: uAPI: media: add
 V4L2_CID_FLASH_{DURATION,HW_STROBE_SIGNAL}
Message-ID: <20250907194953.GA19568@pendragon.ideasonboard.com>
References: <20250901-ov9282-flash-strobe-v7-0-d58d5a694afc@linux.dev>
 <20250901-ov9282-flash-strobe-v7-4-d58d5a694afc@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901-ov9282-flash-strobe-v7-4-d58d5a694afc@linux.dev>

Hi Richard,

Thank you for the patch.

On Mon, Sep 01, 2025 at 05:05:09PM +0200, Richard Leitner wrote:
> Add the new strobe duration and hardware strobe signal control to v4l
> uAPI documentation. Additionally add labels for cross-referencing v4l
> controls.
> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  .../userspace-api/media/v4l/ext-ctrls-flash.rst    | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> index d22c5efb806a183a3ad67ec3e6550b002a51659a..6254420a8ca95929d23ffdc65f40a6e53e30a635 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> @@ -57,6 +57,8 @@ Flash Control IDs
>  ``V4L2_CID_FLASH_CLASS (class)``
>      The FLASH class descriptor.
>  
> +.. _v4l2-cid-flash-led-mode:
> +
>  ``V4L2_CID_FLASH_LED_MODE (menu)``
>      Defines the mode of the flash LED, the high-power white LED attached
>      to the flash controller. Setting this control may not be possible in
> @@ -80,6 +82,8 @@ Flash Control IDs
>  
>  
>  
> +.. _v4l2-cid-flash-strobe-source:
> +
>  ``V4L2_CID_FLASH_STROBE_SOURCE (menu)``
>      Defines the source of the flash LED strobe.
>  
> @@ -186,3 +190,28 @@ Flash Control IDs
>      charged before strobing. LED flashes often require a cooldown period
>      after strobe during which another strobe will not be possible. This
>      is a read-only control.
> +
> +.. _v4l2-cid-flash-duration:
> +
> +``V4L2_CID_FLASH_DURATION (integer)``
> +    Duration of the flash strobe pulse generated by the strobe source,
> +    typically a camera sensor. This method of controlling flash LED strobe
> +    duration has three prerequisites: the strobe source's
> +    :ref:`hardware strobe signal <v4l2-cid-flash-hw-strobe-signal>` must be
> +    enabled, the flash LED driver's :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> +    must be set to ``V4L2_FLASH_LED_MODE_FLASH``, and the
> +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be configured to
> +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. The unit should be microseconds (µs)
> +    if possible.

As mentioned in the review of 01/10, I think this needs to be clarified.
Ideally we should add a new document in
Documentation/userspace-api/media/v4l/ to explain the flash API, but in
the meantime let's at lets improve the description of the duration
control. Here's a proposal.

``V4L2_CID_FLASH_DURATION (integer)``
    Duration of the flash strobe pulse generated by the strobe source, when
    using external strobe. This control shall be implemented by the device
    generating the hardware flash strobe signal, typically a camera sensor,
    connected to a flash controller. It must not be implemented by the flash
    controller.

    This method of controlling flash LED strobe duration has three
    prerequisites: the strobe source's :ref:`hardware strobe signal
    <v4l2-cid-flash-hw-strobe-signal>` must be enabled, the flash controller's
    :ref:`flash LED mode <v4l2-cid-flash-led-mode>` must be set to
    ``V4L2_FLASH_LED_MODE_FLASH``, and its :ref:`strobe source
    <v4l2-cid-flash-strobe-source>` must be configured to
    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``.

    The unit should be microseconds (µs) if possible.


The second paragraph may be better replaced by expanding the
documentation of V4L2_FLASH_STROBE_SOURCE_EXTERNAL, it seems a better
place to document how external strobe works.

As for the unit, is microseconds really the best option ? I would expect
most sensors to express the strobe pulse width in unit of lines.

I think we also need to decide how to handle camera sensors whose flash
strobe pulse width can't be controlled. For instance, the AR0144 can
output a flash signal, and its width is always equal to the exposure
time. The most straightforward solution seems to implement
V4L2_CID_FLASH_HW_STROBE_SIGNAL but not V4L2_CID_FLASH_DURATION in the
sensor driver. Could this cause issues in any use case ? Is there a
better solution ? I would like this to be documented.

Finally, I think we also need to standardize the flash strobe offset.

> +
> +.. _v4l2-cid-flash-hw-strobe-signal:
> +
> +``V4L2_CID_FLASH_HW_STROBE_SIGNAL (boolean)``

Nitpicking a bit on the name, I would have called this
V4L2_CID_FLASH_STROBE_OUTPUT_ENABLE (or _OE).

> +    Enables the output of a hardware strobe signal from the strobe source,
> +    typically a camera sensor. To control a flash LED driver connected to this
> +    hardware signal, the :ref:`flash LED mode <v4l2-cid-flash-led-mode>`
> +    must be set to ``V4L2_FLASH_LED_MODE_FLASH`` and the
> +    :ref:`strobe source <v4l2-cid-flash-strobe-source>` must be set to
> +    ``V4L2_FLASH_STROBE_SOURCE_EXTERNAL``. Provided the flash LED driver
> +    supports it, the length of the strobe signal can be configured by
> +    adjusting its :ref:`flash duration <v4l2-cid-flash-duration>`.

The V4L2_CID_FLASH_HW_STROBE_SIGNAL documentation needs to be clarified
in a similar way as V4L2_CID_FLASH_DURATION.

-- 
Regards,

Laurent Pinchart

