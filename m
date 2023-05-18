Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164FA70861C
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 18:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjERQhG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 12:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjERQhF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 12:37:05 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAEFB3
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:37:03 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6237faa8677so9770066d6.1
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684427823; x=1687019823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VjsOeHUx8dfaAsDu8RaB5CC0Sc9n9X3k4bG38ID8w4=;
        b=KCcsRLB2wYA4RcX+qYYvgiF6zt/+XC4xhHEoUpGRYRAvrIKPjJsPi3aAhmqhHbFIRu
         xU61FWVBd9F4DmbpxabSU62lpr71VPkwVRmSK9tFh6OecZAx2h9uGYZQ/HDgknRLqluf
         3/8LAMdJutz2SN9UDhy0OA5BKtHNcqSEwVePQAECQkM6nzRA5Q+yBX38rJGaHaa3XMmT
         E817savSozTVgkF+AJp1RdJMOyIXStglVMzvPZ80EJ0u8nF9QFppshdLDWp9RGEvGdAS
         Ot4KhE6fPHdEDXUoef1esaNeZNVuZvQWNsmAoig+vAEN6ICvOG02IpR5jYP8ip0Q5YS7
         xb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684427823; x=1687019823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VjsOeHUx8dfaAsDu8RaB5CC0Sc9n9X3k4bG38ID8w4=;
        b=A3e675fHv0wBRUm3+0fDQN382m7eP9EoN6xg46rlqL6OVZi7Tu/TXIvDoGdKOpnHUw
         19euH+Yv9pOzCbHYj0twWokIOdPb6vFMiHGGyN5dqI9+mQ0aLfdq08xVRQmLqjDe6dZf
         UIQFbiNLtFZVTFXdinC+cywXSIr8QcTLV/FfiWSXPgEc77vKHdE6ZdVwP7Di/rEtvu3n
         WEQY5pnLQv6ZtoVRIY84oOkF3tcA2ujwuaZgZCdy9U9EKhu+uTSQahx7tc1vnZP6QaTf
         WRnUN6v42iu0iA1RqL3Uvggr7zypTkmaHXFLbLaRpmRwwJWB12020WUxI8lsEugVvDk1
         4rOA==
X-Gm-Message-State: AC+VfDwqxuwEPfrowWHTgdCPPzhOwf48uShFUOjZQbZAF8GJvBxD6Z8n
        z/2vzctVgOO3gQGRRiaS5CcEFWBgWjbQ9r1ERVs=
X-Google-Smtp-Source: ACHHUZ5d10RsAfnNgxlvVoQM0/JPbprrPOLuhnmWMcA9aOV3FVIOH2fihC1hmmw8lUmzoKTxupIznINII/PV1BEdbMk=
X-Received: by 2002:a05:6214:1c83:b0:616:54c7:316a with SMTP id
 ib3-20020a0562141c8300b0061654c7316amr453370qvb.8.1684427822939; Thu, 18 May
 2023 09:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-2-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 May 2023 19:36:26 +0300
Message-ID: <CAHp75Vf6t302XpVKKgm1uyHQ5LsuqSEE+B3AGc1-ODoev77ENA@mail.gmail.com>
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper function
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> On x86/ACPI platforms the GPIO resources do not provide information
> about which GPIO resource maps to which connection-id. So e.g.
> gpiod_get(devg, "reset") does not work.
>
> On devices with an Intel IPU3 or newer ISP there is a special ACPI
> INT3472 device describing the GPIOs and instantiating of the i2c_client
> for a sensor is deferred until the INT3472 driver has been bound based
> on the sensor ACPI device having a _DEP on the INT3472 ACPI device.
>
> This allows the INT3472 driver to add the necessary GPIO lookups
> without needing any special ACPI handling in the sensor driver.
>
> Unfortunately this does not work on devices with an atomisp2 ISP,
> there the _DSM describing the GPIOs is part of the sensor ACPI device
> itself, rather then being part of a separate ACPI device.

than

(not the first time I see the same typo in your commit messages :-)


> IOW there is no separate firmware-node to which we can bind to register
> the GPIO lookups (and also no way to defer creating the sensor i2c_client=
).
>
> This unfortunately means that all sensor drivers which may be used on
> BYT or CHT hw need some code to deal with ACPI integration.
>
> This patch adds a new v4l2_acpi_parse_sensor_gpios() helper function
> for this, which does all the necessary work. This minimizes the
> (unavoidable) change to sensor drivers for ACPI integration to just
> adding a single line calling this void function to probe().
>
> There also is a no-op stub provided for non ACPI platforms so that
> no #ifdef-s are necessary in the driver.
>
> Note v4l2_acpi_parse_sensor_gpios() is basically a copy of
> the atomisp2 v4l2_get_acpi_sensor_info() helper from:
> drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> minus logging the sensor module-name using a second _DSM.

> v4l2_get_acpi_sensor_info() was already reviewed by Andy,
> see the Link tag below.
>
> (this code duplication is removed in the next patch in this series)

