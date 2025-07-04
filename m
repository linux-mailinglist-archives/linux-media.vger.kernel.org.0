Return-Path: <linux-media+bounces-36870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD451AF9BCD
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 22:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D938567F22
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 20:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2981C215789;
	Fri,  4 Jul 2025 20:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qy+9wgpP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868451A83E4;
	Fri,  4 Jul 2025 20:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751662437; cv=none; b=XcztNFCdDjQfo6/hR4DUX7nivd0N8VzpnMTq5jNpyhumjSJcWMIJvfw3W0rZOSm3ZYZNez1lQZTBXgSNzBpyo0EfLtMA7xOKO93n+phUt849NNtHFA5J/2Kw9+7QVG2dhKImJWipnycy4+wT7UgTdXKU9+PFXyDpqGJEAHRehjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751662437; c=relaxed/simple;
	bh=Ne9AmoxN3z3zc+TjqJ/AesjfpnzXFrEC21F/4uGvKto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KVcmHj8+la82zmW4Nhnp4tEmo5j0jnCTeusjgG+lK/OZLRh3Vc56oVFEjuyVo6B2cAMhb8uKD+jFeva6crYYCT7tt38WqXK6GNz50QjuFUSzWXrmjK/8qnfhsQanr5OC5FY/H5c6Bz2nstcchm4zsx20gm9c4lmyjc1d1/KWs08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qy+9wgpP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF9DC4CEE3;
	Fri,  4 Jul 2025 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751662437;
	bh=Ne9AmoxN3z3zc+TjqJ/AesjfpnzXFrEC21F/4uGvKto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qy+9wgpPGVcbo+soLEs+pdj58Rd2ZIzfkwabviSeYC5TJMxy4QZQ8Zt1Wwu1uNBdw
	 UbSv5wsOwd3Yua3xLQwQkaTmqecmZlTceqp6xXckHL6Wa6n9r79iGmN4tJH876jH+7
	 lxZIMzvKDpQIkpEYe4GUMpZX5/FHQPq0srJN4+qIBHyDNzWRYBYkrZSftKgciLZW2j
	 +UaSVn4vMCqREmEhuDEQUPj54xsqYnxhGQqUaMGFqY12nPwNETN8bg4utQMmZR4591
	 msWgHXKf7iF9T71E3/pEoRcbJWPujbh/pKWuIzCEX/19Uw8bjt1k5Y2WaA3QjLKacE
	 se2dXTepgTMeQ==
Message-ID: <2bee7047-ce37-4878-bf19-37c323f256cf@kernel.org>
Date: Fri, 4 Jul 2025 22:53:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] media: atomisp: gc0310: Use V4L2_CID_ANALOGUE_GAIN
 for gain control
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-6-hdegoede@redhat.com>
 <174751615300.335894.3402272890581119176@ping.linuxembedded.co.uk>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <174751615300.335894.3402272890581119176@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kieran,

Thank you for the reviews.

On 17-May-25 23:09, Kieran Bingham wrote:
> Quoting Hans de Goede (2025-05-17 12:40:48)
>> Use V4L2_CID_ANALOGUE_GAIN for gain control, as expected by userspace.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>> index ee039f3be4da..756e56f639b7 100644
>> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
>> @@ -289,7 +289,7 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
>>                 ret = cci_write(sensor->regmap, GC0310_AEC_PK_EXPO_REG,
>>                                 ctrl->val, NULL);
>>                 break;
>> -       case V4L2_CID_GAIN:
>> +       case V4L2_CID_ANALOGUE_GAIN:
>>                 ret = gc0310_gain_set(sensor, ctrl->val);
>>                 break;
>>         default:
>> @@ -533,7 +533,7 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
>>  
>>         /* 32 steps at base gain 1 + 64 half steps at base gain 2 */
> 
> sounds like a curious gain model...
> 
> Will be interesting when we get the sensor calibration tools up and
> running to plot this. (Or is there already a public datasheet
> documenting this?)

There is a datasheet but it does not document much other then
register names.
 
> Is there a split here between analogue gain and digital gain ? Or is it
> all expected to be 'analogue gain' ?

here is the actual method setting the gain:

        /* Taken from original driver, this never sets dgain lower then 32? */

        /* Change 0 - 95 to 32 - 127 */
        gain += 32;

        if (gain < 64) {
                again = 0x0; /* sqrt(2) */
                dgain = gain;
        } else {
                again = 0x2; /* 2 * sqrt(2) */
                dgain = gain / 2;
        }

        cci_write(sensor->regmap, GC0310_AGC_ADJ_REG, again, &ret);
        cci_write(sensor->regmap, GC0310_DGC_ADJ_REG, dgain, &ret);

The 32 half steps come from the dgain = gain / 2 for steps 32 - 95 .

Note the again / dgain names here are confusing. The data sheet describes
the 2 registers which are being written as follows:

AGC:
P0:0x48 ANALOG_COL_gain-col_code 4 bit wide default 0x00 RO [7:4] ANALOG_COL_gain [2:0] col_code

DGC:
P0:0x71 Auto_pregain 8 bit wide default 0x20 RO Auto_pregain

Note DGC is described as read-only in the datasheet, maybe the datesheet is off by one
and we should actually look at register 0x70 in the datasheet:

P0:0x70 Global_gain 8 bit wide default 0x40 RW Global_gain

Either way based on the function calculations I get the feeling that
the first register is actually setting some fixed analog pre-multiplier
and the second register is the actual analog gain.

Despite the names used in the driver (inherited from Android kernels) it
does not feel to me like one of the 2 registers is a digital gain
register.

So I'm going to keep this as is for now and once we've gain calibration
tooling up and running make a plot with the current gain code and then
modify the driver to make this fit one of the standard gain models.

Regards,

Hans



