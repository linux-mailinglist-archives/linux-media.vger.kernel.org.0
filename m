Return-Path: <linux-media+bounces-28504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D4A69353
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CA3A3A5186
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E269C1C5D79;
	Wed, 19 Mar 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gvARo621"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592D91AF0BC
	for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 15:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742397808; cv=none; b=p5uN3XYVmCLtWFBSkJ/tfCgD82rczd6yJWNoDVdauMKc5EcRWIWwfVxKlrD/Vz29Ok5BxtHt60TcYt2NLiouqbawsVNG9lBkrVMgUuJD/4L6zf99Ez3CryPxlZCgcy+6SzA3KiegGtsFsOMFsihgGK7Ec45IRA9Hawyh+YwPPzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742397808; c=relaxed/simple;
	bh=ARE+fj05Bu/vtVwT/Br76HIVuEc2cBLF5T6woCTXT2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imaNXYf22EurRFQ78S3PQ2D/jyvt3EtCuA6HzuewGeA149149S8pFJIYseM5PJVqSpNJmjvQX2sNv7AOh3xxkAJDbuKYdq+7JBDeEu3kFJkHQXcdBycfmp+0XUb5deSXa9PWLgg/ifvmxuueddxZSVXrAFpqhN1GsCFX+5GqrCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gvARo621; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742397805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgYUkQsohYXgCMPbcUnOQWyIfns0sHAijcOGG0Up+AA=;
	b=gvARo621vqnsBgTd9nJCwFb6Y05Nf35yyjRCsCL6eUFr6doLGu7LDXQdy+YF00TytzAZJ/
	L9SkssJyuo02aa9mxI9jb19gzkwo7JW0eAFTwSMA7d6A4fyf44LC1Nnx25EdrawNRiONkx
	8xVCTph3gdy6Apc7yNNh7V+EjBmVvcI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-TH1rOgUYNZKSHUpYJ5ScoA-1; Wed, 19 Mar 2025 11:23:23 -0400
X-MC-Unique: TH1rOgUYNZKSHUpYJ5ScoA-1
X-Mimecast-MFC-AGG-ID: TH1rOgUYNZKSHUpYJ5ScoA_1742397802
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab76aa0e72bso554251666b.0
        for <linux-media@vger.kernel.org>; Wed, 19 Mar 2025 08:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742397802; x=1743002602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgYUkQsohYXgCMPbcUnOQWyIfns0sHAijcOGG0Up+AA=;
        b=cCSeJpBcqNOUVwAEJ5J5/16yeTK0NYA2YXakCXEw/LhG0IgBBjvHCby0v6SWonGFau
         lgilJwmJVweOdDKRUFd7ucLXQoAZuRaWDvOfUU2MGDLW0lg7lXuc2y0DhKfJA4uDqA9S
         kcFv1DXIPA5w1mwDr0I9JX7Yuc2X1YXFKgYdS9NmVXJ7Q5IPXhpeTguuH5H7Vof3Jtmf
         B/7h68mJRmzzw6vlE8Qf1BmMhDLMWnUIvXyA1kyll2ntLRodxiLOYZqWAel3tnLlnm+0
         VfWDKb0RvmbOm1x6tw5jAQiEwwUwgym6aEKmPqRLTEx1T87XLc873Cu7NnTXDR7Zqhcv
         bJQw==
X-Forwarded-Encrypted: i=1; AJvYcCWbaGfYFgE5L342BfUetmXtZrtl6OWq67PX7KrqleXFITJnnZ1U0sXuyw7veNVcjaHcexIDnaIXYLbAnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFGrmk77gfJILgD/mlPQwGWcyAr7jJZciVq6M602XZTB6LanX
	MG8J0zuprI0ejHfvwTouVj3xT7mFxrh7ShT5EaeWjea4y6qLhA9oKIN2xTKFGPDYgFKAf2pe0uQ
	QZfmuguo4RJ2gXs6vL2Of8XNWUmwjyYZ2k8Lfwcel4+tt5LJ+YozNObDpvdHp
