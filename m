Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0CD712E25
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 22:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237731AbjEZUbN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 16:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjEZUbM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 16:31:12 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DED7F3
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 13:31:06 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75ca95c4272so85987685a.0
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685133065; x=1687725065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAafFW2N4KPdVneRuwJTy1rP53RJW19wvdpPzMZPwQ8=;
        b=ksdzx2ev4My96RSxQASSXKmHmw3he4WOY0cYs9TbJNRcOr+3rZvS7NVNqNqtt1Fpo3
         Fzc5LIoEkGNAFfvff/3GjkYkw3mciI207eFun6huCvrOMc/rsMfNQzJUi/Ei8h84VyDz
         TClz4NN1HlEAM10g2zC2kZB+6kXsTZmUaV60p/u8shNldrQYTTC05UOVUSJVZiJLfbqw
         QQaaAGMawyOOMaTAs67NW8QpgCjX11VV+oIn9ZsAsKoI1ua75PmOgd8otlvu22c6o3mI
         MUr81e79U7QaxKzKLttYIMK+zPdSyhuaRWbFLLu3+NHJ2CRWbuVfejzylBR0kwlVAjFY
         Xnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685133065; x=1687725065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAafFW2N4KPdVneRuwJTy1rP53RJW19wvdpPzMZPwQ8=;
        b=mBDzXgiWEkxjvYmxjXPmjKyG0fFp3d5cQ8OqR2kAGsCM9k5mH3PApvyBa7cNq88oSO
         Ec6SwWdaBQ9Wzd9+yE2pw+vtEmCYu24LOLl6YQuR/wYXDeP/jFD2Ewhjjhl9ckTIRroE
         H0fyouLnG5NkCFxpBq4eLP3Ai6kfkr2k+qFuc37iaGdf14hgK6jo5YeOFlB0lV4WUZ+K
         2Op5P+U7SLWjFjOzeyZN2MruCCOjvay8yOBx+AcLEptF6ujrfeLfp/QlkwaWuDJMCSa9
         yOXlmUX8G3t1g8M84pKsoTiA/+7OlwAH+KYYwMzJJ5wEqQDE36YY/Y31EFkcupn++7T6
         J5/g==
X-Gm-Message-State: AC+VfDzsXIDWV8Kej/dcQzp5h6fQFSGwlTpVkFc9oA6JFtCl/1yw16DK
        i1QIPztjDwnGdIhrii1PLemArvjaossrJQoYCQ8=
X-Google-Smtp-Source: ACHHUZ5gutxjNSA8dSNIq0XfIASk0BD7lbxQDk51ycxi3324q1y8ysJFdx0tRoVonSGQZf8kTP3h0TIfgWQ/MPr6jfQ=
X-Received: by 2002:a05:620a:8808:b0:75b:23a1:8e5e with SMTP id
 qj8-20020a05620a880800b0075b23a18e5emr682611qkn.47.1685133065583; Fri, 26 May
 2023 13:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230525190100.130010-1-hdegoede@redhat.com> <20230525190100.130010-2-hdegoede@redhat.com>
In-Reply-To: <20230525190100.130010-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 26 May 2023 23:30:28 +0300
Message-ID: <CAHp75Vd1ijQM7b8Z2ip3TXJyuhQJfAqk0MNBVW-Q-ooi_-dBHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] media: atomisp: Add support for v4l2-async sensor registration
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
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

On Thu, May 25, 2023 at 10:01=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Add support for using v4l2-async sensor registration.
>
> This has been tested with both the gc0310 and the ov2680 sensor drivers.
>
> Drivers must add the ACPI HIDs they match on to the supported_sensors[]
> array in the same commit as that they are converted to
> v4l2_async_register_subdev_sensor().
>
> Sensor drivers also must check they have a fwnode graph endpoint and retu=
rn
> -EPROBE_DEFER from probe() if there is no endpoint yet. This guarantees
> that the GPIO mappingss are in place before the driver tries to get GPIOs=
.

mappings

> For now it also is still possible to use the old atomisp_gmin_platform
> based sensor drivers. This is mainly intended for testing while moving
> other sensor drivers over to runtime-pm + v4l2-async.

...

> +struct acpi_device;
>  struct atomisp_device;
> -struct v4l2_device;
>  struct atomisp_sub_device;
> +struct v4l2_device;

I would group atomisp* separately

struct acpi_device;
struct v4l2_device;

struct atomisp_device;
struct atomisp_sub_device;

...

> +struct atomisp_csi2_bridge {
> +       char csi2_node_name[14];
> +       struct software_node csi2_node;

Wondering if swapping these two saves some code (due to potential use
of container_of() for the node member).

> +       u32 data_lanes[CSI2_MAX_LANES];
> +       unsigned int n_sensors;
> +       struct atomisp_csi2_sensor sensors[ATOMISP_CAMERA_NR_PORTS];
> +};

