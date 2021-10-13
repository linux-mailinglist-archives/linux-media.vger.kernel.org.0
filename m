Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0071A42C79B
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 19:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhJMRbm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 13:31:42 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:37633 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhJMRbl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 13:31:41 -0400
Received: by mail-ot1-f45.google.com with SMTP id b4-20020a9d7544000000b00552ab826e3aso2906751otl.4;
        Wed, 13 Oct 2021 10:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eJ0m8SYcSvneYrvdEJ83T97TerHAdKpgpvv24AabUdg=;
        b=wnUHeq5oGWklPEIJqEuOMbCdLuYUTd/SNdtAywXEJtAA/exaIGfDQpXF/YEP/+ocTB
         WP9NIO2EWTa3h1qec4ys7bQaSn7rMTwyo4HaGS2JtdfsgjKbSWhl3I9NUW/AOqXj9fH6
         110Y0Uh3UAprurkb6MHPLzn00AgcxL7tAssAgk+InMJPYcVvozhKctLL88Cofn2YAWvE
         FQlS8j9uwjBEUcm1kRf6QFxo2jqKm9dnt7q5AAZnQkJPtt3ZeLJiLC/1FM01G2AVjBe2
         vQXsZyexkfO33RLB/DLenRd53ORdcs/RwhwZyEwtzO7bGJWC4Hj7x0/vAojZWz+s6EmA
         lrkQ==
X-Gm-Message-State: AOAM5333k4fKlNuo1xByziuA1j7rvcE4R/eb+chHKoRTmeF1UKHeQpLj
        oM7ZLsFdL90uWrRsNsXcLTFFQT6taQC6KP5rGKY=
X-Google-Smtp-Source: ABdhPJxhxiap4dH1a27n1Fc5796zv+6BZgI7c+b8xvs8tHay4d+9szem1uNN7b8FlbTcVqdsBOFrLoHgtvGI/A6kYh0=
X-Received: by 2002:a05:6830:1af0:: with SMTP id c16mr438711otd.16.1634146177876;
 Wed, 13 Oct 2021 10:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211010185707.195883-1-hdegoede@redhat.com> <20211010185707.195883-2-hdegoede@redhat.com>
In-Reply-To: <20211010185707.195883-2-hdegoede@redhat.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 13 Oct 2021 19:29:26 +0200
Message-ID: <CAJZ5v0i0NR8faABuZVe7V6sKgM4+1kOh-S56usj2WyeiDnfy9g@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] ACPI: delay enumeration of devices with a _DEP
 pointing to an INT3472 device
