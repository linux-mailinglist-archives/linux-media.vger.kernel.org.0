Return-Path: <linux-media+bounces-23445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC29F26E9
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 23:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AA161884EE6
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 22:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85AC1C3C05;
	Sun, 15 Dec 2024 22:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IL8qiQyN"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A351BD4F7
	for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 22:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734302846; cv=none; b=APPrqraEIEc4GkcCwu5U5y9MvOL26Oy1ShlKgh7DnxIx8GNVwJeVLjRgpG5sUOYDtA8U9hqv7bQQ7uJCryvdDSWQi0I0NEY19Kl1/n7EEWGmeM4zbY7if13uX7RcHkuBnSSjoXxjko5d68pyyiEYnjEY4gzhH554e+d9RHqvOlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734302846; c=relaxed/simple;
	bh=467FOYZSj24Bx4ZgeNxQOt7DIh+gx8EJP25XhU3IniE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUTlNIrQafNQ2XFpCl1CDzxjJJSoolhl+1ytbW1rTL5tXxbtgi98U4iEf09Xg40fb52OBLNcpP/oXExqLxRQXbepjUGA6aBObfTxp0adCK9N3LJbXSGXhxffjguh1n7NhzZXpJUVoimZGkYOXnOClQ3sprAZqbQ8n4OgSuifsS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IL8qiQyN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734302843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Op0jD2emyUG+fDobyt0UmF5iikXTVLUufQy5qO236M=;
	b=IL8qiQyNk667I7DYECX1B3v/yTe2ik0qAtA3jVuJTtBiYHHbPtwKZKLFj1pMyUNQjmaVYj
	H972/eoV+l0FMeI5JiwZ2wHRys60G93wo5Qsgs2PwfycWKU4FaXiXcEzEug5C2tH7r07G+
	yCelzR5fHcWFhlU3vGWZznBDIyuEpjE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-OkgVxVDDOgyya9WgE5_HuQ-1; Sun, 15 Dec 2024 17:47:21 -0500
X-MC-Unique: OkgVxVDDOgyya9WgE5_HuQ-1
X-Mimecast-MFC-AGG-ID: OkgVxVDDOgyya9WgE5_HuQ
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa665246a3cso30734266b.0
        for <linux-media@vger.kernel.org>; Sun, 15 Dec 2024 14:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734302840; x=1734907640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Op0jD2emyUG+fDobyt0UmF5iikXTVLUufQy5qO236M=;
        b=pdaNo1uEaKpse46zC6ejaKjfhnbeOf/qIolC8K1BjT/V4B+jxZIuwjs22dOnsOdcwP
         fPuHIeI8UU8CoGe93JJzOse7icMwvmSo6RD/qFuHdK9jiWn37ZR0FL2U9OITJI4xeu5k
         G2dJCIwXq883JKKErH3LFOFIZMQ65GVdO2ZxYjzEjSO8lT8cx2OBuyLgu22UW2ruZyad
         HfvhQcikH76Q6fOlnfZeQEPwGfg+wQvVt9sT9mp+cjc6VJU7hofb9IcfW/Fdoe2JbL5+
         5XFmvJ6g8LpTA31W2vRvmJqjbZ2KScK0Y+9ERfzMmj9hqpIBJ0Q8lAG47xTm7xX7WSRo
         B65g==
X-Forwarded-Encrypted: i=1; AJvYcCUKYmi/qvSotNFKkr4anKJNA1s2vA+mkSA2jbHsi/XJ56tXndCy9LIUpiACQkLdNqUPLs2utRawOacO5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOopP063FNKl8rAj+VWe22ze8briGwHZo0G78zlPAGwn0W9Cew
	fb/uXn6NV4rY2OUWPDPCpiMSm6ClMshVJBwhAOaSOZbqo3KY8kIV9VGNWfYdcOgocThpwGn+Dgm
	qT/OBHWpdmvWv68fR5wBfuKUonuUiIxY9Ok752IcMfChjseCfl7FUEXBBMOHL
