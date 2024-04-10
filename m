Return-Path: <linux-media+bounces-8978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A289EEBB
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34D87B21C55
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 09:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CAF155382;
	Wed, 10 Apr 2024 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VN75rMXc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555D1552EF
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 09:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712741227; cv=none; b=rj8CTX4I1UINF1iAlhE+Woq/xr+9nd68y3GOMqHuRPWOHPjLgmZqFH2s/ngsF3OVCt+TPro/PlQ2psVWiCAiBQqh6ebnJqZw0PWCa0kDTrpDp4CvQdBZeVCap+dflIQALlAoCL4S+gE3TaDOihWu1C9KWsZD27cR6fT5cTgIRpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712741227; c=relaxed/simple;
	bh=pSe7lq4ETdkyDGVwIxwrzJl+72Ex61A/7Df7KH/1F1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLKctU3u6BRszLgUoWn63n0Xj2v6/NJ86X6SZXxUY3Yd3y/nIME9MOcwyRR6RtOmQgKIONmcua2dx5SgPK2/NZgKkcHriN9SK4R/Q1+J9k3VlV3R1LstacjAln4O3avnx4PsRC0NaIx+TgeEcXMEA1hEZ6q37phhYuWXLc4YBys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VN75rMXc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712741225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tUUtvbgdgDlDFSLXwbSrrz95gmxnQtf+mJADlO8y1TU=;
	b=VN75rMXcQhDxlO8sTKbtmeZ2A/hnBMNynre7vtdsaywyyiS45lu2uJB7Jfy620xkJPmRDn
	aDomtFTdsTZZBqC4tDiWE5ps939Y94kPs43oZqoO0g3N4ByzpL9uhU0sztYfQ21UitNk0b
	tAnb8+VOqMgMu/50x7xy7CZ5OeXLRQo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219--9XzO0dcN4GBGxoi5fkGLw-1; Wed, 10 Apr 2024 05:27:03 -0400
X-MC-Unique: -9XzO0dcN4GBGxoi5fkGLw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5684c1abc7fso2886374a12.3
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 02:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712741222; x=1713346022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUUtvbgdgDlDFSLXwbSrrz95gmxnQtf+mJADlO8y1TU=;
        b=CT6Hv75cEnEyZ2IpnOlorZyoNIp4niMe2jRN8ZjiRNCyl35o2JEQO0aNndQ2g65Wgz
         I9Iiqisxrz8uWeTzczqrMdn9kOuZjGDvvsia42zbxDDYxyN71ItyiDs+Ir5KD3hj44Ok
         KMSZLGGnzf9jk+ul1uM/3EWT+QwinN4vHl/U1AQLmKI8mD+zwM0DHQs62SKJd78VaAem
         8splAH5V4MhP5u8SejGVCGat3VIPT3zaJamJPkIEhnd8ZBhXa4ajHLmHZ0KfCqBgO3NY
         YtAO3tibVqtANOdcbyEByCAeItXoUdPPBOwRWNqdjXEVo6Zp/dht8MH5TmRhtFBF3vFf
         mw3A==
X-Forwarded-Encrypted: i=1; AJvYcCXLRQeRD/nJXsQDjEPruFvvkjMikmXswjjYAZyJATbE978LoVNEV2wvUG69h7LMSMf+GUw7W/MA0dCdzuBsJ1BdUcVk2E5Evg7Xe3w=
X-Gm-Message-State: AOJu0Yzi7fumx+kviNoMIeRCLoROBbo8HV1AGbGwPd+yqoU9UHumkGAC
	kJqMw2lXeCYeyBuga2tPX+P6Gc2Eg8YW8sM2qBRVLvIkqQK0F7Rf+yb/sPVtzPHrSSU+klXxVRH
	YZ8S9/2Nbss6ihgVHBGg187jOWkmjTBx4/sYRS9E2Q1bRjyKhvDbYmU0NJiwK
