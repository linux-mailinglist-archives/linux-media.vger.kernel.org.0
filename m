Return-Path: <linux-media+bounces-17031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4996297B
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 15:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D902B20D53
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 13:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489061EB35;
	Wed, 28 Aug 2024 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lS+oUPT0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF8D188CC2;
	Wed, 28 Aug 2024 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853431; cv=none; b=MAjY9B5d8cu1r9bXLLIJFsgTJ3UleEWRu7sXJeAilcWk7UJ7KfNs4Klidffh5AX9darFvYZj11bXK+eQAOI4Baqe/BYBmr9UHnet3MCzFcNJW58nWNfjabo0bYcrkp4USTcAJmeQxa3aXpG/1hy74QmjmyU/MFoP+YpY70cNDMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853431; c=relaxed/simple;
	bh=nTo1M9qioFkywEUR8loTOTOADsB2LNiZAGx7WewK1K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0ndyvkRWDHednvkJar0PVR+Xfh1HhXBAg0rXF6U97rdE4RSKLqnMBtOFEk5gLHGQFKBLgc+SeCnP4JDeOE+9BWlelvjTBxh69Ve3ifS48EnVQjeTi8QyivgJd+kYq7egry/3xSHZvSNufCeqPyvq2xbrgqPJ4D7bG3tGTAF3AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lS+oUPT0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC96C2C5;
	Wed, 28 Aug 2024 15:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724853360;
	bh=nTo1M9qioFkywEUR8loTOTOADsB2LNiZAGx7WewK1K0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lS+oUPT0xSby9rub8+g2WEdGCFS3doXz+nhljhkAD/9Sjuy31tK+NAdLa54aGSZIE
	 uUcSH/RdePZUfKXCbWSRGmU9l8qWnFV0eJVUm+0Li617lK/cBoj7SfZNHkr2PBBiOf
	 H6629IoUOJXXJcyKWyQrx2W0UnvF1e6F2uTus+zA=
Message-ID: <3c36b0cd-7b43-4a63-a832-1d8d14a4512a@ideasonboard.com>
Date: Wed, 28 Aug 2024 16:57:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/6] drm/omap: hdmi: improve hdmi4 CEC, add CEC for
 hdmi5
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Andreas Kemnade <andreas@kemnade.info>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <43F64377-8394-448F-A6F0-4DA11DB9AEF5@goldelico.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <43F64377-8394-448F-A6F0-4DA11DB9AEF5@goldelico.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/08/2024 23:31, H. Nikolaus Schaller wrote:
> Hi,
> CEC features are useful to e.g. control HDMI monitor standby.
> 
> But I wonder what happened to this series?
> 
> I could find some reviewed-by: and acked-by: in [1] but it wasn't merged upstream
> for unidentifiable reasons.
> 
> We apparently had merged this series some years ago into our LetuxOS distro kernel
> and now we found it to be broken (NULL dereference) at least for omap5uevm
> (and likely Pyra Handheld) after rebasing to v6.11-rc (it was already broken
> since v6.9-rc1). Fixes were not difficult, but it would be better if it were
> part of upstream.

There was a v3:

20210428132545.1205162-1-hverkuil-cisco@xs4all.nl

I see there was a concern from Laurent in:

YLjMZiX71mcQNQdO@pendragon.ideasonboard.com

And we need an ack from the bridge maintainers for the drm_bridge parts. 
But the series is three years old, so I think someone would have to 
rebase on top of mainline and re-test and re-send first.

  Tomi

> BR and thanks,
> Nikolaus
> 
> [1] https://lore.kernel.org/r/all/20210302162403.983585-4-hverkuil-cisco@xs4all.nl/T/
> 
>> Am 02.03.2021 um 17:23 schrieb Hans Verkuil <hverkuil-cisco@xs4all.nl>:
>>
>> This series improves the drm_bridge support for CEC by introducing two
>> new bridge ops in the first patch, and using those in the second patch.
>>
>> This makes it possible to call cec_s_conn_info() and set
>> CEC_CAP_CONNECTOR_INFO for the CEC adapter, so userspace can associate
>> the CEC adapter with the corresponding DRM connector.
>>
>> The third patch simplifies CEC physical address handling by using the
>> cec_s_phys_addr_from_edid helper function that didn't exist when this
>> code was originally written.
>>
>> The fourth patch adds the cec clock to ti,omap5-dss.txt.
>>
>> The fifth patch the missing cec clock to the dra7 and omap5 device tree,
>> and the last patch adds CEC support to the OMAP5 driver.
>>
>> Tested with a Pandaboard and a Beagle X15 board.
>>
>> Regards,
>>
>> Hans
>>
>> Changes since v1:
>>
>> - as per suggestion from Laurent, changed cec_init/exit to
>>   connector_attach/_detach which are just called for all
>>   bridges. The DRM_BRIDGE_OP_CEC was dropped.
>>
>> - added patch to add the cec clock to ti,omap5-dss.txt
>>
>> - swapped the order of the last two patches
>>
>> - incorporated Tomi's suggestions for the hdmi5 CEC support.
>>
>> Hans Verkuil (6):
>>   drm: drm_bridge: add connector_attach/detach bridge ops
>>   drm/omapdrm/dss/hdmi4: switch to the connector bridge ops
>>   drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling
>>   dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock
>>   dra7.dtsi/omap5.dtsi: add cec clock
>>   drm/omapdrm/dss/hdmi5: add CEC support
>>
>> .../bindings/display/ti/ti,omap5-dss.txt      |   4 +-
>> arch/arm/boot/dts/dra7.dtsi                   |   5 +-
>> arch/arm/boot/dts/omap5.dtsi                  |   5 +-
>> drivers/gpu/drm/drm_bridge_connector.c        |   9 +
>> drivers/gpu/drm/omapdrm/Kconfig               |   8 +
>> drivers/gpu/drm/omapdrm/Makefile              |   1 +
>> drivers/gpu/drm/omapdrm/dss/hdmi.h            |   1 +
>> drivers/gpu/drm/omapdrm/dss/hdmi4.c           |  40 ++--
>> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |  13 +-
>> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h       |  12 +-
>> drivers/gpu/drm/omapdrm/dss/hdmi5.c           |  63 +++++-
>> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c       | 209 ++++++++++++++++++
>> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h       |  42 ++++
>> drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  35 ++-
>> drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |  33 ++-
>> include/drm/drm_bridge.h                      |  27 +++
>> 16 files changed, 453 insertions(+), 54 deletions(-)
>> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
>> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
>>
>> -- 
>> 2.30.1
>>
> 