To:     Hans de Goede <hdegoede@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 10, 2021 at 8:57 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The clk and regulator frameworks expect clk/regulator consumer-devices
> to have info about the consumed clks/regulators described in the device's
> fw_node.
>
> To work around cases where this info is not present in the firmware tables,
> which is often the case on x86/ACPI devices, both frameworks allow the
> provider-driver to attach info about consumers to the clks/regulators
> when registering these.
>
> This causes problems with the probe ordering wrt drivers for consumers
> of these clks/regulators. Since the lookups are only registered when the
> provider-driver binds, trying to get these clks/regulators before then
> results in a -ENOENT error for clks and a dummy regulator for regulators.
>
> One case where we hit this issue is camera sensors such as e.g. the OV8865
> sensor found on the Microsoft Surface Go. The sensor uses clks, regulators
> and GPIOs provided by a TPS68470 PMIC which is described in an INT3472
> ACPI device. There is special platform code handling this and setting
> platform_data with the necessary consumer info on the MFD cells
> instantiated for the PMIC under: drivers/platform/x86/intel/int3472.
>
> For this to work properly the ov8865 driver must not bind to the I2C-client
> for the OV8865 sensor until after the TPS68470 PMIC gpio, regulator and
> clk MFD cells have all been fully setup.
>
> The OV8865 on the Microsoft Surface Go is just one example, all X86
> devices using the Intel IPU3 camera block found on recent Intel SoCs
> have similar issues where there is an INT3472 HID ACPI-device, which
> describes the clks and regulators, and the driver for this INT3472 device
> must be fully initialized before the sensor driver (any sensor driver)
> binds for things to work properly.
>
> On these devices the ACPI nodes describing the sensors all have a _DEP
> dependency on the matching INT3472 ACPI device (there is one per sensor).
>
> This allows solving the probe-ordering problem by delaying the enumeration
> (instantiation of the I2C-client in the ov8865 example) of ACPI-devices
> which have a _DEP dependency on an INT3472 device.
>
> The new acpi_dev_ready_for_enumeration() helper used for this is also
> exported because for devices, which have the enumeration_by_parent flag
> set, the parent-driver will do its own scan of child ACPI devices and
> it will try to enumerate those during its probe(). Code doing this such
> as e.g. the i2c-core-acpi.c code must call this new helper to ensure
> that it too delays the enumeration until all the _DEP dependencies are
> met on devices which have the new honor_deps flag set.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/scan.c     | 36 ++++++++++++++++++++++++++++++++++--
>  include/acpi/acpi_bus.h |  5 ++++-
>  2 files changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 5b54c80b9d32..efee6ee91c8f 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -796,6 +796,12 @@ static const char * const acpi_ignore_dep_ids[] = {
>         NULL
>  };
>
> +/* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
> +static const char * const acpi_honor_dep_ids[] = {
> +       "INT3472", /* Camera sensor PMIC / clk and regulator info */
> +       NULL
> +};
> +
>  static struct acpi_device *acpi_bus_get_parent(acpi_handle handle)
>  {
>         struct acpi_device *device = NULL;
> @@ -1757,8 +1763,12 @@ static void acpi_scan_dep_init(struct acpi_device *adev)
>         struct acpi_dep_data *dep;
>
>         list_for_each_entry(dep, &acpi_dep_list, node) {
> -               if (dep->consumer == adev->handle)
> +               if (dep->consumer == adev->handle) {
> +                       if (dep->honor_dep)
> +                               adev->flags.honor_deps = 1;

Any concerns about doing

adev->flags.honor_deps = dep->honor_dep;

here?

> +
>                         adev->dep_unmet++;
> +               }
>         }
>  }
>
> @@ -1962,7 +1972,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>         for (count = 0, i = 0; i < dep_devices.count; i++) {
>                 struct acpi_device_info *info;
>                 struct acpi_dep_data *dep;
> -               bool skip;
> +               bool skip, honor_dep;
>
>                 status = acpi_get_object_info(dep_devices.handles[i], &info);
>                 if (ACPI_FAILURE(status)) {
> @@ -1971,6 +1981,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>                 }
>
>                 skip = acpi_info_matches_ids(info, acpi_ignore_dep_ids);
> +              honor_dep = acpi_info_matches_ids(info, acpi_honor_dep_ids);
>                 kfree(info);
>
>                 if (skip)
> @@ -1984,6 +1995,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>
>                 dep->supplier = dep_devices.handles[i];
>                 dep->consumer = handle;
> +               dep->honor_dep = honor_dep;
>
>                 mutex_lock(&acpi_dep_list_lock);
>                 list_add_tail(&dep->node , &acpi_dep_list);
> @@ -2071,6 +2083,9 @@ static acpi_status acpi_bus_check_add_2(acpi_handle handle, u32 lvl_not_used,
>
>  static void acpi_default_enumeration(struct acpi_device *device)
>  {
> +       if (!acpi_dev_ready_for_enumeration(device))
> +               return;

I'm not sure about this.

First of all, this adds an acpi_device_is_present() check here which
potentially is a change in behavior and I'm not sure how it is related
to the other changes in this patch (it is not mentioned in the
changelog AFAICS).

I'm saying "potentially", because if we get here at all,
acpi_device_is_present() has been evaluated already by
acpi_bus_attach().

Now, IIUC, the new acpi_dev_ready_for_enumeration() is kind of an
extension of acpi_device_is_present(), so shouldn't it be called by
acpi_bus_attach() instead of the latter rather than from here?

> +
>         /*
>          * Do not enumerate devices with enumeration_by_parent flag set as
>          * they will be enumerated by their respective parents.
> @@ -2313,6 +2328,23 @@ void acpi_dev_clear_dependencies(struct acpi_device *supplier)
>  }
>  EXPORT_SYMBOL_GPL(acpi_dev_clear_dependencies);
>
> +/**
> + * acpi_dev_ready_for_enumeration - Check if the ACPI device is ready for enumeration
> + * @device: Pointer to the &struct acpi_device to check
> + *
> + * Check if the device is present and has no unmet dependencies.
> + *
> + * Return true if the device is ready for enumeratino. Otherwise, return false.
> + */
> +bool acpi_dev_ready_for_enumeration(const struct acpi_device *device)
> +{
> +       if (device->flags.honor_deps && device->dep_unmet)
> +               return false;
> +
> +       return acpi_device_is_present(device);
> +}
> +EXPORT_SYMBOL_GPL(acpi_dev_ready_for_enumeration);
> +
>  /**
>   * acpi_dev_get_first_consumer_dev - Return ACPI device dependent on @supplier
>   * @supplier: Pointer to the dependee device
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index 13d93371790e..2da53b7b4965 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -202,7 +202,8 @@ struct acpi_device_flags {
>         u32 coherent_dma:1;
>         u32 cca_seen:1;
>         u32 enumeration_by_parent:1;
> -       u32 reserved:19;
> +       u32 honor_deps:1;
> +       u32 reserved:18;
>  };
>
>  /* File System */
> @@ -284,6 +285,7 @@ struct acpi_dep_data {
>         struct list_head node;
>         acpi_handle supplier;
>         acpi_handle consumer;
> +       bool honor_dep;
>  };
>
>  /* Performance Management */
> @@ -693,6 +695,7 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>
>  void acpi_dev_clear_dependencies(struct acpi_device *supplier);
> +bool acpi_dev_ready_for_enumeration(const struct acpi_device *device);
>  struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier);
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
> --
