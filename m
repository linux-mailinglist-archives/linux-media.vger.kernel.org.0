Return-Path: <linux-media+bounces-7901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6A288D320
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 01:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1AC31C2AB7E
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 00:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29A928EC;
	Wed, 27 Mar 2024 00:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PhSo4NCD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4167FF;
	Wed, 27 Mar 2024 00:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711498352; cv=none; b=QwyGVH8UZWNQDFD0lnmZ5ccCb35jVF/L4B2Y7DgpYHSxARGxjDzFusF7XRW3cjVO/IRKpWdSmmmCKAF4+fteUuwN/lfJpBxVnlAx2VKDYuo3gBQx+x4XewqCQ5AMtYEZeb0CZWpdfntEsqcclj4mNgh+37GYrBWotRFI1olEAzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711498352; c=relaxed/simple;
	bh=ZyrqYYNTZQcxVp7+pjKes+TkCM/j42NOZnInyaGlnRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjIhxHXaKtnMdyTcEY47fH/b4FdYlqQHrgqI2KatRnlUqfbej+QiL4l9KU8mYAIROYooyZh0arXZEDNOeZlwRDfV99w8hB/i7CMaa6YrKaukDEKH2gG9WECMO7t1HJg+K8gmXJRWzlBEn5Jukbiu4e3+yO8bd719vqHhaTRu7XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PhSo4NCD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7AAF505;
	Wed, 27 Mar 2024 01:11:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711498317;
	bh=ZyrqYYNTZQcxVp7+pjKes+TkCM/j42NOZnInyaGlnRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhSo4NCDofeYXJCM8+KnUo8rcVvB+TghJOBCSWq6a+xXhB6S0AJHFWnST+IKvXnd7
	 YcwNH4nlORMfjo3Za06J2MCgfLYdc7IELftg534pVp6wd9aQb3CRIXrhzWMdYL7nYd
	 HbY9sIjJW09H4DJWC8P9RCsQbC5nfQ9SGVFoTW0M=
Date: Wed, 27 Mar 2024 02:12:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 00/10] media: Add driver for the Raspberry Pi <5 CSI-2
 receiver
Message-ID: <20240327001220.GA26859@pendragon.ideasonboard.com>
References: <20240327000510.2541-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240327000510.2541-1-laurent.pinchart@ideasonboard.com>

Hi Florian,

