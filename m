Return-Path: <linux-media+bounces-22868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201C9E8F07
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 234731883C42
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C6083CD2;
	Mon,  9 Dec 2024 09:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cd9M6cyH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D321215163;
	Mon,  9 Dec 2024 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737613; cv=none; b=IovXS0YGfAmnN73/YBpQtzR7A99tU6f6BmwztJIP9Umuwj1NwBeuPbjQ6v7JHulrEgWHe3qxwbuqLzlyzK5wyphqoDCEohOj8LySKLX15QZk0GK7RTnTyG5odOHpsqiR0/o5y6zEXRc6w77FHQeomaIjC0EVbKcHRgcMTuDDEdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737613; c=relaxed/simple;
	bh=Zq9mYDeWDCAN8JsdV6P0KTZt+CejY4sIahlP6jvyczQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNin3etQdjesc4iEGk4qhLrMU3Qdq0r34nLq0+aVll3mbF7q7mXVYyBn8RGLnU4gbcqTQzjA/5JvVvr1woSJbYJYRPInoSpsOFa7w68WdzyXVVzXhOXhxfxBDP+LMEohwmlYAC8L8bo1GexMHc+ExACYAEmPYzrFaCisG2Wpe3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cd9M6cyH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64696502;
	Mon,  9 Dec 2024 10:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733737577;
	bh=Zq9mYDeWDCAN8JsdV6P0KTZt+CejY4sIahlP6jvyczQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cd9M6cyHL5pY2w9Nqj9rY8eBdcOO78PVpCtSAZq9se+BVilY+4FrEjodfEf0OUWKh
	 eRocsNEUGYhVd5mSo1nk5AtmVmaUr423u+Er6iscFcuTC7u8rTT01i0xcJaq+ZvmBa
	 +6yepBo+qs1p3ma3fobL0FASHUyqOFVv7dkhpfBc=
Message-ID: <c740c233-315f-4431-8b86-8bdc1e3a72de@ideasonboard.com>
Date: Mon, 9 Dec 2024 11:46:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/15] media: i2c: ds90ub9x3: Fix extra
 fwnode_handle_put()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <20241204-ub9xx-fixes-v3-1-a933c109b323@ideasonboard.com>
 <Z1azue3G14MQpfiI@kekkonen.localdomain>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <Z1azue3G14MQpfiI@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/12/2024 11:09, Sakari Ailus wrote:
> Huomenta,
> 
> On Wed, Dec 04, 2024 at 01:05:15PM +0200, Tomi Valkeinen wrote:
>> The ub913 and ub953 drivers call fwnode_handle_put(priv->sd.fwnode) as
>> part of their remove process, and if the driver is removed multiple
>> times, eventually leads to put "overflow", possibly causing memory
> 
> This is, in fact, an extra put. It'll lead to underflow, not overflow.

Well, there are too many puts, so "put overflow" =). I don't think 
underflow is the right word here either, but it's probably better than 
overflow. Maybe I'll reword it so that it doesn't have a flow at all.

> I'd expect removing it once would be already too much.

True, but there's something keeping some refs to the fwnode even without 
these drivers (otherwise they'd be freed when these drivers are not 
around), so the issue shows only when those refs are taken out by the 
puts in these drivers.

  Tomi

> 
>> corruption or crash.
>>
>> The fwnode_handle_put() is a leftover from commit 905f88ccebb1 ("media:
>> i2c: ds90ub9x3: Fix sub-device matching"), which changed the code
>> related to the sd.fwnode, but missed removing these fwnode_handle_put()
>> calls.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Cc: stable@vger.kernel.org
>> Fixes: 905f88ccebb1 ("media: i2c: ds90ub9x3: Fix sub-device matching")
>> ---
>>   drivers/media/i2c/ds90ub913.c | 1 -
>>   drivers/media/i2c/ds90ub953.c | 1 -
>>   2 files changed, 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
>> index 8eed4a200fd8..b5375d736629 100644
>> --- a/drivers/media/i2c/ds90ub913.c
>> +++ b/drivers/media/i2c/ds90ub913.c
>> @@ -793,7 +793,6 @@ static void ub913_subdev_uninit(struct ub913_data *priv)
>>   	v4l2_async_unregister_subdev(&priv->sd);
>>   	ub913_v4l2_nf_unregister(priv);
>>   	v4l2_subdev_cleanup(&priv->sd);
>> -	fwnode_handle_put(priv->sd.fwnode);
>>   	media_entity_cleanup(&priv->sd.entity);
>>   }
>>   
>> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
>> index 16f88db14981..10daecf6f457 100644
>> --- a/drivers/media/i2c/ds90ub953.c
>> +++ b/drivers/media/i2c/ds90ub953.c
>> @@ -1291,7 +1291,6 @@ static void ub953_subdev_uninit(struct ub953_data *priv)
>>   	v4l2_async_unregister_subdev(&priv->sd);
>>   	ub953_v4l2_notifier_unregister(priv);
>>   	v4l2_subdev_cleanup(&priv->sd);
>> -	fwnode_handle_put(priv->sd.fwnode);
>>   	media_entity_cleanup(&priv->sd.entity);
>>   }
>>   
>>
> 


