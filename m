Return-Path: <linux-media+bounces-18599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E3986D4B
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 09:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442F32822D4
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 07:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF91018BB9C;
	Thu, 26 Sep 2024 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t71QJoRz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E73224D6;
	Thu, 26 Sep 2024 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727334816; cv=none; b=YtdX9kAQgZ22piGcFG5u0FpDCmg8TqPiDK82K6X5uNnqEiQWensItfDZnPgduzKMiOM34PfVJbxj7oQ3uhhATFeYnnRpXST+u/dyRBEkF+cGPTsywo+Oq0wt27vmqcDKQaWWnTE0CIY2N04mM2glNi2KT8j6SA9+YW5JZ/RiGs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727334816; c=relaxed/simple;
	bh=mxaesniZDobVQDHBLuX45uEc5YOxQMsEkUYYRn1BU5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/UuxnU2MxjB1OQaPLNoM99o0tNeGj11QPoam9GduAr6tliK9m/kBMuVzvfpCwLRXHtpABwTsM4ORkNGZDHATMmyMkX7p6E+gz72ghDKgi7BqaQl0FU18MTry68UeipfvLs75z+C4JmpK9NQIF6rxyNfE6f1dbOVQsYboPefQMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t71QJoRz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 809D08D4;
	Thu, 26 Sep 2024 09:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727334724;
	bh=mxaesniZDobVQDHBLuX45uEc5YOxQMsEkUYYRn1BU5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t71QJoRzOLEw29qfeCw81IqtOVhV9hv5IZLt3g7s4A+lP8CGTnN+mGSYHEXvYdBmX
	 nWyYfra0jKDB+OmRJh0QM94S0Sfl1Y76484QLht0pNxFnvcCygEyTPOSFxIAZPw6/i
	 CajO1wihAmPiiGarwlpNVDaL3qFncMsnFqFp7Mno=
Message-ID: <fe968dc7-67a5-40be-871e-fe682dc60d70@ideasonboard.com>
Date: Thu, 26 Sep 2024 10:13:29 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] media: raspberrypi: Support RPi5's CFE
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240910-rp1-cfe-v5-0-9ab4c4c8eace@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/09/2024 11:07, Tomi Valkeinen wrote:
> This series adds support to the CFE hardware block on RaspberryPi 5. The
> CFE (Camera Front End) contains a CSI-2 receiver and Front End, a small
> ISP.
> 
> To run this, you need the basic RPi5 kernel support plus relevant dts
> changes to enable the cfe and camera. My work branch with everything
> needed to run CFE can be found from:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git rp1-cfe
> 
> A few notes about the patches:
> 
> - The original work was done by RaspberryPi, mostly by Naushir Patuck.
> - The second video node only sets V4L2_CAP_META_CAPTURE instead of both
>    V4L2_CAP_META_CAPTURE and V4L2_CAP_META_CAPTURE like the other nodes.
>    This is a temporary workaround for userspace (libcamera), and
>    hopefully can be removed soon.
> 
> I have tested this with:
> - A single IMX219 sensor connected to the RPi5's CSI-2 port
> - Arducam's UB960 FPD-Link board with four imx219 sensors connected
> 
>   Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v5:
> - Add "depends on PM". The platforms that use CFE will always have PM in
>    practice, and it's not worth supporting both the PM and !PM cases as
>    it adds complexity to the driver.
> - Link to v4: https://lore.kernel.org/r/20240904-rp1-cfe-v4-0-f1b5b3d69c81@ideasonboard.com

Is this solution to the PM issue ok for everyone? It feels most sensible 
to me. Any other comments?

  Tomi

