Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3126D35C4
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 08:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbjDBGRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 02:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDBGRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 02:17:42 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFC61D86D
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 23:17:41 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id u15so8069351qkk.4
        for <linux-media@vger.kernel.org>; Sat, 01 Apr 2023 23:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680416260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbYsq+YxaDOVVYh9yxhJoqjJ/GIQ36BzMYaoKYO0wqg=;
        b=HQlnEa/joSDZunJ3YLzTq+TbXY+ixJ+zt6UkK9OyAoBIP0dT9OESW1A4oA90g2mOpV
         seLMZDKJdulHG6RhQTeeyqj5bFP72rJF8QfPGVkEll5EJjsvhPoAqC+FmXa6lZS+3k9A
         zTPzifxLaLZ0A60A8uEwNa6jnaWzlsPg3ElMJ6tuXfLKeVkvXAqIBeLHbKWI76NArWpA
         HZinTXC5384eNkXOYTqP9E1XdapBUCQxhkY3BUV4ZWkqm3ULzYIs/ZHzuXImimJ3DlTe
         GuZhJZ9H1fPOOXEvefaHdS/53M6R/qWELyiUHsf2davxGUKfnomONyTtsx3Sz5G07MVC
         A6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680416260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbYsq+YxaDOVVYh9yxhJoqjJ/GIQ36BzMYaoKYO0wqg=;
        b=HN4J9496byJMrNNUdNqWr+6I23ZlQbtm+uQtkR65hK3LDg6DCE9yrwwx/VfN7VPcWj
         oVOrE3mx1Dzu3IKEewvURdtjK0uzBwzopFLHkZkyTFl85xTafwGmv7fSIMP+bk4yXkj5
         4rHuLpOtknRlQ14aYJJ4fX5eCoCHr19pRolHS3pOXwCFAyKpTNgt4q/9oBrvz5Pk73Q2
         u9JB9RUaJ8+Yl4XCoKIRlXCWO/zQStKCBgUy0Wdh6bYt6SjMO2D8FBye9+uzvVmvfU+V
         rvb2ouL8uxp0Aw4DlQREHyNKxP7vwAex6xsrdCVI10++JRsL+abcAmnmIqqER4+nYWpY
         NX0g==
X-Gm-Message-State: AO0yUKVNClncnIHUrlD6gvhK7Vm90q3ukBpkmkj8vz9hudSOEM5y24S4
        NgHrD4oHpJgZtBbNUr7qt1IjoSmNzz/ERSzNVgE=
X-Google-Smtp-Source: AK7set8sN5Tw/VEHa3lMNSZUXqXmCbWCRrSeOmcrvfmKZMhR6kZd9EePMmRq3Fq2C0EfvCvSSNO5+3OAX0zEnFl6KmE=
X-Received: by 2002:a05:620a:31a7:b0:745:90a0:613e with SMTP id
 bi39-20020a05620a31a700b0074590a0613emr7214142qkb.14.1680416260170; Sat, 01
 Apr 2023 23:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230401145926.596216-1-hdegoede@redhat.com> <20230401145926.596216-2-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Apr 2023 08:17:03 +0200
