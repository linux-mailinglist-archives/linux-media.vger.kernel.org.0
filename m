Return-Path: <linux-media+bounces-12337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0561E8D6028
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 13:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26DFF1C23AB6
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 11:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D94F156F3B;
	Fri, 31 May 2024 11:01:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A9018645;
	Fri, 31 May 2024 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717153317; cv=none; b=B0inmyJJErwezaEp/VKiP2waqAkbG2U5pmbTz+j+ZaqGx4mXK/SK9Rh9NW1V+aaHqO6kZFhNhSXqn1BcTXwC3jXO4pKkRYqXsIc7KAjmV2X2QNyfPv/v6tyBfp9GsfqUsYBgZs3YdA3YzfHbuXUEKaE/l0cY/iRzWQ2W/h7MUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717153317; c=relaxed/simple;
	bh=1iYH5tHSIkeMLnROOmAZA6JikDK/xRNv3K0nQBfMLbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DzTBM3rnaZfOdnnxYuVW3BxkNFmeeZgoJ+7gHkI4y+L6jx6d1stskKlY/3sv/Rlo+mMs+gEpB40tF3yCucGkdyZp+/4PjtpT0vribtJMFoaZptGY6M6YGCgMZi+LrJ4NL00fuxeUQ2dPmDBwRTHU9hN8a2lYIy3qS1xpe9C1DZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F89C116B1;
	Fri, 31 May 2024 11:01:54 +0000 (UTC)
Message-ID: <6dce1ca0-78bf-4a4a-bdd6-ff6647eae6b6@xs4all.nl>
Date: Fri, 31 May 2024 13:01:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/6] Add Toshiba Visconti Video Input Interface driver
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240424024215.1624299-1-yuji2.ishikawa@toshiba.co.jp>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240424024215.1624299-1-yuji2.ishikawa@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yuji,

On 24/04/2024 04:42, Yuji Ishikawa wrote:
> This series is the Video Input Interface driver
> for Toshiba's ARM SoC, Visconti.
> This provides DT binding documentation,
> device driver, documentation and MAINTAINER files.
> 
> A visconti VIIF driver instance exposes
> 1 media control device file, 3 video device files for capture
> and 2 video device files for controlling image signal processor.
> Detailed HW/SW are described in documentation directory.
> The VIIF hardware has CSI2 receiver,
> image signal processor and DMAC inside.
> The subdevice for image signal processor provides
> vendor specific V4L2 controls.
> 
> The device driver depends on two other drivers under development;
> clock framework driver and IOMMU driver.
> Corresponding features will be added later.
> 
> Best regards,
> Yuji

I commented on patches 3 and 4.

I also ran this series through my build scripts, and it did found a few small
warnings:

kerneldoc: WARNINGS:

drivers/media/platform/toshiba/visconti/viif.h:386: warning: Excess struct member 'subdevs' description in 'viif_device'
drivers/media/platform/toshiba/visconti/viif.h:386: warning: Excess struct member 'asds' description in 'viif_device'
drivers/media/platform/toshiba/visconti/viif.h:386: warning: Excess struct member 'sd' description in 'viif_device'
drivers/media/platform/toshiba/visconti/viif_common.h:30: warning: Function parameter or struct member 'bayer_pattern' not described in 'viif_mbus_format'
drivers/media/platform/toshiba/visconti/viif_common.h:30: warning: Function parameter or struct member 'is_bayer' not described in 'viif_mbus_format'

Should be trivial to fix.

Regards,

	Hans

