Return-Path: <linux-media+bounces-36429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EABAEFA66
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC213B3837
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EB91487E9;
	Tue,  1 Jul 2025 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmTyD/Fi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0CF274B57
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376121; cv=none; b=Mpq6EtTlN4EFCwlIdHigFvNpqLR2ZOOBj14m9O+WCtiqyH1dVn1uzZquFhrMlQkqggSRr2GScevHUONEqtLofIkaIz1MLpYI1DmXerBTBHd2fJ+P9KmQQhm6jL0GNRs5qAcw/aKzAqDGwiXU73jGhcDfID4/jX30dH02fRLBAkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376121; c=relaxed/simple;
	bh=H5kWuddo58V3QaFpjOnz/bBIzRobKuxlthL2e3hLdIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnTx72VWlcKAj31fo4dsmOSuwtx1q60H+hfRnj1vkvwZg4mHVT027nRAkSj5kl1WWl3nR/lCUC+Zkk48Uv5bujXJjEKS3Tr2/0KquaEb9R9TUrrCek0fmmDe48Pw2jvaDJt9QfiEj+CnTgYOhZCT9LRcZQmQKjbRiOYlUJJwjIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmTyD/Fi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CE9C4CEEB;
	Tue,  1 Jul 2025 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751376120;
	bh=H5kWuddo58V3QaFpjOnz/bBIzRobKuxlthL2e3hLdIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZmTyD/FiWvl3FfE2kBnTzg7TztLVBDomVi5YeoOgRkL0V2k1cgWZKjWz2q4m/XOT4
	 ktglJiow0LF0mfXqbBGgEZxPDIkRukh9Xx1CA1QWHJ3pRTPFaU6kcz9BiGUqe3BmM7
	 YnsGFcyEPRF50YkARR/ulNQDxNU+Uz+JQUBFPq7rlbZ9XfAtfa6zi54DJnRliJjhE1
	 SMwJcjnsVHw+KsRrshy7QMqWw+cR7jIJcJkclTqxDhFGhlaQ/O/cJ36+hlcvpACEiG
	 YC9pZd4cDMXdTfo/UyCNt1b17KChGC5sQ4k9unMhogyIcfN3xl/+c6SAnv0A0vlVgB
	 TxG1YuQK94bWA==
Message-ID: <45c2cdfa-2bae-4dc6-a509-13adb86dd3b8@kernel.org>
Date: Tue, 1 Jul 2025 15:21:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] media: mt9m114: Changes to make it work with
 atomisp devices
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mathis Foerst <mathis.foerst@mt.com>, linux-media@vger.kernel.org
References: <20250629205626.68341-1-hansg@kernel.org>
 <20250630222821.GD15184@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250630222821.GD15184@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 1-Jul-25 12:28 AM, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Sun, Jun 29, 2025 at 10:56:10PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v3 of my series to make the "mainline" mt9m114 driver work
>> on devices with an atomisp CSI2 receiver / ISP. This has been tested on
>> an Asus T100TA.
>>
>> Changes in v3:
>> - Document that using 768Mhz for out_clock_max does not work
>> - Improve "media: mt9m114: Put sensor in reset on power down" commit message
>> - Drop setting of the MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE bit
>> - Split "media: mt9m114: Fix scaler bypass mode" into multiple patches,
>>   addressing various review comments as part of this
>>
>> Changes in v2:
>> - Rebase on top of sailus/media_tree.git/fixes which now has 4 of
>>   the patches from Mathis': "MT9M114 driver bugfix and improvements"
>>   series, this avoids most of the conlicts between the 2 series
>> - Add Laurent's Reviewed-by to some of the patches
>> - Add select VIDEO_APTINA_PLL to Kconfig
>> - Use correct aptina_pll_limits
>> - After setting reset high wait 20 clk cycles before disabling
>>   the clk and regulators
>> - When bypassing the scalar make ifp_get_selection() / ifp_set_selection()
>>   fill sel->r with a rectangle of (0,0)/wxh and return 0 instead of
>>   returning -EINVAL
> 
> It appears that some of my review comments on v2 crossed your v3. That's
> the case for 03/12 and 10/12. For 03/12 in particular, I think the
> comments will result in changes for v4.

Yes I realized that myself for 03/12 too. I think that for
10/12 we agreed to keep that as is, but I may have misunderstood ?

> How would you like to proceed,
> should I review the rest first ?

With the exception of 03/12 yes please then I can add
any necessary changes to v4.

For 03/12 I'll reply to your last answer in the v2 thread
when I can make some time for this.

Regards,

Hans



> 
>> Hans de Goede (15):
>>   media: aptina-pll: Debug log p1 min and max values
>>   media: mt9m114: Add support for clock-frequency property
>>   media: mt9m114: Use aptina-PLL helper to get PLL values
>>   media: mt9m114: Lower minimum vblank value
>>   media: mt9m114: Fix default hblank and vblank values
>>   media: mt9m114: Tweak default hblank and vblank for more accurate fps
>>   media: mt9m114: Avoid a reset low spike during probe()
>>   media: mt9m114: Put sensor in reset on power down
>>   media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
>>   media: mt9m114: Adjust IFP selections and src format when src pixelfmt
>>     changes to/from RAW10
>>   media: mt9m114: Update src pad sel and format when sink pad format
>>     changes
>>   media: mt9m114: Don't allow changing the IFP crop/compose selections
>>     when bypassing the scaler
>>   media: mt9m114: Drop start-, stop-streaming sequence from initialize
>>   media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
>>   media: mt9m114: Add ACPI enumeration support
>>
>>  drivers/media/i2c/Kconfig      |   1 +
>>  drivers/media/i2c/aptina-pll.c |   2 +
>>  drivers/media/i2c/mt9m114.c    | 255 +++++++++++++++++++++++++--------
>>  3 files changed, 196 insertions(+), 62 deletions(-)
> 


