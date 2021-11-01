Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6277D441A90
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 12:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbhKALT2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 07:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44617 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231942AbhKALT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 07:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635765414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rOUKcRRrDsrcmjtnEtCpbvCv1atIgsKJTiSQgLxnv1U=;
        b=bjTYd7iuCiw6uJEwkTcEtNAssYGCvMuQlw8widO6UhXN2YNdHekeSiFIiuKmKRfJPTAVE7
        WTrklAa4ggndBWG7Jb2SQS7lxb3QsBQ7PQ+6QC4L4q8ADcuGh5E0BmtE9dqVg6IGHs3ctr
        DC8/sCcs5MNKp91JyLFSagGMqBKMiRA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-fNBbWLOSOtaT1Mc9oe7wwg-1; Mon, 01 Nov 2021 07:16:53 -0400
X-MC-Unique: fNBbWLOSOtaT1Mc9oe7wwg-1
Received: by mail-ed1-f69.google.com with SMTP id w7-20020a056402268700b003dd46823a18so15203871edd.18
        for <linux-media@vger.kernel.org>; Mon, 01 Nov 2021 04:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rOUKcRRrDsrcmjtnEtCpbvCv1atIgsKJTiSQgLxnv1U=;
        b=Sv5k7DZzqTA36YqZ5+MUniVYR1xArR2e25NQ1gDGLn398R4kUTGCbZi0wx9q3r4Gzw
         pKMg0R8peYJT3vBHbES2iZRpFNoiL9ilrruksSmNm1QbNOHVIkykg7zf78HBucu9c1AS
         q9ARuPit/erl0MxYNMHSr91mGiR6LUjtoFkAyOwQc1oklbZWccKNyo4COwpwezN2uzDu
         yaoBgtdMUGtSJ5+nbYmR+74yetaZo5HfjeKMy+dT0j6KgVPGk80K7v6vKbODBYF0Y1Iz
         J+zdpzDmUpPf2OUJTSucGcAzxGU7jHAc53m3IWFfVhVO8t9hr+6eHvkwjwLhvfwqKxdk
         iTzw==
X-Gm-Message-State: AOAM53125W6uRYC8+AENhjTFDfM2b88HfBRluYiNqhN6CRhlZanMn+xg
        d4oyQ1hFRm5GYPwpMP+snP7tICz2Gbaf4uh1lAF/gF3tNbAOQvNnx3F1U/YSq4hCqYDLegcThaV
        8sRjbEDBlrmW7pQZoEIZSgBw=
X-Received: by 2002:a17:906:d552:: with SMTP id cr18mr36501676ejc.88.1635765410924;
        Mon, 01 Nov 2021 04:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXvHPO9hFej8+l/jLsvYNn8iz4pyw/P1DSruNzzbwQNJeYQGDkzU7ZB6NRR+LR5xEFwptqBw==
X-Received: by 2002:a17:906:d552:: with SMTP id cr18mr36501642ejc.88.1635765410659;
        Mon, 01 Nov 2021 04:16:50 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id e22sm9100043edu.35.2021.11.01.04.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 04:16:50 -0700 (PDT)
Message-ID: <ae87a064-fc71-b00c-e3d8-ba499739128a@redhat.com>
Date:   Mon, 1 Nov 2021 12:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/11] ACPI: delay enumeration of devices with a _DEP
 pointing to an INT3472 device
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-2-hdegoede@redhat.com>
 <CAJZ5v0gBt9gXtBFi2bLh4W+S2v0rZURkbSDP4bxk7FCMTrDnwQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0gBt9gXtBFi2bLh4W+S2v0rZURkbSDP4bxk7FCMTrDnwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/27/21 20:52, Rafael J. Wysocki wrote:
