Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6835470870C
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 19:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjERRhZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 13:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjERRhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 13:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED51FAA
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 10:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684431400;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E3wTM6WNFcdw4aMSe880CxLT5d6+86d+j3ehKUvx8XY=;
        b=B52OGnTKifH1KsgmziAOm8uurMpWBXnTqE06gkIVFDYETzGw0CaJYn/tuGTZUefoKOOy6Z
        2LZAMgtz1NCuI6T1FsPhZ9RTVLPiAnGpgwppNp85syMvJg6iJsxTzAiJfIA9ktKuvQnGGw
        JqnxGLfQewO3C8FPPGYKWuY6bzgD5ak=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-82u7LqJIN16plB8RHNJnZA-1; Thu, 18 May 2023 13:36:38 -0400
X-MC-Unique: 82u7LqJIN16plB8RHNJnZA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-510ecda1ecfso835656a12.2
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 10:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684431397; x=1687023397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3wTM6WNFcdw4aMSe880CxLT5d6+86d+j3ehKUvx8XY=;
        b=PUo/NOiuPrKy7VrvDsGSE/Z/aR6ZHOkL388f97l4uT5xnFw/Y42uLGAdztUpnt5wk5
         7iJGlIUspEz6fbJAA51dzCvHQ9U8/DO2LUp1qxn6+y0VfQRM81jSqLjTkoCgFJCRqF+5
         hkapB6L1UkApYfz2AV4l/NXDN6bDdwddVo6paPe1IcAhqFWxSggNMW3VpbviHVdKxWqN
         JLcIVR3b08WI/NqeMPr5sTJj1OIYn2ChPoa17zXYa6LOFxBVmgLaNWIUaLmCF9kGxpHl
         XKS3eisf61W6nBRDUiu+nTPbqFEGw7hDIx/n4fhLFP+JH4n3XdjqqSE4seVE+6HDlZul
         jK2g==
X-Gm-Message-State: AC+VfDxauO7R7N7OfzEJV0penuLP4ae74egVi0w+CYQmiiQPTekLasah
        0wXf+l5FM4k1qrkjQigw3nmjhPtJ9jeTMvDepPoQF2JH7OKESS0qvQLsvFMx18eWm8t117a704W
        beM4MnxyeojWGhLN1mth/LOs=
X-Received: by 2002:a17:907:a06:b0:94e:c97b:e3ba with SMTP id bb6-20020a1709070a0600b0094ec97be3bamr38828092ejc.37.1684431397277;
        Thu, 18 May 2023 10:36:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5UQVIwaxdxPL21+4fPPxxZFTW3YeINCGOdNU1nJEzR8fX5kkTLH8m0KGjiHqtft7CebHG6BA==
X-Received: by 2002:a17:907:a06:b0:94e:c97b:e3ba with SMTP id bb6-20020a1709070a0600b0094ec97be3bamr38828066ejc.37.1684431396828;
        Thu, 18 May 2023 10:36:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k21-20020a17090646d500b00965f98eefc1sm1244489ejs.116.2023.05.18.10.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 10:36:36 -0700 (PDT)
Message-ID: <6f56cba4-a7b5-5540-5cdb-a2e6142c2961@redhat.com>
Date:   Thu, 18 May 2023 19:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 9/9] media: atomisp: Add support for v4l2-async sensor
 registration
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230518153733.195306-1-hdegoede@redhat.com>
 <20230518153733.195306-10-hdegoede@redhat.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-10-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/18/23 17:37, Hans de Goede wrote:
> WIP
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

My bad I forgot to update the commit message after finishing my work on this.

Here is the new commit msg now in my local tree:

"""
media: atomisp: Add support for v4l2-async sensor registration

Add support for using v4l2-async sensor registration.

This has been tested with both the gc0310 and the ov2680 sensor drivers.

Drivers should add the ACPI HIDs they match on to the supported_sensors[]
array in the same commit as that they are convered to
v4l2_async_register_subdev_sensor().

For now it also is still possible to use the old atomisp_gmin_platform
based sensor drivers. This is mainly intended for testing while moving
"""

