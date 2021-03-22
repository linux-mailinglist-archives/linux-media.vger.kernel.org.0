Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92163435EE
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 01:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhCVATv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 20:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbhCVATT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 20:19:19 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E27C061574
        for <linux-media@vger.kernel.org>; Sun, 21 Mar 2021 17:19:19 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id e14so239672ejz.11
        for <linux-media@vger.kernel.org>; Sun, 21 Mar 2021 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4chGpEI0M4bQXVWjUDscVroYnp5BVpIjU71kMYHTnso=;
        b=tm2U+5JvaMIX3Ed5e9SEyr4MZtg63bMZjzNa1GJC6MqPhjpbT7w0pb29eRzAhUQiF7
         J3rBNsPpPd7k9QeLfJLGFtlU3MfuS4QQrHLo9kFesEBux0UHZkZ0KaRI10YHu9xSPOY9
         0CBbRinsv867Z3wv7ettb2TNMzsP64OQ4eDXxfTolGMuVoG1NMokQNh6Ohuo+LYBjUHR
         1XtesMGzmWQx4++gxxIw2OWweKt9ik0Lia/sBYyd4PYU9eK6r34xB/JSWlbOmDcrix9C
         SBGbRztQxXAIreN2NkQSm9BejrpMeqZo77Gz74C7fmfRTrQxe5pLx19aMHBKWDwHb7iL
         MJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4chGpEI0M4bQXVWjUDscVroYnp5BVpIjU71kMYHTnso=;
        b=Zeke9bBgIhrDd762kkakXliVRZgE3ncKRzltWbCb2uFHsOXdLnZOY3oN+UuyonlnQO
         anD/A1mLCRp+zD/VMmIcJ+Q9Jnci25eII4IhNC5ScQ31o73JWNDuoPbQKGyFREKG3Ty/
         vQ03nwMuWDd9EEBUUtEOKFCu4EMnN6Zyjs/OhFOoEXrNa/dh8MECpAxPsOWIFYwo86m6
         azcfca5wuApXBvTm4r9A2EOEE5SaxcEf5TYeKmRrsdfil9Dc9cZE+ixwojPFB8vB3TUL
         zVuvL8uOi8BHnv8PTw63Qy9J3xeA9CJ5rWNBvTMZgsqpQNIOknWW3qWvl5S7GG0utvc8
         tgUg==
X-Gm-Message-State: AOAM531pS4O8SJN515QRGhveuMSSSVszJOQHZWjC4c+EC0xEKwZQh++/
        6CxnhKQAmBEhfRaXN27uWBI=
X-Google-Smtp-Source: ABdhPJw37f5cK/8/Np2MW16YftTAIzkwdP81j8B21ay1mkgQw9oWq3ZUnWOD1uFa1/Y73q11mUIE2Q==
X-Received: by 2002:a17:906:edca:: with SMTP id sb10mr16120074ejb.398.1616372357894;
        Sun, 21 Mar 2021 17:19:17 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.22])
        by smtp.gmail.com with ESMTPSA id de17sm8202449ejc.16.2021.03.21.17.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 17:19:17 -0700 (PDT)
Subject: Re: [PATCH] ipu3-cio2: Parse sensor orientation and rotation
To:     =?UTF-8?Q?Fabian_W=c3=bcthrich?= <me@fabwu.ch>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210321191155.55723-1-me@fabwu.ch>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <682898ab-c63d-160e-8fdb-7003a856cc07@gmail.com>
Date:   Mon, 22 Mar 2021 00:19:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210321191155.55723-1-me@fabwu.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabian, thanks for doing this

On 21/03/2021 19:11, Fabian Wüthrich wrote:
> The sensor orientation is read from the _PLC ACPI buffer and converted
> to a v4l2 format.
>
> See https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> page 351 for a definition of the Panel property.
>
> The sensor rotation is read from the SSDB ACPI buffer and converted into
> degrees.
>
> Signed-off-by: Fabian Wüthrich <me@fabwu.ch>

Couple of comments below, but after addressing those:


