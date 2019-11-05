Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9FFDEFB78
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2019 11:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388711AbfKEKgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Nov 2019 05:36:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:53362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388203AbfKEKgC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Nov 2019 05:36:02 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 475A8206BA;
        Tue,  5 Nov 2019 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572950160;
        bh=nstXPo8G52k07aEg3yqMaPNpC2OTHZIvzCHLgYaB/Ws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PivRBpyd5UxzWxCMwhGfASafRUVti9G9+sNI32XsswNWfDn+kAQtGWUTXkDZxG2hJ
         9xhg74nlw0mpOkjKRVJwvWMCXUR9KgiHnmZjdWYgiqgxCBarN6LX+u7+8hhAsX6ZVe
         vPZKy+8/YF/WvZRIcmHS8x4YBAJdM/4Lh8iH9Zs0=
Date:   Tue, 5 Nov 2019 11:35:58 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v5 0/6] media: Introduce Allwinner H3 deinterlace driver
Message-ID: <20191105103558.GB3876@gilmour.lan>
References: <20191023221332.3674175-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20191023221332.3674175-1-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 12:13:26AM +0200, Jernej Skrabec wrote:
> Starting with H3, Allwinner began to include standalone deinterlace
> core in multimedia oriented SoCs. This patch series introduces support
> for it. Note that new SoCs, like H6, have radically different (updated)
> deinterlace core, which will need a new driver.
>
> v4l2-compliance report:
> v4l2-compliance SHA: dece02f862f38d8f866230ca9f1015cb93ddfac4, 32 bits
>
> Compliance test for sun8i-di device /dev/video0:
>
> Driver Info:
>         Driver name      : sun8i-di
>         Card type        : sun8i-di
>         Bus info         : platform:sun8i-di
>         Driver version   : 5.3.0
>         Capabilities     : 0x84208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
>
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>
> Total for sun8i-di device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0
>
> Please take a look.
>
> Best regards,
> Jernej
>
> Changes from v4:
> - Added me as maintaner of the binding
> - Noted that scaling is supported in Kconfig entry and driver code
>
> Changes from v3:
> - added Maxime's a-b tag
> - moved and fixed Kconfig entry
> - put clk_set_rate_exclusive() and it's counterpart in PM callbacks
>
> Changes from v2:
> - added acked-by and review-by tags
> - fixed schema path in H3 deinterlace binding
> - moved busy check after format args check
>
> Changes from v1:
> - updated Maxime's e-mail in DT binding
> - removed "items" for single item in DT binding
> - implemented power management
> - replaced regmap with direct io access
> - set exclusive clock rate
> - renamed DEINTERLACE_FRM_CTRL_COEF_CTRL to DEINTERLACE_FRM_CTRL_COEF_ACCESS
>
> Jernej Skrabec (6):
>   dt-bindings: bus: sunxi: Add H3 MBUS compatible
>   clk: sunxi-ng: h3: Export MBUS clock
>   ARM: dts: sunxi: h3/h5: Add MBUS controller node
>   dt-bindings: media: Add Allwinner H3 Deinterlace binding
>   media: sun4i: Add H3 deinterlace driver
>   dts: arm: sun8i: h3: Enable deinterlace unit


Applied 1,2,3 and 4.

Thanks!
Maxime

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXcFQjgAKCRDj7w1vZxhR
xRIXAQDHP/Hg6AfmpRB//ohpotffxkwfsYdRznZJxeNP6toOOgEAv5KgidXO2Xcg
dBuAvEmmUu74937yUfrJPlUms53Yug8=
=gWCT
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
