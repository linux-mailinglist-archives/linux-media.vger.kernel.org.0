Return-Path: <linux-media+bounces-12427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4478D7C44
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 399AE1F228E3
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 07:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFC63F8ED;
	Mon,  3 Jun 2024 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="kKYZMHNd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta3.mxroute.com (mail-108-mta3.mxroute.com [136.175.108.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033773BBE0
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717398753; cv=none; b=QvV/BdnkSxS0hFHR3stUQ0CtFJ4OFMgL66/YvYJQhJjdBP8kCgVA0tvYT5a96u3b5Ik/6AqPmVE5W5BSzvdsYG2QIS2NkSO7mFCagbNlLUAcL4JvFAZPVpOZsDcZga96wFcsXm4eBalfgr4JMMEcsmkyuU6e4AzkQW+6RORqCpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717398753; c=relaxed/simple;
	bh=XRhXaAZqTdGwXeKaRUIdWhEeuAznnbq0x6lIVejZ7IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wv+jM+xP6wtxsSYdVdwvT4gXlfUFFUZucz2of9L5Rw49NWWOU62+g6y2p1NvAmZQiTwyc/Q3TASTqBc3RxYqUoMyh8s3/TLcQtuV5KRsM5eUsbWoGlaulW7FgnaM0+jZELq0U0OmnHbyuBPTVknhKMWT502MBD6Vw26F5Ad+C08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=kKYZMHNd; arc=none smtp.client-ip=136.175.108.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta3.mxroute.com (ZoneMTA) with ESMTPSA id 18fdcec88d2000e76b.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Jun 2024 07:07:20 +0000
X-Zone-Loop: 9bc2da74bc6ba95933bd43378066ad3913c9e27af807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=weWzdWj0l/fwOMs86+c7cQSxgtwCposJWO78UGw648E=; b=kKYZMHNdrD4wlerbYcGb0yTSfJ
	BTBS61eX3J3u5NfIWygjOkfDmyexiA1J0q5jVdkblmVlN5GKJKMdlIkCfA7yWkR5PO2j4InnnDpw7
	RiQMEn+yaM9/R1Jn2c0OXxfdQ/SOpQMfnY1VB7nNQ8ZczFkzuiC4/Dxjls+0t886sTgnLi01rszCY
	umS3rMCOM2Lb/lfJPW5AycWBUfhw4tuTa5zFj1pFuwCmg/6h7QAVIOx2fkBX6E5ou3UNDA9nX7UVl
	qOV1Jqn2y3lpGsfpA9oKXnGs+JJ1bK6pRZ+COD18LF68ojffeP9se2N34uovy5w4wxxnR+Zt1VZTK
	EeBo2EVw==;
Message-ID: <a8f6092e-0df0-4a31-8417-0d94864f20b2@luigi311.com>
Date: Mon, 3 Jun 2024 01:07:14 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/23] imx258 improvement series
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com, jacopo.mondi@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, sakari.ailus@linux.intel.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 pavel@ucw.cz, phone-devel@vger.kernel.org
References: <20240602201345.328737-1-git@luigi311.com>
Content-Language: en-US
From: Luis Garcia <git@luigi311.com>
In-Reply-To: <20240602201345.328737-1-git@luigi311.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: git@luigi311.com