> On Mon, Oct 25, 2021 at 11:41 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The clk and regulator frameworks expect clk/regulator consumer-devices
>> to have info about the consumed clks/regulators described in the device's
>> fw_node.
>>
>> To work around cases where this info is not present in the firmware tables,
>> which is often the case on x86/ACPI devices, both frameworks allow the
>> provider-driver to attach info about consumers to the clks/regulators
>> when registering these.
>>
>> This causes problems with the probe ordering wrt drivers for consumers
>> of these clks/regulators. Since the lookups are only registered when the
>> provider-driver binds, trying to get these clks/regulators before then
>> results in a -ENOENT error for clks and a dummy regulator for regulators.
>>
>> One case where we hit this issue is camera sensors such as e.g. the OV8865
>> sensor found on the Microsoft Surface Go. The sensor uses clks, regulators
>> and GPIOs provided by a TPS68470 PMIC which is described in an INT3472
>> ACPI device. There is special platform code handling this and setting
>> platform_data with the necessary consumer info on the MFD cells
>> instantiated for the PMIC under: drivers/platform/x86/intel/int3472.
>>
>> For this to work properly the ov8865 driver must not bind to the I2C-client
>> for the OV8865 sensor until after the TPS68470 PMIC gpio, regulator and
>> clk MFD cells have all been fully setup.
>>
>> The OV8865 on the Microsoft Surface Go is just one example, all X86
>> devices using the Intel IPU3 camera block found on recent Intel SoCs
>> have similar issues where there is an INT3472 HID ACPI-device, which
>> describes the clks and regulators, and the driver for this INT3472 device
>> must be fully initialized before the sensor driver (any sensor driver)
>> binds for things to work properly.
>>
>> On these devices the ACPI nodes describing the sensors all have a _DEP
>> dependency on the matching INT3472 ACPI device (there is one per sensor).
>>
>> This allows solving the probe-ordering problem by delaying the enumeration
>> (instantiation of the I2C-client in the ov8865 example) of ACPI-devices
>> which have a _DEP dependency on an INT3472 device.
>>
>> The new acpi_dev_ready_for_enumeration() helper used for this is also
>> exported because for devices, which have the enumeration_by_parent flag
>> set, the parent-driver will do its own scan of child ACPI devices and
>> it will try to enumerate those during its probe(). Code doing this such
>> as e.g. the i2c-core-acpi.c code must call this new helper to ensure
>> that it too delays the enumeration until all the _DEP dependencies are
>> met on devices which have the new honor_deps flag set.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Thanks, note the idea (my idea at least) is for you to pick up
patches 1 + 2 as 5.17 material (patch 2 already has an ack from wsa
for this).

Regards,

Hans