I have also made the supported_sensors[] array empty in my tree and
moved the addition of the INT0310 and OVTI2680 HIDs to the commits
converting the 2 sensor drivers to v4l2_async_register_subdev_sensor(),
so that there is no intermittend state where the sensors will not work.

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/Makefile        |   1 +
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |   4 +
>  .../staging/media/atomisp/pci/atomisp_csi2.h  |  64 ++
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   | 592 ++++++++++++++++++
>  .../media/atomisp/pci/atomisp_internal.h      |   2 +
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  38 +-
>  .../staging/media/atomisp/pci/atomisp_v4l2.h  |   1 +
>  7 files changed, 681 insertions(+), 21 deletions(-)
>  create mode 100644 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> 
> diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
> index 532e12ed72e6..38b370124109 100644
> --- a/drivers/staging/media/atomisp/Makefile
> +++ b/drivers/staging/media/atomisp/Makefile
> @@ -16,6 +16,7 @@ atomisp-objs += \
>  	pci/atomisp_cmd.o \
>  	pci/atomisp_compat_css20.o \
>  	pci/atomisp_csi2.o \
> +	pci/atomisp_csi2_bridge.o \
>  	pci/atomisp_drvfs.o \
>  	pci/atomisp_fops.o \
>  	pci/atomisp_ioctl.o \
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> index 0045c4d3a7f6..abf55a86f795 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
> @@ -371,6 +371,10 @@ int atomisp_mipi_csi2_init(struct atomisp_device *isp)
>  	unsigned int i;
>  	int ret;
>  
> +	ret = atomisp_csi2_bridge_init(isp);
> +	if (ret < 0)
> +		return ret;
> +
>  	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
>  		csi2_port = &isp->csi2_port[i];
>  		csi2_port->isp = isp;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> index b245b2f5ce99..c714202db52a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> @@ -21,14 +21,76 @@
>  #include <media/v4l2-subdev.h>
>  #include <media/v4l2-ctrls.h>
>  
> +#include "../../include/linux/atomisp.h"
> +
>  #define CSI2_PAD_SINK		0
>  #define CSI2_PAD_SOURCE		1
>  #define CSI2_PADS_NUM		2
>  
> +#define CSI2_MAX_LANES		4
> +
>  struct atomisp_device;
>  struct v4l2_device;
>  struct atomisp_sub_device;
>  
> +enum atomisp_csi2_sensor_swnodes {
> +	SWNODE_SENSOR,
> +	SWNODE_SENSOR_PORT,
> +	SWNODE_SENSOR_ENDPOINT,
> +	SWNODE_CSI2_PORT,
> +	SWNODE_CSI2_ENDPOINT,
> +	SWNODE_COUNT
> +};
> +
> +struct atomisp_csi2_property_names {
> +	char rotation[9];
> +	char bus_type[9];
> +	char data_lanes[11];
> +	char remote_endpoint[16];
> +};
> +
> +struct atomisp_csi2_node_names {
> +	char port[7];
> +	char endpoint[11];
> +	char remote_port[7];
> +};
> +
> +struct atomisp_csi2_sensor_config {
> +	const char *hid;
> +	int lanes;
> +};
> +
> +struct atomisp_csi2_sensor {
> +	/* Append port in "-%u" format as suffix of HID */
> +	char name[ACPI_ID_LEN + 4];
> +	struct acpi_device *adev;
> +	int port;
> +	int lanes;
> +
> +	/* SWNODE_COUNT + 1 for terminating NULL */
> +	const struct software_node *group[SWNODE_COUNT + 1];
> +	struct software_node swnodes[SWNODE_COUNT];
> +	struct atomisp_csi2_node_names node_names;
> +	struct atomisp_csi2_property_names prop_names;
> +	/* "rotation" + terminating entry */
> +	struct property_entry dev_properties[2];
> +	/* "bus-type", "data-lanes", "remote-endpoint" + terminating entry */
> +	struct property_entry ep_properties[4];
> +	/* "data-lanes", "remote-endpoint" + terminating entry */
> +	struct property_entry csi2_properties[3];
> +	struct software_node_ref_args local_ref[1];
> +	struct software_node_ref_args remote_ref[1];
> +	struct software_node_ref_args vcm_ref[1];
> +};
> +
> +struct atomisp_csi2_bridge {
> +	char csi2_node_name[14];
> +	struct software_node csi2_node;
> +	u32 data_lanes[CSI2_MAX_LANES];
> +	unsigned int n_sensors;
> +	struct atomisp_csi2_sensor sensors[ATOMISP_CAMERA_NR_PORTS];
> +};
> +
>  struct atomisp_mipi_csi2_device {
>  	struct v4l2_subdev subdev;
>  	struct media_pad pads[CSI2_PADS_NUM];
> @@ -48,6 +110,8 @@ void atomisp_mipi_csi2_unregister_entities(
>      struct atomisp_mipi_csi2_device *csi2);
>  int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
>  					struct v4l2_device *vdev);
> +int atomisp_csi2_bridge_init(struct atomisp_device *isp);
> +int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp);
>  
>  void atomisp_csi2_configure(struct atomisp_sub_device *asd);
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> new file mode 100644
> index 000000000000..8539d7f354ae
> --- /dev/null
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -0,0 +1,592 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Code to build software firmware node graph for atomisp2 connected sensors
> + * from ACPI tables.
> + *
> + * Copyright (C) 2023 Hans de Goede <hdegoede@redhat.com>
> + *
> + * Based on drivers/media/pci/intel/ipu3/cio2-bridge.c written by:
> + * Dan Scally <djrscally@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/property.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#include "atomisp_cmd.h"
> +#include "atomisp_csi2.h"
> +#include "atomisp_internal.h"
> +
> +#define NODE_SENSOR(_HID, _PROPS)		\
> +	((const struct software_node) {		\
> +		.name = _HID,			\
> +		.properties = _PROPS,		\
> +	})
> +
> +#define NODE_PORT(_PORT, _SENSOR_NODE)		\
> +	((const struct software_node) {		\
> +		.name = _PORT,			\
> +		.parent = _SENSOR_NODE,		\
> +	})
> +
> +#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
> +	((const struct software_node) {		\
> +		.name = _EP,			\
> +		.parent = _PORT,		\
> +		.properties = _PROPS,		\
> +	})
> +
> +/*
> + * Extend this array with ACPI Hardware IDs of sensors known to be working
> + * plus the number of links expected by their drivers.
> + *
> + * Do not add an entry for a sensor that is not actually supported,
> + * or which have not yet been converted to work without atomisp_gmin
> + * power-management and with v4l2-async probing.
> + */
> +static const struct atomisp_csi2_sensor_config supported_sensors[] = {
> +	/* GalaxyCore GC0310 */
> +	{ "INT0310", 1 },
> +	/* Omnivision OV2680 */
> +	{ "OVTI2680", 1 },
> +};
> +
> +/*
> + * gmin_cfg parsing code. This is a cleaned up version of the gmin_cfg parsing
> + * code from atomisp_gmin_platform.c.
> + * Once all sensors are moved to v4l2-async probing atomisp_gmin_platform.c can
> + * be removed and the duplication of this code goes away.
> + */
> +struct gmin_cfg_var {
> +	const char *acpi_dev_name;
> +	const char *key;
> +	const char *val;
> +};
> +
> +static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
> +	/* _DSM contains the wrong CsiPort! */
> +	{ "OVTI2680:01", "CsiPort", "0" },
> +	{}
> +};
> +
> +static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
> +	{
> +		/* Lenovo Ideapad Miix 310 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10"),
> +		},
> +		.driver_data = lenovo_ideapad_miix_310_vars,
> +	},
> +	{}
> +};
> +
> +static const guid_t atomisp_dsm_guid = GUID_INIT(0xdc2f6c4f, 0x045b, 0x4f1d,
> +						 0x97, 0xb9, 0x88, 0x2a,
> +						 0x68, 0x60, 0xa4, 0xbe);
> +
> +static char *gmin_cfg_get_dsm(struct acpi_device *adev, const char *key)
> +{
> +	union acpi_object *obj;
> +	char *val = NULL;
> +	int i;
> +
> +	obj = acpi_evaluate_dsm_typed(adev->handle, &atomisp_dsm_guid, 0, 0,
> +				      NULL, ACPI_TYPE_PACKAGE);
> +	if (!obj)
> +		return NULL;
> +
> +	for (i = 0; i < obj->package.count - 1; i += 2) {
> +		/* The package should only contain strings */
> +		if (obj->package.elements[i].type != ACPI_TYPE_STRING ||
> +		    obj->package.elements[i + 1].type != ACPI_TYPE_STRING)
> +			break;
> +
> +		if (!strcmp(obj->package.elements[i].string.pointer, key)) {
> +			val = kstrdup(obj->package.elements[i + 1].string.pointer, GFP_KERNEL);
> +			dev_info(&adev->dev, "Using DSM entry %s=%s\n", key, val);
> +			break;
> +		}
> +	}
> +
> +	ACPI_FREE(obj);
> +	return val;
> +}
> +
> +static char *gmin_cfg_get_dmi_override(struct acpi_device *adev, const char *key)
> +{
> +	const struct dmi_system_id *id;
> +	struct gmin_cfg_var *gv;
> +
> +	id = dmi_first_match(gmin_cfg_dmi_overrides);
> +	if (!id)
> +		return NULL;
> +
> +	for (gv = id->driver_data; gv->acpi_dev_name; gv++) {
> +		if (strcmp(gv->acpi_dev_name, acpi_dev_name(adev)))
> +			continue;
> +
> +		if (strcmp(key, gv->key))
> +			continue;
> +
> +		dev_info(&adev->dev, "Using DMI entry %s=%s\n", key, gv->val);
> +		return kstrdup(gv->val, GFP_KERNEL);
> +	}
> +
> +	return NULL;
> +}
> +
> +static char *gmin_cfg_get(struct acpi_device *adev, const char *key)
> +{
> +	char *val;
> +
> +	val = gmin_cfg_get_dmi_override(adev, key);
> +	if (val)
> +		return val;
> +
> +	return gmin_cfg_get_dsm(adev, key);
> +}
> +
> +static int gmin_cfg_get_int(struct acpi_device *adev, const char *key, int default_val)
> +{
> +	char *str_val;
> +	long int_val;
> +	int ret;
> +
> +	str_val = gmin_cfg_get(adev, key);
> +	if (!str_val)
> +		goto use_default;
> +
> +	ret = kstrtoul(str_val, 0, &int_val);
> +	kfree(str_val);
> +	if (ret)
> +		goto use_default;
> +
> +	return int_val;
> +
> +use_default:
> +	dev_info(&adev->dev, "Using default %s=%d\n", key, default_val);
> +	return default_val;
> +}
> +
> +static int atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(struct acpi_device *adev)
> +{
> +	char name[5];
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer b_name = { sizeof(name), name };
> +	union acpi_object *package, *element;
> +	int clock_num = -ENOENT;
> +	acpi_handle rhandle;
> +	acpi_status status;
> +	int i;
> +
> +	status = acpi_evaluate_object(adev->handle, "_PR0", NULL, &buffer);
> +	if (!ACPI_SUCCESS(status))
> +		return -ENOENT;
> +
> +	package = buffer.pointer;
> +
> +	if (!buffer.length || !package || package->type != ACPI_TYPE_PACKAGE)
> +		goto fail;
> +
> +	for (i = 0; i < package->package.count; i++) {
> +		element = &package->package.elements[i];
> +
> +		if (element->type != ACPI_TYPE_LOCAL_REFERENCE)
> +			continue;
> +
> +		rhandle = element->reference.handle;
> +		if (!rhandle)
> +			continue;
> +
> +		acpi_get_name(rhandle, ACPI_SINGLE_NAME, &b_name);
> +
> +		if (strlen(name) == 4 && !strncmp(name, "CLK", 3) &&
> +		    name[3] >= '0' && name[3] <= '4') {
> +			clock_num = name[3] - '0';
> +			break;
> +		}
> +	}
> +fail:
> +	ACPI_FREE(buffer.pointer);
> +
> +	return clock_num;
> +}
> +
> +static int atomisp_csi2_get_port(struct acpi_device *adev)
> +{
> +	int clock_num, port;
> +
> +	/*
> +	 * Get pmc-clock number from ACPI _PR0 method and compare this to
> +	 * the CsiPort 1 pmc-clock used in the CHT/BYT reference designs.
> +	 */
> +	clock_num = atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(adev);
> +	if (IS_ISP2401)
> +		port = clock_num == 4 ? 1 : 0;
> +	else
> +		port = clock_num == 0 ? 1 : 0;
> +
> +	/* Intel DSM or DMI quirk overrides PR0 derived default */
> +	port = gmin_cfg_get_int(adev, "CsiPort", port);
> +
> +	return port;
> +}
> +
> +static const struct atomisp_csi2_property_names prop_names = {
> +	.rotation = "rotation",
> +	.bus_type = "bus-type",
> +	.data_lanes = "data-lanes",
> +	.remote_endpoint = "remote-endpoint",
> +};
> +
> +static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_sensor *sensor,
> +						  struct atomisp_csi2_bridge *bridge,
> +						  const struct atomisp_csi2_sensor_config *cfg)
> +{
> +	sensor->prop_names = prop_names;
> +
> +	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_CSI2_ENDPOINT]);
> +	sensor->remote_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_SENSOR_ENDPOINT]);
> +
> +	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.rotation, 0);
> +
> +	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.bus_type,
> +						      V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
> +	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
> +								bridge->data_lanes,
> +								sensor->lanes);
> +	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
> +							    sensor->local_ref);
> +
> +	sensor->csi2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
> +								  bridge->data_lanes,
> +								  sensor->lanes);
> +	sensor->csi2_properties[1] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
> +							      sensor->remote_ref);
> +}
> +
> +static void atomisp_csi2_init_swnode_names(struct atomisp_csi2_sensor *sensor)
> +{
> +	snprintf(sensor->node_names.remote_port,
> +		 sizeof(sensor->node_names.remote_port),
> +		 SWNODE_GRAPH_PORT_NAME_FMT, sensor->port);
> +	snprintf(sensor->node_names.port,
> +		 sizeof(sensor->node_names.port),
> +		 SWNODE_GRAPH_PORT_NAME_FMT, 0); /* Always port 0 */
> +	snprintf(sensor->node_names.endpoint,
> +		 sizeof(sensor->node_names.endpoint),
> +		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
> +}
> +
> +static void atomisp_csi2_init_swnode_group(struct atomisp_csi2_sensor *sensor)
> +{
> +	struct software_node *nodes = sensor->swnodes;
> +
> +	sensor->group[SWNODE_SENSOR] = &nodes[SWNODE_SENSOR];
> +	sensor->group[SWNODE_SENSOR_PORT] = &nodes[SWNODE_SENSOR_PORT];
> +	sensor->group[SWNODE_SENSOR_ENDPOINT] = &nodes[SWNODE_SENSOR_ENDPOINT];
> +	sensor->group[SWNODE_CSI2_PORT] = &nodes[SWNODE_CSI2_PORT];
> +	sensor->group[SWNODE_CSI2_ENDPOINT] = &nodes[SWNODE_CSI2_ENDPOINT];
> +}
> +
> +static void atomisp_csi2_create_connection_swnodes(struct atomisp_csi2_bridge *bridge,
> +						   struct atomisp_csi2_sensor *sensor)
> +{
> +	struct software_node *nodes = sensor->swnodes;
> +
> +	atomisp_csi2_init_swnode_names(sensor);
> +
> +	nodes[SWNODE_SENSOR] = NODE_SENSOR(sensor->name,
> +					   sensor->dev_properties);
> +	nodes[SWNODE_SENSOR_PORT] = NODE_PORT(sensor->node_names.port,
> +					      &nodes[SWNODE_SENSOR]);
> +	nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT(sensor->node_names.endpoint,
> +						      &nodes[SWNODE_SENSOR_PORT],
> +						      sensor->ep_properties);
> +	nodes[SWNODE_CSI2_PORT] = NODE_PORT(sensor->node_names.remote_port,
> +					    &bridge->csi2_node);
> +	nodes[SWNODE_CSI2_ENDPOINT] = NODE_ENDPOINT(sensor->node_names.endpoint,
> +						    &nodes[SWNODE_CSI2_PORT],
> +						    sensor->csi2_properties);
> +
> +	atomisp_csi2_init_swnode_group(sensor);
> +}
> +
> +static void atomisp_csi2_unregister_sensors(struct atomisp_csi2_bridge *bridge)
> +{
> +	struct atomisp_csi2_sensor *sensor;
> +	unsigned int i;
> +
> +	for (i = 0; i < bridge->n_sensors; i++) {
> +		sensor = &bridge->sensors[i];
> +		software_node_unregister_node_group(sensor->group);
> +		acpi_dev_put(sensor->adev);
> +	}
> +}
> +
> +static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *cfg,
> +				       struct atomisp_csi2_bridge *bridge,
> +				       struct atomisp_device *isp)
> +{
> +	struct fwnode_handle *fwnode, *primary;
> +	struct atomisp_csi2_sensor *sensor;
> +	struct acpi_device *adev;
> +	int ret;
> +
> +	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> +		if (!adev->status.enabled)
> +			continue;
> +
> +		if (bridge->n_sensors >= ATOMISP_CAMERA_NR_PORTS) {
> +			dev_err(isp->dev, "Exceeded available CSI2 ports\n");
> +			ret = -EINVAL;
> +			goto err_put_adev;
> +		}
> +
> +		sensor = &bridge->sensors[bridge->n_sensors];
> +
> +		sensor->port = atomisp_csi2_get_port(adev);
> +		if (sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
> +			dev_err(&adev->dev, "Invalid port: %d\n", sensor->port);
> +			ret = -EINVAL;
> +			goto err_put_adev;
> +		}
> +
> +		sensor->lanes = gmin_cfg_get_int(adev, "CsiLanes", cfg->lanes);
> +		if (sensor->lanes > CSI2_MAX_LANES) {
> +			dev_err(&adev->dev, "Invalid number of lanes: %d\n", sensor->lanes);
> +			ret = -EINVAL;
> +			goto err_put_adev;
> +		}
> +
> +		snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
> +			 cfg->hid, sensor->port);
> +
> +		atomisp_csi2_create_fwnode_properties(sensor, bridge, cfg);
> +		atomisp_csi2_create_connection_swnodes(bridge, sensor);
> +
> +		ret = software_node_register_node_group(sensor->group);
> +		if (ret)
> +			goto err_put_adev;
> +
> +		fwnode = software_node_fwnode(&sensor->swnodes[SWNODE_SENSOR]);
> +		if (!fwnode) {
> +			ret = -ENODEV;
> +			goto err_free_swnodes;
> +		}
> +
> +		sensor->adev = acpi_dev_get(adev);
> +
> +		primary = acpi_fwnode_handle(adev);
> +		primary->secondary = fwnode;
> +
> +		dev_info(isp->dev, "Found supported sensor %s\n", acpi_dev_name(adev));
> +
> +		bridge->n_sensors++;
> +	}
> +
> +	return 0;
> +
> +err_free_swnodes:
> +	software_node_unregister_node_group(sensor->group);
> +err_put_adev:
> +	acpi_dev_put(adev);
> +	return ret;
> +}
> +
> +static int atomisp_csi2_connect_sensors(struct atomisp_csi2_bridge *bridge,
> +					struct atomisp_device *isp)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_sensors); i++) {
> +		const struct atomisp_csi2_sensor_config *cfg = &supported_sensors[i];
> +
> +		ret = atomisp_csi2_connect_sensor(cfg, bridge, isp);
> +		if (ret)
> +			goto err_unregister_sensors;
> +	}
> +
> +	return 0;
> +
> +err_unregister_sensors:
> +	atomisp_csi2_unregister_sensors(bridge);
> +	return ret;
> +}
> +
> +int atomisp_csi2_bridge_init(struct atomisp_device *isp)
> +{
> +	struct atomisp_csi2_bridge *bridge;
> +	struct device *dev = isp->dev;
> +	struct fwnode_handle *fwnode;
> +	int i, ret;
> +
> +	/*
> +	 * This function is intended to run only once and then leave
> +	 * the created nodes attached even after a rmmod, therefor:
> +	 * 1. The bridge memory is leaked deliberately on success
> +	 * 2. If a secondary fwnode is already set exit early.
> +	 */
> +	if (dev->fwnode && dev->fwnode->secondary)
> +		return 0;
> +
> +	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
> +	if (!bridge)
> +		return -ENOMEM;
> +
> +	strscpy(bridge->csi2_node_name, "atomisp-csi2", sizeof(bridge->csi2_node_name));
> +	bridge->csi2_node.name = bridge->csi2_node_name;
> +
> +	ret = software_node_register(&bridge->csi2_node);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register the CSI2 HID node\n");
> +		goto err_free_bridge;
> +	}
> +
> +	/*
> +	 * Map the lane arrangement, which is fixed for the ISP2 (meaning we
> +	 * only need one, rather than one per sensor). We include it as a
> +	 * member of the bridge struct rather than a global variable so
> +	 * that it survives if the module is unloaded along with the rest of
> +	 * the struct.
> +	 */
> +	for (i = 0; i < CSI2_MAX_LANES; i++)
> +		bridge->data_lanes[i] = i + 1;
> +
> +	ret = atomisp_csi2_connect_sensors(bridge, isp);
> +	if (ret || bridge->n_sensors == 0)
> +		goto err_unregister_csi2;
> +
> +	fwnode = software_node_fwnode(&bridge->csi2_node);
> +	if (!fwnode) {
> +		dev_err(dev, "Error getting fwnode from csi2 software_node\n");
> +		ret = -ENODEV;
> +		goto err_unregister_sensors;
> +	}
> +
> +	set_secondary_fwnode(dev, fwnode);
> +
> +	return 0;
> +
> +err_unregister_sensors:
> +	atomisp_csi2_unregister_sensors(bridge);
> +err_unregister_csi2:
> +	software_node_unregister(&bridge->csi2_node);
> +err_free_bridge:
> +	kfree(bridge);
> +
> +	return ret;
> +}
> +
> +/******* V4L2 sub-device asynchronous registration callbacks***********/
> +
> +struct sensor_async_subdev {
> +	struct v4l2_async_subdev asd;
> +	int port;
> +};
> +
> +#define to_sensor_asd(a)	container_of(a, struct sensor_async_subdev, asd)
> +#define notifier_to_atomisp(n)	container_of(n, struct atomisp_device, notifier)
> +
> +/* .bound() notifier callback when a match is found */
> +static int atomisp_notifier_bound(struct v4l2_async_notifier *notifier,
> +				  struct v4l2_subdev *sd,
> +				  struct v4l2_async_subdev *asd)
> +{
> +	struct atomisp_device *isp = notifier_to_atomisp(notifier);
> +	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
> +
> +	if (s_asd->port >= ATOMISP_CAMERA_NR_PORTS) {
> +		dev_err(isp->dev, "port %d not supported\n", s_asd->port);
> +		return -EINVAL;
> +	}
> +
> +	if (isp->sensor_subdevs[s_asd->port]) {
> +		dev_err(isp->dev, "port %d already has a sensor attached\n", s_asd->port);
> +		return -EBUSY;
> +	}
> +
> +	isp->sensor_subdevs[s_asd->port] = sd;
> +	return 0;
> +}
> +
> +/* The .unbind callback */
> +static void atomisp_notifier_unbind(struct v4l2_async_notifier *notifier,
> +				    struct v4l2_subdev *sd,
> +				    struct v4l2_async_subdev *asd)
> +{
> +	struct atomisp_device *isp = notifier_to_atomisp(notifier);
> +	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
> +
> +	isp->sensor_subdevs[s_asd->port] = NULL;
> +}
> +
> +/* .complete() is called after all subdevices have been located */
> +static int atomisp_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct atomisp_device *isp = notifier_to_atomisp(notifier);
> +
> +	return atomisp_register_device_nodes(isp);
> +}
> +
> +static const struct v4l2_async_notifier_operations atomisp_async_ops = {
> +	.bound = atomisp_notifier_bound,
> +	.unbind = atomisp_notifier_unbind,
> +	.complete = atomisp_notifier_complete,
> +};
> +
> +int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp)
> +{
> +	int i, mipi_port, ret;
> +
> +	v4l2_async_nf_init(&isp->notifier);
> +	isp->notifier.ops = &atomisp_async_ops;
> +
> +	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
> +		struct v4l2_fwnode_endpoint vep = {
> +			.bus_type = V4L2_MBUS_CSI2_DPHY
> +		};
> +		struct sensor_async_subdev *s_asd;
> +		struct fwnode_handle *ep;
> +
> +		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(isp->dev), i, 0,
> +						     FWNODE_GRAPH_ENDPOINT_NEXT);
> +		if (!ep)
> +			continue;
> +
> +		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +		if (ret)
> +			goto err_parse;
> +
> +		if (vep.base.port >= ATOMISP_CAMERA_NR_PORTS) {
> +			dev_err(isp->dev, "port %d not supported\n", vep.base.port);
> +			ret = -EINVAL;
> +			goto err_parse;
> +		}
> +
> +		mipi_port = atomisp_port_to_mipi_port(isp, vep.base.port);
> +		isp->sensor_lanes[mipi_port] = vep.bus.mipi_csi2.num_data_lanes;
> +
> +		s_asd = v4l2_async_nf_add_fwnode_remote(&isp->notifier, ep,
> +							struct sensor_async_subdev);
> +		if (IS_ERR(s_asd)) {
> +			ret = PTR_ERR(s_asd);
> +			goto err_parse;
> +		}
> +
> +		s_asd->port = vep.base.port;
> +
> +		fwnode_handle_put(ep);
> +		continue;
> +
> +err_parse:
> +		fwnode_handle_put(ep);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> index 514c360d4d03..e59c0f1e7f53 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> @@ -27,6 +27,7 @@
>  #include <linux/idr.h>
>  
>  #include <media/media-device.h>
> +#include <media/v4l2-async.h>
>  #include <media/v4l2-subdev.h>
>  
>  /* ISP2400*/
> @@ -173,6 +174,7 @@ struct atomisp_device {
>  	struct v4l2_device v4l2_dev;
>  	struct media_device media_dev;
>  	struct atomisp_sub_device asd;
> +	struct v4l2_async_notifier notifier;
>  	struct atomisp_platform_data *pdata;
>  	void *mmu_l1_base;
>  	void __iomem *base;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index ef04effc66bf..802c16697ca6 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -27,6 +27,7 @@
>  #include <linux/dmi.h>
>  #include <linux/interrupt.h>
>  #include <linux/bits.h>
> +#include <media/v4l2-fwnode.h>
>  
>  #include <asm/iosf_mbi.h>
>  
> @@ -782,7 +783,11 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
>  {
>  	const struct atomisp_platform_data *pdata;
>  	struct intel_v4l2_subdev_table *subdevs;
> -	int ret, mipi_port, count;
> +	int ret, mipi_port;
> +
> +	ret = atomisp_csi2_bridge_parse_firmware(isp);
> +	if (ret)
> +		return ret;
>  
>  	pdata = atomisp_get_platform_data();
>  	if (!pdata) {
> @@ -790,23 +795,12 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
>  		return 0;
>  	}
>  
> -	/* FIXME: should return -EPROBE_DEFER if not all subdevs were probed */
> -	for (count = 0; count < SUBDEV_WAIT_TIMEOUT_MAX_COUNT; count++) {
> -		int camera_count = 0;
> -
> -		for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
> -			if (subdevs->type == RAW_CAMERA)
> -				camera_count++;
> -		}
> -		if (camera_count)
> -			break;
> -		msleep(SUBDEV_WAIT_TIMEOUT);
> -	}
> -	/* Wait more time to give more time for subdev init code to finish */
> -	msleep(5 * SUBDEV_WAIT_TIMEOUT);
> -
> -	/* FIXME: should, instead, use I2C probe */
> -
> +	/*
> +	 * TODO: this is left here for now to allow testing atomisp-sensor
> +	 * drivers which are still using the atomisp_gmin_platform infra before
> +	 * converting them to standard v4l2 sensor drivers using runtime-pm +
> +	 * ACPI for pm and v4l2_async_register_subdev_sensor() registration.
> +	 */
>  	for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
>  		ret = v4l2_device_register_subdev(&isp->v4l2_dev, subdevs->subdev);
>  		if (ret)
> @@ -937,7 +931,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
>  	return ret;
>  }
>  
> -static int atomisp_register_device_nodes(struct atomisp_device *isp)
> +int atomisp_register_device_nodes(struct atomisp_device *isp)
>  {
>  	struct atomisp_input_subdev *input;
>  	int i, err;
> @@ -1429,9 +1423,11 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>  	isp->firmware = NULL;
>  	isp->css_env.isp_css_fw.data = NULL;
>  
> -	err = atomisp_register_device_nodes(isp);
> -	if (err)
> +	err = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
> +	if (err) {
> +		dev_err(isp->dev, "failed to register async notifier : %d\n", err);
>  		goto css_init_fail;
> +	}
>  
>  	atomisp_drvfs_init(isp);
>  
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
> index c8ee3ad83320..fad9573374b3 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
> @@ -30,5 +30,6 @@ int atomisp_video_init(struct atomisp_video_pipe *video);
>  void atomisp_video_unregister(struct atomisp_video_pipe *video);
>  const struct firmware *atomisp_load_firmware(struct atomisp_device *isp);
>  int atomisp_csi_lane_config(struct atomisp_device *isp);
> +int atomisp_register_device_nodes(struct atomisp_device *isp);
>  
>  #endif /* __ATOMISP_V4L2_H__ */

