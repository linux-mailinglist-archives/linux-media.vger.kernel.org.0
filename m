Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D74227133AC
	for <lists+linux-media@lfdr.de>; Sat, 27 May 2023 11:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbjE0J2E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 May 2023 05:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjE0J2D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 May 2023 05:28:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E44D3
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 02:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685179638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cds2zgNPVibCpSpcP82QV6iT0Y4ztpGd1kVAxqS+ta8=;
        b=MGMujP4cVZ2QFHTCfQ0GRJM/8KIiz+9ASnkWf1802KNeN2oUZq1TvvcI9JP8VX4sEOddnk
        Dlf9JcGg6CILB7RqfDU4D+CwRnRLWk77KDD95hle+Pil4AufSDgmc8UsYb78lu2R4N0tzF
        Vo7adGclRoLiwWlKmkjGApCV3dti8+k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-pAcEkV5-NUuu3JWfE8qhzQ-1; Sat, 27 May 2023 05:25:31 -0400
X-MC-Unique: pAcEkV5-NUuu3JWfE8qhzQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94f7a2b21fdso190149066b.2
        for <linux-media@vger.kernel.org>; Sat, 27 May 2023 02:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685179531; x=1687771531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cds2zgNPVibCpSpcP82QV6iT0Y4ztpGd1kVAxqS+ta8=;
        b=g4jxwNrzxRH8BekR5ZIvnV0v/orulrAH7gwLc3gyzLbfKMyUINRelrOuTZyy9y9zJ2
         +Qvj4M8+mVYqusgcxcdlblUZPlXxKU+9Fky3DxyG4SjKmsplgq/5dLzUwXp9vd6Zcym0
         i7BKGVBN9dKyNWOlW3O8ch8FkwJ9tlhdl6oF1mFtfh8wJn3Kec/b8+caUY0f4NIhQamC
         vivlQJrNYFvMTv9Q8vf3dXWwfYmYA6i7zge06FlDrS7pOWpoCNEW7H+2p9sGsNTRu06W
         HguBQYI/GhXKbm3bpLUcpZmwNbfef+JV6vRW0jRg0Ot/RU2kNukPP40xrBWMhoUDepS0
         8odQ==
X-Gm-Message-State: AC+VfDwWe5ZEhKwYr9A51xjvGy960tq9IFbN8+CjJp70/DKGZ1m1aZny
        WIGXu4alW4Hd0fAHuGMWI5qlLGHUbkRSKri3DCs/JL5IZtqeRRRBNvjbmh1jyT40KOMPovjr+2n
        uKBJGUZf9H/VCjfJv7ll6l7g=
X-Received: by 2002:a17:907:7292:b0:96f:a39c:86d4 with SMTP id dt18-20020a170907729200b0096fa39c86d4mr4787503ejc.7.1685179530827;
        Sat, 27 May 2023 02:25:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BWlQf9ydifHDkDptToS0HudBXRgmLYY+lnIvNlMbRXj2I89ywEFvLdY3NLrrWYR81ugbYdg==
X-Received: by 2002:a17:907:7292:b0:96f:a39c:86d4 with SMTP id dt18-20020a170907729200b0096fa39c86d4mr4787487ejc.7.1685179530552;
        Sat, 27 May 2023 02:25:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bl17-20020a170906c25100b0094e4eabb402sm3185629ejb.128.2023.05.27.02.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 02:25:29 -0700 (PDT)
Message-ID: <c53ec167-9211-9d27-db06-f4b2db5f258d@redhat.com>
Date:   Sat, 27 May 2023 11:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] media: atomisp: Add support for v4l2-async sensor
 registration
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
References: <20230525190100.130010-1-hdegoede@redhat.com>
 <20230525190100.130010-2-hdegoede@redhat.com>
 <CAHp75Vd1ijQM7b8Z2ip3TXJyuhQJfAqk0MNBVW-Q-ooi_-dBHw@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd1ijQM7b8Z2ip3TXJyuhQJfAqk0MNBVW-Q-ooi_-dBHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/26/23 22:30, Andy Shevchenko wrote:
> On Thu, May 25, 2023 at 10:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add support for using v4l2-async sensor registration.
>>
>> This has been tested with both the gc0310 and the ov2680 sensor drivers.
>>
>> Drivers must add the ACPI HIDs they match on to the supported_sensors[]
>> array in the same commit as that they are converted to
>> v4l2_async_register_subdev_sensor().
>>
>> Sensor drivers also must check they have a fwnode graph endpoint and return
>> -EPROBE_DEFER from probe() if there is no endpoint yet. This guarantees
>> that the GPIO mappingss are in place before the driver tries to get GPIOs.
> 
> mappings
> 
>> For now it also is still possible to use the old atomisp_gmin_platform
>> based sensor drivers. This is mainly intended for testing while moving
>> other sensor drivers over to runtime-pm + v4l2-async.
> 
> ...
> 
>> +struct acpi_device;
>>  struct atomisp_device;
>> -struct v4l2_device;
>>  struct atomisp_sub_device;
>> +struct v4l2_device;
> 
> I would group atomisp* separately
> 
> struct acpi_device;
> struct v4l2_device;
> 
> struct atomisp_device;
> struct atomisp_sub_device;
> 
> ...
> 
>> +struct atomisp_csi2_bridge {
>> +       char csi2_node_name[14];
>> +       struct software_node csi2_node;
> 
> Wondering if swapping these two saves some code (due to potential use
> of container_of() for the node member).
> 
>> +       u32 data_lanes[CSI2_MAX_LANES];
>> +       unsigned int n_sensors;
>> +       struct atomisp_csi2_sensor sensors[ATOMISP_CAMERA_NR_PORTS];
>> +};
> 
> ...
> 
>> +static char *gmin_cfg_get_dsm(struct acpi_device *adev, const char *key)
>> +{
>> +       union acpi_object *obj, *key_el, *val_el;
>> +       char *val = NULL;
>> +       int i;
>> +
>> +       obj = acpi_evaluate_dsm_typed(adev->handle, &atomisp_dsm_guid, 0, 0,
>> +                                     NULL, ACPI_TYPE_PACKAGE);
>> +       if (!obj)
>> +               return NULL;
>> +
>> +       for (i = 0; i < obj->package.count - 1; i += 2) {
>> +               key_el = &obj->package.elements[i + 0];
>> +               val_el = &obj->package.elements[i + 1];
>> +
>> +               if (key_el->type != ACPI_TYPE_STRING || val_el->type != ACPI_TYPE_STRING)
>> +                       break;
>> +
>> +               if (!strcmp(key_el->string.pointer, key)) {
>> +                       val = kstrdup(val_el->string.pointer, GFP_KERNEL);
> 
>> +                       dev_info(&adev->dev, "Using DSM entry %s=%s\n", key, val);
> 
> Do we really want to have "(null)" to be printed in case of the
> kstrdup() failure?
> Also this code may become a honeypot for all possible static analyzers
> and even if we don't care about NULL it may become noisy activity.

Ok, I'll change this to:

			val = kstrdup(val_el->string.pointer, GFP_KERNEL);
			if (!val)
				break;

> Besides that since we have a handle, wouldn't it be better to use
> acpi_handle_info() here?

Yes since we are purely dealing with ACPI / fwnode stuff here using
that would make more sense. I'll switch to that.

I also agree with all your other remarks and I'll fix them all up
(and test things again) before merging.

Andy, may I add your Reviewed-by to this patch too after fixing
up all your remarks ?

Regards,

Hans



