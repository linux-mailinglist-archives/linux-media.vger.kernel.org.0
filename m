Return-Path: <linux-media+bounces-33607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EBDAC7CF0
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 13:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE7981BC25C8
	for <lists+linux-media@lfdr.de>; Thu, 29 May 2025 11:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0ED28E5F8;
	Thu, 29 May 2025 11:28:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3F347B4;
	Thu, 29 May 2025 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518088; cv=none; b=FR8J1OUE3hOnvVCdx7fH8hx68HCRTcSX7u0QgwtJEg/JHkQt4Xas60tEiynaBt2B4yJW06ho0w/vRECdrIOMzzChh14tR7B9h1XUJDhJW6lMe07nHtVGpZyJ77FHzyPoGdsqNH2RZ1vQI/ZuKCYjTI3F3kMADN7IgPtkbxkJDGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518088; c=relaxed/simple;
	bh=PAc90FkBogXphiQNzm6JktCd4gi/msjSow0cS2MEApc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HJ3a03tJBQHi1ri2iPrtymM0pQefIsjEVGaIEz59EEhVir3in5HVYWLhzcHOBAHr6JuGEXsTOJxdsMG1iK5gftZ9Vxaxi0+twtBhlQ8ghG4Rs7kn6sSCRTw3/EopqQsG8RinsbNE5JeohbzcOgvGZdHvxUoUAs0eMky6NKLVo/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 6F8B5C405A4C;
	Thu, 29 May 2025 13:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 6F8B5C405A4C
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,  Rui Miguel Silva
 <rmfrfs@gmail.com>,  Martin Kepplinger <martink@posteo.de>,  Purism Kernel
 Team <kernel@puri.sm>,  Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Enable MIPI filtering by DT on i.MX8M*
In-Reply-To: <jqjptsphbtdtziuucehxutseaz7j4kjiirz2hk77f3dznswvza@avbjjzu3jcam>
	(Jacopo Mondi's message of "Fri, 23 May 2025 13:33:24 +0200")
References: <m3h61u9jy2.fsf@t19.piap.pl>
	<20250509103733.GE28896@pendragon.ideasonboard.com>
	<m3o6vn8np5.fsf@t19.piap.pl>
	<iegnn5xoosqpk52hvipcr73aliwhqtsq6r6ctvt5756bhy6yen@rqcdongb7fdf>
	<m31psg97dy.fsf@t19.piap.pl>
	<jqjptsphbtdtziuucehxutseaz7j4kjiirz2hk77f3dznswvza@avbjjzu3jcam>
Sender: khalasa@piap.pl
Date: Thu, 29 May 2025 13:27:56 +0200
Message-ID: <m3o6vb64hv.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

Jacopo Mondi <jacopo.mondi@ideasonboard.com> writes:

>> - 10 User Defined 8-bit Data Type 8 packets, line-sized, DT=3D0x37, call=
ed
>>   apparently "Vertical OB" by Sony datasheet
>
> These are optically black pixels and should probably be discarded by
> the gasket as well as embedded data ?

Yes, apparently.

>> I hope I got this right, this is straight from oscilloscope (only
>> checked IDs on IMX462, will confirm IMX290 later but it looks the same).
>> In 1280x1080p25 mode there are 4 (not 10) "vertical OB" packets, and 720
>> RGGB lines instead of 1080.
>
> Is this correct ? you ask for 1280x1080 and get back 720 lines ?

Well, no, I just checked both modes and these are the differences.
IOW, nothing unexpected. Wrong copy & paste or so.

>> IMX462 produces just a tiny 2-pixel dot in the left top corner, possibly
>> shifting some data to the right (I remember it did that, but I can't
>> observe it now - could be a kernel (driver) version change?).
>
> What are those two pixels ? Does the datasheet describes them ?

Nope, I guess it's a silicon bug. It corrupts 3 RAW-12 pixels, though
(32 bits > 2 * 12 bits).

>>    32EC0138h    2D8000h ISP Dewarp Control Register (ISP_DEWARP_CONTROL)
>>       ISP ID mode 0, ISP1: DT 0h (unknown), ISP2: DT 2Ch (RAW12) left-ju=
st mode
>
> But this other register has (again) one other filtering option and
> reading the value here it is set to filter RAW12 (mipi_isp2_data_type)
>
> Weirdly enough, I don't see this register being programmed in the
> mainline gasket driver...

I guess it's drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:

static int rkisp1_gasket_enable(struct rkisp1_device *rkisp1,
                                struct media_pad *source)
{
...
        regmap_update_bits(rkisp1->gasket, ISP_DEWARP_CONTROL, mask, val);

Now this register doesn't filter data: if you set it with a different
value, the data still goes through. It's just processed differently.
For example, my sensor is 12-bit (in addition to 10-bit). If I set
ISP_DEWARP_CONTROL to 0xB68 (or 0x368) meaning RAW 14-bit, the image
only gets darker - ISP thinks it's getting 14-bit samples.

The only filtering (while using ISP) is, apparently, in the ISP
Configuration Register (MIPI_CSIS_ISPCONFIG_CH0) and subsequently in its
shadow counterpart. And it somehow may be enabled in CSIS Common Control
Register (MIPI_CSIS_CMN_CTRL). But if you don't enable it there, the
data is still filtered (e.g. wrong value in MIPI_CSIS_ISPCONFIG_CH0
prevents data flow). The filtering is only needed for preventing pixel
corruption (these 3 pixels).

So it means, for at least i.MX8MP, the DT filtering bit in
MIPI_CSIS_CMN_CTRL should always be enabled.

>> MIPI_CSI2:
>>    32E50004h      4705h CSIS Common Control Register (MIPI_CSIS_CMN_CTRL)
>
> Do you mean 0x14705 ? I'm asking because Shadow Crtl is BIT(16). Surprisi=
ngly
> BIT(14) is marked as reserved in the datasheet version I have

No, it's 0x4705 (usually).
With 0xFF05 (resulting from write with 0xfffffffd) it's still working
correctly (with DT filtering). Write 0xfffffbfd (=3D no DT filtering) and
the magic light pixels in the left top corner reappear. So it means the
INTERLEAVE_MODE bits (11 and 10) are probably two independent bits, with
bit 11 probably not used at all.


In my copy (i.MX 8M Plus Applications Processor Reference Manual, Rev.
1, 06/2021), CSIS Common Control Register (MIPI_CSIx_CSIS_COMMON_CTRL):
- bits 31-17, 15, 13, 12, 7-2 are zero and reserved (though bits 12 and
  2 are additionally marked "This read-only field is reserved and always
  has the value 0")
- bit 14 is reserved and shown as "1"
- bit 16 is "UPDATE_SHADOW", and it clears itself after a write (unless
  the pipeline locks up or something alike)
- bits 11 and 10 are "INTERLEAVE_MODE":
    Select Interleave mode
    ISP Configuration register of CH# is used for data interleave.
      00 CH0 only, no data interleave
      01 DT (Data type) only
      10 Reserved
      11 Reserved
- bits 9 and 8 are LANE_NUMBER, 0 to 3 means 1 to 4.
- bit 1 is SW_RESET
- bit 0 is CSI_EN

In fact, bit 2 does not "always have the value 0", it's set to 1. Both
bits 14 and 2 can be reset to 0, though (without apparent change in the
image).
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