Message-ID: <CAHp75Vea_S-Sw+BYFCPbZ_aTy83kotMOofpqjyGYO7sVywpdYg@mail.gmail.com>
Subject: Re: [PATCH 01/28] media: atomisp: Add v4l2_get_acpi_sensor_info() helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 1, 2023 at 4:59=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> ACPI nodes describing sensors on atomisp devices implement a
> "79234640-9e10-4fea-a5c1-b5aa8b19756f" Device Specific Method (DSM)
> to get info about the GPIOs.
>
> Using this method is necessary to figure out which ACPI GPIO resource
> is "reset" and which one is "powerdown" and this is also necessary to
> figure out the correct polarity of the pins.
>
> One example where this is necessary is the GC0310 sensor. The current
> GC0310 code hardcodes reset as being active-low and power-down as being
> active-high. This works on a number of devices such as the mpman
> converter 9. But it is wrong for the Chuwi Vi8 CWI501 where the powerdown
> pin is active-low.
>
> Rather then adding DMI quirks for this, add a helper for this,
> which can be shared between sensor-drivers. This new helper optionally
> also returns a string identifying the exact sensor-module used, which
> might be useful if any module specific behvior is necessary in the sensor
> driver.
>
> This uses the DSM directly on the sensor device's ACPI node. This is
> different from later Intel hardware (IPU3 / IPU6) which has a separate
> INT3472 node (with its own driver) with this info.
>
> Since there is no separate ACPI node to which we can bind to register GPI=
O
> lookups, this unfortunately means that all sensor drivers which may be us=
ed
> on BYT or CHT hw need to call this new helper.
>
> Note for now this function is being added to atomisp_gmin_platform.c,
> but once things are ready to move atomisp over to using generic sensor
> drivers this will need to become a generic v4l2 sensor helper. but this
> will require upstream discussion first.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../atomisp/include/linux/atomisp_platform.h  |   2 +
>  .../media/atomisp/pci/atomisp_gmin_platform.c | 240 ++++++++++++++++++
>  2 files changed, 242 insertions(+)
>
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform=
.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> index b77bf814a5a6..e8e965f73fc8 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> @@ -213,6 +213,8 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subde=
v *subdev, u32 lanes,
>                                     enum atomisp_bayer_order bayer_order)=
;
>  void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
>
> +int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str);
> +
>  /* API from old platform_camera.h, new CPUID implementation */
>  #define __IS_SOC(x) (boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL &&=
 \
>                      boot_cpu_data.x86 =3D=3D 6 &&                       =
\
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/=
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 7fc7dfa56172..f8d8a34d7e7f 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1447,3 +1447,243 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x0f=
38, isp_pm_cap_fixup);
>
>  MODULE_DESCRIPTION("Ancillary routines for binding ACPI devices");
>  MODULE_LICENSE("GPL");
> +
> +/*
> + * The below helper functions don't really belong here and should eventu=
ally be
> + * moved to some place under sys/drivers/media/v4l2-core .

Redundant sys/ and space at the end.

> + */
> +#include <linux/platform_data/x86/soc.h>
> +
> +/*
> + * 79234640-9e10-4fea-a5c1-b5aa8b19756f
> + * This _DSM GUID returns information about the GPIO lines mapped to a s=
ensor.
> + * Function number 1 returns a count of the GPIO lines that are mapped.
> + * Subsequent functions return 32 bit ints encoding information about th=
e GPIO.
> + */
> +static const guid_t intel_sensor_gpio_info_guid =3D
> +       GUID_INIT(0x79234640, 0x9e10, 0x4fea,
> +                 0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
> +
> +/*
> + * 822ace8f-2814-4174-a56b-5f029fe079ee
> + * This _DSM GUID returns a string from the sensor device, which acts as=
 a
> + * module identifier.
> + */
> +static const guid_t intel_sensor_module_guid =3D
> +       GUID_INIT(0x822ace8f, 0x2814, 0x4174,
> +                 0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
> +
> +#define INTEL_DSM_TYPE_SHIFT                           0
> +#define INTEL_DSM_TYPE_MASK                            GENMASK(7, 0)
> +#define INTEL_DSM_PIN_SHIFT                            8
> +#define INTEL_DSM_PIN_MASK                             GENMASK(15, 8)
> +#define INTEL_DSM_SENSOR_ON_VAL_SHIFT                  24
> +#define INTEL_DSM_SENSOR_ON_VAL_MASK                   GENMASK(31, 24)
> +
> +#define INTEL_DSM_TYPE(x) \
> +       (((x) & INTEL_DSM_TYPE_MASK) >> INTEL_DSM_TYPE_SHIFT)
> +#define INTEL_DSM_PIN(x) \
> +       (((x) & INTEL_DSM_PIN_MASK) >> INTEL_DSM_PIN_SHIFT)
> +#define INTEL_DSM_SENSOR_ON_VAL(x) \
> +       (((x) & INTEL_DSM_SENSOR_ON_VAL_MASK) >> INTEL_DSM_SENSOR_ON_VAL_=
SHIFT)
> +
> +#define V4L2_SENSOR_MAX_ACPI_GPIOS                     2u
> +
> +struct v4l2_acpi_gpio_map {
> +       struct acpi_gpio_params params[V4L2_SENSOR_MAX_ACPI_GPIOS];
> +       struct acpi_gpio_mapping mapping[V4L2_SENSOR_MAX_ACPI_GPIOS + 1];
> +};
> +
> +struct v4l2_acpi_gpio_parsing_data {
> +       struct device *dev;
> +       u32 settings[V4L2_SENSOR_MAX_ACPI_GPIOS];
> +       unsigned int settings_count;
> +       unsigned int res_count;
> +       unsigned int map_count;
> +       struct v4l2_acpi_gpio_map *map;
> +};
> +
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
> +
> +       if (!acpi_gpio_get_io_resource(ares, &agpio))
> +               return 1; /* Not a GPIO, continue the loop */
> +
> +       data->res_count++;
> +
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
> +                        INTEL_DSM_TYPE(settings), pin);
> +               return 1;
> +       }
> +
> +       /*
> +        * Both reset and power-down need to be logical false when the se=
nsor
> +        * is on (sensor should not be in reset and not be powered-down) =
so

), so

> +        * when the sensor-on-value, which is the physical pin value is h=
igh,

The sub sentence between commas is a bit unreadable.

> +        * then the signal is active-low.
> +        */
> +       active_low =3D INTEL_DSM_SENSOR_ON_VAL(settings) ? true : false;

