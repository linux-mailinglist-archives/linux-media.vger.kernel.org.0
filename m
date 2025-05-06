Return-Path: <linux-media+bounces-31839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E364AAC2A6
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 13:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F8752247A
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 11:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BEF27A473;
	Tue,  6 May 2025 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EOR6zHyn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D24927BF60
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530973; cv=none; b=nRKGyzdnb3MRALePxVrycG8nykMLbmprvkR4jfGVbPAw8Dw2O8SJILEG+n2IVRavVeWCU0w+inWVfDLZrFFuc9fbr85Yk0+InV7YlZrn31EHpFoPikQ6eQ+3N5ogAt9YTl22NqgDRigpjzPskeqRQrwh8FRvSdwSjftLoNzzLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530973; c=relaxed/simple;
	bh=TVpg2VOY7ir4ZdkrPyI5cQEeiPt3GSBH/5o8dGWOcHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5zY8a+131ZYO3aVMhzdif23J9ethkWhUMClNPf470asy3DI2AmaFm8zRSgcRFu/n3YeC3POJHdt7o5w1QdlpnrQ+V2j99vjUdzwpEznR28FeX0MjK5GwSIcPyHATntimshN3lMgw4n6wHSL8CUNj7PUY+IKnfNeWA/JNrg+3LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EOR6zHyn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746530970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77z6VYnqmfRrGNIE8p6hczdsn3czdA6PYehG0t/J1kM=;
	b=EOR6zHyn7jVSgCLPSRKzHhR0XTCuLBXhUxp6/rkOI3R4RFru6fAoG0u9muisQ/XzPqrig1
	W6cj/sU78pjP4KlEhNKVmHDuZ8dKFZrw6ELmBVB9qDIE6VW+qYZ7cMPeSFlDZbklPETnqI
	CbAtdCOuMNoilXU3PwIVn1Hlm3zGM9U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-0Vnr1K1cMqqypMripsew3w-1; Tue, 06 May 2025 07:29:29 -0400
X-MC-Unique: 0Vnr1K1cMqqypMripsew3w-1
X-Mimecast-MFC-AGG-ID: 0Vnr1K1cMqqypMripsew3w_1746530968
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so375222566b.1
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 04:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530968; x=1747135768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77z6VYnqmfRrGNIE8p6hczdsn3czdA6PYehG0t/J1kM=;
        b=raoD9gj2sD751PgrC4nwHtLQ2zNFwrOnBOzdtv7ahH/2lLMQbAZq+7jckYMUM2NNli
         axEBXkxehLNjdDsIdhCfM5x1U45aNHx12gcs9PcYZ33+8ENplAK82WanzaxjbCOREsSy
         +1lMKRgCs41z/5rNAoe5305AzO98ki3JGmwA0tdlFs7CD68ieY30C/EL1jnizQGT/2YQ
         +f+pYf1aNeAvRdJBMNzHvDB8KYurwOMoCJe0LEVM8R36vEBTfWZ4lUW5MHkyPvwBcAj5
         VDcL0QaN80TlS5daW9Gxuq1B01xZx3JxOR6RrhGFGZaQ3/Sd+XLklVvEBDy7Z8FnauO7
         ZBEw==
X-Forwarded-Encrypted: i=1; AJvYcCVHyuDJAi3ntfUSwwBgumXEKx/s3al8CK1dIskMb4VC1Vqg2Amq5XIvmqfvyWKIvZE0/BevQ7bCHUvpZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFq5b/4P+s3BLwZ7veEAEjNlDv5g3WYExr62XOlb3/IXAI1tU0
	6fUVOaKRYWtluqAVdoPvJvDmpO5jKOz/zfXQ6xaiHP+VQSbAK3druvz1P4me5DEfMo1NDeUw4ZQ
	0j/f2JAMgV25eQ1rcbTnHmEYd3mxq5pjFUyHRe/AVBdB1E+lhsRZi10ErKgMk
X-Gm-Gg: ASbGnctCmZFQH02MvUIt6s8MeVaMrT8ZirQt9ePpzYPZ5Eu2bOzNkPyqveTn9O96m+I
	g5jVAFrequ1VH59Yc32KuNFPIz00cFHuuOyP8FdRukZA6c9PcLt+P6PjB5cgVwJMAenYd5vgCvH
	G7bvVyGtigQUigufephxlBPvIOWxUJDhi9VCQOrx0Bikb/d7DXwrpDncUkrwc1ICRwS/IDJ8JQq
	k45KPIMnX5MZALmLrHw3yz+WK1gSggwPcV2qZY2OsHZVYnHzYTnra2MAJnJhPTYfol5x7xqhT6X
	ARev4w5KzrxLYjtKPn/h7SzmUuRC3QtQOcCgDP/yYbvs6+P3+4stHfXH20DLEwauv0rVLRQX3LA
	W4X6L1cIwTdvDFai8aCaDbnvRuxjs++KuJR+8KHKQu5Dksk0TkpQnmzx+K3RrLw==