X-Gm-Gg: ASbGncsQZTeNHKPGcqBCY9qB8HdeXmAdcMSLiAhkw8/xWx/lpPrIufPSs3CCjKfy2wP
	ad13ac/hSPQgrWKP9h09MmaAHWG36cCWCfet4A+lJ9TVb0qPfU2DG/HjJezLNKWmXKynVbJW8UW
	OTbCxSZsi8CYdSwdaIPebieGuCiLrCkVBUBu4pK9wOG5sPXeVGXYTYMTeaxaddKuEnJyVZ8d0Yb
	6ZG45Rl+VzH1k9Ejm3WXpvVoI2ZmbB/QG7ZmEpD+h46hQMGd47OXovc2mDvW3Dn8XHSgCciN8f9
	fULlS/YccvACa6NRDQ0zvYnu2Qx/Tf8UdgaX7fMwfFdoomZjjJOFNKZ5awUZcdDO+IG3hK1aWPY
	EAnzvMSciSbSYxIQtG6Mcydwtj28Dfhk=
X-Received: by 2002:a17:906:4fcc:b0:aa6:5910:49af with SMTP id a640c23a62f3a-aab77909ed6mr1007330966b.24.1734302840435;
        Sun, 15 Dec 2024 14:47:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiWEWdi0dATdWg81tRW7KKYPogMIyKrqKvk3PHXRjMMkG535csD0ZYNbkjEktt4r0WvpvyUw==
X-Received: by 2002:a17:906:4fcc:b0:aa6:5910:49af with SMTP id a640c23a62f3a-aab77909ed6mr1007330466b.24.1734302840099;
        Sun, 15 Dec 2024 14:47:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96067de5sm258711266b.55.2024.12.15.14.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2024 14:47:19 -0800 (PST)
Message-ID: <4a9e8c93-8625-42d6-8c86-c4c981736858@redhat.com>
Date: Sun, 15 Dec 2024 23:47:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: ov2740: Add camera orientation and sensor
 rotation controls
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
References: <20241128152338.4583-1-hdegoede@redhat.com>
 <20241128152338.4583-3-hdegoede@redhat.com>
 <CAPybu_3aK3vrEeY+4iwpfmz2OwhZyz4aoo8RKk3HqLAPxO2M5w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAPybu_3aK3vrEeY+4iwpfmz2OwhZyz4aoo8RKk3HqLAPxO2M5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 28-Nov-24 5:44 PM, Ricardo Ribalda Delgado wrote:
> Hi
> 
> On Thu, Nov 28, 2024 at 4:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add camera orientation and sensor rotation controls using
>> the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
>> helpers.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2740.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index e7a611967b40..998e1977978d 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -755,15 +755,17 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
>>
>>  static int ov2740_init_controls(struct ov2740 *ov2740)
>>  {
>> +       struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
> nit: dont you prefer to pass the i2c_client as a parameter?

The client is retrieved from the sub-device in the same way in other
places.

>>         struct v4l2_ctrl_handler *ctrl_hdlr;
>>         const struct ov2740_mode *cur_mode;
>>         s64 exposure_max, h_blank, pixel_rate;
>>         u32 vblank_min, vblank_max, vblank_default;
>> +       struct v4l2_fwnode_device_properties props;
>>         int size;
>>         int ret;
>>
>>         ctrl_hdlr = &ov2740->ctrl_handler;
>> -       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
>>         if (ret)
>>                 return ret;
>>
>> @@ -813,6 +815,13 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
>>                                      V4L2_CID_TEST_PATTERN,
>>                                      ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
>>                                      0, 0, ov2740_test_pattern_menu);
>> +
>> +       ret = v4l2_fwnode_device_parse(&client->dev, &props);
>> +       if (ret)
> There is no need to v4l2_ctrl_handler_free(ctrl_hdlr); here?

There is, good catch. I'll fix this for v2.

Regards,

Hans


> 
>> +               return ret;
>> +
>> +       v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops, &props);
>> +
>>         if (ctrl_hdlr->error) {
>>                 v4l2_ctrl_handler_free(ctrl_hdlr);
>>                 return ctrl_hdlr->error;
>> --
>> 2.47.0
>>
>>
> 
> 