Reviewed-by: Daniel Scally <djrscally@gmail.com>

> ---
>  drivers/media/pci/intel/ipu3/cio2-bridge.c | 60 ++++++++++++++++++++--
>  drivers/media/pci/intel/ipu3/cio2-bridge.h | 16 ++++++
>  2 files changed, 72 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> index c2199042d3db..503809907b92 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
> @@ -29,6 +29,7 @@ static const struct cio2_sensor_config cio2_supported_sensors[] = {
>  static const struct cio2_property_names prop_names = {
>  	.clock_frequency = "clock-frequency",
>  	.rotation = "rotation",
> +	.orientation = "orientation",
>  	.bus_type = "bus-type",
>  	.data_lanes = "data-lanes",
>  	.remote_endpoint = "remote-endpoint",
> @@ -72,11 +73,51 @@ static int cio2_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
>  	return ret;
>  }
>  
> +static u32 cio2_bridge_parse_rotation(struct cio2_sensor *sensor)
> +{
> +	switch (sensor->ssdb.degree) {
> +	case CIO2_SENSOR_ROTATION_NORMAL:
> +		return 0;
> +	case CIO2_SENSOR_ROTATION_INVERTED:
> +		return 180;
> +	default:
> +		dev_warn(&sensor->adev->dev,
> +			 "Unknown rotation %d. Assume 0 degree rotation\n",
> +			 sensor->ssdb.degree);
> +		return 0;
> +	}
> +}
>
> +static enum v4l2_fwnode_orientation cio2_bridge_parse_orientation(struct cio2_sensor *sensor)
> +{
> +	switch (sensor->pld->panel) {
> +	case CIO2_PLD_PANEL_FRONT:
> +		return V4L2_FWNODE_ORIENTATION_FRONT;
> +	case CIO2_PLD_PANEL_BACK:
> +		return V4L2_FWNODE_ORIENTATION_BACK;
> +	case CIO2_PLD_PANEL_TOP:
> +	case CIO2_PLD_PANEL_LEFT:
> +	case CIO2_PLD_PANEL_RIGHT:
> +	case CIO2_PLD_PANEL_UNKNOWN:
> +		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +	default:
> +		dev_warn(&sensor->adev->dev, "Unknown _PLD panel value %d\n",
> +			 sensor->pld->panel);
> +		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
> +	}
> +}
> +
>  static void cio2_bridge_create_fwnode_properties(
>  	struct cio2_sensor *sensor,
>  	struct cio2_bridge *bridge,
>  	const struct cio2_sensor_config *cfg)
>  {
> +	u32 rotation;
> +	enum v4l2_fwnode_orientation orientation;
> +
> +	rotation = cio2_bridge_parse_rotation(sensor);
> +	orientation = cio2_bridge_parse_orientation(sensor);
> +
>  	sensor->prop_names = prop_names;
>  
>  	sensor->local_ref[0].node = &sensor->swnodes[SWNODE_CIO2_ENDPOINT];
> @@ -85,9 +126,12 @@ static void cio2_bridge_create_fwnode_properties(
>  	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(
>  					sensor->prop_names.clock_frequency,
>  					sensor->ssdb.mclkspeed);
> -	sensor->dev_properties[1] = PROPERTY_ENTRY_U8(
> +	sensor->dev_properties[1] = PROPERTY_ENTRY_U32(
>  					sensor->prop_names.rotation,
> -					sensor->ssdb.degree);
> +					rotation);
> +	sensor->dev_properties[2] = PROPERTY_ENTRY_U32(
> +					sensor->prop_names.orientation,
> +					orientation);
>  
>  	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(
>  					sensor->prop_names.bus_type,
> @@ -159,6 +203,7 @@ static void cio2_bridge_unregister_sensors(struct cio2_bridge *bridge)
>  	for (i = 0; i < bridge->n_sensors; i++) {
>  		sensor = &bridge->sensors[i];
>  		software_node_unregister_nodes(sensor->swnodes);
> +		ACPI_FREE(sensor->pld);
>  		acpi_dev_put(sensor->adev);
>  	}
>  }
> @@ -170,6 +215,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  	struct fwnode_handle *fwnode;
>  	struct cio2_sensor *sensor;
>  	struct acpi_device *adev;
> +	acpi_status status;
>  	int ret;
>  
>  	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
> @@ -193,11 +239,15 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  		if (ret)
>  			goto err_put_adev;
>  
> +		status = acpi_get_physical_device_location(adev->handle, &sensor->pld);
> +		if (ACPI_FAILURE(status))
> +			goto err_put_adev;
> +
>  		if (sensor->ssdb.lanes > CIO2_MAX_LANES) {
>  			dev_err(&adev->dev,
>  				"Number of lanes in SSDB is invalid\n");
>  			ret = -EINVAL;
> -			goto err_put_adev;
> +			goto err_free_pld;
>  		}
>  
>  		cio2_bridge_create_fwnode_properties(sensor, bridge, cfg);
> @@ -205,7 +255,7 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  
>  		ret = software_node_register_nodes(sensor->swnodes);
>  		if (ret)
> -			goto err_put_adev;
> +			goto err_free_pld;
>  
>  		fwnode = software_node_fwnode(&sensor->swnodes[
>  						      SWNODE_SENSOR_HID]);
> @@ -226,6 +276,8 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
>  
>  err_free_swnodes:
>  	software_node_unregister_nodes(sensor->swnodes);
> +err_free_pld:
> +	ACPI_FREE(sensor->pld);
>  err_put_adev:
>  	acpi_dev_put(sensor->adev);
>  err_out:
> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.h b/drivers/media/pci/intel/ipu3/cio2-bridge.h
> index dd0ffcafa489..e1e388cc9f45 100644
> --- a/drivers/media/pci/intel/ipu3/cio2-bridge.h
> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.h
> @@ -12,6 +12,19 @@
>  #define CIO2_MAX_LANES				4
>  #define MAX_NUM_LINK_FREQS			3
>  
> +/* Values are estimated guesses as we don't have a spec */


Educated guesses?

> +#define CIO2_SENSOR_ROTATION_NORMAL		0
> +#define CIO2_SENSOR_ROTATION_INVERTED		1
> +


I think these are good here but...

> +/* Panel position defined in _PLD section of ACPI Specification 6.3 */
> +#define CIO2_PLD_PANEL_TOP			0
> +#define CIO2_PLD_PANEL_BOTTOM			1
> +#define CIO2_PLD_PANEL_LEFT			2
> +#define CIO2_PLD_PANEL_RIGHT			3
> +#define CIO2_PLD_PANEL_FRONT			4
> +#define CIO2_PLD_PANEL_BACK			5
> +#define CIO2_PLD_PANEL_UNKNOWN			6
> +


...I wonder if these ought to go somewhere in the include/acpi headers.
You might be the only person to refer to pld->panel in driver code (at
least a quick grep doesn't show me another one, and only another couple
of uses of pld at all) so it's probably not a big deal, but it just
feels slightly the wrong place. What do you think?

>  #define CIO2_SENSOR_CONFIG(_HID, _NR, ...)	\
>  	(const struct cio2_sensor_config) {	\
>  		.hid = _HID,			\
> @@ -80,6 +93,7 @@ struct cio2_sensor_ssdb {
>  struct cio2_property_names {
>  	char clock_frequency[16];
>  	char rotation[9];
> +	char orientation[12];
>  	char bus_type[9];
>  	char data_lanes[11];
>  	char remote_endpoint[16];
> @@ -106,6 +120,8 @@ struct cio2_sensor {
>  	struct cio2_node_names node_names;
>  
>  	struct cio2_sensor_ssdb ssdb;
> +	struct acpi_pld_info *pld;
> +
>  	struct cio2_property_names prop_names;
>  	struct property_entry ep_properties[5];
>  	struct property_entry dev_properties[3];


You should extend dev_properties to 4 members; there needs to be an
empty entry as a terminator or it'll be a problem in the event someone
tries to access a property that isn't there.

