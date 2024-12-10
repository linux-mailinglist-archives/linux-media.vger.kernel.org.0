Return-Path: <linux-media+bounces-22977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8C9EA9B5
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 001F6284CCD
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 07:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9F122CBD2;
	Tue, 10 Dec 2024 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dR85Hmiz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD0192D66;
	Tue, 10 Dec 2024 07:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733816326; cv=none; b=cNUUBhllnzeF82tyQ4GIIRx8FsgURsbaYZKWRTZUpj4Aon7aPr8UMSo4JXy38bv+on3DYtFZnCkvjrLG7ZDk5uj2qTTpeJnN3SLEQsAsmhISWnOv6ChlgBSLUxMNtLrBsNV1xUTBs5c7B4AudqIBg6gi+NN/KrwPZtO1JRQlfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733816326; c=relaxed/simple;
	bh=r8fzQv9DjN663ldyHBwouh1TahRmh7lvUCq/GdTCQt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7uMK3hVhpro/SUIZo7AWw167BcyL7pozA4s/wv+DngVbSgQnlifC4wKk5GZke2Y31/ZqQk+dagPf3+Qga/HUo9vTXz8aZTTdyNhwth3LGijwTzgG52BbHVNNCdxyIyyGv0Ji5TPvept7QpSA0tusz+Lk+rVxJjZ5N2v8RAwYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dR85Hmiz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2D7226EC;
	Tue, 10 Dec 2024 08:38:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733816281;
	bh=r8fzQv9DjN663ldyHBwouh1TahRmh7lvUCq/GdTCQt8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dR85HmizJW9ubKMFjAPXNcNyNh4rwSW/QcUe4oKyUPkZrd4yNG/cPS7UfWY9Cmahv
	 zpsQRq2tAgqhimfelS+bXkdeK45H1RJn94Zy6GgL88k5txP2W0cT1liqEwRbyV6o3z
	 dgN1SBARcl809WOqNHsFpNDccpASgBA0gSFo/LzQ=
Message-ID: <e53c8964-5373-4c1f-ad48-69a474a997fb@ideasonboard.com>
Date: Tue, 10 Dec 2024 09:38:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/15] media: i2c: ds90ub960: Fix logging SP & EQ
 status only for UB9702
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
 <20241206-ub9xx-fixes-v4-4-466786eec7cc@ideasonboard.com>
 <Z1a0OiRDw92o1w6_@kekkonen.localdomain>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <Z1a0OiRDw92o1w6_@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/12/2024 11:11, Sakari Ailus wrote:
> Huomenta,
> 
> On Fri, Dec 06, 2024 at 10:26:40AM +0200, Tomi Valkeinen wrote:
>> UB9702 does not have SP and EQ registers, but the driver uses them in
>> log_status(). Fix this by separating the SP and EQ related log_status()
>> work into a separate function (for clarity) and calling that function
>> only for UB960.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
>> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/i2c/ds90ub960.c | 90 ++++++++++++++++++++++++-------------------
>>   1 file changed, 50 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
>> index 24198b803eff..94c8acf171b4 100644
>> --- a/drivers/media/i2c/ds90ub960.c
>> +++ b/drivers/media/i2c/ds90ub960.c
>> @@ -2950,6 +2950,54 @@ static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
>>   	.set_fmt = ub960_set_fmt,
>>   };
>>   
>> +static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
>> +					 unsigned int nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	u8 eq_level;
>> +	s8 strobe_pos;
>> +	u8 v = 0;
>> +
>> +	/* Strobe */
>> +
>> +	ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
> 
> How about adding __must_check to the ub960_read()?

Actually, this is just moving code around (behind an if), so I'd rather 
not add more to this patch, especially as this is a fix.

We'll add the error handling separately on top.

  Tomi

> 
>> +
>> +	dev_info(dev, "\t%s strobe\n",
>> +		 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
>> +							  "Manual");
>> +
>> +	if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
>> +		ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
>> +
>> +		dev_info(dev, "\tStrobe range [%d, %d]\n",
>> +			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
>> +			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
>> +	}
>> +
>> +	ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
>> +
>> +	dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
>> +
>> +	/* EQ */
>> +
>> +	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
>> +
>> +	dev_info(dev, "\t%s EQ\n",
>> +		 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
>> +						    "Adaptive");
>> +
>> +	if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
>> +		ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
>> +
>> +		dev_info(dev, "\tEQ range [%u, %u]\n",
>> +			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
>> +			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
>> +	}
>> +
>> +	if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
>> +		dev_info(dev, "\tEQ level %u\n", eq_level);
>> +}
>> +
>>   static int ub960_log_status(struct v4l2_subdev *sd)
>>   {
>>   	struct ub960_data *priv = sd_to_ub960(sd);
>> @@ -2997,8 +3045,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
>>   
>>   	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
>>   		struct ub960_rxport *rxport = priv->rxports[nport];
>> -		u8 eq_level;
>> -		s8 strobe_pos;
>>   		unsigned int i;
>>   
>>   		dev_info(dev, "RX %u\n", nport);
>> @@ -3034,44 +3080,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
>>   		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
>>   		dev_info(dev, "\tcsi_err_counter %u\n", v);
>>   
>> -		/* Strobe */
>> -
>> -		ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
>> -
>> -		dev_info(dev, "\t%s strobe\n",
>> -			 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
>> -								  "Manual");
>> -
>> -		if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
>> -			ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
>> -
>> -			dev_info(dev, "\tStrobe range [%d, %d]\n",
>> -				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
>> -				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
>> -		}
>> -
>> -		ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
>> -
>> -		dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
>> -
>> -		/* EQ */
>> -
>> -		ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
>> -
>> -		dev_info(dev, "\t%s EQ\n",
>> -			 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
>> -							    "Adaptive");
>> -
>> -		if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
>> -			ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
>> -
>> -			dev_info(dev, "\tEQ range [%u, %u]\n",
>> -				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
>> -				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
>> -		}
>> -
>> -		if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
>> -			dev_info(dev, "\tEQ level %u\n", eq_level);
>> +		if (!priv->hw_data->is_ub9702)
>> +			ub960_log_status_ub960_sp_eq(priv, nport);
>>   
>>   		/* GPIOs */
>>   		for (i = 0; i < UB960_NUM_BC_GPIOS; i++) {
>>
> 


