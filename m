Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65053C232E
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 16:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731717AbfI3OZd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 10:25:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731635AbfI3OZd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 10:25:33 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D396021855;
        Mon, 30 Sep 2019 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569853532;
        bh=nKQBhQTptd/B3mSn4I5e5Hi5ft8M5gemc3t2or8uZso=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UYcLWTFA2NaG2Uhhas4KGvVVdWrCplM3xapCYc6VkFSABZwZXA/uiO6xwEvx2Qclj
         Gjc+S6OZ+yInphg0Oce/5e5kDc31quJQOUEpAgstzCVkhx3+gJfsHCQb6ThHEqTTaa
         A6YblXrsc/Kap+nSkR0kEIVK9Lumxg9pExOjxUw0=
Date:   Mon, 30 Sep 2019 16:25:29 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 0/6] media: Introduce Allwinner H3 deinterlace driver
Message-ID: <20190930142529.7b2x3bmu6723dctm@gilmour>
References: <20190929161653.160158-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="boflox5qes4r6omb"
Content-Disposition: inline
In-Reply-To: <20190929161653.160158-1-jernej.skrabec@siol.net>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--boflox5qes4r6omb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Sep 29, 2019 at 06:16:47PM +0200, Jernej Skrabec wrote:
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

I'm fine with all the dt-bindings / dt patches, so you can add my
Acked-by on those.

Maxime

--boflox5qes4r6omb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZIQWQAKCRDj7w1vZxhR
xVrrAP95BvBjx5D+oV3oe3nrrkwjKQeFkYqSNUiiKAZDSGDZnAEAnW5FCkLRnxuA
5+5trRlcF70qySyqsWs0534ctqwJ0wQ=
=AK5h
-----END PGP SIGNATURE-----

--boflox5qes4r6omb--