> 
> Changelog v2:
> - Resend v1 because a patch exceeds size limit.
> 
> Changelog v3:
> - Add documentation to describe SW and HW
> - Adapted to media control framework
> - Introduced ISP subdevice, capture device
> - Remove private IOCTLs and add vendor specific V4L2 controls
> - Change function name avoiding camelcase and uppercase letters
> 
> Changelog v4:
> - Split patches because a patch exceeds size limit
> - fix dt-bindings document
> - stop specifying ID numbers for driver instance explicitly at device tree
> - use pm_runtime to trigger initialization of HW
>   along with open/close of device files.
> - add a entry for a header file at MAINTAINERS file
> 
> Changelog v5:
> - Fix coding style problem in viif.c (patch 2/6)
> 
> Changelog v6:
> - add register definition of BUS-IF and MPU in dt-bindings
> - add CSI2RX subdevice (separeted from ISP subdevice)
> - change directory layout (moved to media/platform/toshiba/visconti)
> - change source file layout (removed hwd_xxxx.c)
> - pointer to userland memory is removed from uAPI parameters
> - change register access (from struct style to macro style)
> - remove unused macros
> 
> Changelog v7:
> - remove redundant "bindings" from header and description text
> - fix multiline text of "description"
> - change "compatible" to "visconti5-viif"
> - explicitly define allowed properties for port::endpoint
> - remove unused variables
> - update kerneldoc comments
> - update references to headers
> 
> Changelog v8:
> - rename bindings description file
> - remove/simplify items in bindings
> - update operations around v4l2_async_notifier
> - use v4l2_async_connection instead of v4l2_async_subdev
> - use dev_err_probe()
> - better error handling at probe
> - remove redundant mutex
> - add V4L2_CTRL_TYPE_VISCONTI_ISP constant
> 
> Changelog v9:
> - dictionary ordering of dt-bindings properties
> - applied sparce checker
> - call div64_u64 for 64bit division
> - rebase to media_staging tree
> - fix warning for cast between ptr and dma_addr_t
> 
> Changelog v10:
> - add an independent entry in MAINTAINERS
> - add paddings to uAPI structs
> - use parameter buffer to control ISP (instead of vendor specific controls)
> 
> Yuji Ishikawa (6):
>   dt-bindings: media: platform: visconti: Add Toshiba Visconti Video
>     Input Interface
>   media: videodev2.h: add visconti viif meta buffer format
>   media: platform: visconti: Add Toshiba Visconti Video Input Interface
>     driver
>   media: platform: visconti: add streaming interface for ISP parameters
>     and status
>   documentation: media: add documentation for Toshiba Visconti Video
>     Input Interface driver
>   MAINTAINERS: Add entries for Toshiba Visconti Video Input Interface
> 
>  .../admin-guide/media/v4l-drivers.rst         |    1 +
>  .../admin-guide/media/visconti-viif.dot       |   18 +
>  .../admin-guide/media/visconti-viif.rst       |  252 ++
>  .../media/toshiba,visconti5-viif.yaml         |  105 +
>  .../userspace-api/media/v4l/meta-formats.rst  |    1 +
>  .../media/v4l/metafmt-visconti-viif.rst       |   48 +
>  MAINTAINERS                                   |   11 +
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/toshiba/Kconfig        |    6 +
>  drivers/media/platform/toshiba/Makefile       |    2 +
>  .../media/platform/toshiba/visconti/Kconfig   |   19 +
>  .../media/platform/toshiba/visconti/Makefile  |    8 +
>  .../media/platform/toshiba/visconti/viif.c    |  664 ++++++
>  .../media/platform/toshiba/visconti/viif.h    |  398 ++++
>  .../platform/toshiba/visconti/viif_capture.c  | 1472 ++++++++++++
>  .../platform/toshiba/visconti/viif_capture.h  |   22 +
>  .../platform/toshiba/visconti/viif_common.c   |  239 ++
>  .../platform/toshiba/visconti/viif_common.h   |   40 +
>  .../platform/toshiba/visconti/viif_csi2rx.c   |  657 ++++++
>  .../platform/toshiba/visconti/viif_csi2rx.h   |   24 +
>  .../toshiba/visconti/viif_csi2rx_regs.h       |  102 +
>  .../platform/toshiba/visconti/viif_isp.c      | 1191 ++++++++++
>  .../platform/toshiba/visconti/viif_isp.h      |   24 +
>  .../platform/toshiba/visconti/viif_params.c   | 2026 +++++++++++++++++
>  .../platform/toshiba/visconti/viif_params.h   |   19 +
>  .../platform/toshiba/visconti/viif_regs.h     |  721 ++++++
>  .../platform/toshiba/visconti/viif_stats.c    |  334 +++
>  .../platform/toshiba/visconti/viif_stats.h    |   14 +
>  include/uapi/linux/videodev2.h                |    4 +
>  include/uapi/linux/visconti_viif.h            | 1921 ++++++++++++++++
>  31 files changed, 10345 insertions(+)
>  create mode 100644 Documentation/admin-guide/media/visconti-viif.dot
>  create mode 100644 Documentation/admin-guide/media/visconti-viif.rst
>  create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
>  create mode 100644 drivers/media/platform/toshiba/Kconfig
>  create mode 100644 drivers/media/platform/toshiba/Makefile
>  create mode 100644 drivers/media/platform/toshiba/visconti/Kconfig
>  create mode 100644 drivers/media/platform/toshiba/visconti/Makefile
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_capture.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_common.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_csi2rx_regs.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_isp.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_params.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_regs.h
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.c
>  create mode 100644 drivers/media/platform/toshiba/visconti/viif_stats.h
>  create mode 100644 include/uapi/linux/visconti_viif.h
> 


