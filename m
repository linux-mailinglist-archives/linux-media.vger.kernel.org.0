Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833757245F8
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 16:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbjFFO3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 10:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237677AbjFFO3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 10:29:35 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D1F186
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 07:29:00 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6260a9ef126so50091036d6.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jun 2023 07:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686061735; x=1688653735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWL9TIrPPXL5iMN2PMKfmz/IG3LdlvRosmbZV+NkrDo=;
        b=Vp0EzqeVhbKmKBEuFi1siWznTrf0iSbDTcmi3S994OnQu2m3UPcRsYKfX1G0i0ubUl
         jy0coySV6ZWx89tT9CHj6XSn/637wxMFIY5t4QsdDj27b1LHD4552wYSdH8o50foY2kP
         Fc8SLpIiZ17VTlx3WtKdpOvhOCDX0QDN78dluaffXpbzDbZh4oi/w/Q554a7Mpg20iWr
         iCTcW6f/t84frCulyguRpQGYK9bwrX3zPH23nF0gLySptcsP9Oeb70rfrAeohXbeiOwl
         Ad+78RffNt+EMfSYaapL/3WcIHNlxqCtl17NHgLnbVWxdeNEbTjppLiRpVboCRGbX7R7
         evsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061735; x=1688653735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWL9TIrPPXL5iMN2PMKfmz/IG3LdlvRosmbZV+NkrDo=;
        b=iRjm7LcJ3Ooa3bcbOzKdCNShualfXuxuHgUwwsqBaoIWb6hKs+xtRCrEQtkmaV1dFo
         JslGIV+CsdR38hH0wyvwtH7MwMTLhRA2LOPJBHH257COxtu2aGi3Z4UslFSx5DzB5CxE
         bOVc+wxvHN5J9sSMf/WCtfoPnntrjVol4eE+XOXoBbDH5e2ShWIpcuDiFrXgsVvB4Sqp
         U8CMb89RVbS2kqc6hSN42aXz92mdvONqmwLMC+CvqRyXr5bfl0x3P1kHnNPgO2Vsh6l9
         aOD0A6aQQQUqFOX5ZnvcBCRaTHVOEaPgC94GACjS2AYQGpHVogQgNUxwfKCAZqJgEoWv
         1OAg==
X-Gm-Message-State: AC+VfDzHb2cp2P2fD5H8GKK/Cfo3BBk7JaGgj9QHHWydx7sLytmJ5+rg
        yUslk0UHufG7mOvJBUHhImP4rEBnhmi1/hbU5JM=
X-Google-Smtp-Source: ACHHUZ6IMo/9b+2gOvTRs51NN62pfdUiKh3o+2G8v9K9VPXnSeSAgJF/QsRpDrwL6nBwxCcxvLx/yoB+XhixH9UHCfM=
X-Received: by 2002:a05:6214:2627:b0:626:f3d:9e46 with SMTP id
 gv7-20020a056214262700b006260f3d9e46mr2682955qvb.18.1686061734700; Tue, 06
 Jun 2023 07:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230606133136.23619-1-hdegoede@redhat.com>
In-Reply-To: <20230606133136.23619-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 6 Jun 2023 17:28:18 +0300
Message-ID: <CAHp75VdxraOTMrxu_KxCzCKHNW8fiiqMRpaSQN3tVqiXAwGJWQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Add support for setting
 "clock-" and "link-frequencies" props
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
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

On Tue, Jun 6, 2023 at 4:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Some standard v4l2 sensor drivers from drivers/media/i2c expect a
> "clock-frequency" property on the device indicating the frequency
> of the extclk for the sensor. Example of such drivers are the
> ov2680 and ov5693 drivers.
>
> The standard ov5693 sensor also expects a "link-frequencies" property.
> Add support for setting both properties.
>
> Note the "clock-frequency" prop is added before the "rotation" prop while
> the "link-frequencies" are added at the end to match the ipu3 cio2-bridge
> code from which this is derived.

LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2.h    | 13 +++++++++----
>  .../staging/media/atomisp/pci/atomisp_csi2_bridge.c | 12 ++++++++++--
>  2 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/s=
taging/media/atomisp/pci/atomisp_csi2.h
> index b389ccda5e98..16ddb3ab2963 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> @@ -31,6 +31,7 @@
>  #define CSI2_PADS_NUM          2
>
>  #define CSI2_MAX_LANES         4
> +#define CSI2_MAX_LINK_FREQS    3
>
>  #define CSI2_MAX_ACPI_GPIOS    2u
>
> @@ -64,10 +65,12 @@ enum atomisp_csi2_sensor_swnodes {
>  };
>
>  struct atomisp_csi2_property_names {
> +       char clock_frequency[16];
>         char rotation[9];
>         char bus_type[9];
>         char data_lanes[11];
>         char remote_endpoint[16];
> +       char link_frequencies[17];
>  };
>
>  struct atomisp_csi2_node_names {
> @@ -79,6 +82,8 @@ struct atomisp_csi2_node_names {
>  struct atomisp_csi2_sensor_config {
>         const char *hid;
>         int lanes;
> +       int nr_link_freqs;
> +       u64 link_freqs[CSI2_MAX_LINK_FREQS];
>  };
>
>  struct atomisp_csi2_sensor {
> @@ -93,10 +98,10 @@ struct atomisp_csi2_sensor {
>         struct software_node swnodes[SWNODE_COUNT];
>         struct atomisp_csi2_node_names node_names;
>         struct atomisp_csi2_property_names prop_names;
> -       /* "rotation" + terminating entry */
> -       struct property_entry dev_properties[2];
> -       /* "bus-type", "data-lanes", "remote-endpoint" + terminating entr=
y */
> -       struct property_entry ep_properties[4];
> +       /* "clock-frequency", "rotation" + terminating entry */
> +       struct property_entry dev_properties[3];
> +       /* "bus-type", "data-lanes", "remote-endpoint" + "link-freq" + te=
rminating entry */
> +       struct property_entry ep_properties[5];
>         /* "data-lanes", "remote-endpoint" + terminating entry */
>         struct property_entry csi2_properties[3];
>         struct software_node_ref_args local_ref[1];
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/dr=
ivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 28d8779bbbc4..0d12ba78d9c1 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -85,7 +85,7 @@ static const guid_t atomisp_dsm_guid =3D
>
>  /*
>   * Extend this array with ACPI Hardware IDs of sensors known to be worki=
ng
> - * plus the number of links expected by their drivers.
> + * plus the default number of links + link-frequencies.
>   *
>   * Do not add an entry for a sensor that is not actually supported,
>   * or which have not yet been converted to work without atomisp_gmin
> @@ -492,10 +492,12 @@ static int atomisp_csi2_add_gpio_mappings(struct at=
omisp_csi2_sensor *sensor,
>  }
>
>  static const struct atomisp_csi2_property_names prop_names =3D {
> +       .clock_frequency =3D "clock-frequency",
>         .rotation =3D "rotation",
>         .bus_type =3D "bus-type",
>         .data_lanes =3D "data-lanes",
>         .remote_endpoint =3D "remote-endpoint",
> +       .link_frequencies =3D "link-frequencies",
>  };
>
>  static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_se=
nsor *sensor,
> @@ -507,7 +509,9 @@ static void atomisp_csi2_create_fwnode_properties(str=
uct atomisp_csi2_sensor *se
>         sensor->local_ref[0] =3D SOFTWARE_NODE_REFERENCE(&sensor->swnodes=
[SWNODE_CSI2_ENDPOINT]);
>         sensor->remote_ref[0] =3D SOFTWARE_NODE_REFERENCE(&sensor->swnode=
s[SWNODE_SENSOR_ENDPOINT]);
>
> -       sensor->dev_properties[0] =3D PROPERTY_ENTRY_U32(sensor->prop_nam=
es.rotation, 0);
> +       sensor->dev_properties[0] =3D PROPERTY_ENTRY_U32(sensor->prop_nam=
es.clock_frequency,
> +                                                      PMC_CLK_RATE_19_2M=
HZ);
> +       sensor->dev_properties[1] =3D PROPERTY_ENTRY_U32(sensor->prop_nam=
es.rotation, 0);
>
>         sensor->ep_properties[0] =3D PROPERTY_ENTRY_U32(sensor->prop_name=
s.bus_type,
>                                                       V4L2_FWNODE_BUS_TYP=
E_CSI2_DPHY);
> @@ -516,6 +520,10 @@ static void atomisp_csi2_create_fwnode_properties(st=
ruct atomisp_csi2_sensor *se
>                                                                 sensor->l=
anes);
>         sensor->ep_properties[2] =3D PROPERTY_ENTRY_REF_ARRAY(sensor->pro=
p_names.remote_endpoint,
>                                                             sensor->local=
_ref);
> +       if (cfg->nr_link_freqs > 0)
> +               sensor->ep_properties[3] =3D
> +                       PROPERTY_ENTRY_U64_ARRAY_LEN(sensor->prop_names.l=
ink_frequencies,
> +                                                    cfg->link_freqs, cfg=
->nr_link_freqs);
>
>         sensor->csi2_properties[0] =3D PROPERTY_ENTRY_U32_ARRAY_LEN(senso=
r->prop_names.data_lanes,
>                                                                   bridge-=
>data_lanes,
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