X-Received: by 2002:a50:d71b:0:b0:56d:fb8c:de6b with SMTP id t27-20020a50d71b000000b0056dfb8cde6bmr1533687edi.6.1712741222432;
        Wed, 10 Apr 2024 02:27:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKHYXMCU7QFHxl5p7KvAICKjZ6okk0MOaf2fu6axloHVxrr/hZwgiBh/RTAATvtiTcuHDFKA==
X-Received: by 2002:a50:d71b:0:b0:56d:fb8c:de6b with SMTP id t27-20020a50d71b000000b0056dfb8cde6bmr1533682edi.6.1712741222110;
        Wed, 10 Apr 2024 02:27:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y9-20020a056402440900b0056e3707323bsm5497620eda.97.2024.04.10.02.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 02:27:01 -0700 (PDT)
Message-ID: <9c99ec26-74ad-41b4-99cd-23aac41efec6@redhat.com>
Date: Wed, 10 Apr 2024 11:27:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] media: subdev: Add privacy led helpers
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240405-enable-streams-impro-v2-0-22bca967665d@ideasonboard.com>
 <20240405-enable-streams-impro-v2-1-22bca967665d@ideasonboard.com>
 <ZhZW1hiv9X7JCQ7O@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZhZW1hiv9X7JCQ7O@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/10/24 11:07 AM, Sakari Ailus wrote:
> Moi,
> 
> On Fri, Apr 05, 2024 at 12:14:19PM +0300, Tomi Valkeinen wrote:
>> Add helper functions to enable and disable the privacy led. This moves
>> the #if from the call site to the privacy led functions, and makes
>> adding privacy led support to v4l2_subdev_enable/disable_streams()
>> cleaner.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-subdev.c | 31 ++++++++++++++++++++++---------
>>  1 file changed, 22 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 4c6198c48dd6..942c7a644033 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -148,6 +148,23 @@ static int subdev_close(struct file *file)
>>  }
>>  #endif /* CONFIG_VIDEO_V4L2_SUBDEV_API */
>>  
>> +static void v4l2_subdev_enable_privacy_led(struct v4l2_subdev *sd)
>> +{
>> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>> +	if (!IS_ERR_OR_NULL(sd->privacy_led))
>> +		led_set_brightness(sd->privacy_led,
>> +				   sd->privacy_led->max_brightness);
>> +#endif
>> +}
>> +
>> +static void v4l2_subdev_disable_privacy_led(struct v4l2_subdev *sd)
>> +{
>> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>> +	if (!IS_ERR_OR_NULL(sd->privacy_led))
>> +		led_set_brightness(sd->privacy_led, 0);
>> +#endif
>> +}
>> +
>>  static inline int check_which(u32 which)
>>  {
>>  	if (which != V4L2_SUBDEV_FORMAT_TRY &&
>> @@ -412,15 +429,11 @@ static int call_s_stream(struct v4l2_subdev *sd, int enable)
>>  	if (WARN_ON(!!sd->enabled_streams == !!enable))
>>  		return 0;
>>  
>> -#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>> -	if (!IS_ERR_OR_NULL(sd->privacy_led)) {
>> -		if (enable)
>> -			led_set_brightness(sd->privacy_led,
>> -					   sd->privacy_led->max_brightness);
>> -		else
>> -			led_set_brightness(sd->privacy_led, 0);
>> -	}
>> -#endif
>> +	if (enable)
>> +		v4l2_subdev_enable_privacy_led(sd);
>> +	else
>> +		v4l2_subdev_disable_privacy_led(sd);
>> +
>>  	ret = sd->ops->video->s_stream(sd, enable);
> 
> I see that you're only making changes before the s_stream call which also
> reveals a bug here: if streaming on fails, the LED will remain lit. It
> should be fixed before this set.
> 
> I cc'd Hans de Goede.

Right that seems like a bug which I introduced. I think it would be
best to move the setting of the LED on/off to after the s_stream()
call in the:

       if (!ret)
                sd->enabled_streams = enable ? BIT(0) : 0;

block, so that the LED is not touched when s_stream(sd, 1) fails.

This delay enabling the LED slightly on stream start but IMHO
that is not a bit issue.

Regards,

Hans