>> ---
>> Changes in v4:
>> - Move the acpi_dev_ready_for_enumeration() check to acpi_bus_attach()
>>   (replacing the acpi_device_is_present() check there)
>> ---
>>  drivers/acpi/scan.c     | 37 +++++++++++++++++++++++++++++++++----
>>  include/acpi/acpi_bus.h |  5 ++++-
>>  2 files changed, 37 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>> index 5b54c80b9d32..8a4cf12f8453 100644
>> --- a/drivers/acpi/scan.c
>> +++ b/drivers/acpi/scan.c
>> @@ -796,6 +796,12 @@ static const char * const acpi_ignore_dep_ids[] = {
>>         NULL
>>  };
>>
>> +/* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
>> +static const char * const acpi_honor_dep_ids[] = {
>> +       "INT3472", /* Camera sensor PMIC / clk and regulator info */
>> +       NULL
>> +};
>> +
>>  static struct acpi_device *acpi_bus_get_parent(acpi_handle handle)
>>  {
>>         struct acpi_device *device = NULL;
>> @@ -1757,8 +1763,12 @@ static void acpi_scan_dep_init(struct acpi_device *adev)
>>         struct acpi_dep_data *dep;
>>
>>         list_for_each_entry(dep, &acpi_dep_list, node) {
>> -               if (dep->consumer == adev->handle)
>> +               if (dep->consumer == adev->handle) {
>> +                       if (dep->honor_dep)
>> +                               adev->flags.honor_deps = 1;
>> +
>>                         adev->dep_unmet++;
>> +               }
>>         }
>>  }
>>
>> @@ -1962,7 +1972,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>>         for (count = 0, i = 0; i < dep_devices.count; i++) {
>>                 struct acpi_device_info *info;
>>                 struct acpi_dep_data *dep;
>> -               bool skip;
>> +               bool skip, honor_dep;
>>
>>                 status = acpi_get_object_info(dep_devices.handles[i], &info);
>>                 if (ACPI_FAILURE(status)) {
>> @@ -1971,6 +1981,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>>                 }
>>
>>                 skip = acpi_info_matches_ids(info, acpi_ignore_dep_ids);
>> +               honor_dep = acpi_info_matches_ids(info, acpi_honor_dep_ids);
>>                 kfree(info);
>>
>>                 if (skip)
>> @@ -1984,6 +1995,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>>
>>                 dep->supplier = dep_devices.handles[i];
>>                 dep->consumer = handle;
>> +               dep->honor_dep = honor_dep;
>>
>>                 mutex_lock(&acpi_dep_list_lock);
>>                 list_add_tail(&dep->node , &acpi_dep_list);
>> @@ -2150,8 +2162,8 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
>>                 register_dock_dependent_device(device, ejd);
>>
>>         acpi_bus_get_status(device);
>> -       /* Skip devices that are not present. */
>> -       if (!acpi_device_is_present(device)) {
>> +       /* Skip devices that are not ready for enumeration (e.g. not present) */
>> +       if (!acpi_dev_ready_for_enumeration(device)) {
>>                 device->flags.initialized = false;
>>                 acpi_device_clear_enumerated(device);
>>                 device->flags.power_manageable = 0;
>> @@ -2313,6 +2325,23 @@ void acpi_dev_clear_dependencies(struct acpi_device *supplier)
>>  }
>>  EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
>>
>> +/**
>> + * acpi_dev_ready_for_enumeration - Check if the ACPI device is ready for enumeration
>> + * @device: Pointer to the &struct acpi_device to check
>> + *
>> + * Check if the device is present and has no unmet dependencies.
>> + *
>> + * Return true if the device is ready for enumeratino. Otherwise, return false.
>> + */
>> +bool acpi_dev_ready_for_enumeration(const struct acpi_device *device)
>> +{
>> +       if (device->flags.honor_deps && device->dep_unmet)
>> +               return false;
>> +
>> +       return acpi_device_is_present(device);
>> +}
>> +EXPORT_SYMBOL_GPL(acpi_dev_ready_for_enumeration);
>> +
>>  /**
>>   * acpi_dev_get_first_consumer_dev - Return ACPI device dependent on @supplier
>>   * @supplier: Pointer to the dependee device
>> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
>> index 13d93371790e..2da53b7b4965 100644
>> --- a/include/acpi/acpi_bus.h
>> +++ b/include/acpi/acpi_bus.h
>> @@ -202,7 +202,8 @@ struct acpi_device_flags {
>>         u32 coherent_dma:1;
>>         u32 cca_seen:1;
>>         u32 enumeration_by_parent:1;
>> -       u32 reserved:19;
>> +       u32 honor_deps:1;
>> +       u32 reserved:18;
>>  };
>>
>>  /* File System */
>> @@ -284,6 +285,7 @@ struct acpi_dep_data {
>>         struct list_head node;
>>         acpi_handle supplier;
>>         acpi_handle consumer;
>> +       bool honor_dep;
>>  };
>>
>>  /* Performance Management */
>> @@ -693,6 +695,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>>
>>  void acpi_dev_clear_dependencies(struct acpi_device *supplier);
>> +bool acpi_dev_ready_for_enumeration(const struct acpi_device *device);
>>  struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier);
>>  struct acpi_device *
>>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>> --
>> 2.31.1
>>
> 