I think patches 04/10 ("ARM: dts: bcm2835-rpi: Move firmware-clocks from
bcm2711 to bcm2835"), 07/10 ("ARM: dts: bcm2711-rpi: Add pinctrl-based
multiplexing for I2C0"a), 08/10 ("ARM: dts: bcm2711-rpi-cm4-io: Add RTC on
I2C0") and 09/10 ("ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator") are
ready for you to merge. This would help reducing further iterations of
this series.

A review from Dave would be nice for 05/10 and 09/10 though.

On Wed, Mar 27, 2024 at 02:04:58AM +0200, Laurent Pinchart wrote:
> Hello everybody,
> 
> This patch series adds a new driver for the BCM2835 (and derivative)
> CCP2/CSI2 camera interface named Unicam. This IP core is found in the
> VC4-based Raspberry Pi, namely the Pi Zero, Pi 3 and Pi 4.
> 
> Camera support for Raspberry Pi 4 currently relies on a downstream
> Unicam driver that live in the Raspberry Pi kernel tree ([1]). The
> driver uses the V4L2 API, but works around the lack of features in V4L2
> to properly support sensor embedded data. Since the Unicam driver
> development by Raspberry Pi, some of those features have been merged in
> the kernel (namely the V4L2 streams API) or are being developed (namely
> generic metadata formats and subdev internal pads), with patches posted
> for review on the linux-media mailing list ([2]).
> 
> This new upstream driver is based on the downstream code, extensively
> reworked to use the new V4L2 APIs.
> 
> The series is based on a merge of
> 
> - v8 of the generic metadata and internal pads, rebased on v6.9-rc1 ([3])
> - the downstream ISP driver ported to mainline ([4])
> 
> with a set of patches for the imx219 driver applied on top. For
> convenience, it can be found in [5]. Note that the ISP driver is getting
> upstreamed separately.
> 
> Compared to v7, I have left the imx219 patches out, as they don't need
> to be bundled with the Unicam driver for review. They will be
> resubmitted separately.
> 
> The series starts with four patches that add the Unicam driver (04/10),
> with new V4L2 pixel formats (01/10 and 02/10) and DT bindings (03/10).
> The remaining patches cover DT integration (05/10 to 09/10) with a
> sample DT overlay for the IMX219 camera module (10/10).
> 
> The patches have been tested on a Raspberry Pi 4 using an IMX219 camera
> module (the Raspberry Pi camera v2), with libcamera. Updates are needed
> to libcamera to use the new V4L2 APIs, patches have been posted to [6].
> For manual testing with media-ctl, corresponding API updates to
> v4l-utils are available at [7].
> 
> While more work is needed to be able to merge the generic metadata API
> (namely implementing support for the latest API version in media-ctl and
> v4l2-compliance), I'm happy with the unicam implementation, and I
> believe we're really nearing completion. This series, along with the
> libcamera support, help validating the new kernel APIs. We have reached
> a point where we can start converting other sensor drivers from the
> downstream Raspberry Pi kernel to the standard APIs for embedded data,
> as well as integrating the APIs in the Raspberry Pi 5 CFE driver.
> 
> [1] https://github.com/raspberrypi/linux/tree/rpi-6.1.y/drivers/media/platform/bcm2835
> [2] https://lore.kernel.org/linux-media/20240313072516.241106-1-sakari.ailus@linux.intel.com/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/metadata/v8
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/isp/v2
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/unicam/next
> [6] https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/040711.html
> [7] https://git.linuxtv.org/pinchartl/v4l-utils.git/log/?h=metadata
> 
> Dave Stevenson (2):
>   dt-bindings: media: Add bindings for bcm2835-unicam
>   media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
> 
> Jean-Michel Hautbois (3):
>   media: v4l: Add V4L2-PIX-FMT-Y12P format
>   media: v4l: Add V4L2-PIX-FMT-Y14P format
>   ARM: dts: bcm2835: Add Unicam CSI nodes
> 
> Laurent Pinchart (3):
>   ARM: dts: bcm2835-rpi: Move firmware-clocks from bcm2711 to bcm2835
>   ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator
>   [DNI] arm64: dts: broadcom: Add overlay for Raspberry Pi 4B IMX219
>     camera
> 
> Uwe Kleine-König (2):
>   ARM: dts: bcm2711-rpi: Add pinctrl-based multiplexing for I2C0
>   ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0
> 
>  .../bindings/media/brcm,bcm2835-unicam.yaml   |  127 +
>  .../media/v4l/pixfmt-yuv-luma.rst             |   48 +
>  MAINTAINERS                                   |    7 +
>  .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |    7 +
>  .../boot/dts/broadcom/bcm2711-rpi-cm4-io.dts  |    9 +
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |   34 +-
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi       |    8 +
>  arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi   |   19 +
>  arch/arm/boot/dts/broadcom/bcm283x.dtsi       |   24 +
>  arch/arm64/boot/dts/broadcom/Makefile         |    4 +
>  .../dts/broadcom/bcm2711-rpi-4-b-imx219.dtso  |   65 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/broadcom/Kconfig       |   23 +
>  drivers/media/platform/broadcom/Makefile      |    3 +
>  .../platform/broadcom/bcm2835-unicam-regs.h   |  246 ++
>  .../media/platform/broadcom/bcm2835-unicam.c  | 2671 +++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
>  include/uapi/linux/videodev2.h                |    2 +
>  19 files changed, 3296 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
>  create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-imx219.dtso
>  create mode 100644 drivers/media/platform/broadcom/Kconfig
>  create mode 100644 drivers/media/platform/broadcom/Makefile
>  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
>  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> 
> 
> base-commit: 37a950b8e140e3bd97d22943ba860542111d64fe

-- 
Regards,

Laurent Pinchart

