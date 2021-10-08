Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6D44270F2
	for <lists+linux-media@lfdr.de>; Fri,  8 Oct 2021 20:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239721AbhJHSuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Oct 2021 14:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21855 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231331AbhJHSuT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Oct 2021 14:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633718903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ijctcI5vpJQPwzhUQFvS7p/QdhBr3LnKeHeoMXTfhIA=;
        b=TAELWoPzf9EaqN8Amfvyr0x+egpg/RFJ0i+bh0Ejvxf0o9rKsjrDPh0Fna/2MrywppbVY4
        S8VWyjnpsr3SVEFWvgj1bK4cHYuSzAihMT/tKmAUo1dOczg8i3kCISXVQ4llrVWChBgb/Q
        6vEr1k7SXoMG6i80afU5uEC9PCmX0Jk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-lCRZeneZNb-Qk8qzkbtPQw-1; Fri, 08 Oct 2021 14:48:21 -0400
X-MC-Unique: lCRZeneZNb-Qk8qzkbtPQw-1
Received: by mail-ed1-f71.google.com with SMTP id p20-20020a50cd94000000b003db23619472so10053252edi.19
        for <linux-media@vger.kernel.org>; Fri, 08 Oct 2021 11:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ijctcI5vpJQPwzhUQFvS7p/QdhBr3LnKeHeoMXTfhIA=;
        b=BTkOd1Yf/MtgphgKsacRNI74f0wjpIzzrq+Kr8eQ87K7qbHe2o1ZLD8QkqRDkcTiE6
         y/CwmNQJ6DxUFH9/EhL9LFsDGMbsPJJI68Zgih9nzbnxSGVmDcbly9J0RP9n9fbtUX6t
         bmzUcaQHriNW9ddg6c69KfoGjtFBWRRb/tlWtKl498J60fKUmhkxUqgxWDKxGo33Jung
         NYgULbRpXOtl7k/ML1vVw6eu4L8s/MX6YMe9ekMG2mCebGzf2oklgnRSe+B4qQhw42Pz
         PXEX66ze06StsfpLF1AmsuSXe3gfJ4B50mYC4D4OU3dS8omjcp7q+325exQ2zILj7IVh
         XWEQ==
X-Gm-Message-State: AOAM532P7ExbgR+Ir/RW3tMawIm5DXBUQzblKxsqPy/jtFWyAYQPgvXF
        pFp3eeH01T3vMw9W8w8y7L+LlE1bJ1HAHQyZD5jmB0sRwX0TDaF+sqpUwpDZmp0ALj8hSb31slu
        LabUfVPwaRriqJpJhMNkdEcM=
X-Received: by 2002:a05:6402:438d:: with SMTP id o13mr15370838edc.0.1633718900402;
        Fri, 08 Oct 2021 11:48:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHzDXE8tPMIhMnTL4y4x8K2+N76hMdnEL6YM+V7CqRVCwyAHrxOp6acFuqex6+YqNgnnr0zg==
X-Received: by 2002:a05:6402:438d:: with SMTP id o13mr15370805edc.0.1633718900231;
        Fri, 08 Oct 2021 11:48:20 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id o12sm56200edw.84.2021.10.08.11.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 11:48:19 -0700 (PDT)
Subject: Re: [PATCH 02/12] media: i2c: ov8865: Add an has_unmet_acpi_deps()
 check
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211008162121.6628-1-hdegoede@redhat.com>
 <20211008162121.6628-3-hdegoede@redhat.com>
 <YWCQ6/AMzP5Nfcyk@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <39a85265-017e-f86d-619b-c1aa6a771a26@redhat.com>
Date:   Fri, 8 Oct 2021 20:48:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWCQ6/AMzP5Nfcyk@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 10/8/21 8:41 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Fri, Oct 08, 2021 at 06:21:11PM +0200, Hans de Goede wrote:
>> The clk and regulator frameworks expect clk/regulator consumer-devices
>> to have info about the consumed clks/regulators described in the device's
>> fw_node.
>>
>> To work around cases where this info is not present in the firmware tables,
>> which is often the case on x86/ACPI devices, both frameworks allow the
>> provider-driver to attach info about consumers to the clks/regulators
>> when registering these.
>>
>> This causes problems with the probe ordering of the ov8865 driver vs the
>> drivers for these clks/regulators. Since the lookups are only registered
>> when the provider-driver binds, trying to get these clks/regulators before
>> then results in a -ENOENT error for clks and a dummy regulator for regs.
>>
>> On ACPI/x86 where this is a problem, the ov8865 ACPI fw-nodes have a _DEP
>> dependency on the INT3472 ACPI fw-node which describes the hardware which
>> provides the clks/regulators.
>>
>> The drivers/platform/x86/intel/int3472/ code dealing with these ACPI
>> fw-nodes will call acpi_dev_clear_dependencies() to indicate that this
>> _DEP has been "met" when all the clks/regulators have been setup.
>>
>> Call the has_unmet_acpi_deps() helper to check for unmet _DEPs
>> and return -EPROBE_DEFER if this returns true, so that we wait for
>> the clk/regulator setup to be done before continuing with probing.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov8865.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
>> index ce4e0ae2c4d3..fd18d1256f78 100644
>> --- a/drivers/media/i2c/ov8865.c
>> +++ b/drivers/media/i2c/ov8865.c
>> @@ -2978,6 +2978,9 @@ static int ov8865_probe(struct i2c_client *client)
>>  	unsigned int i;
>>  	int ret;
>>  
>> +	if (has_unmet_acpi_deps(dev))
>> +		return -EPROBE_DEFER;
>> +
> 
> We've worked hard to avoid adding ACPI-specific code such as this in
> sensor drivers, as it would then spread like crazy, and also open the
> door to more ACPI-specific support. I don't want to open this pandora's
> box, I'd like to see this handled in another layer (the I2C core could
> be a condidate for instance, but bonus points if it can be handled in
> the ACPI subsystem itself).

The problem is that we do NOT want this check for all i2c devices, so doing
it in any place other then the drivers means having some list of APCI-ids
to which to apply this someplace else. And then for every sensor driver
which needs this we need to update this list.

This is wht I've chosen to just put this check directly in the sensor
drivers. It is only 2 lines, it is a no-op on kernels where ACPI
is not enabled (without need a #ifdef) and it is a no-op if the
sensor i2c-client is not instantiated through APCI even when ACPI
support is enabled in the kernel.

I understand that you don't want a lot of ACPI specific code inside
the drivers, which is why I've come up with this fix which consists
of only 2 lines.  My previous attempts (which I never posted)
where much worse then this.

Regards,

Hans



> 
>>  	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
>>  	if (!sensor)
>>  		return -ENOMEM;
> 