I believe the above is not needed to be in the commit message, but
rather in the comments below (after the '---' cutter line).

...

> +/* Note this always returns 1 to continue looping so that res_count is a=
ccurate */
> +static int v4l2_acpi_handle_gpio_res(struct acpi_resource *ares, void *_=
data)
> +{
> +       struct v4l2_acpi_gpio_parsing_data *data =3D _data;
> +       struct acpi_resource_gpio *agpio;
> +       const char *name;
> +       bool active_low;
> +       unsigned int i;
> +       u32 settings;


> +       u8 pin;

Should be u16.

> +       pin =3D agpio->pin_table[0];
> +       for (i =3D 0; i < data->settings_count; i++) {
> +               if (INTEL_DSM_PIN(data->settings[i]) =3D=3D pin) {
> +                       settings =3D data->settings[i];
> +                       break;
> +               }
> +       }
> +
> +       if (i =3D=3D data->settings_count) {
> +               dev_warn(data->dev, "Could not find DSM GPIO settings for=
 pin %d\n", pin);

%u

> +               return 1;
> +       }
> +
> +       switch (INTEL_DSM_TYPE(settings)) {
> +       case 0:
> +               name =3D "reset-gpios";
> +               break;
> +       case 1:
> +               name =3D "powerdown-gpios";
> +               break;
> +       default:
> +               dev_warn(data->dev, "Unknown GPIO type 0x%02lx for pin %d=
\n",

%u

> +                        INTEL_DSM_TYPE(settings), pin);
> +               return 1;
> +       }
> +
> +       /*
> +        * Both reset and power-down need to be logical false when the se=
nsor
> +        * is on (sensor should not be in reset and not be powered-down).=
 So
> +        * when the sensor-on-value (which is the physical pin value) is =
high,
> +        * then the signal is active-low.
> +        */
> +       active_low =3D INTEL_DSM_SENSOR_ON_VAL(settings) ? true : false;

Ternary part is redundant.

> +       i =3D data->map_count;
> +       if (i =3D=3D V4L2_SENSOR_MAX_ACPI_GPIOS)
> +               return 1;
> +
> +       /* res_count is already incremented */
> +       data->map->params[i].crs_entry_index =3D data->res_count - 1;
> +       data->map->params[i].active_low =3D active_low;
> +       data->map->mapping[i].name =3D name;
> +       data->map->mapping[i].data =3D &data->map->params[i];
> +       data->map->mapping[i].size =3D 1;
> +       data->map_count++;
> +
> +       dev_info(data->dev, "%s crs %d %s pin %d active-%s\n", name,

%u (for pin)

> +                data->res_count - 1, agpio->resource_source.string_ptr,
> +                pin, active_low ? "low" : "high");
> +
> +       return 1;
> +}

...

> + * Note this code uses the same DSM GUID as the INT3472 discrete.c code
> + * and there is some overlap, but there are enough differences that it i=
s
> + * difficult to share the code.

Can you add the name of the variable in that file, so likely the
source code indexing tool might add a link?

...

> +       struct acpi_device *adev =3D ACPI_COMPANION(dev);

I would split this assignment and...

> +       struct v4l2_acpi_gpio_parsing_data data =3D { };
> +       LIST_HEAD(resource_list);
> +       union acpi_object *obj;
> +       unsigned int i, j;
> +       int ret;
> +

...place it here.

> +       if (!adev || (!soc_intel_is_byt() && !soc_intel_is_cht()))
> +               return;

...

> +       devm_acpi_dev_add_driver_gpios(dev, data.map->mapping);

Won't we print a warning here as well in case of error?

...

> +#ifdef CONFIG_ACPI

> +struct device;

This should be outside of previous ifdeffery as it's used in a stub.

> +/**
> + * v4l2_acpi_parse_sensor_gpios - Parse ACPI info describing sensor GPIO=
s.
> + *

Dunno the style of v4l2, but this line is redundant.

> + * @dev: Device to parse the ACPI info for
> + *
> + * On x86/ACPI platforms the GPIO resources do not provide information
> + * about which resource maps to which connection-id.
> + *
> + * Sensor drivers can call this function to use platform specific method=
s
> + * (e.g. the Intel 79234640-9e10-4fea-a5c1-b5aa8b19756f _DSM) to get
> + * information about the pins and add GPIO mappings to make standard gpi=
od_get()
> + * calls work.
> + *
> + * The registered mappings use devm managed memory and are automatically=
 free-ed
> + * on remove() and on probe() failure.
> + */

Usually the kernel doc is attached to the function implementation.

> +void v4l2_acpi_parse_sensor_gpios(struct device *dev);
> +
> +#else /* ifdef CONFIG_ACPI */
> +static inline void v4l2_acpi_parse_sensor_gpios(struct device *dev) { re=
turn 0; }
> +#endif /* ifdef CONFIG_ACPI */

--=20
With Best Regards,
Andy Shevchenko