Redundant '? true : false" part.

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
> +                data->res_count - 1, agpio->resource_source.string_ptr,
> +                pin, active_low ? "low" : "high");
> +
> +       return 1;
> +}
> +
> +/*
> + * Helper function to create an ACPI GPIO lookup table for sensor reset =
and
> + * powerdown signals on Intel Bay Trail (BYT) and Cherry Trail (CHT) dev=
ices,
> + * including setting the correct polarity for the GPIO.
> + *
> + * This uses the "79234640-9e10-4fea-a5c1-b5aa8b19756f" DSM method direc=
tly
> + * on the sensor device's ACPI node. This is different from later Intel
> + * hardware which has a separate INT3472 with this info. Since there is
> + * no separate firmware-node to which we can bind to register the GPIO l=
ookups
> + * this unfortunately means that all sensor drivers which may be used on
> + * BYT or CHT hw need to call this function. This also means that this f=
unction
> + * may only fail when it is actually called on BYT/CHT hw. In all other =
cases
> + * it must always succeed.
> + *
> + * Note this code uses the same DSM GUID as the INT3472 discrete.c code
> + * and there is some overlap, but there are enough differences that it i=
s
> + * difficult to share the code.
> + */
> +int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str)
> +{
> +       struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +       struct v4l2_acpi_gpio_parsing_data data =3D { };
> +       LIST_HEAD(resource_list);
> +       union acpi_object *obj;
> +       unsigned int i, j;
> +       int ret;
> +
> +       if (module_id_str)
> +               *module_id_str =3D NULL;
> +
> +       if (!adev)
> +               return 0;
> +
> +       obj =3D acpi_evaluate_dsm_typed(adev->handle, &intel_sensor_modul=
e_guid,
> +                                     0x00, 0x01, NULL, ACPI_TYPE_STRING)=
;
> +       if (obj) {
> +               dev_info(dev, "Sensor module id: '%s'\n", obj->string.poi=
nter);
> +               if (module_id_str)
> +                       *module_id_str =3D kstrdup(obj->string.pointer, G=
FP_KERNEL);
> +
> +               ACPI_FREE(obj);
> +       }

> +       if (!soc_intel_is_byt() && !soc_intel_is_cht())
> +               return 0;

So, you (might) call the previous _DSM for any SoC, is it intentional?

> +       /*
> +        * First get the GPIO-settings count and then get count GPIO-sett=
ings
> +        * values. Note the order of these may differ from the order in w=
hich
> +        * the GPIOs are listed on the ACPI resources! So we first store =
them all
> +        * and then enumerate the ACPI resources and match them up by pin=
 number.
> +        */
> +       obj =3D acpi_evaluate_dsm_typed(adev->handle,
> +                                     &intel_sensor_gpio_info_guid, 0x00,=
 1,
> +                                     NULL, ACPI_TYPE_INTEGER);
> +       if (!obj)
> +               return dev_err_probe(dev, -EIO, "No _DSM entry for GPIO p=
in count\n");
> +
> +       data.settings_count =3D obj->integer.value;
> +       ACPI_FREE(obj);
> +
> +       if (data.settings_count > V4L2_SENSOR_MAX_ACPI_GPIOS)
> +               return dev_err_probe(dev, -EIO, "Too many GPIOs %u > %u\n=
",
> +                                    data.settings_count, V4L2_SENSOR_MAX=
_ACPI_GPIOS);
> +
> +       for (i =3D 0; i < data.settings_count; i++) {
> +               /*
> +                * i + 2 because the index of this _DSM function is 1-bas=
ed
> +                * and the first function is just a count.
> +                */
> +               obj =3D acpi_evaluate_dsm_typed(adev->handle,
> +                                             &intel_sensor_gpio_info_gui=
d,
> +                                             0x00, i + 2,
> +                                             NULL, ACPI_TYPE_INTEGER);
> +               if (!obj)
> +                       return dev_err_probe(dev, -EIO, "No _DSM entry fo=
r GPIO pin %u\n", i);
> +
> +               data.settings[i] =3D obj->integer.value;
> +               ACPI_FREE(obj);
> +       }
> +
> +       /* Since we match up by pin-number the pin-numbers must be unique=
 */
> +       for (i =3D 0; i < data.settings_count; i++) {
> +               for (j =3D i + 1; j < data.settings_count; j++) {
> +                       if (INTEL_DSM_PIN(data.settings[i]) !=3D
> +                           INTEL_DSM_PIN(data.settings[j]))
> +                               continue;
> +
> +                       return dev_err_probe(dev, -EIO, "Duplicate pin nu=
mber %lu\n",
> +                                            INTEL_DSM_PIN(data.settings[=
i]));
> +               }
> +       }
> +
> +       /* Use devm_kzalloc() for the mappings + params to auto-free them=
 */
> +       data.map =3D devm_kzalloc(dev, sizeof(*data.map), GFP_KERNEL);
> +       if (!data.map)
> +               return -ENOMEM;
> +
> +       /* Now parse the ACPI resources and build the lookup table */
> +       data.dev =3D dev;
> +       ret =3D acpi_dev_get_resources(adev, &resource_list,
> +                                    v4l2_acpi_handle_gpio_res, &data);
> +       if (ret < 0)
> +               return ret;
> +
> +       acpi_dev_free_resource_list(&resource_list);
> +
> +       if (data.map_count !=3D data.settings_count ||
> +           data.res_count !=3D data.settings_count)
> +               dev_warn(dev, "ACPI GPIO resources vs DSM GPIO-info count=
 mismatch (dsm: %d res: %d map %d\n",
> +                        data.settings_count, data.res_count, data.map_co=
unt);
> +
> +       return devm_acpi_dev_add_driver_gpios(dev, data.map->mapping);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_get_acpi_sensor_info);
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