X-Received: by 2002:a17:907:7f05:b0:aca:d6f2:5d5 with SMTP id a640c23a62f3a-ad1d355c9f1mr260391266b.39.1746530967995;
        Tue, 06 May 2025 04:29:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/RUAx/bk8fK18mFp5VIgEcOB5qMr83VV5eqVK1WE6umSRV7R5M/mJzbHZ862NME14PsOhwQ==
X-Received: by 2002:a17:907:7f05:b0:aca:d6f2:5d5 with SMTP id a640c23a62f3a-ad1d355c9f1mr260387966b.39.1746530967493;
        Tue, 06 May 2025 04:29:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1e306dbc6sm22174166b.120.2025.05.06.04.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 04:29:26 -0700 (PDT)
Message-ID: <edd2d2a0-dc5b-48ea-a4fb-a9816e18a613@redhat.com>
Date: Tue, 6 May 2025 13:29:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Nirujogi, Pratap" <pnirujog@amd.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, dave.stevenson@raspberrypi.com, krzk@kernel.org,
 dan.carpenter@linaro.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
 <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
 <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>
 <20250402012052.GG4845@pendragon.ideasonboard.com>
 <aBm-FEdHqERKj9Am@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aBm-FEdHqERKj9Am@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sakari,

On 6-May-25 9:45 AM, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Wed, Apr 02, 2025 at 04:20:52AM +0300, Laurent Pinchart wrote:
>> On Mon, Mar 31, 2025 at 03:17:22PM -0400, Nirujogi, Pratap wrote:
>>> On 3/28/2025 9:18 PM, Bryan O'Donoghue wrote:
>>>> On 28/03/2025 21:42, Pratap Nirujogi wrote:
>>>>> From: Bin Du <Bin.Du@amd.com>
>>>>
>>>>> +static const struct i2c_device_id ov05c10_id[] = {
>>>>> +     {"ov05c10", 0 },
>>>>> +     { }
>>>>> +};
>>>>
>>>> There's an IPU6/IPU7 version of this driver.
>>>>
>>>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ 
>>>> ov05c10.c
>>>>
>>>> Perhaps you could import the Intel ACPI name contained in there too.
>>>>
>>> sure, will add Intel ACPI names too in V3. To be specific, I'm going to 
>>> add the below table in addition to the existing "struct i2c_device_id 
>>> ov05c10_id[]" table:
>>>
>>> static const struct acpi_device_id ov05c10_acpi_ids[] = {
>>> 	{ "OVTI05C1" },
>>> 	{}
>>> };
>>
>> You could drop the i2c_device_id table if you added an OF device ID
>> table, but you'll need DT bindings for that. Sakari, any best practice
>> rule in this area ?
> 
> I don't think there should be a need for an I²C ID in any case, having just
> ACPI _HID is fine.

AMD laptops with MIPI cameras (where this sensor is used) do not
properly describe the sensor as an ACPI I2C device in their
ACPI tables. So instead this is going to rely on manual i2c-client
instantiation by some pdx86 glue code, see:

https://lore.kernel.org/platform-driver-x86/20250505171302.4177445-1-pratap.nirujogi@amd.com/

To have a driver bind to such manually instantiated
i2c-clients there must be an i2c_device_id table.

Regards,

Hans





>>>>> +
>>>>> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
>>>>> +
>>>>> +static struct i2c_driver ov05c10_i2c_driver = {
>>>>> +     .driver = {
>>>>> +             .name = DRV_NAME,
>>>>> +             .pm = pm_ptr(&ov05c10_pm_ops),
>>>>> +     },
>>>>> +     .id_table = ov05c10_id,
>>>>> +     .probe = ov05c10_probe,
>>>>> +     .remove = ov05c10_remove,
>>>>> +};
>>>>> +
>>>>> +module_i2c_driver(ov05c10_i2c_driver);
>>>>> +
>>>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>>>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>>>>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>>>>> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
>>>>> +MODULE_LICENSE("GPL v2");
>>>>
>>>> Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above
>>>> is GPL not GPL v2.
>>>
>>> sure, will replace "GPL v2" with "GPL" in V3.
>>
> 


