Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89393452E7C
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 10:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbhKPJ5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 04:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47574 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233509AbhKPJ5l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 04:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637056481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wk+MOWgjozoLhZm7pPaaV2e3KZg+3AnVshNINsqu9jc=;
        b=g2YBTct1foS3mtpk42ESpa2NMvZqhUZSjO1XHe4Hd+yOdgFy28bExlWUMU3QcLfWEfjHN3
        Lr8fX5WrjXcjXB0/BJT2Nz1y+8+0ON9bvg//rxtaziqGWCDhIIwmHzMNMrDxMBrMf3C50h
        d8bfvUo2iNPA3peO1HNXVLJ9Li4xfT0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-xgQQGLJPOBiTXSdUgKYbRA-1; Tue, 16 Nov 2021 04:54:39 -0500
X-MC-Unique: xgQQGLJPOBiTXSdUgKYbRA-1
Received: by mail-ed1-f69.google.com with SMTP id n11-20020aa7c68b000000b003e7d68e9874so3434682edq.8
        for <linux-media@vger.kernel.org>; Tue, 16 Nov 2021 01:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Wk+MOWgjozoLhZm7pPaaV2e3KZg+3AnVshNINsqu9jc=;
        b=wyZjtHghqJjEOgD33tetFAyE5vrPNtdxgYj3EbUaNM+74+74vzmCCwWenkyBKlMhgi
         C49OzUmXz+uBlS/YWNAsnO2XNZqDvk4mdQ4PRY7ALodne2Vc9/xZIlB3JyQRFaXnfxM7
         TspDsR4tPVQZ0xG+Ys0tAOaRv9TC5vsIUfRRCRe5+oY1Sy1IZp1qSVVLiPSER3neRDhS
         7tesXSsHXDN1pjU4DZuwWPeWt4+1aQ93+sepqO1ZdZTXKkixZg+RMrG1pFU4GbgS9dDW
         GnNW52pNT5AIZUP6EKHRtpYcu8/FdScklJ0BuuvEtf+c4EI0ShYe57CH/QDSEVDPBqb/
         8fdw==
X-Gm-Message-State: AOAM5336BnCwRcGb9d0B4ndtd66hpUJIVOX+CRJVaiNjVcgOIb1asI2O
        eTi5/WnBXBY5ngUOXU2vTqPdsbRPdfQ9J9u7TvxUAzYBuA+WCoRyfo9q/gyWY53up9rnct4FjqA
        rkP30Fqv+3Vwtvu+AtVoSsSk=
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr7766555ejc.236.1637056478488;
        Tue, 16 Nov 2021 01:54:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrgd+6wNu2txMVf0jG+364BXVBAR0lgoGkW0y3m4+69AzYa8hOK7MwZTT3M27HEe9PmIyC5A==
X-Received: by 2002:a17:906:c155:: with SMTP id dp21mr7766533ejc.236.1637056478308;
        Tue, 16 Nov 2021 01:54:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w7sm4125548ede.66.2021.11.16.01.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 01:54:37 -0800 (PST)
Message-ID: <66f4b901-830c-aab7-23c2-21158ce1d158@redhat.com>
Date:   Tue, 16 Nov 2021 10:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Fwd: Surface Go VCM type (was: Need to pass
 acpi_enforce_resources=lax on the Surface Go (version1))
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org
References: <e2312277-f967-7d3f-5ce9-fbb197d35fd6@gmail.com>
 <3b61bb2d-1136-cf35-ba7a-724da9642855@gmail.com>
 <418dc16a-2a03-7604-a8e2-31c5ddfcf436@redhat.com>
 <58dabc46-211c-844d-3ed3-fd2411936d6d@gmail.com>
 <b0a6a762-3445-7c61-3510-6bd493f8e0fa@redhat.com>
 <YYkwaY1C77BRmJat@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YYkwaY1C77BRmJat@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/8/21 15:12, Andy Shevchenko wrote:
> On Mon, Nov 08, 2021 at 02:12:38PM +0100, Hans de Goede wrote:
>> On 11/2/21 00:43, Daniel Scally wrote:
> 
>> Does this sound reasonable / like I'm heading in the right direction?
> 
> It is up to you folks, since I have no time to participate in this with
> a full dive right now. Below just some comments on the patches in case
> they will go.
> 
> ...
> 
>> -	struct acpi_device *adev = ACPI_COMPANION(dev);
>> +	struct acpi_device *adev = to_acpi_device_node(fwnode);
>>  	struct i2c_acpi_lookup lookup;
>>  	struct i2c_adapter *adapter;
>>  	LIST_HEAD(resource_list);
>>  	int ret;
> 
> Make sense to move assignment here.

Ack, will fix.

> 
> 	adev = to_acpi_device_node(fwnode);
> 
>> +	if (!adev)
>> +		return ERR_PTR(-ENODEV);
> 
> ...
> 
>> +static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>> +						     int index,
>> +						     struct i2c_board_info *info)
>> +{
>> +	return i2c_acpi_new_device_by_fwnode(dev->fwnode, index, info);
> 
> dev_fwnode(dev)

Ack, will fix.

> 
>> +}
> 
> ...
> 
>> +int cio2_bridge_sensors_are_ready(void)
>> +{
>> +	struct acpi_device *adev;
> 
>> +	bool ready = true;
> 
> Redundant. See below.
> 
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(cio2_supported_sensors); i++) {
>> +		const struct cio2_sensor_config *cfg =
>> +			&cio2_supported_sensors[i];
>> +
>> +		for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
>> +			if (!adev->status.enabled)
>> +				continue;
> 
>> +			if (!acpi_dev_ready_for_enumeration(adev))
>> +				ready = false;
> 
> You may put the adev here and return false.
> 
>> +		}
>> +	}
> 
>> +	return ready;
> 
> So return true.

I actually did it this way deliberately making use of
for_each_acpi_dev_match() not "leaking" a ref when you let
it run to the end.

I find this clearer because this way all the ref handling
is abstracted away in for_each_acpi_dev_match(), where as with
a put in the middle of the loop a causal reader of the code
is going to wonder there the put ref is coming from.


> 
>> +}
> 
> ...
> 
>> +	if (sensor->ssdb.vcmtype)
>> +		nodes[SWNODE_VCM] = NODE_VCM(
>> +					cio2_vcm_types[sensor->ssdb.vcmtype - 1]);
> 
> Wouldn't be better
> 
> 		nodes[SWNODE_VCM] =
> 			NODE_VCM(cio2_vcm_types[sensor->ssdb.vcmtype - 1]);
> 
> ?
> 
> ...
> 
>> +	sensor->vcm_i2c_client = i2c_acpi_new_device_by_fwnode(
>> +					acpi_fwnode_handle(sensor->adev),
>> +					1, &board_info);
> 
> Ditto.

Ack, will fix both for the next version.

Regards,

Hans