X-Gm-Gg: ASbGncuzCwbj4ERhfn0GHdux6NfhpavA69+LAUnHxEZqCA6k885PgxTZYBlgqFqa0Zj
	ClePYdcvfKpTchk9itWcVCOdBAIobiQnaohlqpkGAsKMd31x7wwcbOBdAx9vsBNasD7Av8A/c1i
	Jnz6ySTQWPwiJ529IvDYNQoO0ybu3UsumNLocTwKY3y0shzuDksoYoDPskmkujPg2viZpmBuKDa
	OoohNevmZrG/cyIhk7cNDj00KVXLVsQ8+TXyvYwK2PX4l50QqMC1swOO2oVZIU/lqGC4JUJutF4
	fp9QnUX6I8XKY1Jo2x9efrdqCLtoazX90jPZEpyzuveCUyMKDOEBCxLvt+jJLnL/AZYbTnwjgF6
	KkR++TvfMHsunz9IFOEDap6N4TuUUo5JK78dE6OSksvzwCMwU1sPKFM9UxJZk05Fw7g==
X-Received: by 2002:a17:907:6ea9:b0:ac3:49ee:c5aa with SMTP id a640c23a62f3a-ac3b7dcf606mr319429066b.31.1742397802210;
        Wed, 19 Mar 2025 08:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9iHvXTpiAAKi6KMzHbmMCNlDikmofzc3HJgY3/Ervko4JfT8npaPkYaegYMKZ6QBWXNUUdw==
X-Received: by 2002:a17:907:6ea9:b0:ac3:49ee:c5aa with SMTP id a640c23a62f3a-ac3b7dcf606mr319422366b.31.1742397801633;
        Wed, 19 Mar 2025 08:23:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149d0bcdsm1042177966b.90.2025.03.19.08.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 08:23:21 -0700 (PDT)
Message-ID: <d6acd11e-cc7b-4a2f-b983-d4b490983983@redhat.com>
Date: Wed, 19 Mar 2025 16:23:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/1] media: i2c: Add Omnivision OV02C10 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Ingvar Hagelund <ingvar@redpill-linpro.com>,
 Joachim Reichel <joachim.reichel@posteo.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hao Yao <hao.yao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250314101125.9853-2-hdegoede@redhat.com>
 <Z9QlNEP8aL1XdlAv@kekkonen.localdomain>
 <20d55eba-d802-46c1-a08e-d836eea2717f@redhat.com>
 <Z9rfyfHhBXydJGo6@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z9rfyfHhBXydJGo6@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 19-Mar-25 4:16 PM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Mar 19, 2025 at 03:59:31PM +0100, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 14-Mar-25 1:46 PM, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> Thanks for the update.
>>>
>>> On Fri, Mar 14, 2025 at 11:11:25AM +0100, Hans de Goede wrote:
>>>> From: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
>>>>
>>>> Add a new driver for the Omnivision OV02C10 camera sensor. This is based
>>>> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
>>>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
>>>>
>>>> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
>>>> driver and the libcamera software ISP code.
>>>>
>>>> Tested-by: Ingvar Hagelund <ingvar@redpill-linpro.com>
>>>> Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
>>>> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> <snip>
>>
>>>> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
>>>> new file mode 100644
>>>> index 000000000000..5626aa2fe62c
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/ov02c10.c
>>>> @@ -0,0 +1,1012 @@
>>
>> <snip>
>>
>>>> +static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
>>>
>>> Could you use struct cci_reg_sequence for this?
>>>
>>>> +	{0x0301, 0x08},
>>>
>>> { CCI_REG8(0x0301), 0x08 },
>>>
>>> etc.
>>>
>>> That would also enable using human-readable names in this list.
>>
>> TBH I would rather not, adding the CCI_REGx everywhere will make
>> it harder to keep the out of tree code in sync with this, using
>> raw struct reg_sequence combined with regmap_multi_reg_write()
>> is sort of the norm for drivers converted to the CCI helpers.
>>
>> Also while using symbolic register names (defines) greatly
>> improves the readability of other code accessing the registers,
>> I find it unhelpful for these large just send a bunch of
>> register values to the sensor cases, especially since for many
>> of the addresses we've no clue what we're sending / what 
>> the register does.
> 
> That's true for the undocumented ones (and this being an OV sensor, there
> are many) but for the rest it's helpful.
> 
> I presume there's no need for updating downstream drivers after we have one
> in upstream?

