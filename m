Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E434904CC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 10:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235566AbiAQJ1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 04:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44698 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232585AbiAQJ07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 04:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642411618;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LsP+XE2xyloky6WnhJ0re7r0f4ToOSqs01HM1rRHc50=;
        b=M06jJQ2IJ87o7XS6cAwn9GCI94z0FXQ6Du1mOYVUe+0Rz08ldRdfghDcbnAvISjIhpYXRn
        KOa47kJev9OU7V26xZAKfQ0gmOqB5MVjxUg/wdfmZvCaRBy1mUBgky3EQAKQjmfWAcjJIM
        mWqsDHlQIKtOkSEH/INF2Xy3l7uykiQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-CLsbKNHuN2mPGKEAFrItrw-1; Mon, 17 Jan 2022 04:26:57 -0500
X-MC-Unique: CLsbKNHuN2mPGKEAFrItrw-1
Received: by mail-ed1-f72.google.com with SMTP id o10-20020a056402438a00b00403212b6b1aso578084edc.13
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 01:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LsP+XE2xyloky6WnhJ0re7r0f4ToOSqs01HM1rRHc50=;
        b=HF0SZe7MkOwMvXIObpIjWm68K8gmPvzZTryFYRdUfIugufhwFkwmymnQIsshz31L4z
         47Rbs+daAj5JFQnxd6Uy3jBzJr3XbOHNS4E8p2hEpp5yFo5/r3MbO+ewPNYYDBQtrIIu
         +Q9EA+pWMpxqeV3VSYov9eNQJbsrw9jTgA7heFcoav69pNNjI+3nHUAbCwkmUSgWoDxT
         ooDuSkuyD9ihJl8Hviq0oHwsDzuJB8cxx9bFm0/zNkXiGo0mxF6pJZM6KzwLw5P2uL9v
         P4+BnWqtxi6mWIqtsowJ5969t5A8fZFIY0NqRnTC5U/Vd7kq1fs61Ems5qKgS8ZDkQwI
         HeEw==
X-Gm-Message-State: AOAM530z0sHjWVmIN6sWogf4ZRg+FhwjmGQS4WtiJG8+WRvN3iYWtFK5
        X8PQ1itI/TLcOPWzfsp0S00QtxlCyaJviM9t0M+mJYYeKD+1vz5NKMixUWa+6Nu79n046X+U8pv
        nP23XvtesbQyCcxn1Leu8YVw=
X-Received: by 2002:a17:907:60d5:: with SMTP id hv21mr17034571ejc.593.1642411615743;
        Mon, 17 Jan 2022 01:26:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCffotNWZhZu+maqT7sy8dP+LJXvZ+FzKhCljkHc1dR279k8dMaywURXC9HfxV5dlREfkdnA==
X-Received: by 2002:a17:907:60d5:: with SMTP id hv21mr17034557ejc.593.1642411615511;
        Mon, 17 Jan 2022 01:26:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id p7sm5611139edu.84.2022.01.17.01.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 01:26:54 -0800 (PST)
Message-ID: <179e8c32-a5f5-48a5-8410-e4f0a8f73bd2@redhat.com>
Date:   Mon, 17 Jan 2022 10:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Firmware (devicetree/ACPI interface) for marking camera sensors
 being on the front/back of a device
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     libcamera devel <libcamera-devel@lists.libcamera.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
 <YeSaFXO1Z+F088LR@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YeSaFXO1Z+F088LR@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 1/16/22 23:20, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Sun, Jan 16, 2022 at 10:43:25PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> IIRC there was some discussion about $subject a while ago,
>> esp. being pushed by the ChromeOS folks (IIRC). If you know what
>> I'm talking about, please add relevant folks to the Cc.
>>
>> While doing some work on atomisp support I noticed that the
>> ACPI device fwnode-s describing the sensors have an ACPI _PLD
>> method, which is a standardized ACPI method to retreive an
>> package (ACPI for struct) describing the location of things
>> like USB ports; and in this case of the camera sensors.
>>
>> And upon checking the Surface Go DSDT the sensors there seem to
>> have the _PLD bits to. And in both cases at least the following
>> PLD field (bits 67-69) seems to contain valid and relevant info,
>> quoting from the ACPI spec 6.2 version, page 329:
>>
>> """
>> Panel: Describes which panel surface of the system’s housing
>> the device connection point resides on:
>> 0 – Top
>> 1 – Bottom
>> 2 – Left
>> 3 – Right
>> 4 – Front
>> 5 – Back
>> 6 – Unknown
>> """
>>
>> This seems to be consistently set to 4 or 5 for the _PLD method
>> of the sensor ACPI nodes which I checked.
>>
>> So rather then defining a new devicetree property for this and
>> embedding that inside the ACPI tables, IMHO it would be best if
>> the ChromeOS devices would use the standardized _PLD ACPI method
>> for this too.
> 
> I have no specific objection to this, given that the _PLD is
> standardized. In your experience, is the rotation also populated
> correctly ? That's important information too.

That is a good question, so I just checked what the IPU3 does and
it uses a field in the SSDB ACPI package for this.

And I'm not sure that the _PLD is the right place for this, the _PLD
is about how the ACPI object appears to the user, so that
the operating-system can describe e.g. external connectors in
a dialog box using this info. E.g. the _PLD also contains information
about the color of the connector.

And an upside-down sensor, does not look upside-down to the user when
looking at it from the outside of the device. So based on this reading
of the spec I don't expect the rotation field to contain what we are
looking for (as is shown by the IPU3 driver using a SSDB field for this).

> It we go in that direction, we should try to push OEMs to also populate
> the vertical offset and horizontal offset fields, as I expect it to
> become useful when multiple cameras are present in the same location.

That is a good point.

Note that my main reason for advertising using _PLD for the front/back
info is that that is what is already being used in Windows laptops
ACPI tables, so we need support for it regardless.

Actually your rotation question made me wonder what we are doing
for IPU3 here and we already have code parsing the _PLD in
drivers/media/pci/intel/ipu3/cio2-bridge.c to set
V4L2_FWNODE_ORIENTATION_FRONT / V4L2_FWNODE_ORIENTATION_BACK :)

Since at least atomisp2 is going to need this to we probably need to
factor this out into some shared helper.

Regards,

Hans