...

> +static char *gmin_cfg_get_dsm(struct acpi_device *adev, const char *key)
> +{
> +       union acpi_object *obj, *key_el, *val_el;
> +       char *val =3D NULL;
> +       int i;
> +
> +       obj =3D acpi_evaluate_dsm_typed(adev->handle, &atomisp_dsm_guid, =
0, 0,
> +                                     NULL, ACPI_TYPE_PACKAGE);
> +       if (!obj)
> +               return NULL;
> +
> +       for (i =3D 0; i < obj->package.count - 1; i +=3D 2) {
> +               key_el =3D &obj->package.elements[i + 0];
> +               val_el =3D &obj->package.elements[i + 1];
> +
> +               if (key_el->type !=3D ACPI_TYPE_STRING || val_el->type !=
=3D ACPI_TYPE_STRING)
> +                       break;
> +
> +               if (!strcmp(key_el->string.pointer, key)) {
> +                       val =3D kstrdup(val_el->string.pointer, GFP_KERNE=
L);

> +                       dev_info(&adev->dev, "Using DSM entry %s=3D%s\n",=
 key, val);

Do we really want to have "(null)" to be printed in case of the
kstrdup() failure?
Also this code may become a honeypot for all possible static analyzers
and even if we don't care about NULL it may become noisy activity.

Besides that since we have a handle, wouldn't it be better to use
acpi_handle_info() here?

> +                       break;
> +               }
> +       }
> +
> +       ACPI_FREE(obj);
> +       return val;
> +}

...

> +               dev_info(&adev->dev, "Using DMI entry %s=3D%s\n", key, gv=
->val);

acpi_handle_info() ?
Note, I'm fine with dev_info() in both cases, just asking.

...

> +       status =3D acpi_evaluate_object_typed(adev->handle, "_PR0", NULL,=
 &buffer, ACPI_TYPE_PACKAGE);
> +       if (!ACPI_SUCCESS(status))

ACPI_FAILURE()

> +               return -ENOENT;

...

> +       /*
> +        * Get pmc-clock number from ACPI _PR0 method and compare this to

PMC ?

> +        * the CsiPort 1 pmc-clock used in the CHT/BYT reference designs.

Ditto.

> +        */

...

> +       obj =3D acpi_evaluate_dsm_typed(adev->handle, &intel_sensor_modul=
e_guid,
> +                                     0x00, 0x01, NULL, ACPI_TYPE_STRING)=
;

0x01 here...

> +       if (obj) {
> +               dev_info(&adev->dev, "Sensor module id: '%s'\n", obj->str=
ing.pointer);
> +               ACPI_FREE(obj);
> +       }
> +
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

...and 1 here. Wouldn't it make sense to be consistent and use either
hex or decimal (looking into below code decimal looks more plausible)
in both cases?

> +                                     NULL, ACPI_TYPE_INTEGER);
> +       if (!obj)
> +               return dev_err_probe(&adev->dev, -EIO, "No _DSM entry for=
 GPIO pin count\n");

...

> +       /* Since we match up by pin-number the pin-numbers must be unique=
 */
> +       for (i =3D 0; i < data.settings_count; i++) {
> +               for (j =3D i + 1; j < data.settings_count; j++) {
> +                       if (INTEL_GPIO_DSM_PIN(data.settings[i]) !=3D
> +                           INTEL_GPIO_DSM_PIN(data.settings[j]))
> +                               continue;

Wondering if we can have pure pin numbers in some (bit)array, in that
case the uniqueness can be achieved by the test_bit() call in O(1).

> +                       return dev_err_probe(&adev->dev, -EIO, "Duplicate=
 pin number %lu\n",
> +                                            INTEL_GPIO_DSM_PIN(data.sett=
ings[i]));
> +               }
> +       }

...

> +       for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> +               if (!adev->status.enabled)
> +                       continue;
> +
> +               if (bridge->n_sensors >=3D ATOMISP_CAMERA_NR_PORTS) {
> +                       dev_err(isp->dev, "Exceeded available CSI2 ports\=
n");
> +                       ret =3D -EINVAL;

EOVERFLOW ? EEXIST? ENOMEM

(EINVAL is fine, but to me it's too much use of the same code in the kernel=
)

> +                       goto err_put_adev;
> +               }

> +       }

...

> +       /*
> +        * This function is intended to run only once and then leave
> +        * the created nodes attached even after a rmmod, therefor:

Some spellcheckers want "therefore" here.

> +        * 1. The bridge memory is leaked deliberately on success
> +        * 2. If a secondary fwnode is already set exit early.
> +        */

--
With Best Regards,
Andy Shevchenko
