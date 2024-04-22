Return-Path: <linux-media+bounces-9853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A745E8AC9CC
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 11:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32C001F21F6A
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 09:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8556714389E;
	Mon, 22 Apr 2024 09:47:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2DD143897
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713779267; cv=none; b=TMRHzBlheYdJToeKsIYmEpkbbzJp/00EXbS+jXnUZt+NzXStRUXgDJsdrAxzyD1w/AgZ2wvwNbnm+eC5rQSaMsJjfXdr4jC7ArtM3js7eLttK5s53IaTNz9boMPusBjls9Zf4Qs0LmfgU/PprdSNrKjmD4Z0ve9sXiH30ku6A/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713779267; c=relaxed/simple;
	bh=DWy/q9hQdKCFCg7uTK19O90czaW4FHmhbtGQ7zC3Cfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jIAw3+UbD+a6dsecRbMum4oeEJqzqMy0fE2X7OJpFQiv9iyb9UWYmeOBZE9e40dncGun9y5fcRgwYj3vgWtAP3gJ4vlgeTiWJAE70Xivn13rgR4sw68Fjr5M9pF5S8Vrc1VjVumBwrPjR9QqJC/GFj7kNX9zxyd3dDJBS9uEWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A02C3277B;
	Mon, 22 Apr 2024 09:47:46 +0000 (UTC)
Message-ID: <8d7ccc83-a27a-4d02-a0d7-301965ebdba2@xs4all.nl>
Date: Mon, 22 Apr 2024 11:47:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT FIXES FOR 6.10] Mainly camera sensor patches, but V4L2 and
 MC too
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
References: <Zh-bIY-er6cH25tI@valkosipuli.retiisi.eu>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <Zh-bIY-er6cH25tI@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

Just a quick comment: the subject line says 'GIT FIXES' instead of 'GIT PULL'.

'GIT FIXES' should only be used if these are fixes that need to go to the
current rcX series. In this case it was clear that you meant 'GIT PULL' since
these are for 6.10, but it prevents confusion for Mauro and myself if you
don't mix the two. Especially since we prioritize 'GIT FIXES'.

Also note that I dropped "media: v4l: Guarantee non-NULL return from v4l2_find_nearest_size()"
as that patch didn't look right. I commented on that one.

Regards,

	Hans

On 17/04/2024 11:49, Sakari Ailus wrote:
> Hi Hans, Mauro,
> 
> Here's a set of mainly camera sensor related patches for 6.10. In
> particular, there are ov2680 and hi556 fixes form Hans and Fabio, your own
> MC patch, fixes for imx335 from Kieran and Umang, DT fixes from Alexander
> Stein and one Cadence csi2rx fix from Pratyush and finally my random series
> of framework and ipu3-imgu driver fixes.
> 
> Please pull.
> 
> 
> The following changes since commit 836e2548524d2dfcb5acaf3be78f203b6b4bde6f:
> 
>   media: usb: siano: Fix allocation of urbs (2024-04-16 00:02:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-6.10-2-signed
> 
> for you to fetch changes up to eba1e47919b66797eb2479b7a7e39df0473003ce:
> 
>   media: hi556: Add support for avdd regulator (2024-04-17 10:58:10 +0300)
> 
> ----------------------------------------------------------------
> V4L2 patches for 6.10
> 
> ----------------------------------------------------------------
> Alexander Stein (2):
>       media: dt-bindings: sony,imx290: Allow props from video-interface-devices
>       media: dt-bindings: i2c: use absolute path to other schema
> 
> Fabio Estevam (1):
>       media: ov2680: Do not fail if data-lanes property is absent
> 
> Hans Verkuil (1):
>       media: mc: mark the media devnode as registered from the, start
> 
> Hans de Goede (9):
>       media: ov2680: Stop sending more data then requested
>       media: ov2680: Drop hts, vts ov2680_mode struct members
>       media: ov2680: Add vblank control
>       media: ov2680: Add hblank control
>       media: ov2680: Add camera orientation and sensor rotation controls
>       media: hi556: Return -EPROBE_DEFER if no endpoint is found
>       media: hi556: Add support for reset GPIO
>       media: hi556: Add support for external clock
>       media: hi556: Add support for avdd regulator
> 
> Jai Luthra (1):
>       media: ti: j721e-csi2rx: Fix races while restarting DMA
> 
> Kieran Bingham (2):
>       media: imx335: Support 2 or 4 lane operation modes
>       media: imx335: Parse fwnode properties
> 
> Pratyush Yadav (1):
>       media: cadence: csi2rx: configure DPHY before starting source stream
> 
> Sakari Ailus (4):
>       media: v4l: Don't turn on privacy LED if streamon fails
>       media: staging: ipu3-imgu: Update firmware path
>       media: v4l2-ctrls: Return handler error in creating new fwnode properties
>       media: v4l: Guarantee non-NULL return from v4l2_find_nearest_size()
> 
> Umang Jain (4):
>       media: imx335: Use V4L2 CCI for accessing sensor registers
>       media: imx335: Use integer values for size registers
>       media: imx335: Fix active area height discrepency
>       media: imx335: Limit analogue gain value
> 
>  .../bindings/media/i2c/galaxycore,gc0308.yaml      |   2 +-
>  .../bindings/media/i2c/galaxycore,gc2145.yaml      |   2 +-
>  .../devicetree/bindings/media/i2c/sony,imx214.yaml |   2 +-
>  .../devicetree/bindings/media/i2c/sony,imx290.yaml |   5 +-
>  .../devicetree/bindings/media/i2c/sony,imx415.yaml |   2 +-
>  drivers/media/i2c/Kconfig                          |   1 +
>  drivers/media/i2c/hi556.c                          | 105 +++-
>  drivers/media/i2c/imx335.c                         | 636 ++++++++++-----------
>  drivers/media/i2c/ov2680.c                         |  97 +++-
>  drivers/media/mc/mc-devnode.c                      |   5 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c       |  26 +-
>  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |   5 +-
>  drivers/media/v4l2-core/v4l2-common.c              |   2 +-
>  drivers/media/v4l2-core/v4l2-ctrls-core.c          |   3 +
>  drivers/media/v4l2-core/v4l2-subdev.c              |  22 +-
>  drivers/staging/media/ipu3/ipu3-css-fw.c           |   4 +-
>  drivers/staging/media/ipu3/ipu3-css-fw.h           |   2 +
>  17 files changed, 515 insertions(+), 406 deletions(-)
> 


