Return-Path: <linux-media+bounces-40024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA9B291C8
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 08:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6530B442FB6
	for <lists+linux-media@lfdr.de>; Sun, 17 Aug 2025 06:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0A5212FB6;
	Sun, 17 Aug 2025 06:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDpNyKzE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA613C8E8;
	Sun, 17 Aug 2025 06:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755411188; cv=none; b=lPD+pDq9+NYajrgAugx3Fm3T/bG/AuUKpPWhYi9/AsdWd11HW25lIIv9wA+mvLYxVjh9r/FeIwor2UEzidERDeExF3enIPUqtjVgLLKyQfYM/BCsqPPcLHBG8oaq6alAh02o2w7G992lGRf8b8nHIr0dL1wWumv6sXsfnTk+Hdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755411188; c=relaxed/simple;
	bh=lid+S2UZG+OF8iqGwXoZfpqZqgui8N3K+4MjmmWh4kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PH6D3c1nG7GOeqMDM0/FLHBGpq3UOa56cBpM+5+stb3zM6jYBzoxWyXEwqAoXRSGH8P7KPj7NNK6ZDOT6PcHhwHlYIdLNxXL0LBsB8SO2cvu/bjnBA0VwH8ht/GySCrHiWotEUI7WIIAKtC5P3s7KgXI8UC6/65y4PrJ81I8J90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDpNyKzE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB13C4CEEB;
	Sun, 17 Aug 2025 06:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755411187;
	bh=lid+S2UZG+OF8iqGwXoZfpqZqgui8N3K+4MjmmWh4kY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sDpNyKzEK9ha0jQPpNT72h11TCoWyZIgCoPuQauMS8Y4J7khtPMTBmBwqhdmyWGeO
	 DMuKBrro75dmZAlZTMOzJXvzsxDpHBZCv4sg8jSqho9EKsiyTvAYy5p3beW33u72Zd
	 E9MLBSQ2uH3UAtKhrrxmbyuxC+xi/Mq2UOPCwTTLXRDcOTlYkE4EVeCrZrsSC73tcA
	 9eEtVDnNdQZYAo8A4l0tawmVx0JDTwU7a4dgHTylH8ufxfIZEttsVoU929G35D/rD1
	 CnVz2f5S5ABGRmFWIwgpacXcUn/Vk4FCtN/ZZKSF2o5/tXzSeq44Y7sWnqtzH4v8wJ
	 dI2Fs1qMUkPDg==
Message-ID: <adfb8732-3ac7-4496-9671-1fa2aa71139c@kernel.org>
Date: Sun, 17 Aug 2025 08:13:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-4-will@willwhang.com>
 <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
 <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/08/2025 21:44, Will Whang wrote:
> On Mon, Aug 11, 2025 at 1:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Sun, Aug 10, 2025 at 11:09:20PM +0100, Will Whang wrote:
>>> +
>>> +/* --------------------------------------------------------------------------
>>> + * Power / runtime PM
>>> + * --------------------------------------------------------------------------
>>> + */
>>> +
>>> +static int imx585_power_on(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct imx585 *imx585 = to_imx585(sd);
>>> +     int ret;
>>> +
>>> +     dev_dbg(imx585->clientdev, "power_on\n");
>>> +
>>> +     ret = regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->supplies);
>>> +     if (ret) {
>>> +             dev_err(imx585->clientdev, "Failed to enable regulators\n");
>>> +             return ret;
>>> +     }
>>> +
>>> +     ret = clk_prepare_enable(imx585->xclk);
>>> +     if (ret) {
>>> +             dev_err(imx585->clientdev, "Failed to enable clock\n");
>>> +             goto reg_off;
>>> +     }
>>> +
>>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
>>
>> You asserted reset gpio causing it to enter reset and you call this
>> "power on"?
>>
>>> +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
>>> +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_US);
>>> +     return 0;
>>> +
>>> +reg_off:
>>> +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
>>> +     return ret;
>>> +}
>>> +
>>> +static int imx585_power_off(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct imx585 *imx585 = to_imx585(sd);
>>> +
>>> +     dev_dbg(imx585->clientdev, "power_off\n");
>>> +
>>> +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
>>
>> And here device comes up, but you call it power off? Your functions or
>> reset gpio code are completely reversed/wrong.
> 
> Reset pin High -> Run normally
> Reset pin Low -> Reset state

This is not how resets work. Logical reset value high means it is
asserted and device does not work.

Read carefully your datasheet. Because if you claim above this is not a
reset line, but some other.

> 
> See drivers/media/i2c/imx219.c with the same logic:

Great, so 10 year old buggy code is the example, but all other - 90% of
correct drivers - are not?

> 
> static int imx219_power_on(struct device *dev)
> {
> struct v4l2_subdev *sd = dev_get_drvdata(dev);
> struct imx219 *imx219 = to_imx219(sd);
> int ret;
> 
> ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
>    imx219->supplies);
> if (ret) {
> dev_err(dev, "%s: failed to enable regulators\n",
> __func__);
> return ret;
> }
> 
> ret = clk_prepare_enable(imx219->xclk);
> if (ret) {
> dev_err(dev, "%s: failed to enable clock\n",
> __func__);
> goto reg_off;
> }
> 
> gpiod_set_value_cansleep(imx219->reset_gpio, 1);
> usleep_range(IMX219_XCLR_MIN_DELAY_US,
>     IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
> 
> return 0;
> 
> reg_off:
> regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> 
> return ret;
> }
> 
> static int imx219_power_off(struct device *dev)
> {
> struct v4l2_subdev *sd = dev_get_drvdata(dev);
> struct imx219 *imx219 = to_imx219(sd);
> 
> gpiod_set_value_cansleep(imx219->reset_gpio, 0);
> regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
> clk_disable_unprepare(imx219->xclk);
> 
> return 0;
> }
> 
> I really don't understand why this is a problem, it is up to the chip
> designer to decide
> what to do with reset behavior and not the reviewers.

I explained to you. You are mixing logical level with line level. This
is the problem, because (again I said it):

It does not work.

Your code or your DTS is incorrect.



Best regards,
Krzysztof