On 6/2/24 14:13, git@luigi311.com wrote:
> From: Luis Garcia <git@luigi311.com>
> 
> v6:
>   - Drop powerdown-gpio patches
>     - per Sakari Ailus request as it is not part or 
>       not used by the sensor
>     - I tested without it and PPP still works
>     - Dave mentioned its not part of the datasheet 
>       for the imx258
>     - Ondrej Jirman also tested it and it doesnt seem
>       to be needed
> 
> 
> v5:
>   - Changed ownership of a few patches to Ondrej Jirman
>   - Implement feedback from Tommy Merciai
>     - media: i2c: imx258: Add support for reset gpio
>     - media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
>     - media: i2c: imx258: Convert to new CCI register access helpers
> 
> v4:
>   - Swapped out the use macro patch for a patch that uses the new
>     CCI register access helpers per Sakari Ailus
>   - Fix order of reset and powerdown gpio before disable regulators
>   - Fix formating of all patches
>   
>   - Implemented feedback from Pavel Machek
>     - media: i2c: imx258: Follow normal V4L2 behaviours
>     - media: i2c: imx258: Allow configuration of clock
>   - Implemented feedback from Sakari Ailus
>     - media: i2c: imx258: Add support for powerdown gpio
> 
> 
> v3 Luis Garcia
> 
> - Add Use v4l2_link_freq_to_bitmap helper patch per Sakari Ailus
> - Separate dt-bindings for powerdown per Rob Herring
> - Fix dt-bindings for imx258.yaml
> - Fix sign offs per Dang Huynh 
> - Fix versioning per Conor Dooley and Kieran Bingham
> - Use scripts to validate and fix patches
> - Implemented feedback from Sakari Ailus
>   - media: i2c: imx258: Add support for 24MHz clock
>   - media: i2c: imx258: Add support for running on 2 CSI data lanes
> 
> - Implemented feedback from Rob Herring
>   - dt-bindings: media: imx258: Add alternate compatible strings
> 
> 
> 
> v2 Luis Garcia
> 
> - Add use macros patch 
> - Add support for powerdown gpio patch
> - Add support for reset gpio patch
> - Dropped Add support for long exposure modes patch
> - Implemented feedback from Jacopo Mondi
>   - media: i2c: imx258: Add regulator control
>   - media: i2c: imx258: Add support for 24MHz clock
>   - media: i2c: imx258: Add support for running on 2 CSI data lanes
>   - media: i2c: imx258: Add get_selection for pixel array information
>   - media: i2c: imx258: Issue reset before starting streaming
>   - media: i2c: imx258: Set pixel_rate range to the same as the value
>   - dt-bindings: media: imx258: Add alternate compatible strings
>   - media: i2c: imx258: Change register settings for variants of the sensor
>   - media: i2c: imx258: Make HFLIP and VFLIP controls writable
> 
> This adds a few more patches and drops one. The long exposure mode patch
> was dropped due to the bug that Jacopo found. The powerdown and reset gpio
> patches were added as that fixes support for the Pinephone Pro, without
> them the sensor doesn't initialize correctly.
> 
> Tested on a Pinephone Pro by forcing 24 mhz clock. The two lower 
> resolutions had some artifacts but that is expected as more changes are 
> required to fix them for the Pinephone Pro specifically, kept all 
> registers the same as Dave's original patch since that works on dedicated
> imx258 hardware and the artifacts are PPP specific so it shouldn't 
> be a regression.
> 
> 
> 
> v1 Dave Stevenson
> 
> This is a set of patches for imx258 that allow it to work with alternate
> clock frequencies, over either 2 or 4 lanes, and generally adding
> flexibility to the driver.
> 
> Tested with an IMX258 module from Soho Enterprises that has a 24MHz
> oscillator. Both 2 and 4 lane configurations work with correct link
> frequencies and pixel rates.
> 
> Jacopo has tested on a PinePhone Pro which has an ~19.2MHz clock fed from
> the SoC, He confirms that the two lower resolution modes work, but not the
> full res mode. Comparing to the BSP it looks like they have some weird
> clock configuration in the 4208x3120 mode (nominally 1224Mb/s/lane instead
> of 1267). As it has never previously worked directly with the mainline
> driver this isn't a regression but may indicate that there is a need for
> support of additional link frequencies in the future.
> 
> The last patch that makes HFLIP and VFLIP configurable may be contentious
> as I've retained the default configuration of inverted from the original
> driver. I know this was discussed recently, but I can't recall the final
> outcome.
> 
> I am relying on someone from Intel testing this out, as correcting the
> cropping and supporting flips has changed the Bayer order. Seeing as this
> is all above board in V4L2 terms I really hope that the layers above it
> behave themselves.
> 
> Dave Stevenson (20):
>   media: i2c: imx258: Remove unused defines
>   media: i2c: imx258: Make image geometry meet sensor requirements
>   media: i2c: imx258: Disable digital cropping on binned modes
>   media: i2c: imx258: Remove redundant I2C writes.
>   media: i2c: imx258: Add regulator control
>   media: i2c: imx258: Make V4L2_CID_VBLANK configurable.
>   media: i2c: imx258: Split out common registers from the mode based
>     ones
>   media: i2c: imx258: Add support for 24MHz clock
>   media: i2c: imx258: Add support for running on 2 CSI data lanes
>   media: i2c: imx258: Follow normal V4L2 behaviours for clipping
>     exposure
>   media: i2c: imx258: Add get_selection for pixel array information
>   media: i2c: imx258: Allow configuration of clock lane behaviour
>   media: i2c: imx258: Correct max FRM_LENGTH_LINES value
>   media: i2c: imx258: Issue reset before starting streaming
>   media: i2c: imx258: Set pixel_rate range to the same as the value
>   media: i2c: imx258: Support faster pixel rate on binned modes
>   dt-bindings: media: imx258: Rename to include vendor prefix
>   dt-bindings: media: imx258: Add alternate compatible strings
>   media: i2c: imx258: Change register settings for variants of the
>     sensor
>   media: i2c: imx258: Make HFLIP and VFLIP controls writable
> 
> Luis Garcia (2):
>   media: i2c: imx258: Use v4l2_link_freq_to_bitmap helper
>   media: i2c: imx258: Convert to new CCI register access helpers
> 
> Ondrej Jirman (1):
>   media: i2c: imx258: Add support for reset gpio
> 
>  .../i2c/{imx258.yaml => sony,imx258.yaml}     |   11 +-
>  MAINTAINERS                                   |    2 +-
>  drivers/media/i2c/Kconfig                     |    1 +
>  drivers/media/i2c/imx258.c                    | 1440 ++++++++++-------
>  4 files changed, 835 insertions(+), 619 deletions(-)
>  rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (88%)
> 

Looks like Sakari has took it forward while i was gone so v6 isnt needed anymore
since they implemented the changes on their side 
https://lore.kernel.org/all/ZleJV5YSl92-13CT@valkosipuli.retiisi.eu/