Well Intel's camera team has a habit of adding downstream changes
to drivers after they have been mainlined to e.g. support a different
CSI lane count.

Or even just downstream patches to driver which they never had in their
downstream repo, see e.g. the patches for ov13b10 and ov08x40 here:

https://github.com/intel/ipu6-drivers/tree/master/patch/v6.12

>>>> +	{0x0303, 0x06},
>>>> +	{0x0304, 0x01},
>>>> +	{0x0305, 0xe0},
>>
>> <snip>
>>
>>>> +};
>>>> +
>>>> +static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
>>>> +	{0x301b, 0xd2},
>>>> +	{0x3027, 0xe1},
>>>> +	{0x380c, 0x08},
>>>> +	{0x380d, 0xe8},
>>>> +	{0x380e, 0x04},
>>>> +	{0x380f, 0x8c},
>>>> +	{0x394e, 0x0b},
>>>> +	{0x4800, 0x24},
>>>> +	{0x5000, 0xf5},
>>>> +	/* plls */
>>>> +	{0x0303, 0x05},
>>>> +	{0x0305, 0x90},
>>>> +	{0x0316, 0x90},
>>>> +	{0x3016, 0x12},
>>>> +};
>>>> +
>>>> +static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
>>>> +	{0x301b, 0xf0},
>>>> +	{0x3027, 0xf1},
>>>> +	{0x380c, 0x04},
>>>> +	{0x380d, 0x74},
>>>> +	{0x380e, 0x09},
>>>> +	{0x380f, 0x18},
>>>> +	{0x394e, 0x0a},
>>>> +	{0x4041, 0x20},
>>>> +	{0x4884, 0x04},
>>>> +	{0x4800, 0x64},
>>>> +	{0x4d00, 0x03},
>>>> +	{0x4d01, 0xd8},
>>>> +	{0x4d02, 0xba},
>>>> +	{0x4d03, 0xa0},
>>>> +	{0x4d04, 0xb7},
>>>> +	{0x4d05, 0x34},
>>>> +	{0x4d0d, 0x00},
>>>> +	{0x5000, 0xfd},
>>>> +	{0x481f, 0x30},
>>>
>>> It's surprising to have more registers when the number of lanes is 2. I
>>> guess for 1 lane case it's using defaults?
>>
>> I guess so. At your request I split the registers which were
>> different for the 1 / 2 lane cases into 2 separate register lists
>> and some register writes where only in the long 2 lane register list
>> of the previous version.
> 
> Ok. Adding further modes later on will require addressing this.
> 
>>
>>>> +static int ov02c10_test_pattern(struct ov02c10 *ov02c10, int pattern)
>>>> +{
>>>> +	int ret = 0;
>>>> +
>>>> +	if (!pattern)
>>>> +		return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>>>> +				       BIT(7), 0, NULL);
>>>> +
>>>> +	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>>>> +			0x03, pattern - 1, &ret);
>>>> +	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>>>> +			BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
>>>
>>> I'd do here:
>>>
>>> 	return cci_update_bits(...);
>>
>> Since we are relying on the error preserving / propagating
>> behavior of the CCI helpers here that feels weird / inconsistent,
>> I would expect either:
>>
>> 	ret = cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>> 			      0x03, pattern - 1, NULL);
>> 	if (ret)
>> 		return ret;
>>
>> 	return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>> 			       BIT(7), OV02C10_TEST_PATTERN_ENABLE, NULL);
>> }
>>
>> or:
>>
>> 	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>> 			0x03, pattern - 1, &ret);
>> 	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
>> 			BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
>> 	return ret;
>> }
>>
>> not a mix of the 2, with my preference going to the latter.
> 
> Works for me, too, although I expect someone, will come some day and submit
> a cleanup patch for this. :-)
> 
> I'm ok with v10, I guess further cleanup can be done if / when more
> functionality is added.

That is good to hear, thank you.

Regards,

Hans