> Changes in v4:
> - Drop unnecessary clock-lanes from the DT bindings
> - Drop unnecessary linux-media from MAINTAINERS entry
> - Drop unnecessary conversion to bool with !!
> - Don't set cap->bus_info in cfe_querycap()
> - Make debugfs files not readable by the world
> - Check the return value of v4l2_fwnode_endpoint_parse()
> - Remove the code dealing with remote_ep_fwnode. Instead use
>    v4l2_create_fwnode_links_to_pad() and media_pad_remote_pad_unique() to
>    create the link and get the pad index.
> - Add cfe/csi2/fe/dphy argument to the respective dbg/info/err print
>    macros.
> - Drop some debug prints and add a few, clarifying the prints for
>    enabling and disabling the streams.
> - Some cosmetic changes (linefeed, drop unnecessary assignment, move a
>    define)
> - Link to v3: https://lore.kernel.org/r/20240815-rp1-cfe-v3-0-e15a979db327@ideasonboard.com
> 
> Changes in v3:
> - Based on v6.11-rc3. The PiSP BE series is now in upstream so no extra
>    dependencies are needed.
> - Fixed cfe_remove() return value, as the .remove hook has changed
> - Added Krzysztof's Rb.
> - Link to v2: https://lore.kernel.org/r/20240620-rp1-cfe-v2-0-b8b48fdba3b3@ideasonboard.com
> 
> Changes in v2:
> - Change the compatible string back to raspberrypi,rp1-cfe from raspberrypi,rpi5-rp1-cfe
> - Drop the references to rp1 headers in the DT binding example. This
>    allows compiling the example without the rp1 support.
> - Fix missing remap lines for mono formats
> - Fix csi2_pad_set_fmt() so that the format can be changed back to the
>    sink's format from 16-bit or compressed format.
> - Link to v1: https://lore.kernel.org/r/20240318-rp1-cfe-v1-0-ac6d960ff22d@ideasonboard.com
> 
> ---
> Tomi Valkeinen (4):
>        media: uapi: Add meta formats for PiSP FE config and stats
>        dt-bindings: media: Add bindings for raspberrypi,rp1-cfe
>        media: raspberrypi: Add support for RP1-CFE
>        media: admin-guide: Document the Raspberry Pi CFE (rp1-cfe)
> 
>   .../admin-guide/media/raspberrypi-rp1-cfe.dot      |   27 +
>   .../admin-guide/media/raspberrypi-rp1-cfe.rst      |   78 +
>   Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>   .../bindings/media/raspberrypi,rp1-cfe.yaml        |   93 +
>   .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>   .../userspace-api/media/v4l/metafmt-pisp-fe.rst    |   39 +
>   MAINTAINERS                                        |    7 +
>   drivers/media/platform/raspberrypi/Kconfig         |    1 +
>   drivers/media/platform/raspberrypi/Makefile        |    1 +
>   drivers/media/platform/raspberrypi/rp1-cfe/Kconfig |   15 +
>   .../media/platform/raspberrypi/rp1-cfe/Makefile    |    6 +
>   .../media/platform/raspberrypi/rp1-cfe/cfe-fmts.h  |  332 +++
>   .../media/platform/raspberrypi/rp1-cfe/cfe-trace.h |  196 ++
>   drivers/media/platform/raspberrypi/rp1-cfe/cfe.c   | 2487 ++++++++++++++++++++
>   drivers/media/platform/raspberrypi/rp1-cfe/cfe.h   |   43 +
>   drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |  583 +++++
>   drivers/media/platform/raspberrypi/rp1-cfe/csi2.h  |   89 +
>   drivers/media/platform/raspberrypi/rp1-cfe/dphy.c  |  180 ++
>   drivers/media/platform/raspberrypi/rp1-cfe/dphy.h  |   27 +
>   .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |  581 +++++
>   .../media/platform/raspberrypi/rp1-cfe/pisp-fe.h   |   53 +
>   drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>   .../uapi/linux/media/raspberrypi/pisp_fe_config.h  |  273 +++
>   .../linux/media/raspberrypi/pisp_fe_statistics.h   |   64 +
>   include/uapi/linux/videodev2.h                     |    2 +
>   25 files changed, 5181 insertions(+)
> ---
> base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
> change-id: 20240314-rp1-cfe-142b628b7214
> 
> Best regards,


